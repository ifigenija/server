--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 09:46:26 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 237 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6798118)
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
-- TOC entry 227 (class 1259 OID 6798639)
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
-- TOC entry 226 (class 1259 OID 6798622)
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
-- TOC entry 219 (class 1259 OID 6798527)
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
    letoizida date,
    krajizida date,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 6798297)
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
-- TOC entry 197 (class 1259 OID 6798331)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6798240)
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
-- TOC entry 228 (class 1259 OID 6798653)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(15,2) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
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
    tip character varying(20) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 6798457)
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
-- TOC entry 192 (class 1259 OID 6798277)
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
-- TOC entry 196 (class 1259 OID 6798325)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6798257)
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
-- TOC entry 202 (class 1259 OID 6798374)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6798399)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6798214)
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
-- TOC entry 181 (class 1259 OID 6798127)
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
-- TOC entry 182 (class 1259 OID 6798138)
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
-- TOC entry 177 (class 1259 OID 6798092)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6798111)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6798406)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6798437)
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
-- TOC entry 223 (class 1259 OID 6798573)
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
-- TOC entry 184 (class 1259 OID 6798171)
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
-- TOC entry 186 (class 1259 OID 6798206)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6798380)
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
-- TOC entry 185 (class 1259 OID 6798191)
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
-- TOC entry 191 (class 1259 OID 6798269)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6798392)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6798512)
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
-- TOC entry 222 (class 1259 OID 6798565)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6798679)
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
-- TOC entry 233 (class 1259 OID 6798726)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6798688)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id uuid NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    transportnistroski numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 231 (class 1259 OID 6798696)
-- Name: programrazno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programrazno (
    id uuid NOT NULL,
    program_dela_id uuid,
    nazivsklopa character varying(255) NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stpe integer DEFAULT 0 NOT NULL,
    soorganizator character varying(255) NOT NULL,
    stobiskovalcev integer DEFAULT 0 NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    sthonoranih integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 6798421)
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
-- TOC entry 201 (class 1259 OID 6798365)
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
-- TOC entry 200 (class 1259 OID 6798355)
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
-- TOC entry 221 (class 1259 OID 6798554)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6798489)
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
-- TOC entry 174 (class 1259 OID 6798063)
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
-- TOC entry 173 (class 1259 OID 6798061)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6798431)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6798101)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6798085)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6798445)
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
-- TOC entry 204 (class 1259 OID 6798386)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6798336)
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
-- TOC entry 236 (class 1259 OID 6798745)
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
-- TOC entry 235 (class 1259 OID 6798737)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6798732)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6798499)
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
-- TOC entry 183 (class 1259 OID 6798163)
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
-- TOC entry 199 (class 1259 OID 6798342)
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
-- TOC entry 220 (class 1259 OID 6798543)
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
-- TOC entry 232 (class 1259 OID 6798715)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(15,2) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 6798226)
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
-- TOC entry 175 (class 1259 OID 6798072)
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
-- TOC entry 225 (class 1259 OID 6798600)
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
-- TOC entry 193 (class 1259 OID 6798288)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6798413)
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
-- TOC entry 215 (class 1259 OID 6798482)
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
-- TOC entry 195 (class 1259 OID 6798320)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6798590)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6798472)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6798066)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2797 (class 0 OID 6798118)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6798639)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5577-eb52-df2b-2ffe54be9fa0	000d0000-5577-eb52-1466-c61e1e15cae6	\N	00090000-5577-eb52-f362-6125a698025a	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-eb52-aaf5-524f3090acb4	000d0000-5577-eb52-7c21-37fdd12fa24c	\N	00090000-5577-eb52-abb6-637eaa97eb6f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-eb52-b659-e36688da9efd	000d0000-5577-eb52-9222-2e98d9d36669	\N	00090000-5577-eb52-10c2-edc75449deaa	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-eb52-3953-d1c06fd6a52f	000d0000-5577-eb52-2bb3-1011d7fbac0c	\N	00090000-5577-eb52-b4e5-da7eaf8423e4	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-eb52-9a0c-5600afe2ccce	000d0000-5577-eb52-9c4a-6d9190bd5a4e	\N	00090000-5577-eb52-ec17-3eecc694bab1	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-eb52-39cd-e6d8343e81bf	000d0000-5577-eb52-a1e2-8d8d07f70bf9	\N	00090000-5577-eb52-abb6-637eaa97eb6f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 6798622)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6798527)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5577-eb52-902b-ad10d150d981	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5577-eb52-98e8-cbbe6f683fad	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5577-eb52-3536-be63be75ae08	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2811 (class 0 OID 6798297)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5577-eb52-13c7-7a9fa85c0737	\N	\N	00200000-5577-eb52-cb86-768fde2cc7ff	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5577-eb52-de37-d9ac5ab8aae9	\N	\N	00200000-5577-eb52-7d25-72b0d8b3ea3c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5577-eb52-f490-aacfce42380b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5577-eb52-dca9-c0dbff86ee71	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5577-eb52-fb16-ed6261fe9262	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2814 (class 0 OID 6798331)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6798240)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5577-eb50-e2f4-f2fe9fecbdf6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5577-eb50-fbaf-67fabebca0fc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5577-eb50-850f-6addb763a4ac	AL	ALB	008	Albania 	Albanija	\N
00040000-5577-eb50-d520-fb30a265d637	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5577-eb50-55e7-0ac85e5ad1f1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5577-eb50-23f2-bdfeac352aee	AD	AND	020	Andorra 	Andora	\N
00040000-5577-eb50-bfe4-e8ddf201b3c8	AO	AGO	024	Angola 	Angola	\N
00040000-5577-eb50-5302-63cf48b99f7d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5577-eb50-9943-eb931bff1c7f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5577-eb50-79ba-0ba92a18a0b7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5577-eb50-20c8-3be7e9f30237	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5577-eb50-2090-df3d28c36106	AM	ARM	051	Armenia 	Armenija	\N
00040000-5577-eb50-7c67-2beaad094580	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5577-eb50-64ca-f493b4406c18	AU	AUS	036	Australia 	Avstralija	\N
00040000-5577-eb50-3f8b-d8665408883a	AT	AUT	040	Austria 	Avstrija	\N
00040000-5577-eb50-a898-9637193e2ed7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5577-eb50-d214-4179ac554923	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5577-eb50-72ce-a71532e0a129	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5577-eb50-cc16-73f6576b426e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5577-eb50-0bf8-022008e0e6ab	BB	BRB	052	Barbados 	Barbados	\N
00040000-5577-eb50-88e3-311e1117b441	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5577-eb50-f507-25df776e043f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5577-eb50-7b19-f6443953bcf1	BZ	BLZ	084	Belize 	Belize	\N
00040000-5577-eb50-74da-6c2cffc610ad	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5577-eb50-00c3-94afa11e33b3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5577-eb50-f973-8686a3839057	BT	BTN	064	Bhutan 	Butan	\N
00040000-5577-eb50-b66d-65db3ea0fff9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5577-eb50-68f8-0accd4bc40da	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5577-eb50-5239-89e061cd0e03	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5577-eb50-d379-c06fcd6a5ddb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5577-eb50-0c99-7716ccb82882	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5577-eb50-95e7-3a5dd6025205	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5577-eb50-b1fb-3b67295ba3c8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5577-eb50-dc1b-402e65929c94	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5577-eb50-2b00-aa360b3986c4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5577-eb50-f034-c34e725130ee	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5577-eb50-e065-7f650bff1085	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5577-eb50-ed91-fb0f5136d478	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5577-eb50-8ff6-64377c8abdaa	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5577-eb50-a6c9-a89a147bae4c	CA	CAN	124	Canada 	Kanada	\N
00040000-5577-eb50-110e-69252615022c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5577-eb50-d866-03276a408e69	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5577-eb50-1dcd-985a2c599046	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5577-eb50-7a2c-310f8d6da21e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5577-eb50-8cf1-39630a2f1dac	CL	CHL	152	Chile 	Čile	\N
00040000-5577-eb50-76e4-47ff114b179e	CN	CHN	156	China 	Kitajska	\N
00040000-5577-eb50-5367-3d3ff1d782de	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5577-eb50-e696-d4b9971d3d4e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5577-eb50-5bfc-539bb957e9a2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5577-eb50-6ca7-2a73e299b7e9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5577-eb50-b23c-d887f3003998	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5577-eb50-eee1-22ccc2800c26	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5577-eb50-2aac-7b7436b07257	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5577-eb50-6d14-c60898df2db4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5577-eb50-e465-90d0c869ed04	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5577-eb50-feae-4b11ca31412d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5577-eb50-39bb-800c84402a7d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5577-eb50-2d76-9ad7fa9c1b9b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5577-eb50-5334-9461e5a5b7b6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5577-eb50-d6a2-dc6cd9aa7c1e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5577-eb50-a069-04c95a67bcfe	DK	DNK	208	Denmark 	Danska	\N
00040000-5577-eb50-7a9a-4f84d6258181	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5577-eb50-bbf4-8dd9bef699ab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5577-eb50-be5d-e10f7c63cb62	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5577-eb50-dbb8-369072e7f0ae	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5577-eb50-e77e-b1d7f4ac8726	EG	EGY	818	Egypt 	Egipt	\N
00040000-5577-eb50-122b-3f52c21c37aa	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5577-eb50-7167-bfa70ac0f4e9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5577-eb50-a0b6-eb09a37d7f62	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5577-eb50-50e8-9cdd027ea8ee	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5577-eb50-32e7-93cd3b7dad06	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5577-eb50-a9af-07ed3be66b1f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5577-eb50-3099-65f22a8ce1d0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5577-eb50-be23-977919168ecb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5577-eb50-eed3-4ed22b6ea843	FI	FIN	246	Finland 	Finska	\N
00040000-5577-eb50-817b-6a350ddc74d8	FR	FRA	250	France 	Francija	\N
00040000-5577-eb50-8812-68507761d5e0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5577-eb51-7915-ea0013c8094b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5577-eb50-4445-5fd7f8740e25	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5577-eb50-88da-8a9e3963a575	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5577-eb50-b702-9c3779353090	GA	GAB	266	Gabon 	Gabon	\N
00040000-5577-eb50-d849-133fb8e1acf8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5577-eb50-e4bf-353e53543ff3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5577-eb50-a9ad-ed78f6ab7649	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5577-eb50-f909-4b1e5c995dfe	GH	GHA	288	Ghana 	Gana	\N
00040000-5577-eb50-280b-3fcf7af9f299	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5577-eb50-2f70-ad754549cfd9	GR	GRC	300	Greece 	Grčija	\N
00040000-5577-eb50-6e49-11b24f2f73a8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5577-eb50-1f86-b431a42d7976	GD	GRD	308	Grenada 	Grenada	\N
00040000-5577-eb50-6c27-af1ab20f5f6a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5577-eb50-06a6-26d7e33f50e5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5577-eb50-4002-f84cff1a6a83	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5577-eb50-6b60-62621624901a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5577-eb50-058d-9641d75c0f35	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5577-eb50-460a-3c06f4a5ff68	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5577-eb50-6d93-71e762957d10	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5577-eb50-6805-8facc1f8f684	HT	HTI	332	Haiti 	Haiti	\N
00040000-5577-eb50-19b1-203599573b14	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5577-eb50-f779-48f9d6394a53	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5577-eb50-e2a8-f83a0d109271	HN	HND	340	Honduras 	Honduras	\N
00040000-5577-eb50-36f5-c3b6bde76822	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5577-eb50-67d0-af201c357b3d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5577-eb50-0f96-e9d955c16a74	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5577-eb50-d865-6ec2bc003aaa	IN	IND	356	India 	Indija	\N
00040000-5577-eb50-f597-e93bdebbe06a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5577-eb50-c4c2-41dc7024c8f4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5577-eb50-359c-187ecd33a984	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5577-eb50-4da1-65ad6283e9a9	IE	IRL	372	Ireland 	Irska	\N
00040000-5577-eb50-2a59-9a7595b95cc0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5577-eb50-fce2-de5f5b61d135	IL	ISR	376	Israel 	Izrael	\N
00040000-5577-eb50-d933-282ae666f3c6	IT	ITA	380	Italy 	Italija	\N
00040000-5577-eb50-ab75-6728b5b72992	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5577-eb50-539a-864dc151e80d	JP	JPN	392	Japan 	Japonska	\N
00040000-5577-eb50-33a5-6490ae4e0b8e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5577-eb50-5779-87afeea4189f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5577-eb50-6891-df91dd17d5b6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5577-eb50-c0e2-1b7ed0b1a893	KE	KEN	404	Kenya 	Kenija	\N
00040000-5577-eb50-f0b3-8e0c769acd6e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5577-eb51-252a-450078e2dc11	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5577-eb51-ec66-b8ed15205793	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5577-eb51-60a9-1ae2727df0bf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5577-eb51-aabe-fccb378aa4f2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5577-eb51-ef37-0a7e718860b9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5577-eb51-f30a-0707caec2011	LV	LVA	428	Latvia 	Latvija	\N
00040000-5577-eb51-4d94-caff38f1a280	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5577-eb51-c389-3c6dd03363b4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5577-eb51-45ae-5dbceb94120a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5577-eb51-e52f-eea12c2d40e0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5577-eb51-cdf5-c7e3a9986c3e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5577-eb51-47ef-c3b71136b0f1	LT	LTU	440	Lithuania 	Litva	\N
00040000-5577-eb51-d44b-a212521963b2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5577-eb51-4747-37273fcfbf97	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5577-eb51-6b47-6b1fb8698295	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5577-eb51-1bf2-8c75629a4cef	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5577-eb51-710c-37379fcdc337	MW	MWI	454	Malawi 	Malavi	\N
00040000-5577-eb51-fa51-fdf9d05aff02	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5577-eb51-5943-fb69addb0998	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5577-eb51-7b14-600a283c72af	ML	MLI	466	Mali 	Mali	\N
00040000-5577-eb51-9f1a-529359bc6501	MT	MLT	470	Malta 	Malta	\N
00040000-5577-eb51-b37c-a7920510b7f8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5577-eb51-b0ec-0ca98b1aa0a2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5577-eb51-d9f8-15b446a4623a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5577-eb51-8c29-de35f9ce26e4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5577-eb51-dc13-0f4c03f2b8fb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5577-eb51-1e04-daebb097a348	MX	MEX	484	Mexico 	Mehika	\N
00040000-5577-eb51-dddd-dba076ee4f61	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5577-eb51-a9dc-a48c8f2a6cf9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5577-eb51-7a87-fa309d27fac2	MC	MCO	492	Monaco 	Monako	\N
00040000-5577-eb51-b0c8-05182e0f307d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5577-eb51-54db-9ad631a4e5e6	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5577-eb51-7813-5ae8a0fa5d73	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5577-eb51-046b-c31921f4a1c7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5577-eb51-2da2-c5bfe2778648	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5577-eb51-428e-233cd7411bd3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5577-eb51-6496-0d27b267988c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5577-eb51-5e6d-9b4928a0e5ac	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5577-eb51-1245-064bb46a7fb3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5577-eb51-9e9c-8573cae12496	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5577-eb51-2f28-4280f1a45957	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5577-eb51-c497-87e5ca233324	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5577-eb51-dcda-009eb692e4eb	NE	NER	562	Niger 	Niger 	\N
00040000-5577-eb51-5a8d-94cef26b8ab4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5577-eb51-940a-953b858fe39b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5577-eb51-a436-e75c32031c7b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5577-eb51-7fe0-0cb44af2a6ee	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5577-eb51-69bb-312eea8e5e58	NO	NOR	578	Norway 	Norveška	\N
00040000-5577-eb51-dc4d-b0df5a4d7142	OM	OMN	512	Oman 	Oman	\N
00040000-5577-eb51-f487-e66bfead850e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5577-eb51-2caf-e6d3ecd964b1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5577-eb51-02cf-6b3b337ec435	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5577-eb51-e9a6-188d3224f6e2	PA	PAN	591	Panama 	Panama	\N
00040000-5577-eb51-5fa1-8f30f7dc39c7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5577-eb51-57a4-d43a6871dc43	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5577-eb51-161d-642a2eb0fc4e	PE	PER	604	Peru 	Peru	\N
00040000-5577-eb51-379c-90e4ef66ab90	PH	PHL	608	Philippines 	Filipini	\N
00040000-5577-eb51-cd99-29444f1bda14	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5577-eb51-6d87-0a618c2d8355	PL	POL	616	Poland 	Poljska	\N
00040000-5577-eb51-fc73-94edcb821446	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5577-eb51-ad1b-0207751a46f6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5577-eb51-1109-27872e4688d6	QA	QAT	634	Qatar 	Katar	\N
00040000-5577-eb51-6be6-b8df236b6c6d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5577-eb51-e3cd-f0beb96bbc31	RO	ROU	642	Romania 	Romunija	\N
00040000-5577-eb51-9e93-b6b541a4fa36	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5577-eb51-8630-26fc26e44c7b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5577-eb51-7aea-ee689f57c1a4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5577-eb51-8cce-61aab045fd94	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5577-eb51-8e8d-d9a92011ba76	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5577-eb51-318e-15d60f7926e3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5577-eb51-8d9e-02d99ab4f0bf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5577-eb51-b953-032b990d9445	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5577-eb51-bd52-10723ce550f5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5577-eb51-6559-f6cdd825759a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5577-eb51-7436-23bb5a256ece	SM	SMR	674	San Marino 	San Marino	\N
00040000-5577-eb51-f005-1232bc22ac5e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5577-eb51-6a4d-a59ed1162a8f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5577-eb51-80d4-d8c455248a90	SN	SEN	686	Senegal 	Senegal	\N
00040000-5577-eb51-12c9-72b1553f1676	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5577-eb51-6ac8-cb7dd4469fa7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5577-eb51-fd7b-d3b04e3b6600	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5577-eb51-4596-6de3876680cd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5577-eb51-5ce9-25dde25dd54b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5577-eb51-1524-567a8ee85506	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5577-eb51-90ac-d50ae848eed1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5577-eb51-6800-b58ec2cfc9bd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5577-eb51-9119-68569ef79bc5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5577-eb51-14f5-9235deb446bb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5577-eb51-746c-b610c0fef29a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5577-eb51-c5ce-589607c6570d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5577-eb51-4500-43c0f0979a37	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5577-eb51-94d0-3bc57d1f069a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5577-eb51-6a34-278bf459b863	SD	SDN	729	Sudan 	Sudan	\N
00040000-5577-eb51-d42a-2706c700bf16	SR	SUR	740	Suriname 	Surinam	\N
00040000-5577-eb51-27f9-8bc886078f34	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5577-eb51-e3b7-7237de6724d6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5577-eb51-442e-c042d2c60196	SE	SWE	752	Sweden 	Švedska	\N
00040000-5577-eb51-bfa2-a12522c4f2d0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5577-eb51-31b2-5fd039ff7255	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5577-eb51-a65d-062a7b5e1aff	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5577-eb51-6af6-502fe2edc6c9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5577-eb51-6038-90922121a890	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5577-eb51-1189-ffe4e2dde11c	TH	THA	764	Thailand 	Tajska	\N
00040000-5577-eb51-8daf-a07f2ede6589	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5577-eb51-f29a-0fe490255ce0	TG	TGO	768	Togo 	Togo	\N
00040000-5577-eb51-554f-4a8074c8f05d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5577-eb51-a4fd-8f97a37b783c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5577-eb51-431c-546e72591978	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5577-eb51-76e5-a8db40de0871	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5577-eb51-47f4-ee2e3d7193bf	TR	TUR	792	Turkey 	Turčija	\N
00040000-5577-eb51-1b69-9f49c3857348	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5577-eb51-bcde-1b42d9c60a60	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5577-eb51-1ba8-4ea6eadc50c5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5577-eb51-ed09-89dc32331ca8	UG	UGA	800	Uganda 	Uganda	\N
00040000-5577-eb51-48b5-36a3b9cb7fb8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5577-eb51-bf3d-eaa03f814dfb	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5577-eb51-8ad3-e5fd699febf3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5577-eb51-07b2-eb4b63723da0	US	USA	840	United States 	Združene države Amerike	\N
00040000-5577-eb51-a435-c2018d414102	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5577-eb51-9b4c-6609fcb25429	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5577-eb51-daa9-3201847121d5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5577-eb51-d3db-e8bc5d668d50	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5577-eb51-bb4a-b610a93288e8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5577-eb51-caea-bb9e7b287419	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5577-eb51-a8a2-1e4cff356d42	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5577-eb51-748e-e3b2bc6f351b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5577-eb51-08a0-f5d4e5b80c0e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5577-eb51-23b2-8ece758d3ee4	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5577-eb51-dced-a38eda94f1fb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5577-eb51-aec7-5f1a529639d0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5577-eb51-7145-65bab1bca57b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2845 (class 0 OID 6798653)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6798457)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5577-eb52-aab1-e78f3c05e9ba	000e0000-5577-eb52-b7a7-231c260d978b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5577-eb50-3493-ef66a964ed36
000d0000-5577-eb52-1466-c61e1e15cae6	000e0000-5577-eb52-b7a7-231c260d978b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5577-eb50-3493-ef66a964ed36
000d0000-5577-eb52-7c21-37fdd12fa24c	000e0000-5577-eb52-b7a7-231c260d978b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5577-eb50-1630-ebb01576ca0b
000d0000-5577-eb52-9222-2e98d9d36669	000e0000-5577-eb52-b7a7-231c260d978b	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5577-eb50-2a63-2ba6f9bb7319
000d0000-5577-eb52-2bb3-1011d7fbac0c	000e0000-5577-eb52-b7a7-231c260d978b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5577-eb50-2a63-2ba6f9bb7319
000d0000-5577-eb52-9c4a-6d9190bd5a4e	000e0000-5577-eb52-b7a7-231c260d978b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5577-eb50-2a63-2ba6f9bb7319
000d0000-5577-eb52-a1e2-8d8d07f70bf9	000e0000-5577-eb52-b7a7-231c260d978b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5577-eb50-3493-ef66a964ed36
\.


--
-- TOC entry 2809 (class 0 OID 6798277)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6798325)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6798257)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5577-eb52-1c68-cba7b1fb7992	00080000-5577-eb52-f639-a2c9290ba980	00090000-5577-eb52-f362-6125a698025a	AK		
\.


--
-- TOC entry 2787 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6798374)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6798399)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6798214)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5577-eb51-ac46-90ede7e7d11d	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5577-eb51-c125-949314a24f84	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5577-eb51-2d0a-1e67e144ce34	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5577-eb51-fcc0-7504da3879b2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5577-eb51-94c4-5b2f850e6f2e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5577-eb51-58e2-5d5cee05a3ef	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5577-eb51-fe70-34d3f74d4549	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5577-eb51-1159-63fe05d3c038	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5577-eb51-ee03-1180ff8a1416	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5577-eb51-5b50-f8363b7ce68a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5577-eb51-c690-c13e8a9f18b4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5577-eb51-9298-7ccf99ce9215	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5577-eb51-75b1-3e2e6099dcc5	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5577-eb51-24ad-732f32b9d332	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5577-eb51-3da3-e350857d3f58	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5577-eb51-e44c-0d43c6d8dd54	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2798 (class 0 OID 6798127)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5577-eb51-c840-19bd78e8914b	00000000-5577-eb51-94c4-5b2f850e6f2e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5577-eb51-a4f9-b73414230567	00000000-5577-eb51-94c4-5b2f850e6f2e	00010000-5577-eb51-9cea-a594e5159260	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5577-eb51-aba8-2bb9bc52a9e4	00000000-5577-eb51-58e2-5d5cee05a3ef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2799 (class 0 OID 6798138)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5577-eb52-b015-7478d8ab73e3	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5577-eb52-b4e5-da7eaf8423e4	00010000-5577-eb52-8f96-c507dc905826	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5577-eb52-10c2-edc75449deaa	00010000-5577-eb52-bd43-6098a53031c6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5577-eb52-65f3-8f200cc82d2c	00010000-5577-eb52-79ad-7e18f454aa1f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5577-eb52-3b98-f96404a1b1cc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5577-eb52-e6b8-ff820085a329	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5577-eb52-86f6-6ba5a6d94a94	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5577-eb52-9a11-ad3d1ee957dd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5577-eb52-f362-6125a698025a	00010000-5577-eb52-a92f-40b3a5b7bb6f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5577-eb52-abb6-637eaa97eb6f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5577-eb52-d0ce-ab9c32d04547	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5577-eb52-ec17-3eecc694bab1	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5577-eb52-3d3c-55b73ffe4cb8	00010000-5577-eb52-7754-e66f2e48d287	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2789 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6798092)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5577-eb51-5582-a80e79393fc6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5577-eb51-2bfd-ca4c04b66baf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5577-eb51-a2a7-77cf04c09916	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5577-eb51-edd0-f92f08cf2d2c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5577-eb51-d804-54e5a673a1bc	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5577-eb51-ce76-eda992bfa320	Abonma-read	Abonma - branje	f
00030000-5577-eb51-231f-7b4bc782d153	Abonma-write	Abonma - spreminjanje	f
00030000-5577-eb51-d35a-179eb8ea6f94	Alternacija-read	Alternacija - branje	f
00030000-5577-eb51-42da-ddb5fdbe8d1c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5577-eb51-42fb-ca94ae1c5687	Arhivalija-read	Arhivalija - branje	f
00030000-5577-eb51-3c21-294aa01033ec	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5577-eb51-12a6-dd9b7dacf135	Besedilo-read	Besedilo - branje	f
00030000-5577-eb51-821d-5db48c48f949	Besedilo-write	Besedilo - spreminjanje	f
00030000-5577-eb51-885f-7dc0a711b7e9	DogodekIzven-read	DogodekIzven - branje	f
00030000-5577-eb51-b0c7-e7a58470ba58	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5577-eb51-e645-4934e5c961c4	Dogodek-read	Dogodek - branje	f
00030000-5577-eb51-0681-fe6c3c2d3d2f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5577-eb51-fc13-85678079c704	Drzava-read	Drzava - branje	f
00030000-5577-eb51-d261-d06112362e60	Drzava-write	Drzava - spreminjanje	f
00030000-5577-eb51-1f16-45b4469fecdd	Funkcija-read	Funkcija - branje	f
00030000-5577-eb51-cb2b-455dc32b5e24	Funkcija-write	Funkcija - spreminjanje	f
00030000-5577-eb51-4219-bea6252e8a8e	Gostovanje-read	Gostovanje - branje	f
00030000-5577-eb51-8f45-9275521ece0c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5577-eb51-9a1d-dd5c5f90a619	Gostujoca-read	Gostujoca - branje	f
00030000-5577-eb51-7b5b-02fc11b54540	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5577-eb51-0a73-ef43cf4e8f25	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5577-eb51-8eb7-2693dedd7727	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5577-eb51-ce6e-0f2d55999644	Kupec-read	Kupec - branje	f
00030000-5577-eb51-ed38-e666d8f1389f	Kupec-write	Kupec - spreminjanje	f
00030000-5577-eb51-4a6c-cd1781d60ea1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5577-eb51-52c8-cbd42ca8247f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5577-eb51-df83-a080c797e8bc	Option-read	Option - branje	f
00030000-5577-eb51-bec0-f55f159df809	Option-write	Option - spreminjanje	f
00030000-5577-eb51-ac61-957b20e0205b	OptionValue-read	OptionValue - branje	f
00030000-5577-eb51-ad43-c6f778f6427e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5577-eb51-307b-5b4cba69eca6	Oseba-read	Oseba - branje	f
00030000-5577-eb51-16f9-c19b8e168306	Oseba-write	Oseba - spreminjanje	f
00030000-5577-eb51-5a6d-46b2522645e7	Permission-read	Permission - branje	f
00030000-5577-eb51-5faf-0a0f2afe9380	Permission-write	Permission - spreminjanje	f
00030000-5577-eb51-2bb2-5541f6fc2ebc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5577-eb51-cbe3-529165343ea2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5577-eb51-2dc9-8f0ad90d097a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5577-eb51-d671-336f00139b0a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5577-eb51-2ccb-e39a191b12eb	Pogodba-read	Pogodba - branje	f
00030000-5577-eb51-3c8b-ae118daaa83a	Pogodba-write	Pogodba - spreminjanje	f
00030000-5577-eb51-b193-eb1f0135252f	Popa-read	Popa - branje	f
00030000-5577-eb51-2dbe-009e4ebe90c4	Popa-write	Popa - spreminjanje	f
00030000-5577-eb51-20ac-2a5e431bf9ec	Posta-read	Posta - branje	f
00030000-5577-eb51-dab4-9e73453cd1c9	Posta-write	Posta - spreminjanje	f
00030000-5577-eb51-a0cf-8a69ac236fa2	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5577-eb51-3bc1-bb183cf4ec39	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5577-eb51-f0dd-ee21b41df08b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5577-eb51-c4a6-39f5ad50309c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5577-eb51-3d02-4c9e0b0ac9e1	Predstava-read	Predstava - branje	f
00030000-5577-eb51-4196-3407b5bd6118	Predstava-write	Predstava - spreminjanje	f
00030000-5577-eb51-8b21-f1b42dec9fcb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5577-eb51-fbc0-c6dd40de8e6a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5577-eb51-084f-f9d14c3262c9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5577-eb51-ada5-c077718ec293	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5577-eb51-05a9-3869d044fce7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5577-eb51-86fd-e0606d36d6b9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5577-eb51-59e5-2d779f30a6a7	ProgramDela-read	ProgramDela - branje	f
00030000-5577-eb51-0967-6ffbc4f8d2c8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5577-eb51-5380-6f48e204f893	ProgramFestival-read	ProgramFestival - branje	f
00030000-5577-eb51-de44-5cc2d6b79e3c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5577-eb51-ad7e-1b60b2c5e76c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5577-eb51-cdb8-6265a3828854	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5577-eb51-d534-2cb3548a0fa0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5577-eb51-39c7-39ed64475aed	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5577-eb51-f471-98d212bd9d97	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5577-eb51-2443-d45852ae5385	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5577-eb51-92fd-10b4059c14eb	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5577-eb51-df25-29661073207d	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5577-eb51-f62b-b463a5a5cac9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5577-eb51-e698-193a06bf3451	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5577-eb51-7083-f6b2d9aebdcb	Prostor-read	Prostor - branje	f
00030000-5577-eb51-ffcf-dd82c425ed87	Prostor-write	Prostor - spreminjanje	f
00030000-5577-eb51-40cc-56ce1645551d	Racun-read	Racun - branje	f
00030000-5577-eb51-8862-316647e2050d	Racun-write	Racun - spreminjanje	f
00030000-5577-eb51-8f21-05d45e9f2490	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5577-eb51-a071-cc10b5101ca2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5577-eb51-4c18-9a0a38a84505	Readme-read	Readme - branje	f
00030000-5577-eb51-2ad5-e0573d9c580b	Readme-write	Readme - spreminjanje	f
00030000-5577-eb51-d1ad-575ec502d6c9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5577-eb51-72b2-86080826732c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5577-eb51-8bdf-22cd8893ed50	Rekvizit-read	Rekvizit - branje	f
00030000-5577-eb51-55f8-a95708096591	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5577-eb51-eee9-646e723acdaf	Revizija-read	Revizija - branje	f
00030000-5577-eb51-09e8-d7b71725c239	Revizija-write	Revizija - spreminjanje	f
00030000-5577-eb51-d085-93d39ad3bb3a	Rezervacija-read	Rezervacija - branje	f
00030000-5577-eb51-169f-f34380e01e5f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5577-eb51-efb2-3d376866357b	Role-read	Role - branje	f
00030000-5577-eb51-a0a1-c6d4d49495c7	Role-write	Role - spreminjanje	f
00030000-5577-eb51-2b15-07b437e66a34	SedezniRed-read	SedezniRed - branje	f
00030000-5577-eb51-1e0d-63dcfd781e33	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5577-eb51-9793-55f9ece559d8	Sedez-read	Sedez - branje	f
00030000-5577-eb51-470a-0f015e083fe1	Sedez-write	Sedez - spreminjanje	f
00030000-5577-eb51-577e-f2ad582a33d8	Sezona-read	Sezona - branje	f
00030000-5577-eb51-eaf8-59adc431197f	Sezona-write	Sezona - spreminjanje	f
00030000-5577-eb51-d64b-ba315adddb59	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5577-eb51-6cac-d2dd60f5ba2c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5577-eb51-5d71-141721888213	Stevilcenje-read	Stevilcenje - branje	f
00030000-5577-eb51-0305-1d8a60503c4a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5577-eb51-41a9-9d2430f8aff5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5577-eb51-0387-ee556e8cd4b1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5577-eb51-e4ba-839fd7a65cea	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5577-eb51-c139-8c749378962d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5577-eb51-b68b-8c633c08e251	Telefonska-read	Telefonska - branje	f
00030000-5577-eb51-fc22-0ba42ac36305	Telefonska-write	Telefonska - spreminjanje	f
00030000-5577-eb51-cfda-ef6f2d30f0fe	TerminStoritve-read	TerminStoritve - branje	f
00030000-5577-eb51-7109-fdd6e6d788b7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5577-eb51-7431-d7008664f7fc	TipFunkcije-read	TipFunkcije - branje	f
00030000-5577-eb51-97ce-3b2612739aa4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5577-eb51-314f-9b5dd8495a73	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5577-eb51-6b96-8638dfac316e	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5577-eb51-72ed-0ad7bd02e64e	Trr-read	Trr - branje	f
00030000-5577-eb51-e4ec-0d4e8b6fc1fb	Trr-write	Trr - spreminjanje	f
00030000-5577-eb51-8a43-e9b5193fb669	Uprizoritev-read	Uprizoritev - branje	f
00030000-5577-eb51-85f7-3f4d1f4fc49d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5577-eb51-8110-9d26322f788c	User-read	User - branje	f
00030000-5577-eb51-4d60-3599c9840f6d	User-write	User - spreminjanje	f
00030000-5577-eb51-8fd5-065a6e67212d	Vaja-read	Vaja - branje	f
00030000-5577-eb51-d834-d7d622258b70	Vaja-write	Vaja - spreminjanje	f
00030000-5577-eb51-02c7-0a6f2e5152fb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5577-eb51-53b9-74e0ae4a7f75	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5577-eb51-e32f-94965ef9861e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5577-eb51-ee92-fd28d48ea780	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5577-eb51-ccf6-d5d003bb873b	Zasedenost-read	Zasedenost - branje	f
00030000-5577-eb51-fd19-318ca56a21f9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5577-eb51-fc56-f27e6b8c058b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5577-eb51-1b45-c919baa3d533	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5577-eb51-c1a3-ab828fb89f9c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5577-eb51-b0d7-9d5a6a4c4de4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2796 (class 0 OID 6798111)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5577-eb51-fb49-3f3380811b3b	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-ce76-eda992bfa320
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-231f-7b4bc782d153
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-d35a-179eb8ea6f94
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-42da-ddb5fdbe8d1c
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-42fb-ca94ae1c5687
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-e645-4934e5c961c4
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-edd0-f92f08cf2d2c
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-0681-fe6c3c2d3d2f
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-d261-d06112362e60
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-1f16-45b4469fecdd
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-cb2b-455dc32b5e24
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-4219-bea6252e8a8e
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-8f45-9275521ece0c
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-9a1d-dd5c5f90a619
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-7b5b-02fc11b54540
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-0a73-ef43cf4e8f25
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-8eb7-2693dedd7727
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-df83-a080c797e8bc
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-ac61-957b20e0205b
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-307b-5b4cba69eca6
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-16f9-c19b8e168306
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-b193-eb1f0135252f
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-2dbe-009e4ebe90c4
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-20ac-2a5e431bf9ec
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-dab4-9e73453cd1c9
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-f0dd-ee21b41df08b
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-c4a6-39f5ad50309c
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-3d02-4c9e0b0ac9e1
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-4196-3407b5bd6118
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-05a9-3869d044fce7
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-86fd-e0606d36d6b9
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-7083-f6b2d9aebdcb
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-ffcf-dd82c425ed87
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-d1ad-575ec502d6c9
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-72b2-86080826732c
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-8bdf-22cd8893ed50
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-55f8-a95708096591
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-577e-f2ad582a33d8
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-eaf8-59adc431197f
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-7431-d7008664f7fc
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-8a43-e9b5193fb669
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-85f7-3f4d1f4fc49d
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-8fd5-065a6e67212d
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-d834-d7d622258b70
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-ccf6-d5d003bb873b
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-fd19-318ca56a21f9
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-fc56-f27e6b8c058b
00020000-5577-eb51-c57d-90af5243bd92	00030000-5577-eb51-c1a3-ab828fb89f9c
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-ce76-eda992bfa320
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-42fb-ca94ae1c5687
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-e645-4934e5c961c4
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-4219-bea6252e8a8e
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-9a1d-dd5c5f90a619
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-0a73-ef43cf4e8f25
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-8eb7-2693dedd7727
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-df83-a080c797e8bc
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-ac61-957b20e0205b
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-307b-5b4cba69eca6
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-16f9-c19b8e168306
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-b193-eb1f0135252f
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-20ac-2a5e431bf9ec
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-f0dd-ee21b41df08b
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-c4a6-39f5ad50309c
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-3d02-4c9e0b0ac9e1
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-7083-f6b2d9aebdcb
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-d1ad-575ec502d6c9
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-8bdf-22cd8893ed50
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-577e-f2ad582a33d8
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-b68b-8c633c08e251
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-fc22-0ba42ac36305
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-72ed-0ad7bd02e64e
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-e4ec-0d4e8b6fc1fb
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-e32f-94965ef9861e
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-ee92-fd28d48ea780
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-fc56-f27e6b8c058b
00020000-5577-eb51-7d69-45958abb778b	00030000-5577-eb51-c1a3-ab828fb89f9c
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-ce76-eda992bfa320
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-d35a-179eb8ea6f94
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-42fb-ca94ae1c5687
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-3c21-294aa01033ec
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-12a6-dd9b7dacf135
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-885f-7dc0a711b7e9
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-e645-4934e5c961c4
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-1f16-45b4469fecdd
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-4219-bea6252e8a8e
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-9a1d-dd5c5f90a619
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-0a73-ef43cf4e8f25
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-df83-a080c797e8bc
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-ac61-957b20e0205b
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-307b-5b4cba69eca6
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-b193-eb1f0135252f
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-20ac-2a5e431bf9ec
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-3d02-4c9e0b0ac9e1
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-05a9-3869d044fce7
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-7083-f6b2d9aebdcb
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-d1ad-575ec502d6c9
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-8bdf-22cd8893ed50
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-577e-f2ad582a33d8
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-7431-d7008664f7fc
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-8fd5-065a6e67212d
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-ccf6-d5d003bb873b
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-fc56-f27e6b8c058b
00020000-5577-eb51-602b-319fc2631e41	00030000-5577-eb51-c1a3-ab828fb89f9c
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-ce76-eda992bfa320
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-231f-7b4bc782d153
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-42da-ddb5fdbe8d1c
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-42fb-ca94ae1c5687
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-e645-4934e5c961c4
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-4219-bea6252e8a8e
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-9a1d-dd5c5f90a619
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-df83-a080c797e8bc
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-ac61-957b20e0205b
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-b193-eb1f0135252f
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-20ac-2a5e431bf9ec
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-3d02-4c9e0b0ac9e1
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-7083-f6b2d9aebdcb
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-d1ad-575ec502d6c9
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-8bdf-22cd8893ed50
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-577e-f2ad582a33d8
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-7431-d7008664f7fc
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-fc56-f27e6b8c058b
00020000-5577-eb51-cd01-a931b7f3f908	00030000-5577-eb51-c1a3-ab828fb89f9c
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-ce76-eda992bfa320
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-42fb-ca94ae1c5687
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-e645-4934e5c961c4
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-fc13-85678079c704
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-4219-bea6252e8a8e
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-9a1d-dd5c5f90a619
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-df83-a080c797e8bc
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-ac61-957b20e0205b
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-b193-eb1f0135252f
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-20ac-2a5e431bf9ec
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-3d02-4c9e0b0ac9e1
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-7083-f6b2d9aebdcb
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-d1ad-575ec502d6c9
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-8bdf-22cd8893ed50
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-577e-f2ad582a33d8
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-cfda-ef6f2d30f0fe
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-a2a7-77cf04c09916
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-7431-d7008664f7fc
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-fc56-f27e6b8c058b
00020000-5577-eb51-e60b-d5df1eefa816	00030000-5577-eb51-c1a3-ab828fb89f9c
\.


--
-- TOC entry 2824 (class 0 OID 6798406)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6798437)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6798573)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6798171)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5577-eb52-f639-a2c9290ba980	00040000-5577-eb50-e2f4-f2fe9fecbdf6	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-eb52-4723-dab497750809	00040000-5577-eb50-e2f4-f2fe9fecbdf6	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-eb52-d28a-4a7cd1ac8a72	00040000-5577-eb50-e2f4-f2fe9fecbdf6	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-eb52-afd1-eb8dec6d3e52	00040000-5577-eb50-e2f4-f2fe9fecbdf6	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2803 (class 0 OID 6798206)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5577-eb50-4122-b5dd037ecbfd	8341	Adlešiči
00050000-5577-eb50-ab68-097c27817821	5270	Ajdovščina
00050000-5577-eb50-c496-4ebb9796476b	6280	Ankaran/Ancarano
00050000-5577-eb50-ac3d-9068d1a06bf2	9253	Apače
00050000-5577-eb50-02e8-00d5bfb1f7e6	8253	Artiče
00050000-5577-eb50-5ac4-857e16380260	4275	Begunje na Gorenjskem
00050000-5577-eb50-5820-bd325a9943c3	1382	Begunje pri Cerknici
00050000-5577-eb50-075e-c573f962cd4a	9231	Beltinci
00050000-5577-eb50-1052-b0ee293be979	2234	Benedikt
00050000-5577-eb50-5494-d19f5df8cefb	2345	Bistrica ob Dravi
00050000-5577-eb50-9dda-98edaae89a02	3256	Bistrica ob Sotli
00050000-5577-eb50-39f6-6575aed5f413	8259	Bizeljsko
00050000-5577-eb50-9baf-98c2e83b938b	1223	Blagovica
00050000-5577-eb50-6810-671fcbf83879	8283	Blanca
00050000-5577-eb50-14d7-89b09414168c	4260	Bled
00050000-5577-eb50-96df-8f57efb3036a	4273	Blejska Dobrava
00050000-5577-eb50-8755-9458bc59b0c0	9265	Bodonci
00050000-5577-eb50-ae90-1b622f7d1553	9222	Bogojina
00050000-5577-eb50-0311-6e0b406e8a21	4263	Bohinjska Bela
00050000-5577-eb50-ac0b-7597320b6a15	4264	Bohinjska Bistrica
00050000-5577-eb50-fc31-7d780471fb90	4265	Bohinjsko jezero
00050000-5577-eb50-9ae4-cab0df9cf989	1353	Borovnica
00050000-5577-eb50-d295-9b236a9dac1d	8294	Boštanj
00050000-5577-eb50-45ae-62a27b2295df	5230	Bovec
00050000-5577-eb50-ec77-7087d9f60044	5295	Branik
00050000-5577-eb50-e81c-843f82214135	3314	Braslovče
00050000-5577-eb50-8cca-d8045a3f7b59	5223	Breginj
00050000-5577-eb50-bcda-d5a2b97f9c1c	8280	Brestanica
00050000-5577-eb50-e34b-69e0e7d31da0	2354	Bresternica
00050000-5577-eb50-cf93-24552dab0e85	4243	Brezje
00050000-5577-eb50-aca3-df6bb29d6124	1351	Brezovica pri Ljubljani
00050000-5577-eb50-9ebb-d3ea46011e7e	8250	Brežice
00050000-5577-eb50-76b7-ca2d42284ca3	4210	Brnik - Aerodrom
00050000-5577-eb50-e1cc-e1fd36bbc917	8321	Brusnice
00050000-5577-eb50-552d-8110c113fc72	3255	Buče
00050000-5577-eb50-4057-2b3238aa2666	8276	Bučka 
00050000-5577-eb50-ccb3-a4c537873b68	9261	Cankova
00050000-5577-eb50-bed4-9e72da50a2e0	3000	Celje 
00050000-5577-eb50-eeb1-1ae36059d741	3001	Celje - poštni predali
00050000-5577-eb50-16fa-fdabda9bbaca	4207	Cerklje na Gorenjskem
00050000-5577-eb50-1670-b019fa654f61	8263	Cerklje ob Krki
00050000-5577-eb50-0d6b-483e3e1a6cf6	1380	Cerknica
00050000-5577-eb50-fc5d-dd1deabdf970	5282	Cerkno
00050000-5577-eb50-16aa-002d0ec8ce41	2236	Cerkvenjak
00050000-5577-eb50-db51-c1f919d5c4a1	2215	Ceršak
00050000-5577-eb50-4f6e-75a01399e61d	2326	Cirkovce
00050000-5577-eb50-1b6f-68d81c08fd16	2282	Cirkulane
00050000-5577-eb50-f338-897847ead049	5273	Col
00050000-5577-eb50-495d-c3aa1ccc455c	8251	Čatež ob Savi
00050000-5577-eb50-d9e9-9be24d8fb4d6	1413	Čemšenik
00050000-5577-eb50-e80e-8ea4899c32c1	5253	Čepovan
00050000-5577-eb50-be4f-5b6136db2d72	9232	Črenšovci
00050000-5577-eb50-4abb-fddf180ac6bb	2393	Črna na Koroškem
00050000-5577-eb50-8ef4-b25108ab4adb	6275	Črni Kal
00050000-5577-eb50-9838-faa1d26f78ec	5274	Črni Vrh nad Idrijo
00050000-5577-eb50-88b7-20bcadde5796	5262	Črniče
00050000-5577-eb50-347a-aed1dfb0b652	8340	Črnomelj
00050000-5577-eb50-6b40-96c179a2a615	6271	Dekani
00050000-5577-eb50-5e94-5c1d38013a56	5210	Deskle
00050000-5577-eb50-29c0-46c85d34fcf0	2253	Destrnik
00050000-5577-eb50-815b-24871d391e7c	6215	Divača
00050000-5577-eb50-7650-6f3981517320	1233	Dob
00050000-5577-eb50-b8b4-f0219d6e8415	3224	Dobje pri Planini
00050000-5577-eb50-940a-5e1a8c12b938	8257	Dobova
00050000-5577-eb50-fad6-2fa5053634f9	1423	Dobovec
00050000-5577-eb50-4adc-df027b49afbc	5263	Dobravlje
00050000-5577-eb50-0da0-685f54d14105	3204	Dobrna
00050000-5577-eb50-7bd0-762621a84dcc	8211	Dobrnič
00050000-5577-eb50-4708-1fd0270c6fc2	1356	Dobrova
00050000-5577-eb50-0a80-26b1304fefc8	9223	Dobrovnik/Dobronak 
00050000-5577-eb50-b262-1f43944f74e7	5212	Dobrovo v Brdih
00050000-5577-eb50-2a30-ed6b26404c72	1431	Dol pri Hrastniku
00050000-5577-eb50-cf3e-44ce946fc9e6	1262	Dol pri Ljubljani
00050000-5577-eb50-7dbc-24d32b39ab7a	1273	Dole pri Litiji
00050000-5577-eb50-9ff6-e1cca91b02af	1331	Dolenja vas
00050000-5577-eb50-e3a9-501f33ed3f81	8350	Dolenjske Toplice
00050000-5577-eb50-cee0-9a2c9dd9327e	1230	Domžale
00050000-5577-eb50-e5b0-fcd37b6be0c1	2252	Dornava
00050000-5577-eb50-e672-ba9d594358a0	5294	Dornberk
00050000-5577-eb50-bc0b-da49d534311e	1319	Draga
00050000-5577-eb50-e740-dc64a131354d	8343	Dragatuš
00050000-5577-eb50-7d7f-0f94131e2182	3222	Dramlje
00050000-5577-eb50-9de5-c7f4d419b0fd	2370	Dravograd
00050000-5577-eb50-2ebd-bcf5b3d7f0ec	4203	Duplje
00050000-5577-eb50-f36e-40ed714ff87b	6221	Dutovlje
00050000-5577-eb50-a57a-0868a2e7a1bd	8361	Dvor
00050000-5577-eb50-8847-2f8a4f10cfe2	2343	Fala
00050000-5577-eb50-c907-3b8a3b0cb030	9208	Fokovci
00050000-5577-eb50-9499-582359b0ce72	2313	Fram
00050000-5577-eb50-dd3e-4033fa6d4eb1	3213	Frankolovo
00050000-5577-eb50-f66d-3fdd01990788	1274	Gabrovka
00050000-5577-eb50-9dc4-96dbeb89cb25	8254	Globoko
00050000-5577-eb50-ff33-494985165e84	5275	Godovič
00050000-5577-eb50-f95c-be7e5e948e12	4204	Golnik
00050000-5577-eb50-ca7b-19a2a839af11	3303	Gomilsko
00050000-5577-eb50-1437-e1726cf0e760	4224	Gorenja vas
00050000-5577-eb50-b2d8-d1372f5fe8de	3263	Gorica pri Slivnici
00050000-5577-eb50-600e-a54ba2c4f2d6	2272	Gorišnica
00050000-5577-eb50-df6a-5c105567f5cd	9250	Gornja Radgona
00050000-5577-eb50-d677-717a42da1663	3342	Gornji Grad
00050000-5577-eb50-2b0c-60845932bb41	4282	Gozd Martuljek
00050000-5577-eb50-daa1-757200c55a36	6272	Gračišče
00050000-5577-eb50-d00f-6160d597401a	9264	Grad
00050000-5577-eb50-67b4-0b63116a7a92	8332	Gradac
00050000-5577-eb50-2f7b-c1899a82d465	1384	Grahovo
00050000-5577-eb50-ef0e-f7797639d732	5242	Grahovo ob Bači
00050000-5577-eb50-5603-1b22a3a5286d	5251	Grgar
00050000-5577-eb50-4cdb-d9b063ebc747	3302	Griže
00050000-5577-eb50-982b-77a859fbdee2	3231	Grobelno
00050000-5577-eb50-d241-1628d3294365	1290	Grosuplje
00050000-5577-eb50-3337-ae486a31cc4b	2288	Hajdina
00050000-5577-eb50-bc7a-8c1d06f19b2c	8362	Hinje
00050000-5577-eb50-ee88-9602061c2d1e	2311	Hoče
00050000-5577-eb50-0665-6f81c2063336	9205	Hodoš/Hodos
00050000-5577-eb50-fc8c-233620e58b20	1354	Horjul
00050000-5577-eb50-2a01-2b18a12c8e0b	1372	Hotedršica
00050000-5577-eb50-3e76-1987b6c6e480	1430	Hrastnik
00050000-5577-eb50-8259-b5db10737942	6225	Hruševje
00050000-5577-eb50-1e5b-68ddc76a0f61	4276	Hrušica
00050000-5577-eb50-d830-0911f886f6b7	5280	Idrija
00050000-5577-eb50-3ff5-9bd5c0cabf5e	1292	Ig
00050000-5577-eb50-b2c9-65180f180403	6250	Ilirska Bistrica
00050000-5577-eb50-0a81-449ba2375416	6251	Ilirska Bistrica-Trnovo
00050000-5577-eb50-c98e-bb1421a68929	1295	Ivančna Gorica
00050000-5577-eb50-2397-bf39ed385453	2259	Ivanjkovci
00050000-5577-eb50-2bca-75821d8a0bab	1411	Izlake
00050000-5577-eb50-d466-39aef74dee8e	6310	Izola/Isola
00050000-5577-eb50-e1dd-e0e11b97672e	2222	Jakobski Dol
00050000-5577-eb50-5908-d2795ec43f01	2221	Jarenina
00050000-5577-eb50-f364-37015a5a4812	6254	Jelšane
00050000-5577-eb50-07a3-56ca25150911	4270	Jesenice
00050000-5577-eb50-09ab-1bc7b2f01c91	8261	Jesenice na Dolenjskem
00050000-5577-eb50-1653-28778d664123	3273	Jurklošter
00050000-5577-eb50-41c4-cb7325fae29c	2223	Jurovski Dol
00050000-5577-eb50-7a3f-402d89993d73	2256	Juršinci
00050000-5577-eb50-99e1-6ae437364009	5214	Kal nad Kanalom
00050000-5577-eb50-b23b-c8995ab95bb0	3233	Kalobje
00050000-5577-eb50-81db-f5d30a569ef6	4246	Kamna Gorica
00050000-5577-eb50-90f0-fc4c7b957e5a	2351	Kamnica
00050000-5577-eb50-dc5a-948bcf57399b	1241	Kamnik
00050000-5577-eb50-6271-f88f7bcc0b8d	5213	Kanal
00050000-5577-eb50-ba1d-98951ba7154d	8258	Kapele
00050000-5577-eb50-34ec-edbb3c6e2877	2362	Kapla
00050000-5577-eb50-73ab-c5bb60a659d1	2325	Kidričevo
00050000-5577-eb50-1f5e-4239b0fa0b36	1412	Kisovec
00050000-5577-eb50-e7ca-690a79e21e9b	6253	Knežak
00050000-5577-eb50-54f0-fec7a47b110d	5222	Kobarid
00050000-5577-eb50-2baa-0a5a08d1b4d5	9227	Kobilje
00050000-5577-eb50-4532-c98277efe8ab	1330	Kočevje
00050000-5577-eb50-77d9-fd0bdad5d95f	1338	Kočevska Reka
00050000-5577-eb50-203f-dd911d2d10cd	2276	Kog
00050000-5577-eb50-e9f4-3b81d16c3e38	5211	Kojsko
00050000-5577-eb50-e758-1578d49f7eec	6223	Komen
00050000-5577-eb50-67d6-974bb81ac88c	1218	Komenda
00050000-5577-eb50-1ecb-ed58686ec152	6000	Koper/Capodistria 
00050000-5577-eb50-7889-2cca08c0c0b0	6001	Koper/Capodistria - poštni predali
00050000-5577-eb50-2025-1bb23a8303e9	8282	Koprivnica
00050000-5577-eb50-5978-2273733b6ee1	5296	Kostanjevica na Krasu
00050000-5577-eb50-baad-e5d42bc55f8a	8311	Kostanjevica na Krki
00050000-5577-eb50-bdd8-ae5f3265f05c	1336	Kostel
00050000-5577-eb50-efaf-c2e59c625fca	6256	Košana
00050000-5577-eb50-b037-4b6ab74c043a	2394	Kotlje
00050000-5577-eb50-af59-d67b1ad6fb98	6240	Kozina
00050000-5577-eb50-6726-e1fce0789c87	3260	Kozje
00050000-5577-eb50-edd4-6a03512cd099	4000	Kranj 
00050000-5577-eb50-4232-f88db207a16b	4001	Kranj - poštni predali
00050000-5577-eb50-be27-317aec8483b3	4280	Kranjska Gora
00050000-5577-eb50-6f33-0ae141b17c9a	1281	Kresnice
00050000-5577-eb50-d7c2-09b484238581	4294	Križe
00050000-5577-eb50-cc12-d375e18502da	9206	Križevci
00050000-5577-eb50-e3c3-53232c7e7e1b	9242	Križevci pri Ljutomeru
00050000-5577-eb50-0ebf-209587354b09	1301	Krka
00050000-5577-eb50-6a0e-3313df390548	8296	Krmelj
00050000-5577-eb50-1d4c-418b838de0c2	4245	Kropa
00050000-5577-eb50-25de-74fadf96384a	8262	Krška vas
00050000-5577-eb50-35c0-e4e118fe0737	8270	Krško
00050000-5577-eb50-0dc4-232a17fdc2f5	9263	Kuzma
00050000-5577-eb50-1d8c-50ddf3efaeb3	2318	Laporje
00050000-5577-eb50-cd11-2a8d989153c0	3270	Laško
00050000-5577-eb50-24d8-9bfc4b725421	1219	Laze v Tuhinju
00050000-5577-eb50-9333-820237085de5	2230	Lenart v Slovenskih goricah
00050000-5577-eb50-355b-b2d0c23cb524	9220	Lendava/Lendva
00050000-5577-eb50-d5eb-5abfbd0f3993	4248	Lesce
00050000-5577-eb50-739b-67fc26c5a78a	3261	Lesično
00050000-5577-eb50-e588-0e6acb87d490	8273	Leskovec pri Krškem
00050000-5577-eb50-197d-79abd9063780	2372	Libeliče
00050000-5577-eb50-a65c-722564c6890b	2341	Limbuš
00050000-5577-eb50-6617-7e9ad5bd724a	1270	Litija
00050000-5577-eb50-dcc6-938e6b68941c	3202	Ljubečna
00050000-5577-eb50-f357-154a1834afa7	1000	Ljubljana 
00050000-5577-eb50-97c9-909fcb8662a5	1001	Ljubljana - poštni predali
00050000-5577-eb50-860e-8ecd65ead75a	1231	Ljubljana - Črnuče
00050000-5577-eb50-fd75-038b4a00a9af	1261	Ljubljana - Dobrunje
00050000-5577-eb50-438f-70325da4dfad	1260	Ljubljana - Polje
00050000-5577-eb50-3939-e39827c93d18	1210	Ljubljana - Šentvid
00050000-5577-eb50-eea8-6f926be89562	1211	Ljubljana - Šmartno
00050000-5577-eb50-8adc-62afb3d50e9d	3333	Ljubno ob Savinji
00050000-5577-eb50-3f6a-0d4b4b8bc10e	9240	Ljutomer
00050000-5577-eb50-70d0-44031b348f8a	3215	Loče
00050000-5577-eb50-c73e-cde9d3ce30ca	5231	Log pod Mangartom
00050000-5577-eb50-3aec-233bd1dc747c	1358	Log pri Brezovici
00050000-5577-eb50-efcb-065f7e882f84	1370	Logatec
00050000-5577-eb50-5752-f6032b5b53a7	1371	Logatec
00050000-5577-eb50-b3dd-61285e5a1774	1434	Loka pri Zidanem Mostu
00050000-5577-eb50-6e66-c07eec0b6d0a	3223	Loka pri Žusmu
00050000-5577-eb50-b47d-2b1b9482b1b6	6219	Lokev
00050000-5577-eb50-4349-a817776a27be	1318	Loški Potok
00050000-5577-eb50-d9b2-836f9f2d7e96	2324	Lovrenc na Dravskem polju
00050000-5577-eb50-3f18-4aaccd72bfc5	2344	Lovrenc na Pohorju
00050000-5577-eb50-1fd6-e54c85542073	3334	Luče
00050000-5577-eb50-29d5-9822d56c38cd	1225	Lukovica
00050000-5577-eb50-e011-1e5007056007	9202	Mačkovci
00050000-5577-eb50-3aca-859af7beff22	2322	Majšperk
00050000-5577-eb50-b0a8-6b805dbde2fd	2321	Makole
00050000-5577-eb50-b4df-fb20283b693c	9243	Mala Nedelja
00050000-5577-eb50-393e-b8e58c82eef0	2229	Malečnik
00050000-5577-eb50-d9bc-facac633e36f	6273	Marezige
00050000-5577-eb50-a869-32e5edfef1ea	2000	Maribor 
00050000-5577-eb50-aed9-a8e5d772f1d3	2001	Maribor - poštni predali
00050000-5577-eb50-42e9-7b94d8f9e2cf	2206	Marjeta na Dravskem polju
00050000-5577-eb50-4329-25d415491fc3	2281	Markovci
00050000-5577-eb50-6876-cf5c2936bfbd	9221	Martjanci
00050000-5577-eb50-0463-a0ed551bf080	6242	Materija
00050000-5577-eb50-5f36-90ff92dca1ce	4211	Mavčiče
00050000-5577-eb50-a9dd-33b96a1f6f2f	1215	Medvode
00050000-5577-eb50-c303-e2deb2dfa98e	1234	Mengeš
00050000-5577-eb50-ff67-5af5575a801c	8330	Metlika
00050000-5577-eb50-f752-e1871dd4cee3	2392	Mežica
00050000-5577-eb50-71c7-fcc4997c16e7	2204	Miklavž na Dravskem polju
00050000-5577-eb50-ce63-625e6a84ac31	2275	Miklavž pri Ormožu
00050000-5577-eb50-e75a-c97ca7a249d3	5291	Miren
00050000-5577-eb50-73af-57b767ccfb39	8233	Mirna
00050000-5577-eb50-eca4-f7fee2d6a838	8216	Mirna Peč
00050000-5577-eb50-7ab0-39c26f354d68	2382	Mislinja
00050000-5577-eb50-d66f-27041b4c783e	4281	Mojstrana
00050000-5577-eb50-1a3b-e9eb1f5a7780	8230	Mokronog
00050000-5577-eb50-e642-8f172131199d	1251	Moravče
00050000-5577-eb50-be92-b5d7f63babfc	9226	Moravske Toplice
00050000-5577-eb50-0b57-9a6fb0d85fce	5216	Most na Soči
00050000-5577-eb50-cc25-e06f65513e40	1221	Motnik
00050000-5577-eb50-243e-debb20371725	3330	Mozirje
00050000-5577-eb50-44ff-4e17dd56dc87	9000	Murska Sobota 
00050000-5577-eb50-efa3-0a9fdb63e618	9001	Murska Sobota - poštni predali
00050000-5577-eb50-f633-c7a9236c23f8	2366	Muta
00050000-5577-eb50-8977-a0497435fb98	4202	Naklo
00050000-5577-eb50-5b56-5989e990eea2	3331	Nazarje
00050000-5577-eb50-7800-1d9af75777a1	1357	Notranje Gorice
00050000-5577-eb50-0c21-5917cc35b99c	3203	Nova Cerkev
00050000-5577-eb50-71e4-35410ae17e83	5000	Nova Gorica 
00050000-5577-eb50-cbd7-d8ccffe2ea75	5001	Nova Gorica - poštni predali
00050000-5577-eb50-1769-dd7fc62eb21f	1385	Nova vas
00050000-5577-eb50-1dde-b0bfe783064c	8000	Novo mesto
00050000-5577-eb50-8abd-3082b69a9fb0	8001	Novo mesto - poštni predali
00050000-5577-eb50-4275-c1e256070614	6243	Obrov
00050000-5577-eb50-c203-e61435f23f18	9233	Odranci
00050000-5577-eb50-e31f-77cd4002921d	2317	Oplotnica
00050000-5577-eb50-dc61-52277b13a9da	2312	Orehova vas
00050000-5577-eb50-a827-6b82f6b187f1	2270	Ormož
00050000-5577-eb50-8875-68ecd486c2cc	1316	Ortnek
00050000-5577-eb50-9089-bf850a29cdb3	1337	Osilnica
00050000-5577-eb50-27a4-2cc05075d0e1	8222	Otočec
00050000-5577-eb50-813c-32fbe0aa9505	2361	Ožbalt
00050000-5577-eb50-d192-37cc29b5322a	2231	Pernica
00050000-5577-eb50-f156-c3f00273a433	2211	Pesnica pri Mariboru
00050000-5577-eb50-64aa-36278b7684c0	9203	Petrovci
00050000-5577-eb50-c31e-dbfcb521fcae	3301	Petrovče
00050000-5577-eb50-7f35-10d44c2b5736	6330	Piran/Pirano
00050000-5577-eb50-3444-680c068e4ba9	8255	Pišece
00050000-5577-eb50-28ad-202396e0c8a8	6257	Pivka
00050000-5577-eb50-6d0d-adb3b3e24a6c	6232	Planina
00050000-5577-eb50-dcec-251c3c2bd3e9	3225	Planina pri Sevnici
00050000-5577-eb50-abee-f987263abbef	6276	Pobegi
00050000-5577-eb50-1dad-27e54bd9a148	8312	Podbočje
00050000-5577-eb50-e33f-7056b37bfa13	5243	Podbrdo
00050000-5577-eb50-de00-c3b37b4d2d4f	3254	Podčetrtek
00050000-5577-eb50-1b54-805b829beab3	2273	Podgorci
00050000-5577-eb50-4cac-123dd794d915	6216	Podgorje
00050000-5577-eb50-4b24-0cd69f52331d	2381	Podgorje pri Slovenj Gradcu
00050000-5577-eb50-23c4-ad8cdc8350be	6244	Podgrad
00050000-5577-eb50-2a4b-532c47615908	1414	Podkum
00050000-5577-eb50-f732-6326294abc23	2286	Podlehnik
00050000-5577-eb50-ad07-56b56563fa43	5272	Podnanos
00050000-5577-eb50-0034-76967c18868d	4244	Podnart
00050000-5577-eb50-91c4-1de75863630f	3241	Podplat
00050000-5577-eb50-b863-1a453d04bfb4	3257	Podsreda
00050000-5577-eb50-1215-f0e497c371b5	2363	Podvelka
00050000-5577-eb50-48ff-e3bbc31ba25a	2208	Pohorje
00050000-5577-eb50-4d7b-73a43375fb1b	2257	Polenšak
00050000-5577-eb50-cb7d-ba60df55f22e	1355	Polhov Gradec
00050000-5577-eb50-5fef-0b418eb2c20e	4223	Poljane nad Škofjo Loko
00050000-5577-eb50-992e-c670d80d35ff	2319	Poljčane
00050000-5577-eb50-92c6-a3b31a91415c	1272	Polšnik
00050000-5577-eb50-edab-c7d3d93fce72	3313	Polzela
00050000-5577-eb50-b0e8-a3b23f5628d7	3232	Ponikva
00050000-5577-eb50-8d6e-53ddaf9cf9b2	6320	Portorož/Portorose
00050000-5577-eb50-438d-aa85c98b8bbc	6230	Postojna
00050000-5577-eb50-d584-5fb472b760b1	2331	Pragersko
00050000-5577-eb50-2c19-0dfde218817a	3312	Prebold
00050000-5577-eb50-50f1-2086a60b9429	4205	Preddvor
00050000-5577-eb50-7c00-e495114ab563	6255	Prem
00050000-5577-eb50-9f33-f293acda68fc	1352	Preserje
00050000-5577-eb50-2e06-3dd01b9ff04d	6258	Prestranek
00050000-5577-eb50-042e-ec56dc721dbe	2391	Prevalje
00050000-5577-eb50-8071-da8f065a4b4c	3262	Prevorje
00050000-5577-eb50-6b41-e099fa83f6c5	1276	Primskovo 
00050000-5577-eb50-b4ca-dd53b1cffd6c	3253	Pristava pri Mestinju
00050000-5577-eb50-90c6-d75c44f7780b	9207	Prosenjakovci/Partosfalva
00050000-5577-eb50-aa84-7e9e160a5731	5297	Prvačina
00050000-5577-eb50-4c4a-abf3464b4fc4	2250	Ptuj
00050000-5577-eb50-9996-8ec90f36602b	2323	Ptujska Gora
00050000-5577-eb50-6b59-ff1c527be443	9201	Puconci
00050000-5577-eb50-ed6d-219c03f4d719	2327	Rače
00050000-5577-eb50-b267-d840eb943793	1433	Radeče
00050000-5577-eb50-e8e8-d25e91db2a4b	9252	Radenci
00050000-5577-eb50-d4dd-18474e3f21d9	2360	Radlje ob Dravi
00050000-5577-eb50-3a6f-6e3fa47a9d3a	1235	Radomlje
00050000-5577-eb50-55dc-18484f22964a	4240	Radovljica
00050000-5577-eb50-5e5a-9792e9e9e120	8274	Raka
00050000-5577-eb50-9319-1a6cf0d1e569	1381	Rakek
00050000-5577-eb50-7ea8-101336cb5c02	4283	Rateče - Planica
00050000-5577-eb50-c419-4cba68bad427	2390	Ravne na Koroškem
00050000-5577-eb50-c65b-3546edded6d3	9246	Razkrižje
00050000-5577-eb50-9aa9-bba4e0184a4e	3332	Rečica ob Savinji
00050000-5577-eb50-1af9-85ef781a4dca	5292	Renče
00050000-5577-eb50-4b21-0cc784c6f696	1310	Ribnica
00050000-5577-eb50-140f-79e680103d63	2364	Ribnica na Pohorju
00050000-5577-eb50-bfe2-4b8621ea4880	3272	Rimske Toplice
00050000-5577-eb50-88ce-f863d19b843b	1314	Rob
00050000-5577-eb50-4dcb-879ebd2af27d	5215	Ročinj
00050000-5577-eb50-7b90-9afe332b3d9c	3250	Rogaška Slatina
00050000-5577-eb50-2de0-4061be3472dd	9262	Rogašovci
00050000-5577-eb50-d63b-a8a97c0ffddb	3252	Rogatec
00050000-5577-eb50-69ce-eb3d7afac958	1373	Rovte
00050000-5577-eb50-dbf8-b3741b1ff3d9	2342	Ruše
00050000-5577-eb50-2f0b-3dff26667533	1282	Sava
00050000-5577-eb50-41b4-bef760388fab	6333	Sečovlje/Sicciole
00050000-5577-eb50-ea6a-c8fa56b0aa46	4227	Selca
00050000-5577-eb50-a8e8-9e59f261f5fd	2352	Selnica ob Dravi
00050000-5577-eb50-f447-e5c302d0bac2	8333	Semič
00050000-5577-eb50-e7e2-2d402bf49869	8281	Senovo
00050000-5577-eb50-f1e5-b71ad6b1973a	6224	Senožeče
00050000-5577-eb50-007a-f295dfc961d9	8290	Sevnica
00050000-5577-eb50-439d-f5384a6e9276	6210	Sežana
00050000-5577-eb50-e2dd-f9329c92d421	2214	Sladki Vrh
00050000-5577-eb50-3bbe-1a1a41bb3045	5283	Slap ob Idrijci
00050000-5577-eb50-9cce-e620980dc7b1	2380	Slovenj Gradec
00050000-5577-eb50-8573-a536fabb1bde	2310	Slovenska Bistrica
00050000-5577-eb50-bf0c-bebc69142843	3210	Slovenske Konjice
00050000-5577-eb50-b366-21bf1015c37d	1216	Smlednik
00050000-5577-eb50-7d17-7430d2fb7709	5232	Soča
00050000-5577-eb50-e992-15a65400ec39	1317	Sodražica
00050000-5577-eb50-1450-dcc004c9320a	3335	Solčava
00050000-5577-eb50-ecf6-ef8979e1508c	5250	Solkan
00050000-5577-eb50-b8b4-92cb5ad00788	4229	Sorica
00050000-5577-eb50-a607-6191e779b4c7	4225	Sovodenj
00050000-5577-eb50-889e-89ed7338420e	5281	Spodnja Idrija
00050000-5577-eb50-286b-0a662eecdec2	2241	Spodnji Duplek
00050000-5577-eb50-514b-c24c4f96957b	9245	Spodnji Ivanjci
00050000-5577-eb50-b2f1-70d16171b0dd	2277	Središče ob Dravi
00050000-5577-eb50-d992-c86650f495e7	4267	Srednja vas v Bohinju
00050000-5577-eb50-7e23-344b977c4202	8256	Sromlje 
00050000-5577-eb50-d9d9-32d3fb0f76c4	5224	Srpenica
00050000-5577-eb50-1737-4563dfa4a650	1242	Stahovica
00050000-5577-eb50-4bf9-613200c913d3	1332	Stara Cerkev
00050000-5577-eb50-01a5-1c025f3fff11	8342	Stari trg ob Kolpi
00050000-5577-eb50-64e2-37ce0cf45710	1386	Stari trg pri Ložu
00050000-5577-eb50-47be-782013d29c80	2205	Starše
00050000-5577-eb50-1154-e885af0edb15	2289	Stoperce
00050000-5577-eb50-a8a9-2fa66024f466	8322	Stopiče
00050000-5577-eb50-c49c-7ebb2884d1ad	3206	Stranice
00050000-5577-eb50-edeb-9d4dee943d87	8351	Straža
00050000-5577-eb50-edc6-24e3c505ef1e	1313	Struge
00050000-5577-eb50-212c-a325c9281877	8293	Studenec
00050000-5577-eb50-3b28-aa6eaa4414a0	8331	Suhor
00050000-5577-eb50-4ae1-1348db2f9258	2233	Sv. Ana v Slovenskih goricah
00050000-5577-eb50-d99c-ca249bdd61f5	2235	Sv. Trojica v Slovenskih goricah
00050000-5577-eb50-55ec-453c333a35d5	2353	Sveti Duh na Ostrem Vrhu
00050000-5577-eb50-6fb6-5fb64026e014	9244	Sveti Jurij ob Ščavnici
00050000-5577-eb50-a0c3-70a934061577	3264	Sveti Štefan
00050000-5577-eb50-a0b0-57b04e1cee82	2258	Sveti Tomaž
00050000-5577-eb50-1857-3fbd2f18b04b	9204	Šalovci
00050000-5577-eb50-e847-54c8f50d13e4	5261	Šempas
00050000-5577-eb50-9a74-b10f98763f85	5290	Šempeter pri Gorici
00050000-5577-eb50-da21-663dd983051a	3311	Šempeter v Savinjski dolini
00050000-5577-eb50-fe69-28f7cfd07221	4208	Šenčur
00050000-5577-eb50-60a8-a99b353fd2d7	2212	Šentilj v Slovenskih goricah
00050000-5577-eb50-26fa-54cb5f3f380b	8297	Šentjanž
00050000-5577-eb50-126f-005b57dfdde2	2373	Šentjanž pri Dravogradu
00050000-5577-eb50-eba9-d83819af5ffb	8310	Šentjernej
00050000-5577-eb50-6c30-6e27d40c8fbf	3230	Šentjur
00050000-5577-eb50-b79a-7a714c7e80e9	3271	Šentrupert
00050000-5577-eb50-aa97-e8d0fa2dff8a	8232	Šentrupert
00050000-5577-eb50-57a2-8460e38e1663	1296	Šentvid pri Stični
00050000-5577-eb50-09f3-fed5c9a6438b	8275	Škocjan
00050000-5577-eb50-4b88-583c004605ab	6281	Škofije
00050000-5577-eb50-93bf-a95d99158fa4	4220	Škofja Loka
00050000-5577-eb50-ea67-e656947aafa0	3211	Škofja vas
00050000-5577-eb50-9cf7-d9422e465eb3	1291	Škofljica
00050000-5577-eb50-e0b0-228d6d493496	6274	Šmarje
00050000-5577-eb50-b777-fa531bbd9ecf	1293	Šmarje - Sap
00050000-5577-eb50-0c65-dea6c2a949b8	3240	Šmarje pri Jelšah
00050000-5577-eb50-700b-0b9c46ba5a1b	8220	Šmarješke Toplice
00050000-5577-eb50-5f9b-10cee0bcb65d	2315	Šmartno na Pohorju
00050000-5577-eb50-4d85-746172c051de	3341	Šmartno ob Dreti
00050000-5577-eb50-1901-c433cea982a9	3327	Šmartno ob Paki
00050000-5577-eb50-800e-0f87a88bdf4f	1275	Šmartno pri Litiji
00050000-5577-eb50-6251-9dcfc8579af7	2383	Šmartno pri Slovenj Gradcu
00050000-5577-eb50-e9cc-27f9c1ed967b	3201	Šmartno v Rožni dolini
00050000-5577-eb50-517b-2292533d00cd	3325	Šoštanj
00050000-5577-eb50-8ad7-cfaab44d9892	6222	Štanjel
00050000-5577-eb50-3299-a5ebcd163732	3220	Štore
00050000-5577-eb50-b57d-c6559ff0701e	3304	Tabor
00050000-5577-eb50-fc3c-2697ff2ab0eb	3221	Teharje
00050000-5577-eb50-28f8-ec1c16828264	9251	Tišina
00050000-5577-eb50-76a2-a97d12c75d9d	5220	Tolmin
00050000-5577-eb50-cf5a-b55195f3a2a7	3326	Topolšica
00050000-5577-eb50-9c72-dc7715627a5f	2371	Trbonje
00050000-5577-eb50-36cd-10bb06fae6bf	1420	Trbovlje
00050000-5577-eb50-9ff4-61316c9c59d3	8231	Trebelno 
00050000-5577-eb50-680b-c5d35994c467	8210	Trebnje
00050000-5577-eb50-d9ae-4ba536333e99	5252	Trnovo pri Gorici
00050000-5577-eb50-344e-a4f94284b335	2254	Trnovska vas
00050000-5577-eb50-9845-6b680d66ab4b	1222	Trojane
00050000-5577-eb50-1898-5912c3777b75	1236	Trzin
00050000-5577-eb50-33d8-21f64e6bcb1b	4290	Tržič
00050000-5577-eb50-5696-6fde37d92bb6	8295	Tržišče
00050000-5577-eb50-23f9-aac3a1691c18	1311	Turjak
00050000-5577-eb50-8d16-e3fdbb1be435	9224	Turnišče
00050000-5577-eb50-3e6e-42a14ee82f26	8323	Uršna sela
00050000-5577-eb50-49aa-4e4671784a96	1252	Vače
00050000-5577-eb50-5a27-e4e791e7759e	3320	Velenje 
00050000-5577-eb50-0f3f-9ea594689804	3322	Velenje - poštni predali
00050000-5577-eb50-18cf-3d4ba8381a53	8212	Velika Loka
00050000-5577-eb50-154a-01747cccd2ac	2274	Velika Nedelja
00050000-5577-eb50-2880-7a379ac50e0e	9225	Velika Polana
00050000-5577-eb50-9864-1558cbf9422c	1315	Velike Lašče
00050000-5577-eb50-8ed4-e84c621f5922	8213	Veliki Gaber
00050000-5577-eb50-26c1-1f89943c6704	9241	Veržej
00050000-5577-eb50-e65f-6b1fe9cdd38e	1312	Videm - Dobrepolje
00050000-5577-eb50-cd06-bcd4cdc3cb84	2284	Videm pri Ptuju
00050000-5577-eb50-f8b4-1c1b22e31bfd	8344	Vinica
00050000-5577-eb50-7c0b-859f81bac960	5271	Vipava
00050000-5577-eb50-f30c-22331045d56f	4212	Visoko
00050000-5577-eb50-7611-5bba5bcb54d9	1294	Višnja Gora
00050000-5577-eb50-da7d-8fa946fd7880	3205	Vitanje
00050000-5577-eb50-1f15-fce243ec8183	2255	Vitomarci
00050000-5577-eb50-d646-0f680784a959	1217	Vodice
00050000-5577-eb50-ff2a-fb22397c2a50	3212	Vojnik\t
00050000-5577-eb50-5f1e-8617cac02e64	5293	Volčja Draga
00050000-5577-eb50-58e7-34f1bd004c2a	2232	Voličina
00050000-5577-eb50-556f-9a70f7373e5e	3305	Vransko
00050000-5577-eb50-9260-cb78c80fde8a	6217	Vremski Britof
00050000-5577-eb50-0260-82d003120b68	1360	Vrhnika
00050000-5577-eb50-4181-89e30690f2eb	2365	Vuhred
00050000-5577-eb50-f681-f4a367a60793	2367	Vuzenica
00050000-5577-eb50-e06d-371887518037	8292	Zabukovje 
00050000-5577-eb50-9a98-063c6069151b	1410	Zagorje ob Savi
00050000-5577-eb50-ff0e-3b58464ce86c	1303	Zagradec
00050000-5577-eb50-b003-5f94f400d36c	2283	Zavrč
00050000-5577-eb50-d23e-74cbd151f847	8272	Zdole 
00050000-5577-eb50-2966-b5bc7f32da21	4201	Zgornja Besnica
00050000-5577-eb50-b93f-ec88c0bca458	2242	Zgornja Korena
00050000-5577-eb50-4bc3-305935714a1e	2201	Zgornja Kungota
00050000-5577-eb50-3134-9276d4b0900f	2316	Zgornja Ložnica
00050000-5577-eb50-5e33-917921450f85	2314	Zgornja Polskava
00050000-5577-eb50-b3bf-68971b5aa182	2213	Zgornja Velka
00050000-5577-eb50-0ebd-7f344921482b	4247	Zgornje Gorje
00050000-5577-eb50-c3ef-bcb55f87f5f8	4206	Zgornje Jezersko
00050000-5577-eb50-8df1-d7e05746ea32	2285	Zgornji Leskovec
00050000-5577-eb50-2d94-89417cf712c1	1432	Zidani Most
00050000-5577-eb50-d107-5d858880f03e	3214	Zreče
00050000-5577-eb50-97dc-73e00cd6ec82	4209	Žabnica
00050000-5577-eb50-be28-d4524804153b	3310	Žalec
00050000-5577-eb50-2f7f-b74db36d94ee	4228	Železniki
00050000-5577-eb50-36fb-52f220534c13	2287	Žetale
00050000-5577-eb50-7f9c-0b1993c1192a	4226	Žiri
00050000-5577-eb50-d809-83b6822b3db5	4274	Žirovnica
00050000-5577-eb50-84db-57824b4b300c	8360	Žužemberk
\.


--
-- TOC entry 2820 (class 0 OID 6798380)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6798191)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6798269)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6798392)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6798512)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6798565)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5577-eb52-56e8-07b8f7201bf2	00080000-5577-eb52-d28a-4a7cd1ac8a72	0987	A
00190000-5577-eb52-feb1-aefc46bd644b	00080000-5577-eb52-4723-dab497750809	0989	A
\.


--
-- TOC entry 2846 (class 0 OID 6798679)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6798726)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6798688)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 6798696)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6798421)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5577-eb52-d44b-7e87d5aa0049	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5577-eb52-4773-2b6264cab42c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5577-eb52-ad32-dd186b15db48	0003	Kazinska	t	84	Kazinska dvorana
00220000-5577-eb52-1a64-ac1f802cd2b1	0004	Mali oder	t	24	Mali oder 
00220000-5577-eb52-4d28-c126bd36204c	0005	Komorni oder	t	15	Komorni oder
00220000-5577-eb52-3d1a-dbac0a63da7e	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5577-eb52-1bff-6363a644ae5d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2818 (class 0 OID 6798365)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6798355)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6798554)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6798489)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6798063)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5577-eb51-9cea-a594e5159260	00010000-5577-eb51-68b5-9d5809c83dec	2015-06-10 09:46:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROlJreQCXAOWvolUuJvAkUPJNH0Rik3SK";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2827 (class 0 OID 6798431)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6798101)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5577-eb51-3e31-9b4e6d1b0b4f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5577-eb51-fb49-3f3380811b3b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5577-eb51-99e9-ec75e546353a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5577-eb51-1239-b9cafe6ba464	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5577-eb51-c57d-90af5243bd92	planer	Planer dogodkov v koledarju	t
00020000-5577-eb51-7d69-45958abb778b	kadrovska	Kadrovska služba	t
00020000-5577-eb51-602b-319fc2631e41	arhivar	Ažuriranje arhivalij	t
00020000-5577-eb51-cd01-a931b7f3f908	igralec	Igralec	t
00020000-5577-eb51-e60b-d5df1eefa816	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2793 (class 0 OID 6798085)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5577-eb51-9cea-a594e5159260	00020000-5577-eb51-99e9-ec75e546353a
00010000-5577-eb51-68b5-9d5809c83dec	00020000-5577-eb51-99e9-ec75e546353a
\.


--
-- TOC entry 2829 (class 0 OID 6798445)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6798386)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6798336)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6798745)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5577-eb50-0cae-19ee9223d6f6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5577-eb50-a793-d16109dcd64c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5577-eb50-b80d-af150ee91367	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5577-eb50-5c60-48540faa9755	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5577-eb50-cb88-cfdba9a96c51	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2852 (class 0 OID 6798737)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5577-eb50-704e-70272fde2b26	00230000-5577-eb50-5c60-48540faa9755	popa
00240000-5577-eb50-4bf3-bbba175cd78b	00230000-5577-eb50-5c60-48540faa9755	oseba
00240000-5577-eb50-c97c-c4f951ed17b3	00230000-5577-eb50-a793-d16109dcd64c	prostor
00240000-5577-eb50-c59e-6ef89362b2bd	00230000-5577-eb50-5c60-48540faa9755	besedilo
00240000-5577-eb50-8fb8-76b668c4434d	00230000-5577-eb50-5c60-48540faa9755	uprizoritev
00240000-5577-eb50-add1-7a56ce36fdca	00230000-5577-eb50-5c60-48540faa9755	funkcija
00240000-5577-eb50-3679-e9a45aae8697	00230000-5577-eb50-5c60-48540faa9755	tipfunkcije
00240000-5577-eb50-0898-1bc7e187e0c7	00230000-5577-eb50-5c60-48540faa9755	alternacija
00240000-5577-eb50-ffe9-79ba12800787	00230000-5577-eb50-0cae-19ee9223d6f6	pogodba
00240000-5577-eb50-a859-10eb415d0911	00230000-5577-eb50-5c60-48540faa9755	zaposlitev
\.


--
-- TOC entry 2851 (class 0 OID 6798732)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6798499)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6798163)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6798342)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5577-eb52-013a-3a8d5ad571f6	00180000-5577-eb52-13c7-7a9fa85c0737	000c0000-5577-eb52-df2b-2ffe54be9fa0	00090000-5577-eb52-f362-6125a698025a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-eb52-5991-a8c5c4789b71	00180000-5577-eb52-13c7-7a9fa85c0737	000c0000-5577-eb52-aaf5-524f3090acb4	00090000-5577-eb52-abb6-637eaa97eb6f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-eb52-28c6-a14d2061d78c	00180000-5577-eb52-13c7-7a9fa85c0737	000c0000-5577-eb52-b659-e36688da9efd	00090000-5577-eb52-10c2-edc75449deaa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-eb52-10d2-bc9869093c9c	00180000-5577-eb52-13c7-7a9fa85c0737	000c0000-5577-eb52-3953-d1c06fd6a52f	00090000-5577-eb52-b4e5-da7eaf8423e4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-eb52-5876-6e11d959992a	00180000-5577-eb52-13c7-7a9fa85c0737	000c0000-5577-eb52-9a0c-5600afe2ccce	00090000-5577-eb52-ec17-3eecc694bab1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-eb52-258c-334af12f37ad	00180000-5577-eb52-f490-aacfce42380b	\N	00090000-5577-eb52-ec17-3eecc694bab1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2837 (class 0 OID 6798543)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5577-eb50-3493-ef66a964ed36	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5577-eb50-96ec-a5b7c7b7b20c	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5577-eb50-d1b2-2910add4c296	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5577-eb50-1630-ebb01576ca0b	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5577-eb50-b73e-0bd8a5fcdfb1	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5577-eb50-a132-f232a212d33d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5577-eb50-d23a-40c814fc4d30	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5577-eb50-2cc7-d2bfc6ae3f02	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5577-eb50-9c25-0915f12d5cf2	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5577-eb50-8f74-677044c24d41	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5577-eb50-7690-55b9b6193f22	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5577-eb50-07f7-efc1de8950d3	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5577-eb50-1745-bc3be55ad9ca	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5577-eb50-b82b-98d2fff6dd1b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5577-eb50-e9d3-52b2b081dde8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5577-eb50-2a63-2ba6f9bb7319	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2849 (class 0 OID 6798715)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5577-eb50-3651-5b4b6c4fa2e2	01	Velika predstava	f	1.00	1.00
002b0000-5577-eb50-5bf2-023cea160990	02	Mala predstava	f	0.50	0.50
002b0000-5577-eb50-5a8d-929eddd00604	03	Mala koprodukcija	t	0.40	1.00
002b0000-5577-eb50-83cd-a9d8922308b9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5577-eb50-257f-f671fc1a6d8c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2805 (class 0 OID 6798226)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6798072)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5577-eb51-68b5-9d5809c83dec	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROz4BQOthU9PAc8F6S2uXVir4BPZ/8DqO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5577-eb52-bd43-6098a53031c6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5577-eb52-8f96-c507dc905826	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5577-eb52-a92f-40b3a5b7bb6f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5577-eb52-7754-e66f2e48d287	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5577-eb52-79ad-7e18f454aa1f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5577-eb52-f0ab-78d9b7ee93ee	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5577-eb51-9cea-a594e5159260	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2842 (class 0 OID 6798600)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5577-eb52-a819-37a252741468	00160000-5577-eb52-902b-ad10d150d981	00150000-5577-eb50-7387-2942e116cc22	00140000-5577-eb50-5382-3ec0cb0692f0	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5577-eb52-4d28-c126bd36204c
000e0000-5577-eb52-b7a7-231c260d978b	00160000-5577-eb52-3536-be63be75ae08	00150000-5577-eb50-8849-3aa6c26b7657	00140000-5577-eb50-0036-c4274f7f730e	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5577-eb52-3d1a-dbac0a63da7e
\.


--
-- TOC entry 2810 (class 0 OID 6798288)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5577-eb52-cb86-768fde2cc7ff	000e0000-5577-eb52-b7a7-231c260d978b	1	
00200000-5577-eb52-7d25-72b0d8b3ea3c	000e0000-5577-eb52-b7a7-231c260d978b	2	
\.


--
-- TOC entry 2825 (class 0 OID 6798413)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6798482)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6798320)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6798590)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5577-eb50-5382-3ec0cb0692f0	01	Drama	drama (SURS 01)
00140000-5577-eb50-8e19-44d91db12232	02	Opera	opera (SURS 02)
00140000-5577-eb50-8482-eacbc6b5edf3	03	Balet	balet (SURS 03)
00140000-5577-eb50-668f-d0dc66758ca1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5577-eb50-bcfd-d1d1e7251c79	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5577-eb50-0036-c4274f7f730e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5577-eb50-770a-10a42f15f802	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2831 (class 0 OID 6798472)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5577-eb50-917e-30c50f43d481	01	Opera	opera
00150000-5577-eb50-1f19-b833f15679a2	02	Opereta	opereta
00150000-5577-eb50-4030-4e0f0cade172	03	Balet	balet
00150000-5577-eb50-8cd3-983c2148b13e	04	Plesne prireditve	plesne prireditve
00150000-5577-eb50-2398-915a13117e00	05	Lutkovno gledališče	lutkovno gledališče
00150000-5577-eb50-5be6-ae7711a27c9b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5577-eb50-2df9-e097e73358d3	07	Biografska drama	biografska drama
00150000-5577-eb50-7387-2942e116cc22	08	Komedija	komedija
00150000-5577-eb50-aecb-f6b269b53bd4	09	Črna komedija	črna komedija
00150000-5577-eb50-6ae7-51c908615be5	10	E-igra	E-igra
00150000-5577-eb50-8849-3aa6c26b7657	11	Kriminalka	kriminalka
00150000-5577-eb50-8c0a-52e6edd2fd5c	12	Musical	musical
\.


--
-- TOC entry 2379 (class 2606 OID 6798126)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6798646)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6798636)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6798542)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 6798310)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6798335)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6798252)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6798675)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6798468)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 6798286)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 6798329)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6798266)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6798378)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6798405)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6798224)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 6798135)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2386 (class 2606 OID 6798159)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6798115)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2370 (class 2606 OID 6798100)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 6798411)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6798444)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6798585)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 6798188)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 6798212)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6798384)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6798202)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 6798273)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6798396)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6798524)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6798570)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6798686)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 6798730)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6798693)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6798713)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6798428)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6798369)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 6798360)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6798564)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6798496)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6798071)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6798435)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6798089)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2372 (class 2606 OID 6798109)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6798453)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 6798391)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6798341)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 6798754)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6798742)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 6798736)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6798509)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6798168)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 6798351)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6798553)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6798725)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6798237)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 6798084)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6798616)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6798295)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6798419)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6798487)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6798324)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6798598)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6798480)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 1259 OID 6798317)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2519 (class 1259 OID 6798510)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 6798511)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2393 (class 1259 OID 6798190)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2352 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2354 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2484 (class 1259 OID 6798412)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2478 (class 1259 OID 6798398)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2479 (class 1259 OID 6798397)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2430 (class 1259 OID 6798296)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2506 (class 1259 OID 6798469)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2507 (class 1259 OID 6798471)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2508 (class 1259 OID 6798470)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2418 (class 1259 OID 6798268)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2419 (class 1259 OID 6798267)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2537 (class 1259 OID 6798587)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2538 (class 1259 OID 6798588)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2539 (class 1259 OID 6798589)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2577 (class 1259 OID 6798714)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2546 (class 1259 OID 6798621)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2547 (class 1259 OID 6798618)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2548 (class 1259 OID 6798620)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2549 (class 1259 OID 6798619)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2408 (class 1259 OID 6798239)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2409 (class 1259 OID 6798238)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2357 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2384 (class 1259 OID 6798162)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2494 (class 1259 OID 6798436)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2448 (class 1259 OID 6798330)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2374 (class 1259 OID 6798116)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2375 (class 1259 OID 6798117)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2499 (class 1259 OID 6798456)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2500 (class 1259 OID 6798455)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2501 (class 1259 OID 6798454)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2422 (class 1259 OID 6798274)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2423 (class 1259 OID 6798276)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2424 (class 1259 OID 6798275)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2587 (class 1259 OID 6798744)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2458 (class 1259 OID 6798364)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2459 (class 1259 OID 6798362)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2460 (class 1259 OID 6798361)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2461 (class 1259 OID 6798363)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2365 (class 1259 OID 6798090)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6798091)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2487 (class 1259 OID 6798420)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2473 (class 1259 OID 6798385)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2515 (class 1259 OID 6798497)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2516 (class 1259 OID 6798498)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2567 (class 1259 OID 6798676)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 6798677)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2569 (class 1259 OID 6798678)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2397 (class 1259 OID 6798204)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 6798203)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2399 (class 1259 OID 6798205)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2582 (class 1259 OID 6798731)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2523 (class 1259 OID 6798525)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6798526)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2559 (class 1259 OID 6798650)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2560 (class 1259 OID 6798652)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2561 (class 1259 OID 6798648)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2562 (class 1259 OID 6798651)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2563 (class 1259 OID 6798649)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2512 (class 1259 OID 6798488)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 6798373)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2465 (class 1259 OID 6798372)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2466 (class 1259 OID 6798370)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2467 (class 1259 OID 6798371)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2348 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2555 (class 1259 OID 6798638)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2556 (class 1259 OID 6798637)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2570 (class 1259 OID 6798687)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2429 (class 1259 OID 6798287)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2380 (class 1259 OID 6798137)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2381 (class 1259 OID 6798136)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2389 (class 1259 OID 6798169)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 6798170)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 6798354)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 6798353)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2455 (class 1259 OID 6798352)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2573 (class 1259 OID 6798695)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2574 (class 1259 OID 6798694)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2436 (class 1259 OID 6798319)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2437 (class 1259 OID 6798315)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2438 (class 1259 OID 6798312)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2439 (class 1259 OID 6798313)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2440 (class 1259 OID 6798311)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2441 (class 1259 OID 6798316)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2442 (class 1259 OID 6798314)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2396 (class 1259 OID 6798189)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2414 (class 1259 OID 6798253)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 6798255)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2416 (class 1259 OID 6798254)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2417 (class 1259 OID 6798256)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2472 (class 1259 OID 6798379)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 6798586)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2550 (class 1259 OID 6798617)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2387 (class 1259 OID 6798160)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2388 (class 1259 OID 6798161)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 6798481)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 6798755)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6798225)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2590 (class 1259 OID 6798743)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2492 (class 1259 OID 6798430)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2493 (class 1259 OID 6798429)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 6798647)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2404 (class 1259 OID 6798213)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6798599)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6798571)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6798572)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2373 (class 1259 OID 6798110)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2443 (class 1259 OID 6798318)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2619 (class 2606 OID 6798891)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2622 (class 2606 OID 6798876)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2621 (class 2606 OID 6798881)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2617 (class 2606 OID 6798901)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2623 (class 2606 OID 6798871)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2618 (class 2606 OID 6798896)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2620 (class 2606 OID 6798886)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2653 (class 2606 OID 6799046)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 6799051)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2604 (class 2606 OID 6798806)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2640 (class 2606 OID 6798986)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2638 (class 2606 OID 6798981)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2639 (class 2606 OID 6798976)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2616 (class 2606 OID 6798866)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2648 (class 2606 OID 6799016)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2646 (class 2606 OID 6799026)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2647 (class 2606 OID 6799021)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2610 (class 2606 OID 6798841)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2611 (class 2606 OID 6798836)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 6798966)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2659 (class 2606 OID 6799071)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 6799076)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2657 (class 2606 OID 6799081)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2677 (class 2606 OID 6799171)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2660 (class 2606 OID 6799101)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2663 (class 2606 OID 6799086)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2661 (class 2606 OID 6799096)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2662 (class 2606 OID 6799091)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2608 (class 2606 OID 6798831)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2609 (class 2606 OID 6798826)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2600 (class 2606 OID 6798791)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2601 (class 2606 OID 6798786)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2642 (class 2606 OID 6798996)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2624 (class 2606 OID 6798906)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2597 (class 2606 OID 6798766)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2596 (class 2606 OID 6798771)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2643 (class 2606 OID 6799011)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2644 (class 2606 OID 6799006)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2645 (class 2606 OID 6799001)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2614 (class 2606 OID 6798846)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2612 (class 2606 OID 6798856)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2613 (class 2606 OID 6798851)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 6799181)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2628 (class 2606 OID 6798941)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2630 (class 2606 OID 6798931)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2631 (class 2606 OID 6798926)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2629 (class 2606 OID 6798936)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2595 (class 2606 OID 6798756)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2594 (class 2606 OID 6798761)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2641 (class 2606 OID 6798991)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2637 (class 2606 OID 6798971)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2651 (class 2606 OID 6799036)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2650 (class 2606 OID 6799041)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 6799141)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 6799146)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2671 (class 2606 OID 6799151)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2606 (class 2606 OID 6798816)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2607 (class 2606 OID 6798811)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6798821)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2678 (class 2606 OID 6799176)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2655 (class 2606 OID 6799056)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6799061)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2668 (class 2606 OID 6799126)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 6799136)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2670 (class 2606 OID 6799116)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2667 (class 2606 OID 6799131)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2669 (class 2606 OID 6799121)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2649 (class 2606 OID 6799031)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2632 (class 2606 OID 6798961)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2633 (class 2606 OID 6798956)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2635 (class 2606 OID 6798946)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2634 (class 2606 OID 6798951)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2664 (class 2606 OID 6799111)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2665 (class 2606 OID 6799106)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2674 (class 2606 OID 6799156)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2615 (class 2606 OID 6798861)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2656 (class 2606 OID 6799066)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2598 (class 2606 OID 6798781)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2599 (class 2606 OID 6798776)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2603 (class 2606 OID 6798796)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2602 (class 2606 OID 6798801)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 6798921)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2626 (class 2606 OID 6798916)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2627 (class 2606 OID 6798911)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2675 (class 2606 OID 6799166)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2676 (class 2606 OID 6799161)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 09:46:27 CEST

--
-- PostgreSQL database dump complete
--

