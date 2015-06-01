--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-01 14:27:23 CEST

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
-- TOC entry 180 (class 1259 OID 5690417)
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
-- TOC entry 227 (class 1259 OID 5690934)
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
-- TOC entry 226 (class 1259 OID 5690917)
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
-- TOC entry 219 (class 1259 OID 5690826)
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
-- TOC entry 194 (class 1259 OID 5690596)
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
-- TOC entry 197 (class 1259 OID 5690630)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5690539)
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
-- TOC entry 228 (class 1259 OID 5690948)
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
-- TOC entry 213 (class 1259 OID 5690756)
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
-- TOC entry 192 (class 1259 OID 5690576)
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
-- TOC entry 196 (class 1259 OID 5690624)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5690556)
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
-- TOC entry 202 (class 1259 OID 5690673)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5690698)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5690513)
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
-- TOC entry 181 (class 1259 OID 5690426)
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
-- TOC entry 182 (class 1259 OID 5690437)
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
-- TOC entry 177 (class 1259 OID 5690391)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5690410)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5690705)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5690736)
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
-- TOC entry 223 (class 1259 OID 5690870)
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
-- TOC entry 184 (class 1259 OID 5690470)
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
-- TOC entry 186 (class 1259 OID 5690505)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5690679)
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
-- TOC entry 185 (class 1259 OID 5690490)
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
-- TOC entry 191 (class 1259 OID 5690568)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5690691)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5690811)
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
-- TOC entry 222 (class 1259 OID 5690862)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 5690974)
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
-- TOC entry 232 (class 1259 OID 5691002)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 5691032)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 5690983)
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
-- TOC entry 236 (class 1259 OID 5691028)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 5690720)
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
-- TOC entry 201 (class 1259 OID 5690664)
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
-- TOC entry 200 (class 1259 OID 5690654)
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
-- TOC entry 221 (class 1259 OID 5690851)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5690788)
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
-- TOC entry 174 (class 1259 OID 5690362)
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
-- TOC entry 173 (class 1259 OID 5690360)
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
-- TOC entry 210 (class 1259 OID 5690730)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5690400)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5690384)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5690744)
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
-- TOC entry 204 (class 1259 OID 5690685)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5690635)
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
-- TOC entry 235 (class 1259 OID 5691020)
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
-- TOC entry 234 (class 1259 OID 5691013)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 5691008)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5690798)
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
-- TOC entry 183 (class 1259 OID 5690462)
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
-- TOC entry 199 (class 1259 OID 5690641)
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
-- TOC entry 220 (class 1259 OID 5690840)
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
-- TOC entry 231 (class 1259 OID 5690991)
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
-- TOC entry 237 (class 1259 OID 5691030)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 5690525)
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
-- TOC entry 175 (class 1259 OID 5690371)
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
-- TOC entry 225 (class 1259 OID 5690896)
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
-- TOC entry 193 (class 1259 OID 5690587)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5690712)
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
-- TOC entry 215 (class 1259 OID 5690781)
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
-- TOC entry 195 (class 1259 OID 5690619)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5690886)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5690771)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 5690365)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 5690417)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 5690934)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-4faa-f742-7636f360eefd	000d0000-556c-4faa-bafe-d0cc8b6ebff5	\N	00090000-556c-4faa-2924-c95984feebe5	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-4faa-d8c0-8cee430b1aac	000d0000-556c-4faa-db75-c1c03997802b	\N	00090000-556c-4faa-c164-cde4585442f0	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-4faa-9a2d-9e23cb58170d	000d0000-556c-4faa-0f02-4fac015cf538	\N	00090000-556c-4faa-5f0c-237cc27738ee	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-4faa-43bb-87298b7aa033	000d0000-556c-4faa-88ac-531d7566f2c0	\N	00090000-556c-4faa-4ac9-5e4f3be6c956	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-4faa-e363-2dc38e3d3740	000d0000-556c-4faa-cd63-fc545e0de612	\N	00090000-556c-4faa-64e4-1bef4566a53a	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 5690917)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 5690826)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-4faa-3921-62e2d45e6ce1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-4faa-4f6f-075bef39db80	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-4faa-a4ca-07d5f28c8822	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 5690596)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-4faa-8526-b0a1ac1a9e65	\N	\N	00200000-556c-4faa-451f-0987b6fdb05d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-4faa-2eeb-95a254d94b46	\N	\N	00200000-556c-4faa-de10-9d6157df5757	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556c-4faa-2ce9-3b68b64c0773	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 5690630)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 5690539)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-4fa9-df3d-c39b5511328a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-4fa9-3252-1b79b73b50e9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-4fa9-fc34-b13e64dc064d	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-4fa9-914b-b3aaccf01732	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-4fa9-9ba6-62eac3b25265	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-4fa9-a55a-d8a6beddffe6	AD	AND	020	Andorra 	Andora	\N
00040000-556c-4fa9-4020-ec618734532e	AO	AGO	024	Angola 	Angola	\N
00040000-556c-4fa9-0580-6d0b034c56a3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-4fa9-8021-3b6dedcb0305	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-4fa9-8d53-d219064b1d76	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-4fa9-a6e9-adaa1392fe48	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-4fa9-1ae7-52b982e16c06	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-4fa9-e86d-3185c753aebb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-4fa9-0365-c7986da03a9e	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-4fa9-0474-246bb3103dbd	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-4fa9-4100-1c6a9ef3dad8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-4fa9-ecb6-722d1a732b54	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-4fa9-81ea-735b9551a15d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-4fa9-8e2c-26718e539caf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-4fa9-790c-1dbfc3d4bc7d	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-4fa9-cde3-d20f79f49f70	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-4fa9-92f4-b160b5657006	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-4fa9-c3cc-3769831c932f	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-4fa9-cd5a-e4ea8c89f631	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-4fa9-8872-66685b3d048a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-4fa9-4c28-848406b2482c	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-4fa9-b553-9e3cbd202fbb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-4fa9-b904-88751c6e5030	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-4fa9-e610-9140eccadaaa	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-4fa9-fc27-b9ed71f619a5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-4fa9-f4d1-f457186c885c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-4fa9-dad1-b5ae152636dc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-4fa9-0888-26a2a4dc03f2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-4fa9-6008-c0e84033e073	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-4fa9-d72b-3537c726df11	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-4fa9-5390-0e0ac25b6cf0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-4fa9-bdef-ef6f8bc1e908	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-4fa9-3c8a-6c22ba1462d9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-4fa9-781b-c3807315884a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-4fa9-b964-f2f14b0b46ad	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-4fa9-35f7-aa6cf720aa8c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-4fa9-4b5f-01ae8e43585c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-4fa9-0584-f9e9778af37f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-4fa9-47ab-18d03108aec1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-4fa9-d5d1-aa95eec54a5b	CL	CHL	152	Chile 	Čile	\N
00040000-556c-4fa9-0793-76772469fe75	CN	CHN	156	China 	Kitajska	\N
00040000-556c-4fa9-a591-e516a4597ead	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-4fa9-86e2-e9c4d93228b3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-4fa9-82ad-8130f6fa0843	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-4fa9-8f76-2893c22bba70	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-4fa9-21ee-3f4a6790c542	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-4fa9-2b3c-78f83c47e0f8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-4fa9-9edd-1270f8b0241b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-4fa9-3a52-840a3a0f8ccf	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-4fa9-5b7c-b6e078b53aca	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-4fa9-3538-a85a689b9995	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-4fa9-7443-88477d5cc19d	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-4fa9-3d4d-69cf80e33e77	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-4fa9-30de-a42d0dd2b05f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-4fa9-e81c-7117626f28f9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-4fa9-2003-a58ba546e32f	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-4fa9-6722-b1fd837125d7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-4fa9-79de-b1969ccf3af6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-4fa9-cabb-3c34e3e6f58d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-4fa9-df1b-b1c398f30076	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-4fa9-6efe-be3da0fe64d3	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-4fa9-c84a-1da85598f81b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-4fa9-4b16-db1c4c9b1e51	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-4fa9-9b93-66b19ae2feee	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-4fa9-31eb-dd937ce52c24	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-4fa9-5ff1-761aff4df456	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-4fa9-5bf7-47ff9247912f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-4fa9-7c54-06c25fe94cdb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-4fa9-1693-c543eae9920c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-4fa9-aacb-68d874cd99b3	FI	FIN	246	Finland 	Finska	\N
00040000-556c-4fa9-5056-41128acf10e6	FR	FRA	250	France 	Francija	\N
00040000-556c-4fa9-17f1-688ee4503da3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-4fa9-c824-0e4841f24771	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-4fa9-dac0-421ebbd7ad5a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-4fa9-11e9-9e0308867d33	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-4fa9-c3d5-5da25fb00874	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-4fa9-6559-93410ecd14f2	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-4fa9-ba3c-c11c20fa7ad7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-4fa9-38ac-e0ccd3372c69	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-4fa9-6cab-deed7e582d95	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-4fa9-6a33-93daed221c33	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-4fa9-c05b-2c3f36b1b761	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-4fa9-78f0-dafd4b590908	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-4fa9-caeb-b3b111cddc4f	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-4fa9-65fb-f9bfea586506	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-4fa9-3f45-5104dfb0b933	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-4fa9-bc2d-1d70557acfb9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-4fa9-6863-d0565c14bec6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-4fa9-6843-d272f6a6623a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-4fa9-ad59-ed2c89025bd4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-4fa9-e07b-99e73a08feed	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-4fa9-ff10-98922d4cfdeb	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-4fa9-3203-4b94964e73a3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-4fa9-5f5e-100864be8fe3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-4fa9-203b-6f883772791a	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-4fa9-2292-522ce9cf9308	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-4fa9-8ab8-d7e2de5ca8bd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-4fa9-3446-58022423f003	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-4fa9-0790-44d2ab318fc0	IN	IND	356	India 	Indija	\N
00040000-556c-4fa9-3790-1738bb2c6e04	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-4fa9-6bfe-43d0d0c51b08	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-4fa9-3037-4bde0e859c95	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-4fa9-3aad-0eca6e1146e0	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-4fa9-4ed3-529d0fb8406c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-4fa9-799e-9e2595312c83	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-4fa9-5caa-7acb34652364	IT	ITA	380	Italy 	Italija	\N
00040000-556c-4fa9-72ea-910001e22df1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-4fa9-8e2a-ea05396dc462	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-4fa9-e000-7f0859f7a0d1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-4fa9-19e7-dc796769a5b4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-4fa9-29b9-bba874637c91	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-4fa9-b603-c6676e98a641	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-4fa9-83cd-8adec506e1a3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-4fa9-b510-16fb4859b349	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-4fa9-0189-5a81c895818d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-4fa9-c230-c63935c446e6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-4fa9-539e-76b915505b99	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-4fa9-5a85-3c5b42357bd9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-4fa9-03b2-27bfc83b327c	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-4fa9-f279-eb0d0f9474c4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-4fa9-bd21-dadb0f14f90f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-4fa9-ec6f-977cf1b03b4d	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-4fa9-2532-0b83bbc083b9	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-4fa9-e67f-ef601616e18b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-4fa9-3e7a-ddd17502a453	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-4fa9-9005-5553a41b577c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-4fa9-9b23-f7823b263d93	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-4fa9-a27d-c1e34775152d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-4fa9-81f1-612e740a1b28	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-4fa9-70b8-7584560ff89d	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-4fa9-33c7-54c45d84341e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-4fa9-b053-66240d616e9e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-4fa9-c1b5-ea31b6d77d16	ML	MLI	466	Mali 	Mali	\N
00040000-556c-4fa9-142b-19867f6324b1	MT	MLT	470	Malta 	Malta	\N
00040000-556c-4fa9-f7b4-01407f191328	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-4fa9-7b92-da813e61e26e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-4fa9-c5da-5aa1de31a87f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-4fa9-3048-ae455ac400e1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-4fa9-b8a8-be5d36918dc1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-4fa9-d44a-771a80d4a9ce	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-4fa9-168e-67809253bd75	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-4fa9-bbcf-daec277963f3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-4fa9-d4ab-7316c3620e05	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-4fa9-d4e0-92223d5f78dc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-4fa9-55de-31574c5f90b2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-4fa9-82da-d047f2b70612	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-4fa9-8de0-4a282f76e23c	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-4fa9-f1fc-0d2be9f7a364	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-4fa9-d105-5a9e7cf20015	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-4fa9-b335-158c8111e252	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-4fa9-e827-5c42d14df29e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-4fa9-c35d-d813b54699d7	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-4fa9-7460-e88de719e1de	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-4fa9-c936-e31b79528b2d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-4fa9-25bd-d7838ba68664	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-4fa9-a67d-14d6c85778c6	NE	NER	562	Niger 	Niger 	\N
00040000-556c-4fa9-6bb2-b8e95b5ffa9f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-4fa9-46fd-9d30fe36b01d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-4fa9-a2e0-2777c4a37b12	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-4fa9-838d-841d7b8f193f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-4fa9-72fa-9c75691bff59	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-4fa9-a674-70aa32b3fdd8	OM	OMN	512	Oman 	Oman	\N
00040000-556c-4fa9-9e4a-af487cee7714	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-4fa9-3977-7194d85b4c95	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-4fa9-c1ad-23b5a39eca40	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-4fa9-7188-d9fd4c5fe0af	PA	PAN	591	Panama 	Panama	\N
00040000-556c-4fa9-2316-aaa9c08b9827	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-4fa9-f7f2-8bfc6621057e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-4fa9-2432-39c00ab4934f	PE	PER	604	Peru 	Peru	\N
00040000-556c-4fa9-7644-ebc7d9499f9f	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-4fa9-d216-8dc7c007a32f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-4fa9-95a2-b0ffdbd216d2	PL	POL	616	Poland 	Poljska	\N
00040000-556c-4fa9-08eb-76c3b59108af	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-4fa9-4aa6-2042e29f10df	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-4fa9-bf50-24b6f3ec0aa2	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-4fa9-4d17-805d618111c0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-4fa9-45bc-90867e615a60	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-4fa9-28c7-2c72468e08b7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-4fa9-1f83-30c19a35801b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-4fa9-c88a-bcdf5f5f9179	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-4fa9-ccdf-16cbafefe938	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-4fa9-a38e-409cd33fd8a1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-4fa9-3228-822658165847	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-4fa9-d80a-989032d4185c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-4fa9-2151-4b5aede5b06c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-4fa9-ef31-0bf72657a825	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-4fa9-71be-9cad171520e1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-4fa9-679d-611b8a2730af	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-4fa9-ef3a-538e9c0251a1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-4fa9-ae75-4a033e6e9393	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-4fa9-3007-4252392a6962	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-4fa9-9cf1-9a66bae12fa1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-4fa9-d40d-b26f976d3aa8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-4fa9-94ed-c26df5d8fcc7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-4fa9-ff04-1e22fa5d0847	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-4fa9-f2df-33bd1b70ee60	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-4fa9-fa48-fc7d1ed23677	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-4fa9-3c6e-637cf3dcb34d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-4fa9-de9d-00a4ce2c6658	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-4fa9-334d-85c85ed9d84d	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-4fa9-82cf-d4f5c817db10	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-4fa9-d9bb-92f044450429	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-4fa9-095b-127a114b0d50	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-4fa9-4df3-ba604d27a1d7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-4fa9-6d31-977e8101389d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-4fa9-b1e1-11c252237763	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-4fa9-90f9-5b727821f662	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-4fa9-cc81-3e3febfcf5de	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-4fa9-98c2-5f284ec6a305	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-4fa9-ddbe-e32a794ac960	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-4fa9-e48e-de5b11329093	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-4fa9-c0ea-ca202ee67338	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-4fa9-a9c3-4a0be976d96f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-4fa9-228b-52449b94bd10	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-4fa9-5022-417fd2acc9d3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-4fa9-5e2e-9f14a6e2af6f	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-4fa9-2d77-518b9813645c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-4fa9-cd3b-28e8ea5006bc	TG	TGO	768	Togo 	Togo	\N
00040000-556c-4fa9-05b4-169bd1be230b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-4fa9-b6a8-e549ea61d25b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-4fa9-0db4-d59bf918e1b4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-4fa9-cf1d-84432509d630	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-4fa9-6924-8a0cc4ec897d	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-4fa9-1a59-ca024e611a3d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-4fa9-6cc8-d01061c086e0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-4fa9-c767-6b33becd4fd0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-4fa9-8bb3-cbbc4638e697	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-4fa9-f173-f7286e43799f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-4fa9-8048-11c7ae1e48c5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-4fa9-0fd0-230c372fe7bf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-4fa9-531d-81b6bdf945fa	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-4fa9-1386-2c05bde35883	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-4fa9-811b-c265d3f7554c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-4fa9-1a5d-95612b01cb4d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-4fa9-e20c-daca04b3487f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-4fa9-7805-c881ef935adc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-4fa9-a1ce-864c6db3ac87	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-4fa9-d35e-2a3e52eb8848	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-4fa9-994b-dfea97d02984	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-4fa9-2ccb-5c9793bda6d4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-4fa9-dabd-08e14229812c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-4fa9-fc0c-046c588c47f4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-4fa9-cbae-bb4e81d7c228	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-4fa9-859a-f9942daf4db9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 5690948)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 5690756)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-4faa-b717-4b861ebd4b52	000e0000-556c-4faa-f466-abecab560cbe	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-4fa9-7cf9-a29c327ca8fa
000d0000-556c-4faa-bafe-d0cc8b6ebff5	000e0000-556c-4faa-f466-abecab560cbe	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-4fa9-7cf9-a29c327ca8fa
000d0000-556c-4faa-db75-c1c03997802b	000e0000-556c-4faa-f466-abecab560cbe	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-4fa9-4415-f85317a94dfc
000d0000-556c-4faa-0f02-4fac015cf538	000e0000-556c-4faa-f466-abecab560cbe	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-4fa9-410c-40a48b92ade3
000d0000-556c-4faa-88ac-531d7566f2c0	000e0000-556c-4faa-f466-abecab560cbe	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-4fa9-410c-40a48b92ade3
000d0000-556c-4faa-cd63-fc545e0de612	000e0000-556c-4faa-f466-abecab560cbe	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-4fa9-410c-40a48b92ade3
\.


--
-- TOC entry 2788 (class 0 OID 5690576)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 5690624)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 5690556)
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
-- TOC entry 2798 (class 0 OID 5690673)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 5690698)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 5690513)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-4fa9-fc19-fb3d91a769e1	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-4fa9-bddf-e39162713d3e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-4fa9-301a-7f1a730c5059	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-4fa9-a638-5bba17d07125	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-4fa9-585f-35391787ed91	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-4fa9-6a92-bf81afe7abb5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-4fa9-e14d-64878c5f48f5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-4fa9-e73b-c223829e47a1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-4fa9-0ed7-871350af9ee0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-4fa9-9e7d-d1ee9717b3af	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-4fa9-cb49-69cdbbe96721	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-4fa9-461b-027ff3a15e64	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-4fa9-ae2d-7a92f0a95071	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-4fa9-8a5b-4fbe38e5e575	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-4fa9-f3d9-3fd6eec7007d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556c-4fa9-1861-9b3708af9b97	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 5690426)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-4fa9-bef2-96cc52ef31f6	00000000-556c-4fa9-585f-35391787ed91	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-4fa9-23f8-86a3936cc75f	00000000-556c-4fa9-585f-35391787ed91	00010000-556c-4fa9-8dbb-cb5ca9e49c81	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-4fa9-1227-9565ef9d6520	00000000-556c-4fa9-6a92-bf81afe7abb5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 5690437)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-4faa-aa17-e13f8484bcf9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-4faa-4ac9-5e4f3be6c956	00010000-556c-4faa-a348-52e3eb0f6435	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-4faa-5f0c-237cc27738ee	00010000-556c-4faa-6479-69924d5709bd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-4faa-c248-b3fa4dec5ddf	\N	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-4faa-b00f-f0e8a196fc84	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-4faa-fcf6-ced1f5af8035	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-4faa-5cc0-0bda07516319	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-4faa-3eca-e8d13210217f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-4faa-2924-c95984feebe5	00010000-556c-4faa-e22b-dee35e2f33a7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-4faa-c164-cde4585442f0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-4faa-0405-84521b2d1a43	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-4faa-64e4-1bef4566a53a	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556c-4faa-1914-d830eca59c0a	00010000-556c-4faa-c55c-009ff1da43c7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 5690391)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-4fa9-ea70-5bd21435d39c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-4fa9-cf53-713515da5f24	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-4fa9-51ae-4eed91a12f78	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-4fa9-cfbe-d9160bbe6367	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-4fa9-28ce-0f76512ce561	Abonma-read	Abonma - branje	f
00030000-556c-4fa9-de6c-2929b5767b79	Abonma-write	Abonma - spreminjanje	f
00030000-556c-4fa9-a1a7-3561c5290f26	Alternacija-read	Alternacija - branje	f
00030000-556c-4fa9-6f12-6a55e11f6330	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-4fa9-0684-07db977d257c	Arhivalija-read	Arhivalija - branje	f
00030000-556c-4fa9-08a7-fd7c7b0eb261	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-4fa9-cad3-6796ff68e657	Besedilo-read	Besedilo - branje	f
00030000-556c-4fa9-b1b0-5834e47e9d68	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-4fa9-5981-3aadd272f129	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-4fa9-f7a3-0534c3a99c55	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-4fa9-acc7-85ece7641e8e	Dogodek-read	Dogodek - branje	f
00030000-556c-4fa9-3b51-3ea20e1a38d2	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-4fa9-2928-156b34afaf79	Drzava-read	Drzava - branje	f
00030000-556c-4fa9-ab39-7a8f20aa79cb	Drzava-write	Drzava - spreminjanje	f
00030000-556c-4fa9-c8a8-872032069252	Funkcija-read	Funkcija - branje	f
00030000-556c-4fa9-e90b-cb2d97f050c7	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-4fa9-eefb-ca6196875c7e	Gostovanje-read	Gostovanje - branje	f
00030000-556c-4fa9-5ad7-c02fdfe796fb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-4fa9-7f04-e3c067c36848	Gostujoca-read	Gostujoca - branje	f
00030000-556c-4fa9-801a-c810136716e6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-4fa9-ddb3-31b6481ccc50	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-4fa9-3d4d-7b51670fef8a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-4fa9-4731-182ba3e5aa40	Kupec-read	Kupec - branje	f
00030000-556c-4fa9-e47e-c24f91676a5d	Kupec-write	Kupec - spreminjanje	f
00030000-556c-4fa9-6a53-1f9b92b8d285	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-4fa9-a194-4846bada48ee	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-4fa9-37f8-2c7c86018ad0	Option-read	Option - branje	f
00030000-556c-4fa9-52bf-63f8dc4edf2c	Option-write	Option - spreminjanje	f
00030000-556c-4fa9-a6f6-e8185f70b390	OptionValue-read	OptionValue - branje	f
00030000-556c-4fa9-7be6-1a339c50e015	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-4fa9-e75b-5ddeb481a299	Oseba-read	Oseba - branje	f
00030000-556c-4fa9-6547-ccf97e613db5	Oseba-write	Oseba - spreminjanje	f
00030000-556c-4fa9-c8c7-5e9905f7a8a1	Permission-read	Permission - branje	f
00030000-556c-4fa9-4180-ddda42723eb1	Permission-write	Permission - spreminjanje	f
00030000-556c-4fa9-26a0-480470da48c6	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-4fa9-70e4-5b1f49a1284b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-4fa9-65e6-75df84bfd1bf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-4fa9-b68b-c0b4abde699b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-4fa9-95ee-ffb12b26affb	Pogodba-read	Pogodba - branje	f
00030000-556c-4fa9-b4bd-6dea30ba6c0a	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-4fa9-1422-fa76cb734a54	Popa-read	Popa - branje	f
00030000-556c-4fa9-2a6a-d1d3c6b7244b	Popa-write	Popa - spreminjanje	f
00030000-556c-4fa9-6503-7149ee28a1c9	Posta-read	Posta - branje	f
00030000-556c-4fa9-2b70-79489f9851f2	Posta-write	Posta - spreminjanje	f
00030000-556c-4fa9-c516-44607aaac97f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-4fa9-d799-c9ec5299c679	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-4fa9-9d06-5d93b0457c93	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-4fa9-8f95-cdb9b976f1be	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-4fa9-0bd0-deb17ed4e2b8	Predstava-read	Predstava - branje	f
00030000-556c-4fa9-68b5-556be91c10c3	Predstava-write	Predstava - spreminjanje	f
00030000-556c-4fa9-8e20-c4c581d68423	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-4fa9-fbee-626df8cf1e64	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-4fa9-0012-06311aa1a496	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-4fa9-6e61-43d00d6ccc19	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-4fa9-8eca-5ff7b0622bff	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-4fa9-776a-35920856991f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-4fa9-c304-e6031f41857c	Prostor-read	Prostor - branje	f
00030000-556c-4fa9-4ab1-859e6eb0ebd4	Prostor-write	Prostor - spreminjanje	f
00030000-556c-4fa9-b091-bd760fd70916	Racun-read	Racun - branje	f
00030000-556c-4fa9-bbe9-2bf791c475ff	Racun-write	Racun - spreminjanje	f
00030000-556c-4fa9-3451-7ce175ea7168	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-4fa9-ef66-7411a6799aea	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-4fa9-45ea-2233e530a10e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-4fa9-95bb-9fbe584c2209	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-4fa9-7584-da5493629e8f	Rekvizit-read	Rekvizit - branje	f
00030000-556c-4fa9-9041-f354a524e607	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-4fa9-0ed5-7af4597fcd15	Revizija-read	Revizija - branje	f
00030000-556c-4fa9-47f9-a0239adf1492	Revizija-write	Revizija - spreminjanje	f
00030000-556c-4fa9-7cf4-a205071119d3	Rezervacija-read	Rezervacija - branje	f
00030000-556c-4fa9-f29f-26a8bb3286df	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-4fa9-c328-02f38153cb03	Role-read	Role - branje	f
00030000-556c-4fa9-d12d-a9a2ff6f0c57	Role-write	Role - spreminjanje	f
00030000-556c-4fa9-995b-9c8e9456c86b	SedezniRed-read	SedezniRed - branje	f
00030000-556c-4fa9-961c-6f72cf21b0ba	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-4fa9-db4b-c4236d87a94c	Sedez-read	Sedez - branje	f
00030000-556c-4fa9-565c-63ab8bbe62b2	Sedez-write	Sedez - spreminjanje	f
00030000-556c-4fa9-9d6f-fa91318cee7d	Sezona-read	Sezona - branje	f
00030000-556c-4fa9-0479-e51191afb11f	Sezona-write	Sezona - spreminjanje	f
00030000-556c-4fa9-8f3b-854d7e1f2f16	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-4fa9-679c-9f5007865584	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-4fa9-2d2a-1f436963b215	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-4fa9-2ad7-eb0b5cd646d6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-4fa9-ef70-e54c65cf0875	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-4fa9-17ce-01d94960aae6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-4fa9-e692-093050389120	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-4fa9-47a5-b2604c8e69a3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-4fa9-97c0-aa0419040420	Telefonska-read	Telefonska - branje	f
00030000-556c-4fa9-95fe-2e8cd8df4448	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-4fa9-9ccd-d2aa649e1462	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-4fa9-109c-9ff19678b466	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-4fa9-ceb4-7927d66e06dd	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-4fa9-6529-d147e5dc576c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-4fa9-9e05-c5e19eae611d	Trr-read	Trr - branje	f
00030000-556c-4fa9-6923-46c59e1ed973	Trr-write	Trr - spreminjanje	f
00030000-556c-4fa9-f344-2323a90bcb08	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-4fa9-75c7-50a7cd1fbad4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-4fa9-3901-536a401482b4	User-read	User - branje	f
00030000-556c-4fa9-0702-bcce8425f535	User-write	User - spreminjanje	f
00030000-556c-4fa9-84d3-0f563d0414f5	Vaja-read	Vaja - branje	f
00030000-556c-4fa9-db9f-79b1a524cea5	Vaja-write	Vaja - spreminjanje	f
00030000-556c-4fa9-e23d-85649be6354c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-4fa9-7512-717cc06176a9	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-4fa9-da80-6cb17575c170	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-4fa9-6923-ce6c03b9087c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-4fa9-7cdf-75e921830dc1	Zasedenost-read	Zasedenost - branje	f
00030000-556c-4fa9-9cd7-752f88322043	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-4fa9-5747-996db92aaf58	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-4fa9-b1e8-18a7043e3162	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-4fa9-305e-55f7166974d8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-4fa9-5582-2b92417bc80e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 5690410)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-4fa9-b333-d26d264ca15d	00030000-556c-4fa9-2928-156b34afaf79
00020000-556c-4fa9-d9d2-7cf20d6be011	00030000-556c-4fa9-ab39-7a8f20aa79cb
00020000-556c-4fa9-d9d2-7cf20d6be011	00030000-556c-4fa9-2928-156b34afaf79
\.


--
-- TOC entry 2803 (class 0 OID 5690705)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 5690736)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 5690870)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 5690470)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-4faa-eb92-1ed69f0aeaee	00040000-556c-4fa9-df3d-c39b5511328a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-4faa-fb9d-fa082e0f3c40	00040000-556c-4fa9-df3d-c39b5511328a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-4faa-92ca-c02ef51c9e84	00040000-556c-4fa9-df3d-c39b5511328a	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 5690505)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556c-4fa9-5562-1885df22e032	8341	Adlešiči
00050000-556c-4fa9-93ff-7ca69373d83a	5270	Ajdovščina
00050000-556c-4fa9-e2e1-e22f4be331d6	6280	Ankaran/Ancarano
00050000-556c-4fa9-941a-38856f0f9d5e	9253	Apače
00050000-556c-4fa9-9d59-eb2f798d2fa7	8253	Artiče
00050000-556c-4fa9-85cc-e4a32babc888	4275	Begunje na Gorenjskem
00050000-556c-4fa9-a565-a52662fb89fd	1382	Begunje pri Cerknici
00050000-556c-4fa9-13a6-d443ca231edc	9231	Beltinci
00050000-556c-4fa9-1510-457fe867583c	2234	Benedikt
00050000-556c-4fa9-664a-e93f3e1833c5	2345	Bistrica ob Dravi
00050000-556c-4fa9-4874-40b9f026fffa	3256	Bistrica ob Sotli
00050000-556c-4fa9-76e1-cdaf27361a94	8259	Bizeljsko
00050000-556c-4fa9-dcb5-181de4433be3	1223	Blagovica
00050000-556c-4fa9-b7b0-b991cfa3a973	8283	Blanca
00050000-556c-4fa9-9f8d-67a24af4f099	4260	Bled
00050000-556c-4fa9-5c29-5bb47956d8ed	4273	Blejska Dobrava
00050000-556c-4fa9-914a-7c29e330c354	9265	Bodonci
00050000-556c-4fa9-e323-a46ee0f914e9	9222	Bogojina
00050000-556c-4fa9-f688-bf4fcbbce17a	4263	Bohinjska Bela
00050000-556c-4fa9-423a-756914386b46	4264	Bohinjska Bistrica
00050000-556c-4fa9-a4bd-e0eb61131a56	4265	Bohinjsko jezero
00050000-556c-4fa9-348b-04f60b23686d	1353	Borovnica
00050000-556c-4fa9-061d-93631ec58303	8294	Boštanj
00050000-556c-4fa9-b490-b060016cc129	5230	Bovec
00050000-556c-4fa9-215d-ed3f54a5b53d	5295	Branik
00050000-556c-4fa9-15db-0b5e58fde366	3314	Braslovče
00050000-556c-4fa9-99de-a332b7d95ec9	5223	Breginj
00050000-556c-4fa9-10ed-7ca42b00b51d	8280	Brestanica
00050000-556c-4fa9-fbc2-2712de24637f	2354	Bresternica
00050000-556c-4fa9-7477-14ed80c379a0	4243	Brezje
00050000-556c-4fa9-5130-8afd95443b3d	1351	Brezovica pri Ljubljani
00050000-556c-4fa9-e496-03c073cb76d6	8250	Brežice
00050000-556c-4fa9-eb08-c3516eb8bb19	4210	Brnik - Aerodrom
00050000-556c-4fa9-41b6-27be25628bda	8321	Brusnice
00050000-556c-4fa9-324a-5f49a535beeb	3255	Buče
00050000-556c-4fa9-361b-f4211fdc5bea	8276	Bučka 
00050000-556c-4fa9-f331-dfb1457b5054	9261	Cankova
00050000-556c-4fa9-da54-8e7e1741f229	3000	Celje 
00050000-556c-4fa9-973c-a908ab41bb3f	3001	Celje - poštni predali
00050000-556c-4fa9-a2d4-eedb54846a38	4207	Cerklje na Gorenjskem
00050000-556c-4fa9-c183-4015cca8e0b7	8263	Cerklje ob Krki
00050000-556c-4fa9-b6b8-8de4839d739c	1380	Cerknica
00050000-556c-4fa9-8893-59a2974fffd8	5282	Cerkno
00050000-556c-4fa9-da06-fae890d1e03e	2236	Cerkvenjak
00050000-556c-4fa9-4cc2-f830a9cf01ea	2215	Ceršak
00050000-556c-4fa9-16bd-0e43cd8f4ac4	2326	Cirkovce
00050000-556c-4fa9-bbda-9b38a5f571f5	2282	Cirkulane
00050000-556c-4fa9-2eef-8d09c4a071f8	5273	Col
00050000-556c-4fa9-de51-9597a24e3fe2	8251	Čatež ob Savi
00050000-556c-4fa9-4bf4-ae0bea7a5137	1413	Čemšenik
00050000-556c-4fa9-24fa-1144613b5fd2	5253	Čepovan
00050000-556c-4fa9-63ef-d6d86ec5b519	9232	Črenšovci
00050000-556c-4fa9-d9e3-f3935960cfc5	2393	Črna na Koroškem
00050000-556c-4fa9-28af-79b25ec5bf52	6275	Črni Kal
00050000-556c-4fa9-2c6a-3133dea9f02f	5274	Črni Vrh nad Idrijo
00050000-556c-4fa9-6408-dd9e3505be39	5262	Črniče
00050000-556c-4fa9-d9de-2ce061322902	8340	Črnomelj
00050000-556c-4fa9-e3ce-731dcddb2dd5	6271	Dekani
00050000-556c-4fa9-e476-0b6f9c16c185	5210	Deskle
00050000-556c-4fa9-92c4-2433589ac466	2253	Destrnik
00050000-556c-4fa9-b28b-a629389e5496	6215	Divača
00050000-556c-4fa9-a7fb-8d830c65a6f0	1233	Dob
00050000-556c-4fa9-d5c6-58074d3b58b4	3224	Dobje pri Planini
00050000-556c-4fa9-5d8e-3b3eebcade19	8257	Dobova
00050000-556c-4fa9-edc6-f5438ce85e88	1423	Dobovec
00050000-556c-4fa9-e940-99c2122bc1db	5263	Dobravlje
00050000-556c-4fa9-d5fc-59a9c1e1805d	3204	Dobrna
00050000-556c-4fa9-c30e-33de0907c3d5	8211	Dobrnič
00050000-556c-4fa9-cd9e-c7f02667466e	1356	Dobrova
00050000-556c-4fa9-5f1a-5cd33f8a1850	9223	Dobrovnik/Dobronak 
00050000-556c-4fa9-c1bc-ec10c27eb482	5212	Dobrovo v Brdih
00050000-556c-4fa9-cfef-66bf11802250	1431	Dol pri Hrastniku
00050000-556c-4fa9-0797-fb4fd4faf170	1262	Dol pri Ljubljani
00050000-556c-4fa9-c608-088ebbaea2c8	1273	Dole pri Litiji
00050000-556c-4fa9-877e-e5c55b029cee	1331	Dolenja vas
00050000-556c-4fa9-9272-a875d58f222e	8350	Dolenjske Toplice
00050000-556c-4fa9-a7f1-624cb16f166a	1230	Domžale
00050000-556c-4fa9-dfd5-9ab2f24ac190	2252	Dornava
00050000-556c-4fa9-29ff-402a32c2b98a	5294	Dornberk
00050000-556c-4fa9-c07b-0f2b66f550ac	1319	Draga
00050000-556c-4fa9-0d58-5553bc391293	8343	Dragatuš
00050000-556c-4fa9-fb13-ff8e152ff657	3222	Dramlje
00050000-556c-4fa9-d110-1d4c349bb365	2370	Dravograd
00050000-556c-4fa9-76ed-756b6aa2ba95	4203	Duplje
00050000-556c-4fa9-ac52-28d59e4ba8c6	6221	Dutovlje
00050000-556c-4fa9-7567-f61a4f7ed6a1	8361	Dvor
00050000-556c-4fa9-c98b-440d8ada6a17	2343	Fala
00050000-556c-4fa9-2a22-083d6768b281	9208	Fokovci
00050000-556c-4fa9-6639-2ebcd0dce00a	2313	Fram
00050000-556c-4fa9-ca93-e681d80facaa	3213	Frankolovo
00050000-556c-4fa9-16ed-7e89329f58f5	1274	Gabrovka
00050000-556c-4fa9-3638-75ea32cf863c	8254	Globoko
00050000-556c-4fa9-3534-50e069ce67a5	5275	Godovič
00050000-556c-4fa9-e3f4-e0e8d8e287fe	4204	Golnik
00050000-556c-4fa9-a05b-12ca8f6718fd	3303	Gomilsko
00050000-556c-4fa9-fb54-522b7451be35	4224	Gorenja vas
00050000-556c-4fa9-091c-c2fa1019df9b	3263	Gorica pri Slivnici
00050000-556c-4fa9-eec6-6ec296784f65	2272	Gorišnica
00050000-556c-4fa9-4fa6-40ff37baf8bb	9250	Gornja Radgona
00050000-556c-4fa9-19cf-f02e08054479	3342	Gornji Grad
00050000-556c-4fa9-9366-8774f7471056	4282	Gozd Martuljek
00050000-556c-4fa9-f0aa-0bbd323dac6d	6272	Gračišče
00050000-556c-4fa9-d7d1-e25ee8ff7dd2	9264	Grad
00050000-556c-4fa9-5ce9-6aa947de896d	8332	Gradac
00050000-556c-4fa9-06f9-b20d96fbd441	1384	Grahovo
00050000-556c-4fa9-8d51-08fb4fe0d962	5242	Grahovo ob Bači
00050000-556c-4fa9-f292-e43539c0d93f	5251	Grgar
00050000-556c-4fa9-55df-65d8eedb2335	3302	Griže
00050000-556c-4fa9-211f-91592c27c19d	3231	Grobelno
00050000-556c-4fa9-38b0-5e0fc39d8929	1290	Grosuplje
00050000-556c-4fa9-a540-de7bfcdd4e2d	2288	Hajdina
00050000-556c-4fa9-aa9c-e6646f56d82d	8362	Hinje
00050000-556c-4fa9-3544-d4ea480b4b20	2311	Hoče
00050000-556c-4fa9-feb8-d7de4851ce44	9205	Hodoš/Hodos
00050000-556c-4fa9-2510-118fc32bf137	1354	Horjul
00050000-556c-4fa9-553d-6f46d015e12f	1372	Hotedršica
00050000-556c-4fa9-af1a-abd0bdce5b3f	1430	Hrastnik
00050000-556c-4fa9-5c99-74c3a84ea0ca	6225	Hruševje
00050000-556c-4fa9-5fb6-97926ef5db2d	4276	Hrušica
00050000-556c-4fa9-7511-a93f859bd0f7	5280	Idrija
00050000-556c-4fa9-f32f-35e2019510d3	1292	Ig
00050000-556c-4fa9-7545-01868a9f1dd9	6250	Ilirska Bistrica
00050000-556c-4fa9-8295-92bbcbdfb7e8	6251	Ilirska Bistrica-Trnovo
00050000-556c-4fa9-2678-268580cb6612	1295	Ivančna Gorica
00050000-556c-4fa9-90f1-e9b139f18e06	2259	Ivanjkovci
00050000-556c-4fa9-5938-2921b87f05f5	1411	Izlake
00050000-556c-4fa9-8880-b56b3de98013	6310	Izola/Isola
00050000-556c-4fa9-4a23-d700f04f8bbe	2222	Jakobski Dol
00050000-556c-4fa9-52d0-4f08b92ddd98	2221	Jarenina
00050000-556c-4fa9-3c19-13e0314bd13e	6254	Jelšane
00050000-556c-4fa9-d5fb-5f95afa9d766	4270	Jesenice
00050000-556c-4fa9-dd25-12c247e20e6e	8261	Jesenice na Dolenjskem
00050000-556c-4fa9-7b63-7c8d0d926bea	3273	Jurklošter
00050000-556c-4fa9-46fe-796ffecc272d	2223	Jurovski Dol
00050000-556c-4fa9-edee-ab1a227107a5	2256	Juršinci
00050000-556c-4fa9-2ce0-0434aea36134	5214	Kal nad Kanalom
00050000-556c-4fa9-afec-4acd85285154	3233	Kalobje
00050000-556c-4fa9-940a-6ba257002d04	4246	Kamna Gorica
00050000-556c-4fa9-950a-8a964d3ea96b	2351	Kamnica
00050000-556c-4fa9-39d2-6c61388f9d86	1241	Kamnik
00050000-556c-4fa9-d7cd-86c37b78a455	5213	Kanal
00050000-556c-4fa9-479c-b59254b06e24	8258	Kapele
00050000-556c-4fa9-6a24-cdd3d27fa87d	2362	Kapla
00050000-556c-4fa9-00b9-b96925662b1d	2325	Kidričevo
00050000-556c-4fa9-133e-aac03d6d903e	1412	Kisovec
00050000-556c-4fa9-6d07-b1fe807a877a	6253	Knežak
00050000-556c-4fa9-b048-165ab50c7891	5222	Kobarid
00050000-556c-4fa9-c219-b771411d2b46	9227	Kobilje
00050000-556c-4fa9-a5d7-68d9eec005a3	1330	Kočevje
00050000-556c-4fa9-5b27-8c879e696e38	1338	Kočevska Reka
00050000-556c-4fa9-6e98-ba8c9742cdeb	2276	Kog
00050000-556c-4fa9-bce5-00bba7a9a196	5211	Kojsko
00050000-556c-4fa9-344e-1d416f29abdf	6223	Komen
00050000-556c-4fa9-2851-3f76282d4e0a	1218	Komenda
00050000-556c-4fa9-3712-2918c7248c06	6000	Koper/Capodistria 
00050000-556c-4fa9-bb18-6fbafd44608b	6001	Koper/Capodistria - poštni predali
00050000-556c-4fa9-afc9-b64122b36d6e	8282	Koprivnica
00050000-556c-4fa9-68b9-e4575b457c95	5296	Kostanjevica na Krasu
00050000-556c-4fa9-8fd6-8c47237208b3	8311	Kostanjevica na Krki
00050000-556c-4fa9-d10b-81bf59646f11	1336	Kostel
00050000-556c-4fa9-d592-fae96bc128d9	6256	Košana
00050000-556c-4fa9-1422-25e7df80962b	2394	Kotlje
00050000-556c-4fa9-dc5c-5c12752d335c	6240	Kozina
00050000-556c-4fa9-ce0e-611431244be7	3260	Kozje
00050000-556c-4fa9-e72e-20b2a496cc3b	4000	Kranj 
00050000-556c-4fa9-ee9f-7f132cac4a04	4001	Kranj - poštni predali
00050000-556c-4fa9-584e-82d01fcade09	4280	Kranjska Gora
00050000-556c-4fa9-5f88-759c1a0e1a93	1281	Kresnice
00050000-556c-4fa9-625a-6fbf5bcf5392	4294	Križe
00050000-556c-4fa9-283d-e1fbb9d16640	9206	Križevci
00050000-556c-4fa9-da4f-60469d5b7491	9242	Križevci pri Ljutomeru
00050000-556c-4fa9-838f-b9cf40374e7d	1301	Krka
00050000-556c-4fa9-8df4-12b0a0e7be58	8296	Krmelj
00050000-556c-4fa9-171b-f78ca6a01ccf	4245	Kropa
00050000-556c-4fa9-f394-099742c88b12	8262	Krška vas
00050000-556c-4fa9-c8a9-36099eca21c7	8270	Krško
00050000-556c-4fa9-22c2-de7569239550	9263	Kuzma
00050000-556c-4fa9-9a2c-67aa330ab574	2318	Laporje
00050000-556c-4fa9-cb68-487a89bbb52a	3270	Laško
00050000-556c-4fa9-a004-b6e69d98ce6e	1219	Laze v Tuhinju
00050000-556c-4fa9-d381-b8a0564ea997	2230	Lenart v Slovenskih goricah
00050000-556c-4fa9-c494-e26feb701c28	9220	Lendava/Lendva
00050000-556c-4fa9-dd6a-ccc3fc2d0f9b	4248	Lesce
00050000-556c-4fa9-50b0-4b3a7d8f85df	3261	Lesično
00050000-556c-4fa9-5133-db25ff1d4d2b	8273	Leskovec pri Krškem
00050000-556c-4fa9-3c35-8aec7ba7238e	2372	Libeliče
00050000-556c-4fa9-bd79-e6b4e746d23a	2341	Limbuš
00050000-556c-4fa9-274d-906168b5a4c2	1270	Litija
00050000-556c-4fa9-afe5-416e98e87ad1	3202	Ljubečna
00050000-556c-4fa9-d803-83464e25a163	1000	Ljubljana 
00050000-556c-4fa9-3a6a-27dd23546ad8	1001	Ljubljana - poštni predali
00050000-556c-4fa9-69ef-5aa5dca1fbda	1231	Ljubljana - Črnuče
00050000-556c-4fa9-a6a0-926dff126212	1261	Ljubljana - Dobrunje
00050000-556c-4fa9-4a98-783ad2dd894c	1260	Ljubljana - Polje
00050000-556c-4fa9-90ef-e462d0b66484	1210	Ljubljana - Šentvid
00050000-556c-4fa9-6686-07c5707c5103	1211	Ljubljana - Šmartno
00050000-556c-4fa9-0ae4-833493aee808	3333	Ljubno ob Savinji
00050000-556c-4fa9-333e-fe6be7ff97c7	9240	Ljutomer
00050000-556c-4fa9-d4bf-56ffebe363fb	3215	Loče
00050000-556c-4fa9-1933-a81759b5ae08	5231	Log pod Mangartom
00050000-556c-4fa9-fe90-1d2144675acf	1358	Log pri Brezovici
00050000-556c-4fa9-3df9-a868cc6fa1bf	1370	Logatec
00050000-556c-4fa9-2612-3f80434ebbe7	1371	Logatec
00050000-556c-4fa9-4614-0e5fa028788a	1434	Loka pri Zidanem Mostu
00050000-556c-4fa9-9243-d7d1e3fdf658	3223	Loka pri Žusmu
00050000-556c-4fa9-fc70-e8cab2f1de05	6219	Lokev
00050000-556c-4fa9-fbbf-21f0bb3c91d4	1318	Loški Potok
00050000-556c-4fa9-9a28-843c79acaa85	2324	Lovrenc na Dravskem polju
00050000-556c-4fa9-5ccf-6648c06c5dcc	2344	Lovrenc na Pohorju
00050000-556c-4fa9-054b-0ccc97240642	3334	Luče
00050000-556c-4fa9-091b-b359c8afbd06	1225	Lukovica
00050000-556c-4fa9-62c3-9ceb1dfff688	9202	Mačkovci
00050000-556c-4fa9-d320-becd3af784f6	2322	Majšperk
00050000-556c-4fa9-edce-cb440e4cc45e	2321	Makole
00050000-556c-4fa9-5f53-b9775d1e3f5b	9243	Mala Nedelja
00050000-556c-4fa9-123f-ad62e79e7b60	2229	Malečnik
00050000-556c-4fa9-0bee-5e8a62598fdc	6273	Marezige
00050000-556c-4fa9-ae46-a8cd4eca07f5	2000	Maribor 
00050000-556c-4fa9-f1c7-2a23ecd379eb	2001	Maribor - poštni predali
00050000-556c-4fa9-4739-835a6270628e	2206	Marjeta na Dravskem polju
00050000-556c-4fa9-4a80-dd30836d7868	2281	Markovci
00050000-556c-4fa9-2e60-a6c938c6a59f	9221	Martjanci
00050000-556c-4fa9-b0bb-4de3a0d615b1	6242	Materija
00050000-556c-4fa9-38e0-85c962b2e7fd	4211	Mavčiče
00050000-556c-4fa9-9fe3-c59adc7c54e5	1215	Medvode
00050000-556c-4fa9-3d55-3f0fcd9a3ee6	1234	Mengeš
00050000-556c-4fa9-2ecb-6edcd7f011d2	8330	Metlika
00050000-556c-4fa9-154f-5753e9417f3c	2392	Mežica
00050000-556c-4fa9-1cf4-ae90255a4171	2204	Miklavž na Dravskem polju
00050000-556c-4fa9-5218-72927476147d	2275	Miklavž pri Ormožu
00050000-556c-4fa9-927c-5733b0840fb6	5291	Miren
00050000-556c-4fa9-a159-a5f52d51a87d	8233	Mirna
00050000-556c-4fa9-d1a0-601759214c97	8216	Mirna Peč
00050000-556c-4fa9-6769-5af1a9b3f52a	2382	Mislinja
00050000-556c-4fa9-7105-976de1f40371	4281	Mojstrana
00050000-556c-4fa9-d585-0f7047b6a172	8230	Mokronog
00050000-556c-4fa9-f08e-3ef4c2c27fd7	1251	Moravče
00050000-556c-4fa9-331e-2c7e82f825ad	9226	Moravske Toplice
00050000-556c-4fa9-97d7-a840abf4bb8f	5216	Most na Soči
00050000-556c-4fa9-93ca-32f39a5171ab	1221	Motnik
00050000-556c-4fa9-a799-f03d82fe37dc	3330	Mozirje
00050000-556c-4fa9-6736-585926b406cf	9000	Murska Sobota 
00050000-556c-4fa9-6385-5aed4c3fede2	9001	Murska Sobota - poštni predali
00050000-556c-4fa9-978b-a0bfcc5d530a	2366	Muta
00050000-556c-4fa9-ca3d-317ced7b3490	4202	Naklo
00050000-556c-4fa9-b164-3949b60366e5	3331	Nazarje
00050000-556c-4fa9-5c07-57f0c942d42a	1357	Notranje Gorice
00050000-556c-4fa9-6452-32c90e138509	3203	Nova Cerkev
00050000-556c-4fa9-e455-c403f06ebfbc	5000	Nova Gorica 
00050000-556c-4fa9-792a-06f534112c5a	5001	Nova Gorica - poštni predali
00050000-556c-4fa9-7553-4b703cd6f68f	1385	Nova vas
00050000-556c-4fa9-d791-264943c8b17c	8000	Novo mesto
00050000-556c-4fa9-980d-b56726b9ce6e	8001	Novo mesto - poštni predali
00050000-556c-4fa9-b161-fdec0453e485	6243	Obrov
00050000-556c-4fa9-7f53-9b5a7154fff6	9233	Odranci
00050000-556c-4fa9-6f9e-61d2e9b9a511	2317	Oplotnica
00050000-556c-4fa9-d690-9bcf1ec86f74	2312	Orehova vas
00050000-556c-4fa9-3fb4-51086c55263b	2270	Ormož
00050000-556c-4fa9-d344-6b803924c42b	1316	Ortnek
00050000-556c-4fa9-4439-0a3a05da7a68	1337	Osilnica
00050000-556c-4fa9-0370-80b0828f6782	8222	Otočec
00050000-556c-4fa9-5756-5a4a065f2db0	2361	Ožbalt
00050000-556c-4fa9-5436-ac046db37a75	2231	Pernica
00050000-556c-4fa9-5b09-85cfc8f768ef	2211	Pesnica pri Mariboru
00050000-556c-4fa9-c026-563f8056fbcd	9203	Petrovci
00050000-556c-4fa9-97c3-2c47ca866300	3301	Petrovče
00050000-556c-4fa9-ec3f-5c320923770f	6330	Piran/Pirano
00050000-556c-4fa9-fc07-af9ce8e227a5	8255	Pišece
00050000-556c-4fa9-c97b-da0475eda6c6	6257	Pivka
00050000-556c-4fa9-0e80-b369dd0623f7	6232	Planina
00050000-556c-4fa9-36ed-347a5c77dc6e	3225	Planina pri Sevnici
00050000-556c-4fa9-8945-9f8019b0b0e0	6276	Pobegi
00050000-556c-4fa9-a30e-622f17eeb44a	8312	Podbočje
00050000-556c-4fa9-b364-a10341efd9c5	5243	Podbrdo
00050000-556c-4fa9-85a2-9bf7617a9fed	3254	Podčetrtek
00050000-556c-4fa9-f52c-9c13d2831a6b	2273	Podgorci
00050000-556c-4fa9-135a-17ae72a2ee4a	6216	Podgorje
00050000-556c-4fa9-e095-9318d2ba554e	2381	Podgorje pri Slovenj Gradcu
00050000-556c-4fa9-8505-9f5bb4f4fa38	6244	Podgrad
00050000-556c-4fa9-6d6c-71df02bc071f	1414	Podkum
00050000-556c-4fa9-0fda-203d95a9790b	2286	Podlehnik
00050000-556c-4fa9-4afc-161908fe2c47	5272	Podnanos
00050000-556c-4fa9-4378-59fade996947	4244	Podnart
00050000-556c-4fa9-00de-c8045bf6c1dc	3241	Podplat
00050000-556c-4fa9-71c1-f706818b083e	3257	Podsreda
00050000-556c-4fa9-f3df-90ddee451107	2363	Podvelka
00050000-556c-4fa9-871c-632a8f50ae0f	2208	Pohorje
00050000-556c-4fa9-fffe-624c6be7bee4	2257	Polenšak
00050000-556c-4fa9-55fc-cc173a96ffb8	1355	Polhov Gradec
00050000-556c-4fa9-1d46-826082915230	4223	Poljane nad Škofjo Loko
00050000-556c-4fa9-a89d-4ad127607ac6	2319	Poljčane
00050000-556c-4fa9-af2f-26837dbe2b70	1272	Polšnik
00050000-556c-4fa9-e688-20ecc5bc3f04	3313	Polzela
00050000-556c-4fa9-aa30-1d800a347b70	3232	Ponikva
00050000-556c-4fa9-41cb-ebfc74d6dc6e	6320	Portorož/Portorose
00050000-556c-4fa9-8577-c5fdf922b08c	6230	Postojna
00050000-556c-4fa9-1a9f-83eab2dc06df	2331	Pragersko
00050000-556c-4fa9-8ab0-6f1f0c655b59	3312	Prebold
00050000-556c-4fa9-bacc-eba9ae185d4b	4205	Preddvor
00050000-556c-4fa9-c48a-0b21d90cc086	6255	Prem
00050000-556c-4fa9-9630-e19ed603125a	1352	Preserje
00050000-556c-4fa9-c65d-9b750c7e1dee	6258	Prestranek
00050000-556c-4fa9-75b5-c6d8862784f6	2391	Prevalje
00050000-556c-4fa9-ac01-79d9cb65a6e6	3262	Prevorje
00050000-556c-4fa9-3220-5cd07b0a684c	1276	Primskovo 
00050000-556c-4fa9-992b-acff7feec855	3253	Pristava pri Mestinju
00050000-556c-4fa9-88e6-dfbda5ae77da	9207	Prosenjakovci/Partosfalva
00050000-556c-4fa9-b066-9d80e4200871	5297	Prvačina
00050000-556c-4fa9-43c7-d703b39be02d	2250	Ptuj
00050000-556c-4fa9-721f-40a1a55227fd	2323	Ptujska Gora
00050000-556c-4fa9-c45a-b896b7dec3dd	9201	Puconci
00050000-556c-4fa9-c016-1d0bc0745b2a	2327	Rače
00050000-556c-4fa9-c331-45651a5cdaea	1433	Radeče
00050000-556c-4fa9-c74b-25f173756cf9	9252	Radenci
00050000-556c-4fa9-aab4-85ec03ed7914	2360	Radlje ob Dravi
00050000-556c-4fa9-ea9d-8848005c6cba	1235	Radomlje
00050000-556c-4fa9-6fc9-1704a6595c09	4240	Radovljica
00050000-556c-4fa9-8c4d-41db3da4a1c1	8274	Raka
00050000-556c-4fa9-34cb-5866df96fd23	1381	Rakek
00050000-556c-4fa9-c9e0-7c4178fede21	4283	Rateče - Planica
00050000-556c-4fa9-4fe8-d631c3a7ec5a	2390	Ravne na Koroškem
00050000-556c-4fa9-5ab7-9cb7575f512a	9246	Razkrižje
00050000-556c-4fa9-db07-bbdb909f9861	3332	Rečica ob Savinji
00050000-556c-4fa9-de25-deb3edd1bfed	5292	Renče
00050000-556c-4fa9-576a-61ce080233cc	1310	Ribnica
00050000-556c-4fa9-e4a7-4e8bebfcd342	2364	Ribnica na Pohorju
00050000-556c-4fa9-2302-b81245931312	3272	Rimske Toplice
00050000-556c-4fa9-ef13-fd48c6843fce	1314	Rob
00050000-556c-4fa9-c63d-43289e737188	5215	Ročinj
00050000-556c-4fa9-9ab7-d49994e28dbe	3250	Rogaška Slatina
00050000-556c-4fa9-1fe5-ce81feece4c5	9262	Rogašovci
00050000-556c-4fa9-eb4e-524b7cc3c443	3252	Rogatec
00050000-556c-4fa9-c395-3053f44f9bcc	1373	Rovte
00050000-556c-4fa9-db68-d3f7e4ff1a5d	2342	Ruše
00050000-556c-4fa9-77a2-1495beb33f2e	1282	Sava
00050000-556c-4fa9-6fe5-2a6bfe721004	6333	Sečovlje/Sicciole
00050000-556c-4fa9-cd0c-befe539f7d7d	4227	Selca
00050000-556c-4fa9-7e8c-f42e36129b37	2352	Selnica ob Dravi
00050000-556c-4fa9-7f0b-38f58c123ef6	8333	Semič
00050000-556c-4fa9-5735-c7a2eb9fed41	8281	Senovo
00050000-556c-4fa9-50fc-a8fd121abaaa	6224	Senožeče
00050000-556c-4fa9-b1b2-561423c31d79	8290	Sevnica
00050000-556c-4fa9-9557-7c3b1346f2d3	6210	Sežana
00050000-556c-4fa9-6db1-9f1582eb3c06	2214	Sladki Vrh
00050000-556c-4fa9-1b03-c35d371584a4	5283	Slap ob Idrijci
00050000-556c-4fa9-8f87-046493dd7111	2380	Slovenj Gradec
00050000-556c-4fa9-7e93-ac4234548c23	2310	Slovenska Bistrica
00050000-556c-4fa9-326b-63e481dd6f3c	3210	Slovenske Konjice
00050000-556c-4fa9-849c-b258aa37e0a5	1216	Smlednik
00050000-556c-4fa9-7c6e-b8b583c9cacd	5232	Soča
00050000-556c-4fa9-b88d-58010e944864	1317	Sodražica
00050000-556c-4fa9-cda2-adc9ffc2cdac	3335	Solčava
00050000-556c-4fa9-ad94-d9bc080f5ee3	5250	Solkan
00050000-556c-4fa9-7954-1ae5675c011b	4229	Sorica
00050000-556c-4fa9-21d8-f6cea45681d2	4225	Sovodenj
00050000-556c-4fa9-f09e-47d176621203	5281	Spodnja Idrija
00050000-556c-4fa9-8414-1e2e07c72752	2241	Spodnji Duplek
00050000-556c-4fa9-fbf6-c3c8f75dc5be	9245	Spodnji Ivanjci
00050000-556c-4fa9-0885-0ff91a246c2d	2277	Središče ob Dravi
00050000-556c-4fa9-c9f1-537a7f649c8b	4267	Srednja vas v Bohinju
00050000-556c-4fa9-5d51-5517b7d78a29	8256	Sromlje 
00050000-556c-4fa9-f13e-d36e7e7bce7a	5224	Srpenica
00050000-556c-4fa9-43dc-b1e5af735b44	1242	Stahovica
00050000-556c-4fa9-422d-3d4aab25a296	1332	Stara Cerkev
00050000-556c-4fa9-10e8-e1cdfcbc7802	8342	Stari trg ob Kolpi
00050000-556c-4fa9-7b9e-90c6c87f58e2	1386	Stari trg pri Ložu
00050000-556c-4fa9-9905-50a3dec619e8	2205	Starše
00050000-556c-4fa9-b06e-086aa68b9a4a	2289	Stoperce
00050000-556c-4fa9-53e2-98a8753fb3c0	8322	Stopiče
00050000-556c-4fa9-6a3c-0efa9ed54b82	3206	Stranice
00050000-556c-4fa9-55fa-09fef2e09a29	8351	Straža
00050000-556c-4fa9-cbd9-2eef1c2d0562	1313	Struge
00050000-556c-4fa9-cf90-393e616f40ad	8293	Studenec
00050000-556c-4fa9-7b6f-6b3201f39c2a	8331	Suhor
00050000-556c-4fa9-d02a-fd36f07c7f5c	2233	Sv. Ana v Slovenskih goricah
00050000-556c-4fa9-3e7f-c2a12dd29e7b	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-4fa9-d022-3a700467db34	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-4fa9-4001-8c6186e26b4b	9244	Sveti Jurij ob Ščavnici
00050000-556c-4fa9-4d4e-bc464979b18f	3264	Sveti Štefan
00050000-556c-4fa9-1030-73021919f81d	2258	Sveti Tomaž
00050000-556c-4fa9-c183-e461f31430a3	9204	Šalovci
00050000-556c-4fa9-f6a4-193c58722526	5261	Šempas
00050000-556c-4fa9-c185-a5de692da9aa	5290	Šempeter pri Gorici
00050000-556c-4fa9-e3fe-87e953c08346	3311	Šempeter v Savinjski dolini
00050000-556c-4fa9-2b9f-79f7003b1a2f	4208	Šenčur
00050000-556c-4fa9-ef8f-dec4144663f8	2212	Šentilj v Slovenskih goricah
00050000-556c-4fa9-edfb-068d1b53b211	8297	Šentjanž
00050000-556c-4fa9-36e5-f2ac29467a24	2373	Šentjanž pri Dravogradu
00050000-556c-4fa9-abfa-e65ebd386992	8310	Šentjernej
00050000-556c-4fa9-1399-cccff9b6b9d7	3230	Šentjur
00050000-556c-4fa9-5de1-dfb44bc0eeac	3271	Šentrupert
00050000-556c-4fa9-3bd9-2569c04b8e90	8232	Šentrupert
00050000-556c-4fa9-997d-23ae2a1af68e	1296	Šentvid pri Stični
00050000-556c-4fa9-daec-a7e9b956dec2	8275	Škocjan
00050000-556c-4fa9-373d-bcd9bba0be9c	6281	Škofije
00050000-556c-4fa9-f5f2-2442b0814907	4220	Škofja Loka
00050000-556c-4fa9-7224-5526fafc7ada	3211	Škofja vas
00050000-556c-4fa9-d0a5-0d816c9953ed	1291	Škofljica
00050000-556c-4fa9-ac9a-1cc05f956c80	6274	Šmarje
00050000-556c-4fa9-92ed-40d402602090	1293	Šmarje - Sap
00050000-556c-4fa9-4c94-8bf64c9a37d7	3240	Šmarje pri Jelšah
00050000-556c-4fa9-4a85-985a50540c6c	8220	Šmarješke Toplice
00050000-556c-4fa9-e452-13e0bb7f777c	2315	Šmartno na Pohorju
00050000-556c-4fa9-1a59-ea4da0fccefa	3341	Šmartno ob Dreti
00050000-556c-4fa9-f8a9-70a1bcf68ae0	3327	Šmartno ob Paki
00050000-556c-4fa9-5444-e1c95d0a138a	1275	Šmartno pri Litiji
00050000-556c-4fa9-198c-6e24aceda4f2	2383	Šmartno pri Slovenj Gradcu
00050000-556c-4fa9-d4d1-9be42a1fe066	3201	Šmartno v Rožni dolini
00050000-556c-4fa9-7134-782f46e8278d	3325	Šoštanj
00050000-556c-4fa9-8f87-6b32918e8add	6222	Štanjel
00050000-556c-4fa9-c349-518e2f945454	3220	Štore
00050000-556c-4fa9-e49c-1f522235ff87	3304	Tabor
00050000-556c-4fa9-8fcd-f77b74170989	3221	Teharje
00050000-556c-4fa9-5df7-ca0b1bcbc709	9251	Tišina
00050000-556c-4fa9-ca44-054ef419ccaa	5220	Tolmin
00050000-556c-4fa9-1527-6fe15c01a6a8	3326	Topolšica
00050000-556c-4fa9-428b-f096a3114f96	2371	Trbonje
00050000-556c-4fa9-7bc8-d16aea2366ff	1420	Trbovlje
00050000-556c-4fa9-b6a7-bea1ff456c44	8231	Trebelno 
00050000-556c-4fa9-ddb8-40ff02698c50	8210	Trebnje
00050000-556c-4fa9-82ff-f2db207d4be6	5252	Trnovo pri Gorici
00050000-556c-4fa9-7d37-43034a6a53e4	2254	Trnovska vas
00050000-556c-4fa9-b6aa-32e5de1c921e	1222	Trojane
00050000-556c-4fa9-96c5-3d656e933282	1236	Trzin
00050000-556c-4fa9-fc8d-62f53521c0b3	4290	Tržič
00050000-556c-4fa9-b7f7-bc81b6afd8d9	8295	Tržišče
00050000-556c-4fa9-0028-18f2de54d62a	1311	Turjak
00050000-556c-4fa9-8675-8fcd1f08a611	9224	Turnišče
00050000-556c-4fa9-47d4-7b7751868ad4	8323	Uršna sela
00050000-556c-4fa9-79dd-f1511c6b3d1e	1252	Vače
00050000-556c-4fa9-eeb7-d4358fbc49f8	3320	Velenje 
00050000-556c-4fa9-b7d7-9dd4dd8f450c	3322	Velenje - poštni predali
00050000-556c-4fa9-1a70-88a1528d99c5	8212	Velika Loka
00050000-556c-4fa9-4cb2-06d940da8a0c	2274	Velika Nedelja
00050000-556c-4fa9-8f30-cc6d4073b849	9225	Velika Polana
00050000-556c-4fa9-a800-4bc3e071ab68	1315	Velike Lašče
00050000-556c-4fa9-310d-be4565f0c9c9	8213	Veliki Gaber
00050000-556c-4fa9-1f25-5ae9c7c09450	9241	Veržej
00050000-556c-4fa9-9249-181179b611d8	1312	Videm - Dobrepolje
00050000-556c-4fa9-2b63-4b3979d2285c	2284	Videm pri Ptuju
00050000-556c-4fa9-bf38-dc291537d86d	8344	Vinica
00050000-556c-4fa9-d69c-c1193110e76e	5271	Vipava
00050000-556c-4fa9-09aa-dd3ccd18f1d4	4212	Visoko
00050000-556c-4fa9-772d-2bd8eef10248	1294	Višnja Gora
00050000-556c-4fa9-843c-a35b5fe9edee	3205	Vitanje
00050000-556c-4fa9-6480-c1bfb3a13c34	2255	Vitomarci
00050000-556c-4fa9-c651-4093968b42d6	1217	Vodice
00050000-556c-4fa9-d835-3dcf4a2cd193	3212	Vojnik\t
00050000-556c-4fa9-2444-d4f66fe41d33	5293	Volčja Draga
00050000-556c-4fa9-4d98-bf2f9a4d15a9	2232	Voličina
00050000-556c-4fa9-6254-9a44f8b984da	3305	Vransko
00050000-556c-4fa9-e975-350a48c178df	6217	Vremski Britof
00050000-556c-4fa9-b532-1a044456033c	1360	Vrhnika
00050000-556c-4fa9-5069-d2807f3ddcfc	2365	Vuhred
00050000-556c-4fa9-5a4c-926b019278b7	2367	Vuzenica
00050000-556c-4fa9-1515-4b2b2d4a1be9	8292	Zabukovje 
00050000-556c-4fa9-d7d2-e79cd73bc09e	1410	Zagorje ob Savi
00050000-556c-4fa9-a440-b57376aecec1	1303	Zagradec
00050000-556c-4fa9-1124-e2b26e48b7f0	2283	Zavrč
00050000-556c-4fa9-447d-1a131a45cfb8	8272	Zdole 
00050000-556c-4fa9-838c-b5938ef18af1	4201	Zgornja Besnica
00050000-556c-4fa9-553c-7d08a369ab3c	2242	Zgornja Korena
00050000-556c-4fa9-7c51-0f57772f6e97	2201	Zgornja Kungota
00050000-556c-4fa9-843d-ed76e40430d5	2316	Zgornja Ložnica
00050000-556c-4fa9-2298-d261472d7286	2314	Zgornja Polskava
00050000-556c-4fa9-864b-463dad4b4f46	2213	Zgornja Velka
00050000-556c-4fa9-d800-ef20e33aa729	4247	Zgornje Gorje
00050000-556c-4fa9-774c-8a937838d199	4206	Zgornje Jezersko
00050000-556c-4fa9-f763-9cdcdd3651c7	2285	Zgornji Leskovec
00050000-556c-4fa9-c646-69ee48a000bf	1432	Zidani Most
00050000-556c-4fa9-617a-20f42813b145	3214	Zreče
00050000-556c-4fa9-ba06-7520a73ada2b	4209	Žabnica
00050000-556c-4fa9-a34c-b97db02dadfa	3310	Žalec
00050000-556c-4fa9-ff2e-9fac220f06d8	4228	Železniki
00050000-556c-4fa9-63ce-364490721ca7	2287	Žetale
00050000-556c-4fa9-da22-6e533b3e4e0a	4226	Žiri
00050000-556c-4fa9-edcf-c3f8e9a02683	4274	Žirovnica
00050000-556c-4fa9-b542-641aa786b9dc	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 5690679)
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
-- TOC entry 2781 (class 0 OID 5690490)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 5690568)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 5690691)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 5690811)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 5690862)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556c-4faa-9ea3-3300106ae4ae	00080000-556c-4faa-92ca-c02ef51c9e84	0987	A
\.


--
-- TOC entry 2825 (class 0 OID 5690974)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 5691002)
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
-- TOC entry 2826 (class 0 OID 5690983)
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
-- TOC entry 2805 (class 0 OID 5690720)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556c-4faa-b84d-00281ef8a239	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-4faa-1a29-1e1f76c51762	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-4faa-b957-ef6340f6a6df	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-4faa-3a85-9ce9045be643	0004	Mali oder	t	24	Mali oder 
00220000-556c-4faa-de0f-0a40edda8a01	0005	Komorni oder	t	15	Komorni oder
00220000-556c-4faa-07b6-ad8f80bd8a10	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-4faa-4646-ffa20b122234	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 5690664)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 5690654)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 5690851)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 5690788)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 5690362)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556c-4fa9-8dbb-cb5ca9e49c81	00010000-556c-4fa9-18a9-2b93cca7bade	2015-06-01 14:27:23	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROBwXCcBYlrKAkR/HGIytJ5UWVzFHgSFC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 5690730)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 5690400)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556c-4fa9-7c34-8f7828f245b2	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-4fa9-fa1b-136a11178b8c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-4fa9-b333-d26d264ca15d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-4fa9-6753-482f570e2eae	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-4fa9-0dcf-3e78020e6f81	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-4fa9-d9d2-7cf20d6be011	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 5690384)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556c-4fa9-8dbb-cb5ca9e49c81	00020000-556c-4fa9-6753-482f570e2eae
00010000-556c-4fa9-18a9-2b93cca7bade	00020000-556c-4fa9-6753-482f570e2eae
\.


--
-- TOC entry 2808 (class 0 OID 5690744)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 5690685)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 5690635)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 5691020)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556c-4fa9-bd5d-c4b38c35d18e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-4fa9-e9a0-4f20adc9706a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-4fa9-4f60-91558bb78bef	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-4fa9-b419-c2b7cc55e448	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-4fa9-cee1-b65bf9fa3e74	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 5691013)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556c-4fa9-4c18-c39a3f4d64f7	00000000-556c-4fa9-b419-c2b7cc55e448	popa
00000000-556c-4fa9-c402-15fc8018e145	00000000-556c-4fa9-b419-c2b7cc55e448	oseba
00000000-556c-4fa9-783b-302a33d4fe81	00000000-556c-4fa9-e9a0-4f20adc9706a	prostor
00000000-556c-4fa9-5e3e-1b17a13a00a7	00000000-556c-4fa9-b419-c2b7cc55e448	besedilo
00000000-556c-4fa9-f895-234b12504e30	00000000-556c-4fa9-b419-c2b7cc55e448	uprizoritev
00000000-556c-4fa9-da02-3701671336eb	00000000-556c-4fa9-b419-c2b7cc55e448	funkcija
00000000-556c-4fa9-83c5-e2a80103603c	00000000-556c-4fa9-b419-c2b7cc55e448	tipfunkcije
00000000-556c-4fa9-2574-ab2d75c4d1c8	00000000-556c-4fa9-b419-c2b7cc55e448	alternacija
00000000-556c-4fa9-75cd-92dddfa4ce92	00000000-556c-4fa9-bd5d-c4b38c35d18e	pogodba
00000000-556c-4fa9-3696-d94f4fc6ee28	00000000-556c-4fa9-b419-c2b7cc55e448	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 5691008)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 5690798)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 5690462)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 5690641)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556c-4faa-85fc-57fe6887e229	00180000-556c-4faa-8526-b0a1ac1a9e65	000c0000-556c-4faa-f742-7636f360eefd	00090000-556c-4faa-2924-c95984feebe5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-4faa-528d-1477e343d233	00180000-556c-4faa-8526-b0a1ac1a9e65	000c0000-556c-4faa-d8c0-8cee430b1aac	00090000-556c-4faa-c164-cde4585442f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-4faa-871e-20f6050dae93	00180000-556c-4faa-8526-b0a1ac1a9e65	000c0000-556c-4faa-9a2d-9e23cb58170d	00090000-556c-4faa-5f0c-237cc27738ee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-4faa-28f4-2502509288d8	00180000-556c-4faa-8526-b0a1ac1a9e65	000c0000-556c-4faa-43bb-87298b7aa033	00090000-556c-4faa-4ac9-5e4f3be6c956	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-4faa-2c7f-d3a59da7aa18	00180000-556c-4faa-8526-b0a1ac1a9e65	000c0000-556c-4faa-e363-2dc38e3d3740	00090000-556c-4faa-64e4-1bef4566a53a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-4faa-3e31-26047acc56e1	00180000-556c-4faa-2ce9-3b68b64c0773	\N	00090000-556c-4faa-64e4-1bef4566a53a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 5690840)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556c-4fa9-7cf9-a29c327ca8fa	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-4fa9-09d5-8376ef04e004	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-4fa9-29f3-65d632ddb4d6	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-4fa9-4415-f85317a94dfc	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-4fa9-ab71-2f175d9c6b19	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-4fa9-725d-bb73bc361518	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-4fa9-2508-5aee1c18ef54	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-4fa9-5ce3-515e5a4b6eec	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-4fa9-c4c2-13d22812923f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-4fa9-d7b1-0569de272c17	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-4fa9-1cda-6c7bc46d9e73	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-4fa9-8075-29b73b812266	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-4fa9-011c-b732c7c3eccc	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-4fa9-1b91-f67ada9d75e8	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-4fa9-3936-1742e505d652	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-4fa9-410c-40a48b92ade3	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 5690991)
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
-- TOC entry 2784 (class 0 OID 5690525)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 5690371)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556c-4fa9-18a9-2b93cca7bade	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROF4X0TfwVKo1sgphLJP94XFkNMX07X16	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-4faa-6479-69924d5709bd	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-4faa-a348-52e3eb0f6435	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-4faa-e22b-dee35e2f33a7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-4faa-c55c-009ff1da43c7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556c-4fa9-8dbb-cb5ca9e49c81	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 5690896)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556c-4faa-a8f5-da8458b53fba	00160000-556c-4faa-3921-62e2d45e6ce1	00150000-556c-4fa9-0ad2-1344c1733cd9	00140000-556c-4fa9-4839-474b1bac3ed7	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-4faa-de0f-0a40edda8a01
000e0000-556c-4faa-f466-abecab560cbe	00160000-556c-4faa-a4ca-07d5f28c8822	00150000-556c-4fa9-020b-1521e8fb71f4	00140000-556c-4fa9-ea01-81a42bba9407	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-4faa-07b6-ad8f80bd8a10
\.


--
-- TOC entry 2789 (class 0 OID 5690587)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556c-4faa-451f-0987b6fdb05d	000e0000-556c-4faa-f466-abecab560cbe	1	
00200000-556c-4faa-de10-9d6157df5757	000e0000-556c-4faa-f466-abecab560cbe	2	
\.


--
-- TOC entry 2804 (class 0 OID 5690712)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 5690781)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 5690619)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 5690886)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556c-4fa9-4839-474b1bac3ed7	Drama	drama (SURS 01)
00140000-556c-4fa9-4fb2-0e2d1bb733ab	Opera	opera (SURS 02)
00140000-556c-4fa9-3466-47f790a04bc2	Balet	balet (SURS 03)
00140000-556c-4fa9-1416-a619f6a305c9	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-4fa9-c1bf-f868e050297c	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-4fa9-ea01-81a42bba9407	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-4fa9-4b3a-43176c436bd2	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 5690771)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556c-4fa9-41a9-2773cef7d9cc	Opera	opera
00150000-556c-4fa9-33e5-8be6dcb43bee	Opereta	opereta
00150000-556c-4fa9-fea9-c2db0ca9456e	Balet	balet
00150000-556c-4fa9-2962-6764e8f6d04d	Plesne prireditve	plesne prireditve
00150000-556c-4fa9-80f4-57530e19c7f6	Lutkovno gledališče	lutkovno gledališče
00150000-556c-4fa9-edbd-7191d07e2080	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-4fa9-6865-0c5afab21c17	Biografska drama	biografska drama
00150000-556c-4fa9-0ad2-1344c1733cd9	Komedija	komedija
00150000-556c-4fa9-2165-a00b35362b60	Črna komedija	črna komedija
00150000-556c-4fa9-273e-87c643fc6fb4	E-igra	E-igra
00150000-556c-4fa9-020b-1521e8fb71f4	Kriminalka	kriminalka
00150000-556c-4fa9-357a-86f0a1ee3ff8	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 5690425)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 5690941)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 5690931)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 5690839)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5690609)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 5690634)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5690551)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 5690970)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5690767)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5690585)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5690628)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 5690565)
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
-- TOC entry 2456 (class 2606 OID 5690677)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5690704)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5690523)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5690434)
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
-- TOC entry 2371 (class 2606 OID 5690458)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5690414)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 5690399)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 5690710)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5690743)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 5690881)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5690487)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5690511)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5690683)
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
-- TOC entry 2386 (class 2606 OID 5690501)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5690572)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5690695)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 5690823)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 5690867)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 5690981)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 5691006)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 5690988)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5690727)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5690668)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5690659)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 5690861)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5690795)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5690370)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 5690734)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 5690388)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 5690408)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5690752)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5690690)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5690640)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 5691026)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 5691017)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 5691012)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 5690808)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 5690467)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 5690650)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 5690850)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 5691001)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5690536)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5690383)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 5690911)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5690594)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5690718)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5690786)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5690623)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 5690895)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 5690780)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 5690616)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 5690809)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 5690810)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 5690489)
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
-- TOC entry 2469 (class 1259 OID 5690711)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 5690697)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 5690696)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 5690595)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 5690768)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 5690770)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 5690769)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 5690567)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 5690566)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 5690883)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 5690884)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 5690885)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 5690916)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 5690913)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 5690915)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 5690914)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 5690538)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 5690537)
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
-- TOC entry 2369 (class 1259 OID 5690461)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 5690735)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 5690629)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5690415)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 5690416)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 5690755)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 5690754)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 5690753)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 5690573)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 5690575)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 5690574)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 5691019)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 5690663)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 5690661)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 5690660)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 5690662)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 5690389)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 5690390)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 5690719)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 5690684)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 5690796)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 5690797)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 5690971)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 5690973)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 5690972)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 5690503)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 5690502)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 5690504)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 5691007)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 5690824)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 5690825)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 5690945)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 5690944)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 5690947)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 5690943)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 5690946)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 5690787)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 5690672)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 5690671)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 5690669)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 5690670)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 5690933)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 5690932)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 5690982)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 5690586)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 5690436)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 5690435)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 5690468)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 5690469)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 5690653)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 5690652)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 5690651)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 5690990)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 5690989)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 5690618)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 5690614)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 5690611)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 5690612)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 5690610)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 5690615)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 5690613)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 5690488)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 5690552)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 5690554)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 5690553)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 5690555)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 5690678)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 5690882)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 5690912)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 5690459)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 5690460)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 5691027)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 5690524)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 5691018)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 5690729)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 5690728)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 5690942)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 5690512)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 5690868)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 5690869)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 5690409)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 5690617)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 5691169)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 5691154)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 5691159)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 5691179)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 5691149)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 5691174)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 5691164)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 5691324)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 5691329)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 5691084)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 5691264)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 5691259)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 5691254)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 5691144)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 5691294)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 5691304)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 5691299)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 5691119)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 5691114)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 5691244)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 5691349)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 5691354)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 5691359)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 5691379)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 5691364)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 5691374)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 5691369)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 5691109)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 5691104)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 5691069)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 5691064)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 5691274)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 5691184)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 5691044)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 5691049)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 5691289)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 5691284)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 5691279)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 5691124)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 5691134)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 5691129)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 5691454)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 5691219)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 5691209)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 5691204)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 5691214)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5691034)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 5691039)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 5691269)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 5691249)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 5691314)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 5691319)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 5691419)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 5691429)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 5691424)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 5691094)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 5691089)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 5691099)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 5691449)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 5691334)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 5691339)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 5691404)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 5691399)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 5691414)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 5691394)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 5691409)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 5691309)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 5691239)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 5691234)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 5691224)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 5691229)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 5691389)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 5691384)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 5691434)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 5691139)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 5691344)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 5691059)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 5691054)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 5691074)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 5691079)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 5691199)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 5691194)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 5691189)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 5691444)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 5691439)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-01 14:27:23 CEST

--
-- PostgreSQL database dump complete
--

