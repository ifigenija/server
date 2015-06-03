--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-03 16:44:29 CEST

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
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6211738)
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
-- TOC entry 227 (class 1259 OID 6212255)
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
-- TOC entry 226 (class 1259 OID 6212238)
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
-- TOC entry 219 (class 1259 OID 6212147)
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
-- TOC entry 194 (class 1259 OID 6211917)
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
-- TOC entry 197 (class 1259 OID 6211951)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6211860)
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
-- TOC entry 228 (class 1259 OID 6212269)
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
-- TOC entry 213 (class 1259 OID 6212077)
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
-- TOC entry 192 (class 1259 OID 6211897)
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
-- TOC entry 196 (class 1259 OID 6211945)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6211877)
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
-- TOC entry 202 (class 1259 OID 6211994)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6212019)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6211834)
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
-- TOC entry 181 (class 1259 OID 6211747)
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
-- TOC entry 182 (class 1259 OID 6211758)
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
-- TOC entry 177 (class 1259 OID 6211712)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6211731)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6212026)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6212057)
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
-- TOC entry 223 (class 1259 OID 6212191)
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
-- TOC entry 184 (class 1259 OID 6211791)
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
-- TOC entry 186 (class 1259 OID 6211826)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6212000)
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
-- TOC entry 185 (class 1259 OID 6211811)
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
-- TOC entry 191 (class 1259 OID 6211889)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6212012)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6212132)
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
-- TOC entry 222 (class 1259 OID 6212183)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6212295)
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
-- TOC entry 232 (class 1259 OID 6212323)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6212357)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6212304)
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
-- TOC entry 236 (class 1259 OID 6212353)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6212041)
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
-- TOC entry 201 (class 1259 OID 6211985)
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
-- TOC entry 200 (class 1259 OID 6211975)
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
-- TOC entry 221 (class 1259 OID 6212172)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6212109)
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
-- TOC entry 174 (class 1259 OID 6211683)
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
-- TOC entry 173 (class 1259 OID 6211681)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6212051)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6211721)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6211705)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6212065)
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
-- TOC entry 204 (class 1259 OID 6212006)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6211956)
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
-- TOC entry 235 (class 1259 OID 6212342)
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
-- TOC entry 234 (class 1259 OID 6212334)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6212329)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6212119)
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
-- TOC entry 183 (class 1259 OID 6211783)
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
-- TOC entry 199 (class 1259 OID 6211962)
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
-- TOC entry 220 (class 1259 OID 6212161)
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
-- TOC entry 231 (class 1259 OID 6212312)
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
-- TOC entry 237 (class 1259 OID 6212355)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6211846)
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
-- TOC entry 175 (class 1259 OID 6211692)
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
-- TOC entry 225 (class 1259 OID 6212217)
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
-- TOC entry 193 (class 1259 OID 6211908)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6212033)
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
-- TOC entry 215 (class 1259 OID 6212102)
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
-- TOC entry 195 (class 1259 OID 6211940)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6212207)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6212092)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6211686)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2780 (class 0 OID 6211738)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6212255)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556f-12cc-5076-ff0f10a7e18e	000d0000-556f-12cc-935a-337a2a8589af	\N	00090000-556f-12cc-480c-e2bdd8bee6d6	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556f-12cc-cbb9-11e3a3b88a98	000d0000-556f-12cc-1bee-3dc70e9e6681	\N	00090000-556f-12cc-cb98-03da559c2139	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556f-12cc-f3d9-c181209c7d5d	000d0000-556f-12cc-9ee7-572fb1cf6c26	\N	00090000-556f-12cc-47dc-0d5558e97bf2	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556f-12cc-194d-b1b2fc9c8770	000d0000-556f-12cc-90ba-bf2bdb5c8959	\N	00090000-556f-12cc-abd2-047803ff2620	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556f-12cc-d4d8-6b9ff2e79f32	000d0000-556f-12cc-5591-8388b1d68f27	\N	00090000-556f-12cc-8849-516e9a0544f8	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2826 (class 0 OID 6212238)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6212147)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556f-12cc-aedc-426846b13a46	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556f-12cc-bd63-deb05cceb30c	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556f-12cc-5ed6-68975eb9ac16	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2794 (class 0 OID 6211917)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556f-12cc-01b9-7a4ab8c12237	\N	\N	00200000-556f-12cc-7287-0dab0f3f2ff0	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-556f-12cc-b1fe-321fb77e91c6	\N	\N	00200000-556f-12cc-646d-85b9d5bc0919	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556f-12cc-8c42-3daaac12b513	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-556f-12cc-dc21-f458748bae47	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-556f-12cc-c4d1-fdb7adb2c17b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2797 (class 0 OID 6211951)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6211860)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556f-12cb-f344-daefb9954e68	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556f-12cb-b1ba-cb9dfda23679	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556f-12cb-dd8c-552104824a60	AL	ALB	008	Albania 	Albanija	\N
00040000-556f-12cb-0348-6efdeef165ad	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556f-12cb-8ea4-e1720537e9f2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556f-12cb-f44d-d0d043576734	AD	AND	020	Andorra 	Andora	\N
00040000-556f-12cb-550e-d63c2e779e2c	AO	AGO	024	Angola 	Angola	\N
00040000-556f-12cb-39df-4960a93394d3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556f-12cb-05c4-fdb3481819da	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556f-12cb-fd09-83d9a1b159c1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556f-12cb-93d3-398ce1cb537b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556f-12cb-507c-cf7d34d67ebc	AM	ARM	051	Armenia 	Armenija	\N
00040000-556f-12cb-74fb-0de9182a83f9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556f-12cb-ed62-2fd6baa0e57d	AU	AUS	036	Australia 	Avstralija	\N
00040000-556f-12cb-ec79-cd8b41c04ad3	AT	AUT	040	Austria 	Avstrija	\N
00040000-556f-12cb-19e8-afcb75fee3c9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556f-12cb-cabc-405e0943c5dd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556f-12cb-743c-b58693ced64e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556f-12cb-fcf4-77f3cc7adced	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556f-12cb-6588-ef10184f01b0	BB	BRB	052	Barbados 	Barbados	\N
00040000-556f-12cb-e450-c74580a84445	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556f-12cb-468e-6d1b1a685dcf	BE	BEL	056	Belgium 	Belgija	\N
00040000-556f-12cb-07dd-44eef1ee604f	BZ	BLZ	084	Belize 	Belize	\N
00040000-556f-12cb-2566-df2b32cb3482	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556f-12cb-b120-3365cec344b5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556f-12cb-d659-42aee4e7433a	BT	BTN	064	Bhutan 	Butan	\N
00040000-556f-12cb-0e39-68af37448b00	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556f-12cb-4850-5527afa8eb5c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556f-12cb-c058-c81f609d22e8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556f-12cb-8a35-6a705dfc8412	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556f-12cb-e098-ae4789442edd	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556f-12cb-1f63-2e478b8f236f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556f-12cb-0aa0-ee3eedb8b947	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556f-12cb-09a4-3f8eec4a87b1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556f-12cb-b4aa-516137787d96	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556f-12cb-c492-e174eeda564a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556f-12cb-5730-b0439d0abeda	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556f-12cb-948d-d3e4ed71d91e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556f-12cb-09a7-8b019ff9c289	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556f-12cb-0180-29423d8240a1	CA	CAN	124	Canada 	Kanada	\N
00040000-556f-12cb-37f8-4c891505cb8f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556f-12cb-2c4d-e4f8903c77b4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556f-12cb-2b46-56198f369a1d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556f-12cb-46d1-0dc60fb6e775	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556f-12cb-4919-b62ac97ad57f	CL	CHL	152	Chile 	Čile	\N
00040000-556f-12cb-0e64-44164a45caba	CN	CHN	156	China 	Kitajska	\N
00040000-556f-12cb-bf39-a5921714cd62	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556f-12cb-a654-9b40fb2abea7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556f-12cb-d85f-c48562ab225a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556f-12cb-9a6f-4616c12ff77a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556f-12cb-2688-09933a4be0d3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556f-12cb-9cac-cbdb939681d6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556f-12cb-dfab-98064a77714e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556f-12cb-9580-4860b908edb3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556f-12cb-fc6b-42d2ac2c7593	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556f-12cb-b563-b3ca2688ed55	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556f-12cb-1dcb-ca18ef716d11	CU	CUB	192	Cuba 	Kuba	\N
00040000-556f-12cb-696e-d9bb681aea67	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556f-12cb-cf25-0749176a0c40	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556f-12cb-854d-6455df52e5d1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556f-12cb-4542-d2c0b1794eee	DK	DNK	208	Denmark 	Danska	\N
00040000-556f-12cb-3e64-51ba65c2cd93	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556f-12cb-c47c-989bd26e7e0b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556f-12cb-8854-3ccde047c80d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556f-12cb-89ea-33e809a3cbe3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556f-12cb-4de7-ba1fa72a9b2a	EG	EGY	818	Egypt 	Egipt	\N
00040000-556f-12cb-3998-c5822245fd04	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556f-12cb-a5fc-535502eeaff4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556f-12cb-97af-aa36aa852f55	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556f-12cb-b532-881e6a88cf23	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556f-12cb-4797-b2eae90e0f58	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556f-12cb-b343-361248b1cb6f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556f-12cb-7104-44e9487331b7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556f-12cb-ca7f-1ba7273d0523	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556f-12cb-677b-5f29ca4b0014	FI	FIN	246	Finland 	Finska	\N
00040000-556f-12cb-a797-ab00f9b5ec80	FR	FRA	250	France 	Francija	\N
00040000-556f-12cb-a4b1-079d5d21b3da	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556f-12cb-92bc-6969dd5d08a1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556f-12cb-7bf0-f97e4e599c30	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556f-12cb-9bd8-5593f06854b0	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556f-12cb-ecf5-13fffb2d2d27	GA	GAB	266	Gabon 	Gabon	\N
00040000-556f-12cb-c4bf-308619862adb	GM	GMB	270	Gambia 	Gambija	\N
00040000-556f-12cb-4181-2230569765d6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556f-12cb-dfb6-01557ea17a4a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556f-12cb-5f96-a495e02229de	GH	GHA	288	Ghana 	Gana	\N
00040000-556f-12cb-f4cd-3e69c6754dcc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556f-12cb-6d8a-9a89906e7512	GR	GRC	300	Greece 	Grčija	\N
00040000-556f-12cb-33ba-ad7fce4fc13e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556f-12cb-c2a5-ef702ad2fb76	GD	GRD	308	Grenada 	Grenada	\N
00040000-556f-12cb-bb2c-8f9d72c5d3aa	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556f-12cb-8ae2-8093d9e95c76	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556f-12cb-2c8e-26db0217b9af	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556f-12cb-3672-4dd1ede44c87	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556f-12cb-75d1-4281e113edd6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556f-12cb-7626-cbccd02e0f46	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556f-12cb-9325-ce11210aa1a4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556f-12cb-db5b-a9d290870e0e	HT	HTI	332	Haiti 	Haiti	\N
00040000-556f-12cb-b561-4679deca9f3f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556f-12cb-be95-cc22e5fedacf	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556f-12cb-a03c-d79b718be22d	HN	HND	340	Honduras 	Honduras	\N
00040000-556f-12cb-5c5f-95b39267db9c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556f-12cb-d293-5e6fa2310e75	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556f-12cb-2342-d27c2c6efe79	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556f-12cb-0bb1-a36caf4c33a1	IN	IND	356	India 	Indija	\N
00040000-556f-12cb-5364-05c6bdd3c8cd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556f-12cb-415e-13e88392b5d5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556f-12cb-e99c-9aad90a08057	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556f-12cb-914b-0a0464a14cce	IE	IRL	372	Ireland 	Irska	\N
00040000-556f-12cb-fac2-65160b2a2747	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556f-12cb-3730-14ade91fec85	IL	ISR	376	Israel 	Izrael	\N
00040000-556f-12cb-a1bb-4f152b990e5f	IT	ITA	380	Italy 	Italija	\N
00040000-556f-12cb-7937-75150a1caff6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556f-12cb-76ba-84f848c46695	JP	JPN	392	Japan 	Japonska	\N
00040000-556f-12cb-b540-901271b7c408	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556f-12cb-2463-5f7352328229	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556f-12cb-e9bb-199c5d909a23	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556f-12cb-ea6b-577bcf9c8b1e	KE	KEN	404	Kenya 	Kenija	\N
00040000-556f-12cb-61f2-8fba94a9e8cf	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556f-12cb-3068-7f8c67014730	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556f-12cb-13ac-ff8c8aea3be4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556f-12cb-3f22-32c0be5cba9d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556f-12cb-199b-b414684092df	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556f-12cb-1f57-9243c87c2cae	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556f-12cb-f9a2-2c2e160df63d	LV	LVA	428	Latvia 	Latvija	\N
00040000-556f-12cb-a963-2247095765b4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556f-12cb-c4a7-5262bb3e57ab	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556f-12cb-3cc1-1724ae4d29bb	LR	LBR	430	Liberia 	Liberija	\N
00040000-556f-12cb-533f-7271f6d67680	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556f-12cb-f181-878e965b04c3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556f-12cb-a230-ae62da75fb76	LT	LTU	440	Lithuania 	Litva	\N
00040000-556f-12cb-a66b-1149efbcd0fc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556f-12cb-6396-08841058034a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556f-12cb-ce7c-c36d5a0a4708	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556f-12cb-8900-4a212b05175f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556f-12cb-9fbf-e9cc69106bd2	MW	MWI	454	Malawi 	Malavi	\N
00040000-556f-12cb-7633-36f050d11418	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556f-12cb-3598-4e0337da9c61	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556f-12cb-420c-b0cf8bff8db4	ML	MLI	466	Mali 	Mali	\N
00040000-556f-12cb-ca1f-9344571d4173	MT	MLT	470	Malta 	Malta	\N
00040000-556f-12cb-23dc-0b148bdfabd2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556f-12cb-6160-9ab4879a0a66	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556f-12cb-df85-4fdc1648675a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556f-12cb-3c1f-cc8eeeb35a15	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556f-12cb-49e6-8f664b2292fc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556f-12cb-201e-f4b1675b3330	MX	MEX	484	Mexico 	Mehika	\N
00040000-556f-12cb-8024-f6070cf5564d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556f-12cb-8758-2681d2142dae	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556f-12cb-bff9-decb2f29ebcf	MC	MCO	492	Monaco 	Monako	\N
00040000-556f-12cb-27a8-20c18ac7e8fb	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556f-12cb-4323-b20be47d133e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556f-12cb-1f78-5fea5e5d913e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556f-12cb-c709-403b21d6f62b	MA	MAR	504	Morocco 	Maroko	\N
00040000-556f-12cb-b0c9-f2415a729cc9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556f-12cb-b431-a252f7d8a4f3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556f-12cb-9708-a2112610ecb9	NA	NAM	516	Namibia 	Namibija	\N
00040000-556f-12cb-23f7-9f3cb3edc5f7	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556f-12cb-4877-4b700785ce2d	NP	NPL	524	Nepal 	Nepal	\N
00040000-556f-12cb-5864-fe934e34b24d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556f-12cb-50ad-652329dc2111	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556f-12cb-cf04-4292a7445889	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556f-12cb-077d-df4a04d1af4d	NE	NER	562	Niger 	Niger 	\N
00040000-556f-12cb-40da-7b49db3bd1a1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556f-12cb-30e2-ef7d5a8eaaae	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556f-12cb-a6ac-f931e9266cb6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556f-12cb-d20e-1190f1869603	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556f-12cb-e443-0971291f74da	NO	NOR	578	Norway 	Norveška	\N
00040000-556f-12cb-7f6d-d3352a59a7db	OM	OMN	512	Oman 	Oman	\N
00040000-556f-12cb-4df3-e43eda933280	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556f-12cb-943c-8e5e256de9d2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556f-12cb-5ec7-e4fbbe8ac351	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556f-12cb-9046-082bdabe3187	PA	PAN	591	Panama 	Panama	\N
00040000-556f-12cb-764f-58f408dfe7fe	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556f-12cb-4e09-9dca2ffee77e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556f-12cb-1ae5-d0479d19e2d5	PE	PER	604	Peru 	Peru	\N
00040000-556f-12cb-1ba4-8bd277f4c877	PH	PHL	608	Philippines 	Filipini	\N
00040000-556f-12cb-5f6a-05957ab69a27	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556f-12cb-e5b5-1a6e8e37a756	PL	POL	616	Poland 	Poljska	\N
00040000-556f-12cb-2f19-65ed2b8397ea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556f-12cb-559b-3436520d9d98	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556f-12cb-b438-23a491f46633	QA	QAT	634	Qatar 	Katar	\N
00040000-556f-12cb-bde9-fbd05ee0fbd5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556f-12cb-7d9a-7e98b7b18a14	RO	ROU	642	Romania 	Romunija	\N
00040000-556f-12cb-1c1a-189752c093cd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556f-12cb-ca00-cdbe3f8f8879	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556f-12cb-1b4a-adc152310f61	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556f-12cb-a341-284c110b9ea4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556f-12cb-3165-84abc6424a75	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556f-12cb-b614-f4712b7b2fe7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556f-12cb-894a-67b44b3be06f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556f-12cb-d3b6-5db2e136bc2b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556f-12cb-0270-6f22061b8662	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556f-12cb-7296-b8a01c5ff2d7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556f-12cb-30a1-38eb941c7c65	SM	SMR	674	San Marino 	San Marino	\N
00040000-556f-12cb-fbb9-f99d71368b2b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556f-12cb-5852-6cab1cdb9832	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556f-12cb-ab54-7aeb4eaf1882	SN	SEN	686	Senegal 	Senegal	\N
00040000-556f-12cb-7159-1cc8e0aec19b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556f-12cb-b0c5-d9dc8441c479	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556f-12cb-7af3-6f0c01aa8fd7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556f-12cb-1132-5f52fa5997e7	SG	SGP	702	Singapore 	Singapur	\N
00040000-556f-12cb-4c17-708537c6bc57	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556f-12cb-6ab2-66de2b5c45ba	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556f-12cb-5db6-1a48d027691d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556f-12cb-8b5b-7f1d5f59339d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556f-12cb-1673-140bcd63a966	SO	SOM	706	Somalia 	Somalija	\N
00040000-556f-12cb-9c1a-6a48f0e758ca	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556f-12cb-c640-de2b59ecc442	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556f-12cb-9a7f-2dc9398fd86d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556f-12cb-1cd6-1f5debfcebc4	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556f-12cb-7140-40aecf72995b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556f-12cb-19d2-753da9da3527	SD	SDN	729	Sudan 	Sudan	\N
00040000-556f-12cb-0465-4877e6fdc904	SR	SUR	740	Suriname 	Surinam	\N
00040000-556f-12cb-b666-a77a5148696c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556f-12cb-4e34-884dee02602c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556f-12cb-39dc-8de0bf24873a	SE	SWE	752	Sweden 	Švedska	\N
00040000-556f-12cb-ddb7-b03c678cfc6f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556f-12cb-20d3-e2c1732946b0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556f-12cb-bf5a-de056ea8ddb3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556f-12cb-7714-735b2b77ecc8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556f-12cb-0b2c-7cdca3d51a37	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556f-12cb-d7d3-3f27353068ab	TH	THA	764	Thailand 	Tajska	\N
00040000-556f-12cb-c71f-ec23d9a7574d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556f-12cb-6029-2c975df147f3	TG	TGO	768	Togo 	Togo	\N
00040000-556f-12cb-6117-004961bb4fcf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556f-12cb-0bf7-d36de55f42a1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556f-12cb-48fc-318680f6e21c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556f-12cb-64cd-81bb6650b016	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556f-12cb-e6a2-b7e56dcefb5b	TR	TUR	792	Turkey 	Turčija	\N
00040000-556f-12cb-3438-d6b0401d5fc8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556f-12cb-1176-2dcb2e9dc16e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556f-12cb-1b17-0bb84b461931	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556f-12cb-d9cc-49c4c41151ee	UG	UGA	800	Uganda 	Uganda	\N
00040000-556f-12cb-538f-10d32f19d405	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556f-12cb-544a-72a0c9e6f589	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556f-12cb-e204-1c1f4854f2c4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556f-12cb-8688-4d4e138ef034	US	USA	840	United States 	Združene države Amerike	\N
00040000-556f-12cb-8878-15a875103aa0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556f-12cb-ab85-2f9b167d9a5b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556f-12cb-23a5-e957ba8fe813	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556f-12cb-67ca-121dcfb93e4f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556f-12cb-48df-cfe3abb64660	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556f-12cb-1462-09eb4aa76034	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556f-12cb-3849-9ae3cbda4de9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556f-12cb-f5a9-423608fd22d6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556f-12cb-db6e-7059898174b7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556f-12cb-8123-0c626e1d626d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556f-12cb-4e65-6a3d3135eadf	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556f-12cb-daaf-ab6a2411e0b0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556f-12cb-fef3-81985b4130b6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2828 (class 0 OID 6212269)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6212077)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-556f-12cc-f697-0400cb739892	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556f-12cb-b1f4-188d028fddef
000d0000-556f-12cc-935a-337a2a8589af	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556f-12cb-b1f4-188d028fddef
000d0000-556f-12cc-1bee-3dc70e9e6681	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556f-12cb-688d-373a0fd4bd0e
000d0000-556f-12cc-9ee7-572fb1cf6c26	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556f-12cb-2e52-dc75e7946c8a
000d0000-556f-12cc-90ba-bf2bdb5c8959	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556f-12cb-2e52-dc75e7946c8a
000d0000-556f-12cc-5591-8388b1d68f27	000e0000-556f-12cc-79f2-accd9cfeb7da	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556f-12cb-2e52-dc75e7946c8a
\.


--
-- TOC entry 2792 (class 0 OID 6211897)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6211945)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6211877)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6211994)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6212019)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6211834)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556f-12cc-793d-49275bf8cc94	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556f-12cc-ce22-52d86dcc35db	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556f-12cc-d968-80a45058fd9c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556f-12cc-a835-68779e31d967	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556f-12cc-cafe-31943ea9fd07	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556f-12cc-efe2-3ffc5d6944d8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556f-12cc-feed-011360fe27f8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556f-12cc-7b2f-e47f2a2af68d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556f-12cc-e6df-5005a725ea85	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556f-12cc-3671-7b5e2a5e4b20	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556f-12cc-d225-171219f70219	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556f-12cc-aa81-d2cf32035d63	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556f-12cc-24c9-0a0cc208cbcb	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556f-12cc-caa5-2d3ced7792db	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556f-12cc-f522-6714a9a5654e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556f-12cc-bc9e-99a101ce0067	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2781 (class 0 OID 6211747)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556f-12cc-7dc0-3922c2dab74e	00000000-556f-12cc-cafe-31943ea9fd07	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556f-12cc-993f-d07ffb14ca9d	00000000-556f-12cc-cafe-31943ea9fd07	00010000-556f-12cc-ab99-18dfffd3c51d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556f-12cc-5ddf-c8ad648e4924	00000000-556f-12cc-efe2-3ffc5d6944d8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2782 (class 0 OID 6211758)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556f-12cc-a633-50ffef66f6cc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556f-12cc-abd2-047803ff2620	00010000-556f-12cc-e70d-5ea0d5a21c78	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556f-12cc-47dc-0d5558e97bf2	00010000-556f-12cc-f8bf-9c49b20de1ac	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556f-12cc-9537-c4ac2a3ab256	00010000-556f-12cc-3875-0c2d314f92aa	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556f-12cc-61e5-eb009b1b42bf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556f-12cc-a35e-93fdff6dd6d7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556f-12cc-edf0-2ff7131d19b4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556f-12cc-2dac-7175f2149b9b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556f-12cc-480c-e2bdd8bee6d6	00010000-556f-12cc-bd81-3dda6dffc07b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556f-12cc-cb98-03da559c2139	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556f-12cc-05c5-a3145d525a50	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556f-12cc-8849-516e9a0544f8	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556f-12cc-72d9-96121cc972cc	00010000-556f-12cc-a817-c1d07fd88c17	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2772 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2777 (class 0 OID 6211712)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556f-12cb-f3cf-693b3fd664b8	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556f-12cb-f419-0a81ca27ee12	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556f-12cb-5a15-59fbe0c3edf7	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556f-12cb-7d6a-3941fc9f1b53	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-556f-12cb-d6e3-704f16a0e238	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556f-12cb-20c2-d799f0a70d59	Abonma-read	Abonma - branje	f
00030000-556f-12cb-293a-f5f1ab4934d8	Abonma-write	Abonma - spreminjanje	f
00030000-556f-12cb-3391-f7571e1a7911	Alternacija-read	Alternacija - branje	f
00030000-556f-12cb-d813-a175e8aa5192	Alternacija-write	Alternacija - spreminjanje	f
00030000-556f-12cb-9b77-12718913221a	Arhivalija-read	Arhivalija - branje	f
00030000-556f-12cb-356d-92c987d8eaf6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556f-12cb-5120-43df4b3578cf	Besedilo-read	Besedilo - branje	f
00030000-556f-12cb-7f58-f8e92b0d7a6e	Besedilo-write	Besedilo - spreminjanje	f
00030000-556f-12cb-0875-4bc4deabab22	DogodekIzven-read	DogodekIzven - branje	f
00030000-556f-12cb-f3dd-ffb78cf75e77	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556f-12cb-a816-c6e00884d37d	Dogodek-read	Dogodek - branje	f
00030000-556f-12cb-2f60-3112656bd4e4	Dogodek-write	Dogodek - spreminjanje	f
00030000-556f-12cb-3d6b-7f7a24420d1e	Drzava-read	Drzava - branje	f
00030000-556f-12cb-80c3-00439c6c3699	Drzava-write	Drzava - spreminjanje	f
00030000-556f-12cb-0c96-b63d02ea25cc	Funkcija-read	Funkcija - branje	f
00030000-556f-12cb-bd30-07adfb15ed23	Funkcija-write	Funkcija - spreminjanje	f
00030000-556f-12cb-c17e-182381bd3325	Gostovanje-read	Gostovanje - branje	f
00030000-556f-12cb-a3b9-aca00a981fce	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556f-12cb-ac3b-62cb6984aa75	Gostujoca-read	Gostujoca - branje	f
00030000-556f-12cb-6bae-4fdc7a36f353	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556f-12cb-2053-537bc400f54a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556f-12cb-1d0f-226335f41bfe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556f-12cb-3dff-d054745b641c	Kupec-read	Kupec - branje	f
00030000-556f-12cb-5259-cd210b319d4b	Kupec-write	Kupec - spreminjanje	f
00030000-556f-12cb-acdb-19d3fe569a57	NacinPlacina-read	NacinPlacina - branje	f
00030000-556f-12cb-4b88-8888ffd9ce5f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556f-12cb-eef8-595cf66d8c70	Option-read	Option - branje	f
00030000-556f-12cb-8fff-4cd71e2532fa	Option-write	Option - spreminjanje	f
00030000-556f-12cb-7682-31ee6ec858db	OptionValue-read	OptionValue - branje	f
00030000-556f-12cb-c0b8-f4363d5244b5	OptionValue-write	OptionValue - spreminjanje	f
00030000-556f-12cb-14cf-6ce494420209	Oseba-read	Oseba - branje	f
00030000-556f-12cb-5ba5-3e46fc0904a4	Oseba-write	Oseba - spreminjanje	f
00030000-556f-12cb-cffc-d717907add80	Permission-read	Permission - branje	f
00030000-556f-12cb-7913-e2a2e4539068	Permission-write	Permission - spreminjanje	f
00030000-556f-12cb-81b3-d4c069d1f698	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556f-12cb-9c81-fe34543c8ea3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556f-12cb-ef04-94cbaa77aa68	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556f-12cb-42f0-ec3ef4b66233	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556f-12cb-3b2a-aede8ec60793	Pogodba-read	Pogodba - branje	f
00030000-556f-12cb-cc21-820277972f28	Pogodba-write	Pogodba - spreminjanje	f
00030000-556f-12cb-bee9-5287597e1579	Popa-read	Popa - branje	f
00030000-556f-12cb-7f49-47c14094e542	Popa-write	Popa - spreminjanje	f
00030000-556f-12cb-48d5-4f9ee204082d	Posta-read	Posta - branje	f
00030000-556f-12cb-4637-7ec37a97c38e	Posta-write	Posta - spreminjanje	f
00030000-556f-12cb-633c-c86dc20e5c59	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556f-12cb-9979-30a4d9091cbd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556f-12cb-e8ab-819d2d97c860	PostniNaslov-read	PostniNaslov - branje	f
00030000-556f-12cb-d25d-7111603750f2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556f-12cb-935f-3c34cb52c87a	Predstava-read	Predstava - branje	f
00030000-556f-12cb-0588-aeba4fa0fb34	Predstava-write	Predstava - spreminjanje	f
00030000-556f-12cb-5d37-2e4cb7b250a6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556f-12cb-3800-f164a3b91d47	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556f-12cb-07c8-987c476ae8c7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556f-12cb-e60b-fd50e8968a0f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556f-12cb-9806-b9dc31615819	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556f-12cb-f397-ce279b2b7f40	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556f-12cb-5f33-e799990936a5	Prostor-read	Prostor - branje	f
00030000-556f-12cb-1f9d-8b34521133fc	Prostor-write	Prostor - spreminjanje	f
00030000-556f-12cb-2653-ff34dad46067	Racun-read	Racun - branje	f
00030000-556f-12cb-198e-bd808f111306	Racun-write	Racun - spreminjanje	f
00030000-556f-12cb-5324-4527695ec2c5	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556f-12cb-1357-0e1bab5b2cfb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556f-12cb-d726-4ecacbabc50e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556f-12cb-9df9-07cfcf657bd6	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556f-12cb-2dbf-25bdf637101c	Rekvizit-read	Rekvizit - branje	f
00030000-556f-12cb-701f-8b6190a6affe	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556f-12cb-e45f-c16d0055a1b7	Revizija-read	Revizija - branje	f
00030000-556f-12cb-e8f5-4887bcd1ca8f	Revizija-write	Revizija - spreminjanje	f
00030000-556f-12cb-83b5-67b2b5eca54d	Rezervacija-read	Rezervacija - branje	f
00030000-556f-12cb-a670-e23ed9ea1a6b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556f-12cb-c8d7-c87ebf8a584b	Role-read	Role - branje	f
00030000-556f-12cb-0149-d7ec825fc4db	Role-write	Role - spreminjanje	f
00030000-556f-12cb-b54b-c091585df4e3	SedezniRed-read	SedezniRed - branje	f
00030000-556f-12cb-85c1-745bc501cac8	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556f-12cb-5cce-77fbe69e8c17	Sedez-read	Sedez - branje	f
00030000-556f-12cb-0dfb-89653a190596	Sedez-write	Sedez - spreminjanje	f
00030000-556f-12cb-e560-cdaf5dc44ad2	Sezona-read	Sezona - branje	f
00030000-556f-12cb-f25d-41408f588fce	Sezona-write	Sezona - spreminjanje	f
00030000-556f-12cb-a064-1fe870d62d4d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556f-12cb-f90c-a36b52530bae	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556f-12cb-b8dc-c3ce3462cbec	Stevilcenje-read	Stevilcenje - branje	f
00030000-556f-12cb-c6c0-e41f58e775f1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556f-12cb-2320-bfede7375364	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556f-12cb-5580-069156ab57dc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556f-12cb-7e31-0c9652c6a8b4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556f-12cb-b22f-fe3137418330	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556f-12cb-1bd5-2f376a76739d	Telefonska-read	Telefonska - branje	f
00030000-556f-12cb-6f64-d126485214ae	Telefonska-write	Telefonska - spreminjanje	f
00030000-556f-12cb-39a0-fcd758e61041	TerminStoritve-read	TerminStoritve - branje	f
00030000-556f-12cb-1b3b-d2f42bdde4df	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556f-12cb-2a35-439582d4bc78	TipFunkcije-read	TipFunkcije - branje	f
00030000-556f-12cb-cbd9-d041021e9538	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556f-12cb-39c5-cdaf4725a151	Trr-read	Trr - branje	f
00030000-556f-12cb-030f-e0634831aa06	Trr-write	Trr - spreminjanje	f
00030000-556f-12cb-9ad1-2fa2f0636415	Uprizoritev-read	Uprizoritev - branje	f
00030000-556f-12cb-767b-eb6e6bb9604c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556f-12cb-2074-ab01245d11fb	User-read	User - branje	f
00030000-556f-12cb-34ae-150119ef7400	User-write	User - spreminjanje	f
00030000-556f-12cb-efe7-65caac662267	Vaja-read	Vaja - branje	f
00030000-556f-12cb-6523-a16a1f226e05	Vaja-write	Vaja - spreminjanje	f
00030000-556f-12cb-4bb9-da1b170f651c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556f-12cb-4fcc-8a1bfdeaab5c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556f-12cb-b933-2a2a724ad2d7	Zaposlitev-read	Zaposlitev - branje	f
00030000-556f-12cb-b089-09acbb9fccdb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556f-12cb-3fc3-31b229a856ba	Zasedenost-read	Zasedenost - branje	f
00030000-556f-12cb-d070-50d270b7b3a0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556f-12cb-7502-757bfa621032	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556f-12cb-3413-70aec45dd5d4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556f-12cb-29f9-ea1e19b6a3cb	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556f-12cb-4877-89c9175b196b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2779 (class 0 OID 6211731)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556f-12cb-7ea5-f073e7af273f	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-20c2-d799f0a70d59
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-293a-f5f1ab4934d8
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-3391-f7571e1a7911
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-d813-a175e8aa5192
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-9b77-12718913221a
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-a816-c6e00884d37d
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-7d6a-3941fc9f1b53
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-2f60-3112656bd4e4
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-80c3-00439c6c3699
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-0c96-b63d02ea25cc
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-bd30-07adfb15ed23
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-c17e-182381bd3325
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-a3b9-aca00a981fce
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-ac3b-62cb6984aa75
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-6bae-4fdc7a36f353
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-2053-537bc400f54a
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-1d0f-226335f41bfe
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-eef8-595cf66d8c70
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-7682-31ee6ec858db
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-14cf-6ce494420209
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-5ba5-3e46fc0904a4
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-bee9-5287597e1579
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-7f49-47c14094e542
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-48d5-4f9ee204082d
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-4637-7ec37a97c38e
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-e8ab-819d2d97c860
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-d25d-7111603750f2
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-935f-3c34cb52c87a
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-0588-aeba4fa0fb34
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-9806-b9dc31615819
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-f397-ce279b2b7f40
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-5f33-e799990936a5
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-1f9d-8b34521133fc
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-d726-4ecacbabc50e
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-9df9-07cfcf657bd6
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-2dbf-25bdf637101c
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-701f-8b6190a6affe
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-e560-cdaf5dc44ad2
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-f25d-41408f588fce
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-2a35-439582d4bc78
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-9ad1-2fa2f0636415
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-767b-eb6e6bb9604c
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-efe7-65caac662267
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-6523-a16a1f226e05
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-3fc3-31b229a856ba
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-d070-50d270b7b3a0
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-7502-757bfa621032
00020000-556f-12cb-e29f-1f4aa47be962	00030000-556f-12cb-29f9-ea1e19b6a3cb
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-20c2-d799f0a70d59
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-9b77-12718913221a
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-a816-c6e00884d37d
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-c17e-182381bd3325
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-ac3b-62cb6984aa75
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-2053-537bc400f54a
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-1d0f-226335f41bfe
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-eef8-595cf66d8c70
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-7682-31ee6ec858db
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-14cf-6ce494420209
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-5ba5-3e46fc0904a4
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-bee9-5287597e1579
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-48d5-4f9ee204082d
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-e8ab-819d2d97c860
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-d25d-7111603750f2
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-935f-3c34cb52c87a
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-5f33-e799990936a5
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-d726-4ecacbabc50e
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-2dbf-25bdf637101c
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-e560-cdaf5dc44ad2
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-1bd5-2f376a76739d
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-6f64-d126485214ae
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-39c5-cdaf4725a151
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-030f-e0634831aa06
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-b933-2a2a724ad2d7
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-b089-09acbb9fccdb
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-7502-757bfa621032
00020000-556f-12cb-687a-c4acf67ce27e	00030000-556f-12cb-29f9-ea1e19b6a3cb
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-20c2-d799f0a70d59
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-3391-f7571e1a7911
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-9b77-12718913221a
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-356d-92c987d8eaf6
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-5120-43df4b3578cf
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-0875-4bc4deabab22
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-a816-c6e00884d37d
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-0c96-b63d02ea25cc
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-c17e-182381bd3325
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-ac3b-62cb6984aa75
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-2053-537bc400f54a
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-eef8-595cf66d8c70
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-7682-31ee6ec858db
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-14cf-6ce494420209
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-bee9-5287597e1579
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-48d5-4f9ee204082d
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-935f-3c34cb52c87a
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-9806-b9dc31615819
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-5f33-e799990936a5
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-d726-4ecacbabc50e
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-2dbf-25bdf637101c
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-e560-cdaf5dc44ad2
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-2a35-439582d4bc78
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-efe7-65caac662267
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-3fc3-31b229a856ba
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-7502-757bfa621032
00020000-556f-12cb-cfdf-f2ce99366dd1	00030000-556f-12cb-29f9-ea1e19b6a3cb
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-20c2-d799f0a70d59
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-293a-f5f1ab4934d8
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-d813-a175e8aa5192
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-9b77-12718913221a
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-a816-c6e00884d37d
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-c17e-182381bd3325
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-ac3b-62cb6984aa75
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-eef8-595cf66d8c70
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-7682-31ee6ec858db
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-bee9-5287597e1579
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-48d5-4f9ee204082d
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-935f-3c34cb52c87a
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-5f33-e799990936a5
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-d726-4ecacbabc50e
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-2dbf-25bdf637101c
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-e560-cdaf5dc44ad2
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-2a35-439582d4bc78
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-7502-757bfa621032
00020000-556f-12cb-b155-a93d6266b491	00030000-556f-12cb-29f9-ea1e19b6a3cb
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-20c2-d799f0a70d59
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-9b77-12718913221a
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-a816-c6e00884d37d
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-3d6b-7f7a24420d1e
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-c17e-182381bd3325
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-ac3b-62cb6984aa75
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-eef8-595cf66d8c70
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-7682-31ee6ec858db
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-bee9-5287597e1579
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-48d5-4f9ee204082d
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-935f-3c34cb52c87a
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-5f33-e799990936a5
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-d726-4ecacbabc50e
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-2dbf-25bdf637101c
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-e560-cdaf5dc44ad2
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-39a0-fcd758e61041
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-5a15-59fbe0c3edf7
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-2a35-439582d4bc78
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-7502-757bfa621032
00020000-556f-12cc-5bae-6e2153b6972a	00030000-556f-12cb-29f9-ea1e19b6a3cb
\.


--
-- TOC entry 2807 (class 0 OID 6212026)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6212057)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6212191)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6211791)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556f-12cc-e37d-5f3bdbb588c2	00040000-556f-12cb-f344-daefb9954e68	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556f-12cc-7665-4b083c563f55	00040000-556f-12cb-f344-daefb9954e68	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556f-12cc-235d-6558c3a5a0d7	00040000-556f-12cb-f344-daefb9954e68	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556f-12cc-8cdc-0ebac67a9128	00040000-556f-12cb-f344-daefb9954e68	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2786 (class 0 OID 6211826)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556f-12cb-6792-8292c7e43913	8341	Adlešiči
00050000-556f-12cb-fcc3-f9a6d5d4ff2a	5270	Ajdovščina
00050000-556f-12cb-6a42-1367163bdbb4	6280	Ankaran/Ancarano
00050000-556f-12cb-6bb8-73064be6123e	9253	Apače
00050000-556f-12cb-751c-2572d184c8d9	8253	Artiče
00050000-556f-12cb-7fa9-8a15ab758ee1	4275	Begunje na Gorenjskem
00050000-556f-12cb-703a-16a6c3e53912	1382	Begunje pri Cerknici
00050000-556f-12cb-8615-14260b0ca63b	9231	Beltinci
00050000-556f-12cb-abcf-9440843738cc	2234	Benedikt
00050000-556f-12cb-c7a3-c67d411bb25b	2345	Bistrica ob Dravi
00050000-556f-12cb-0dc4-6226d6e455d3	3256	Bistrica ob Sotli
00050000-556f-12cb-ab9a-1a15623639e6	8259	Bizeljsko
00050000-556f-12cb-19fb-e6f5e68ecb74	1223	Blagovica
00050000-556f-12cb-cc65-b1aa00dcb96d	8283	Blanca
00050000-556f-12cb-3ffa-19998f177bca	4260	Bled
00050000-556f-12cb-1ba0-b17b7d2dfb59	4273	Blejska Dobrava
00050000-556f-12cb-fe02-d0b99a5c6693	9265	Bodonci
00050000-556f-12cb-a4eb-2fcd5d4cb924	9222	Bogojina
00050000-556f-12cb-0a86-3df3a37dd378	4263	Bohinjska Bela
00050000-556f-12cb-0385-7f38eecf0e2b	4264	Bohinjska Bistrica
00050000-556f-12cb-2ef0-db75bc0ecca0	4265	Bohinjsko jezero
00050000-556f-12cb-50f2-3cac3ba6f0f4	1353	Borovnica
00050000-556f-12cb-e529-975d80518ef0	8294	Boštanj
00050000-556f-12cb-c995-979f8f69b530	5230	Bovec
00050000-556f-12cb-f805-68099cc61aed	5295	Branik
00050000-556f-12cb-6801-8626e7841281	3314	Braslovče
00050000-556f-12cb-0ab8-38c71c8f727f	5223	Breginj
00050000-556f-12cb-ceb6-8dd2ec444d25	8280	Brestanica
00050000-556f-12cb-7442-34b2d67e69cb	2354	Bresternica
00050000-556f-12cb-a76f-360543be04b7	4243	Brezje
00050000-556f-12cb-8ad9-15eaa409a095	1351	Brezovica pri Ljubljani
00050000-556f-12cb-aa93-7347b7bf09bb	8250	Brežice
00050000-556f-12cb-b446-a3d0b84e911c	4210	Brnik - Aerodrom
00050000-556f-12cb-8ba2-469f8cc65186	8321	Brusnice
00050000-556f-12cb-099c-bbe3a7535183	3255	Buče
00050000-556f-12cb-ec06-1c2716aeb7f1	8276	Bučka 
00050000-556f-12cb-542b-5ec593e9014d	9261	Cankova
00050000-556f-12cb-680d-662df08d35da	3000	Celje 
00050000-556f-12cb-a174-899a708a3b32	3001	Celje - poštni predali
00050000-556f-12cb-0619-8023e881d0de	4207	Cerklje na Gorenjskem
00050000-556f-12cb-decb-fbe809cbbe24	8263	Cerklje ob Krki
00050000-556f-12cb-8d3a-435b78feaa53	1380	Cerknica
00050000-556f-12cb-af0b-70207cbbf6ad	5282	Cerkno
00050000-556f-12cb-6f7e-dd3960aec843	2236	Cerkvenjak
00050000-556f-12cb-fa29-79b0f272c39b	2215	Ceršak
00050000-556f-12cb-0ec5-0f24cc71b87d	2326	Cirkovce
00050000-556f-12cb-3a11-ddfd915b87ce	2282	Cirkulane
00050000-556f-12cb-210d-9316ab9f84aa	5273	Col
00050000-556f-12cb-a7fa-2c92967bdd52	8251	Čatež ob Savi
00050000-556f-12cb-5837-0ab2f06c401c	1413	Čemšenik
00050000-556f-12cb-7ee9-c51f146b4f0b	5253	Čepovan
00050000-556f-12cb-bc6e-715ff05d8f94	9232	Črenšovci
00050000-556f-12cb-f7cc-3832c9f3671e	2393	Črna na Koroškem
00050000-556f-12cb-bee5-b117f9b0d69f	6275	Črni Kal
00050000-556f-12cb-12bc-1375bdaa9fba	5274	Črni Vrh nad Idrijo
00050000-556f-12cb-33c6-eacfc7694519	5262	Črniče
00050000-556f-12cb-898a-5e0f14e16d31	8340	Črnomelj
00050000-556f-12cb-a6a7-23d58074eabf	6271	Dekani
00050000-556f-12cb-48e3-5abbb9e96700	5210	Deskle
00050000-556f-12cb-ed32-c09c0e7cf354	2253	Destrnik
00050000-556f-12cb-45d0-c30b2987b75c	6215	Divača
00050000-556f-12cb-0299-8308fc56f34b	1233	Dob
00050000-556f-12cb-32cf-8aba7632bc09	3224	Dobje pri Planini
00050000-556f-12cb-105e-1fd4ce49d307	8257	Dobova
00050000-556f-12cb-3e32-236c922ac6e2	1423	Dobovec
00050000-556f-12cb-b747-d31dbbd950c7	5263	Dobravlje
00050000-556f-12cb-7677-8b8dd0ea4d08	3204	Dobrna
00050000-556f-12cb-4025-6ae9ff6cb6eb	8211	Dobrnič
00050000-556f-12cb-1e3a-6088b1df9421	1356	Dobrova
00050000-556f-12cb-9d40-e3adb116d6f7	9223	Dobrovnik/Dobronak 
00050000-556f-12cb-9237-919656c2426f	5212	Dobrovo v Brdih
00050000-556f-12cb-08e5-394d3c4f8116	1431	Dol pri Hrastniku
00050000-556f-12cb-8101-b025c391106b	1262	Dol pri Ljubljani
00050000-556f-12cb-abcd-4fb8165f5b2a	1273	Dole pri Litiji
00050000-556f-12cb-4a66-ec698cfc8e44	1331	Dolenja vas
00050000-556f-12cb-f479-d6b1744362c5	8350	Dolenjske Toplice
00050000-556f-12cb-c757-b34a1da04e2c	1230	Domžale
00050000-556f-12cb-fc64-7aa69c1e9f2e	2252	Dornava
00050000-556f-12cb-c847-b0ea8f726893	5294	Dornberk
00050000-556f-12cb-af16-9713eab9b602	1319	Draga
00050000-556f-12cb-83be-e1b712baf850	8343	Dragatuš
00050000-556f-12cb-ffe4-61867ffdc31c	3222	Dramlje
00050000-556f-12cb-7435-c046e1e82e41	2370	Dravograd
00050000-556f-12cb-523b-0bb1179ccbf3	4203	Duplje
00050000-556f-12cb-3e75-16498c470af1	6221	Dutovlje
00050000-556f-12cb-9d07-55ab45362165	8361	Dvor
00050000-556f-12cb-15b6-64a0a2bda63f	2343	Fala
00050000-556f-12cb-d455-5390a36ca980	9208	Fokovci
00050000-556f-12cb-636f-cb8158d4303a	2313	Fram
00050000-556f-12cb-c61b-4d4cc4ef719f	3213	Frankolovo
00050000-556f-12cb-6961-af66af76d6ad	1274	Gabrovka
00050000-556f-12cb-0b1a-36f3fc279f64	8254	Globoko
00050000-556f-12cb-4cd7-f8bc440a7051	5275	Godovič
00050000-556f-12cb-37aa-625b3b1b2379	4204	Golnik
00050000-556f-12cb-aada-b34664a90c44	3303	Gomilsko
00050000-556f-12cb-fd47-49395ed0eaab	4224	Gorenja vas
00050000-556f-12cb-f712-335e90dfdb81	3263	Gorica pri Slivnici
00050000-556f-12cb-bbbd-9195e4cb65d6	2272	Gorišnica
00050000-556f-12cb-3c37-a94ac3448a10	9250	Gornja Radgona
00050000-556f-12cb-652f-dfcbb0c691b2	3342	Gornji Grad
00050000-556f-12cb-e76d-e71383a8ed67	4282	Gozd Martuljek
00050000-556f-12cb-4b1b-7e0199b18482	6272	Gračišče
00050000-556f-12cb-af8e-3caddfbcbaeb	9264	Grad
00050000-556f-12cb-5e69-d9c2ca07a568	8332	Gradac
00050000-556f-12cb-cb8f-c2590a5d9a23	1384	Grahovo
00050000-556f-12cb-5abc-73637cbab9ce	5242	Grahovo ob Bači
00050000-556f-12cb-aef5-a91d32dd263c	5251	Grgar
00050000-556f-12cb-d411-0fc335c97273	3302	Griže
00050000-556f-12cb-23f2-58086a8e9a1a	3231	Grobelno
00050000-556f-12cb-f097-1bbe1f48d2e4	1290	Grosuplje
00050000-556f-12cb-2356-bf834fa2273b	2288	Hajdina
00050000-556f-12cb-552d-97ee2d1a0105	8362	Hinje
00050000-556f-12cb-a9c9-75af5b1d8fce	2311	Hoče
00050000-556f-12cb-3570-253e13eb5167	9205	Hodoš/Hodos
00050000-556f-12cb-5839-6a25276725b0	1354	Horjul
00050000-556f-12cb-0102-9caddf8e94d7	1372	Hotedršica
00050000-556f-12cb-7dd7-b4db90ac49fa	1430	Hrastnik
00050000-556f-12cb-da6c-007724ee5323	6225	Hruševje
00050000-556f-12cb-f55f-c2a1b3f665ef	4276	Hrušica
00050000-556f-12cb-f927-b0854b558daa	5280	Idrija
00050000-556f-12cb-7e22-d2dc2f6886c3	1292	Ig
00050000-556f-12cb-1006-b2ff92a9181c	6250	Ilirska Bistrica
00050000-556f-12cb-7215-3979bfcb273b	6251	Ilirska Bistrica-Trnovo
00050000-556f-12cb-9600-5563bb46d76e	1295	Ivančna Gorica
00050000-556f-12cb-e352-c87056282cde	2259	Ivanjkovci
00050000-556f-12cb-12c0-cd780f34f0bf	1411	Izlake
00050000-556f-12cb-9ddf-29fef260bcd8	6310	Izola/Isola
00050000-556f-12cb-2273-caf6b60d37c6	2222	Jakobski Dol
00050000-556f-12cb-f14f-f607925b8557	2221	Jarenina
00050000-556f-12cb-1758-adc6f534ed21	6254	Jelšane
00050000-556f-12cb-6cea-f7ae8b5cdbc1	4270	Jesenice
00050000-556f-12cb-2226-e4fdb324fd1f	8261	Jesenice na Dolenjskem
00050000-556f-12cb-11bc-1be882422ca9	3273	Jurklošter
00050000-556f-12cb-b376-dca43a5081cf	2223	Jurovski Dol
00050000-556f-12cb-6969-996cf4e4703d	2256	Juršinci
00050000-556f-12cb-a5b7-d873061134e6	5214	Kal nad Kanalom
00050000-556f-12cb-ae0d-f7bd7ef7e2d4	3233	Kalobje
00050000-556f-12cb-0911-7ac5033aca59	4246	Kamna Gorica
00050000-556f-12cb-95df-8609fbd36d06	2351	Kamnica
00050000-556f-12cb-47e8-a8ede7cf2bc6	1241	Kamnik
00050000-556f-12cb-87c8-f5994c7970a2	5213	Kanal
00050000-556f-12cb-f148-919efde70cde	8258	Kapele
00050000-556f-12cb-04e0-bed7de571002	2362	Kapla
00050000-556f-12cb-28e0-94d04dcebcb3	2325	Kidričevo
00050000-556f-12cb-aa78-e0b201c6e33c	1412	Kisovec
00050000-556f-12cb-81e3-615f1deba8b0	6253	Knežak
00050000-556f-12cb-cbc7-b77df4c54a3b	5222	Kobarid
00050000-556f-12cb-7124-67a7a97246d1	9227	Kobilje
00050000-556f-12cb-ef5e-1b989adede08	1330	Kočevje
00050000-556f-12cb-f7ff-d22ff7308785	1338	Kočevska Reka
00050000-556f-12cb-c4eb-01f66d97ce6a	2276	Kog
00050000-556f-12cb-58eb-3a71a8bce82c	5211	Kojsko
00050000-556f-12cb-bb3a-48af7860199a	6223	Komen
00050000-556f-12cb-0ddd-7ab9aafb8e76	1218	Komenda
00050000-556f-12cb-bce9-65ae3a5049a4	6000	Koper/Capodistria 
00050000-556f-12cb-028b-8947222f685f	6001	Koper/Capodistria - poštni predali
00050000-556f-12cb-ff9c-7c44255c45bd	8282	Koprivnica
00050000-556f-12cb-3823-f69b37258b3e	5296	Kostanjevica na Krasu
00050000-556f-12cb-9333-79a8d9bd7f40	8311	Kostanjevica na Krki
00050000-556f-12cb-ef51-53121530966c	1336	Kostel
00050000-556f-12cb-1a14-9f857bc773d4	6256	Košana
00050000-556f-12cb-1c9d-1c7adb453f70	2394	Kotlje
00050000-556f-12cb-d32c-375d96976739	6240	Kozina
00050000-556f-12cb-5aa2-2b8029558059	3260	Kozje
00050000-556f-12cb-fcc9-894b09506c16	4000	Kranj 
00050000-556f-12cb-e9c7-ee60db4e7962	4001	Kranj - poštni predali
00050000-556f-12cb-fb9c-0560fb652f82	4280	Kranjska Gora
00050000-556f-12cb-7e65-6573dcd3643c	1281	Kresnice
00050000-556f-12cb-5b1e-7fa3014df181	4294	Križe
00050000-556f-12cb-1dd4-91456602be31	9206	Križevci
00050000-556f-12cb-9829-c2b83f3341c7	9242	Križevci pri Ljutomeru
00050000-556f-12cb-e8fa-5806c4485a9c	1301	Krka
00050000-556f-12cb-1e02-f94125020627	8296	Krmelj
00050000-556f-12cb-9a96-b7278ddd1373	4245	Kropa
00050000-556f-12cb-098c-24d99c291bb7	8262	Krška vas
00050000-556f-12cb-746f-a77115053372	8270	Krško
00050000-556f-12cb-0486-d0460138866e	9263	Kuzma
00050000-556f-12cb-7ec0-18bd1d0c5bed	2318	Laporje
00050000-556f-12cb-ed07-8e92371c5ed7	3270	Laško
00050000-556f-12cb-d67e-fbe3fda5e2e9	1219	Laze v Tuhinju
00050000-556f-12cb-df65-8ca75eba92f0	2230	Lenart v Slovenskih goricah
00050000-556f-12cb-1b86-bcf0221ecc5e	9220	Lendava/Lendva
00050000-556f-12cb-7919-e8dcf46152b0	4248	Lesce
00050000-556f-12cb-c3f9-f6e830cf4560	3261	Lesično
00050000-556f-12cb-c0a5-9371ed58d0f7	8273	Leskovec pri Krškem
00050000-556f-12cb-b2c4-1c26e312c02f	2372	Libeliče
00050000-556f-12cb-9aef-06a04dba9fc7	2341	Limbuš
00050000-556f-12cb-00e7-006e9f0e3c45	1270	Litija
00050000-556f-12cb-d2b3-38d374ae4ed8	3202	Ljubečna
00050000-556f-12cb-f2b1-701753d84c9c	1000	Ljubljana 
00050000-556f-12cb-8ffa-12643f20e391	1001	Ljubljana - poštni predali
00050000-556f-12cb-fa0e-ffb863afca64	1231	Ljubljana - Črnuče
00050000-556f-12cb-12c0-bfbcfdf19ccd	1261	Ljubljana - Dobrunje
00050000-556f-12cb-0b5f-d7c2c7506d84	1260	Ljubljana - Polje
00050000-556f-12cb-e4ed-197e13587c58	1210	Ljubljana - Šentvid
00050000-556f-12cb-d16f-4a0060f18924	1211	Ljubljana - Šmartno
00050000-556f-12cb-45ff-ba7c465b6cc4	3333	Ljubno ob Savinji
00050000-556f-12cb-03ed-c145240e04f7	9240	Ljutomer
00050000-556f-12cb-30a7-63538b6e5ed2	3215	Loče
00050000-556f-12cb-765a-dad6ea5f231c	5231	Log pod Mangartom
00050000-556f-12cb-9547-96d541969943	1358	Log pri Brezovici
00050000-556f-12cb-8c27-a49fb19a27e1	1370	Logatec
00050000-556f-12cb-da5d-bc0d6d1c011a	1371	Logatec
00050000-556f-12cb-314b-d4648da9ede6	1434	Loka pri Zidanem Mostu
00050000-556f-12cb-36e1-c6639e458bff	3223	Loka pri Žusmu
00050000-556f-12cb-4c4f-8174897e054c	6219	Lokev
00050000-556f-12cb-2db7-15b706908764	1318	Loški Potok
00050000-556f-12cb-6750-8007b487cd87	2324	Lovrenc na Dravskem polju
00050000-556f-12cb-f5a1-93495a5c1895	2344	Lovrenc na Pohorju
00050000-556f-12cb-ae82-a0e286d1a8d9	3334	Luče
00050000-556f-12cb-1a81-7d8751e9208c	1225	Lukovica
00050000-556f-12cb-f12e-d9df5896b747	9202	Mačkovci
00050000-556f-12cb-bb82-a78cefbb2af1	2322	Majšperk
00050000-556f-12cb-78b6-56231df6e3b8	2321	Makole
00050000-556f-12cb-9fbe-f8e18731c95c	9243	Mala Nedelja
00050000-556f-12cb-1766-b500958f96eb	2229	Malečnik
00050000-556f-12cb-eac7-a9ed7a3e060e	6273	Marezige
00050000-556f-12cb-fe06-501519eb89ca	2000	Maribor 
00050000-556f-12cb-43fa-34747b7bcffc	2001	Maribor - poštni predali
00050000-556f-12cb-c9b1-4d51bb06aefd	2206	Marjeta na Dravskem polju
00050000-556f-12cb-89ff-cf46da6417c4	2281	Markovci
00050000-556f-12cb-71a8-505a6912357d	9221	Martjanci
00050000-556f-12cb-1751-a3b03c285f98	6242	Materija
00050000-556f-12cb-0337-93df81cb6fae	4211	Mavčiče
00050000-556f-12cb-8298-46eb570eaecf	1215	Medvode
00050000-556f-12cb-ade9-f025e49f6476	1234	Mengeš
00050000-556f-12cb-e0e3-4eb855935852	8330	Metlika
00050000-556f-12cb-6f2e-9df406ec58dc	2392	Mežica
00050000-556f-12cb-1c16-0110e52c3386	2204	Miklavž na Dravskem polju
00050000-556f-12cb-daf3-0815aca90ede	2275	Miklavž pri Ormožu
00050000-556f-12cb-7828-2f516066bfb4	5291	Miren
00050000-556f-12cb-c874-c01c821159d0	8233	Mirna
00050000-556f-12cb-2346-e23b6ba2be49	8216	Mirna Peč
00050000-556f-12cb-dc96-2ca8bf882cb0	2382	Mislinja
00050000-556f-12cb-d43b-272b5518eddb	4281	Mojstrana
00050000-556f-12cb-2071-96a5590acd90	8230	Mokronog
00050000-556f-12cb-e9ef-8f10e12b84da	1251	Moravče
00050000-556f-12cb-e403-b71ceca55a83	9226	Moravske Toplice
00050000-556f-12cb-6e50-1e6d63c635a3	5216	Most na Soči
00050000-556f-12cb-a5ea-f8de7e30d765	1221	Motnik
00050000-556f-12cb-3714-5e80af4af2c5	3330	Mozirje
00050000-556f-12cb-127a-521d450a0ddd	9000	Murska Sobota 
00050000-556f-12cb-8877-95eaf7585763	9001	Murska Sobota - poštni predali
00050000-556f-12cb-09c2-26899dae101c	2366	Muta
00050000-556f-12cb-5f79-31a0dcbf1b8a	4202	Naklo
00050000-556f-12cb-b94d-6245790257c1	3331	Nazarje
00050000-556f-12cb-2ea1-06ee94309ca9	1357	Notranje Gorice
00050000-556f-12cb-c3da-71f07cdd6b64	3203	Nova Cerkev
00050000-556f-12cb-9156-04234aad70dd	5000	Nova Gorica 
00050000-556f-12cb-a920-a4d03cbac81e	5001	Nova Gorica - poštni predali
00050000-556f-12cb-d14f-35fb5aefe40b	1385	Nova vas
00050000-556f-12cb-a54b-529499dd7997	8000	Novo mesto
00050000-556f-12cb-e104-9e2ccc01d5ac	8001	Novo mesto - poštni predali
00050000-556f-12cb-b3b4-92cf598ff3da	6243	Obrov
00050000-556f-12cb-2635-2266464ed945	9233	Odranci
00050000-556f-12cb-856f-e396b5d7e887	2317	Oplotnica
00050000-556f-12cb-68fb-74fd8b67eaee	2312	Orehova vas
00050000-556f-12cb-9f32-a890ea70ec00	2270	Ormož
00050000-556f-12cb-518e-694fbb3600bd	1316	Ortnek
00050000-556f-12cb-5437-40e04c5b0574	1337	Osilnica
00050000-556f-12cb-a440-1e3c4366287b	8222	Otočec
00050000-556f-12cb-b0c5-2ad70ef10c2c	2361	Ožbalt
00050000-556f-12cb-834f-b3405c11d31c	2231	Pernica
00050000-556f-12cb-2097-24f2484f68b8	2211	Pesnica pri Mariboru
00050000-556f-12cb-1527-d5ba16e44bac	9203	Petrovci
00050000-556f-12cb-21e8-d9547615ad39	3301	Petrovče
00050000-556f-12cb-f1e1-5a90db9fcb7a	6330	Piran/Pirano
00050000-556f-12cb-d72f-a3b212849477	8255	Pišece
00050000-556f-12cb-5fa3-35baddc7901c	6257	Pivka
00050000-556f-12cb-2ab4-e4712ec6a8c0	6232	Planina
00050000-556f-12cb-5ce6-f628e7924d93	3225	Planina pri Sevnici
00050000-556f-12cb-6fb8-dc7f412bebed	6276	Pobegi
00050000-556f-12cb-6288-3f5966598ddf	8312	Podbočje
00050000-556f-12cb-6510-0fbc3f956507	5243	Podbrdo
00050000-556f-12cb-6c74-044323908ed3	3254	Podčetrtek
00050000-556f-12cb-de76-ef747a1030f3	2273	Podgorci
00050000-556f-12cb-b2d5-7ae870030a4f	6216	Podgorje
00050000-556f-12cb-8f42-a06c641c4098	2381	Podgorje pri Slovenj Gradcu
00050000-556f-12cb-174b-6bf0b956b97e	6244	Podgrad
00050000-556f-12cb-3cab-530dc23910c8	1414	Podkum
00050000-556f-12cb-0ace-d941a44b64c1	2286	Podlehnik
00050000-556f-12cb-ef9f-320ef7cb296b	5272	Podnanos
00050000-556f-12cb-d83e-774b6f0ce903	4244	Podnart
00050000-556f-12cb-1eb6-8e74fde43293	3241	Podplat
00050000-556f-12cb-9046-1c3dcc9d01d7	3257	Podsreda
00050000-556f-12cb-3d32-a8502480fa5d	2363	Podvelka
00050000-556f-12cb-66e7-64b434033c53	2208	Pohorje
00050000-556f-12cb-64eb-3b4739dad6eb	2257	Polenšak
00050000-556f-12cb-f9e8-6650d45d6d00	1355	Polhov Gradec
00050000-556f-12cb-f510-98df35f9d328	4223	Poljane nad Škofjo Loko
00050000-556f-12cb-e132-cb86163789c9	2319	Poljčane
00050000-556f-12cb-820e-5d9ad022501c	1272	Polšnik
00050000-556f-12cb-a1a9-92c1a56f86d4	3313	Polzela
00050000-556f-12cb-3088-a981887a3715	3232	Ponikva
00050000-556f-12cb-d24a-b71c4857e7d8	6320	Portorož/Portorose
00050000-556f-12cb-717d-d54bc9f796b4	6230	Postojna
00050000-556f-12cb-d0a2-ab18500c4a9d	2331	Pragersko
00050000-556f-12cb-b2f7-7798a5555155	3312	Prebold
00050000-556f-12cb-8f38-6b89241fd1e7	4205	Preddvor
00050000-556f-12cb-3536-4951f55e2d98	6255	Prem
00050000-556f-12cb-b36f-cc0b158b0fdc	1352	Preserje
00050000-556f-12cb-bca7-bc494c4296a4	6258	Prestranek
00050000-556f-12cb-2a66-b6ad649a1447	2391	Prevalje
00050000-556f-12cb-b5e3-0f4836f9160d	3262	Prevorje
00050000-556f-12cb-c009-d28517f19196	1276	Primskovo 
00050000-556f-12cb-d438-ccefa3b5d092	3253	Pristava pri Mestinju
00050000-556f-12cb-57a9-1959666ba285	9207	Prosenjakovci/Partosfalva
00050000-556f-12cb-f3c7-eba7100afd4e	5297	Prvačina
00050000-556f-12cb-eee2-7baea3095581	2250	Ptuj
00050000-556f-12cb-1cdd-a3bf69d22357	2323	Ptujska Gora
00050000-556f-12cb-523d-992e12286015	9201	Puconci
00050000-556f-12cb-dc5d-5977477d5210	2327	Rače
00050000-556f-12cb-9c2a-67175bd1ae8e	1433	Radeče
00050000-556f-12cb-0d79-8b7ae637f295	9252	Radenci
00050000-556f-12cb-fd4f-2c46ccf2f7ef	2360	Radlje ob Dravi
00050000-556f-12cb-de4e-0c93dfed3cda	1235	Radomlje
00050000-556f-12cb-bd51-b37a4d4e814e	4240	Radovljica
00050000-556f-12cb-e288-b7f46eef92ad	8274	Raka
00050000-556f-12cb-9b67-eb4c807bdb86	1381	Rakek
00050000-556f-12cb-43ef-13b90c694215	4283	Rateče - Planica
00050000-556f-12cb-ef89-58236bad41e3	2390	Ravne na Koroškem
00050000-556f-12cb-b0c9-49b9530ecd42	9246	Razkrižje
00050000-556f-12cb-a749-0990b87959df	3332	Rečica ob Savinji
00050000-556f-12cb-2482-0613f9a3bc3a	5292	Renče
00050000-556f-12cb-bf23-ea7336285ec4	1310	Ribnica
00050000-556f-12cb-f7a4-ad8e1db9293f	2364	Ribnica na Pohorju
00050000-556f-12cb-ea91-1886bd59149c	3272	Rimske Toplice
00050000-556f-12cb-e5d1-e8d3d71daa0e	1314	Rob
00050000-556f-12cb-594c-5f8271584a20	5215	Ročinj
00050000-556f-12cb-dd15-5966af2d566c	3250	Rogaška Slatina
00050000-556f-12cb-f09a-2bfe167d374b	9262	Rogašovci
00050000-556f-12cb-fe1c-edc25d14c8cc	3252	Rogatec
00050000-556f-12cb-f923-146f3a90be43	1373	Rovte
00050000-556f-12cb-820e-39ab89ea7da2	2342	Ruše
00050000-556f-12cb-f217-9648affb71fd	1282	Sava
00050000-556f-12cb-7768-012e13a737ad	6333	Sečovlje/Sicciole
00050000-556f-12cb-157e-fd155d1fdfcf	4227	Selca
00050000-556f-12cb-28aa-953b463af496	2352	Selnica ob Dravi
00050000-556f-12cb-1db7-3c522733b62e	8333	Semič
00050000-556f-12cb-67a8-d2f19338615d	8281	Senovo
00050000-556f-12cb-7883-d03ed56e201a	6224	Senožeče
00050000-556f-12cb-a4eb-92a1c2cb0b0a	8290	Sevnica
00050000-556f-12cb-0e2b-296b159fce2c	6210	Sežana
00050000-556f-12cb-86e1-ce57e9f1b21c	2214	Sladki Vrh
00050000-556f-12cb-6239-b6a6f38e684c	5283	Slap ob Idrijci
00050000-556f-12cb-284c-2ff8ae1583e2	2380	Slovenj Gradec
00050000-556f-12cb-9f72-99495d2d03b0	2310	Slovenska Bistrica
00050000-556f-12cb-da29-57f48452964c	3210	Slovenske Konjice
00050000-556f-12cb-bf2b-39fb2dd9ca07	1216	Smlednik
00050000-556f-12cb-61c3-b0d530488a72	5232	Soča
00050000-556f-12cb-abab-885e3b5430bd	1317	Sodražica
00050000-556f-12cb-346a-225983e2c383	3335	Solčava
00050000-556f-12cb-d0ce-27541288dabd	5250	Solkan
00050000-556f-12cb-982b-ae4c0a9410c6	4229	Sorica
00050000-556f-12cb-3a76-7278081cf190	4225	Sovodenj
00050000-556f-12cb-e6d5-8839986730ff	5281	Spodnja Idrija
00050000-556f-12cb-b123-59fb38253225	2241	Spodnji Duplek
00050000-556f-12cb-92d6-a0a7bfe6b9f8	9245	Spodnji Ivanjci
00050000-556f-12cb-aaf3-0ce289732f15	2277	Središče ob Dravi
00050000-556f-12cb-a836-fd73bc5fd2d0	4267	Srednja vas v Bohinju
00050000-556f-12cb-5072-9655bd299c8a	8256	Sromlje 
00050000-556f-12cb-3370-215bdf9e46cb	5224	Srpenica
00050000-556f-12cb-4779-2b4b1cfec0a4	1242	Stahovica
00050000-556f-12cb-cb02-c407ae0f7d7c	1332	Stara Cerkev
00050000-556f-12cb-a775-48c531b1dd9a	8342	Stari trg ob Kolpi
00050000-556f-12cb-c392-c1651b94b074	1386	Stari trg pri Ložu
00050000-556f-12cb-6167-a895e00a2dea	2205	Starše
00050000-556f-12cb-f234-971fd4fd5388	2289	Stoperce
00050000-556f-12cb-3700-c7033f27efdc	8322	Stopiče
00050000-556f-12cb-b03f-856ffe9c3030	3206	Stranice
00050000-556f-12cb-0b37-f0cfe111e4a0	8351	Straža
00050000-556f-12cb-3d91-8918a06af77d	1313	Struge
00050000-556f-12cb-a01f-94c465392dd4	8293	Studenec
00050000-556f-12cb-b3d9-0b54f415738a	8331	Suhor
00050000-556f-12cb-4638-06954952e005	2233	Sv. Ana v Slovenskih goricah
00050000-556f-12cb-e763-df2253b1afe6	2235	Sv. Trojica v Slovenskih goricah
00050000-556f-12cb-45e3-5b4c840b4357	2353	Sveti Duh na Ostrem Vrhu
00050000-556f-12cb-9f99-9100caa0961b	9244	Sveti Jurij ob Ščavnici
00050000-556f-12cb-18d3-d9ca8a5be538	3264	Sveti Štefan
00050000-556f-12cb-40ca-8bc2d1a32be2	2258	Sveti Tomaž
00050000-556f-12cb-28c1-90e4fe1bd0cf	9204	Šalovci
00050000-556f-12cb-a2fa-0a48ff24e869	5261	Šempas
00050000-556f-12cb-b078-4fa1aeffbcb7	5290	Šempeter pri Gorici
00050000-556f-12cb-d102-1840aba42218	3311	Šempeter v Savinjski dolini
00050000-556f-12cb-e577-ac14d94c6813	4208	Šenčur
00050000-556f-12cb-066c-d3bc2cbca808	2212	Šentilj v Slovenskih goricah
00050000-556f-12cb-5754-3b334b3871e2	8297	Šentjanž
00050000-556f-12cb-b3da-5eadc24b24de	2373	Šentjanž pri Dravogradu
00050000-556f-12cb-ff4f-7cf532309575	8310	Šentjernej
00050000-556f-12cb-d6a7-0798ecce78df	3230	Šentjur
00050000-556f-12cb-ce3d-7f3d0b10f163	3271	Šentrupert
00050000-556f-12cb-c9d9-7044bd306a01	8232	Šentrupert
00050000-556f-12cb-358a-ffcbe8384278	1296	Šentvid pri Stični
00050000-556f-12cb-41e8-d6ca468e37f4	8275	Škocjan
00050000-556f-12cb-c9e6-51dfc68dddd0	6281	Škofije
00050000-556f-12cb-aaf7-9d27241832e0	4220	Škofja Loka
00050000-556f-12cb-b756-ff2339f27a5f	3211	Škofja vas
00050000-556f-12cb-977d-eb3e57cf87f0	1291	Škofljica
00050000-556f-12cb-2530-4005312b1c98	6274	Šmarje
00050000-556f-12cb-e334-5c665373fb8b	1293	Šmarje - Sap
00050000-556f-12cb-8b3f-4fe7822cfc28	3240	Šmarje pri Jelšah
00050000-556f-12cb-a7a1-51bd070c5207	8220	Šmarješke Toplice
00050000-556f-12cb-d288-782e9299b6d1	2315	Šmartno na Pohorju
00050000-556f-12cb-06e5-65e5141ce1a6	3341	Šmartno ob Dreti
00050000-556f-12cb-a53d-150b971b539d	3327	Šmartno ob Paki
00050000-556f-12cb-ef01-368072d1b7df	1275	Šmartno pri Litiji
00050000-556f-12cb-11ba-9da99e4b81b4	2383	Šmartno pri Slovenj Gradcu
00050000-556f-12cb-b662-05c1af8bf1e6	3201	Šmartno v Rožni dolini
00050000-556f-12cb-ccb6-147940e94505	3325	Šoštanj
00050000-556f-12cb-2e46-87043079ba64	6222	Štanjel
00050000-556f-12cb-0ef9-ac502c1224d1	3220	Štore
00050000-556f-12cb-c3c6-aacebca65b3f	3304	Tabor
00050000-556f-12cb-e773-58ca58819989	3221	Teharje
00050000-556f-12cb-043a-8cd0ce63c063	9251	Tišina
00050000-556f-12cb-4484-49053aaf52b1	5220	Tolmin
00050000-556f-12cb-77f2-ea2abceff60b	3326	Topolšica
00050000-556f-12cb-f2fa-4644287972ae	2371	Trbonje
00050000-556f-12cb-424b-52ffd351a736	1420	Trbovlje
00050000-556f-12cb-b3c9-a4cf455aa711	8231	Trebelno 
00050000-556f-12cb-3344-fad5ad4a4af0	8210	Trebnje
00050000-556f-12cb-6e09-d959549cf6b5	5252	Trnovo pri Gorici
00050000-556f-12cb-5ad3-3178ba7a0223	2254	Trnovska vas
00050000-556f-12cb-aa91-b45eb6417d60	1222	Trojane
00050000-556f-12cb-37f9-23104995cc5e	1236	Trzin
00050000-556f-12cb-644a-f0da40bfdbac	4290	Tržič
00050000-556f-12cb-1ca5-ff8014b6fede	8295	Tržišče
00050000-556f-12cb-1390-affefaf0f9b7	1311	Turjak
00050000-556f-12cb-8fe4-fac13e572c5c	9224	Turnišče
00050000-556f-12cb-5c79-920a0dcca568	8323	Uršna sela
00050000-556f-12cb-cbf6-c0e793d8a5b0	1252	Vače
00050000-556f-12cb-0d34-ed8e7e82e5c1	3320	Velenje 
00050000-556f-12cb-3b6b-556b7064b9e3	3322	Velenje - poštni predali
00050000-556f-12cb-5f3d-2190cb78db36	8212	Velika Loka
00050000-556f-12cb-0fc9-63b7c7a68589	2274	Velika Nedelja
00050000-556f-12cb-cbf6-1dc312ab90a0	9225	Velika Polana
00050000-556f-12cb-423b-577e2c66b165	1315	Velike Lašče
00050000-556f-12cb-f240-e8227cd1515a	8213	Veliki Gaber
00050000-556f-12cb-c2d7-d69a5beca570	9241	Veržej
00050000-556f-12cb-d114-12e9139f6e81	1312	Videm - Dobrepolje
00050000-556f-12cb-b4d4-f964388a4188	2284	Videm pri Ptuju
00050000-556f-12cb-662a-cfae0757d311	8344	Vinica
00050000-556f-12cb-59f3-ec5abafeeb7a	5271	Vipava
00050000-556f-12cb-bfc7-17b8f35a7dd5	4212	Visoko
00050000-556f-12cb-6529-6d23e0b70522	1294	Višnja Gora
00050000-556f-12cb-309a-809d2dcf541c	3205	Vitanje
00050000-556f-12cb-d275-dd0ee5e3f1a5	2255	Vitomarci
00050000-556f-12cb-ae2e-48b85d482c4f	1217	Vodice
00050000-556f-12cb-24d3-bef663c39195	3212	Vojnik\t
00050000-556f-12cb-e80c-2609e76647b5	5293	Volčja Draga
00050000-556f-12cb-2af0-56a184b08e90	2232	Voličina
00050000-556f-12cb-a1b8-3db226fbbe90	3305	Vransko
00050000-556f-12cb-872a-c548d265919e	6217	Vremski Britof
00050000-556f-12cb-a927-d6f09ca6a075	1360	Vrhnika
00050000-556f-12cb-4244-ef633cee6e7e	2365	Vuhred
00050000-556f-12cb-fc93-143b12575cbe	2367	Vuzenica
00050000-556f-12cb-40e7-4767eb9ebe76	8292	Zabukovje 
00050000-556f-12cb-3aac-1e9b77eca2dd	1410	Zagorje ob Savi
00050000-556f-12cb-4a1e-c6ae64b6a010	1303	Zagradec
00050000-556f-12cb-9571-d53b7d9a39e7	2283	Zavrč
00050000-556f-12cb-545d-b8f704d214d5	8272	Zdole 
00050000-556f-12cb-743b-5e69104ba4b3	4201	Zgornja Besnica
00050000-556f-12cb-bd35-fb91a9ab31e7	2242	Zgornja Korena
00050000-556f-12cb-225c-f94706c02dfa	2201	Zgornja Kungota
00050000-556f-12cb-bdc5-f13a67a27040	2316	Zgornja Ložnica
00050000-556f-12cb-1596-105eb14405a4	2314	Zgornja Polskava
00050000-556f-12cb-0557-09baf21de383	2213	Zgornja Velka
00050000-556f-12cb-5c43-34c8ebaaf255	4247	Zgornje Gorje
00050000-556f-12cb-ff6b-1b4abb6ff663	4206	Zgornje Jezersko
00050000-556f-12cb-20d7-045fe9b62134	2285	Zgornji Leskovec
00050000-556f-12cb-4449-9def60a567fe	1432	Zidani Most
00050000-556f-12cb-6a49-bf6dd7e2d0ae	3214	Zreče
00050000-556f-12cb-87d8-3970810079cf	4209	Žabnica
00050000-556f-12cb-cfe1-4b46978e06ca	3310	Žalec
00050000-556f-12cb-e83d-6289a7bfc48b	4228	Železniki
00050000-556f-12cb-f3db-21838531e2ce	2287	Žetale
00050000-556f-12cb-7f69-eabf236b3c64	4226	Žiri
00050000-556f-12cb-bdbb-e05cbc7f8dc2	4274	Žirovnica
00050000-556f-12cb-d4b9-f395240b34f8	8360	Žužemberk
\.


--
-- TOC entry 2803 (class 0 OID 6212000)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6211811)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6211889)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6212012)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6212132)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6212183)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556f-12cc-69cb-00d3bd7ffbb4	00080000-556f-12cc-235d-6558c3a5a0d7	0987	A
00190000-556f-12cc-d1c2-df97ae58415e	00080000-556f-12cc-7665-4b083c563f55	0989	A
\.


--
-- TOC entry 2829 (class 0 OID 6212295)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6212323)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2830 (class 0 OID 6212304)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2809 (class 0 OID 6212041)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556f-12cc-714d-73ea75f4a7e9	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556f-12cc-b905-1d593a3dafdf	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556f-12cc-3da5-7750be79fea5	0003	Kazinska	t	84	Kazinska dvorana
00220000-556f-12cc-a92d-44377bddcefc	0004	Mali oder	t	24	Mali oder 
00220000-556f-12cc-7451-5a8605d73085	0005	Komorni oder	t	15	Komorni oder
00220000-556f-12cc-24c3-f44d7884d850	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556f-12cc-147e-50806bac56bf	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2801 (class 0 OID 6211985)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6211975)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6212172)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6212109)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6211683)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556f-12cc-ab99-18dfffd3c51d	00010000-556f-12cc-be35-59f16bd8ae9b	2015-06-03 16:44:29	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROFejp6h6Kr9V3Jlhx2TV07gnBLRW4.tu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2810 (class 0 OID 6212051)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6211721)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556f-12cb-cde9-7e8d9eb0dbd4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556f-12cb-7ea5-f073e7af273f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556f-12cb-2752-b6f3951dab66	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556f-12cb-8aa1-6dd7badd7b89	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556f-12cb-e29f-1f4aa47be962	planer	Planer dogodkov v koledarju	t
00020000-556f-12cb-687a-c4acf67ce27e	kadrovska	Kadrovska služba	t
00020000-556f-12cb-cfdf-f2ce99366dd1	arhivar	Ažuriranje arhivalij	t
00020000-556f-12cb-b155-a93d6266b491	igralec	Igralec	t
00020000-556f-12cc-5bae-6e2153b6972a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2776 (class 0 OID 6211705)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556f-12cc-ab99-18dfffd3c51d	00020000-556f-12cb-2752-b6f3951dab66
00010000-556f-12cc-be35-59f16bd8ae9b	00020000-556f-12cb-2752-b6f3951dab66
\.


--
-- TOC entry 2812 (class 0 OID 6212065)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6212006)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6211956)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6212342)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556f-12cb-90ef-0c916fd4ff73	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556f-12cb-d510-211dd4b4d10e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556f-12cb-1af7-cbc628fa9119	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556f-12cb-0ab2-a9b745a2b06e	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556f-12cb-c9f7-238c83e3d2ab	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2834 (class 0 OID 6212334)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556f-12cb-4de0-2ebb4c8693aa	00000000-556f-12cb-0ab2-a9b745a2b06e	popa
00000000-556f-12cb-b489-ddb7ce85432e	00000000-556f-12cb-0ab2-a9b745a2b06e	oseba
00000000-556f-12cb-f5a2-ea759767bfd5	00000000-556f-12cb-d510-211dd4b4d10e	prostor
00000000-556f-12cb-e252-2a2ad80b46d7	00000000-556f-12cb-0ab2-a9b745a2b06e	besedilo
00000000-556f-12cb-df1c-e57d5577bfa0	00000000-556f-12cb-0ab2-a9b745a2b06e	uprizoritev
00000000-556f-12cb-a614-04b43eb4ba5c	00000000-556f-12cb-0ab2-a9b745a2b06e	funkcija
00000000-556f-12cb-e774-11eb3cbc09dc	00000000-556f-12cb-0ab2-a9b745a2b06e	tipfunkcije
00000000-556f-12cb-9b22-5158372b826f	00000000-556f-12cb-0ab2-a9b745a2b06e	alternacija
00000000-556f-12cb-bef8-16b7381ee6db	00000000-556f-12cb-90ef-0c916fd4ff73	pogodba
00000000-556f-12cb-903c-f6fa65ffe8c4	00000000-556f-12cb-0ab2-a9b745a2b06e	zaposlitev
\.


--
-- TOC entry 2833 (class 0 OID 6212329)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6212119)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6211783)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6211962)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556f-12cc-5edf-b87cee8e511f	00180000-556f-12cc-01b9-7a4ab8c12237	000c0000-556f-12cc-5076-ff0f10a7e18e	00090000-556f-12cc-480c-e2bdd8bee6d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556f-12cc-d94d-c3b5fafddb21	00180000-556f-12cc-01b9-7a4ab8c12237	000c0000-556f-12cc-cbb9-11e3a3b88a98	00090000-556f-12cc-cb98-03da559c2139	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556f-12cc-5c10-4fae47193ccd	00180000-556f-12cc-01b9-7a4ab8c12237	000c0000-556f-12cc-f3d9-c181209c7d5d	00090000-556f-12cc-47dc-0d5558e97bf2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556f-12cc-31b4-3c0758c49af8	00180000-556f-12cc-01b9-7a4ab8c12237	000c0000-556f-12cc-194d-b1b2fc9c8770	00090000-556f-12cc-abd2-047803ff2620	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556f-12cc-9a47-282f3bc96257	00180000-556f-12cc-01b9-7a4ab8c12237	000c0000-556f-12cc-d4d8-6b9ff2e79f32	00090000-556f-12cc-8849-516e9a0544f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556f-12cc-2e72-f98cb68c7a5a	00180000-556f-12cc-8c42-3daaac12b513	\N	00090000-556f-12cc-8849-516e9a0544f8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2820 (class 0 OID 6212161)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556f-12cb-b1f4-188d028fddef	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556f-12cb-e360-2f596e964e0f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556f-12cb-b169-00daee76da98	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556f-12cb-688d-373a0fd4bd0e	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556f-12cb-0158-404fd3374c19	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556f-12cb-195e-5f63ac2a5036	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556f-12cb-36b8-eb7c9e806c6d	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556f-12cb-10c7-74115cc219d1	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556f-12cb-0946-65e91a9c8fc7	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556f-12cb-dfd1-fdbd92309e27	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556f-12cb-8aa8-9e9fcaf4a5a2	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556f-12cb-8a76-cd0fe797dd36	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556f-12cb-d953-7e53cfab0811	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556f-12cb-db74-6eba5c13fda3	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556f-12cb-0418-9e951d96d3af	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556f-12cb-2e52-dc75e7946c8a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2831 (class 0 OID 6212312)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2788 (class 0 OID 6211846)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6211692)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556f-12cc-be35-59f16bd8ae9b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfbnF.EOzmHrFGZovOkarwkhD1Re5.2O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556f-12cc-f8bf-9c49b20de1ac	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556f-12cc-e70d-5ea0d5a21c78	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556f-12cc-bd81-3dda6dffc07b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556f-12cc-a817-c1d07fd88c17	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556f-12cc-3875-0c2d314f92aa	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556f-12cc-a144-b3598acfaa66	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-556f-12cc-ab99-18dfffd3c51d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2825 (class 0 OID 6212217)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556f-12cc-b8cc-0aae9437415d	00160000-556f-12cc-aedc-426846b13a46	00150000-556f-12cb-07cd-05bf98426bed	00140000-556f-12cb-41b6-f3332ad2bd93	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556f-12cc-7451-5a8605d73085
000e0000-556f-12cc-79f2-accd9cfeb7da	00160000-556f-12cc-5ed6-68975eb9ac16	00150000-556f-12cb-43e1-64c1d37a7d04	00140000-556f-12cb-896b-c7fd1ea2c658	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556f-12cc-24c3-f44d7884d850
\.


--
-- TOC entry 2793 (class 0 OID 6211908)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556f-12cc-7287-0dab0f3f2ff0	000e0000-556f-12cc-79f2-accd9cfeb7da	1	
00200000-556f-12cc-646d-85b9d5bc0919	000e0000-556f-12cc-79f2-accd9cfeb7da	2	
\.


--
-- TOC entry 2808 (class 0 OID 6212033)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6212102)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6211940)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6212207)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556f-12cb-41b6-f3332ad2bd93	Drama	drama (SURS 01)
00140000-556f-12cb-60cd-0779a4cba4cc	Opera	opera (SURS 02)
00140000-556f-12cb-83be-e32effc5635b	Balet	balet (SURS 03)
00140000-556f-12cb-9b62-45ad62f9d1d0	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556f-12cb-12d0-6e6c05764525	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556f-12cb-896b-c7fd1ea2c658	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556f-12cb-3ca6-51a7d456bf75	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2814 (class 0 OID 6212092)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556f-12cb-b203-e27ced3dde89	Opera	opera
00150000-556f-12cb-3327-84aab76a7fab	Opereta	opereta
00150000-556f-12cb-c482-36ea20991867	Balet	balet
00150000-556f-12cb-7db7-ff6f2462ca96	Plesne prireditve	plesne prireditve
00150000-556f-12cb-b8f5-ab78132d2b94	Lutkovno gledališče	lutkovno gledališče
00150000-556f-12cb-c4ea-34b6bbbe9acf	Raziskovalno gledališče	raziskovalno gledališče
00150000-556f-12cb-8e9b-f4c5cf174fc2	Biografska drama	biografska drama
00150000-556f-12cb-07cd-05bf98426bed	Komedija	komedija
00150000-556f-12cb-2bc3-9dba3c1605d4	Črna komedija	črna komedija
00150000-556f-12cb-c77f-121a65136f62	E-igra	E-igra
00150000-556f-12cb-43e1-64c1d37a7d04	Kriminalka	kriminalka
00150000-556f-12cb-43fd-37dfbc012827	Musical	musical
\.


--
-- TOC entry 2368 (class 2606 OID 6211746)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6212262)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6212252)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6212160)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 6211930)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 6211955)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 6211872)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 6212291)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 6212088)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6211906)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6211949)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6211886)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6211998)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 6212025)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 6211844)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6211755)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2375 (class 2606 OID 6211779)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6211735)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2359 (class 2606 OID 6211720)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6212031)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6212064)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6212202)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 6211808)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6211832)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 6212004)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 6211822)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6211893)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6212016)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6212144)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6212188)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6212302)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6212327)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6212309)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 6212048)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6211989)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6211980)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6212182)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6212116)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 6211691)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6212055)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6211709)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2361 (class 2606 OID 6211729)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 6212073)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6212011)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 6211961)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6212351)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 6212339)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 6212333)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6212129)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6211788)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 6211971)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6212171)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6212322)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 6211857)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6211704)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6212232)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6211915)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 6212039)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6212107)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 6211944)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6212216)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6212101)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 1259 OID 6211937)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2507 (class 1259 OID 6212130)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6212131)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 6211810)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2341 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2342 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2343 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2473 (class 1259 OID 6212032)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2467 (class 1259 OID 6212018)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2468 (class 1259 OID 6212017)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2419 (class 1259 OID 6211916)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2495 (class 1259 OID 6212089)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2496 (class 1259 OID 6212091)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2497 (class 1259 OID 6212090)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2407 (class 1259 OID 6211888)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 6211887)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2525 (class 1259 OID 6212204)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 6212205)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6212206)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2533 (class 1259 OID 6212237)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2534 (class 1259 OID 6212234)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2535 (class 1259 OID 6212236)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2536 (class 1259 OID 6212235)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2397 (class 1259 OID 6211859)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 6211858)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2373 (class 1259 OID 6211782)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2483 (class 1259 OID 6212056)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2437 (class 1259 OID 6211950)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2363 (class 1259 OID 6211736)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2364 (class 1259 OID 6211737)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2488 (class 1259 OID 6212076)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2489 (class 1259 OID 6212075)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2490 (class 1259 OID 6212074)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2411 (class 1259 OID 6211894)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 6211896)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2413 (class 1259 OID 6211895)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2571 (class 1259 OID 6212341)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2447 (class 1259 OID 6211984)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2448 (class 1259 OID 6211982)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2449 (class 1259 OID 6211981)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2450 (class 1259 OID 6211983)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2354 (class 1259 OID 6211710)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2355 (class 1259 OID 6211711)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2476 (class 1259 OID 6212040)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2462 (class 1259 OID 6212005)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2503 (class 1259 OID 6212117)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2504 (class 1259 OID 6212118)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 6212292)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 6212294)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2556 (class 1259 OID 6212293)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2386 (class 1259 OID 6211824)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 6211823)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2388 (class 1259 OID 6211825)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 6212328)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2511 (class 1259 OID 6212145)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2512 (class 1259 OID 6212146)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2546 (class 1259 OID 6212266)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 6212265)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2548 (class 1259 OID 6212268)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2549 (class 1259 OID 6212264)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2550 (class 1259 OID 6212267)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2500 (class 1259 OID 6212108)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2453 (class 1259 OID 6211993)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2454 (class 1259 OID 6211992)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2455 (class 1259 OID 6211990)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2456 (class 1259 OID 6211991)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2542 (class 1259 OID 6212254)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2543 (class 1259 OID 6212253)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2557 (class 1259 OID 6212303)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2418 (class 1259 OID 6211907)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2369 (class 1259 OID 6211757)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6211756)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2378 (class 1259 OID 6211789)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2379 (class 1259 OID 6211790)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2442 (class 1259 OID 6211974)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6211973)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2444 (class 1259 OID 6211972)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2560 (class 1259 OID 6212311)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2561 (class 1259 OID 6212310)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 6211939)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2426 (class 1259 OID 6211935)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2427 (class 1259 OID 6211932)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2428 (class 1259 OID 6211933)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2429 (class 1259 OID 6211931)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2430 (class 1259 OID 6211936)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2431 (class 1259 OID 6211934)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2385 (class 1259 OID 6211809)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2403 (class 1259 OID 6211873)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2404 (class 1259 OID 6211875)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2405 (class 1259 OID 6211874)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2406 (class 1259 OID 6211876)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2461 (class 1259 OID 6211999)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6212203)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 6212233)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2376 (class 1259 OID 6211780)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2377 (class 1259 OID 6211781)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2577 (class 1259 OID 6212352)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2396 (class 1259 OID 6211845)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2574 (class 1259 OID 6212340)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2481 (class 1259 OID 6212050)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2482 (class 1259 OID 6212049)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 6212263)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2340 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2393 (class 1259 OID 6211833)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 6212189)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 6212190)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2362 (class 1259 OID 6211730)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2432 (class 1259 OID 6211938)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2603 (class 2606 OID 6212494)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2606 (class 2606 OID 6212479)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2605 (class 2606 OID 6212484)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2601 (class 2606 OID 6212504)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2607 (class 2606 OID 6212474)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2602 (class 2606 OID 6212499)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2604 (class 2606 OID 6212489)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2637 (class 2606 OID 6212649)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6212654)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6212409)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2624 (class 2606 OID 6212589)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2622 (class 2606 OID 6212584)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2623 (class 2606 OID 6212579)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2600 (class 2606 OID 6212469)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6212619)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6212629)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2631 (class 2606 OID 6212624)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2594 (class 2606 OID 6212444)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6212439)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2620 (class 2606 OID 6212569)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 6212674)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 6212679)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6212684)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2644 (class 2606 OID 6212704)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2647 (class 2606 OID 6212689)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2645 (class 2606 OID 6212699)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2646 (class 2606 OID 6212694)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2592 (class 2606 OID 6212434)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6212429)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6212394)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2585 (class 2606 OID 6212389)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 6212599)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2608 (class 2606 OID 6212509)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2581 (class 2606 OID 6212369)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2580 (class 2606 OID 6212374)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2627 (class 2606 OID 6212614)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2628 (class 2606 OID 6212609)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2629 (class 2606 OID 6212604)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2598 (class 2606 OID 6212449)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2596 (class 2606 OID 6212459)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2597 (class 2606 OID 6212454)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2662 (class 2606 OID 6212779)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2612 (class 2606 OID 6212544)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2614 (class 2606 OID 6212534)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2615 (class 2606 OID 6212529)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2613 (class 2606 OID 6212539)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2579 (class 2606 OID 6212359)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2578 (class 2606 OID 6212364)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2625 (class 2606 OID 6212594)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2621 (class 2606 OID 6212574)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2635 (class 2606 OID 6212639)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2634 (class 2606 OID 6212644)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6212744)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6212754)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2656 (class 2606 OID 6212749)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2590 (class 2606 OID 6212419)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6212414)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6212424)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6212774)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2639 (class 2606 OID 6212659)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6212664)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2652 (class 2606 OID 6212729)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6212724)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2650 (class 2606 OID 6212739)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2654 (class 2606 OID 6212719)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2651 (class 2606 OID 6212734)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2633 (class 2606 OID 6212634)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6212564)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2617 (class 2606 OID 6212559)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2619 (class 2606 OID 6212549)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2618 (class 2606 OID 6212554)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2648 (class 2606 OID 6212714)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2649 (class 2606 OID 6212709)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 6212759)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2599 (class 2606 OID 6212464)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2640 (class 2606 OID 6212669)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6212384)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2583 (class 2606 OID 6212379)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2587 (class 2606 OID 6212399)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2586 (class 2606 OID 6212404)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6212524)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2610 (class 2606 OID 6212519)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2611 (class 2606 OID 6212514)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2659 (class 2606 OID 6212769)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 6212764)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-03 16:44:29 CEST

--
-- PostgreSQL database dump complete
--

