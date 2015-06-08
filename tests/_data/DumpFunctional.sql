--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 13:59:43 CEST

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
-- TOC entry 180 (class 1259 OID 6583378)
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
-- TOC entry 227 (class 1259 OID 6583901)
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
-- TOC entry 226 (class 1259 OID 6583884)
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
-- TOC entry 219 (class 1259 OID 6583787)
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
-- TOC entry 194 (class 1259 OID 6583557)
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
-- TOC entry 197 (class 1259 OID 6583591)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6583500)
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
-- TOC entry 228 (class 1259 OID 6583915)
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
-- TOC entry 213 (class 1259 OID 6583717)
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
-- TOC entry 192 (class 1259 OID 6583537)
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
-- TOC entry 196 (class 1259 OID 6583585)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6583517)
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
-- TOC entry 202 (class 1259 OID 6583634)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6583659)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6583474)
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
-- TOC entry 181 (class 1259 OID 6583387)
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
-- TOC entry 182 (class 1259 OID 6583398)
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
-- TOC entry 177 (class 1259 OID 6583352)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6583371)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6583666)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6583697)
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
-- TOC entry 223 (class 1259 OID 6583835)
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
-- TOC entry 184 (class 1259 OID 6583431)
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
-- TOC entry 186 (class 1259 OID 6583466)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6583640)
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
-- TOC entry 185 (class 1259 OID 6583451)
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
-- TOC entry 191 (class 1259 OID 6583529)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6583652)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6583772)
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
-- TOC entry 222 (class 1259 OID 6583827)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6583941)
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
-- TOC entry 232 (class 1259 OID 6583969)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 237 (class 1259 OID 6584001)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6583950)
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
-- TOC entry 236 (class 1259 OID 6583999)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6583681)
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
-- TOC entry 201 (class 1259 OID 6583625)
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
-- TOC entry 200 (class 1259 OID 6583615)
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
-- TOC entry 221 (class 1259 OID 6583816)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6583749)
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
-- TOC entry 174 (class 1259 OID 6583323)
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
-- TOC entry 173 (class 1259 OID 6583321)
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
-- TOC entry 210 (class 1259 OID 6583691)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6583361)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6583345)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6583705)
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
-- TOC entry 204 (class 1259 OID 6583646)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6583596)
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
-- TOC entry 235 (class 1259 OID 6583988)
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
-- TOC entry 234 (class 1259 OID 6583980)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6583975)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6583759)
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
-- TOC entry 183 (class 1259 OID 6583423)
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
-- TOC entry 199 (class 1259 OID 6583602)
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
-- TOC entry 220 (class 1259 OID 6583805)
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
-- TOC entry 231 (class 1259 OID 6583958)
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
-- TOC entry 188 (class 1259 OID 6583486)
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
-- TOC entry 175 (class 1259 OID 6583332)
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
-- TOC entry 225 (class 1259 OID 6583862)
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
-- TOC entry 193 (class 1259 OID 6583548)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6583673)
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
-- TOC entry 215 (class 1259 OID 6583742)
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
-- TOC entry 195 (class 1259 OID 6583580)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6583852)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6583732)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2172 (class 2604 OID 6583326)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2784 (class 0 OID 6583378)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6583901)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-83ae-794e-19e31bb2ab49	000d0000-5575-83ae-c7e4-e4968ded5112	\N	00090000-5575-83ae-5a27-4047c007f3b9	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-83ae-44db-3bac92658e40	000d0000-5575-83ae-36b7-9f8b795b9ff3	\N	00090000-5575-83ae-f6f3-b24cc6b8e809	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-83ae-39f8-f79d1efde306	000d0000-5575-83ae-9c79-15a04882870a	\N	00090000-5575-83ae-4df0-f1e3201be074	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-83ae-2710-f7e1306f7987	000d0000-5575-83ae-3234-073a49c1304e	\N	00090000-5575-83ae-9128-b1e5c79a25f3	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-83ae-c8df-5132e64f3732	000d0000-5575-83ae-386f-386ee62ceb55	\N	00090000-5575-83ae-67b8-6509c9b34be4	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-83ae-f808-81daaaa9afe1	000d0000-5575-83ae-aa05-c75d1f112468	\N	00090000-5575-83ae-f6f3-b24cc6b8e809	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2830 (class 0 OID 6583884)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6583787)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-83ae-83cb-84f3f21611c9	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-83ae-bed4-ca448ff4a68e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-83ae-2489-8eb9ab2dfb11	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2798 (class 0 OID 6583557)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-83ae-1431-396caafa7901	\N	\N	00200000-5575-83ae-e2cb-939c4301e6a9	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-83ae-121f-005b8cc6acdd	\N	\N	00200000-5575-83ae-ac4e-fc741b1c7404	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-83ae-d117-818029cb9a0a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-83ae-3a24-73e487818e5d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-83ae-7dbb-2805aa20cc0f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2801 (class 0 OID 6583591)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6583500)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-83ad-8bd9-bfacd1916330	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-83ad-4347-4daa875851f1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-83ad-6609-a029cf963a98	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-83ad-2cd3-5d28cb86ba4e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-83ad-49fa-9f5ccd0ef044	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-83ad-9150-f85849ff5309	AD	AND	020	Andorra 	Andora	\N
00040000-5575-83ad-9de8-3209dbd1d92c	AO	AGO	024	Angola 	Angola	\N
00040000-5575-83ad-8877-37adc5fed6d3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-83ad-63d7-c3b9d119957b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-83ad-a0bc-84fafbf87d58	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-83ad-91d1-fd996330d457	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-83ad-c3d4-2714d83ba8b6	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-83ad-d1d8-b9412e17951b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-83ad-e6db-a673ca372bcb	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-83ad-674c-7b2cf90bd5cb	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-83ad-630e-31a2eebe01ec	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-83ad-8c46-d85d1c409aff	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-83ad-a2a3-c8d29d334e5e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-83ad-3bae-9622f5000576	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-83ad-5cbf-25db785ab7be	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-83ad-22d5-927acbf19ac3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-83ad-8dfa-a041e4be5cac	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-83ad-bc48-02da11b47f99	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-83ad-2c16-8785a6fa6432	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-83ad-6685-5963c640eca9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-83ad-1d45-ffcd4a372265	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-83ad-e816-baa6777b87bf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-83ad-6cc7-dfa6fe67ac32	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-83ad-0207-b4ad20c2a275	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-83ad-84b5-70b9de90b919	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-83ad-f396-96935be1b776	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-83ad-b16e-0a0707dcf965	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-83ad-8aba-e3c961633835	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-83ad-4a02-f7690f0738a6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-83ad-86aa-3650b61f939c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-83ad-5deb-b79ce749137c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-83ad-752e-35725a9d257f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-83ad-e944-dc11289fa0da	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-83ad-cd3e-34a2142a6d68	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-83ad-b1cc-8db6d3f34043	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-83ad-85fb-d85ecd1e88a6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-83ad-36e7-e4edbe42664b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-83ad-649a-6601dce45d2e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-83ad-a10f-8896bd8293bc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-83ad-0301-6a5979958e08	CL	CHL	152	Chile 	Čile	\N
00040000-5575-83ad-8aa7-9d32bec6960c	CN	CHN	156	China 	Kitajska	\N
00040000-5575-83ad-85d4-c1ee7f44c1ea	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-83ad-d413-3cd3dff04028	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-83ad-6e37-43b210f50ac4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-83ad-ec18-c69566e90dd0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-83ad-7d1e-58e4b14e701a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-83ad-f9dc-119767d37195	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-83ad-37a3-9384f83328ef	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-83ad-2ad2-21f2929e7602	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-83ad-0bcb-9c94901aef1f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-83ad-779f-0d75fb6ceb4e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-83ad-a302-a89c76be808d	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-83ad-37f9-976dde87fa89	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-83ad-4847-73e6210048eb	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-83ad-e575-4788aafaf881	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-83ad-cdaa-704db7e309ab	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-83ad-4333-963a4a251f3b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-83ad-a6f3-fa0c53033b0a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-83ad-3d45-7fbf682e35ac	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-83ad-f365-45270bbf08dd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-83ad-5fc5-1b3cbe07db7d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-83ad-96f7-c69600a7fb72	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-83ad-314e-0fdb4e988075	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-83ad-05e2-0e64999eab64	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-83ad-14b4-ce84c7b33ed1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-83ad-50a5-da6c3235acaa	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-83ad-ac8f-b4680aa1db3b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-83ad-938d-69b02b80ca1e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-83ad-7225-f149b6855dbd	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-83ad-f270-f3584138e07b	FI	FIN	246	Finland 	Finska	\N
00040000-5575-83ad-bb00-d08e7677f1df	FR	FRA	250	France 	Francija	\N
00040000-5575-83ad-97c1-2ba0d6caca30	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-83ad-3abc-15876caa8721	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-83ad-0c04-0c85dbec254f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-83ad-7d40-5d6b8567c8a0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-83ad-5802-7bd06f94c2de	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-83ad-4369-1e1a837c7147	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-83ad-708c-b1979b8c1ed0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-83ad-346c-4b08d1d90a8e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-83ad-34e9-81ec09f17ff9	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-83ad-25c0-e3cd7f2d358e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-83ad-408b-55f40c54c790	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-83ad-6748-8a17dbac1398	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-83ad-1367-3a1d9e33f8c8	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-83ad-fe11-a095d717199c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-83ad-7fbc-5614c2ee537a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-83ad-ea8a-f4eabf340d46	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-83ad-1e75-dfaf18aee006	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-83ad-3ba2-2a92349f796f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-83ad-6e43-9b607a1677ac	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-83ad-fd6b-cffb83182c85	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-83ad-2e48-d26ea9a8cf73	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-83ad-a9e7-47233cb6d654	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-83ad-5f67-dad8a2c26f87	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-83ad-7edc-98a14c5024d1	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-83ad-cb9b-bd350a499d6d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-83ad-f8bb-6e9c119528a6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-83ad-e7dd-3a4208390c58	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-83ad-3ed1-73100860f605	IN	IND	356	India 	Indija	\N
00040000-5575-83ad-9321-b00e8dea7926	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-83ad-9ab8-3a7d706ff6b2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-83ad-0f6f-110784d56ff7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-83ad-3bf3-59a463405398	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-83ad-c6e0-59b2981d0efb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-83ad-4d7b-bd8850828b7f	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-83ad-aac1-6620b3b47c68	IT	ITA	380	Italy 	Italija	\N
00040000-5575-83ad-f602-caccacd54254	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-83ad-377e-2e055d2f0149	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-83ad-5409-be45db543a3a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-83ad-7114-e95ed0b7851f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-83ad-47f3-8910b4f17a18	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-83ad-16b0-cb89cdc34533	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-83ad-c011-c51f9169c9c5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-83ad-31b1-1752cae7b3d4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-83ad-52bc-aa87b8c895db	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-83ad-94ed-bacc323ed194	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-83ad-577b-896eb8681b38	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-83ad-6fd5-014abb40eb83	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-83ad-97f0-c6087a57459a	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-83ad-e1fa-f11c2b8d1767	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-83ad-4ae5-ca3dcf422a04	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-83ad-6f38-950725b401b7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-83ad-2482-ee8b710c02dd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-83ad-9f90-05055c9ccd3e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-83ad-eee8-e24591f7cc80	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-83ad-14e0-9f755fa80df9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-83ad-4892-8a60c994de3b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-83ad-6561-3807c69c535a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-83ad-223a-8884ce719889	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-83ad-eb21-366269ddb0e8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-83ad-0528-5478fb56888e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-83ad-cf4a-ac0e33de1152	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-83ad-5e6f-869d12950ebf	ML	MLI	466	Mali 	Mali	\N
00040000-5575-83ad-0e7d-be35a1063055	MT	MLT	470	Malta 	Malta	\N
00040000-5575-83ad-e6b6-7c26b3ac9946	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-83ad-d5a8-3ed41bacbaf0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-83ad-7a0d-b582d39e1e1c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-83ad-845f-5ce6998b2ef3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-83ad-bbfd-4c999173dc39	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-83ad-a9c0-80c7f358625c	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-83ad-c842-cbc3c5b1faa5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-83ad-86e0-636efa4e0f5c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-83ad-abdd-9e2849ccd9d7	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-83ad-c687-f525e90a4c6e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-83ad-63e3-7910d5b34d3c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-83ad-09f5-2fd912320a1f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-83ad-48e0-1f46973e4efe	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-83ad-a8cc-8a70c1173f56	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-83ad-29ad-ec6ede4449c1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-83ad-b920-f406fa2c35f1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-83ad-43a0-18cea95c0720	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-83ad-f917-e05e131afb88	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-83ad-9729-8f9c83d14acf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-83ad-7520-76e6c6064061	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-83ad-2821-b503ef97d9a8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-83ad-63f4-e5592330d23a	NE	NER	562	Niger 	Niger 	\N
00040000-5575-83ad-226d-1048a7bbf622	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-83ad-4dda-b40f1709a357	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-83ad-1714-e14a59dcd931	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-83ad-c0c1-a0727f14563e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-83ad-e20e-eeeb8c68ec77	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-83ad-ceec-db9a0ad0b22c	OM	OMN	512	Oman 	Oman	\N
00040000-5575-83ad-fe1f-76f8e8090b39	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-83ad-c9e0-84386bea6ecf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-83ad-6d86-6f133600a6bf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-83ad-dffb-4a295ce11055	PA	PAN	591	Panama 	Panama	\N
00040000-5575-83ad-9f31-6e1bac7a837b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-83ad-df7f-d1d512b0ac4f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-83ad-a2f4-052b8789c6f5	PE	PER	604	Peru 	Peru	\N
00040000-5575-83ad-5b99-7928569b2407	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-83ad-7584-0e83f98d3098	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-83ad-e54c-e757b1270798	PL	POL	616	Poland 	Poljska	\N
00040000-5575-83ad-c481-0259b7861877	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-83ad-f1d8-db4b2edb2ed6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-83ad-505d-229801983491	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-83ad-158a-9e6211716a00	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-83ad-c20e-20ae21a2db16	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-83ad-7d3d-9834e2be0ee0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-83ad-0f60-da97462d1424	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-83ad-dba1-d4928138cbb0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-83ad-f2ce-285185fd046f	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-83ad-6872-e27ae24fd42b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-83ad-4dac-dbbee5325700	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-83ad-c209-5501265ddcf1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-83ad-8ac8-dffee95f033d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-83ad-c299-2cf94634e84f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-83ad-7d55-f9ce00946767	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-83ad-c196-44a3023cc719	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-83ad-5fd7-e1581d337f32	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-83ad-935c-30a1298f7d1a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-83ad-9b71-d1a82ee51180	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-83ad-5ea8-715ace261442	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-83ad-ab49-5e7afb54de1c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-83ad-92a2-c947483e62d5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-83ad-e01b-f3b5192ce6b1	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-83ad-b888-c70e2304d1c9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-83ad-3656-5ed447a8f4d5	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-83ad-7c8a-78e252e13d4f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-83ad-8b6b-5eac66206bfa	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-83ad-05ff-827ed66a5b0e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-83ad-c0c5-4c779ccb2140	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-83ad-e66d-d2337475d509	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-83ad-afcc-717a54f45bba	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-83ad-1ff8-202c92151931	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-83ad-3417-417a2c038f54	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-83ad-b7a9-780193b34651	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-83ad-3b62-ce7fa6580cab	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-83ad-749b-7709db4c6c85	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-83ad-b45f-03016b01cf59	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-83ad-1fee-782282afc153	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-83ad-f811-087be9656d05	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-83ad-897d-67904a92dba0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-83ad-81eb-1a1e474d7323	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-83ad-dc17-38b43425c3ca	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-83ad-7111-2c94c64677d6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-83ad-653d-4cbe418e5998	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-83ad-16a2-725ef5be3943	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-83ad-9cbd-11d0c3921eab	TG	TGO	768	Togo 	Togo	\N
00040000-5575-83ad-296d-be6648df4ba1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-83ad-5614-1cfcd8ba6950	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-83ad-4072-9dbfdee98cf6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-83ad-fc6d-63d6c0792f4e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-83ad-1a86-10e6ce3a1df5	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-83ad-751a-3827fca083ba	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-83ad-ff5c-e30132313b4c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-83ad-f9c7-9539f1e25cb6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-83ad-abcb-22c04469e028	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-83ad-a3f2-6bd2c429da33	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-83ad-6136-bf1240a4c554	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-83ad-f3a4-ecf347edfeaf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-83ad-21c8-894333fa491a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-83ad-7432-f36e540e8276	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-83ad-4bae-54c252382236	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-83ad-8589-d9d5b43d04ac	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-83ad-295c-458763da1067	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-83ad-63be-f26dc4741172	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-83ad-0bcd-de836739b6cf	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-83ad-49fd-1bcd4daadb0c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-83ad-56da-f282ae74d037	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-83ad-7745-e5422508aa00	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-83ad-740f-660fafa96d46	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-83ad-8033-c24082795448	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-83ad-ed49-f2f1176d4f30	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-83ad-6ce9-b2237d5ec3d0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2832 (class 0 OID 6583915)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6583717)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-83ae-d8f4-c608e81f45fb	000e0000-5575-83ae-aef9-e30dfccfb305	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-83ad-519f-56a70aca9867
000d0000-5575-83ae-c7e4-e4968ded5112	000e0000-5575-83ae-aef9-e30dfccfb305	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-83ad-519f-56a70aca9867
000d0000-5575-83ae-36b7-9f8b795b9ff3	000e0000-5575-83ae-aef9-e30dfccfb305	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-83ad-8dcb-b3865c9d9fea
000d0000-5575-83ae-9c79-15a04882870a	000e0000-5575-83ae-aef9-e30dfccfb305	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-83ad-e4d4-e605587a981b
000d0000-5575-83ae-3234-073a49c1304e	000e0000-5575-83ae-aef9-e30dfccfb305	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-83ad-e4d4-e605587a981b
000d0000-5575-83ae-386f-386ee62ceb55	000e0000-5575-83ae-aef9-e30dfccfb305	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-83ad-e4d4-e605587a981b
000d0000-5575-83ae-aa05-c75d1f112468	000e0000-5575-83ae-aef9-e30dfccfb305	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-83ad-519f-56a70aca9867
\.


--
-- TOC entry 2796 (class 0 OID 6583537)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6583585)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6583517)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-83ae-367a-758bb7ab73ad	00080000-5575-83ae-0e90-ebc9f245d099	00090000-5575-83ae-5a27-4047c007f3b9	AK		
\.


--
-- TOC entry 2774 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6583634)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6583659)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6583474)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-83ae-d788-74ac7c19350c	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-83ae-cf77-f1c1da33ee0b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-83ae-b768-1ca299a76033	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-83ae-f5e4-1f4592bc05ce	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-83ae-1b86-445491972201	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-83ae-d95b-0fb31137486c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-83ae-8228-b10a0b62c43b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-83ae-fa5b-9f5b59837aab	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-83ae-d346-c0abf60074d3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-83ae-1f88-b6d2534e1e35	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-83ae-8df8-02a53f9d391f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-83ae-5ada-be0955d01114	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-83ae-b452-132f761fb754	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-83ae-731a-0c890e5d3a83	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-83ae-3775-bedeebc94931	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-83ae-0ae0-1389a946f2c7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2785 (class 0 OID 6583387)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-83ae-370f-242278a2d033	00000000-5575-83ae-1b86-445491972201	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-83ae-6747-a63d61e5878a	00000000-5575-83ae-1b86-445491972201	00010000-5575-83ae-e80e-f73bbc1930af	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-83ae-859a-156b9a054c19	00000000-5575-83ae-d95b-0fb31137486c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2786 (class 0 OID 6583398)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-83ae-5a22-6803c8ec6ece	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-83ae-9128-b1e5c79a25f3	00010000-5575-83ae-c3c0-962c60d247a1	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-83ae-4df0-f1e3201be074	00010000-5575-83ae-5e9e-023b3e5e202b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-83ae-3388-ea17ad3e24e7	00010000-5575-83ae-7a0b-06bb4840717f	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-83ae-8caa-8558d04dd1bc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-83ae-18df-ed018bc5e034	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-83ae-1f07-9a10eba020c7	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-83ae-4c3e-c792bfeb25f6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-83ae-5a27-4047c007f3b9	00010000-5575-83ae-9c6e-6ddd5e8f82cf	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-83ae-f6f3-b24cc6b8e809	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-83ae-f0da-c0dd22ea8410	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-83ae-67b8-6509c9b34be4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-83ae-34cb-c0a61db562e4	00010000-5575-83ae-ba6b-a3c2de8cf21a	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2776 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6583352)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-83ae-0021-325945dbda82	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-83ae-7ec3-e59defaabdd6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-83ae-ece5-97fd49c8a1ae	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-83ae-49eb-50ae756c3719	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-83ae-5c3c-85104ae3facc	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-83ae-d362-de2ed721351d	Abonma-read	Abonma - branje	f
00030000-5575-83ae-42f4-4327f6fa3fb4	Abonma-write	Abonma - spreminjanje	f
00030000-5575-83ae-0a50-3d89d5204dd4	Alternacija-read	Alternacija - branje	f
00030000-5575-83ae-ade2-9c23986a1eb5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-83ae-328a-f00f92f0a2ea	Arhivalija-read	Arhivalija - branje	f
00030000-5575-83ae-4fbc-00066c74954c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-83ae-2734-6e26d67157c2	Besedilo-read	Besedilo - branje	f
00030000-5575-83ae-dc23-1692c2017659	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-83ae-b132-11392ee55d2b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-83ae-91ff-30a0f7602b8e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-83ae-da8d-95e8cca55552	Dogodek-read	Dogodek - branje	f
00030000-5575-83ae-b03e-867aa9a9dd12	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-83ae-4ac8-772b936ffadc	Drzava-read	Drzava - branje	f
00030000-5575-83ae-7185-d06b63849d73	Drzava-write	Drzava - spreminjanje	f
00030000-5575-83ae-eeef-6d9ec6b3f871	Funkcija-read	Funkcija - branje	f
00030000-5575-83ae-7dcc-3ef83666c96e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-83ae-50f4-1dd257df827b	Gostovanje-read	Gostovanje - branje	f
00030000-5575-83ae-6a56-198b17b9eab9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-83ae-a60f-e6925d03b6fe	Gostujoca-read	Gostujoca - branje	f
00030000-5575-83ae-5ead-76b3417da9ea	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-83ae-6e22-4ee2fa3e8e1f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-83ae-2b8e-c2393281c903	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-83ae-4d6a-9183082ae988	Kupec-read	Kupec - branje	f
00030000-5575-83ae-9626-88331b7959aa	Kupec-write	Kupec - spreminjanje	f
00030000-5575-83ae-3408-beb5f192ed45	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-83ae-10aa-b36c68b4ddbb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-83ae-7437-df199369f68e	Option-read	Option - branje	f
00030000-5575-83ae-dac5-0bcfafde6cf1	Option-write	Option - spreminjanje	f
00030000-5575-83ae-6f1c-972d2396632b	OptionValue-read	OptionValue - branje	f
00030000-5575-83ae-7b4e-1d55e059db6f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-83ae-0f32-438d3851128a	Oseba-read	Oseba - branje	f
00030000-5575-83ae-45f8-6d3399b3164c	Oseba-write	Oseba - spreminjanje	f
00030000-5575-83ae-6231-957392044463	Permission-read	Permission - branje	f
00030000-5575-83ae-a911-7ce5a01246ad	Permission-write	Permission - spreminjanje	f
00030000-5575-83ae-9423-0dc014966fd5	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-83ae-188d-6c4b581b61de	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-83ae-1817-07ce8a2927b5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-83ae-e884-c885c2cc6a17	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-83ae-80d1-da180996a9a6	Pogodba-read	Pogodba - branje	f
00030000-5575-83ae-b7b6-b3ac579e3968	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-83ae-4a73-3093af1cc525	Popa-read	Popa - branje	f
00030000-5575-83ae-273f-a5fbce39afb1	Popa-write	Popa - spreminjanje	f
00030000-5575-83ae-4115-16950a66d01d	Posta-read	Posta - branje	f
00030000-5575-83ae-b7de-4c047116aeb5	Posta-write	Posta - spreminjanje	f
00030000-5575-83ae-3931-e5b73874534d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-83ae-b508-b73e399a4cbb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-83ae-51c3-57744dcc4fbe	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-83ae-4a7f-a88f39a0b316	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-83ae-d495-85fdf10ddc62	Predstava-read	Predstava - branje	f
00030000-5575-83ae-7883-59cfa5723e89	Predstava-write	Predstava - spreminjanje	f
00030000-5575-83ae-9a1b-320993de05f0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-83ae-4c1f-047b1480de0b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-83ae-b43e-a0512b06b334	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-83ae-86ea-9181462ff333	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-83ae-8498-1b4d7c72b570	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-83ae-5914-9928c7098bb6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-83ae-5cc5-48b8b8798491	ProgramDela-read	ProgramDela - branje	f
00030000-5575-83ae-865a-57a6e58d9560	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-83ae-5f5d-05cd5868b694	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-83ae-ab24-fda3262500b6	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-83ae-efb0-35766df146eb	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-83ae-9707-9d5601910cae	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-83ae-7af1-aa72d338f788	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-83ae-f02f-58f850fa1e12	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-83ae-96a3-bf41f1ed9ead	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-83ae-b617-45e30a413f81	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-83ae-c2d8-da1f312b00d0	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-83ae-6749-da82e422096a	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-83ae-d74a-bc9e27d3ded1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-83ae-16db-ec840504cf9e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-83ae-77c0-f0dc2a788117	Prostor-read	Prostor - branje	f
00030000-5575-83ae-2137-c76634af7f85	Prostor-write	Prostor - spreminjanje	f
00030000-5575-83ae-c58f-c37c602449a4	Racun-read	Racun - branje	f
00030000-5575-83ae-391b-feb284b158a7	Racun-write	Racun - spreminjanje	f
00030000-5575-83ae-3eb2-b41d833a6283	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-83ae-6c8b-e0313d28025f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-83ae-2e83-ad8fed37780f	Readme-read	Readme - branje	f
00030000-5575-83ae-b29e-84f40372c5ad	Readme-write	Readme - spreminjanje	f
00030000-5575-83ae-be1f-d127df299de8	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-83ae-5433-147123056db4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-83ae-f584-4fe4b41bacc5	Rekvizit-read	Rekvizit - branje	f
00030000-5575-83ae-ce5d-787fa9c3e8aa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-83ae-0d4a-9f9c737fe0c4	Revizija-read	Revizija - branje	f
00030000-5575-83ae-b569-800daf9934ff	Revizija-write	Revizija - spreminjanje	f
00030000-5575-83ae-f0de-29731564600b	Rezervacija-read	Rezervacija - branje	f
00030000-5575-83ae-4189-89ec55df5edf	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-83ae-7343-8668e3be859c	Role-read	Role - branje	f
00030000-5575-83ae-5486-95595e92b65e	Role-write	Role - spreminjanje	f
00030000-5575-83ae-3ae4-6340ee4d24ab	SedezniRed-read	SedezniRed - branje	f
00030000-5575-83ae-5a42-89fe86129760	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-83ae-6860-837461182398	Sedez-read	Sedez - branje	f
00030000-5575-83ae-0cd5-b739c86fb2bf	Sedez-write	Sedez - spreminjanje	f
00030000-5575-83ae-ed05-246c12399616	Sezona-read	Sezona - branje	f
00030000-5575-83ae-767e-280f7ea27b0d	Sezona-write	Sezona - spreminjanje	f
00030000-5575-83ae-6b37-034516bc16df	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-83ae-3d9e-6fa99d29d823	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-83ae-83ca-2c1d19da94cf	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-83ae-2be0-fe45c144ab57	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-83ae-61f0-c32c13338be5	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-83ae-8544-6653c9733e60	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-83ae-18ec-0e63ea30c213	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-83ae-276f-f2ed13c13b30	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-83ae-d06b-21963c86ae38	Telefonska-read	Telefonska - branje	f
00030000-5575-83ae-f61e-7dcd6bd32d94	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-83ae-5b61-62981787d5da	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-83ae-627c-dd0042477227	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-83ae-2b4d-636bb00a26b9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-83ae-9849-f70f77695db7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-83ae-7052-7c5791bc24b8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-83ae-6911-6c71beb3b7fe	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-83ae-97c2-82b2a5e8ddd1	Trr-read	Trr - branje	f
00030000-5575-83ae-3968-58a07f8c80ce	Trr-write	Trr - spreminjanje	f
00030000-5575-83ae-11a0-ebf4dc0c3b42	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-83ae-15ec-7783ac044a57	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-83ae-f1d3-03b3066733e5	User-read	User - branje	f
00030000-5575-83ae-db29-24b19445c95c	User-write	User - spreminjanje	f
00030000-5575-83ae-2513-246eb64121be	Vaja-read	Vaja - branje	f
00030000-5575-83ae-0283-93bf77c60638	Vaja-write	Vaja - spreminjanje	f
00030000-5575-83ae-6e7b-a5a1be529ab9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-83ae-eb5c-a2e1d3a83e5c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-83ae-e9e4-5bc6fb5657e4	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-83ae-c25d-92c355c73f20	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-83ae-97b9-eb69d0d7a344	Zasedenost-read	Zasedenost - branje	f
00030000-5575-83ae-36d0-fe68c6d77b50	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-83ae-b434-2cdd462143da	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-83ae-0e80-6fd56c09678e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-83ae-1366-925d0c1d07e0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-83ae-470a-21d01ce11d37	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2783 (class 0 OID 6583371)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-83ae-a1a7-ff62c4b797df	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-d362-de2ed721351d
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-42f4-4327f6fa3fb4
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-0a50-3d89d5204dd4
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-ade2-9c23986a1eb5
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-328a-f00f92f0a2ea
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-da8d-95e8cca55552
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-49eb-50ae756c3719
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-b03e-867aa9a9dd12
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-7185-d06b63849d73
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-eeef-6d9ec6b3f871
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-7dcc-3ef83666c96e
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-50f4-1dd257df827b
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-6a56-198b17b9eab9
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-a60f-e6925d03b6fe
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-5ead-76b3417da9ea
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-6e22-4ee2fa3e8e1f
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-2b8e-c2393281c903
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-7437-df199369f68e
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-6f1c-972d2396632b
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-0f32-438d3851128a
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-45f8-6d3399b3164c
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-4a73-3093af1cc525
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-273f-a5fbce39afb1
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-4115-16950a66d01d
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-b7de-4c047116aeb5
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-51c3-57744dcc4fbe
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-4a7f-a88f39a0b316
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-d495-85fdf10ddc62
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-7883-59cfa5723e89
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-8498-1b4d7c72b570
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-5914-9928c7098bb6
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-77c0-f0dc2a788117
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-2137-c76634af7f85
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-be1f-d127df299de8
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-5433-147123056db4
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-f584-4fe4b41bacc5
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-ce5d-787fa9c3e8aa
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-ed05-246c12399616
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-767e-280f7ea27b0d
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-2b4d-636bb00a26b9
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-11a0-ebf4dc0c3b42
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-15ec-7783ac044a57
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-2513-246eb64121be
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-0283-93bf77c60638
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-97b9-eb69d0d7a344
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-36d0-fe68c6d77b50
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-b434-2cdd462143da
00020000-5575-83ae-6a69-5c90c9b67779	00030000-5575-83ae-1366-925d0c1d07e0
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-d362-de2ed721351d
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-328a-f00f92f0a2ea
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-da8d-95e8cca55552
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-50f4-1dd257df827b
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-a60f-e6925d03b6fe
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-6e22-4ee2fa3e8e1f
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-2b8e-c2393281c903
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-7437-df199369f68e
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-6f1c-972d2396632b
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-0f32-438d3851128a
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-45f8-6d3399b3164c
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-4a73-3093af1cc525
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-4115-16950a66d01d
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-51c3-57744dcc4fbe
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-4a7f-a88f39a0b316
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-d495-85fdf10ddc62
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-77c0-f0dc2a788117
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-be1f-d127df299de8
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-f584-4fe4b41bacc5
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-ed05-246c12399616
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-d06b-21963c86ae38
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-f61e-7dcd6bd32d94
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-97c2-82b2a5e8ddd1
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-3968-58a07f8c80ce
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-e9e4-5bc6fb5657e4
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-c25d-92c355c73f20
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-b434-2cdd462143da
00020000-5575-83ae-7400-f722f6f03c7f	00030000-5575-83ae-1366-925d0c1d07e0
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-d362-de2ed721351d
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-0a50-3d89d5204dd4
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-328a-f00f92f0a2ea
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-4fbc-00066c74954c
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-2734-6e26d67157c2
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-b132-11392ee55d2b
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-da8d-95e8cca55552
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-eeef-6d9ec6b3f871
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-50f4-1dd257df827b
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-a60f-e6925d03b6fe
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-6e22-4ee2fa3e8e1f
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-7437-df199369f68e
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-6f1c-972d2396632b
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-0f32-438d3851128a
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-4a73-3093af1cc525
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-4115-16950a66d01d
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-d495-85fdf10ddc62
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-8498-1b4d7c72b570
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-77c0-f0dc2a788117
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-be1f-d127df299de8
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-f584-4fe4b41bacc5
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-ed05-246c12399616
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-2b4d-636bb00a26b9
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-2513-246eb64121be
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-97b9-eb69d0d7a344
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-b434-2cdd462143da
00020000-5575-83ae-5bf2-c0cc8de77fee	00030000-5575-83ae-1366-925d0c1d07e0
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-d362-de2ed721351d
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-42f4-4327f6fa3fb4
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-ade2-9c23986a1eb5
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-328a-f00f92f0a2ea
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-da8d-95e8cca55552
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-50f4-1dd257df827b
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-a60f-e6925d03b6fe
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-7437-df199369f68e
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-6f1c-972d2396632b
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-4a73-3093af1cc525
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-4115-16950a66d01d
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-d495-85fdf10ddc62
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-77c0-f0dc2a788117
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-be1f-d127df299de8
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-f584-4fe4b41bacc5
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-ed05-246c12399616
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-2b4d-636bb00a26b9
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-b434-2cdd462143da
00020000-5575-83ae-260c-ee7df95e7e39	00030000-5575-83ae-1366-925d0c1d07e0
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-d362-de2ed721351d
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-328a-f00f92f0a2ea
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-da8d-95e8cca55552
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-4ac8-772b936ffadc
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-50f4-1dd257df827b
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-a60f-e6925d03b6fe
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-7437-df199369f68e
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-6f1c-972d2396632b
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-4a73-3093af1cc525
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-4115-16950a66d01d
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-d495-85fdf10ddc62
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-77c0-f0dc2a788117
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-be1f-d127df299de8
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-f584-4fe4b41bacc5
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-ed05-246c12399616
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-5b61-62981787d5da
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-ece5-97fd49c8a1ae
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-2b4d-636bb00a26b9
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-b434-2cdd462143da
00020000-5575-83ae-c21c-6b86ad580098	00030000-5575-83ae-1366-925d0c1d07e0
\.


--
-- TOC entry 2811 (class 0 OID 6583666)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6583697)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6583835)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6583431)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-83ae-0e90-ebc9f245d099	00040000-5575-83ad-8bd9-bfacd1916330	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-83ae-02e7-d77a5f8efd2d	00040000-5575-83ad-8bd9-bfacd1916330	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-83ae-b746-911a1dfdd5e2	00040000-5575-83ad-8bd9-bfacd1916330	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-83ae-d4d6-a9816a9e5c76	00040000-5575-83ad-8bd9-bfacd1916330	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2790 (class 0 OID 6583466)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-83ad-8d2a-deaf0e3818b5	8341	Adlešiči
00050000-5575-83ad-75e3-290a30101a7b	5270	Ajdovščina
00050000-5575-83ad-5ea3-7bf2b41ed302	6280	Ankaran/Ancarano
00050000-5575-83ad-5a1c-36e48e46f7a9	9253	Apače
00050000-5575-83ad-2257-d9787d76fda1	8253	Artiče
00050000-5575-83ad-64b0-31977aca8884	4275	Begunje na Gorenjskem
00050000-5575-83ad-6486-b0f4bff8f6bb	1382	Begunje pri Cerknici
00050000-5575-83ad-762a-817dbbc5a004	9231	Beltinci
00050000-5575-83ad-8fca-6093c57e3171	2234	Benedikt
00050000-5575-83ad-9732-120194af851f	2345	Bistrica ob Dravi
00050000-5575-83ad-cd29-f177fdd340ef	3256	Bistrica ob Sotli
00050000-5575-83ad-1470-97b85ae3bd82	8259	Bizeljsko
00050000-5575-83ad-76ed-0da46eeee9ed	1223	Blagovica
00050000-5575-83ad-f42a-075ed30c8eea	8283	Blanca
00050000-5575-83ad-fcdf-5911e22b76ad	4260	Bled
00050000-5575-83ad-15f0-cc3e691393fb	4273	Blejska Dobrava
00050000-5575-83ad-f166-dbbb35c2ec78	9265	Bodonci
00050000-5575-83ad-3169-8a1a4e880b07	9222	Bogojina
00050000-5575-83ad-1a1b-e9b4b91d28d2	4263	Bohinjska Bela
00050000-5575-83ad-4fc9-8eba33d58456	4264	Bohinjska Bistrica
00050000-5575-83ad-b2b4-44f4cdefd843	4265	Bohinjsko jezero
00050000-5575-83ad-1e31-482e7b9250b9	1353	Borovnica
00050000-5575-83ad-6a2c-2d04243f35d5	8294	Boštanj
00050000-5575-83ad-4fe2-e89cd5380204	5230	Bovec
00050000-5575-83ad-8f8b-c567fd4a8ef6	5295	Branik
00050000-5575-83ad-7b7c-6fba00c829c8	3314	Braslovče
00050000-5575-83ad-2d51-c135eaa81288	5223	Breginj
00050000-5575-83ad-707e-0d6d3156f8ae	8280	Brestanica
00050000-5575-83ad-7bf3-0a753e436a71	2354	Bresternica
00050000-5575-83ad-660f-656194beb55a	4243	Brezje
00050000-5575-83ad-de3c-73164ef36896	1351	Brezovica pri Ljubljani
00050000-5575-83ad-d8a9-00a9d858095a	8250	Brežice
00050000-5575-83ad-a1b4-573ca80fb3dd	4210	Brnik - Aerodrom
00050000-5575-83ad-c581-ad384de51463	8321	Brusnice
00050000-5575-83ad-2acb-2f0727b0327f	3255	Buče
00050000-5575-83ad-541e-5a8abe542d73	8276	Bučka 
00050000-5575-83ad-0181-46a7e95febf1	9261	Cankova
00050000-5575-83ad-3838-9d1f0ae665b7	3000	Celje 
00050000-5575-83ad-8193-70548724c270	3001	Celje - poštni predali
00050000-5575-83ad-f0d3-fc959d215f93	4207	Cerklje na Gorenjskem
00050000-5575-83ad-5ff1-3c3d2a365194	8263	Cerklje ob Krki
00050000-5575-83ad-16ee-7977885502bf	1380	Cerknica
00050000-5575-83ad-afa5-99fc3282323f	5282	Cerkno
00050000-5575-83ad-8808-9c4e3d9481c8	2236	Cerkvenjak
00050000-5575-83ad-e952-e33d92cf824d	2215	Ceršak
00050000-5575-83ad-ae51-c1a4392fa9b2	2326	Cirkovce
00050000-5575-83ad-48d1-aab8795ee902	2282	Cirkulane
00050000-5575-83ad-f576-a1bc3889ba4d	5273	Col
00050000-5575-83ad-d842-8ad3125171f0	8251	Čatež ob Savi
00050000-5575-83ad-417b-097382b95fb9	1413	Čemšenik
00050000-5575-83ad-8dd7-4e6863fad040	5253	Čepovan
00050000-5575-83ad-ba33-722ff5228893	9232	Črenšovci
00050000-5575-83ad-16de-2327ed3fdf53	2393	Črna na Koroškem
00050000-5575-83ad-35ee-af5c1e4d232d	6275	Črni Kal
00050000-5575-83ad-2bf5-6ee4349c0a3a	5274	Črni Vrh nad Idrijo
00050000-5575-83ad-94f7-570491d389e9	5262	Črniče
00050000-5575-83ad-2ad8-cc75bea3d240	8340	Črnomelj
00050000-5575-83ad-8355-ac74d5d186ed	6271	Dekani
00050000-5575-83ad-0ed9-b01240df2320	5210	Deskle
00050000-5575-83ad-7313-855716a2f610	2253	Destrnik
00050000-5575-83ad-5368-e215210baf3c	6215	Divača
00050000-5575-83ad-30f4-9192d5843cea	1233	Dob
00050000-5575-83ad-1dd5-a2779dbadd98	3224	Dobje pri Planini
00050000-5575-83ad-b356-d3053f1f160f	8257	Dobova
00050000-5575-83ad-274b-5db3c7b08398	1423	Dobovec
00050000-5575-83ad-ca09-d28b0dfcebe6	5263	Dobravlje
00050000-5575-83ad-ea9e-b8dabc1a40a0	3204	Dobrna
00050000-5575-83ad-266c-7bfa89b683d6	8211	Dobrnič
00050000-5575-83ad-878f-eb5718ab569b	1356	Dobrova
00050000-5575-83ad-1de6-9595716c7d69	9223	Dobrovnik/Dobronak 
00050000-5575-83ad-473c-b7eed77f124b	5212	Dobrovo v Brdih
00050000-5575-83ad-cac0-77a3e1f7a9b8	1431	Dol pri Hrastniku
00050000-5575-83ad-ff69-c6ed852033fb	1262	Dol pri Ljubljani
00050000-5575-83ad-179e-31952a63d6c2	1273	Dole pri Litiji
00050000-5575-83ad-04a8-235d42118fa6	1331	Dolenja vas
00050000-5575-83ad-4b5b-d28e8fe0ace7	8350	Dolenjske Toplice
00050000-5575-83ad-9ef9-301dc7d90c6c	1230	Domžale
00050000-5575-83ad-1d16-fce066b8d211	2252	Dornava
00050000-5575-83ad-5a16-d0f32dea9845	5294	Dornberk
00050000-5575-83ad-ea2c-9e2fc06c9193	1319	Draga
00050000-5575-83ad-d491-34e93a7e08ee	8343	Dragatuš
00050000-5575-83ad-a7d2-f711f1a434f4	3222	Dramlje
00050000-5575-83ad-972e-94061e0e4dbd	2370	Dravograd
00050000-5575-83ad-756b-f8abb3ba7c0e	4203	Duplje
00050000-5575-83ad-f159-6cad37d3194a	6221	Dutovlje
00050000-5575-83ad-bf61-dce11e4d2855	8361	Dvor
00050000-5575-83ad-47a6-37e188f8315a	2343	Fala
00050000-5575-83ad-c8bd-aa65192d923a	9208	Fokovci
00050000-5575-83ad-868f-a1c87d343b4a	2313	Fram
00050000-5575-83ad-5fe6-baf28331c3a6	3213	Frankolovo
00050000-5575-83ad-a3c2-026937c908a2	1274	Gabrovka
00050000-5575-83ad-9659-c02aa3773eef	8254	Globoko
00050000-5575-83ad-e2df-8ef96a8305ad	5275	Godovič
00050000-5575-83ad-f84f-f4f91fa59a5c	4204	Golnik
00050000-5575-83ad-a2f2-fd06385ad0a1	3303	Gomilsko
00050000-5575-83ad-2aa0-564f8fc36138	4224	Gorenja vas
00050000-5575-83ad-ec9d-6fe26f9f5396	3263	Gorica pri Slivnici
00050000-5575-83ad-9bab-7b82098559cd	2272	Gorišnica
00050000-5575-83ad-d7c9-1697c01a08e8	9250	Gornja Radgona
00050000-5575-83ad-0211-ad8a45714067	3342	Gornji Grad
00050000-5575-83ad-a0e3-67efaebea484	4282	Gozd Martuljek
00050000-5575-83ad-e31a-0b5f9d071d7e	6272	Gračišče
00050000-5575-83ad-585f-ef384b6ece4a	9264	Grad
00050000-5575-83ad-2b2a-5ee59aa4ecf7	8332	Gradac
00050000-5575-83ad-fdf6-da414ac39df7	1384	Grahovo
00050000-5575-83ad-0c48-e86c9f99cf3f	5242	Grahovo ob Bači
00050000-5575-83ad-c801-11983dca6a6e	5251	Grgar
00050000-5575-83ad-7ccb-34fa4df56099	3302	Griže
00050000-5575-83ad-afef-536ccb28c3f0	3231	Grobelno
00050000-5575-83ad-d407-2031fc8809a1	1290	Grosuplje
00050000-5575-83ad-b765-ba1055006d4f	2288	Hajdina
00050000-5575-83ad-57b1-740d23aa036f	8362	Hinje
00050000-5575-83ad-2ac8-cc6f9a2f6446	2311	Hoče
00050000-5575-83ad-cbf3-99775ed44fc9	9205	Hodoš/Hodos
00050000-5575-83ad-4f49-3262c3466f9e	1354	Horjul
00050000-5575-83ad-afed-52688d94121d	1372	Hotedršica
00050000-5575-83ad-095c-1fb28d648815	1430	Hrastnik
00050000-5575-83ad-80e7-f2b39733a523	6225	Hruševje
00050000-5575-83ad-319a-517e85469e68	4276	Hrušica
00050000-5575-83ad-ab9a-94d795cb995f	5280	Idrija
00050000-5575-83ad-4f8b-b554ec91ced8	1292	Ig
00050000-5575-83ad-cbb1-29722858cc26	6250	Ilirska Bistrica
00050000-5575-83ad-ee30-9f5f869f90e5	6251	Ilirska Bistrica-Trnovo
00050000-5575-83ad-fd23-fff43ddfc8d0	1295	Ivančna Gorica
00050000-5575-83ad-1c34-e5ab78358df1	2259	Ivanjkovci
00050000-5575-83ad-92ab-309a950da0c2	1411	Izlake
00050000-5575-83ad-c919-6351bc63d7fb	6310	Izola/Isola
00050000-5575-83ad-f456-9c6255805c9e	2222	Jakobski Dol
00050000-5575-83ad-406b-7a3987ed15db	2221	Jarenina
00050000-5575-83ad-e09d-5169eb5d0430	6254	Jelšane
00050000-5575-83ad-b163-c04b4077052b	4270	Jesenice
00050000-5575-83ad-4104-7de0e0310f05	8261	Jesenice na Dolenjskem
00050000-5575-83ad-277c-fddcd0a9ad74	3273	Jurklošter
00050000-5575-83ad-e62c-133a6f957127	2223	Jurovski Dol
00050000-5575-83ad-feb2-4d0c97a0827a	2256	Juršinci
00050000-5575-83ad-cad9-990640f14d2d	5214	Kal nad Kanalom
00050000-5575-83ad-4c30-2271884c8633	3233	Kalobje
00050000-5575-83ad-0e53-09755c8a1402	4246	Kamna Gorica
00050000-5575-83ad-895d-6cf13d28c824	2351	Kamnica
00050000-5575-83ad-c68a-7d4b6dfadb87	1241	Kamnik
00050000-5575-83ad-ede8-9bb5ac6b7e0d	5213	Kanal
00050000-5575-83ad-f729-a5e7c7a97fc6	8258	Kapele
00050000-5575-83ad-0296-79699437385c	2362	Kapla
00050000-5575-83ad-81c9-8af2372ffce8	2325	Kidričevo
00050000-5575-83ad-2d5e-539abd57c71b	1412	Kisovec
00050000-5575-83ad-89b8-9249f7d452ea	6253	Knežak
00050000-5575-83ad-ba6e-357fc99a7ca2	5222	Kobarid
00050000-5575-83ad-e09b-584b015bcf47	9227	Kobilje
00050000-5575-83ad-577b-0e37ca00553b	1330	Kočevje
00050000-5575-83ad-fd4b-31e7dea33583	1338	Kočevska Reka
00050000-5575-83ad-7ee8-af7ef63640aa	2276	Kog
00050000-5575-83ad-c521-9879b0ba8fc5	5211	Kojsko
00050000-5575-83ad-140a-b80eb31357d8	6223	Komen
00050000-5575-83ad-5147-5b6acceebb5b	1218	Komenda
00050000-5575-83ad-b4d9-66f4872bc858	6000	Koper/Capodistria 
00050000-5575-83ad-9d27-37ca8499da51	6001	Koper/Capodistria - poštni predali
00050000-5575-83ad-4f50-cea3f0162912	8282	Koprivnica
00050000-5575-83ad-18e2-e7ce1f4f2872	5296	Kostanjevica na Krasu
00050000-5575-83ad-274b-d1fd2a7fadae	8311	Kostanjevica na Krki
00050000-5575-83ad-fbe1-e2a0e0a77b1b	1336	Kostel
00050000-5575-83ad-a5d5-e6e02138f0f1	6256	Košana
00050000-5575-83ad-aa6c-96ccc2b3eae1	2394	Kotlje
00050000-5575-83ad-e2dd-38b330438bc4	6240	Kozina
00050000-5575-83ad-3ef7-8fa0e1cb1f05	3260	Kozje
00050000-5575-83ad-db9a-802b6dc93899	4000	Kranj 
00050000-5575-83ad-f709-b242f4598975	4001	Kranj - poštni predali
00050000-5575-83ad-2e8c-70506c2db76d	4280	Kranjska Gora
00050000-5575-83ad-52eb-a8d07f9c1296	1281	Kresnice
00050000-5575-83ad-c791-fef8c9f674cf	4294	Križe
00050000-5575-83ad-17cb-87b4f61dc772	9206	Križevci
00050000-5575-83ad-c0c8-148b03bb7838	9242	Križevci pri Ljutomeru
00050000-5575-83ad-1207-ce3cf8cb352d	1301	Krka
00050000-5575-83ad-f938-c61d828fc800	8296	Krmelj
00050000-5575-83ad-3838-30ba2b7b2447	4245	Kropa
00050000-5575-83ad-3fed-a0928c0e4cb4	8262	Krška vas
00050000-5575-83ad-4dd3-1e65695fb7f7	8270	Krško
00050000-5575-83ad-90ba-250528fb3854	9263	Kuzma
00050000-5575-83ad-24b2-d1bcc852932b	2318	Laporje
00050000-5575-83ad-328e-1aa178a3e0fc	3270	Laško
00050000-5575-83ad-4868-0d400977e384	1219	Laze v Tuhinju
00050000-5575-83ad-3bc7-112968e6e031	2230	Lenart v Slovenskih goricah
00050000-5575-83ad-6464-3306053e3c9f	9220	Lendava/Lendva
00050000-5575-83ad-655f-e5b27e11dbef	4248	Lesce
00050000-5575-83ad-6526-534d742d8f90	3261	Lesično
00050000-5575-83ad-0b89-4294f535077a	8273	Leskovec pri Krškem
00050000-5575-83ad-6d9d-052ef1e6b751	2372	Libeliče
00050000-5575-83ad-f046-dcb2648a3811	2341	Limbuš
00050000-5575-83ad-2dde-acc0a4c191aa	1270	Litija
00050000-5575-83ad-8923-2c827444c38e	3202	Ljubečna
00050000-5575-83ad-a3bc-a7d036c45780	1000	Ljubljana 
00050000-5575-83ad-338d-0dfb7cb5248a	1001	Ljubljana - poštni predali
00050000-5575-83ad-57c8-fa97c6cf782c	1231	Ljubljana - Črnuče
00050000-5575-83ad-492e-438c44c12ddf	1261	Ljubljana - Dobrunje
00050000-5575-83ad-53dc-975115e1af81	1260	Ljubljana - Polje
00050000-5575-83ad-4a9f-dbc2cd8b0c42	1210	Ljubljana - Šentvid
00050000-5575-83ad-1e3d-251ef2e04ae0	1211	Ljubljana - Šmartno
00050000-5575-83ad-6a72-2f895cf52014	3333	Ljubno ob Savinji
00050000-5575-83ad-26d1-0e16ebf06957	9240	Ljutomer
00050000-5575-83ad-0563-9b667b9c95ff	3215	Loče
00050000-5575-83ad-74ba-1a16a15b13c3	5231	Log pod Mangartom
00050000-5575-83ad-e591-eaac613a2d92	1358	Log pri Brezovici
00050000-5575-83ad-a50e-59348a86a03f	1370	Logatec
00050000-5575-83ad-baec-378de1d1feb9	1371	Logatec
00050000-5575-83ad-1ccb-a153cab13c61	1434	Loka pri Zidanem Mostu
00050000-5575-83ad-074c-e2bb06cb8aec	3223	Loka pri Žusmu
00050000-5575-83ad-a234-08191f8facf5	6219	Lokev
00050000-5575-83ad-314d-ac9518d4932e	1318	Loški Potok
00050000-5575-83ad-d44e-b4bbe551892f	2324	Lovrenc na Dravskem polju
00050000-5575-83ad-c41c-81894792b1a6	2344	Lovrenc na Pohorju
00050000-5575-83ad-9685-28029f820081	3334	Luče
00050000-5575-83ad-8ebc-839da13e9e17	1225	Lukovica
00050000-5575-83ad-1748-bca6443293c0	9202	Mačkovci
00050000-5575-83ad-10ed-86c31529408f	2322	Majšperk
00050000-5575-83ad-067a-d23732321336	2321	Makole
00050000-5575-83ad-2101-e3c85dc28362	9243	Mala Nedelja
00050000-5575-83ad-c4cb-4fc65e7c7974	2229	Malečnik
00050000-5575-83ad-8a00-312fc19e2a85	6273	Marezige
00050000-5575-83ad-d533-64b304d7435c	2000	Maribor 
00050000-5575-83ad-f7bd-c5326818081d	2001	Maribor - poštni predali
00050000-5575-83ad-6a46-33807594e555	2206	Marjeta na Dravskem polju
00050000-5575-83ad-8509-2ae74c449610	2281	Markovci
00050000-5575-83ad-fc46-1086d1787425	9221	Martjanci
00050000-5575-83ad-e82a-9349b1d77e0c	6242	Materija
00050000-5575-83ad-9933-a12596935a12	4211	Mavčiče
00050000-5575-83ad-5d1d-bd71538fa8f4	1215	Medvode
00050000-5575-83ad-e1e1-be7d5d6a024e	1234	Mengeš
00050000-5575-83ad-b02a-9c143a479f8e	8330	Metlika
00050000-5575-83ad-ab04-0ea5287a2878	2392	Mežica
00050000-5575-83ad-d14a-c244d4dfee3d	2204	Miklavž na Dravskem polju
00050000-5575-83ad-a1c3-65f7a281e21b	2275	Miklavž pri Ormožu
00050000-5575-83ad-4b0b-0fe16691524a	5291	Miren
00050000-5575-83ad-2fd1-fa38b3057572	8233	Mirna
00050000-5575-83ad-120d-9185e5427d48	8216	Mirna Peč
00050000-5575-83ad-5d9f-c10f30fd70a9	2382	Mislinja
00050000-5575-83ad-3009-8d74e0ca9b48	4281	Mojstrana
00050000-5575-83ad-37c9-03dce8bb49cf	8230	Mokronog
00050000-5575-83ad-81a2-416975a2af3e	1251	Moravče
00050000-5575-83ad-11cc-5a6fc8176973	9226	Moravske Toplice
00050000-5575-83ad-5ce4-c9ad17d6a517	5216	Most na Soči
00050000-5575-83ad-4687-1aad0c234fd2	1221	Motnik
00050000-5575-83ad-e87d-d4b8d5c5e558	3330	Mozirje
00050000-5575-83ad-a352-e83e03a8e485	9000	Murska Sobota 
00050000-5575-83ad-e7a8-a913ef48002f	9001	Murska Sobota - poštni predali
00050000-5575-83ad-30ad-a56492639656	2366	Muta
00050000-5575-83ad-d8ae-63345021e3d5	4202	Naklo
00050000-5575-83ad-1f43-8acb57185b3d	3331	Nazarje
00050000-5575-83ad-f94d-13841bc2549f	1357	Notranje Gorice
00050000-5575-83ad-8d59-758a3c932661	3203	Nova Cerkev
00050000-5575-83ad-8025-b8b453e5619b	5000	Nova Gorica 
00050000-5575-83ad-30d6-84ad2deeed54	5001	Nova Gorica - poštni predali
00050000-5575-83ad-c1c5-447025aaa13f	1385	Nova vas
00050000-5575-83ad-0134-3fe2362031c5	8000	Novo mesto
00050000-5575-83ad-0d1c-dd61ffe7fd59	8001	Novo mesto - poštni predali
00050000-5575-83ad-8b30-66cb397f4759	6243	Obrov
00050000-5575-83ad-d42b-0346babf4f58	9233	Odranci
00050000-5575-83ad-6d82-07961d70b3d5	2317	Oplotnica
00050000-5575-83ad-28d9-b2eea668772c	2312	Orehova vas
00050000-5575-83ad-6892-78bf9f94a0f0	2270	Ormož
00050000-5575-83ad-d4ce-e1f9f808fdc3	1316	Ortnek
00050000-5575-83ad-4e20-13eb20804ba9	1337	Osilnica
00050000-5575-83ad-2b0f-b499edcebf03	8222	Otočec
00050000-5575-83ad-3aeb-5760d6550eaf	2361	Ožbalt
00050000-5575-83ad-232a-0cef4051d6ac	2231	Pernica
00050000-5575-83ad-add3-3ee128c574c2	2211	Pesnica pri Mariboru
00050000-5575-83ad-9992-e09f0c597ba6	9203	Petrovci
00050000-5575-83ad-57b7-1c908ec00342	3301	Petrovče
00050000-5575-83ad-96d6-83439ba82e95	6330	Piran/Pirano
00050000-5575-83ad-79be-9eab6061304c	8255	Pišece
00050000-5575-83ad-f6cc-e2aa311629da	6257	Pivka
00050000-5575-83ad-a7a9-9adc64eb38a4	6232	Planina
00050000-5575-83ad-a0ce-6b3ec55a70e8	3225	Planina pri Sevnici
00050000-5575-83ad-d505-4d9bafbc0d6f	6276	Pobegi
00050000-5575-83ad-b5ac-d52d5614f724	8312	Podbočje
00050000-5575-83ad-2046-7a7ce45ca309	5243	Podbrdo
00050000-5575-83ad-88ef-4e01108437fe	3254	Podčetrtek
00050000-5575-83ad-2b7c-cffd6e913ccd	2273	Podgorci
00050000-5575-83ad-2ff9-38479cc400ca	6216	Podgorje
00050000-5575-83ad-f566-788649e11dad	2381	Podgorje pri Slovenj Gradcu
00050000-5575-83ad-cf44-8bf9c2904ab9	6244	Podgrad
00050000-5575-83ad-371a-640be423dfb0	1414	Podkum
00050000-5575-83ad-9a2d-e75b42b8dbb5	2286	Podlehnik
00050000-5575-83ad-1ce2-806da83a7136	5272	Podnanos
00050000-5575-83ad-ad82-e0e6aacb063a	4244	Podnart
00050000-5575-83ad-4ba1-c4e232cdddd5	3241	Podplat
00050000-5575-83ad-68cf-07e557eb5c14	3257	Podsreda
00050000-5575-83ad-e164-e4b84bb21908	2363	Podvelka
00050000-5575-83ad-5849-10a6bfc9c20a	2208	Pohorje
00050000-5575-83ad-5f41-db6307412095	2257	Polenšak
00050000-5575-83ad-2b39-c1cb14824f78	1355	Polhov Gradec
00050000-5575-83ad-39af-aa85a17e0901	4223	Poljane nad Škofjo Loko
00050000-5575-83ad-b9e8-694a9f26c37b	2319	Poljčane
00050000-5575-83ad-c968-0889e6f55386	1272	Polšnik
00050000-5575-83ad-8c4a-a5f8238385e4	3313	Polzela
00050000-5575-83ad-3ff0-e027fdb44fda	3232	Ponikva
00050000-5575-83ad-9787-5d03fbd70cd0	6320	Portorož/Portorose
00050000-5575-83ad-ebad-fa12a5022239	6230	Postojna
00050000-5575-83ad-af98-1f274906bffa	2331	Pragersko
00050000-5575-83ad-4990-b3957e356734	3312	Prebold
00050000-5575-83ad-95aa-e39b191570d6	4205	Preddvor
00050000-5575-83ad-f159-167b014eef96	6255	Prem
00050000-5575-83ad-6362-90c18e6fd5c1	1352	Preserje
00050000-5575-83ad-8880-674563905f0c	6258	Prestranek
00050000-5575-83ad-709a-3fefd346d135	2391	Prevalje
00050000-5575-83ad-eeea-70fa2b622171	3262	Prevorje
00050000-5575-83ad-f75c-e7803a7aef2d	1276	Primskovo 
00050000-5575-83ad-ec4a-96f39939f1d8	3253	Pristava pri Mestinju
00050000-5575-83ad-6247-3e6697d07f77	9207	Prosenjakovci/Partosfalva
00050000-5575-83ad-b660-aa368ec02c9f	5297	Prvačina
00050000-5575-83ad-be08-2ae351fa1841	2250	Ptuj
00050000-5575-83ad-36b5-137476310727	2323	Ptujska Gora
00050000-5575-83ad-9c9e-ccaa30b98f4c	9201	Puconci
00050000-5575-83ad-dbb2-29df39b625fb	2327	Rače
00050000-5575-83ad-1102-c3189500fe2e	1433	Radeče
00050000-5575-83ad-c54d-000e8caf83c9	9252	Radenci
00050000-5575-83ad-252b-d914364896d1	2360	Radlje ob Dravi
00050000-5575-83ad-64b8-e126e89cde5b	1235	Radomlje
00050000-5575-83ad-7f10-c211da9400e0	4240	Radovljica
00050000-5575-83ad-9c65-4bca9cab80c4	8274	Raka
00050000-5575-83ad-301d-a7ee37c0a480	1381	Rakek
00050000-5575-83ad-6d75-5ba86604049c	4283	Rateče - Planica
00050000-5575-83ad-f7a2-75def899e9ee	2390	Ravne na Koroškem
00050000-5575-83ad-3fe8-6530d8c9cc09	9246	Razkrižje
00050000-5575-83ad-d06e-37a04b183c0e	3332	Rečica ob Savinji
00050000-5575-83ad-7b89-ada3615d43d3	5292	Renče
00050000-5575-83ad-0b31-fba24aa1ff6b	1310	Ribnica
00050000-5575-83ad-0399-2bbbce0457c6	2364	Ribnica na Pohorju
00050000-5575-83ad-f5f7-2c2c9b655b64	3272	Rimske Toplice
00050000-5575-83ad-88f8-f9a8e3f9448d	1314	Rob
00050000-5575-83ad-3066-fbc1043fbeec	5215	Ročinj
00050000-5575-83ad-c95f-c4a99715e2f4	3250	Rogaška Slatina
00050000-5575-83ad-3282-4341127cf9c4	9262	Rogašovci
00050000-5575-83ad-e6c0-2fa35cdc8778	3252	Rogatec
00050000-5575-83ad-7bd3-ad376c8c3b32	1373	Rovte
00050000-5575-83ad-4eb7-9c6dc6bd8abd	2342	Ruše
00050000-5575-83ad-be18-e4269c89fa4e	1282	Sava
00050000-5575-83ad-ccc6-beb347b67c5c	6333	Sečovlje/Sicciole
00050000-5575-83ad-0e10-fc0d77b4d2b5	4227	Selca
00050000-5575-83ad-afec-5a2561583ef4	2352	Selnica ob Dravi
00050000-5575-83ad-dbe4-57891f4379d4	8333	Semič
00050000-5575-83ad-b205-d6f2ebe2fef0	8281	Senovo
00050000-5575-83ad-40ea-d97817cd28f3	6224	Senožeče
00050000-5575-83ad-4686-9dc91a748bcb	8290	Sevnica
00050000-5575-83ad-da04-d69d06ee911b	6210	Sežana
00050000-5575-83ad-2a58-d1f09cffa7fd	2214	Sladki Vrh
00050000-5575-83ad-8165-b5f91c98ca61	5283	Slap ob Idrijci
00050000-5575-83ad-ee12-fa4408a9cb07	2380	Slovenj Gradec
00050000-5575-83ad-5111-50effbbe7183	2310	Slovenska Bistrica
00050000-5575-83ad-d89f-5a011d33b85e	3210	Slovenske Konjice
00050000-5575-83ad-5c41-36a4a926ccc5	1216	Smlednik
00050000-5575-83ad-89db-02abf3ce2f47	5232	Soča
00050000-5575-83ad-fef4-7f5840339e76	1317	Sodražica
00050000-5575-83ad-8af4-a52b09020bdb	3335	Solčava
00050000-5575-83ad-4708-d35d5db275c3	5250	Solkan
00050000-5575-83ad-f571-910e6ea52ce8	4229	Sorica
00050000-5575-83ad-0820-daf4f61a9269	4225	Sovodenj
00050000-5575-83ad-7a8d-c4ad49c1ca2c	5281	Spodnja Idrija
00050000-5575-83ad-6614-a91e8e00ba91	2241	Spodnji Duplek
00050000-5575-83ad-45fb-e7ee93752df3	9245	Spodnji Ivanjci
00050000-5575-83ad-7d0d-15c6036fec1e	2277	Središče ob Dravi
00050000-5575-83ad-8c7d-e0f673f9ced3	4267	Srednja vas v Bohinju
00050000-5575-83ad-cd4d-d1cddb51d91e	8256	Sromlje 
00050000-5575-83ad-314b-c58fa8737a12	5224	Srpenica
00050000-5575-83ad-ad02-8cce0ddafb81	1242	Stahovica
00050000-5575-83ad-d34c-c52d6663fd51	1332	Stara Cerkev
00050000-5575-83ad-6d81-9b2b34ee79dc	8342	Stari trg ob Kolpi
00050000-5575-83ad-1643-282912df736a	1386	Stari trg pri Ložu
00050000-5575-83ad-699a-7f9437039c9e	2205	Starše
00050000-5575-83ad-cedd-d61bb25261a4	2289	Stoperce
00050000-5575-83ad-f3b0-4565ec23185e	8322	Stopiče
00050000-5575-83ad-be79-6b41914c1d20	3206	Stranice
00050000-5575-83ad-1a3f-a157403456c8	8351	Straža
00050000-5575-83ad-d24a-93e52e7e214a	1313	Struge
00050000-5575-83ad-9df4-64e6f08be1ed	8293	Studenec
00050000-5575-83ad-7708-d832a862364c	8331	Suhor
00050000-5575-83ad-6d6e-bf0b908db8fc	2233	Sv. Ana v Slovenskih goricah
00050000-5575-83ad-b260-8820cb4385da	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-83ad-f017-e917c6ca782e	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-83ad-85d7-fe671f8e5f37	9244	Sveti Jurij ob Ščavnici
00050000-5575-83ad-e4f1-7d80afb5ff23	3264	Sveti Štefan
00050000-5575-83ad-58aa-8407fc4f92fe	2258	Sveti Tomaž
00050000-5575-83ad-19ee-36e14f3b83bc	9204	Šalovci
00050000-5575-83ad-dd62-1d6035668174	5261	Šempas
00050000-5575-83ad-2737-5d1b74a77ec5	5290	Šempeter pri Gorici
00050000-5575-83ad-d909-354dfde9aa1e	3311	Šempeter v Savinjski dolini
00050000-5575-83ad-cb65-5f81c2a9207b	4208	Šenčur
00050000-5575-83ad-0927-ea8149503aaf	2212	Šentilj v Slovenskih goricah
00050000-5575-83ad-54b0-35c0b06ba1a4	8297	Šentjanž
00050000-5575-83ad-5c0f-24f83216312d	2373	Šentjanž pri Dravogradu
00050000-5575-83ad-74c4-6ca71895cecd	8310	Šentjernej
00050000-5575-83ad-c3b1-60127996ed05	3230	Šentjur
00050000-5575-83ad-7128-ee1841f41211	3271	Šentrupert
00050000-5575-83ad-9731-b4be25322ded	8232	Šentrupert
00050000-5575-83ad-1e10-5a9990244614	1296	Šentvid pri Stični
00050000-5575-83ad-ac0d-a3bd25b0e27e	8275	Škocjan
00050000-5575-83ad-007f-4dbe2e332820	6281	Škofije
00050000-5575-83ad-667a-868bc16720f8	4220	Škofja Loka
00050000-5575-83ad-d4e9-46b7d62b72e8	3211	Škofja vas
00050000-5575-83ad-7620-3fe75f8e331c	1291	Škofljica
00050000-5575-83ad-1f96-f31c883c65e2	6274	Šmarje
00050000-5575-83ad-dddf-0aa65a665ee0	1293	Šmarje - Sap
00050000-5575-83ad-41eb-7f889da157a5	3240	Šmarje pri Jelšah
00050000-5575-83ad-8e59-c3deab210b3e	8220	Šmarješke Toplice
00050000-5575-83ad-ec69-4f5a292461be	2315	Šmartno na Pohorju
00050000-5575-83ad-98d1-05c864a755f2	3341	Šmartno ob Dreti
00050000-5575-83ad-d36b-e3de2308e407	3327	Šmartno ob Paki
00050000-5575-83ad-9638-004c9e512789	1275	Šmartno pri Litiji
00050000-5575-83ad-0e4e-d91ead6b89be	2383	Šmartno pri Slovenj Gradcu
00050000-5575-83ad-4816-d411fb0ff463	3201	Šmartno v Rožni dolini
00050000-5575-83ad-c1d5-b7e8f634eaa1	3325	Šoštanj
00050000-5575-83ad-c6ed-f3924f5297f0	6222	Štanjel
00050000-5575-83ad-490d-d6c3c76fc243	3220	Štore
00050000-5575-83ad-7f55-2077ece01c9c	3304	Tabor
00050000-5575-83ad-34f5-6307df738013	3221	Teharje
00050000-5575-83ad-effc-0666f363523c	9251	Tišina
00050000-5575-83ad-92f6-54a06c113d9a	5220	Tolmin
00050000-5575-83ad-1513-1e75e34c84fc	3326	Topolšica
00050000-5575-83ad-f544-3ba041147fd2	2371	Trbonje
00050000-5575-83ad-5374-1be871b1fc9a	1420	Trbovlje
00050000-5575-83ad-cc83-1fb7d008674e	8231	Trebelno 
00050000-5575-83ad-c7ab-18153d25d170	8210	Trebnje
00050000-5575-83ad-69a0-8eb929da0d88	5252	Trnovo pri Gorici
00050000-5575-83ad-94c1-d5622e3e5956	2254	Trnovska vas
00050000-5575-83ad-4cc0-84432f28d91f	1222	Trojane
00050000-5575-83ad-92ae-bd772a082ca0	1236	Trzin
00050000-5575-83ad-5baa-8bd8b6ae6b11	4290	Tržič
00050000-5575-83ad-d567-18261c78b367	8295	Tržišče
00050000-5575-83ad-5663-4b7f51545850	1311	Turjak
00050000-5575-83ad-cb03-6541ab71b24a	9224	Turnišče
00050000-5575-83ad-fdd0-88cd3f83e3d7	8323	Uršna sela
00050000-5575-83ad-a3cd-677e5a4d684d	1252	Vače
00050000-5575-83ad-ea51-4a71c34f9fec	3320	Velenje 
00050000-5575-83ad-7f80-1e18cc22ca66	3322	Velenje - poštni predali
00050000-5575-83ad-22ba-cef83fd62322	8212	Velika Loka
00050000-5575-83ad-c92e-af6932f93da7	2274	Velika Nedelja
00050000-5575-83ad-0c57-1495cedaf896	9225	Velika Polana
00050000-5575-83ad-b507-9754db30df65	1315	Velike Lašče
00050000-5575-83ad-5fa4-075b3801a065	8213	Veliki Gaber
00050000-5575-83ad-13bb-9cf4d7a5e623	9241	Veržej
00050000-5575-83ad-6c3a-d6f64c90b97a	1312	Videm - Dobrepolje
00050000-5575-83ad-44b7-e523c0911d97	2284	Videm pri Ptuju
00050000-5575-83ad-5e4d-1154b452b2d1	8344	Vinica
00050000-5575-83ad-b9d2-e6ef467487fc	5271	Vipava
00050000-5575-83ad-b153-6a8efdf36d6c	4212	Visoko
00050000-5575-83ad-9529-375893d0ebcf	1294	Višnja Gora
00050000-5575-83ad-66ff-56a4ddada84e	3205	Vitanje
00050000-5575-83ad-c67b-c027ff4c2836	2255	Vitomarci
00050000-5575-83ad-d631-554c21229b2d	1217	Vodice
00050000-5575-83ad-e6f2-3781d2c2a19e	3212	Vojnik\t
00050000-5575-83ad-bbc0-bac5daef6c32	5293	Volčja Draga
00050000-5575-83ad-8c61-bb5f82e739bf	2232	Voličina
00050000-5575-83ad-72e5-0982b861c2ca	3305	Vransko
00050000-5575-83ad-d8b2-734e600e1624	6217	Vremski Britof
00050000-5575-83ad-40e3-5c4f6192fb39	1360	Vrhnika
00050000-5575-83ad-b929-96ff91cd079d	2365	Vuhred
00050000-5575-83ad-9e91-fd4f685f3fea	2367	Vuzenica
00050000-5575-83ad-6ce1-d910fc96605e	8292	Zabukovje 
00050000-5575-83ad-6d8c-bf047a70217f	1410	Zagorje ob Savi
00050000-5575-83ad-ac81-23bde13633e9	1303	Zagradec
00050000-5575-83ad-dc3d-51a2fb8856ff	2283	Zavrč
00050000-5575-83ad-f372-25b613720ad5	8272	Zdole 
00050000-5575-83ad-81c8-130d5e6edbdc	4201	Zgornja Besnica
00050000-5575-83ad-4704-8f26bf5770db	2242	Zgornja Korena
00050000-5575-83ad-c686-9278ac3333a5	2201	Zgornja Kungota
00050000-5575-83ad-d171-5d67f8106459	2316	Zgornja Ložnica
00050000-5575-83ad-dc14-674f3369f973	2314	Zgornja Polskava
00050000-5575-83ad-6967-c8aebcce8524	2213	Zgornja Velka
00050000-5575-83ad-002d-9c5d5f44307c	4247	Zgornje Gorje
00050000-5575-83ad-72bb-dbc96f8dd646	4206	Zgornje Jezersko
00050000-5575-83ad-c429-7dc1fd6b761f	2285	Zgornji Leskovec
00050000-5575-83ad-1218-f4c0ba10a3e3	1432	Zidani Most
00050000-5575-83ad-9f3f-e27f6e593dad	3214	Zreče
00050000-5575-83ad-aa59-99ebd8191824	4209	Žabnica
00050000-5575-83ad-205d-83f36a02b9e8	3310	Žalec
00050000-5575-83ad-b8eb-00500d151823	4228	Železniki
00050000-5575-83ad-d318-f89c3ec866c1	2287	Žetale
00050000-5575-83ad-69c5-c7ca6d265da2	4226	Žiri
00050000-5575-83ad-5967-e24d88adb2f1	4274	Žirovnica
00050000-5575-83ad-aa0b-085b8ab81205	8360	Žužemberk
\.


--
-- TOC entry 2807 (class 0 OID 6583640)
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
-- TOC entry 2789 (class 0 OID 6583451)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6583529)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6583652)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6583772)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6583827)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-83ae-556b-11c4b538da89	00080000-5575-83ae-b746-911a1dfdd5e2	0987	A
00190000-5575-83ae-911b-d04c62d4d547	00080000-5575-83ae-02e7-d77a5f8efd2d	0989	A
\.


--
-- TOC entry 2833 (class 0 OID 6583941)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6583969)
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
-- TOC entry 2834 (class 0 OID 6583950)
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
-- TOC entry 2813 (class 0 OID 6583681)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-83ae-2537-f5c54a2fecb5	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-83ae-171b-ce12161a0697	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-83ae-48b2-cfacfc9a5760	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-83ae-f0ba-d1b23535ce2a	0004	Mali oder	t	24	Mali oder 
00220000-5575-83ae-598b-dcd63ef94633	0005	Komorni oder	t	15	Komorni oder
00220000-5575-83ae-7cdd-e021547f60c1	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-83ae-0d4c-dcf0a34c4fad	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2805 (class 0 OID 6583625)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6583615)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6583816)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6583749)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6583323)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-83ae-e80e-f73bbc1930af	00010000-5575-83ae-ef69-3cf432b358a0	2015-06-08 13:59:43	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROFcAbFoOvljxzpWiUG7bG7ihC/rV2/cC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2814 (class 0 OID 6583691)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6583361)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-83ae-458a-8be5402d29a4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-83ae-a1a7-ff62c4b797df	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-83ae-7cf7-8f25af0ee226	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-83ae-20cd-274c3239ee58	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-83ae-6a69-5c90c9b67779	planer	Planer dogodkov v koledarju	t
00020000-5575-83ae-7400-f722f6f03c7f	kadrovska	Kadrovska služba	t
00020000-5575-83ae-5bf2-c0cc8de77fee	arhivar	Ažuriranje arhivalij	t
00020000-5575-83ae-260c-ee7df95e7e39	igralec	Igralec	t
00020000-5575-83ae-c21c-6b86ad580098	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2780 (class 0 OID 6583345)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-83ae-e80e-f73bbc1930af	00020000-5575-83ae-7cf7-8f25af0ee226
00010000-5575-83ae-ef69-3cf432b358a0	00020000-5575-83ae-7cf7-8f25af0ee226
\.


--
-- TOC entry 2816 (class 0 OID 6583705)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6583646)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6583596)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6583988)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-83ad-85ce-8b4e0a61b0a5	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-83ad-e4a2-007fe1ef2fc5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-83ad-36e7-7a56f9b7c4ac	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-83ad-eba4-d3668bb16b8f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-83ad-a191-172428698ee6	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2838 (class 0 OID 6583980)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-83ad-d6e5-0e20f51675e9	00230000-5575-83ad-eba4-d3668bb16b8f	popa
00240000-5575-83ad-1774-1f271756cec2	00230000-5575-83ad-eba4-d3668bb16b8f	oseba
00240000-5575-83ad-1e29-be59a6b36bdc	00230000-5575-83ad-e4a2-007fe1ef2fc5	prostor
00240000-5575-83ad-9cf9-21d57bd87588	00230000-5575-83ad-eba4-d3668bb16b8f	besedilo
00240000-5575-83ad-53b2-87b8a2d4e90a	00230000-5575-83ad-eba4-d3668bb16b8f	uprizoritev
00240000-5575-83ad-1e42-76b59a6a2abc	00230000-5575-83ad-eba4-d3668bb16b8f	funkcija
00240000-5575-83ad-430e-4f70721c6e32	00230000-5575-83ad-eba4-d3668bb16b8f	tipfunkcije
00240000-5575-83ad-3664-b1e6d198aa66	00230000-5575-83ad-eba4-d3668bb16b8f	alternacija
00240000-5575-83ad-a459-fbf3a23cdb9a	00230000-5575-83ad-85ce-8b4e0a61b0a5	pogodba
00240000-5575-83ad-4278-fb0d2e14a229	00230000-5575-83ad-eba4-d3668bb16b8f	zaposlitev
\.


--
-- TOC entry 2837 (class 0 OID 6583975)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6583759)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6583423)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6583602)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-83ae-adc7-527601b013f0	00180000-5575-83ae-1431-396caafa7901	000c0000-5575-83ae-794e-19e31bb2ab49	00090000-5575-83ae-5a27-4047c007f3b9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-83ae-1ba6-83b346dcf658	00180000-5575-83ae-1431-396caafa7901	000c0000-5575-83ae-44db-3bac92658e40	00090000-5575-83ae-f6f3-b24cc6b8e809	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-83ae-4754-4a15fd666005	00180000-5575-83ae-1431-396caafa7901	000c0000-5575-83ae-39f8-f79d1efde306	00090000-5575-83ae-4df0-f1e3201be074	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-83ae-cb42-b85a3ab621ca	00180000-5575-83ae-1431-396caafa7901	000c0000-5575-83ae-2710-f7e1306f7987	00090000-5575-83ae-9128-b1e5c79a25f3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-83ae-758b-da26250c151e	00180000-5575-83ae-1431-396caafa7901	000c0000-5575-83ae-c8df-5132e64f3732	00090000-5575-83ae-67b8-6509c9b34be4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-83ae-4d9e-416c9a8a070d	00180000-5575-83ae-d117-818029cb9a0a	\N	00090000-5575-83ae-67b8-6509c9b34be4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2824 (class 0 OID 6583805)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-83ad-519f-56a70aca9867	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-83ad-c59d-48a183ab7a8c	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-83ad-4c20-38172306a98f	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-83ad-8dcb-b3865c9d9fea	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-83ad-90d5-15bb8f1fe8e3	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-83ad-bf8f-5a2132151302	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-83ad-e49d-021f606ec7c9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-83ad-5123-b96e1c386fa9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-83ad-7d6c-b7c6afdf6000	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-83ad-0eaf-0c076576e77d	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-83ad-37f1-999da141ab70	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-83ad-9282-422269a7794f	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-83ad-0557-35820f278b59	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-83ad-28f5-dcb415e281ca	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-83ad-3492-78f7ff2fe73c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-83ad-e4d4-e605587a981b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2835 (class 0 OID 6583958)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6583486)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6583332)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-83ae-ef69-3cf432b358a0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.1Q1gd8P1ufnr4n5Jsq7dF9nWmd7OGa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-83ae-5e9e-023b3e5e202b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-83ae-c3c0-962c60d247a1	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-83ae-9c6e-6ddd5e8f82cf	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-83ae-ba6b-a3c2de8cf21a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-83ae-7a0b-06bb4840717f	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-83ae-22e6-d2fa721d08f6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-83ae-e80e-f73bbc1930af	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2829 (class 0 OID 6583862)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-83ae-26a2-bf9c2efb1490	00160000-5575-83ae-83cb-84f3f21611c9	00150000-5575-83ad-e0db-a01153356f42	00140000-5575-83ad-ea8b-cb7ffca63b94	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-83ae-598b-dcd63ef94633
000e0000-5575-83ae-aef9-e30dfccfb305	00160000-5575-83ae-2489-8eb9ab2dfb11	00150000-5575-83ad-a219-54bc93193f4a	00140000-5575-83ad-3c9d-a1901d32d2a5	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-83ae-7cdd-e021547f60c1
\.


--
-- TOC entry 2797 (class 0 OID 6583548)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-83ae-e2cb-939c4301e6a9	000e0000-5575-83ae-aef9-e30dfccfb305	1	
00200000-5575-83ae-ac4e-fc741b1c7404	000e0000-5575-83ae-aef9-e30dfccfb305	2	
\.


--
-- TOC entry 2812 (class 0 OID 6583673)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6583742)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6583580)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6583852)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-83ad-ea8b-cb7ffca63b94	01	Drama	drama (SURS 01)
00140000-5575-83ad-a4ac-e438502417e4	02	Opera	opera (SURS 02)
00140000-5575-83ad-34c6-9ea591bf5890	03	Balet	balet (SURS 03)
00140000-5575-83ad-f7e9-b56554ce7415	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-83ad-1811-246d2743fe09	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-83ad-3c9d-a1901d32d2a5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-83ad-fc3b-e3acea605fe2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2818 (class 0 OID 6583732)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-83ad-1cce-7926d740b4a8	01	Opera	opera
00150000-5575-83ad-b267-25c4978e1797	02	Opereta	opereta
00150000-5575-83ad-3305-47551bdad51c	03	Balet	balet
00150000-5575-83ad-010a-bbf5435c3d11	04	Plesne prireditve	plesne prireditve
00150000-5575-83ad-1030-a9885a77ea4c	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-83ad-eec0-9f1b77dab437	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-83ad-8aeb-a87567d19458	07	Biografska drama	biografska drama
00150000-5575-83ad-e0db-a01153356f42	08	Komedija	komedija
00150000-5575-83ad-0b7f-710ad89c45eb	09	Črna komedija	črna komedija
00150000-5575-83ad-62ca-a920bde45fd4	10	E-igra	E-igra
00150000-5575-83ad-a219-54bc93193f4a	11	Kriminalka	kriminalka
00150000-5575-83ad-8333-b3f667c2140a	12	Musical	musical
\.


--
-- TOC entry 2370 (class 2606 OID 6583386)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6583908)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6583898)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6583804)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6583570)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 6583595)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6583512)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6583937)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6583728)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6583546)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6583589)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 6583526)
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
-- TOC entry 2462 (class 2606 OID 6583638)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6583665)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 6583484)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 6583395)
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
-- TOC entry 2377 (class 2606 OID 6583419)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6583375)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2361 (class 2606 OID 6583360)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 6583671)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6583704)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6583847)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6583448)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 6583472)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6583644)
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
-- TOC entry 2392 (class 2606 OID 6583462)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6583533)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 6583656)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6583784)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6583832)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6583948)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6583973)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 6583955)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6583688)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6583629)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6583620)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6583826)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6583756)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6583331)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6583695)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 6583349)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2363 (class 2606 OID 6583369)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 6583713)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6583651)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6583601)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 6583997)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6583985)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6583979)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6583769)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 6583428)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6583611)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6583815)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6583968)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 6583497)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6583344)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6583878)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 6583555)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 6583679)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6583747)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6583584)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6583860)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6583740)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 1259 OID 6583577)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2510 (class 1259 OID 6583770)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6583771)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2384 (class 1259 OID 6583450)
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
-- TOC entry 2475 (class 1259 OID 6583672)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2469 (class 1259 OID 6583658)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2470 (class 1259 OID 6583657)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2421 (class 1259 OID 6583556)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2497 (class 1259 OID 6583729)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 6583731)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2499 (class 1259 OID 6583730)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2409 (class 1259 OID 6583528)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2410 (class 1259 OID 6583527)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 6583849)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 6583850)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6583851)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2537 (class 1259 OID 6583883)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2538 (class 1259 OID 6583880)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2539 (class 1259 OID 6583882)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2540 (class 1259 OID 6583881)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2399 (class 1259 OID 6583499)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 6583498)
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
-- TOC entry 2375 (class 1259 OID 6583422)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 6583696)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2439 (class 1259 OID 6583590)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2365 (class 1259 OID 6583376)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2366 (class 1259 OID 6583377)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2490 (class 1259 OID 6583716)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2491 (class 1259 OID 6583715)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 6583714)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2413 (class 1259 OID 6583534)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2414 (class 1259 OID 6583536)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2415 (class 1259 OID 6583535)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2575 (class 1259 OID 6583987)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2449 (class 1259 OID 6583624)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2450 (class 1259 OID 6583622)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2451 (class 1259 OID 6583621)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2452 (class 1259 OID 6583623)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2356 (class 1259 OID 6583350)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2357 (class 1259 OID 6583351)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2478 (class 1259 OID 6583680)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2464 (class 1259 OID 6583645)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2506 (class 1259 OID 6583757)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2507 (class 1259 OID 6583758)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2558 (class 1259 OID 6583938)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2559 (class 1259 OID 6583939)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2560 (class 1259 OID 6583940)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2388 (class 1259 OID 6583464)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 6583463)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2390 (class 1259 OID 6583465)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2570 (class 1259 OID 6583974)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 6583785)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2515 (class 1259 OID 6583786)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2550 (class 1259 OID 6583912)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 6583914)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2552 (class 1259 OID 6583910)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2553 (class 1259 OID 6583913)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2554 (class 1259 OID 6583911)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2503 (class 1259 OID 6583748)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 6583633)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2456 (class 1259 OID 6583632)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2457 (class 1259 OID 6583630)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2458 (class 1259 OID 6583631)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2339 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2546 (class 1259 OID 6583900)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2547 (class 1259 OID 6583899)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2561 (class 1259 OID 6583949)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2420 (class 1259 OID 6583547)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2371 (class 1259 OID 6583397)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2372 (class 1259 OID 6583396)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2380 (class 1259 OID 6583429)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 6583430)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2444 (class 1259 OID 6583614)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2445 (class 1259 OID 6583613)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 6583612)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 6583957)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2565 (class 1259 OID 6583956)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2427 (class 1259 OID 6583579)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2428 (class 1259 OID 6583575)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2429 (class 1259 OID 6583572)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2430 (class 1259 OID 6583573)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2431 (class 1259 OID 6583571)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2432 (class 1259 OID 6583576)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2433 (class 1259 OID 6583574)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2387 (class 1259 OID 6583449)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 6583513)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2406 (class 1259 OID 6583515)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2407 (class 1259 OID 6583514)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2408 (class 1259 OID 6583516)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2463 (class 1259 OID 6583639)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 6583848)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 6583879)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2378 (class 1259 OID 6583420)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 6583421)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2500 (class 1259 OID 6583741)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 6583998)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2398 (class 1259 OID 6583485)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2578 (class 1259 OID 6583986)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2483 (class 1259 OID 6583690)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2484 (class 1259 OID 6583689)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6583909)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2395 (class 1259 OID 6583473)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 6583861)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 6583833)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 6583834)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2364 (class 1259 OID 6583370)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2434 (class 1259 OID 6583578)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2607 (class 2606 OID 6584138)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2610 (class 2606 OID 6584123)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2609 (class 2606 OID 6584128)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2605 (class 2606 OID 6584148)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2611 (class 2606 OID 6584118)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2606 (class 2606 OID 6584143)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2608 (class 2606 OID 6584133)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2641 (class 2606 OID 6584293)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2640 (class 2606 OID 6584298)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2592 (class 2606 OID 6584053)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2628 (class 2606 OID 6584233)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2626 (class 2606 OID 6584228)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2627 (class 2606 OID 6584223)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2604 (class 2606 OID 6584113)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6584263)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6584273)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2635 (class 2606 OID 6584268)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2598 (class 2606 OID 6584088)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6584083)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2624 (class 2606 OID 6584213)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6584318)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2646 (class 2606 OID 6584323)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2645 (class 2606 OID 6584328)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2648 (class 2606 OID 6584348)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2651 (class 2606 OID 6584333)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2649 (class 2606 OID 6584343)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2650 (class 2606 OID 6584338)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2596 (class 2606 OID 6584078)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6584073)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6584038)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2589 (class 2606 OID 6584033)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 6584243)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2612 (class 2606 OID 6584153)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2585 (class 2606 OID 6584013)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2584 (class 2606 OID 6584018)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2631 (class 2606 OID 6584258)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2632 (class 2606 OID 6584253)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2633 (class 2606 OID 6584248)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2602 (class 2606 OID 6584093)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2600 (class 2606 OID 6584103)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2601 (class 2606 OID 6584098)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2666 (class 2606 OID 6584423)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2616 (class 2606 OID 6584188)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2618 (class 2606 OID 6584178)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2619 (class 2606 OID 6584173)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2617 (class 2606 OID 6584183)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2583 (class 2606 OID 6584003)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2582 (class 2606 OID 6584008)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2629 (class 2606 OID 6584238)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2625 (class 2606 OID 6584218)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2639 (class 2606 OID 6584283)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2638 (class 2606 OID 6584288)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6584388)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 6584393)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2659 (class 2606 OID 6584398)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2594 (class 2606 OID 6584063)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6584058)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2593 (class 2606 OID 6584068)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2665 (class 2606 OID 6584418)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2643 (class 2606 OID 6584303)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6584308)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2656 (class 2606 OID 6584373)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2654 (class 2606 OID 6584383)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2658 (class 2606 OID 6584363)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2655 (class 2606 OID 6584378)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2657 (class 2606 OID 6584368)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2637 (class 2606 OID 6584278)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2620 (class 2606 OID 6584208)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2621 (class 2606 OID 6584203)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2623 (class 2606 OID 6584193)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2622 (class 2606 OID 6584198)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2652 (class 2606 OID 6584358)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6584353)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2662 (class 2606 OID 6584403)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6584108)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2644 (class 2606 OID 6584313)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6584028)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2587 (class 2606 OID 6584023)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2591 (class 2606 OID 6584043)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2590 (class 2606 OID 6584048)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2613 (class 2606 OID 6584168)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6584163)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6584158)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2663 (class 2606 OID 6584413)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6584408)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 13:59:43 CEST

--
-- PostgreSQL database dump complete
--

