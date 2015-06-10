--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 11:05:20 CEST

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
-- TOC entry 2862 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6810920)
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
-- TOC entry 227 (class 1259 OID 6811442)
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
-- TOC entry 226 (class 1259 OID 6811425)
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
-- TOC entry 219 (class 1259 OID 6811329)
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
-- TOC entry 194 (class 1259 OID 6811099)
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
-- TOC entry 197 (class 1259 OID 6811133)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6811042)
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
-- TOC entry 228 (class 1259 OID 6811456)
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
-- TOC entry 213 (class 1259 OID 6811259)
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
-- TOC entry 192 (class 1259 OID 6811079)
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
-- TOC entry 196 (class 1259 OID 6811127)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6811059)
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
-- TOC entry 202 (class 1259 OID 6811176)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6811201)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6811016)
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
-- TOC entry 181 (class 1259 OID 6810929)
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
-- TOC entry 182 (class 1259 OID 6810940)
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
-- TOC entry 177 (class 1259 OID 6810894)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6810913)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6811208)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6811239)
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
-- TOC entry 223 (class 1259 OID 6811375)
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
-- TOC entry 184 (class 1259 OID 6810973)
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
-- TOC entry 186 (class 1259 OID 6811008)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6811182)
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
-- TOC entry 185 (class 1259 OID 6810993)
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
-- TOC entry 191 (class 1259 OID 6811071)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6811194)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6811314)
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
-- TOC entry 222 (class 1259 OID 6811367)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6811482)
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
-- TOC entry 233 (class 1259 OID 6811529)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6811491)
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
-- TOC entry 231 (class 1259 OID 6811499)
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
-- TOC entry 209 (class 1259 OID 6811223)
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
-- TOC entry 201 (class 1259 OID 6811167)
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
-- TOC entry 200 (class 1259 OID 6811157)
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
-- TOC entry 221 (class 1259 OID 6811356)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6811291)
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
-- TOC entry 174 (class 1259 OID 6810865)
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
-- TOC entry 173 (class 1259 OID 6810863)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2863 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6811233)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6810903)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6810887)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6811247)
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
-- TOC entry 204 (class 1259 OID 6811188)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6811138)
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
-- TOC entry 236 (class 1259 OID 6811548)
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
-- TOC entry 235 (class 1259 OID 6811540)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6811535)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6811301)
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
-- TOC entry 183 (class 1259 OID 6810965)
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
-- TOC entry 199 (class 1259 OID 6811144)
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
-- TOC entry 220 (class 1259 OID 6811345)
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
-- TOC entry 232 (class 1259 OID 6811518)
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
-- TOC entry 188 (class 1259 OID 6811028)
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
-- TOC entry 175 (class 1259 OID 6810874)
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
-- TOC entry 225 (class 1259 OID 6811402)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    producent_id uuid,
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
-- TOC entry 193 (class 1259 OID 6811090)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6811215)
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
-- TOC entry 215 (class 1259 OID 6811284)
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
-- TOC entry 195 (class 1259 OID 6811122)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6811392)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6811274)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6810868)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2799 (class 0 OID 6810920)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6811442)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5577-fdcf-83d0-eee21fb4ec72	000d0000-5577-fdcf-3103-0afbb6074b99	\N	00090000-5577-fdcf-c39f-8e86c6521644	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-fdcf-115d-f69af32e08b1	000d0000-5577-fdcf-e2ff-566164631f22	\N	00090000-5577-fdcf-e747-3be76cdb764e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-fdcf-a78e-0d8902b46210	000d0000-5577-fdcf-890b-b95594b2b481	\N	00090000-5577-fdcf-7a1f-958adacfcdf5	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-fdcf-f1a5-2136f72c0a59	000d0000-5577-fdcf-e8f3-53811e45e786	\N	00090000-5577-fdcf-eb95-a9712eb24a86	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-fdcf-5938-6773cc9c0acf	000d0000-5577-fdcf-2023-06e85a1c165d	\N	00090000-5577-fdcf-6ffa-9b1cb9d08e3b	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5577-fdcf-fcdb-1259b5c5112a	000d0000-5577-fdcf-d826-c16177683a72	\N	00090000-5577-fdcf-e747-3be76cdb764e	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 6811425)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6811329)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5577-fdcf-749a-8a43e03b2077	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5577-fdcf-01f9-238811423302	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5577-fdcf-cccb-a2d6a19ab2db	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2813 (class 0 OID 6811099)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5577-fdcf-685c-1601e5446e97	\N	\N	00200000-5577-fdcf-ec5b-b9628b0bac54	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5577-fdcf-43a2-79ef7d75f614	\N	\N	00200000-5577-fdcf-ac57-83c8baabc26b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5577-fdcf-f8de-095b2e03b615	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5577-fdcf-7b11-2772b3675014	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5577-fdcf-87c4-568f94dfb4ff	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2816 (class 0 OID 6811133)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6811042)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5577-fdcd-db60-0bd5babc7986	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5577-fdcd-ac07-b8e4ad6fc891	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5577-fdcd-a513-a9a2ae3eebc0	AL	ALB	008	Albania 	Albanija	\N
00040000-5577-fdcd-7a52-f21462813f51	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5577-fdcd-19db-7977e63c5b91	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5577-fdcd-62dc-a1a55f4aba7f	AD	AND	020	Andorra 	Andora	\N
00040000-5577-fdcd-4c3b-bba9229a190c	AO	AGO	024	Angola 	Angola	\N
00040000-5577-fdcd-e842-b7b412281dc5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5577-fdcd-c8fe-21a260a418e6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5577-fdcd-e429-6757ba9f141d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5577-fdcd-a481-4eae55678b43	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5577-fdcd-73ad-d06d254a305e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5577-fdcd-b70f-5099c493f9fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5577-fdcd-9a0b-b4a86964b944	AU	AUS	036	Australia 	Avstralija	\N
00040000-5577-fdcd-f853-dfe1b875ff62	AT	AUT	040	Austria 	Avstrija	\N
00040000-5577-fdcd-da92-3e7a66bb18ee	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5577-fdcd-7818-c35d43de1071	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5577-fdcd-786f-faf88d9058be	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5577-fdcd-0beb-6964697435ee	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5577-fdcd-b525-b22fc312d1c8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5577-fdcd-28ed-fa408c2236c8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5577-fdcd-d167-d1cf8ba80c56	BE	BEL	056	Belgium 	Belgija	\N
00040000-5577-fdcd-14b2-11a9911a811d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5577-fdcd-64f6-e86f80841620	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5577-fdcd-2dd8-98f116a7526f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5577-fdcd-8d4d-a03a6e18ffe0	BT	BTN	064	Bhutan 	Butan	\N
00040000-5577-fdcd-759d-27b085340743	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5577-fdcd-b2c0-41b68d676b12	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5577-fdcd-1dc1-ce79eb5053f7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5577-fdcd-73fc-2666983bc58a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5577-fdcd-ede4-86e1c37d2904	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5577-fdcd-1f0e-b87361042040	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5577-fdcd-fcbc-724d9042b408	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5577-fdcd-d9a2-53fc30e31cd3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5577-fdcd-15d8-6606f52e45a4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5577-fdcd-1832-1ed631c76263	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5577-fdcd-fe37-62a665c1a698	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5577-fdcd-97b9-772f59abc78e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5577-fdcd-6287-1bd98084826b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5577-fdcd-8c27-a36e7915bc2f	CA	CAN	124	Canada 	Kanada	\N
00040000-5577-fdcd-3217-b1d38bb2cbfa	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5577-fdcd-5297-0c41f6308e4d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5577-fdcd-a097-4dd4e0ee781a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5577-fdcd-67fc-151e34b6827b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5577-fdcd-d17c-e885e5f5021e	CL	CHL	152	Chile 	Čile	\N
00040000-5577-fdcd-7d1e-c1154c43a12a	CN	CHN	156	China 	Kitajska	\N
00040000-5577-fdcd-df70-1270d5f246e4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5577-fdcd-186e-00e30cd0e732	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5577-fdcd-6414-881d95a6aee4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5577-fdcd-55f6-d0b1d5282d24	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5577-fdcd-fc70-64f0c70f1fe3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5577-fdcd-c14d-5a64530ec558	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5577-fdcd-1996-9fad1279545a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5577-fdcd-c720-76e14b8263fd	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5577-fdcd-f8b8-e2d393b8d179	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5577-fdcd-0d40-0a10fb43c15d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5577-fdcd-590f-ff74f5acb8d9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5577-fdcd-f7d5-53c32b7a0b22	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5577-fdcd-a34f-aa7db09cce9d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5577-fdcd-b5a9-23180ef714c9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5577-fdcd-e333-2e27c50632bd	DK	DNK	208	Denmark 	Danska	\N
00040000-5577-fdcd-5617-57fb875768e4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5577-fdcd-ba13-55f4c36386d9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5577-fdcd-39c3-0cf775ebea1e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5577-fdcd-1a21-b7496e67b610	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5577-fdcd-eaac-81ac8ab17bd5	EG	EGY	818	Egypt 	Egipt	\N
00040000-5577-fdcd-6e99-2651cd828068	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5577-fdcd-c417-0ba4de72ee29	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5577-fdcd-23ea-23e45c4f44f6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5577-fdcd-f796-f578b3622fa6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5577-fdcd-d3ea-ba6f5fec816e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5577-fdcd-8a45-779a15b0e7c2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5577-fdcd-8396-b7c422fb2256	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5577-fdcd-5e04-bb9c76e928c7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5577-fdcd-1cfa-d45d6b66ba19	FI	FIN	246	Finland 	Finska	\N
00040000-5577-fdcd-9282-d3e1a4cc137d	FR	FRA	250	France 	Francija	\N
00040000-5577-fdcd-c125-ecf9be9e27c2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5577-fdcd-e748-ec604d83c7a9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5577-fdcd-1ddc-a5d5dc587603	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5577-fdcd-5c5e-8ada2b68e47c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5577-fdcd-e4bc-19f24c17c22d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5577-fdcd-2233-20c405ec0cf6	GM	GMB	270	Gambia 	Gambija	\N
00040000-5577-fdcd-1040-9940349ccc74	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5577-fdcd-f92c-85502179048d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5577-fdcd-77ca-9f2ec622e590	GH	GHA	288	Ghana 	Gana	\N
00040000-5577-fdcd-c2d5-4dbaa3ea85b6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5577-fdcd-9c04-6a9d87376107	GR	GRC	300	Greece 	Grčija	\N
00040000-5577-fdcd-f6df-4a7d7d86438d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5577-fdcd-1a16-c533befe339f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5577-fdcd-85b5-4fca4ae7806e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5577-fdcd-73c3-6dbb122fcf5d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5577-fdcd-d8d4-f4d347d98d43	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5577-fdcd-493e-6fdcbf64622f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5577-fdcd-7550-19826a3f5fee	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5577-fdcd-23c9-8801ad45f82b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5577-fdcd-47c0-324c681fea1b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5577-fdcd-3165-fb09ba068912	HT	HTI	332	Haiti 	Haiti	\N
00040000-5577-fdcd-ac4b-d5e49f719c3f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5577-fdcd-1dce-214622ba8940	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5577-fdcd-0b3a-87479cca0dc7	HN	HND	340	Honduras 	Honduras	\N
00040000-5577-fdcd-2a6f-f1eb71467ed9	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5577-fdcd-45b3-fa103c5f8906	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5577-fdcd-8fe1-74e5ef2cf557	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5577-fdcd-5d45-79ea5e4331a6	IN	IND	356	India 	Indija	\N
00040000-5577-fdcd-348a-e0c20ca9e349	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5577-fdcd-3537-4cafe3de3611	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5577-fdcd-5034-8d1b4a8f0aa5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5577-fdcd-a722-29759caa19af	IE	IRL	372	Ireland 	Irska	\N
00040000-5577-fdcd-b3c6-6d7132f16e14	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5577-fdcd-888b-032dc0015f66	IL	ISR	376	Israel 	Izrael	\N
00040000-5577-fdcd-cece-d1cbe9187055	IT	ITA	380	Italy 	Italija	\N
00040000-5577-fdcd-f270-d5fa9234ac7f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5577-fdcd-4a84-b89cadb7a2a6	JP	JPN	392	Japan 	Japonska	\N
00040000-5577-fdcd-728f-6029b5153738	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5577-fdcd-5547-9203e80fbf95	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5577-fdcd-1297-02db95f57b74	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5577-fdcd-f8bd-fc9d79562b87	KE	KEN	404	Kenya 	Kenija	\N
00040000-5577-fdcd-1cf9-4cea7d9f0875	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5577-fdcd-601a-ddaa55e479bd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5577-fdcd-e80f-39283789769d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5577-fdcd-83f3-a604024ca867	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5577-fdcd-d1bd-769436809f8a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5577-fdcd-9bd0-b669c6e83fe3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5577-fdcd-57d7-17a277b3d8ca	LV	LVA	428	Latvia 	Latvija	\N
00040000-5577-fdcd-3fb3-f87c7335b253	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5577-fdcd-6ae0-9c4dffae57ec	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5577-fdcd-b1c5-c904c0845e77	LR	LBR	430	Liberia 	Liberija	\N
00040000-5577-fdcd-ce11-d64d73eba48f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5577-fdcd-483a-6b695e54d985	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5577-fdcd-ddc8-e099d11844ee	LT	LTU	440	Lithuania 	Litva	\N
00040000-5577-fdcd-4427-0509e7a72c71	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5577-fdcd-e0d5-d89853ce2853	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5577-fdcd-9ab4-0bdd10654b20	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5577-fdcd-259d-c238615bec88	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5577-fdcd-7c30-7a657d059fe4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5577-fdcd-5687-1e06409fd4bb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5577-fdcd-f0f4-dab09408635b	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5577-fdcd-35f1-f9ce045adf32	ML	MLI	466	Mali 	Mali	\N
00040000-5577-fdcd-8709-180a2287d103	MT	MLT	470	Malta 	Malta	\N
00040000-5577-fdcd-93fe-0aab551da66f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5577-fdcd-4e83-da36332ea521	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5577-fdcd-bdf0-7b48426e120b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5577-fdcd-7613-9e6d6a60fb06	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5577-fdcd-38c8-3e6b195e05b5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5577-fdcd-238c-2249ef59f0ee	MX	MEX	484	Mexico 	Mehika	\N
00040000-5577-fdcd-cf5d-adc42f39731f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5577-fdcd-9f37-97ba4e288351	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5577-fdcd-980e-8ebea59540c3	MC	MCO	492	Monaco 	Monako	\N
00040000-5577-fdcd-42dc-e493aa4bb39f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5577-fdcd-c9e9-42a906db0954	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5577-fdcd-26f1-59a48fb64ebc	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5577-fdcd-86f0-77cdc6cf9bac	MA	MAR	504	Morocco 	Maroko	\N
00040000-5577-fdcd-339f-b69bde9fc9bb	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5577-fdcd-2f67-756cc2ebe797	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5577-fdcd-0f67-b5decacecb90	NA	NAM	516	Namibia 	Namibija	\N
00040000-5577-fdcd-db38-05c4452fac4a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5577-fdcd-21f6-a35974559a06	NP	NPL	524	Nepal 	Nepal	\N
00040000-5577-fdcd-bdab-dd197954645d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5577-fdcd-4949-1386793356be	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5577-fdcd-4246-028d44ef8544	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5577-fdcd-299a-16695dd4ab3f	NE	NER	562	Niger 	Niger 	\N
00040000-5577-fdcd-5726-71e884391e66	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5577-fdcd-8522-64ad204e82ba	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5577-fdcd-bf6c-6ae198ca4a91	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5577-fdcd-1e4f-29ca57ef0372	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5577-fdcd-d3f2-1e149f53c2cf	NO	NOR	578	Norway 	Norveška	\N
00040000-5577-fdcd-f776-af3db9658f50	OM	OMN	512	Oman 	Oman	\N
00040000-5577-fdcd-3d74-dcd1d70053b1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5577-fdcd-fb9c-91c80e70592b	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5577-fdcd-779f-13a818d2c339	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5577-fdcd-3025-02ee8d634e12	PA	PAN	591	Panama 	Panama	\N
00040000-5577-fdcd-b05c-9883dc8edc04	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5577-fdcd-9fba-9a64199517f4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5577-fdcd-0cac-1a3ca91a8198	PE	PER	604	Peru 	Peru	\N
00040000-5577-fdcd-831b-8d24291d1a1f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5577-fdcd-41bf-3ef8ec58976f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5577-fdcd-eb1a-33bbff96fbc8	PL	POL	616	Poland 	Poljska	\N
00040000-5577-fdcd-0cb9-9efcf674928f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5577-fdcd-70da-78db9fba151d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5577-fdcd-c386-a745dc175dc2	QA	QAT	634	Qatar 	Katar	\N
00040000-5577-fdcd-ccff-0c81fa129924	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5577-fdcd-dd35-a2bfda4c0ff5	RO	ROU	642	Romania 	Romunija	\N
00040000-5577-fdcd-2f2c-5ad56000d711	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5577-fdcd-e1fc-beae5a7b02e4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5577-fdcd-dbb4-30caaa096a7a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5577-fdcd-4d67-2411487fb1e2	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5577-fdcd-0ea4-9998e69339a6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5577-fdcd-904a-e719fb42eb11	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5577-fdcd-b7aa-35ca9504c79f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5577-fdcd-2078-53bb6d849772	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5577-fdcd-791a-98ce61f57007	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5577-fdcd-0853-4ab565b47c02	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5577-fdcd-e4eb-b63298f1b472	SM	SMR	674	San Marino 	San Marino	\N
00040000-5577-fdcd-289a-6d8e26dbae1a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5577-fdcd-5a1b-2d44dfba84e6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5577-fdcd-c9d9-1fdc353f3c44	SN	SEN	686	Senegal 	Senegal	\N
00040000-5577-fdcd-d1c0-dba69a435c97	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5577-fdcd-cdcd-11bc7b9b2d59	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5577-fdcd-3df9-d8e34f8dc9dd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5577-fdcd-307a-b2d1b5f9b36e	SG	SGP	702	Singapore 	Singapur	\N
00040000-5577-fdcd-a7c2-288d2eab5141	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5577-fdcd-61f1-b0faa0a9285f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5577-fdcd-7594-417283aa4f87	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5577-fdcd-370b-90eb3e2e277e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5577-fdcd-4734-d2a8266bc0bc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5577-fdcd-9e81-62a1836ab8c8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5577-fdcd-9291-f519c49bfc29	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5577-fdcd-c54c-7952dea6b9a1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5577-fdcd-1dfc-04b7fb0b925e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5577-fdcd-563c-2811947ed96a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5577-fdcd-ffe3-9f4cd5a7c942	SD	SDN	729	Sudan 	Sudan	\N
00040000-5577-fdce-b59e-baf0ebc86bd1	SR	SUR	740	Suriname 	Surinam	\N
00040000-5577-fdce-e4ec-9b958fd501fa	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5577-fdce-e99b-9b226425459e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5577-fdce-edb4-cab8ed2d1673	SE	SWE	752	Sweden 	Švedska	\N
00040000-5577-fdce-48d2-2269dc8c3606	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5577-fdce-949f-e758552999d8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5577-fdce-cc66-3c6bf855d588	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5577-fdce-3e0a-eea3df08374d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5577-fdce-3afd-2a5c8c2a5249	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5577-fdce-9965-7d8148ee38ef	TH	THA	764	Thailand 	Tajska	\N
00040000-5577-fdce-70c0-cf8d17f518e8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5577-fdce-edc9-5a63c326cf43	TG	TGO	768	Togo 	Togo	\N
00040000-5577-fdce-b7d4-0633164b7386	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5577-fdce-2d63-cbb03c5cde1a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5577-fdce-3a34-2414dc7ae48a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5577-fdce-2142-f18170ef6cb2	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5577-fdce-77ac-b2c71e8f1c19	TR	TUR	792	Turkey 	Turčija	\N
00040000-5577-fdce-55c2-b91a4ce21889	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5577-fdce-3ebd-f38d63affc68	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5577-fdce-1651-49aab6bb31e8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5577-fdce-9ead-00e0b8994555	UG	UGA	800	Uganda 	Uganda	\N
00040000-5577-fdce-721d-72677e57038a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5577-fdce-4dcf-880afaf78993	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5577-fdce-fa14-eead10bed7c3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5577-fdce-4ee6-a74ed5b55d87	US	USA	840	United States 	Združene države Amerike	\N
00040000-5577-fdce-83e0-d528747e2978	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5577-fdce-861f-8a7852f5342a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5577-fdce-ec73-d0f24a29a16a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5577-fdce-460f-fea4b45b06cb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5577-fdce-7afc-b16d64cea649	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5577-fdce-48f9-4c4d0aceab0b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5577-fdce-58b4-a9fd92abc4ab	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5577-fdce-c624-e8154429da3a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5577-fdce-734f-19c9da9b29a8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5577-fdce-c983-31d6f03ed743	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5577-fdce-dc69-3854cc09d2ba	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5577-fdce-dd0b-0bbf9a9f18be	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5577-fdce-4192-c0370ee54d79	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2847 (class 0 OID 6811456)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6811259)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5577-fdcf-dbcf-8d3f309b4b66	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5577-fdcd-aec4-c8efd27965d1
000d0000-5577-fdcf-3103-0afbb6074b99	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5577-fdcd-aec4-c8efd27965d1
000d0000-5577-fdcf-e2ff-566164631f22	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5577-fdcd-cd63-159dd8ca6a3f
000d0000-5577-fdcf-890b-b95594b2b481	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5577-fdcd-6274-fd01d8cd750b
000d0000-5577-fdcf-e8f3-53811e45e786	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5577-fdcd-6274-fd01d8cd750b
000d0000-5577-fdcf-2023-06e85a1c165d	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5577-fdcd-6274-fd01d8cd750b
000d0000-5577-fdcf-d826-c16177683a72	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5577-fdcd-aec4-c8efd27965d1
\.


--
-- TOC entry 2811 (class 0 OID 6811079)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6811127)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6811059)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5577-fdcf-c56e-f413bcc35519	00080000-5577-fdcf-0325-570c3fe5616d	00090000-5577-fdcf-c39f-8e86c6521644	AK		
\.


--
-- TOC entry 2789 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6811176)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6811201)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6811016)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5577-fdce-2cac-cdaa6718524b	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5577-fdce-faf4-ded928bc39d1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5577-fdce-64c9-81af26963bc4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5577-fdce-3104-10b44d16caa9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5577-fdce-b098-b93499d44641	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5577-fdce-0356-59c66e31f80e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5577-fdce-5203-e2d71263c9ff	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5577-fdce-4c30-a127f625ae9b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5577-fdce-ba00-bd0f4e43445c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5577-fdce-2ead-d1d36fed510d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5577-fdce-874a-98ed44641732	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5577-fdce-eeac-c7bc6c98fa36	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5577-fdce-4a7a-631cf3c88e95	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5577-fdce-5db4-bcf1a2b624ba	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5577-fdce-fc69-4e30f4457792	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5577-fdce-76aa-664df4ac4133	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2800 (class 0 OID 6810929)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5577-fdce-98eb-438d78160d99	00000000-5577-fdce-b098-b93499d44641	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5577-fdce-1426-2c71650708ea	00000000-5577-fdce-b098-b93499d44641	00010000-5577-fdce-5f30-0688294681bb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5577-fdce-8332-5287d174e6f5	00000000-5577-fdce-0356-59c66e31f80e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2801 (class 0 OID 6810940)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5577-fdcf-7dc9-650bfa1cdaa7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5577-fdcf-eb95-a9712eb24a86	00010000-5577-fdcf-7810-f9936f57451b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5577-fdcf-7a1f-958adacfcdf5	00010000-5577-fdcf-65d2-4832201841ce	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5577-fdcf-5d4f-9362ad9308a7	00010000-5577-fdcf-e24e-4dcabdbce300	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5577-fdcf-3357-845d6a43ba60	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5577-fdcf-d4d6-4eb519462155	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5577-fdcf-4569-54cc22d260c1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5577-fdcf-9b1a-aa06dfdd7154	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5577-fdcf-c39f-8e86c6521644	00010000-5577-fdcf-b007-3d90841cda1a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5577-fdcf-e747-3be76cdb764e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5577-fdcf-a7b6-7c367b6a73dc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5577-fdcf-6ffa-9b1cb9d08e3b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5577-fdcf-447d-a3a905651472	00010000-5577-fdcf-a06e-3b080e25d37d	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2791 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6810894)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5577-fdce-22be-433c1828ca42	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5577-fdce-7e86-ca700077158a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5577-fdce-c2df-f29d553ca9f1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5577-fdce-39e8-0f6925847808	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5577-fdce-5812-9ff7a0e9918d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5577-fdce-545e-b3a3b84e43cb	Abonma-read	Abonma - branje	f
00030000-5577-fdce-81d9-194b3363e373	Abonma-write	Abonma - spreminjanje	f
00030000-5577-fdce-083e-a56f8607cc8a	Alternacija-read	Alternacija - branje	f
00030000-5577-fdce-b79a-9f8729f8c4ad	Alternacija-write	Alternacija - spreminjanje	f
00030000-5577-fdce-31b8-5973bb2ccc76	Arhivalija-read	Arhivalija - branje	f
00030000-5577-fdce-c850-c47955fded18	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5577-fdce-19e8-5c570668e23a	Besedilo-read	Besedilo - branje	f
00030000-5577-fdce-a735-47485513972f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5577-fdce-77a5-99c3f1f19823	DogodekIzven-read	DogodekIzven - branje	f
00030000-5577-fdce-9cc2-a3d2032c6b85	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5577-fdce-43d4-1e82be768831	Dogodek-read	Dogodek - branje	f
00030000-5577-fdce-8dca-952e18915643	Dogodek-write	Dogodek - spreminjanje	f
00030000-5577-fdce-4064-f1fa4f50c463	Drzava-read	Drzava - branje	f
00030000-5577-fdce-278a-f9e3d96f9644	Drzava-write	Drzava - spreminjanje	f
00030000-5577-fdce-7046-e0f64e8b160c	Funkcija-read	Funkcija - branje	f
00030000-5577-fdce-3576-49934b8e4400	Funkcija-write	Funkcija - spreminjanje	f
00030000-5577-fdce-4da7-e1f6a99013cf	Gostovanje-read	Gostovanje - branje	f
00030000-5577-fdce-6df6-ed7c6449c13d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5577-fdce-01c9-29453ee89bfa	Gostujoca-read	Gostujoca - branje	f
00030000-5577-fdce-71d7-6d35601c266d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5577-fdce-45a8-af0c585b9b3e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5577-fdce-3378-90fd4fc7d9b3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5577-fdce-3870-aaf346fd74df	Kupec-read	Kupec - branje	f
00030000-5577-fdce-1a4f-bfa085817913	Kupec-write	Kupec - spreminjanje	f
00030000-5577-fdce-d1a7-6a75fbe56f54	NacinPlacina-read	NacinPlacina - branje	f
00030000-5577-fdce-e6e8-40448e3ec6d5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5577-fdce-cd18-f284c01ae74b	Option-read	Option - branje	f
00030000-5577-fdce-2be2-d188a8fc02df	Option-write	Option - spreminjanje	f
00030000-5577-fdce-cf4b-371effc979ef	OptionValue-read	OptionValue - branje	f
00030000-5577-fdce-4163-cb74bac146d6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5577-fdce-b45f-7221a5061481	Oseba-read	Oseba - branje	f
00030000-5577-fdce-eddc-cf596d838cc3	Oseba-write	Oseba - spreminjanje	f
00030000-5577-fdce-1246-a1b6659d8e68	Permission-read	Permission - branje	f
00030000-5577-fdce-2845-0c14b6bf8e37	Permission-write	Permission - spreminjanje	f
00030000-5577-fdce-bd03-a743fcf5d775	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5577-fdce-e12e-aae647dcd800	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5577-fdce-ee84-d5a87b7cdea3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5577-fdce-1f3f-0deac283e66e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5577-fdce-d413-261c9039c08f	Pogodba-read	Pogodba - branje	f
00030000-5577-fdce-0a44-1687f34a8fe4	Pogodba-write	Pogodba - spreminjanje	f
00030000-5577-fdce-4800-1e53d429592c	Popa-read	Popa - branje	f
00030000-5577-fdce-610e-01d837106993	Popa-write	Popa - spreminjanje	f
00030000-5577-fdce-0570-c75a1652a6ac	Posta-read	Posta - branje	f
00030000-5577-fdce-6bcf-82e7a9ca8bc5	Posta-write	Posta - spreminjanje	f
00030000-5577-fdce-218a-c2623a0bb132	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5577-fdce-a522-3188789f358e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5577-fdce-ab21-f36f45a5353c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5577-fdce-7a55-7274a419fcb6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5577-fdce-e0ee-11080f2f4132	Predstava-read	Predstava - branje	f
00030000-5577-fdce-e8d1-fc247624841d	Predstava-write	Predstava - spreminjanje	f
00030000-5577-fdce-143c-77a6facb957e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5577-fdce-65a2-bd2eb581b44d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5577-fdce-47e7-8a50dea3dc92	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5577-fdce-2062-8ff2bdd3f02b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5577-fdce-ca85-e0f8c475533d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5577-fdce-5765-114dc43d9526	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5577-fdce-259a-9065d9fa0e5d	ProgramDela-read	ProgramDela - branje	f
00030000-5577-fdce-6663-e29dabfd22fb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5577-fdce-8122-3d29afdf94a3	ProgramFestival-read	ProgramFestival - branje	f
00030000-5577-fdce-ac39-33eee395434d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5577-fdce-620c-76119b18e9fe	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5577-fdce-7115-c357db6fd320	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5577-fdce-a596-ca8c080c6860	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5577-fdce-4f4c-06648ba5f1b8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5577-fdce-71f5-e716da97ad8d	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5577-fdce-b28d-b0ddc072904a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5577-fdce-7643-1670159067d8	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5577-fdce-6efc-0acf58ae155d	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5577-fdce-c980-9cae7bf568b4	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5577-fdce-e7e0-df14624d14ff	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5577-fdce-8f70-ef146f00dd4b	Prostor-read	Prostor - branje	f
00030000-5577-fdce-a649-79a68fe8e541	Prostor-write	Prostor - spreminjanje	f
00030000-5577-fdce-4d01-9dbdc0c662cf	Racun-read	Racun - branje	f
00030000-5577-fdce-c31e-969dce625897	Racun-write	Racun - spreminjanje	f
00030000-5577-fdce-be47-de6a8e08a07b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5577-fdce-f71a-34edc3fe27ed	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5577-fdce-dd41-b9a35fb05a3d	Readme-read	Readme - branje	f
00030000-5577-fdce-96e5-199a8c175b1c	Readme-write	Readme - spreminjanje	f
00030000-5577-fdce-0577-57b8414c80c9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5577-fdce-1276-d0e55b0b3a80	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5577-fdce-55df-47fa8f447994	Rekvizit-read	Rekvizit - branje	f
00030000-5577-fdce-c65c-28aa2347f696	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5577-fdce-f101-1e0b6019d728	Revizija-read	Revizija - branje	f
00030000-5577-fdce-5c22-7c4c872280f0	Revizija-write	Revizija - spreminjanje	f
00030000-5577-fdce-c9de-0004dc07deaa	Rezervacija-read	Rezervacija - branje	f
00030000-5577-fdce-844e-875b291d2cfb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5577-fdce-cba7-c76d10dadc6e	Role-read	Role - branje	f
00030000-5577-fdce-5b47-4685ff651740	Role-write	Role - spreminjanje	f
00030000-5577-fdce-bcc3-fe57ccbf6331	SedezniRed-read	SedezniRed - branje	f
00030000-5577-fdce-58a8-88bfbd38e543	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5577-fdce-53de-8cec7ac0e91d	Sedez-read	Sedez - branje	f
00030000-5577-fdce-7caf-875420557e0a	Sedez-write	Sedez - spreminjanje	f
00030000-5577-fdce-acc6-2ebb9de9f07e	Sezona-read	Sezona - branje	f
00030000-5577-fdce-0a2d-3e695800b647	Sezona-write	Sezona - spreminjanje	f
00030000-5577-fdce-7977-1dce8277f017	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5577-fdce-6779-7d2c9ba97022	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5577-fdce-b693-9c1fd334d33e	Stevilcenje-read	Stevilcenje - branje	f
00030000-5577-fdce-22e3-d415b53febb4	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5577-fdce-40fa-928b814ef8e9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5577-fdce-f76a-785008e2c990	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5577-fdce-d3b3-251aaf46ca41	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5577-fdce-fc93-290371c3479d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5577-fdce-36d9-d46e4dcbb704	Telefonska-read	Telefonska - branje	f
00030000-5577-fdce-c764-4e60a28e98ed	Telefonska-write	Telefonska - spreminjanje	f
00030000-5577-fdce-af51-fc6210d39aac	TerminStoritve-read	TerminStoritve - branje	f
00030000-5577-fdce-7829-355f1f73f689	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5577-fdce-371d-6e9eb51f3587	TipFunkcije-read	TipFunkcije - branje	f
00030000-5577-fdce-48d3-567f3a75e879	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5577-fdce-7b45-8d7f351b8576	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5577-fdce-de24-043c3f6c0d59	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5577-fdce-35d7-ed199750f99e	Trr-read	Trr - branje	f
00030000-5577-fdce-355d-2a63c5a62a9c	Trr-write	Trr - spreminjanje	f
00030000-5577-fdce-a873-0697f95c11cd	Uprizoritev-read	Uprizoritev - branje	f
00030000-5577-fdce-6fce-b445a6dc8d8c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5577-fdce-90a7-54182083d17e	User-read	User - branje	f
00030000-5577-fdce-9e61-7a07daa0e137	User-write	User - spreminjanje	f
00030000-5577-fdce-6c8d-b4346d55595c	Vaja-read	Vaja - branje	f
00030000-5577-fdce-2a7a-c6a68fd5b84c	Vaja-write	Vaja - spreminjanje	f
00030000-5577-fdce-2b24-20b46bf66bc8	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5577-fdce-bfee-598cfadc670a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5577-fdce-9e96-dfa79a106245	Zaposlitev-read	Zaposlitev - branje	f
00030000-5577-fdce-4f70-7c8ba87d2007	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5577-fdce-ba9e-86ea8bf82031	Zasedenost-read	Zasedenost - branje	f
00030000-5577-fdce-7bb9-d0a7fff0b2c4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5577-fdce-a72a-c9fd6132930b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5577-fdce-660b-58057d8a95aa	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5577-fdce-87c5-b68ab9edb226	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5577-fdce-6c14-4deea0c8a9fe	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2798 (class 0 OID 6810913)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5577-fdce-e153-3012103dd2c2	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-545e-b3a3b84e43cb
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-81d9-194b3363e373
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-083e-a56f8607cc8a
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-b79a-9f8729f8c4ad
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-31b8-5973bb2ccc76
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-43d4-1e82be768831
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-39e8-0f6925847808
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-8dca-952e18915643
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-278a-f9e3d96f9644
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-7046-e0f64e8b160c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-3576-49934b8e4400
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-4da7-e1f6a99013cf
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-6df6-ed7c6449c13d
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-01c9-29453ee89bfa
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-71d7-6d35601c266d
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-45a8-af0c585b9b3e
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-3378-90fd4fc7d9b3
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-cd18-f284c01ae74b
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-cf4b-371effc979ef
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-b45f-7221a5061481
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-eddc-cf596d838cc3
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-4800-1e53d429592c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-610e-01d837106993
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-0570-c75a1652a6ac
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-6bcf-82e7a9ca8bc5
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-ab21-f36f45a5353c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-7a55-7274a419fcb6
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-e0ee-11080f2f4132
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-e8d1-fc247624841d
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-ca85-e0f8c475533d
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-5765-114dc43d9526
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-8f70-ef146f00dd4b
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-a649-79a68fe8e541
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-0577-57b8414c80c9
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-1276-d0e55b0b3a80
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-55df-47fa8f447994
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-c65c-28aa2347f696
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-acc6-2ebb9de9f07e
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-0a2d-3e695800b647
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-371d-6e9eb51f3587
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-a873-0697f95c11cd
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-6fce-b445a6dc8d8c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-6c8d-b4346d55595c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-2a7a-c6a68fd5b84c
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-ba9e-86ea8bf82031
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-7bb9-d0a7fff0b2c4
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-a72a-c9fd6132930b
00020000-5577-fdce-00a4-0aa49900430c	00030000-5577-fdce-87c5-b68ab9edb226
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-545e-b3a3b84e43cb
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-31b8-5973bb2ccc76
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-43d4-1e82be768831
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-4da7-e1f6a99013cf
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-01c9-29453ee89bfa
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-45a8-af0c585b9b3e
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-3378-90fd4fc7d9b3
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-cd18-f284c01ae74b
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-cf4b-371effc979ef
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-b45f-7221a5061481
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-eddc-cf596d838cc3
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-4800-1e53d429592c
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-0570-c75a1652a6ac
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-ab21-f36f45a5353c
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-7a55-7274a419fcb6
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-e0ee-11080f2f4132
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-8f70-ef146f00dd4b
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-0577-57b8414c80c9
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-55df-47fa8f447994
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-acc6-2ebb9de9f07e
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-36d9-d46e4dcbb704
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-c764-4e60a28e98ed
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-35d7-ed199750f99e
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-355d-2a63c5a62a9c
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-9e96-dfa79a106245
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-4f70-7c8ba87d2007
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-a72a-c9fd6132930b
00020000-5577-fdce-15ce-50aeaff7ca73	00030000-5577-fdce-87c5-b68ab9edb226
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-545e-b3a3b84e43cb
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-083e-a56f8607cc8a
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-31b8-5973bb2ccc76
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-c850-c47955fded18
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-19e8-5c570668e23a
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-77a5-99c3f1f19823
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-43d4-1e82be768831
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-7046-e0f64e8b160c
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-4da7-e1f6a99013cf
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-01c9-29453ee89bfa
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-45a8-af0c585b9b3e
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-cd18-f284c01ae74b
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-cf4b-371effc979ef
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-b45f-7221a5061481
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-4800-1e53d429592c
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-0570-c75a1652a6ac
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-e0ee-11080f2f4132
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-ca85-e0f8c475533d
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-8f70-ef146f00dd4b
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-0577-57b8414c80c9
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-55df-47fa8f447994
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-acc6-2ebb9de9f07e
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-371d-6e9eb51f3587
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-6c8d-b4346d55595c
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-ba9e-86ea8bf82031
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-a72a-c9fd6132930b
00020000-5577-fdce-41b3-2477133e2288	00030000-5577-fdce-87c5-b68ab9edb226
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-545e-b3a3b84e43cb
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-81d9-194b3363e373
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-b79a-9f8729f8c4ad
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-31b8-5973bb2ccc76
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-43d4-1e82be768831
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-4da7-e1f6a99013cf
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-01c9-29453ee89bfa
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-cd18-f284c01ae74b
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-cf4b-371effc979ef
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-4800-1e53d429592c
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-0570-c75a1652a6ac
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-e0ee-11080f2f4132
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-8f70-ef146f00dd4b
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-0577-57b8414c80c9
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-55df-47fa8f447994
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-acc6-2ebb9de9f07e
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-371d-6e9eb51f3587
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-a72a-c9fd6132930b
00020000-5577-fdce-c8c8-377ba6cdc3ea	00030000-5577-fdce-87c5-b68ab9edb226
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-545e-b3a3b84e43cb
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-31b8-5973bb2ccc76
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-43d4-1e82be768831
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-4064-f1fa4f50c463
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-4da7-e1f6a99013cf
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-01c9-29453ee89bfa
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-cd18-f284c01ae74b
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-cf4b-371effc979ef
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-4800-1e53d429592c
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-0570-c75a1652a6ac
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-e0ee-11080f2f4132
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-8f70-ef146f00dd4b
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-0577-57b8414c80c9
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-55df-47fa8f447994
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-acc6-2ebb9de9f07e
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-af51-fc6210d39aac
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-c2df-f29d553ca9f1
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-371d-6e9eb51f3587
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-a72a-c9fd6132930b
00020000-5577-fdce-31e4-6c308e31ceaa	00030000-5577-fdce-87c5-b68ab9edb226
\.


--
-- TOC entry 2826 (class 0 OID 6811208)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6811239)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6811375)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6810973)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5577-fdcf-0325-570c3fe5616d	00040000-5577-fdcd-db60-0bd5babc7986	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-fdcf-a60b-94adf0244fdb	00040000-5577-fdcd-db60-0bd5babc7986	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-fdcf-ab36-4d9855cc9051	00040000-5577-fdcd-db60-0bd5babc7986	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5577-fdcf-5898-7d6473fbefb7	00040000-5577-fdcd-db60-0bd5babc7986	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2805 (class 0 OID 6811008)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5577-fdcd-25e8-34752967643b	8341	Adlešiči
00050000-5577-fdcd-970f-086cada5453c	5270	Ajdovščina
00050000-5577-fdcd-8626-4ad1780ff3fc	6280	Ankaran/Ancarano
00050000-5577-fdcd-63ea-b579bc74a82f	9253	Apače
00050000-5577-fdcd-7cfb-7f2f0a0f9bb2	8253	Artiče
00050000-5577-fdcd-8505-5871affd157c	4275	Begunje na Gorenjskem
00050000-5577-fdcd-7cbf-97400a9ba4c7	1382	Begunje pri Cerknici
00050000-5577-fdcd-38ca-b47f2730d6ca	9231	Beltinci
00050000-5577-fdcd-6166-6cf288af73ed	2234	Benedikt
00050000-5577-fdcd-66ec-00a8b8b8818e	2345	Bistrica ob Dravi
00050000-5577-fdcd-ece6-e11d7783e5cf	3256	Bistrica ob Sotli
00050000-5577-fdcd-9848-61214369dcbf	8259	Bizeljsko
00050000-5577-fdcd-2f77-0a92e5a61bf2	1223	Blagovica
00050000-5577-fdcd-dc0b-f9e2fd6430dd	8283	Blanca
00050000-5577-fdcd-c07b-f49d7279a250	4260	Bled
00050000-5577-fdcd-3dc4-b55c81f16534	4273	Blejska Dobrava
00050000-5577-fdcd-9dc5-1ae84879f4e3	9265	Bodonci
00050000-5577-fdcd-fd7a-2d5e4c699883	9222	Bogojina
00050000-5577-fdcd-6281-73406cbf4b25	4263	Bohinjska Bela
00050000-5577-fdcd-0ecd-d1b84f78b4b9	4264	Bohinjska Bistrica
00050000-5577-fdcd-3f59-c8fd1f8595a2	4265	Bohinjsko jezero
00050000-5577-fdcd-175b-d2b89a0aa144	1353	Borovnica
00050000-5577-fdcd-7555-656fe9ea4b35	8294	Boštanj
00050000-5577-fdcd-8e83-92b7c33a5372	5230	Bovec
00050000-5577-fdcd-41de-ecd5feea0777	5295	Branik
00050000-5577-fdcd-a40e-abd7a32d1812	3314	Braslovče
00050000-5577-fdcd-5308-8fc45a1e67f9	5223	Breginj
00050000-5577-fdcd-db32-0b6ebd48f38b	8280	Brestanica
00050000-5577-fdcd-9a2d-7120170709db	2354	Bresternica
00050000-5577-fdcd-4f71-a57a1f48a67f	4243	Brezje
00050000-5577-fdcd-0079-c76357bbe649	1351	Brezovica pri Ljubljani
00050000-5577-fdcd-542e-22ea2e1b8edf	8250	Brežice
00050000-5577-fdcd-c492-4aa68c02e250	4210	Brnik - Aerodrom
00050000-5577-fdcd-6d72-57fe413aab5a	8321	Brusnice
00050000-5577-fdcd-a88d-96de21006055	3255	Buče
00050000-5577-fdcd-18b9-727b83565f20	8276	Bučka 
00050000-5577-fdcd-4c93-cab5432f28d3	9261	Cankova
00050000-5577-fdcd-ea99-cbe8e85a714b	3000	Celje 
00050000-5577-fdcd-6dad-3c384340d2d5	3001	Celje - poštni predali
00050000-5577-fdcd-1f5b-ad6a775d8356	4207	Cerklje na Gorenjskem
00050000-5577-fdcd-fe1d-5775930aff2f	8263	Cerklje ob Krki
00050000-5577-fdcd-bc7d-86a5cbbadc2a	1380	Cerknica
00050000-5577-fdcd-8ee2-d8f9b2882d7f	5282	Cerkno
00050000-5577-fdcd-0d97-5a217cc36afd	2236	Cerkvenjak
00050000-5577-fdcd-8e6f-4c0791e06111	2215	Ceršak
00050000-5577-fdcd-3c5b-9f9bd5695703	2326	Cirkovce
00050000-5577-fdcd-b292-da37020a3949	2282	Cirkulane
00050000-5577-fdcd-ccd2-a498ae6269bb	5273	Col
00050000-5577-fdcd-0ad7-9d41a635c375	8251	Čatež ob Savi
00050000-5577-fdcd-a698-cb740820fefc	1413	Čemšenik
00050000-5577-fdcd-cf1a-91a202b2444a	5253	Čepovan
00050000-5577-fdcd-21a5-b4420d6758bc	9232	Črenšovci
00050000-5577-fdcd-ff8a-54dbab17bbb3	2393	Črna na Koroškem
00050000-5577-fdcd-ef76-749fbba67cfa	6275	Črni Kal
00050000-5577-fdcd-7c13-dfe5212b6ee2	5274	Črni Vrh nad Idrijo
00050000-5577-fdcd-a226-1b2ef34b1e2d	5262	Črniče
00050000-5577-fdcd-9063-7b77ec9749f6	8340	Črnomelj
00050000-5577-fdcd-26a1-e655bcdf9b44	6271	Dekani
00050000-5577-fdcd-aaec-1c2946a255cb	5210	Deskle
00050000-5577-fdcd-d10d-daa26214cdb5	2253	Destrnik
00050000-5577-fdcd-c6d1-d76537b99384	6215	Divača
00050000-5577-fdcd-caf4-2f8a02deb416	1233	Dob
00050000-5577-fdcd-6ebb-c75500ad7200	3224	Dobje pri Planini
00050000-5577-fdcd-e70d-2c3fd2d3e559	8257	Dobova
00050000-5577-fdcd-b115-d75c00616b5f	1423	Dobovec
00050000-5577-fdcd-9992-77167ad8fd5f	5263	Dobravlje
00050000-5577-fdcd-d580-73398f78f933	3204	Dobrna
00050000-5577-fdcd-2662-395869893980	8211	Dobrnič
00050000-5577-fdcd-45c5-ed2e30a2f439	1356	Dobrova
00050000-5577-fdcd-555f-f7a6693080f3	9223	Dobrovnik/Dobronak 
00050000-5577-fdcd-c135-b6c8d1db83d6	5212	Dobrovo v Brdih
00050000-5577-fdcd-c2a0-7c0ec4d075ef	1431	Dol pri Hrastniku
00050000-5577-fdcd-29bb-59df06de610b	1262	Dol pri Ljubljani
00050000-5577-fdcd-b26e-4a9f3d28915d	1273	Dole pri Litiji
00050000-5577-fdcd-9fc0-07eebafae732	1331	Dolenja vas
00050000-5577-fdcd-c81d-b8bff89ae0bb	8350	Dolenjske Toplice
00050000-5577-fdcd-219f-e5b43792cdc4	1230	Domžale
00050000-5577-fdcd-88b0-c168a7c723d5	2252	Dornava
00050000-5577-fdcd-b228-2cbef36fada1	5294	Dornberk
00050000-5577-fdcd-4024-19aa867bca4a	1319	Draga
00050000-5577-fdcd-a6c8-aac1f2e032f4	8343	Dragatuš
00050000-5577-fdcd-3262-2291581e31df	3222	Dramlje
00050000-5577-fdcd-9de3-513e14554a41	2370	Dravograd
00050000-5577-fdcd-1bb2-6c1fad7dd979	4203	Duplje
00050000-5577-fdcd-0e64-d2f77cfbdc7e	6221	Dutovlje
00050000-5577-fdcd-f0e0-a539bd3c976f	8361	Dvor
00050000-5577-fdcd-c517-a168f73f1e22	2343	Fala
00050000-5577-fdcd-2ba8-c56ba770d1af	9208	Fokovci
00050000-5577-fdcd-88ab-f19dae6a9447	2313	Fram
00050000-5577-fdcd-ec93-2992d59661be	3213	Frankolovo
00050000-5577-fdcd-9452-a028ddff5c24	1274	Gabrovka
00050000-5577-fdcd-17f6-9908fbf460ec	8254	Globoko
00050000-5577-fdcd-29c3-0a6687e9b693	5275	Godovič
00050000-5577-fdcd-55ea-cd3a4aa61fac	4204	Golnik
00050000-5577-fdcd-d4a2-39be106d0d0c	3303	Gomilsko
00050000-5577-fdcd-61b0-aad5095a0bc5	4224	Gorenja vas
00050000-5577-fdcd-cd48-228ec68309f4	3263	Gorica pri Slivnici
00050000-5577-fdcd-19b9-6c9407f63ee4	2272	Gorišnica
00050000-5577-fdcd-e5db-43516fedd13f	9250	Gornja Radgona
00050000-5577-fdcd-aa62-ed72b0b9457a	3342	Gornji Grad
00050000-5577-fdcd-f1fe-2d324cf0699b	4282	Gozd Martuljek
00050000-5577-fdcd-5bbc-382e058b7eb5	6272	Gračišče
00050000-5577-fdcd-4f98-e388cee00401	9264	Grad
00050000-5577-fdcd-cc4c-57711658a4b5	8332	Gradac
00050000-5577-fdcd-2a78-a89beb4f0488	1384	Grahovo
00050000-5577-fdcd-20a3-4b146c545608	5242	Grahovo ob Bači
00050000-5577-fdcd-5533-4a83c1165950	5251	Grgar
00050000-5577-fdcd-40cf-89e9a1302b39	3302	Griže
00050000-5577-fdcd-a9e6-f5cd46b4eaba	3231	Grobelno
00050000-5577-fdcd-a479-0c932940291e	1290	Grosuplje
00050000-5577-fdcd-d7e0-252262dcb4e6	2288	Hajdina
00050000-5577-fdcd-78b4-bb09c6a9bb80	8362	Hinje
00050000-5577-fdcd-efcf-d2d9c81e8b68	2311	Hoče
00050000-5577-fdcd-7a66-fca6783bdf21	9205	Hodoš/Hodos
00050000-5577-fdcd-9212-b1c9147cce6c	1354	Horjul
00050000-5577-fdcd-233c-bf1f4087b957	1372	Hotedršica
00050000-5577-fdcd-d359-8deaeece15b0	1430	Hrastnik
00050000-5577-fdcd-0f5c-8999e97e236d	6225	Hruševje
00050000-5577-fdcd-d081-efb0a9b4e2fa	4276	Hrušica
00050000-5577-fdcd-6cfd-07eb164f65e3	5280	Idrija
00050000-5577-fdcd-d062-92fcf76fc0ac	1292	Ig
00050000-5577-fdcd-c278-2daf696dbc50	6250	Ilirska Bistrica
00050000-5577-fdcd-b2e4-3a9f8d7b6ecf	6251	Ilirska Bistrica-Trnovo
00050000-5577-fdcd-20ef-61a90e9bd335	1295	Ivančna Gorica
00050000-5577-fdcd-5486-5c53b0c19e95	2259	Ivanjkovci
00050000-5577-fdcd-e11a-7854614ed9b2	1411	Izlake
00050000-5577-fdcd-9f7b-3f9582e6689d	6310	Izola/Isola
00050000-5577-fdcd-7508-b9b0716bff7d	2222	Jakobski Dol
00050000-5577-fdcd-5a89-99cc70cd32b9	2221	Jarenina
00050000-5577-fdcd-d4bc-d7b7797b269c	6254	Jelšane
00050000-5577-fdcd-5c0d-de616694619a	4270	Jesenice
00050000-5577-fdcd-19dd-4b4f8a3c3abb	8261	Jesenice na Dolenjskem
00050000-5577-fdcd-6595-ad4583913513	3273	Jurklošter
00050000-5577-fdcd-e6d6-52a093f87200	2223	Jurovski Dol
00050000-5577-fdcd-6f6b-b51bded6910f	2256	Juršinci
00050000-5577-fdcd-bd85-825094d0b2da	5214	Kal nad Kanalom
00050000-5577-fdcd-11dd-1a5240dd3a7b	3233	Kalobje
00050000-5577-fdcd-ed0a-c0ac3730e691	4246	Kamna Gorica
00050000-5577-fdcd-8d5b-1109d9509c9d	2351	Kamnica
00050000-5577-fdcd-9ee8-045135df5a28	1241	Kamnik
00050000-5577-fdcd-bcdb-37f33ec9ccf5	5213	Kanal
00050000-5577-fdcd-e12e-c671172282d1	8258	Kapele
00050000-5577-fdcd-9ba8-a3e6297cb811	2362	Kapla
00050000-5577-fdcd-6723-e9a8fa9f4156	2325	Kidričevo
00050000-5577-fdcd-4837-138934d8c6d2	1412	Kisovec
00050000-5577-fdcd-2e37-d9f7ec0a3a43	6253	Knežak
00050000-5577-fdcd-449c-9d17a891f53c	5222	Kobarid
00050000-5577-fdcd-c600-ce605d6100a0	9227	Kobilje
00050000-5577-fdcd-578a-faee643ade80	1330	Kočevje
00050000-5577-fdcd-8b85-fe49a6bbf7df	1338	Kočevska Reka
00050000-5577-fdcd-65ea-de9d34e983a0	2276	Kog
00050000-5577-fdcd-7aa7-9f29e04af609	5211	Kojsko
00050000-5577-fdcd-1c40-01da3c1635a0	6223	Komen
00050000-5577-fdcd-0c20-69293ce23b76	1218	Komenda
00050000-5577-fdcd-703f-c973ab18f704	6000	Koper/Capodistria 
00050000-5577-fdcd-fc47-8b422a4b77b6	6001	Koper/Capodistria - poštni predali
00050000-5577-fdcd-a816-11837a39f990	8282	Koprivnica
00050000-5577-fdcd-862e-3504c374fc09	5296	Kostanjevica na Krasu
00050000-5577-fdcd-8e48-a7ed4bc5592b	8311	Kostanjevica na Krki
00050000-5577-fdcd-4e06-bfbccfb8ea6c	1336	Kostel
00050000-5577-fdcd-2d8e-679168490672	6256	Košana
00050000-5577-fdcd-1386-25eaa3cb587d	2394	Kotlje
00050000-5577-fdcd-87b2-5f5e7966e7a9	6240	Kozina
00050000-5577-fdcd-4e14-a1a8ccacd20d	3260	Kozje
00050000-5577-fdcd-b041-525895ff86c1	4000	Kranj 
00050000-5577-fdcd-3eb0-86f9ab1e8a51	4001	Kranj - poštni predali
00050000-5577-fdcd-88a9-d7098489eefe	4280	Kranjska Gora
00050000-5577-fdcd-cb54-3ad17fcfe26b	1281	Kresnice
00050000-5577-fdcd-3952-63edf5f37f35	4294	Križe
00050000-5577-fdcd-ea16-437a10214847	9206	Križevci
00050000-5577-fdcd-c276-6e4c55a38c72	9242	Križevci pri Ljutomeru
00050000-5577-fdcd-dab1-6b15b79d7506	1301	Krka
00050000-5577-fdcd-d99b-1e6a83414763	8296	Krmelj
00050000-5577-fdcd-f2f1-705e91ea8596	4245	Kropa
00050000-5577-fdcd-eb94-b7f0f525efe0	8262	Krška vas
00050000-5577-fdcd-a399-b8ba55f4f209	8270	Krško
00050000-5577-fdcd-a29e-ac0cee87dd3c	9263	Kuzma
00050000-5577-fdcd-8984-665f14c5f447	2318	Laporje
00050000-5577-fdcd-fa76-4ddf1dacbe30	3270	Laško
00050000-5577-fdcd-9af9-ebc28d2acb25	1219	Laze v Tuhinju
00050000-5577-fdcd-12bd-3422638bff15	2230	Lenart v Slovenskih goricah
00050000-5577-fdcd-06a5-8017ea8701b7	9220	Lendava/Lendva
00050000-5577-fdcd-7c58-52152e82fcd1	4248	Lesce
00050000-5577-fdcd-63b4-5f437099b468	3261	Lesično
00050000-5577-fdcd-9f3a-8cdd0036fd45	8273	Leskovec pri Krškem
00050000-5577-fdcd-d987-e51d08f45960	2372	Libeliče
00050000-5577-fdcd-2895-5719cae48504	2341	Limbuš
00050000-5577-fdcd-851c-a9532ac712a9	1270	Litija
00050000-5577-fdcd-9135-0f35df3431db	3202	Ljubečna
00050000-5577-fdcd-011e-d770c32f953c	1000	Ljubljana 
00050000-5577-fdcd-719d-3408ff0a7602	1001	Ljubljana - poštni predali
00050000-5577-fdcd-3159-c5b97cbf29d0	1231	Ljubljana - Črnuče
00050000-5577-fdcd-baef-563a17673c78	1261	Ljubljana - Dobrunje
00050000-5577-fdcd-6aef-3038bb9348b7	1260	Ljubljana - Polje
00050000-5577-fdcd-4c6c-36a71d434692	1210	Ljubljana - Šentvid
00050000-5577-fdcd-2894-0258552dcd8d	1211	Ljubljana - Šmartno
00050000-5577-fdcd-8b2d-89483be67f70	3333	Ljubno ob Savinji
00050000-5577-fdcd-18d8-7c49f293d33c	9240	Ljutomer
00050000-5577-fdcd-a7d0-5676d0856231	3215	Loče
00050000-5577-fdcd-89d8-2b2aafe8e462	5231	Log pod Mangartom
00050000-5577-fdcd-6e69-bbbfbe72b203	1358	Log pri Brezovici
00050000-5577-fdcd-0a54-5c952e93da4b	1370	Logatec
00050000-5577-fdcd-c564-a76817c94155	1371	Logatec
00050000-5577-fdcd-5813-f9b8017deba0	1434	Loka pri Zidanem Mostu
00050000-5577-fdcd-aa06-03e1b4c01760	3223	Loka pri Žusmu
00050000-5577-fdcd-adfb-2d690831ed7f	6219	Lokev
00050000-5577-fdcd-a448-74e024be6d79	1318	Loški Potok
00050000-5577-fdcd-d37f-76d5da82a6e5	2324	Lovrenc na Dravskem polju
00050000-5577-fdcd-9f0c-9b6cddbb917a	2344	Lovrenc na Pohorju
00050000-5577-fdcd-30d1-230adaaeac53	3334	Luče
00050000-5577-fdcd-deb6-d60afa951023	1225	Lukovica
00050000-5577-fdcd-22f5-fd830ea0626d	9202	Mačkovci
00050000-5577-fdcd-13b6-cf590016e9e4	2322	Majšperk
00050000-5577-fdcd-9306-0bbb58531359	2321	Makole
00050000-5577-fdcd-6b92-a987ed962bcd	9243	Mala Nedelja
00050000-5577-fdcd-666c-b6d574894d12	2229	Malečnik
00050000-5577-fdcd-727f-e1acb879443c	6273	Marezige
00050000-5577-fdcd-b259-c8a6f9f29de2	2000	Maribor 
00050000-5577-fdcd-070d-4d965559d61f	2001	Maribor - poštni predali
00050000-5577-fdcd-15f1-20049d4bb53b	2206	Marjeta na Dravskem polju
00050000-5577-fdcd-ef30-75bab4bc8e15	2281	Markovci
00050000-5577-fdcd-58de-33294ce8b357	9221	Martjanci
00050000-5577-fdcd-caf8-78ce6573a0fa	6242	Materija
00050000-5577-fdcd-f2ca-d1443f1bb5eb	4211	Mavčiče
00050000-5577-fdcd-1ed9-ff1a6ad77e51	1215	Medvode
00050000-5577-fdcd-f7d4-07c2131c16f3	1234	Mengeš
00050000-5577-fdcd-accf-0ae93b4ae701	8330	Metlika
00050000-5577-fdcd-1d1f-1d153d608183	2392	Mežica
00050000-5577-fdcd-3845-12a349e2d84e	2204	Miklavž na Dravskem polju
00050000-5577-fdcd-6968-11193cd8fb6a	2275	Miklavž pri Ormožu
00050000-5577-fdcd-539b-cb7137496987	5291	Miren
00050000-5577-fdcd-199c-73795e5ff18b	8233	Mirna
00050000-5577-fdcd-eb7a-8fdbf97d259d	8216	Mirna Peč
00050000-5577-fdcd-d4c0-10e44903da2e	2382	Mislinja
00050000-5577-fdcd-7633-da94c294bcb1	4281	Mojstrana
00050000-5577-fdcd-3382-b40e4c24b165	8230	Mokronog
00050000-5577-fdcd-4a50-3e52fc1d2d73	1251	Moravče
00050000-5577-fdcd-7498-bffdf13e6acf	9226	Moravske Toplice
00050000-5577-fdcd-6799-4493beeced83	5216	Most na Soči
00050000-5577-fdcd-5925-5a7601701fef	1221	Motnik
00050000-5577-fdcd-7dcd-3f73eb9c1f56	3330	Mozirje
00050000-5577-fdcd-a7c2-571aeb543ad0	9000	Murska Sobota 
00050000-5577-fdcd-fcb7-5a03c0ae84bb	9001	Murska Sobota - poštni predali
00050000-5577-fdcd-0867-0c9b70545ef8	2366	Muta
00050000-5577-fdcd-6b71-4d76f6d7b7b3	4202	Naklo
00050000-5577-fdcd-4348-ccb0106b1124	3331	Nazarje
00050000-5577-fdcd-f70d-1ffac784e4e2	1357	Notranje Gorice
00050000-5577-fdcd-a9af-d507b6733559	3203	Nova Cerkev
00050000-5577-fdcd-962d-822f110b2a18	5000	Nova Gorica 
00050000-5577-fdcd-c512-3d5770a71586	5001	Nova Gorica - poštni predali
00050000-5577-fdcd-d861-93ad664a61e4	1385	Nova vas
00050000-5577-fdcd-f4f3-e636e4512755	8000	Novo mesto
00050000-5577-fdcd-0666-d9258e294361	8001	Novo mesto - poštni predali
00050000-5577-fdcd-e779-9525f9d5496e	6243	Obrov
00050000-5577-fdcd-85b0-0d5f102a318c	9233	Odranci
00050000-5577-fdcd-f46f-d333813bb419	2317	Oplotnica
00050000-5577-fdcd-7cc3-da9d96288a8d	2312	Orehova vas
00050000-5577-fdcd-90be-8597fc949590	2270	Ormož
00050000-5577-fdcd-0d94-3a05eccd6b1c	1316	Ortnek
00050000-5577-fdcd-fd5d-b0e54f9f88a0	1337	Osilnica
00050000-5577-fdcd-40aa-538762d0728a	8222	Otočec
00050000-5577-fdcd-afeb-60fc99c3d5c6	2361	Ožbalt
00050000-5577-fdcd-fdf3-ab7c45b32c5d	2231	Pernica
00050000-5577-fdcd-3448-819c38652b81	2211	Pesnica pri Mariboru
00050000-5577-fdcd-8ded-cedf45bc5169	9203	Petrovci
00050000-5577-fdcd-727f-b3a4a7cbbbeb	3301	Petrovče
00050000-5577-fdcd-2101-bd3559caa234	6330	Piran/Pirano
00050000-5577-fdcd-5269-59598eb3e398	8255	Pišece
00050000-5577-fdcd-44ae-7e6b72367cab	6257	Pivka
00050000-5577-fdcd-90ed-db8bf4f5a81e	6232	Planina
00050000-5577-fdcd-79fd-7f3e93bc6e7b	3225	Planina pri Sevnici
00050000-5577-fdcd-5404-2ee3c26d0cca	6276	Pobegi
00050000-5577-fdcd-4b00-3951756c81aa	8312	Podbočje
00050000-5577-fdcd-2e81-1a9311c20dd1	5243	Podbrdo
00050000-5577-fdcd-d71a-0b6aed6d9708	3254	Podčetrtek
00050000-5577-fdcd-c3ef-27dcb5fbb457	2273	Podgorci
00050000-5577-fdcd-94a0-481a0d55b9bb	6216	Podgorje
00050000-5577-fdcd-3b4e-e8b488ba9b81	2381	Podgorje pri Slovenj Gradcu
00050000-5577-fdcd-54b9-310519b7586f	6244	Podgrad
00050000-5577-fdcd-6edc-2f4ea27eebc2	1414	Podkum
00050000-5577-fdcd-27b6-3886c26a1b10	2286	Podlehnik
00050000-5577-fdcd-cc24-1ab98950ecd0	5272	Podnanos
00050000-5577-fdcd-ec34-cb6f3a75daae	4244	Podnart
00050000-5577-fdcd-54c7-4c89fa5f515e	3241	Podplat
00050000-5577-fdcd-618c-b74635fdcebf	3257	Podsreda
00050000-5577-fdcd-b585-fe3d7a7ef944	2363	Podvelka
00050000-5577-fdcd-cff2-c54deefe131c	2208	Pohorje
00050000-5577-fdcd-0444-e12aaca6c570	2257	Polenšak
00050000-5577-fdcd-c780-dd7703760837	1355	Polhov Gradec
00050000-5577-fdcd-377b-55499e610fce	4223	Poljane nad Škofjo Loko
00050000-5577-fdcd-044d-667e8431397b	2319	Poljčane
00050000-5577-fdcd-adfc-1c9697b99e48	1272	Polšnik
00050000-5577-fdcd-3153-b864339154e0	3313	Polzela
00050000-5577-fdcd-0528-62a51c834433	3232	Ponikva
00050000-5577-fdcd-d968-3b6ad988c279	6320	Portorož/Portorose
00050000-5577-fdcd-38e0-dcf9bad37c80	6230	Postojna
00050000-5577-fdcd-9e97-d874dd16efb3	2331	Pragersko
00050000-5577-fdcd-6c68-c23563f8e74c	3312	Prebold
00050000-5577-fdcd-d0ef-f641aa057851	4205	Preddvor
00050000-5577-fdcd-f251-8d9405536123	6255	Prem
00050000-5577-fdcd-9956-c44d0547d369	1352	Preserje
00050000-5577-fdcd-4bbf-0831419ca8fe	6258	Prestranek
00050000-5577-fdcd-69a0-c342bee7c800	2391	Prevalje
00050000-5577-fdcd-ba2e-cafd89a58f2e	3262	Prevorje
00050000-5577-fdcd-854a-020267f4a514	1276	Primskovo 
00050000-5577-fdcd-5f71-64263a10bc1b	3253	Pristava pri Mestinju
00050000-5577-fdcd-fd1c-5e711a79de44	9207	Prosenjakovci/Partosfalva
00050000-5577-fdcd-dd48-26efde026431	5297	Prvačina
00050000-5577-fdcd-9c55-d6785a2de57c	2250	Ptuj
00050000-5577-fdcd-b3c7-1c4f74b3fe2f	2323	Ptujska Gora
00050000-5577-fdcd-bb61-17a67b7a2f16	9201	Puconci
00050000-5577-fdcd-f19c-ab1398b4164a	2327	Rače
00050000-5577-fdcd-9c4f-cedaa6a44316	1433	Radeče
00050000-5577-fdcd-d380-1ffe92918a38	9252	Radenci
00050000-5577-fdcd-c252-0375f15107d6	2360	Radlje ob Dravi
00050000-5577-fdcd-48ab-9db02fea84d8	1235	Radomlje
00050000-5577-fdcd-3c11-743d25c84c5f	4240	Radovljica
00050000-5577-fdcd-f060-cb0be78055a5	8274	Raka
00050000-5577-fdcd-05e7-c75c80f26687	1381	Rakek
00050000-5577-fdcd-86da-366e00b34bc0	4283	Rateče - Planica
00050000-5577-fdcd-dd87-df2dc890ccad	2390	Ravne na Koroškem
00050000-5577-fdcd-6469-aa150ebe4cb1	9246	Razkrižje
00050000-5577-fdcd-3635-96ef7aec9ae1	3332	Rečica ob Savinji
00050000-5577-fdcd-8c29-98b380914ef0	5292	Renče
00050000-5577-fdcd-2a66-2e1f307760a9	1310	Ribnica
00050000-5577-fdcd-5c50-bb215cc9f3d3	2364	Ribnica na Pohorju
00050000-5577-fdcd-7856-4f7232f88bc0	3272	Rimske Toplice
00050000-5577-fdcd-5ef5-c64dc447df85	1314	Rob
00050000-5577-fdcd-ab56-eb58c41952e4	5215	Ročinj
00050000-5577-fdcd-9813-750c4442aa21	3250	Rogaška Slatina
00050000-5577-fdcd-61d9-f276fe2223bf	9262	Rogašovci
00050000-5577-fdcd-ea12-88543e6c054b	3252	Rogatec
00050000-5577-fdcd-22f9-0aeaae87dd19	1373	Rovte
00050000-5577-fdcd-c059-3d360f0e93a9	2342	Ruše
00050000-5577-fdcd-db59-f3e56ed9d602	1282	Sava
00050000-5577-fdcd-0579-5a47e3050853	6333	Sečovlje/Sicciole
00050000-5577-fdcd-418d-aa20ac208a01	4227	Selca
00050000-5577-fdcd-2159-cfdd5c5387ef	2352	Selnica ob Dravi
00050000-5577-fdcd-4b98-2884bb876e54	8333	Semič
00050000-5577-fdcd-d48f-8e969b63e8b0	8281	Senovo
00050000-5577-fdcd-6d8a-20add364539f	6224	Senožeče
00050000-5577-fdcd-9ba2-52db107653c3	8290	Sevnica
00050000-5577-fdcd-7f2b-0afa8192a9fa	6210	Sežana
00050000-5577-fdcd-d733-a2bfbd037b74	2214	Sladki Vrh
00050000-5577-fdcd-7e10-9c5997f935d2	5283	Slap ob Idrijci
00050000-5577-fdcd-a562-85f4bacb5681	2380	Slovenj Gradec
00050000-5577-fdcd-b196-510b538a4deb	2310	Slovenska Bistrica
00050000-5577-fdcd-5a09-3f676cc3c344	3210	Slovenske Konjice
00050000-5577-fdcd-fdc1-5bcf7b43d8b8	1216	Smlednik
00050000-5577-fdcd-daf3-84b169c79a49	5232	Soča
00050000-5577-fdcd-fd31-87647c25f2dc	1317	Sodražica
00050000-5577-fdcd-d164-76955a5538cd	3335	Solčava
00050000-5577-fdcd-78c3-82e40fd6cf12	5250	Solkan
00050000-5577-fdcd-66b9-547ab25dfc34	4229	Sorica
00050000-5577-fdcd-b730-2e2ef66434bd	4225	Sovodenj
00050000-5577-fdcd-45f5-59a4b0c52759	5281	Spodnja Idrija
00050000-5577-fdcd-7046-7f51d16a0910	2241	Spodnji Duplek
00050000-5577-fdcd-b7f4-295440711324	9245	Spodnji Ivanjci
00050000-5577-fdcd-8d43-74ea500ca984	2277	Središče ob Dravi
00050000-5577-fdcd-47b4-5aa7a52af7aa	4267	Srednja vas v Bohinju
00050000-5577-fdcd-18a0-b682a99260a4	8256	Sromlje 
00050000-5577-fdcd-6aa5-b3822066f08e	5224	Srpenica
00050000-5577-fdcd-0d76-b2e0c5863840	1242	Stahovica
00050000-5577-fdcd-c2cb-ea1cbc311e5d	1332	Stara Cerkev
00050000-5577-fdcd-e983-af0891858064	8342	Stari trg ob Kolpi
00050000-5577-fdcd-e520-9a7d611ec731	1386	Stari trg pri Ložu
00050000-5577-fdcd-75e5-2ea494c66b52	2205	Starše
00050000-5577-fdcd-22dc-a6f93f801a8c	2289	Stoperce
00050000-5577-fdcd-13b7-2bf9f3fbe97f	8322	Stopiče
00050000-5577-fdcd-d504-fa2d32afd520	3206	Stranice
00050000-5577-fdcd-f95a-092c669435dc	8351	Straža
00050000-5577-fdcd-9c87-18cbe1a7671b	1313	Struge
00050000-5577-fdcd-3122-7222856c621e	8293	Studenec
00050000-5577-fdcd-c546-c996bf0513ad	8331	Suhor
00050000-5577-fdcd-3eaa-f73e6a7d5b97	2233	Sv. Ana v Slovenskih goricah
00050000-5577-fdcd-d175-233ac4760f92	2235	Sv. Trojica v Slovenskih goricah
00050000-5577-fdcd-2a2d-4d6f93810368	2353	Sveti Duh na Ostrem Vrhu
00050000-5577-fdcd-d8df-750e9379adc7	9244	Sveti Jurij ob Ščavnici
00050000-5577-fdcd-dfeb-2391c102e80a	3264	Sveti Štefan
00050000-5577-fdcd-7d6a-0edd4d9165fc	2258	Sveti Tomaž
00050000-5577-fdcd-5a35-8d3f32e3cec5	9204	Šalovci
00050000-5577-fdcd-56bc-277eb91d8bba	5261	Šempas
00050000-5577-fdcd-2d49-19a61f162ddb	5290	Šempeter pri Gorici
00050000-5577-fdcd-5ce9-22de9235ac5a	3311	Šempeter v Savinjski dolini
00050000-5577-fdcd-6a28-d495f8c003f4	4208	Šenčur
00050000-5577-fdcd-7eab-6942bc26964b	2212	Šentilj v Slovenskih goricah
00050000-5577-fdcd-8a08-15b52b4b2aac	8297	Šentjanž
00050000-5577-fdcd-c1d9-2f800a5b6a34	2373	Šentjanž pri Dravogradu
00050000-5577-fdcd-a3c8-5f5ba91ff113	8310	Šentjernej
00050000-5577-fdcd-cc5e-cfd3a33077be	3230	Šentjur
00050000-5577-fdcd-e6d1-28804ea176a2	3271	Šentrupert
00050000-5577-fdcd-aab4-a5979124d73c	8232	Šentrupert
00050000-5577-fdcd-0396-46e5f3f209da	1296	Šentvid pri Stični
00050000-5577-fdcd-fac7-3adb6acfe45b	8275	Škocjan
00050000-5577-fdcd-0c76-55662c0d8ca6	6281	Škofije
00050000-5577-fdcd-be85-916d3bdb9673	4220	Škofja Loka
00050000-5577-fdcd-325c-7713035c7916	3211	Škofja vas
00050000-5577-fdcd-0f8b-b3f88fbd0e0f	1291	Škofljica
00050000-5577-fdcd-6265-722e41de0f7c	6274	Šmarje
00050000-5577-fdcd-ce65-18810ffe203d	1293	Šmarje - Sap
00050000-5577-fdcd-f80e-651cccccce89	3240	Šmarje pri Jelšah
00050000-5577-fdcd-8e62-0e94381f2f80	8220	Šmarješke Toplice
00050000-5577-fdcd-20da-57024bcec1cb	2315	Šmartno na Pohorju
00050000-5577-fdcd-25c8-1a9e1e0df9e4	3341	Šmartno ob Dreti
00050000-5577-fdcd-2058-901ba2e0d463	3327	Šmartno ob Paki
00050000-5577-fdcd-cb04-eb6cb23c4ff3	1275	Šmartno pri Litiji
00050000-5577-fdcd-0f09-33c451567ba6	2383	Šmartno pri Slovenj Gradcu
00050000-5577-fdcd-bea3-1a80c15aa3ca	3201	Šmartno v Rožni dolini
00050000-5577-fdcd-da25-a39e1cadc591	3325	Šoštanj
00050000-5577-fdcd-ed5b-66e43f6a185f	6222	Štanjel
00050000-5577-fdcd-145d-f1ec29f199b2	3220	Štore
00050000-5577-fdcd-e5e2-b10917532152	3304	Tabor
00050000-5577-fdcd-6075-3310da28de6a	3221	Teharje
00050000-5577-fdcd-3ceb-3754689ed75b	9251	Tišina
00050000-5577-fdcd-2142-f1678db728be	5220	Tolmin
00050000-5577-fdcd-8234-03731ef73e6e	3326	Topolšica
00050000-5577-fdcd-97aa-6a2c23268cba	2371	Trbonje
00050000-5577-fdcd-d58b-115de1eb2cb3	1420	Trbovlje
00050000-5577-fdcd-f2f4-eec3bf149b72	8231	Trebelno 
00050000-5577-fdcd-3c68-1a69d45ac82a	8210	Trebnje
00050000-5577-fdcd-942a-87ab42287789	5252	Trnovo pri Gorici
00050000-5577-fdcd-51ad-0389f500216b	2254	Trnovska vas
00050000-5577-fdcd-254e-2a3cb37a97e3	1222	Trojane
00050000-5577-fdcd-7ba5-bc5496406162	1236	Trzin
00050000-5577-fdcd-542d-3a1984ccdd86	4290	Tržič
00050000-5577-fdcd-ec6f-83465ee4aa21	8295	Tržišče
00050000-5577-fdcd-0141-faefc804096e	1311	Turjak
00050000-5577-fdcd-a77f-d2f4e23eccef	9224	Turnišče
00050000-5577-fdcd-b3cf-c79a611733a5	8323	Uršna sela
00050000-5577-fdcd-7629-fcb80c97e26a	1252	Vače
00050000-5577-fdcd-3592-1ea2cb89cd81	3320	Velenje 
00050000-5577-fdcd-c852-f96de0e227d7	3322	Velenje - poštni predali
00050000-5577-fdcd-a874-b4acd130692b	8212	Velika Loka
00050000-5577-fdcd-63e2-1d9e3a72ac1c	2274	Velika Nedelja
00050000-5577-fdcd-391a-aab046303fea	9225	Velika Polana
00050000-5577-fdcd-3bf2-ed75d534eb57	1315	Velike Lašče
00050000-5577-fdcd-51a9-af0c691675bc	8213	Veliki Gaber
00050000-5577-fdcd-9445-2e5b4909f0fc	9241	Veržej
00050000-5577-fdcd-1e0c-dea39aceb851	1312	Videm - Dobrepolje
00050000-5577-fdcd-69ff-aa904f3b0c76	2284	Videm pri Ptuju
00050000-5577-fdcd-40cd-4ffaa2cb6a9a	8344	Vinica
00050000-5577-fdcd-eeea-470fded3d203	5271	Vipava
00050000-5577-fdcd-faf2-bc28b48fe50d	4212	Visoko
00050000-5577-fdcd-570e-6ff833a71974	1294	Višnja Gora
00050000-5577-fdcd-b672-fb35b6784870	3205	Vitanje
00050000-5577-fdcd-e03c-7cc4972ec0c9	2255	Vitomarci
00050000-5577-fdcd-f4fd-45a75389250b	1217	Vodice
00050000-5577-fdcd-c23d-943ab8303a30	3212	Vojnik\t
00050000-5577-fdcd-11c1-08aaf58f4de7	5293	Volčja Draga
00050000-5577-fdcd-c45c-3fc475021a2e	2232	Voličina
00050000-5577-fdcd-7fc0-af6c4555b284	3305	Vransko
00050000-5577-fdcd-cde0-985574fc291d	6217	Vremski Britof
00050000-5577-fdcd-c40d-232d2c69c9de	1360	Vrhnika
00050000-5577-fdcd-2c4f-0f1c237b3f81	2365	Vuhred
00050000-5577-fdcd-3173-08716b740d3a	2367	Vuzenica
00050000-5577-fdcd-37c8-ebbc869b0266	8292	Zabukovje 
00050000-5577-fdcd-6bd4-57aae62da698	1410	Zagorje ob Savi
00050000-5577-fdcd-0c1c-24b2e7af3301	1303	Zagradec
00050000-5577-fdcd-ff3a-11480b31e5f8	2283	Zavrč
00050000-5577-fdcd-c7da-3543bf25635b	8272	Zdole 
00050000-5577-fdcd-335a-e3b758a6f46d	4201	Zgornja Besnica
00050000-5577-fdcd-272c-c7bc956ac9ab	2242	Zgornja Korena
00050000-5577-fdcd-987d-a70d5b0a5513	2201	Zgornja Kungota
00050000-5577-fdcd-0db3-9b7c2eba14ee	2316	Zgornja Ložnica
00050000-5577-fdcd-c3c3-dd99c0c607e8	2314	Zgornja Polskava
00050000-5577-fdcd-fcec-c8be44443105	2213	Zgornja Velka
00050000-5577-fdcd-90f3-61d9ee96d059	4247	Zgornje Gorje
00050000-5577-fdcd-9182-3fc28cd43176	4206	Zgornje Jezersko
00050000-5577-fdcd-7d28-db30d69a7bb5	2285	Zgornji Leskovec
00050000-5577-fdcd-4fb1-f2cc19559c42	1432	Zidani Most
00050000-5577-fdcd-87ec-d62d26db5491	3214	Zreče
00050000-5577-fdcd-19ce-0317485adc06	4209	Žabnica
00050000-5577-fdcd-6f2a-20b4280bf3a7	3310	Žalec
00050000-5577-fdcd-5e80-aebfdceaa007	4228	Železniki
00050000-5577-fdcd-30ba-ffc45c8e5558	2287	Žetale
00050000-5577-fdcd-d78a-202661f8150d	4226	Žiri
00050000-5577-fdcd-05e8-fda419e64db0	4274	Žirovnica
00050000-5577-fdcd-259e-8b3641b33796	8360	Žužemberk
\.


--
-- TOC entry 2822 (class 0 OID 6811182)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6810993)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6811071)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6811194)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6811314)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6811367)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5577-fdcf-b403-87cba63c8386	00080000-5577-fdcf-ab36-4d9855cc9051	0987	A
00190000-5577-fdcf-e2f5-7b30669037ba	00080000-5577-fdcf-a60b-94adf0244fdb	0989	A
\.


--
-- TOC entry 2848 (class 0 OID 6811482)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6811529)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6811491)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6811499)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6811223)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5577-fdcf-31f1-7b24adcc283f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5577-fdcf-7237-efca571d61c6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5577-fdcf-4141-54902b4901fd	0003	Kazinska	t	84	Kazinska dvorana
00220000-5577-fdcf-bbb0-52cbce6c64bf	0004	Mali oder	t	24	Mali oder 
00220000-5577-fdcf-1649-9f86dd5add67	0005	Komorni oder	t	15	Komorni oder
00220000-5577-fdcf-5a1d-c4bb850c2d97	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5577-fdcf-7c9c-cd5abd58ba91	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2820 (class 0 OID 6811167)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6811157)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6811356)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6811291)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6810865)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5577-fdce-5f30-0688294681bb	00010000-5577-fdce-6ec3-83c7c50fbb9a	2015-06-10 11:05:20	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROmrYvqd2nJ6KPqyM8gX1f5Bi2BCpfNwe";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2864 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2829 (class 0 OID 6811233)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6810903)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5577-fdce-7a23-726a029ac57e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5577-fdce-e153-3012103dd2c2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5577-fdce-c334-345ea286c6fe	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5577-fdce-d050-a7cc7cdfe213	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5577-fdce-00a4-0aa49900430c	planer	Planer dogodkov v koledarju	t
00020000-5577-fdce-15ce-50aeaff7ca73	kadrovska	Kadrovska služba	t
00020000-5577-fdce-41b3-2477133e2288	arhivar	Ažuriranje arhivalij	t
00020000-5577-fdce-c8c8-377ba6cdc3ea	igralec	Igralec	t
00020000-5577-fdce-31e4-6c308e31ceaa	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2795 (class 0 OID 6810887)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5577-fdce-5f30-0688294681bb	00020000-5577-fdce-c334-345ea286c6fe
00010000-5577-fdce-6ec3-83c7c50fbb9a	00020000-5577-fdce-c334-345ea286c6fe
\.


--
-- TOC entry 2831 (class 0 OID 6811247)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6811188)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6811138)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 6811548)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5577-fdcd-6fae-5cb62e68ef47	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5577-fdcd-946e-65b3b3fce151	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5577-fdcd-2e00-53b6e1b85143	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5577-fdcd-35b7-8865ede0fe40	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5577-fdcd-ddd5-c1e57742708b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2854 (class 0 OID 6811540)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5577-fdcd-8d14-45a630b6b518	00230000-5577-fdcd-35b7-8865ede0fe40	popa
00240000-5577-fdcd-d136-ddbf3bbb832b	00230000-5577-fdcd-35b7-8865ede0fe40	oseba
00240000-5577-fdcd-8cca-35d875dc8a5d	00230000-5577-fdcd-946e-65b3b3fce151	prostor
00240000-5577-fdcd-b154-7392a61f8b90	00230000-5577-fdcd-35b7-8865ede0fe40	besedilo
00240000-5577-fdcd-4f82-0bcd94eb0766	00230000-5577-fdcd-35b7-8865ede0fe40	uprizoritev
00240000-5577-fdcd-a0d5-4e619696611b	00230000-5577-fdcd-35b7-8865ede0fe40	funkcija
00240000-5577-fdcd-03cd-c358e11161b7	00230000-5577-fdcd-35b7-8865ede0fe40	tipfunkcije
00240000-5577-fdcd-e415-1e484a8f6c9b	00230000-5577-fdcd-35b7-8865ede0fe40	alternacija
00240000-5577-fdcd-5203-9f03650257c1	00230000-5577-fdcd-6fae-5cb62e68ef47	pogodba
00240000-5577-fdcd-c988-1c459ab4dc7f	00230000-5577-fdcd-35b7-8865ede0fe40	zaposlitev
\.


--
-- TOC entry 2853 (class 0 OID 6811535)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6811301)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6810965)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6811144)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5577-fdcf-544e-31895bc8d7fe	00180000-5577-fdcf-685c-1601e5446e97	000c0000-5577-fdcf-83d0-eee21fb4ec72	00090000-5577-fdcf-c39f-8e86c6521644	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-fdcf-a41a-506a143540ea	00180000-5577-fdcf-685c-1601e5446e97	000c0000-5577-fdcf-115d-f69af32e08b1	00090000-5577-fdcf-e747-3be76cdb764e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-fdcf-0875-c27454b6b1ce	00180000-5577-fdcf-685c-1601e5446e97	000c0000-5577-fdcf-a78e-0d8902b46210	00090000-5577-fdcf-7a1f-958adacfcdf5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-fdcf-3a80-c5e8069e244d	00180000-5577-fdcf-685c-1601e5446e97	000c0000-5577-fdcf-f1a5-2136f72c0a59	00090000-5577-fdcf-eb95-a9712eb24a86	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-fdcf-28a8-e8d5cd852879	00180000-5577-fdcf-685c-1601e5446e97	000c0000-5577-fdcf-5938-6773cc9c0acf	00090000-5577-fdcf-6ffa-9b1cb9d08e3b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5577-fdcf-cba5-03132d72644d	00180000-5577-fdcf-f8de-095b2e03b615	\N	00090000-5577-fdcf-6ffa-9b1cb9d08e3b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2839 (class 0 OID 6811345)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5577-fdcd-aec4-c8efd27965d1	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5577-fdcd-8d98-821a00f0532f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5577-fdcd-f9a9-8cf7991d67d2	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5577-fdcd-cd63-159dd8ca6a3f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5577-fdcd-28f5-ec3fc251f0d4	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5577-fdcd-0fcc-9b3850b09319	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5577-fdcd-ff99-29507a0a4c2f	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5577-fdcd-6b67-d521b237f6cf	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5577-fdcd-1cb3-bf57fdfecbcf	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5577-fdcd-dcc5-705e55fc2dfb	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5577-fdcd-af4d-aa60cfe4de6d	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5577-fdcd-7751-e364b34d2ef7	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5577-fdcd-6de4-c9a3d4c1dc1c	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5577-fdcd-c91f-24ef3a6df883	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5577-fdcd-c476-2294e2ad8b43	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5577-fdcd-6274-fd01d8cd750b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2851 (class 0 OID 6811518)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5577-fdcd-8081-b84d4b96e8e4	01	Velika predstava	f	1.00	1.00
002b0000-5577-fdcd-31b1-a533cd0dfcf2	02	Mala predstava	f	0.50	0.50
002b0000-5577-fdcd-e1f3-8fdd8115f727	03	Mala koprodukcija	t	0.40	1.00
002b0000-5577-fdcd-a2f5-33f306511bf7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5577-fdcd-66f2-92a02a711a24	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2807 (class 0 OID 6811028)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6810874)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5577-fdce-6ec3-83c7c50fbb9a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROGG5Kvc1r/D/tEmaD0s..HtYTBhIkN1q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-65d2-4832201841ce	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-7810-f9936f57451b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-b007-3d90841cda1a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-a06e-3b080e25d37d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-e24e-4dcabdbce300	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5577-fdcf-ebd5-ee25587560ac	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5577-fdce-5f30-0688294681bb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2844 (class 0 OID 6811402)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5577-fdcf-3e43-ece178745d54	00160000-5577-fdcf-749a-8a43e03b2077	00150000-5577-fdcd-e640-aa6a617b93fc	00140000-5577-fdcd-2427-a407b1e612ce	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5577-fdcf-1649-9f86dd5add67
000e0000-5577-fdcf-a4d3-f686ffc9a3ac	00160000-5577-fdcf-cccb-a2d6a19ab2db	00150000-5577-fdcd-29a8-bbf7abc061e8	00140000-5577-fdcd-a5a8-2ea2930716c2	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5577-fdcf-5a1d-c4bb850c2d97
000e0000-5577-fdcf-1618-c4cc8b290eb8	\N	00150000-5577-fdcd-29a8-bbf7abc061e8	00140000-5577-fdcd-a5a8-2ea2930716c2	00190000-5577-fdcf-b403-87cba63c8386	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5577-fdcf-1649-9f86dd5add67
000e0000-5577-fdcf-58be-429e54153693	\N	00150000-5577-fdcd-29a8-bbf7abc061e8	00140000-5577-fdcd-a5a8-2ea2930716c2	00190000-5577-fdcf-b403-87cba63c8386	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5577-fdcf-1649-9f86dd5add67
\.


--
-- TOC entry 2812 (class 0 OID 6811090)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5577-fdcf-ec5b-b9628b0bac54	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	1	
00200000-5577-fdcf-ac57-83c8baabc26b	000e0000-5577-fdcf-a4d3-f686ffc9a3ac	2	
\.


--
-- TOC entry 2827 (class 0 OID 6811215)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6811284)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6811122)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6811392)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5577-fdcd-2427-a407b1e612ce	01	Drama	drama (SURS 01)
00140000-5577-fdcd-4a03-b0d4486fa218	02	Opera	opera (SURS 02)
00140000-5577-fdcd-b01f-b18bea5cc51f	03	Balet	balet (SURS 03)
00140000-5577-fdcd-9194-a133e22eed09	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5577-fdcd-2e7f-e48da441f780	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5577-fdcd-a5a8-2ea2930716c2	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5577-fdcd-763d-608ed8aebf17	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2833 (class 0 OID 6811274)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5577-fdcd-0422-33b8676d33d9	01	Opera	opera
00150000-5577-fdcd-0fb8-71cd29e4bab3	02	Opereta	opereta
00150000-5577-fdcd-7e85-7756b58b5fe9	03	Balet	balet
00150000-5577-fdcd-047e-ceaa86370430	04	Plesne prireditve	plesne prireditve
00150000-5577-fdcd-e3ff-c76c1c5bbe19	05	Lutkovno gledališče	lutkovno gledališče
00150000-5577-fdcd-86be-5d64fe7f3aee	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5577-fdcd-9315-045eb9b1b544	07	Biografska drama	biografska drama
00150000-5577-fdcd-e640-aa6a617b93fc	08	Komedija	komedija
00150000-5577-fdcd-e989-e3a1fde4dc0a	09	Črna komedija	črna komedija
00150000-5577-fdcd-a0b7-9d82948994ed	10	E-igra	E-igra
00150000-5577-fdcd-29a8-bbf7abc061e8	11	Kriminalka	kriminalka
00150000-5577-fdcd-2b0b-01759d7794fb	12	Musical	musical
\.


--
-- TOC entry 2379 (class 2606 OID 6810928)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6811449)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 6811439)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6811344)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 6811112)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6811137)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6811054)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 6811478)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6811270)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 6811088)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 6811131)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6811068)
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
-- TOC entry 2471 (class 2606 OID 6811180)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6811207)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6811026)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 6810937)
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
-- TOC entry 2386 (class 2606 OID 6810961)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6810917)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2370 (class 2606 OID 6810902)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 6811213)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6811246)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6811387)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 6810990)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 6811014)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6811186)
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
-- TOC entry 2401 (class 2606 OID 6811004)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 6811075)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6811198)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6811326)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6811372)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 6811489)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 6811533)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6811496)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 6811516)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6811230)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6811171)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 6811162)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6811366)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6811298)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6810873)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6811237)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6810891)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2372 (class 2606 OID 6810911)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6811255)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 6811193)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6811143)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 6811557)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 6811545)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 6811539)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6811311)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6810970)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 6811153)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6811355)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6811528)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6811039)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 6810886)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 6811418)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6811097)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6811221)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6811289)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6811126)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6811400)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6811282)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 1259 OID 6811119)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2519 (class 1259 OID 6811312)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2520 (class 1259 OID 6811313)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2393 (class 1259 OID 6810992)
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
-- TOC entry 2484 (class 1259 OID 6811214)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2478 (class 1259 OID 6811200)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2479 (class 1259 OID 6811199)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2430 (class 1259 OID 6811098)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2506 (class 1259 OID 6811271)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2507 (class 1259 OID 6811273)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2508 (class 1259 OID 6811272)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2418 (class 1259 OID 6811070)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2419 (class 1259 OID 6811069)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2537 (class 1259 OID 6811389)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2538 (class 1259 OID 6811390)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2539 (class 1259 OID 6811391)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2578 (class 1259 OID 6811517)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2546 (class 1259 OID 6811423)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2547 (class 1259 OID 6811420)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2548 (class 1259 OID 6811424)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2549 (class 1259 OID 6811422)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2550 (class 1259 OID 6811421)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2408 (class 1259 OID 6811041)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2409 (class 1259 OID 6811040)
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
-- TOC entry 2384 (class 1259 OID 6810964)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2494 (class 1259 OID 6811238)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2448 (class 1259 OID 6811132)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2374 (class 1259 OID 6810918)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2375 (class 1259 OID 6810919)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2499 (class 1259 OID 6811258)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2500 (class 1259 OID 6811257)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2501 (class 1259 OID 6811256)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2422 (class 1259 OID 6811076)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2423 (class 1259 OID 6811078)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2424 (class 1259 OID 6811077)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2588 (class 1259 OID 6811547)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2458 (class 1259 OID 6811166)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2459 (class 1259 OID 6811164)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2460 (class 1259 OID 6811163)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2461 (class 1259 OID 6811165)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2365 (class 1259 OID 6810892)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6810893)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2487 (class 1259 OID 6811222)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2473 (class 1259 OID 6811187)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2515 (class 1259 OID 6811299)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2516 (class 1259 OID 6811300)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 6811479)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 6811480)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2570 (class 1259 OID 6811481)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2397 (class 1259 OID 6811006)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 6811005)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2399 (class 1259 OID 6811007)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2583 (class 1259 OID 6811534)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2523 (class 1259 OID 6811327)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6811328)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2560 (class 1259 OID 6811453)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2561 (class 1259 OID 6811455)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2562 (class 1259 OID 6811451)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2563 (class 1259 OID 6811454)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2564 (class 1259 OID 6811452)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2512 (class 1259 OID 6811290)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2464 (class 1259 OID 6811175)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2465 (class 1259 OID 6811174)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2466 (class 1259 OID 6811172)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2467 (class 1259 OID 6811173)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2348 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 6811441)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2557 (class 1259 OID 6811440)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2571 (class 1259 OID 6811490)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2429 (class 1259 OID 6811089)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2380 (class 1259 OID 6810939)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2381 (class 1259 OID 6810938)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2389 (class 1259 OID 6810971)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 6810972)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2453 (class 1259 OID 6811156)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 6811155)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2455 (class 1259 OID 6811154)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2574 (class 1259 OID 6811498)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2575 (class 1259 OID 6811497)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2436 (class 1259 OID 6811121)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2437 (class 1259 OID 6811117)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2438 (class 1259 OID 6811114)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2439 (class 1259 OID 6811115)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2440 (class 1259 OID 6811113)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2441 (class 1259 OID 6811118)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2442 (class 1259 OID 6811116)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2396 (class 1259 OID 6810991)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2414 (class 1259 OID 6811055)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 6811057)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2416 (class 1259 OID 6811056)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2417 (class 1259 OID 6811058)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2472 (class 1259 OID 6811181)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2542 (class 1259 OID 6811388)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 6811419)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2387 (class 1259 OID 6810962)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2388 (class 1259 OID 6810963)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2509 (class 1259 OID 6811283)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 6811558)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6811027)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2591 (class 1259 OID 6811546)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2492 (class 1259 OID 6811232)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2493 (class 1259 OID 6811231)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 6811450)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2404 (class 1259 OID 6811015)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6811401)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6811373)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6811374)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2373 (class 1259 OID 6810912)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2443 (class 1259 OID 6811120)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2620 (class 2606 OID 6811694)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2623 (class 2606 OID 6811679)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2622 (class 2606 OID 6811684)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2618 (class 2606 OID 6811704)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2624 (class 2606 OID 6811674)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2619 (class 2606 OID 6811699)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2621 (class 2606 OID 6811689)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2654 (class 2606 OID 6811849)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6811854)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6811609)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2641 (class 2606 OID 6811789)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2639 (class 2606 OID 6811784)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2640 (class 2606 OID 6811779)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2617 (class 2606 OID 6811669)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2649 (class 2606 OID 6811819)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 6811829)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2648 (class 2606 OID 6811824)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2611 (class 2606 OID 6811644)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6811639)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 6811769)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 6811874)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 6811879)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 6811884)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2679 (class 2606 OID 6811979)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6811904)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2665 (class 2606 OID 6811889)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2661 (class 2606 OID 6811909)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2663 (class 2606 OID 6811899)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2664 (class 2606 OID 6811894)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2609 (class 2606 OID 6811634)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2610 (class 2606 OID 6811629)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2601 (class 2606 OID 6811594)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2602 (class 2606 OID 6811589)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2643 (class 2606 OID 6811799)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2625 (class 2606 OID 6811709)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2598 (class 2606 OID 6811569)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2597 (class 2606 OID 6811574)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2644 (class 2606 OID 6811814)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2645 (class 2606 OID 6811809)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2646 (class 2606 OID 6811804)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2615 (class 2606 OID 6811649)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2613 (class 2606 OID 6811659)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2614 (class 2606 OID 6811654)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2681 (class 2606 OID 6811989)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2629 (class 2606 OID 6811744)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2631 (class 2606 OID 6811734)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2632 (class 2606 OID 6811729)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2630 (class 2606 OID 6811739)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2596 (class 2606 OID 6811559)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2595 (class 2606 OID 6811564)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2642 (class 2606 OID 6811794)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2638 (class 2606 OID 6811774)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2652 (class 2606 OID 6811839)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2651 (class 2606 OID 6811844)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 6811949)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2674 (class 2606 OID 6811954)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2673 (class 2606 OID 6811959)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2607 (class 2606 OID 6811619)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6811614)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2606 (class 2606 OID 6811624)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2680 (class 2606 OID 6811984)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 6811859)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6811864)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2670 (class 2606 OID 6811934)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2668 (class 2606 OID 6811944)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2672 (class 2606 OID 6811924)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2669 (class 2606 OID 6811939)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2671 (class 2606 OID 6811929)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2650 (class 2606 OID 6811834)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 6811764)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2634 (class 2606 OID 6811759)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2636 (class 2606 OID 6811749)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2635 (class 2606 OID 6811754)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2666 (class 2606 OID 6811919)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2667 (class 2606 OID 6811914)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2676 (class 2606 OID 6811964)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2616 (class 2606 OID 6811664)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6811869)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2599 (class 2606 OID 6811584)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2600 (class 2606 OID 6811579)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2604 (class 2606 OID 6811599)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2603 (class 2606 OID 6811604)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6811724)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2627 (class 2606 OID 6811719)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2628 (class 2606 OID 6811714)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2677 (class 2606 OID 6811974)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2678 (class 2606 OID 6811969)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 11:05:20 CEST

--
-- PostgreSQL database dump complete
--

