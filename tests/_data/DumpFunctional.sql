--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-05 15:40:29 CEST

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
-- TOC entry 180 (class 1259 OID 6465758)
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
-- TOC entry 227 (class 1259 OID 6466281)
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
-- TOC entry 226 (class 1259 OID 6466264)
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
-- TOC entry 219 (class 1259 OID 6466167)
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
-- TOC entry 194 (class 1259 OID 6465937)
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
-- TOC entry 197 (class 1259 OID 6465971)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6465880)
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
-- TOC entry 228 (class 1259 OID 6466295)
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
-- TOC entry 213 (class 1259 OID 6466097)
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
-- TOC entry 192 (class 1259 OID 6465917)
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
-- TOC entry 196 (class 1259 OID 6465965)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6465897)
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
-- TOC entry 202 (class 1259 OID 6466014)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6466039)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6465854)
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
-- TOC entry 181 (class 1259 OID 6465767)
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
-- TOC entry 182 (class 1259 OID 6465778)
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
-- TOC entry 177 (class 1259 OID 6465732)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6465751)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6466046)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6466077)
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
-- TOC entry 223 (class 1259 OID 6466215)
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
-- TOC entry 184 (class 1259 OID 6465811)
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
-- TOC entry 186 (class 1259 OID 6465846)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6466020)
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
-- TOC entry 185 (class 1259 OID 6465831)
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
-- TOC entry 191 (class 1259 OID 6465909)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6466032)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6466152)
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
-- TOC entry 222 (class 1259 OID 6466207)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6466321)
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
-- TOC entry 232 (class 1259 OID 6466349)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6466383)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6466330)
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
-- TOC entry 236 (class 1259 OID 6466379)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6466061)
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
-- TOC entry 201 (class 1259 OID 6466005)
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
-- TOC entry 200 (class 1259 OID 6465995)
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
-- TOC entry 221 (class 1259 OID 6466196)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6466129)
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
-- TOC entry 174 (class 1259 OID 6465703)
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
-- TOC entry 173 (class 1259 OID 6465701)
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
-- TOC entry 210 (class 1259 OID 6466071)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6465741)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6465725)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6466085)
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
-- TOC entry 204 (class 1259 OID 6466026)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6465976)
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
-- TOC entry 235 (class 1259 OID 6466368)
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
-- TOC entry 234 (class 1259 OID 6466360)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6466355)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6466139)
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
-- TOC entry 183 (class 1259 OID 6465803)
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
-- TOC entry 199 (class 1259 OID 6465982)
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
-- TOC entry 220 (class 1259 OID 6466185)
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
-- TOC entry 231 (class 1259 OID 6466338)
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
-- TOC entry 237 (class 1259 OID 6466381)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6465866)
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
-- TOC entry 175 (class 1259 OID 6465712)
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
-- TOC entry 225 (class 1259 OID 6466242)
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
-- TOC entry 193 (class 1259 OID 6465928)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6466053)
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
-- TOC entry 215 (class 1259 OID 6466122)
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
-- TOC entry 195 (class 1259 OID 6465960)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6466232)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6466112)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6465706)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2786 (class 0 OID 6465758)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6466281)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5571-a6cc-82a8-6097eb752488	000d0000-5571-a6cc-d0eb-ac354727fe94	\N	00090000-5571-a6cc-a4a8-792d49b7443e	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-a6cc-9964-eaeb4f79081d	000d0000-5571-a6cc-91e3-044b33357930	\N	00090000-5571-a6cc-84ee-b21e979f7c4b	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-a6cc-eea1-fca0c6f279c4	000d0000-5571-a6cc-6337-7770a533bad3	\N	00090000-5571-a6cc-2d7c-fe65285814d0	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-a6cc-a3ec-07abe0e44287	000d0000-5571-a6cc-09ba-0265de0d1c13	\N	00090000-5571-a6cc-4931-d511fc152e9e	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-a6cc-2f2b-c3d40d74e77c	000d0000-5571-a6cc-a64d-2dc8300135b6	\N	00090000-5571-a6cc-7857-7bdc027ac710	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-a6cc-2ab6-cc036a3b6700	000d0000-5571-a6cc-1f3b-860134b79f36	\N	00090000-5571-a6cc-84ee-b21e979f7c4b	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2832 (class 0 OID 6466264)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6466167)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5571-a6cc-8a38-749e423fe3c6	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5571-a6cc-1865-8e2449e31a5f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5571-a6cc-3d2b-68b80143199b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2800 (class 0 OID 6465937)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5571-a6cc-d957-7bf5bcb0e685	\N	\N	00200000-5571-a6cc-81d9-085cdb204f57	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5571-a6cc-cca3-86ed0815d112	\N	\N	00200000-5571-a6cc-0ebc-bc064a39174a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5571-a6cc-84b8-48d284740945	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5571-a6cc-7f00-1104529e73a0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5571-a6cc-275b-1ad40a54d390	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2803 (class 0 OID 6465971)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6465880)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5571-a6cb-2439-bfa2452646f7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5571-a6cb-a921-7f000de308a5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5571-a6cb-d73e-32a213a7f5b4	AL	ALB	008	Albania 	Albanija	\N
00040000-5571-a6cb-0415-4a5c545db18d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5571-a6cb-6747-64906205604d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5571-a6cb-a5c7-343c42a188fa	AD	AND	020	Andorra 	Andora	\N
00040000-5571-a6cb-f5e1-ee67fa776554	AO	AGO	024	Angola 	Angola	\N
00040000-5571-a6cb-b989-df85da29ac04	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5571-a6cb-7d75-b5a574fcbcd2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5571-a6cb-3621-036dcb563986	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-a6cb-d310-21f36a4102f1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5571-a6cb-0c3f-31728c69f59c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5571-a6cb-b025-0bca1e8af7ac	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5571-a6cb-3fa9-04975e37b51f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5571-a6cb-e744-0b73a44afe72	AT	AUT	040	Austria 	Avstrija	\N
00040000-5571-a6cb-6086-0421ca8b8bea	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5571-a6cb-eede-8511fbbd960f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5571-a6cb-37d0-ff94c63c38d4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5571-a6cb-5505-013c9a4232c5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5571-a6cb-fe6d-5b6fb1c4615c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5571-a6cb-370f-bd0bab8e09b3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5571-a6cb-9251-be49d79c0a33	BE	BEL	056	Belgium 	Belgija	\N
00040000-5571-a6cb-06b1-78934e60466a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5571-a6cb-9970-a786dcd0f703	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5571-a6cb-e27d-bacb29e0a1fb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5571-a6cb-f5a0-e4b9c64ff6b0	BT	BTN	064	Bhutan 	Butan	\N
00040000-5571-a6cb-65f8-bf66511abd7a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5571-a6cb-aa92-026518f395ba	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5571-a6cb-9c1d-c2b3b36a7263	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5571-a6cb-51ba-b2f3fc4771f6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5571-a6cb-f233-4dd00e56a798	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5571-a6cb-3d68-468578ad48c9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5571-a6cb-dce4-b40a40539c34	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5571-a6cb-e9c8-e44fac6e7ea9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5571-a6cb-f79d-22afeccc15e4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5571-a6cb-081f-9475486fff35	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5571-a6cb-7e73-c2432fb9663d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5571-a6cb-e53b-edb998118e5e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5571-a6cb-1a01-7133cb6b394b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5571-a6cb-88a4-f1a5c46445eb	CA	CAN	124	Canada 	Kanada	\N
00040000-5571-a6cb-8e57-3b42fb9206b5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5571-a6cb-b9a1-7bc1bbc56172	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5571-a6cb-b1e9-d12ef41dd840	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5571-a6cb-8699-27afd5f8e90e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5571-a6cb-9040-224bec23925a	CL	CHL	152	Chile 	Čile	\N
00040000-5571-a6cb-a720-633a62c8206c	CN	CHN	156	China 	Kitajska	\N
00040000-5571-a6cb-2ea6-da824ca2301e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5571-a6cb-b80f-c0ca860c4fec	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5571-a6cb-1868-e6d5457bc08e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5571-a6cb-66be-871584ffd9cd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5571-a6cb-38c6-493553b172f1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5571-a6cb-db49-3b9e234e6d9f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5571-a6cb-bc29-0ea25dc4f14c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5571-a6cb-bf4e-3728c3335755	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5571-a6cb-c90b-e468ea6052e9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5571-a6cb-6e38-ce77b4577217	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5571-a6cb-13c8-b32dc88ec471	CU	CUB	192	Cuba 	Kuba	\N
00040000-5571-a6cb-fc93-da65948ada2c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5571-a6cb-391c-b3198de3e7a7	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5571-a6cb-816c-7c90161173b5	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5571-a6cb-a6ea-0e1f3653cbdd	DK	DNK	208	Denmark 	Danska	\N
00040000-5571-a6cb-8f53-3b25a89f2fae	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5571-a6cb-6484-95bb3f9631f8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-a6cb-1e34-7b48fef48210	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5571-a6cb-575f-4e09b0b39639	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5571-a6cb-a417-1dfa30aa2139	EG	EGY	818	Egypt 	Egipt	\N
00040000-5571-a6cb-e941-05c702843bfd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5571-a6cb-f183-cc7726d06b6f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5571-a6cb-11b7-a4a211151d37	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5571-a6cb-185e-98af9d4d147a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5571-a6cb-f443-fba714e6aba3	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5571-a6cb-7ce3-25884b05fb0f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5571-a6cb-c987-b366168c4a9b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5571-a6cb-c653-da80366fc271	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5571-a6cb-8887-a9c5dbcf9a52	FI	FIN	246	Finland 	Finska	\N
00040000-5571-a6cb-6621-4128864da84c	FR	FRA	250	France 	Francija	\N
00040000-5571-a6cb-49cb-4c485f46baed	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5571-a6cb-895a-68f736b420be	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5571-a6cb-71ff-792767181181	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5571-a6cb-e9f7-a81d96a6cea9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5571-a6cb-cf3c-24462de21778	GA	GAB	266	Gabon 	Gabon	\N
00040000-5571-a6cb-f0ae-90371d84f42a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5571-a6cb-9683-31a48998fa0f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5571-a6cb-5547-738fdf3d75f9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5571-a6cb-9b83-85e4164f1a4a	GH	GHA	288	Ghana 	Gana	\N
00040000-5571-a6cb-d682-8a4e2e1cee16	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5571-a6cb-20f8-e90383847979	GR	GRC	300	Greece 	Grčija	\N
00040000-5571-a6cb-b7c1-d1a6a8b4660a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5571-a6cb-db9f-c47d2a8d1102	GD	GRD	308	Grenada 	Grenada	\N
00040000-5571-a6cb-e417-ca5ac1b37ce5	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5571-a6cb-6909-c09d756eaf54	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5571-a6cb-a94b-633be0de7bbe	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5571-a6cb-7dae-47320728bb43	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5571-a6cb-ac11-6f38827ed279	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5571-a6cb-e6c3-ceb943b6c5d6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5571-a6cb-7025-4c4945042a2c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5571-a6cb-0ee8-b7b97603a525	HT	HTI	332	Haiti 	Haiti	\N
00040000-5571-a6cb-3bda-5f646dcc2de3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5571-a6cb-dc00-196a8f7cc842	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5571-a6cb-0a75-462a1f0934d6	HN	HND	340	Honduras 	Honduras	\N
00040000-5571-a6cb-e342-6fbee44907b4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5571-a6cb-01cb-fcad2d476ccc	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5571-a6cb-8315-3214b9ca881d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5571-a6cb-7329-80cf3545866d	IN	IND	356	India 	Indija	\N
00040000-5571-a6cb-bc0e-804a16535418	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5571-a6cb-55b0-f0ceddc2fc62	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5571-a6cb-0505-940853b08b8c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5571-a6cb-fbe1-999134dc131e	IE	IRL	372	Ireland 	Irska	\N
00040000-5571-a6cb-2653-5897e77f7aad	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5571-a6cb-6bb2-3cb4b15686ae	IL	ISR	376	Israel 	Izrael	\N
00040000-5571-a6cb-57ca-2b12a8dfa50a	IT	ITA	380	Italy 	Italija	\N
00040000-5571-a6cb-b179-417a6bc4c271	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5571-a6cb-1318-f095da327df2	JP	JPN	392	Japan 	Japonska	\N
00040000-5571-a6cb-bb60-44c8b1a7b991	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5571-a6cb-e4e6-da7756f6dcd2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5571-a6cb-22b7-d1ef4e03d233	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5571-a6cb-8daa-f6091d4da217	KE	KEN	404	Kenya 	Kenija	\N
00040000-5571-a6cb-8f56-485032dfd508	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5571-a6cb-7e35-604c4e1f3d2e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5571-a6cb-3524-055de846b417	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5571-a6cb-1e26-ab81fbcb1aff	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5571-a6cb-f5a7-9d2cdacab928	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5571-a6cb-f7d6-1154d0cf4d2a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5571-a6cb-4d5e-c739a21d8bd9	LV	LVA	428	Latvia 	Latvija	\N
00040000-5571-a6cb-4f70-74fc9ef15f97	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5571-a6cb-c807-81fd89d96bc4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5571-a6cb-7d88-5d44dd9d3d2b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5571-a6cb-7da2-7cdcc3f5ae24	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5571-a6cb-0923-c0f87465d7f7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5571-a6cb-8aa1-fd153b0695cc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5571-a6cb-5689-ee42db72f038	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5571-a6cb-1c3a-2631395d4ed1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5571-a6cb-bf5e-49c092e99ff5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5571-a6cb-f3c7-9f5f128e80aa	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5571-a6cb-3715-6656b3a3d72d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5571-a6cb-5119-da9f0609ce41	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5571-a6cb-88c8-04fb42bb439e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5571-a6cb-f39f-84f46daf2aee	ML	MLI	466	Mali 	Mali	\N
00040000-5571-a6cb-d258-053d414562fe	MT	MLT	470	Malta 	Malta	\N
00040000-5571-a6cb-4224-ee67e5369a37	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5571-a6cb-a06d-9cb2fc47b7ee	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5571-a6cb-93f6-d2f402890242	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5571-a6cb-61eb-6f511f24ba78	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5571-a6cb-8cb8-61f714753372	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5571-a6cb-8134-280353de9445	MX	MEX	484	Mexico 	Mehika	\N
00040000-5571-a6cb-ede7-678014d6b5ca	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5571-a6cb-4a5e-9e86074417d7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5571-a6cb-32f2-2cbf5754e62a	MC	MCO	492	Monaco 	Monako	\N
00040000-5571-a6cb-7530-5e43c100e9ab	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5571-a6cb-8445-ec1d41befccf	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5571-a6cb-0da0-899bd36d96ea	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5571-a6cb-814d-fadd3f49cdcb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5571-a6cb-b975-16433bb78fa5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5571-a6cb-8439-25ac3acd9a42	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5571-a6cb-cdc8-6e5eb322b767	NA	NAM	516	Namibia 	Namibija	\N
00040000-5571-a6cb-6b86-92eba6cb7a6d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5571-a6cb-feae-bd1110fbd183	NP	NPL	524	Nepal 	Nepal	\N
00040000-5571-a6cb-10bf-5c8d73ea9b92	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5571-a6cb-5fe3-d0da7753ec18	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5571-a6cb-cbc2-6ab2aa587450	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5571-a6cb-dcc7-80f7d192edeb	NE	NER	562	Niger 	Niger 	\N
00040000-5571-a6cb-7aa9-00ef2672ba36	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5571-a6cb-f1ab-6c1d256f6432	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5571-a6cb-30ed-1512c342c0c5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5571-a6cb-69dc-285634617211	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5571-a6cb-7d70-4ab4f72a5dd6	NO	NOR	578	Norway 	Norveška	\N
00040000-5571-a6cb-023e-c83fe1d10e7f	OM	OMN	512	Oman 	Oman	\N
00040000-5571-a6cb-56e6-f653554cda4f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5571-a6cb-e44a-9b1c47a371e1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5571-a6cb-9e0d-e05694242659	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5571-a6cb-6e31-00f587b14703	PA	PAN	591	Panama 	Panama	\N
00040000-5571-a6cb-a595-1972ec0a011e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5571-a6cb-88be-9d9dc4e49ee9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5571-a6cb-2001-2fbe5f9894f4	PE	PER	604	Peru 	Peru	\N
00040000-5571-a6cb-11fb-df8dbbb3ba25	PH	PHL	608	Philippines 	Filipini	\N
00040000-5571-a6cb-378a-c362b5641b1b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5571-a6cb-aa57-f0c84809a7dd	PL	POL	616	Poland 	Poljska	\N
00040000-5571-a6cb-1d2f-810332f5e607	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5571-a6cb-f925-4d48b6e4e0c6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5571-a6cb-1488-8588da92006f	QA	QAT	634	Qatar 	Katar	\N
00040000-5571-a6cb-472b-dd615be09c75	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5571-a6cb-fe8a-dd1a09f8cc5b	RO	ROU	642	Romania 	Romunija	\N
00040000-5571-a6cb-b06f-1aa1684ab014	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5571-a6cb-d80e-83adc761f690	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5571-a6cb-65e7-a31efc335c49	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5571-a6cb-367f-f85e3eb2b459	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5571-a6cb-ad8e-db0692d2f06d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5571-a6cb-1383-a6bb25893688	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5571-a6cb-2aeb-cf7e477b49d5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5571-a6cb-f92c-709fcc2ba9d9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5571-a6cb-1ebe-bf6be2965b17	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5571-a6cb-0996-3ce79d6b88f2	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5571-a6cb-edc5-654d1995548d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5571-a6cb-1e80-f6eb343caeb3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5571-a6cb-c13e-0dd7991112a7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5571-a6cb-a1f7-8f444d2a9fc2	SN	SEN	686	Senegal 	Senegal	\N
00040000-5571-a6cb-6991-7fc608378128	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5571-a6cb-5c30-2675749cbec9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5571-a6cb-33ac-360ab391782b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5571-a6cb-2642-dff94be69f86	SG	SGP	702	Singapore 	Singapur	\N
00040000-5571-a6cb-218c-b1c40f047282	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5571-a6cb-af27-b80a027b5524	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5571-a6cb-0b50-247f39a051cd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5571-a6cb-240e-3b2123313671	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5571-a6cb-199a-5c016cc3b248	SO	SOM	706	Somalia 	Somalija	\N
00040000-5571-a6cb-a48a-ad0b04b01984	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5571-a6cb-9b5e-385e7108f55e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5571-a6cb-556a-50c1ca8c8f22	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5571-a6cb-f28f-de39825490bb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5571-a6cb-fb09-17b274064f20	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5571-a6cb-109e-5aea997a5112	SD	SDN	729	Sudan 	Sudan	\N
00040000-5571-a6cb-1524-2af8abbab1f7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5571-a6cb-561f-52dc5481d918	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5571-a6cb-ed5b-df9ff7d1a467	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5571-a6cb-2a2d-382da97b14d0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5571-a6cb-3c54-357852890338	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5571-a6cb-987f-bb4c4fa7f130	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5571-a6cb-66ff-04b269548e6a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5571-a6cb-e563-d26ed812ccca	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5571-a6cb-0f93-90fe99186405	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5571-a6cb-fff6-eeef6564bec4	TH	THA	764	Thailand 	Tajska	\N
00040000-5571-a6cb-3856-4158356ae10c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5571-a6cb-6247-37dc0e43a219	TG	TGO	768	Togo 	Togo	\N
00040000-5571-a6cb-2664-315948a001d3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5571-a6cb-608c-47e4e1bafc3a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5571-a6cb-0bd3-1754c78018e9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5571-a6cb-b61e-e8be6395f691	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5571-a6cb-1552-c39ad0887b2d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5571-a6cb-7c27-50e6bc394605	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5571-a6cb-df65-942e130c2fe0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-a6cb-0563-8c35103c42c2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5571-a6cb-1252-5faf50d736cf	UG	UGA	800	Uganda 	Uganda	\N
00040000-5571-a6cb-a085-e0b3b6ba5f7a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5571-a6cb-b8fb-c74518d0ae5e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5571-a6cb-75a2-c6d02311a968	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5571-a6cb-2d52-0b18ff111b1a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5571-a6cb-13e6-68387712a12c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5571-a6cb-2b70-8ce9f72119b6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5571-a6cb-182c-8691f743cc76	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5571-a6cb-4cd6-f0f164e8ca4f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5571-a6cb-ff60-a7b6af43776b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5571-a6cb-113f-a8d6cedcf403	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5571-a6cb-36bd-945889cdff40	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-a6cb-bc00-6c48f4482234	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5571-a6cb-3981-c77453f30b35	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5571-a6cb-9ff7-05b0087414c3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5571-a6cb-8f52-d0a4f93fbcfe	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5571-a6cb-16db-3d35c246a26b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5571-a6cb-753e-5fc2f77a88ab	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2834 (class 0 OID 6466295)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6466097)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5571-a6cc-5725-6fc4b9cb03f6	000e0000-5571-a6cc-b397-328e25f979c2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5571-a6cb-594c-d25a0d271147
000d0000-5571-a6cc-d0eb-ac354727fe94	000e0000-5571-a6cc-b397-328e25f979c2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-a6cb-594c-d25a0d271147
000d0000-5571-a6cc-91e3-044b33357930	000e0000-5571-a6cc-b397-328e25f979c2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5571-a6cb-4c19-6b8d8c16d493
000d0000-5571-a6cc-6337-7770a533bad3	000e0000-5571-a6cc-b397-328e25f979c2	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5571-a6cb-6a27-e1843bd11940
000d0000-5571-a6cc-09ba-0265de0d1c13	000e0000-5571-a6cc-b397-328e25f979c2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5571-a6cb-6a27-e1843bd11940
000d0000-5571-a6cc-a64d-2dc8300135b6	000e0000-5571-a6cc-b397-328e25f979c2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5571-a6cb-6a27-e1843bd11940
000d0000-5571-a6cc-1f3b-860134b79f36	000e0000-5571-a6cc-b397-328e25f979c2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-a6cb-594c-d25a0d271147
\.


--
-- TOC entry 2798 (class 0 OID 6465917)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6465965)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6465897)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00000000-5571-a6cc-71bc-825db02ada0b	00080000-5571-a6cc-c361-d6c4b186024e	00090000-5571-a6cc-a4a8-792d49b7443e	AK		
\.


--
-- TOC entry 2776 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6466014)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6466039)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6465854)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5571-a6cc-75c8-a330ea44435f	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5571-a6cc-2cbb-50928abc6ba5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5571-a6cc-8667-cc484d82a9e5	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5571-a6cc-3d36-cabb47d0cb50	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5571-a6cc-0176-2fdedbd91576	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5571-a6cc-f6a8-ec2613c44508	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5571-a6cc-b37d-87143cb1ca50	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5571-a6cc-2393-a49287c81898	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5571-a6cc-a69f-4e510ac7e102	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5571-a6cc-9bc3-342e66fefa45	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5571-a6cc-ec5f-746bde80f573	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5571-a6cc-85a7-04a443814c02	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5571-a6cc-9543-4eb3308c17de	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-a6cc-3177-5fd167cc83a5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-a6cc-0e4c-9df8bd488974	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5571-a6cc-15f6-fb4ae2e79273	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2787 (class 0 OID 6465767)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5571-a6cc-bbab-c745a5664497	00000000-5571-a6cc-0176-2fdedbd91576	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5571-a6cc-8847-8a2aae4cf167	00000000-5571-a6cc-0176-2fdedbd91576	00010000-5571-a6cc-2308-597d9b961d05	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5571-a6cc-9bb5-3b88af5583b2	00000000-5571-a6cc-f6a8-ec2613c44508	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2788 (class 0 OID 6465778)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5571-a6cc-9325-b25223bd5fbf	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5571-a6cc-4931-d511fc152e9e	00010000-5571-a6cc-05f9-a68d2106f8f4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5571-a6cc-2d7c-fe65285814d0	00010000-5571-a6cc-b768-288e101bb432	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5571-a6cc-ca74-517fe7a598f3	00010000-5571-a6cc-99a3-169b08a3a137	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5571-a6cc-5717-403eea26bbbc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5571-a6cc-00ca-a09caf7ecfad	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5571-a6cc-450d-9921e7aa5875	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5571-a6cc-ac86-738f65781d03	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5571-a6cc-a4a8-792d49b7443e	00010000-5571-a6cc-f566-38cfc43bcf4d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5571-a6cc-84ee-b21e979f7c4b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5571-a6cc-3f6b-7141c7a048c2	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5571-a6cc-7857-7bdc027ac710	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5571-a6cc-6127-39d2a4a48815	00010000-5571-a6cc-631c-59c4efba20ce	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2778 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6465732)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5571-a6cb-a3d6-e9d50a0d4557	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5571-a6cb-7db6-c9fab2e878c1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5571-a6cb-e2c7-afefb93e11bf	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5571-a6cb-ddf2-f1c71e031adf	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5571-a6cb-c4c6-b7c4594e3c2d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5571-a6cb-91fd-b4909c5bbd47	Abonma-read	Abonma - branje	f
00030000-5571-a6cb-7a24-1807df48347f	Abonma-write	Abonma - spreminjanje	f
00030000-5571-a6cb-b970-6c29383d2fb3	Alternacija-read	Alternacija - branje	f
00030000-5571-a6cb-75b6-29efb8e48000	Alternacija-write	Alternacija - spreminjanje	f
00030000-5571-a6cb-de63-99423cb69f39	Arhivalija-read	Arhivalija - branje	f
00030000-5571-a6cb-233f-ed85e294fecb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5571-a6cb-a279-eee3e806ef39	Besedilo-read	Besedilo - branje	f
00030000-5571-a6cb-c83a-67119437a39f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5571-a6cb-8a85-f2f00b4e9e4d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5571-a6cb-6904-bfc3353839fd	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5571-a6cb-86cb-52dd960dd239	Dogodek-read	Dogodek - branje	f
00030000-5571-a6cb-2240-c83a0cdff7df	Dogodek-write	Dogodek - spreminjanje	f
00030000-5571-a6cb-dc5e-f58ab1d94d5e	Drzava-read	Drzava - branje	f
00030000-5571-a6cb-26e8-88c4fbe506d4	Drzava-write	Drzava - spreminjanje	f
00030000-5571-a6cb-d244-919b31a55bff	Funkcija-read	Funkcija - branje	f
00030000-5571-a6cb-5ce6-082b5931de10	Funkcija-write	Funkcija - spreminjanje	f
00030000-5571-a6cb-dd3e-ba1668e83f49	Gostovanje-read	Gostovanje - branje	f
00030000-5571-a6cb-55ef-06c1a9b37f4f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5571-a6cb-e784-cfaaf03c68db	Gostujoca-read	Gostujoca - branje	f
00030000-5571-a6cb-0d98-47a85057d51e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5571-a6cb-2ac0-d7926660479e	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5571-a6cb-2286-716cfcc16b99	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5571-a6cb-1d81-0d53eb964706	Kupec-read	Kupec - branje	f
00030000-5571-a6cb-8725-42615fb160c5	Kupec-write	Kupec - spreminjanje	f
00030000-5571-a6cb-fac3-9c1a07131ea7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5571-a6cb-91b4-a967ac486b72	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5571-a6cb-4089-7890027d59e1	Option-read	Option - branje	f
00030000-5571-a6cb-00a6-f9d3054d63fc	Option-write	Option - spreminjanje	f
00030000-5571-a6cb-2846-3692e5a4231e	OptionValue-read	OptionValue - branje	f
00030000-5571-a6cb-9388-d2e2af2193ac	OptionValue-write	OptionValue - spreminjanje	f
00030000-5571-a6cb-2282-a4fefc9e9c5d	Oseba-read	Oseba - branje	f
00030000-5571-a6cb-3be2-68a5405520d3	Oseba-write	Oseba - spreminjanje	f
00030000-5571-a6cb-6b44-fab5791d0e90	Permission-read	Permission - branje	f
00030000-5571-a6cb-83be-6f8980b33d79	Permission-write	Permission - spreminjanje	f
00030000-5571-a6cb-3cd9-18e7e157dac8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5571-a6cb-131e-0ad05cf8cc06	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5571-a6cb-3f42-b0a2e4da4e24	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5571-a6cb-51e6-c82b81d5b968	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5571-a6cb-1262-3431a5b10999	Pogodba-read	Pogodba - branje	f
00030000-5571-a6cb-132d-67dfb795c76f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5571-a6cb-2130-496c9a255dd2	Popa-read	Popa - branje	f
00030000-5571-a6cb-c3d0-6689211be733	Popa-write	Popa - spreminjanje	f
00030000-5571-a6cb-dafc-27834a7757ef	Posta-read	Posta - branje	f
00030000-5571-a6cb-01ca-29cd73889fd0	Posta-write	Posta - spreminjanje	f
00030000-5571-a6cb-638d-38ef85841f95	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5571-a6cb-849f-4a51f9b28b19	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5571-a6cb-7bbf-79b26cfc9ca1	PostniNaslov-read	PostniNaslov - branje	f
00030000-5571-a6cb-0185-d5177f660728	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5571-a6cb-4d57-0c31d9a0c2f4	Predstava-read	Predstava - branje	f
00030000-5571-a6cb-1480-5886d031927d	Predstava-write	Predstava - spreminjanje	f
00030000-5571-a6cb-911d-4fec9fcfb9c5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5571-a6cb-b1d9-da4bbc66f29e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5571-a6cb-c946-f17200a7c3b6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5571-a6cb-9ba8-410651d463f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5571-a6cb-3ccf-958b578a58b8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5571-a6cb-6b75-246b4cb70e5b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5571-a6cb-be2e-f9c4c2f8c14c	Prostor-read	Prostor - branje	f
00030000-5571-a6cb-0914-9f2921f9f84a	Prostor-write	Prostor - spreminjanje	f
00030000-5571-a6cb-a9e5-753bdf4576b4	Racun-read	Racun - branje	f
00030000-5571-a6cb-fe07-be02ca325213	Racun-write	Racun - spreminjanje	f
00030000-5571-a6cb-757b-367d24dae0f8	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5571-a6cb-83b8-239a439fee38	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5571-a6cb-922d-ca42d7331e7e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5571-a6cb-fec9-335a761d6f77	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5571-a6cb-63ae-79c8390aafcc	Rekvizit-read	Rekvizit - branje	f
00030000-5571-a6cb-2016-578a45313be7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5571-a6cb-855e-2bf980154ab6	Revizija-read	Revizija - branje	f
00030000-5571-a6cb-7ecf-68fe21e57f4b	Revizija-write	Revizija - spreminjanje	f
00030000-5571-a6cb-1874-4cec409ef060	Rezervacija-read	Rezervacija - branje	f
00030000-5571-a6cb-7f74-e8b81dfb384e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5571-a6cb-5241-6d3251b6dcb8	Role-read	Role - branje	f
00030000-5571-a6cb-4264-10e62835fb01	Role-write	Role - spreminjanje	f
00030000-5571-a6cb-72d7-f07d2ce29896	SedezniRed-read	SedezniRed - branje	f
00030000-5571-a6cb-66b5-e9f7272e3c2a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5571-a6cb-1412-c80552726c5a	Sedez-read	Sedez - branje	f
00030000-5571-a6cb-446b-c9986bd49fe6	Sedez-write	Sedez - spreminjanje	f
00030000-5571-a6cb-d1b3-8462f02b988b	Sezona-read	Sezona - branje	f
00030000-5571-a6cb-c61d-5bd15ccded0c	Sezona-write	Sezona - spreminjanje	f
00030000-5571-a6cb-3daf-9b8227af6609	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5571-a6cb-b10b-39fb7abac2a6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5571-a6cb-9584-1553acbbe26e	Stevilcenje-read	Stevilcenje - branje	f
00030000-5571-a6cb-bd92-aa85529e9f3d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5571-a6cb-34ac-9606bbaf6c9b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5571-a6cb-2c63-7d7d543434da	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5571-a6cb-ef49-7a2622f7555f	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5571-a6cb-a785-41fd625e2568	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5571-a6cb-2000-ef3fd88e670e	Telefonska-read	Telefonska - branje	f
00030000-5571-a6cb-3310-a04aa48fe027	Telefonska-write	Telefonska - spreminjanje	f
00030000-5571-a6cb-e6ac-da4b28dad125	TerminStoritve-read	TerminStoritve - branje	f
00030000-5571-a6cb-b7bd-d07f1f7d884d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5571-a6cb-55f6-d249d5a981c5	TipFunkcije-read	TipFunkcije - branje	f
00030000-5571-a6cb-1c35-da2e47f89f1d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5571-a6cb-bcbd-0cfe104c40a4	Trr-read	Trr - branje	f
00030000-5571-a6cb-be7a-e190dea797f9	Trr-write	Trr - spreminjanje	f
00030000-5571-a6cb-80e2-a126d1bcaa65	Uprizoritev-read	Uprizoritev - branje	f
00030000-5571-a6cb-d83d-450883a5c2b8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5571-a6cb-3a49-e5b11581700a	User-read	User - branje	f
00030000-5571-a6cb-6abd-968c586850a1	User-write	User - spreminjanje	f
00030000-5571-a6cb-dd43-e7878b04b105	Vaja-read	Vaja - branje	f
00030000-5571-a6cb-c399-9b1364a1c110	Vaja-write	Vaja - spreminjanje	f
00030000-5571-a6cb-bafb-8d9fbbc5ad47	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5571-a6cb-5f9a-7a46b0b1c2a3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5571-a6cb-78f7-e88f8c955af8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5571-a6cb-3474-3fd6feb44eef	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5571-a6cb-5218-b5debdad5a6b	Zasedenost-read	Zasedenost - branje	f
00030000-5571-a6cb-ab90-d6cc1485a351	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5571-a6cb-fbb8-316a95abd919	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5571-a6cb-293c-066916030053	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5571-a6cb-8d65-383f207a41de	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5571-a6cb-1971-446ee4f90972	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2785 (class 0 OID 6465751)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5571-a6cb-2481-17dbbebd6351	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-91fd-b4909c5bbd47
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-7a24-1807df48347f
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-b970-6c29383d2fb3
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-75b6-29efb8e48000
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-de63-99423cb69f39
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-86cb-52dd960dd239
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-ddf2-f1c71e031adf
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2240-c83a0cdff7df
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-26e8-88c4fbe506d4
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-d244-919b31a55bff
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-5ce6-082b5931de10
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-dd3e-ba1668e83f49
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-55ef-06c1a9b37f4f
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-e784-cfaaf03c68db
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-0d98-47a85057d51e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2ac0-d7926660479e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2286-716cfcc16b99
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-4089-7890027d59e1
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2846-3692e5a4231e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2282-a4fefc9e9c5d
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-3be2-68a5405520d3
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2130-496c9a255dd2
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-c3d0-6689211be733
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-dafc-27834a7757ef
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-01ca-29cd73889fd0
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-7bbf-79b26cfc9ca1
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-0185-d5177f660728
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-4d57-0c31d9a0c2f4
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-1480-5886d031927d
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-3ccf-958b578a58b8
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-6b75-246b4cb70e5b
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-be2e-f9c4c2f8c14c
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-0914-9f2921f9f84a
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-922d-ca42d7331e7e
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-fec9-335a761d6f77
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-63ae-79c8390aafcc
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-2016-578a45313be7
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-d1b3-8462f02b988b
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-c61d-5bd15ccded0c
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-55f6-d249d5a981c5
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-80e2-a126d1bcaa65
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-d83d-450883a5c2b8
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-dd43-e7878b04b105
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-c399-9b1364a1c110
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-5218-b5debdad5a6b
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-ab90-d6cc1485a351
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-fbb8-316a95abd919
00020000-5571-a6cb-c813-20d7cf939901	00030000-5571-a6cb-8d65-383f207a41de
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-91fd-b4909c5bbd47
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-de63-99423cb69f39
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-86cb-52dd960dd239
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-dd3e-ba1668e83f49
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-e784-cfaaf03c68db
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2ac0-d7926660479e
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2286-716cfcc16b99
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-4089-7890027d59e1
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2846-3692e5a4231e
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2282-a4fefc9e9c5d
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-3be2-68a5405520d3
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2130-496c9a255dd2
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-dafc-27834a7757ef
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-7bbf-79b26cfc9ca1
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-0185-d5177f660728
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-4d57-0c31d9a0c2f4
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-be2e-f9c4c2f8c14c
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-922d-ca42d7331e7e
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-63ae-79c8390aafcc
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-d1b3-8462f02b988b
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-2000-ef3fd88e670e
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-3310-a04aa48fe027
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-bcbd-0cfe104c40a4
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-be7a-e190dea797f9
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-78f7-e88f8c955af8
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-3474-3fd6feb44eef
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-fbb8-316a95abd919
00020000-5571-a6cb-7f06-a61d8414db7a	00030000-5571-a6cb-8d65-383f207a41de
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-91fd-b4909c5bbd47
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-b970-6c29383d2fb3
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-de63-99423cb69f39
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-233f-ed85e294fecb
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-a279-eee3e806ef39
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-8a85-f2f00b4e9e4d
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-86cb-52dd960dd239
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-d244-919b31a55bff
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-dd3e-ba1668e83f49
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-e784-cfaaf03c68db
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-2ac0-d7926660479e
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-4089-7890027d59e1
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-2846-3692e5a4231e
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-2282-a4fefc9e9c5d
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-2130-496c9a255dd2
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-dafc-27834a7757ef
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-4d57-0c31d9a0c2f4
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-3ccf-958b578a58b8
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-be2e-f9c4c2f8c14c
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-922d-ca42d7331e7e
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-63ae-79c8390aafcc
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-d1b3-8462f02b988b
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-55f6-d249d5a981c5
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-dd43-e7878b04b105
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-5218-b5debdad5a6b
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-fbb8-316a95abd919
00020000-5571-a6cc-6621-86b3163797c3	00030000-5571-a6cb-8d65-383f207a41de
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-91fd-b4909c5bbd47
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-7a24-1807df48347f
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-75b6-29efb8e48000
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-de63-99423cb69f39
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-86cb-52dd960dd239
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-dd3e-ba1668e83f49
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-e784-cfaaf03c68db
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-4089-7890027d59e1
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-2846-3692e5a4231e
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-2130-496c9a255dd2
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-dafc-27834a7757ef
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-4d57-0c31d9a0c2f4
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-be2e-f9c4c2f8c14c
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-922d-ca42d7331e7e
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-63ae-79c8390aafcc
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-d1b3-8462f02b988b
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-55f6-d249d5a981c5
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-fbb8-316a95abd919
00020000-5571-a6cc-171d-721f904f7013	00030000-5571-a6cb-8d65-383f207a41de
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-91fd-b4909c5bbd47
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-de63-99423cb69f39
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-86cb-52dd960dd239
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-dc5e-f58ab1d94d5e
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-dd3e-ba1668e83f49
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-e784-cfaaf03c68db
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-4089-7890027d59e1
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-2846-3692e5a4231e
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-2130-496c9a255dd2
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-dafc-27834a7757ef
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-4d57-0c31d9a0c2f4
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-be2e-f9c4c2f8c14c
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-922d-ca42d7331e7e
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-63ae-79c8390aafcc
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-d1b3-8462f02b988b
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-e6ac-da4b28dad125
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-e2c7-afefb93e11bf
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-55f6-d249d5a981c5
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-fbb8-316a95abd919
00020000-5571-a6cc-4492-2b3395bb1bd7	00030000-5571-a6cb-8d65-383f207a41de
\.


--
-- TOC entry 2813 (class 0 OID 6466046)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6466077)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6466215)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6465811)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5571-a6cc-c361-d6c4b186024e	00040000-5571-a6cb-2439-bfa2452646f7	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-a6cc-ba46-f3edc23e3e8d	00040000-5571-a6cb-2439-bfa2452646f7	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-a6cc-ac05-45dfd789b167	00040000-5571-a6cb-2439-bfa2452646f7	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-a6cc-0c6d-f5a5fcc1ed2f	00040000-5571-a6cb-2439-bfa2452646f7	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2792 (class 0 OID 6465846)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5571-a6cb-496c-2c1be7d396cd	8341	Adlešiči
00050000-5571-a6cb-7476-965177f422f4	5270	Ajdovščina
00050000-5571-a6cb-af19-0d36f36a3153	6280	Ankaran/Ancarano
00050000-5571-a6cb-0849-ccd90f7d6d8a	9253	Apače
00050000-5571-a6cb-1cb2-e82e6461241c	8253	Artiče
00050000-5571-a6cb-21bc-8af82d551347	4275	Begunje na Gorenjskem
00050000-5571-a6cb-8be5-4a312518e851	1382	Begunje pri Cerknici
00050000-5571-a6cb-2048-3bb65257327d	9231	Beltinci
00050000-5571-a6cb-8a63-942ee40fa21a	2234	Benedikt
00050000-5571-a6cb-7b93-17b299f38ac5	2345	Bistrica ob Dravi
00050000-5571-a6cb-516f-0121d5440902	3256	Bistrica ob Sotli
00050000-5571-a6cb-5958-979c4f222227	8259	Bizeljsko
00050000-5571-a6cb-2be3-348d36cce5ee	1223	Blagovica
00050000-5571-a6cb-0b4a-896d411b8f31	8283	Blanca
00050000-5571-a6cb-b576-18c172e88760	4260	Bled
00050000-5571-a6cb-0fb8-f540a0f84e9f	4273	Blejska Dobrava
00050000-5571-a6cb-0125-a347b0bfc21d	9265	Bodonci
00050000-5571-a6cb-d44d-85a117e73fb8	9222	Bogojina
00050000-5571-a6cb-0da9-5bfe29b1772b	4263	Bohinjska Bela
00050000-5571-a6cb-21fe-d703527115c6	4264	Bohinjska Bistrica
00050000-5571-a6cb-7493-c16aef8004df	4265	Bohinjsko jezero
00050000-5571-a6cb-d04c-5f22d3dc001e	1353	Borovnica
00050000-5571-a6cb-bf36-525f9dfc6a17	8294	Boštanj
00050000-5571-a6cb-9dfe-cd5f026bed8e	5230	Bovec
00050000-5571-a6cb-f8f3-6acc7e5b5fd1	5295	Branik
00050000-5571-a6cb-39c2-409169d3a839	3314	Braslovče
00050000-5571-a6cb-a39f-2c9719aa27f6	5223	Breginj
00050000-5571-a6cb-9324-e090be4a55cc	8280	Brestanica
00050000-5571-a6cb-a771-2cdc4446221c	2354	Bresternica
00050000-5571-a6cb-155a-32c36bda2b73	4243	Brezje
00050000-5571-a6cb-9ee6-147fc9512260	1351	Brezovica pri Ljubljani
00050000-5571-a6cb-354b-a80cfb065e3c	8250	Brežice
00050000-5571-a6cb-3722-abe3d6f549e4	4210	Brnik - Aerodrom
00050000-5571-a6cb-c17c-4ea8c1c34f6e	8321	Brusnice
00050000-5571-a6cb-bcbd-d53d7a062d13	3255	Buče
00050000-5571-a6cb-55f8-7c231b73b6f8	8276	Bučka 
00050000-5571-a6cb-8e77-af59e75d0b0d	9261	Cankova
00050000-5571-a6cb-6e74-78268e89b8bd	3000	Celje 
00050000-5571-a6cb-6cca-70e52d1a2138	3001	Celje - poštni predali
00050000-5571-a6cb-60a8-5bbdf0c0635f	4207	Cerklje na Gorenjskem
00050000-5571-a6cb-9643-71b595a13701	8263	Cerklje ob Krki
00050000-5571-a6cb-08f3-e1397522363f	1380	Cerknica
00050000-5571-a6cb-2429-21c0b75c6b34	5282	Cerkno
00050000-5571-a6cb-c6d2-5d6e96bbc5d8	2236	Cerkvenjak
00050000-5571-a6cb-e956-2275fbb5add7	2215	Ceršak
00050000-5571-a6cb-6276-416a6257c9be	2326	Cirkovce
00050000-5571-a6cb-eab1-1f68667daa3b	2282	Cirkulane
00050000-5571-a6cb-674d-833432071099	5273	Col
00050000-5571-a6cb-36d2-a243c5327e8f	8251	Čatež ob Savi
00050000-5571-a6cb-86b2-0cd569cd16f9	1413	Čemšenik
00050000-5571-a6cb-cc89-297d3d05dada	5253	Čepovan
00050000-5571-a6cb-c477-467e569b8f4c	9232	Črenšovci
00050000-5571-a6cb-c5a0-3c8d54b24087	2393	Črna na Koroškem
00050000-5571-a6cb-c81e-a4523892d3ec	6275	Črni Kal
00050000-5571-a6cb-b774-569dd865fb4e	5274	Črni Vrh nad Idrijo
00050000-5571-a6cb-21ec-61d86d1736ec	5262	Črniče
00050000-5571-a6cb-d6e2-c15cf1de990a	8340	Črnomelj
00050000-5571-a6cb-478b-2682101a61c0	6271	Dekani
00050000-5571-a6cb-732b-26aef1fdd510	5210	Deskle
00050000-5571-a6cb-4bb7-5fbead907ed3	2253	Destrnik
00050000-5571-a6cb-6b8c-ea209b03da0e	6215	Divača
00050000-5571-a6cb-3606-9ddf347846d8	1233	Dob
00050000-5571-a6cb-9914-6a4cd2d1cd14	3224	Dobje pri Planini
00050000-5571-a6cb-4d37-f9d33bd22ade	8257	Dobova
00050000-5571-a6cb-e191-9cfaf397b12d	1423	Dobovec
00050000-5571-a6cb-8883-dc369d0ece63	5263	Dobravlje
00050000-5571-a6cb-16ad-4040eea655a8	3204	Dobrna
00050000-5571-a6cb-d1ce-1285c25713db	8211	Dobrnič
00050000-5571-a6cb-6033-6ad0efae8fa5	1356	Dobrova
00050000-5571-a6cb-ab26-03f3a68388ed	9223	Dobrovnik/Dobronak 
00050000-5571-a6cb-bd86-2867afd6f105	5212	Dobrovo v Brdih
00050000-5571-a6cb-696f-8120ec346bb3	1431	Dol pri Hrastniku
00050000-5571-a6cb-0f3b-12667398f473	1262	Dol pri Ljubljani
00050000-5571-a6cb-04b2-27a2a212cd62	1273	Dole pri Litiji
00050000-5571-a6cb-040d-69a5a38f123f	1331	Dolenja vas
00050000-5571-a6cb-de15-79aa9b210ac1	8350	Dolenjske Toplice
00050000-5571-a6cb-838f-99765d50a7b7	1230	Domžale
00050000-5571-a6cb-cb66-e024717e7a5b	2252	Dornava
00050000-5571-a6cb-ceb9-d22fc35c2b7e	5294	Dornberk
00050000-5571-a6cb-84ce-62ff04857e31	1319	Draga
00050000-5571-a6cb-445e-043d988aacd7	8343	Dragatuš
00050000-5571-a6cb-a591-444c61a9ce2c	3222	Dramlje
00050000-5571-a6cb-f848-e435da653bca	2370	Dravograd
00050000-5571-a6cb-d9d3-9bd45d004d00	4203	Duplje
00050000-5571-a6cb-6756-9cb6f2a9da99	6221	Dutovlje
00050000-5571-a6cb-cfe7-dfb2e7f39dd8	8361	Dvor
00050000-5571-a6cb-15f9-77c78b6022d2	2343	Fala
00050000-5571-a6cb-3fd7-e229fc007a3d	9208	Fokovci
00050000-5571-a6cb-499a-0911344807cf	2313	Fram
00050000-5571-a6cb-6307-257615e5ebf3	3213	Frankolovo
00050000-5571-a6cb-9fdc-71cb78ad24e9	1274	Gabrovka
00050000-5571-a6cb-c3ba-7462e59af417	8254	Globoko
00050000-5571-a6cb-f1f4-ab9bc1eaaf17	5275	Godovič
00050000-5571-a6cb-a636-9843cee083f7	4204	Golnik
00050000-5571-a6cb-95e3-baf5effecf01	3303	Gomilsko
00050000-5571-a6cb-0b76-79398abbd4a0	4224	Gorenja vas
00050000-5571-a6cb-073d-cab5dd4446a6	3263	Gorica pri Slivnici
00050000-5571-a6cb-2177-48cafec4c2c5	2272	Gorišnica
00050000-5571-a6cb-9b01-cd0a47f4e452	9250	Gornja Radgona
00050000-5571-a6cb-39b5-c5a835ced805	3342	Gornji Grad
00050000-5571-a6cb-f3a2-5b95ebb35e8f	4282	Gozd Martuljek
00050000-5571-a6cb-9eaa-c70a61eab9ae	6272	Gračišče
00050000-5571-a6cb-8a4a-020782bbcf29	9264	Grad
00050000-5571-a6cb-fe93-44e4429023f6	8332	Gradac
00050000-5571-a6cb-f51d-bdba128d2817	1384	Grahovo
00050000-5571-a6cb-91cf-d9e7590c921d	5242	Grahovo ob Bači
00050000-5571-a6cb-311d-8b678bfcad03	5251	Grgar
00050000-5571-a6cb-4765-2b3b6ee205d6	3302	Griže
00050000-5571-a6cb-395d-233d2521e3d6	3231	Grobelno
00050000-5571-a6cb-d547-61cf74fd963f	1290	Grosuplje
00050000-5571-a6cb-25ea-4346e743f53f	2288	Hajdina
00050000-5571-a6cb-bc31-f253593550c9	8362	Hinje
00050000-5571-a6cb-7e97-ee47fdbdb744	2311	Hoče
00050000-5571-a6cb-4f72-df0eb4d41c54	9205	Hodoš/Hodos
00050000-5571-a6cb-f813-77ac7bd8c8d7	1354	Horjul
00050000-5571-a6cb-8aed-d957a96ad769	1372	Hotedršica
00050000-5571-a6cb-e82a-9afaf4d9eca2	1430	Hrastnik
00050000-5571-a6cb-ba94-2e3294948f30	6225	Hruševje
00050000-5571-a6cb-15f8-217566ff83c4	4276	Hrušica
00050000-5571-a6cb-019b-d345c5f9c9f7	5280	Idrija
00050000-5571-a6cb-52f4-de099c70150b	1292	Ig
00050000-5571-a6cb-1f77-49b230740290	6250	Ilirska Bistrica
00050000-5571-a6cb-9443-2267c7d58c07	6251	Ilirska Bistrica-Trnovo
00050000-5571-a6cb-ffe8-55ca82239135	1295	Ivančna Gorica
00050000-5571-a6cb-f9ab-a33d8ce4851a	2259	Ivanjkovci
00050000-5571-a6cb-18d9-542eaef7c13a	1411	Izlake
00050000-5571-a6cb-4a54-f22eb12ccaeb	6310	Izola/Isola
00050000-5571-a6cb-e174-74576fbf547c	2222	Jakobski Dol
00050000-5571-a6cb-7c68-fbf4961ce87e	2221	Jarenina
00050000-5571-a6cb-a84f-6e68b3d9f4d5	6254	Jelšane
00050000-5571-a6cb-590c-2be6b589e9fe	4270	Jesenice
00050000-5571-a6cb-809f-9eed0a0693ed	8261	Jesenice na Dolenjskem
00050000-5571-a6cb-c34b-3be93475bfbe	3273	Jurklošter
00050000-5571-a6cb-b000-71fc71e7793f	2223	Jurovski Dol
00050000-5571-a6cb-57e1-50af3a25f36f	2256	Juršinci
00050000-5571-a6cb-3bcc-e9e16405e350	5214	Kal nad Kanalom
00050000-5571-a6cb-0f76-c255402a2210	3233	Kalobje
00050000-5571-a6cb-fb19-ca89e6466e91	4246	Kamna Gorica
00050000-5571-a6cb-0a61-23213c79f8f5	2351	Kamnica
00050000-5571-a6cb-ae5c-425161645627	1241	Kamnik
00050000-5571-a6cb-2c31-627bec89b5c4	5213	Kanal
00050000-5571-a6cb-a172-8b272e4eb173	8258	Kapele
00050000-5571-a6cb-e654-a92bfe87bb46	2362	Kapla
00050000-5571-a6cb-22b1-29b6b2ad13f0	2325	Kidričevo
00050000-5571-a6cb-9c78-4f33dc2e787e	1412	Kisovec
00050000-5571-a6cb-4880-355791193fca	6253	Knežak
00050000-5571-a6cb-e2ec-aba0f155634e	5222	Kobarid
00050000-5571-a6cb-7f2f-47b37b9d289b	9227	Kobilje
00050000-5571-a6cb-4890-a6618edfa266	1330	Kočevje
00050000-5571-a6cb-8acc-914e45b36c75	1338	Kočevska Reka
00050000-5571-a6cb-81da-7cd9494c43dd	2276	Kog
00050000-5571-a6cb-e4a6-c41d3a6f9c61	5211	Kojsko
00050000-5571-a6cb-7086-1d85be71685b	6223	Komen
00050000-5571-a6cb-3f14-3159a541d7fb	1218	Komenda
00050000-5571-a6cb-38f6-c38a134a2dbc	6000	Koper/Capodistria 
00050000-5571-a6cb-c8c7-c07ea697374c	6001	Koper/Capodistria - poštni predali
00050000-5571-a6cb-e9ab-6f6dff3e94de	8282	Koprivnica
00050000-5571-a6cb-61d2-babb9828a2e9	5296	Kostanjevica na Krasu
00050000-5571-a6cb-7903-735a4e21fc0d	8311	Kostanjevica na Krki
00050000-5571-a6cb-9960-12aa4d0da989	1336	Kostel
00050000-5571-a6cb-8354-bb9bb458cf2c	6256	Košana
00050000-5571-a6cb-55e0-b0dbae90c1c7	2394	Kotlje
00050000-5571-a6cb-26f0-82acb6bc3a2c	6240	Kozina
00050000-5571-a6cb-f32c-5535b3ef650d	3260	Kozje
00050000-5571-a6cb-ff4e-dcd252e9637d	4000	Kranj 
00050000-5571-a6cb-7ea2-870b2c015caa	4001	Kranj - poštni predali
00050000-5571-a6cb-0994-4157e9d1e6c4	4280	Kranjska Gora
00050000-5571-a6cb-d77c-4042cb182fd3	1281	Kresnice
00050000-5571-a6cb-1580-c618c6df368a	4294	Križe
00050000-5571-a6cb-60e0-589ce8cb30df	9206	Križevci
00050000-5571-a6cb-8d44-2918545833ce	9242	Križevci pri Ljutomeru
00050000-5571-a6cb-ee19-2f670761577e	1301	Krka
00050000-5571-a6cb-0ddf-d176e72a01ee	8296	Krmelj
00050000-5571-a6cb-3a5d-251f17b0fe7d	4245	Kropa
00050000-5571-a6cb-18c6-b89e00238cdb	8262	Krška vas
00050000-5571-a6cb-1bb3-b823b2cc0a6c	8270	Krško
00050000-5571-a6cb-7ca5-083e97794139	9263	Kuzma
00050000-5571-a6cb-5cdf-fc2ffdd8d7ba	2318	Laporje
00050000-5571-a6cb-7308-b01e950ce955	3270	Laško
00050000-5571-a6cb-62d3-ca2b0d394b69	1219	Laze v Tuhinju
00050000-5571-a6cb-7145-d47cd650ec4e	2230	Lenart v Slovenskih goricah
00050000-5571-a6cb-7254-be033afa5915	9220	Lendava/Lendva
00050000-5571-a6cb-dac4-7225c66cf442	4248	Lesce
00050000-5571-a6cb-45cb-40fe3ff2f4a7	3261	Lesično
00050000-5571-a6cb-cd4e-c11c2d08b9ce	8273	Leskovec pri Krškem
00050000-5571-a6cb-290a-f8c81c7a40c5	2372	Libeliče
00050000-5571-a6cb-e900-56ddd37b3434	2341	Limbuš
00050000-5571-a6cb-3194-4e9af542511d	1270	Litija
00050000-5571-a6cb-1bb4-3ca7d85675a1	3202	Ljubečna
00050000-5571-a6cb-c4be-0d9986bf0b91	1000	Ljubljana 
00050000-5571-a6cb-2321-3f1432f40283	1001	Ljubljana - poštni predali
00050000-5571-a6cb-06b0-d6380f2cd48a	1231	Ljubljana - Črnuče
00050000-5571-a6cb-f688-c5b8668b2823	1261	Ljubljana - Dobrunje
00050000-5571-a6cb-f297-c224077a5f04	1260	Ljubljana - Polje
00050000-5571-a6cb-cd48-72a8bf704173	1210	Ljubljana - Šentvid
00050000-5571-a6cb-80ec-91718886348c	1211	Ljubljana - Šmartno
00050000-5571-a6cb-b6ae-69eee7dbb94f	3333	Ljubno ob Savinji
00050000-5571-a6cb-5a61-a37b7f69ed6a	9240	Ljutomer
00050000-5571-a6cb-3a65-1b0c03f4b2e9	3215	Loče
00050000-5571-a6cb-3628-11783040ce73	5231	Log pod Mangartom
00050000-5571-a6cb-d323-e3c695ed56a7	1358	Log pri Brezovici
00050000-5571-a6cb-7b5b-2d2117867e04	1370	Logatec
00050000-5571-a6cb-ad95-c1a002722816	1371	Logatec
00050000-5571-a6cb-7dd4-70d42435167e	1434	Loka pri Zidanem Mostu
00050000-5571-a6cb-1119-ca9f74a0faf1	3223	Loka pri Žusmu
00050000-5571-a6cb-51d5-ded2a3598f2f	6219	Lokev
00050000-5571-a6cb-3c11-07a942d34eff	1318	Loški Potok
00050000-5571-a6cb-2c53-4bf3016befd4	2324	Lovrenc na Dravskem polju
00050000-5571-a6cb-264e-920bb61d49ee	2344	Lovrenc na Pohorju
00050000-5571-a6cb-1dc7-346a8539c170	3334	Luče
00050000-5571-a6cb-63cc-8f1610282e59	1225	Lukovica
00050000-5571-a6cb-78b9-e55fb0afbea1	9202	Mačkovci
00050000-5571-a6cb-8b04-3f5eb2bc5e01	2322	Majšperk
00050000-5571-a6cb-9586-6477360429fb	2321	Makole
00050000-5571-a6cb-8f07-0507d04dcfc8	9243	Mala Nedelja
00050000-5571-a6cb-450f-cec34883274b	2229	Malečnik
00050000-5571-a6cb-cedf-c1edb277b9c9	6273	Marezige
00050000-5571-a6cb-d14e-a9a8e8c861b1	2000	Maribor 
00050000-5571-a6cb-b63c-60f9af02fb62	2001	Maribor - poštni predali
00050000-5571-a6cb-82ce-4868528950b2	2206	Marjeta na Dravskem polju
00050000-5571-a6cb-bf8b-1447b460e033	2281	Markovci
00050000-5571-a6cb-5136-2518c3dfd694	9221	Martjanci
00050000-5571-a6cb-0aa5-6baf2bb8ef6c	6242	Materija
00050000-5571-a6cb-d802-03208bdcb2d5	4211	Mavčiče
00050000-5571-a6cb-19a0-8491388ef12e	1215	Medvode
00050000-5571-a6cb-6085-faca68b461f7	1234	Mengeš
00050000-5571-a6cb-da8a-8fc52f96dfdf	8330	Metlika
00050000-5571-a6cb-20e8-2b3bb1815b04	2392	Mežica
00050000-5571-a6cb-3960-8628bcea9f2d	2204	Miklavž na Dravskem polju
00050000-5571-a6cb-2fcf-4aac25e81afb	2275	Miklavž pri Ormožu
00050000-5571-a6cb-b2f7-aaceb6b479db	5291	Miren
00050000-5571-a6cb-852f-33ddc1b11fcf	8233	Mirna
00050000-5571-a6cb-3ae4-9cfcc8c640de	8216	Mirna Peč
00050000-5571-a6cb-a590-571797cdbe12	2382	Mislinja
00050000-5571-a6cb-62ba-fb593228e502	4281	Mojstrana
00050000-5571-a6cb-48e3-52cdbc8e7c51	8230	Mokronog
00050000-5571-a6cb-fc7b-72827e7a2480	1251	Moravče
00050000-5571-a6cb-ebf8-4b9de47ff3b6	9226	Moravske Toplice
00050000-5571-a6cb-40a4-54d888f9cfda	5216	Most na Soči
00050000-5571-a6cb-72db-b0cb6437d309	1221	Motnik
00050000-5571-a6cb-b0b7-ed430ce6f3f0	3330	Mozirje
00050000-5571-a6cb-15b8-b6f173536931	9000	Murska Sobota 
00050000-5571-a6cb-4099-52f62b208e24	9001	Murska Sobota - poštni predali
00050000-5571-a6cb-f256-008c38170ca1	2366	Muta
00050000-5571-a6cb-e89f-abfb24db5572	4202	Naklo
00050000-5571-a6cb-cd64-dbcdab59ddd9	3331	Nazarje
00050000-5571-a6cb-bad1-fe6e6fad1493	1357	Notranje Gorice
00050000-5571-a6cb-6744-7f146b63fcfe	3203	Nova Cerkev
00050000-5571-a6cb-8586-265e9f9c5a65	5000	Nova Gorica 
00050000-5571-a6cb-cd8b-ba19a93f0aba	5001	Nova Gorica - poštni predali
00050000-5571-a6cb-0a1b-240babd89549	1385	Nova vas
00050000-5571-a6cb-1174-35097b10fedd	8000	Novo mesto
00050000-5571-a6cb-c346-e4d8101c9299	8001	Novo mesto - poštni predali
00050000-5571-a6cb-67aa-ee23f1348d16	6243	Obrov
00050000-5571-a6cb-6aad-6f1bbb8dc7b4	9233	Odranci
00050000-5571-a6cb-c21f-0a00ca681ab5	2317	Oplotnica
00050000-5571-a6cb-3219-d33157c14cea	2312	Orehova vas
00050000-5571-a6cb-56bf-6bf6193bbbc1	2270	Ormož
00050000-5571-a6cb-236d-06e0210db673	1316	Ortnek
00050000-5571-a6cb-6d42-575d6f38b187	1337	Osilnica
00050000-5571-a6cb-0d25-7562548f703a	8222	Otočec
00050000-5571-a6cb-9696-59024203cf7f	2361	Ožbalt
00050000-5571-a6cb-362f-b66e2a8d0cdb	2231	Pernica
00050000-5571-a6cb-5b0b-72a64ab9685d	2211	Pesnica pri Mariboru
00050000-5571-a6cb-d2ad-144afa7ed4e1	9203	Petrovci
00050000-5571-a6cb-2ac0-f62768ae072a	3301	Petrovče
00050000-5571-a6cb-7001-8fbe04de64a2	6330	Piran/Pirano
00050000-5571-a6cb-8f4f-f124ddecf04f	8255	Pišece
00050000-5571-a6cb-afaf-8a097e4b1795	6257	Pivka
00050000-5571-a6cb-da60-799e59653821	6232	Planina
00050000-5571-a6cb-a685-4f11ae4df226	3225	Planina pri Sevnici
00050000-5571-a6cb-eae5-76cab0bca1b6	6276	Pobegi
00050000-5571-a6cb-264e-cc94bf5cb625	8312	Podbočje
00050000-5571-a6cb-4a47-88df82e292a5	5243	Podbrdo
00050000-5571-a6cb-aa88-470fb1299b5d	3254	Podčetrtek
00050000-5571-a6cb-2f83-4344800ad1ca	2273	Podgorci
00050000-5571-a6cb-ca6a-4ea6789ddce8	6216	Podgorje
00050000-5571-a6cb-430a-7f415fba848a	2381	Podgorje pri Slovenj Gradcu
00050000-5571-a6cb-7e6a-0028a74d3dcb	6244	Podgrad
00050000-5571-a6cb-e3dc-16cdc02c6c16	1414	Podkum
00050000-5571-a6cb-5309-253d8e7f3abd	2286	Podlehnik
00050000-5571-a6cb-8cca-2bdc8a695d29	5272	Podnanos
00050000-5571-a6cb-72ed-8ebe477ea322	4244	Podnart
00050000-5571-a6cb-dce5-3966c8f9cc89	3241	Podplat
00050000-5571-a6cb-54d0-456cf2561b14	3257	Podsreda
00050000-5571-a6cb-24f4-5bc1629d9b62	2363	Podvelka
00050000-5571-a6cb-ae09-a14a8ce706fa	2208	Pohorje
00050000-5571-a6cb-b144-77df7447ca50	2257	Polenšak
00050000-5571-a6cb-e30c-9e18d07eebec	1355	Polhov Gradec
00050000-5571-a6cb-8804-a688d5a5c0f7	4223	Poljane nad Škofjo Loko
00050000-5571-a6cb-2bd3-b44f5e73322b	2319	Poljčane
00050000-5571-a6cb-a7bb-541da92886d8	1272	Polšnik
00050000-5571-a6cb-ee9a-016901f96d4f	3313	Polzela
00050000-5571-a6cb-6be0-f0f77114eb95	3232	Ponikva
00050000-5571-a6cb-1914-b545d0fe3c24	6320	Portorož/Portorose
00050000-5571-a6cb-03c4-01220e4f3e6a	6230	Postojna
00050000-5571-a6cb-31a9-5fd7964972a4	2331	Pragersko
00050000-5571-a6cb-4ad6-ffd19d388c25	3312	Prebold
00050000-5571-a6cb-a428-90952c3ef5a8	4205	Preddvor
00050000-5571-a6cb-98b6-e2765851e246	6255	Prem
00050000-5571-a6cb-a508-e2af3c25d31c	1352	Preserje
00050000-5571-a6cb-6fc3-3e504ed79864	6258	Prestranek
00050000-5571-a6cb-3aa7-0d8b422f96bd	2391	Prevalje
00050000-5571-a6cb-a267-94182a37fa6f	3262	Prevorje
00050000-5571-a6cb-3a55-e97a18bb337a	1276	Primskovo 
00050000-5571-a6cb-c92b-84d7c07d30b9	3253	Pristava pri Mestinju
00050000-5571-a6cb-3f45-a381939fc728	9207	Prosenjakovci/Partosfalva
00050000-5571-a6cb-1d29-9315eb819c87	5297	Prvačina
00050000-5571-a6cb-7489-252122a10d17	2250	Ptuj
00050000-5571-a6cb-8448-8f5fed12c071	2323	Ptujska Gora
00050000-5571-a6cb-3f19-de99a9816c11	9201	Puconci
00050000-5571-a6cb-1f7d-cbcd9153ad58	2327	Rače
00050000-5571-a6cb-a048-4402d23703b5	1433	Radeče
00050000-5571-a6cb-790c-4d815bad2c71	9252	Radenci
00050000-5571-a6cb-de04-61bdaf12ec40	2360	Radlje ob Dravi
00050000-5571-a6cb-1d3b-4fdf34a9ba07	1235	Radomlje
00050000-5571-a6cb-7b19-dd852844a941	4240	Radovljica
00050000-5571-a6cb-10e4-45576f497ff9	8274	Raka
00050000-5571-a6cb-f675-9e84f00ad0d8	1381	Rakek
00050000-5571-a6cb-451a-e7869080787d	4283	Rateče - Planica
00050000-5571-a6cb-6069-58a0782c31c8	2390	Ravne na Koroškem
00050000-5571-a6cb-7189-a897e04de819	9246	Razkrižje
00050000-5571-a6cb-6b46-a01bd9ada407	3332	Rečica ob Savinji
00050000-5571-a6cb-ec2e-20aaff0c2b6a	5292	Renče
00050000-5571-a6cb-1dc0-5516beb8c962	1310	Ribnica
00050000-5571-a6cb-d30e-7e8d0b3f4dd0	2364	Ribnica na Pohorju
00050000-5571-a6cb-9e35-ccc0042220c4	3272	Rimske Toplice
00050000-5571-a6cb-2a6e-2e544b2e3963	1314	Rob
00050000-5571-a6cb-0a6c-fc21862e3ce6	5215	Ročinj
00050000-5571-a6cb-0e4f-259db64a7d97	3250	Rogaška Slatina
00050000-5571-a6cb-9405-eb5e78e0a948	9262	Rogašovci
00050000-5571-a6cb-07da-186adc5d37b4	3252	Rogatec
00050000-5571-a6cb-950c-74f694ab269c	1373	Rovte
00050000-5571-a6cb-02a2-c75e6781097f	2342	Ruše
00050000-5571-a6cb-c608-0dbd16fa7ecc	1282	Sava
00050000-5571-a6cb-e96c-5dd3a46ab54f	6333	Sečovlje/Sicciole
00050000-5571-a6cb-74f7-3d46193d85cd	4227	Selca
00050000-5571-a6cb-465f-89d011ee4d19	2352	Selnica ob Dravi
00050000-5571-a6cb-d9e4-69c9fd7fb7a7	8333	Semič
00050000-5571-a6cb-e809-53d28b3f5f16	8281	Senovo
00050000-5571-a6cb-f246-6d6bc52d46b4	6224	Senožeče
00050000-5571-a6cb-5370-d8d686ff9c90	8290	Sevnica
00050000-5571-a6cb-1b81-848985834d3e	6210	Sežana
00050000-5571-a6cb-dbee-c542a93352c9	2214	Sladki Vrh
00050000-5571-a6cb-977f-67ccbaf14ca1	5283	Slap ob Idrijci
00050000-5571-a6cb-fc61-1159bc9b456b	2380	Slovenj Gradec
00050000-5571-a6cb-50a2-436989413345	2310	Slovenska Bistrica
00050000-5571-a6cb-badc-54ddbc242d63	3210	Slovenske Konjice
00050000-5571-a6cb-4311-3e3272ac5055	1216	Smlednik
00050000-5571-a6cb-ed88-a7fbbf0cde64	5232	Soča
00050000-5571-a6cb-4d26-f9860c640b13	1317	Sodražica
00050000-5571-a6cb-b249-9813870671c3	3335	Solčava
00050000-5571-a6cb-1937-bd8fdbc3e73a	5250	Solkan
00050000-5571-a6cb-b547-707ce60e2b90	4229	Sorica
00050000-5571-a6cb-e689-88f46bef965f	4225	Sovodenj
00050000-5571-a6cb-fea8-34e60c50a727	5281	Spodnja Idrija
00050000-5571-a6cb-cd92-3228c32aa1c0	2241	Spodnji Duplek
00050000-5571-a6cb-11f5-8fc411997528	9245	Spodnji Ivanjci
00050000-5571-a6cb-f681-bcf28f36e093	2277	Središče ob Dravi
00050000-5571-a6cb-d922-828ac116d852	4267	Srednja vas v Bohinju
00050000-5571-a6cb-8275-88f664003fb8	8256	Sromlje 
00050000-5571-a6cb-d95e-43ac6ff050cd	5224	Srpenica
00050000-5571-a6cb-a2f2-b2da8b43c4ae	1242	Stahovica
00050000-5571-a6cb-4eda-016f41c412f3	1332	Stara Cerkev
00050000-5571-a6cb-35e3-aed13a6f0801	8342	Stari trg ob Kolpi
00050000-5571-a6cb-6feb-c12b5fa59d23	1386	Stari trg pri Ložu
00050000-5571-a6cb-07fe-13290d8ba501	2205	Starše
00050000-5571-a6cb-978b-afef90928c75	2289	Stoperce
00050000-5571-a6cb-ee92-986cc0d1b3cd	8322	Stopiče
00050000-5571-a6cb-19ae-725b6b14902c	3206	Stranice
00050000-5571-a6cb-4b6e-2ea6e0b2eed7	8351	Straža
00050000-5571-a6cb-b0d9-0f56d4dffb02	1313	Struge
00050000-5571-a6cb-61ee-9ece29333e6c	8293	Studenec
00050000-5571-a6cb-c73d-6a3e91184798	8331	Suhor
00050000-5571-a6cb-4af0-5aad03d891ea	2233	Sv. Ana v Slovenskih goricah
00050000-5571-a6cb-e751-ef2225789ff2	2235	Sv. Trojica v Slovenskih goricah
00050000-5571-a6cb-204e-dae8d0d14082	2353	Sveti Duh na Ostrem Vrhu
00050000-5571-a6cb-1819-37eaa18177e9	9244	Sveti Jurij ob Ščavnici
00050000-5571-a6cb-8c6e-e089ebabdbfb	3264	Sveti Štefan
00050000-5571-a6cb-b6dd-80ca7c6f13bf	2258	Sveti Tomaž
00050000-5571-a6cb-b64f-18b4f4af7e12	9204	Šalovci
00050000-5571-a6cb-3f11-ec5ec9988db6	5261	Šempas
00050000-5571-a6cb-2e13-f3071b74895b	5290	Šempeter pri Gorici
00050000-5571-a6cb-d2ab-870df70b5c5c	3311	Šempeter v Savinjski dolini
00050000-5571-a6cb-21c0-2c872bcadd41	4208	Šenčur
00050000-5571-a6cb-1507-937c0bddd8e4	2212	Šentilj v Slovenskih goricah
00050000-5571-a6cb-41bf-afdffc26df63	8297	Šentjanž
00050000-5571-a6cb-61a4-30a5684e3684	2373	Šentjanž pri Dravogradu
00050000-5571-a6cb-baf3-d889b11298cf	8310	Šentjernej
00050000-5571-a6cb-186d-2b4abb26eae5	3230	Šentjur
00050000-5571-a6cb-d93d-7581c1247d10	3271	Šentrupert
00050000-5571-a6cb-866a-c75ac65568b3	8232	Šentrupert
00050000-5571-a6cb-d00e-f8bdc54769da	1296	Šentvid pri Stični
00050000-5571-a6cb-ba0e-44eae4393bd8	8275	Škocjan
00050000-5571-a6cb-0a5b-facb59a30a39	6281	Škofije
00050000-5571-a6cb-74f9-419d151123ed	4220	Škofja Loka
00050000-5571-a6cb-3c9b-866f84bab3b7	3211	Škofja vas
00050000-5571-a6cb-adcb-45b1c4dcaae0	1291	Škofljica
00050000-5571-a6cb-7519-40d2bc14ae3d	6274	Šmarje
00050000-5571-a6cb-74e1-5c309c2f3ada	1293	Šmarje - Sap
00050000-5571-a6cb-5a39-5391509ac0ed	3240	Šmarje pri Jelšah
00050000-5571-a6cb-bfd5-ea2a10a0ad44	8220	Šmarješke Toplice
00050000-5571-a6cb-ab33-704df5fc3928	2315	Šmartno na Pohorju
00050000-5571-a6cb-51f8-69db103c0a83	3341	Šmartno ob Dreti
00050000-5571-a6cb-ab12-e0d893478aec	3327	Šmartno ob Paki
00050000-5571-a6cb-eaaa-d518f8339237	1275	Šmartno pri Litiji
00050000-5571-a6cb-1bd2-a1bbf57ecc1c	2383	Šmartno pri Slovenj Gradcu
00050000-5571-a6cb-46dd-fe71ad9fea35	3201	Šmartno v Rožni dolini
00050000-5571-a6cb-b4ba-9b802acfbb35	3325	Šoštanj
00050000-5571-a6cb-cdd4-5c04ca9af22e	6222	Štanjel
00050000-5571-a6cb-7d9f-32dbdce81bdb	3220	Štore
00050000-5571-a6cb-c4d6-d0dba5184a89	3304	Tabor
00050000-5571-a6cb-a8ac-778aca5adc67	3221	Teharje
00050000-5571-a6cb-a9ef-8a2f4285cf99	9251	Tišina
00050000-5571-a6cb-2ca3-d98d5d78d97c	5220	Tolmin
00050000-5571-a6cb-499f-930ec420c78a	3326	Topolšica
00050000-5571-a6cb-acf0-f2cbcf5698a3	2371	Trbonje
00050000-5571-a6cb-ebf1-f5ff59afe0e1	1420	Trbovlje
00050000-5571-a6cb-d20d-8eb738cc093b	8231	Trebelno 
00050000-5571-a6cb-ca1b-38c4d9372377	8210	Trebnje
00050000-5571-a6cb-0229-5fe2f313f40b	5252	Trnovo pri Gorici
00050000-5571-a6cb-c7a0-ba0c0b2f918c	2254	Trnovska vas
00050000-5571-a6cb-6631-fe4126fe6d0b	1222	Trojane
00050000-5571-a6cb-0cf6-3e2877b26198	1236	Trzin
00050000-5571-a6cb-285d-1351d243b493	4290	Tržič
00050000-5571-a6cb-9e76-99dd69293258	8295	Tržišče
00050000-5571-a6cb-9682-180dc8679b60	1311	Turjak
00050000-5571-a6cb-750a-1b174d50a5f4	9224	Turnišče
00050000-5571-a6cb-4ce4-64080b2016db	8323	Uršna sela
00050000-5571-a6cb-13a8-51b583afb1e8	1252	Vače
00050000-5571-a6cb-6587-bd245f51c510	3320	Velenje 
00050000-5571-a6cb-6619-51a965ff7a82	3322	Velenje - poštni predali
00050000-5571-a6cb-5e57-2d4a5e853609	8212	Velika Loka
00050000-5571-a6cb-525b-702910c6d48b	2274	Velika Nedelja
00050000-5571-a6cb-7a04-bc98a073a81d	9225	Velika Polana
00050000-5571-a6cb-d703-ec58e78195a4	1315	Velike Lašče
00050000-5571-a6cb-e6f8-caf8f4d50ad2	8213	Veliki Gaber
00050000-5571-a6cb-ec9e-67feeac60761	9241	Veržej
00050000-5571-a6cb-cf4b-4a252754f10d	1312	Videm - Dobrepolje
00050000-5571-a6cb-adcc-26e1486f2cfa	2284	Videm pri Ptuju
00050000-5571-a6cb-5740-4dc0aef66550	8344	Vinica
00050000-5571-a6cb-d811-72ed4ae7f5ae	5271	Vipava
00050000-5571-a6cb-eae4-e22f22bd5b88	4212	Visoko
00050000-5571-a6cb-a813-73c40680b057	1294	Višnja Gora
00050000-5571-a6cb-758f-29f9cf533722	3205	Vitanje
00050000-5571-a6cb-e983-8c3ed5036a65	2255	Vitomarci
00050000-5571-a6cb-02b0-abb93f0455a6	1217	Vodice
00050000-5571-a6cb-afe5-d908350a464c	3212	Vojnik\t
00050000-5571-a6cb-76b7-64697f361efb	5293	Volčja Draga
00050000-5571-a6cb-cc0f-39e8bd054979	2232	Voličina
00050000-5571-a6cb-5f85-ebc5f269d64a	3305	Vransko
00050000-5571-a6cb-0354-0dd75608fc5b	6217	Vremski Britof
00050000-5571-a6cb-13f7-24dee68f56da	1360	Vrhnika
00050000-5571-a6cb-eec5-ad410e2eb0cb	2365	Vuhred
00050000-5571-a6cb-b335-adb0f30b063b	2367	Vuzenica
00050000-5571-a6cb-baf7-77aa1900daf5	8292	Zabukovje 
00050000-5571-a6cb-77a7-2fa1cb0fc4bb	1410	Zagorje ob Savi
00050000-5571-a6cb-8812-73ff30683312	1303	Zagradec
00050000-5571-a6cb-641f-dcd28f123ce5	2283	Zavrč
00050000-5571-a6cb-e019-dd4dee70d410	8272	Zdole 
00050000-5571-a6cb-d115-9a21be51ec62	4201	Zgornja Besnica
00050000-5571-a6cb-7719-246b0ac36116	2242	Zgornja Korena
00050000-5571-a6cb-dc5e-407754ceddc0	2201	Zgornja Kungota
00050000-5571-a6cb-3bd2-a7fee56bd651	2316	Zgornja Ložnica
00050000-5571-a6cb-af9e-0716f1d299cc	2314	Zgornja Polskava
00050000-5571-a6cb-84b5-01451574665c	2213	Zgornja Velka
00050000-5571-a6cb-d1f7-0c3be8f2a472	4247	Zgornje Gorje
00050000-5571-a6cb-bd20-d09e0c82401f	4206	Zgornje Jezersko
00050000-5571-a6cb-4999-04fd37cbc217	2285	Zgornji Leskovec
00050000-5571-a6cb-b5c5-df69a0f28be6	1432	Zidani Most
00050000-5571-a6cb-c70b-031f70f03aa2	3214	Zreče
00050000-5571-a6cb-1f6d-30790506ae0c	4209	Žabnica
00050000-5571-a6cb-b2d4-5aa1bfca1634	3310	Žalec
00050000-5571-a6cb-e8b1-e46d02a860a8	4228	Železniki
00050000-5571-a6cb-8fea-094e95d1b3c3	2287	Žetale
00050000-5571-a6cb-d2f0-ac4aaf395a0e	4226	Žiri
00050000-5571-a6cb-98af-2ba2403f3d74	4274	Žirovnica
00050000-5571-a6cb-082a-bf4645c1c440	8360	Žužemberk
\.


--
-- TOC entry 2809 (class 0 OID 6466020)
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
-- TOC entry 2791 (class 0 OID 6465831)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6465909)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6466032)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6466152)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6466207)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5571-a6cc-8417-1785d038abaf	00080000-5571-a6cc-ac05-45dfd789b167	0987	A
00190000-5571-a6cc-5df9-e56d58f6d4d1	00080000-5571-a6cc-ba46-f3edc23e3e8d	0989	A
\.


--
-- TOC entry 2835 (class 0 OID 6466321)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6466349)
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
-- TOC entry 2836 (class 0 OID 6466330)
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
-- TOC entry 2815 (class 0 OID 6466061)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5571-a6cc-c1b2-397728b92cab	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5571-a6cc-6078-6bbddab02bfa	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5571-a6cc-d3c2-f7a7cd9e6035	0003	Kazinska	t	84	Kazinska dvorana
00220000-5571-a6cc-31a5-d78a77600fc9	0004	Mali oder	t	24	Mali oder 
00220000-5571-a6cc-b900-bc56b05ee24a	0005	Komorni oder	t	15	Komorni oder
00220000-5571-a6cc-eb57-2c6a434f2352	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5571-a6cc-6656-230c3b1e15d9	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2807 (class 0 OID 6466005)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6465995)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6466196)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6466129)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6465703)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5571-a6cc-2308-597d9b961d05	00010000-5571-a6cc-e2ca-bbe18f5ba3c4	2015-06-05 15:40:29	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROrgZiTAhS/ckA0gr9aq896vaskCP2ZT.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2816 (class 0 OID 6466071)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6465741)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5571-a6cb-ac9b-9970dc01706d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5571-a6cb-2481-17dbbebd6351	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5571-a6cb-ae15-e00bd1de7103	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5571-a6cb-ec3a-6df22ac95cd7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5571-a6cb-c813-20d7cf939901	planer	Planer dogodkov v koledarju	t
00020000-5571-a6cb-7f06-a61d8414db7a	kadrovska	Kadrovska služba	t
00020000-5571-a6cc-6621-86b3163797c3	arhivar	Ažuriranje arhivalij	t
00020000-5571-a6cc-171d-721f904f7013	igralec	Igralec	t
00020000-5571-a6cc-4492-2b3395bb1bd7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2782 (class 0 OID 6465725)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5571-a6cc-2308-597d9b961d05	00020000-5571-a6cb-ae15-e00bd1de7103
00010000-5571-a6cc-e2ca-bbe18f5ba3c4	00020000-5571-a6cb-ae15-e00bd1de7103
\.


--
-- TOC entry 2818 (class 0 OID 6466085)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6466026)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6465976)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6466368)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5571-a6cb-5213-e5e30eecef10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5571-a6cb-db45-bfc9a9007cdf	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5571-a6cb-5b72-533600b8aadb	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5571-a6cb-2e35-939dc39b6f39	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5571-a6cb-31d9-368cdabd711d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2840 (class 0 OID 6466360)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5571-a6cb-5a56-09c5ada64bbe	00000000-5571-a6cb-2e35-939dc39b6f39	popa
00000000-5571-a6cb-e2a6-cabef73aaf64	00000000-5571-a6cb-2e35-939dc39b6f39	oseba
00000000-5571-a6cb-b9a6-1ca6d7b1c11a	00000000-5571-a6cb-db45-bfc9a9007cdf	prostor
00000000-5571-a6cb-9be0-7a605b8c5463	00000000-5571-a6cb-2e35-939dc39b6f39	besedilo
00000000-5571-a6cb-e450-9f047d303eb4	00000000-5571-a6cb-2e35-939dc39b6f39	uprizoritev
00000000-5571-a6cb-7489-f648ae49976e	00000000-5571-a6cb-2e35-939dc39b6f39	funkcija
00000000-5571-a6cb-1203-5c6581bf3b6f	00000000-5571-a6cb-2e35-939dc39b6f39	tipfunkcije
00000000-5571-a6cb-9c98-9ee0fd7c0d04	00000000-5571-a6cb-2e35-939dc39b6f39	alternacija
00000000-5571-a6cb-1fdb-c66af551ffaf	00000000-5571-a6cb-5213-e5e30eecef10	pogodba
00000000-5571-a6cb-fbdc-536791b636f1	00000000-5571-a6cb-2e35-939dc39b6f39	zaposlitev
\.


--
-- TOC entry 2839 (class 0 OID 6466355)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6466139)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6465803)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6465982)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5571-a6cc-c7d3-6ccf20eeb4fd	00180000-5571-a6cc-d957-7bf5bcb0e685	000c0000-5571-a6cc-82a8-6097eb752488	00090000-5571-a6cc-a4a8-792d49b7443e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-a6cc-d5c9-399e2e545d8d	00180000-5571-a6cc-d957-7bf5bcb0e685	000c0000-5571-a6cc-9964-eaeb4f79081d	00090000-5571-a6cc-84ee-b21e979f7c4b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-a6cc-1713-997330140679	00180000-5571-a6cc-d957-7bf5bcb0e685	000c0000-5571-a6cc-eea1-fca0c6f279c4	00090000-5571-a6cc-2d7c-fe65285814d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-a6cc-1e78-d785d1041bde	00180000-5571-a6cc-d957-7bf5bcb0e685	000c0000-5571-a6cc-a3ec-07abe0e44287	00090000-5571-a6cc-4931-d511fc152e9e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-a6cc-1f28-a9febc910cd4	00180000-5571-a6cc-d957-7bf5bcb0e685	000c0000-5571-a6cc-2f2b-c3d40d74e77c	00090000-5571-a6cc-7857-7bdc027ac710	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-a6cc-684d-18f7057fea58	00180000-5571-a6cc-84b8-48d284740945	\N	00090000-5571-a6cc-7857-7bdc027ac710	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2826 (class 0 OID 6466185)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5571-a6cb-594c-d25a0d271147	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5571-a6cb-f045-b871ba7bde15	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5571-a6cb-68ad-9da93364e7d7	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5571-a6cb-4c19-6b8d8c16d493	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5571-a6cb-86a1-0a8935e9e427	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5571-a6cb-f1f6-b5f1ac3fb0e9	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5571-a6cb-c11b-93bff272c39c	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5571-a6cb-21a0-52abc29dfaac	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5571-a6cb-c336-b20c788a38c2	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5571-a6cb-a5f8-0dc88031f676	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5571-a6cb-b845-ba7970ceb607	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5571-a6cb-6319-9f9b51558565	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5571-a6cb-20a7-3f44605439ae	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5571-a6cb-1274-4da735351641	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5571-a6cb-0d0d-6492cf225195	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5571-a6cb-6a27-e1843bd11940	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2837 (class 0 OID 6466338)
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
-- TOC entry 2794 (class 0 OID 6465866)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6465712)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5571-a6cc-e2ca-bbe18f5ba3c4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROP42AAkwkyv4aOSCayLx21eeNppRqOGe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-b768-288e101bb432	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-05f9-a68d2106f8f4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-f566-38cfc43bcf4d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-631c-59c4efba20ce	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-99a3-169b08a3a137	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-ce38-24b7503f9384	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5571-a6cc-2308-597d9b961d05	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6466242)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5571-a6cc-d56a-c5728c3ffd02	00160000-5571-a6cc-8a38-749e423fe3c6	00150000-5571-a6cb-396d-c44ac76de5ed	00140000-5571-a6cb-6541-024851abba8a	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5571-a6cc-b900-bc56b05ee24a
000e0000-5571-a6cc-b397-328e25f979c2	00160000-5571-a6cc-3d2b-68b80143199b	00150000-5571-a6cb-fc8f-d266aecfaabe	00140000-5571-a6cb-db37-32f0b3db7880	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5571-a6cc-eb57-2c6a434f2352
\.


--
-- TOC entry 2799 (class 0 OID 6465928)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5571-a6cc-81d9-085cdb204f57	000e0000-5571-a6cc-b397-328e25f979c2	1	
00200000-5571-a6cc-0ebc-bc064a39174a	000e0000-5571-a6cc-b397-328e25f979c2	2	
\.


--
-- TOC entry 2814 (class 0 OID 6466053)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6466122)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6465960)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6466232)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5571-a6cb-6541-024851abba8a	01	Drama	drama (SURS 01)
00140000-5571-a6cb-49aa-ab06b0f27247	02	Opera	opera (SURS 02)
00140000-5571-a6cb-7611-375f1344cd72	03	Balet	balet (SURS 03)
00140000-5571-a6cb-9680-a6af26f9c8df	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5571-a6cb-efbc-a3a4b1f52b3f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5571-a6cb-db37-32f0b3db7880	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5571-a6cb-b58c-fa07ea685c8e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2820 (class 0 OID 6466112)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5571-a6cb-f74b-f8d19c0d5327	01	Opera	opera
00150000-5571-a6cb-0962-656a7d6622a0	02	Opereta	opereta
00150000-5571-a6cb-b5b3-9277eee0dd25	03	Balet	balet
00150000-5571-a6cb-1226-e1765957e95b	04	Plesne prireditve	plesne prireditve
00150000-5571-a6cb-3f27-78c3376ca445	05	Lutkovno gledališče	lutkovno gledališče
00150000-5571-a6cb-9e3e-006994bd3fe0	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5571-a6cb-9b17-6582ddf3d37c	07	Biografska drama	biografska drama
00150000-5571-a6cb-396d-c44ac76de5ed	08	Komedija	komedija
00150000-5571-a6cb-ce3d-d719fd69f94a	09	Črna komedija	črna komedija
00150000-5571-a6cb-585c-dc02469d1531	10	E-igra	E-igra
00150000-5571-a6cb-fc8f-d266aecfaabe	11	Kriminalka	kriminalka
00150000-5571-a6cb-d7c6-0fd996fb6d14	12	Musical	musical
\.


--
-- TOC entry 2372 (class 2606 OID 6465766)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6466288)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 6466278)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6466184)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6465950)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6465975)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6465892)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6466317)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6466108)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6465926)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 6465969)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 6465906)
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
-- TOC entry 2464 (class 2606 OID 6466018)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6466045)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6465864)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 6465775)
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
-- TOC entry 2379 (class 2606 OID 6465799)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6465755)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2363 (class 2606 OID 6465740)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6466051)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6466084)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6466227)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6465828)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6465852)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6466024)
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
-- TOC entry 2394 (class 2606 OID 6465842)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6465913)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6466036)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6466164)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6466212)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6466328)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6466353)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6466335)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 6466068)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6466009)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6466000)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6466206)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6466136)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6465711)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6466075)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 6465729)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2365 (class 2606 OID 6465749)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6466093)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6466031)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6465981)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6466377)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6466365)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6466359)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6466149)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 6465808)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6465991)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6466195)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6466348)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6465877)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6465724)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6466258)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6465935)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6466059)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6466127)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6465964)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6466240)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 6466120)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 1259 OID 6465957)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2512 (class 1259 OID 6466150)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2513 (class 1259 OID 6466151)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 6465830)
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
-- TOC entry 2477 (class 1259 OID 6466052)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2471 (class 1259 OID 6466038)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2472 (class 1259 OID 6466037)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2423 (class 1259 OID 6465936)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6466109)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2500 (class 1259 OID 6466111)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2501 (class 1259 OID 6466110)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2411 (class 1259 OID 6465908)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 6465907)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6466229)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 6466230)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 6466231)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2539 (class 1259 OID 6466263)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2540 (class 1259 OID 6466260)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2541 (class 1259 OID 6466262)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2542 (class 1259 OID 6466261)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2401 (class 1259 OID 6465879)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6465878)
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
-- TOC entry 2377 (class 1259 OID 6465802)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 6466076)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2441 (class 1259 OID 6465970)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2367 (class 1259 OID 6465756)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2368 (class 1259 OID 6465757)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2492 (class 1259 OID 6466096)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2493 (class 1259 OID 6466095)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 6466094)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2415 (class 1259 OID 6465914)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 6465916)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2417 (class 1259 OID 6465915)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2577 (class 1259 OID 6466367)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2451 (class 1259 OID 6466004)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2452 (class 1259 OID 6466002)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2453 (class 1259 OID 6466001)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2454 (class 1259 OID 6466003)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2358 (class 1259 OID 6465730)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2359 (class 1259 OID 6465731)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 6466060)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2466 (class 1259 OID 6466025)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2508 (class 1259 OID 6466137)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2509 (class 1259 OID 6466138)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6466318)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6466320)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6466319)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2390 (class 1259 OID 6465844)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 6465843)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2392 (class 1259 OID 6465845)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2572 (class 1259 OID 6466354)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2516 (class 1259 OID 6466165)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2517 (class 1259 OID 6466166)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2552 (class 1259 OID 6466292)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2553 (class 1259 OID 6466294)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2554 (class 1259 OID 6466290)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2555 (class 1259 OID 6466293)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2556 (class 1259 OID 6466291)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2505 (class 1259 OID 6466128)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 6466013)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2458 (class 1259 OID 6466012)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2459 (class 1259 OID 6466010)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2460 (class 1259 OID 6466011)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2548 (class 1259 OID 6466280)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 6466279)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 6466329)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2422 (class 1259 OID 6465927)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 6465777)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2374 (class 1259 OID 6465776)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2382 (class 1259 OID 6465809)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6465810)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 6465994)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 6465993)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2448 (class 1259 OID 6465992)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 6466337)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2567 (class 1259 OID 6466336)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2429 (class 1259 OID 6465959)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2430 (class 1259 OID 6465955)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2431 (class 1259 OID 6465952)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2432 (class 1259 OID 6465953)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2433 (class 1259 OID 6465951)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2434 (class 1259 OID 6465956)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2435 (class 1259 OID 6465954)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2389 (class 1259 OID 6465829)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6465893)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2408 (class 1259 OID 6465895)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2409 (class 1259 OID 6465894)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2410 (class 1259 OID 6465896)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2465 (class 1259 OID 6466019)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2535 (class 1259 OID 6466228)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6466259)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6465800)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2381 (class 1259 OID 6465801)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 6466121)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 6466378)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6465865)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 6466366)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2485 (class 1259 OID 6466070)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2486 (class 1259 OID 6466069)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 6466289)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6465853)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6466241)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6466213)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 6466214)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2366 (class 1259 OID 6465750)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2436 (class 1259 OID 6465958)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2609 (class 2606 OID 6466520)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2612 (class 2606 OID 6466505)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2611 (class 2606 OID 6466510)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2607 (class 2606 OID 6466530)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2613 (class 2606 OID 6466500)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2608 (class 2606 OID 6466525)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2610 (class 2606 OID 6466515)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2643 (class 2606 OID 6466675)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6466680)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6466435)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2630 (class 2606 OID 6466615)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2628 (class 2606 OID 6466610)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2629 (class 2606 OID 6466605)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2606 (class 2606 OID 6466495)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6466645)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6466655)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2637 (class 2606 OID 6466650)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2600 (class 2606 OID 6466470)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2601 (class 2606 OID 6466465)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6466595)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 6466700)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6466705)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6466710)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2650 (class 2606 OID 6466730)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2653 (class 2606 OID 6466715)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 6466725)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2652 (class 2606 OID 6466720)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2598 (class 2606 OID 6466460)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6466455)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2590 (class 2606 OID 6466420)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2591 (class 2606 OID 6466415)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2632 (class 2606 OID 6466625)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2614 (class 2606 OID 6466535)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2587 (class 2606 OID 6466395)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2586 (class 2606 OID 6466400)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2633 (class 2606 OID 6466640)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2634 (class 2606 OID 6466635)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2635 (class 2606 OID 6466630)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2604 (class 2606 OID 6466475)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6466485)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2603 (class 2606 OID 6466480)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 6466805)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2618 (class 2606 OID 6466570)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2620 (class 2606 OID 6466560)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2621 (class 2606 OID 6466555)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2619 (class 2606 OID 6466565)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2585 (class 2606 OID 6466385)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2584 (class 2606 OID 6466390)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2631 (class 2606 OID 6466620)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2627 (class 2606 OID 6466600)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2641 (class 2606 OID 6466665)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2640 (class 2606 OID 6466670)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6466770)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6466780)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6466775)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2596 (class 2606 OID 6466445)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6466440)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2595 (class 2606 OID 6466450)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6466800)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2645 (class 2606 OID 6466685)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 6466690)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2658 (class 2606 OID 6466755)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2656 (class 2606 OID 6466765)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2660 (class 2606 OID 6466745)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2657 (class 2606 OID 6466760)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2659 (class 2606 OID 6466750)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2639 (class 2606 OID 6466660)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2622 (class 2606 OID 6466590)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2623 (class 2606 OID 6466585)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2625 (class 2606 OID 6466575)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2624 (class 2606 OID 6466580)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 6466740)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6466735)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6466785)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6466490)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2646 (class 2606 OID 6466695)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6466410)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2589 (class 2606 OID 6466405)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2593 (class 2606 OID 6466425)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2592 (class 2606 OID 6466430)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2615 (class 2606 OID 6466550)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6466545)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2617 (class 2606 OID 6466540)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6466795)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 6466790)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-05 15:40:29 CEST

--
-- PostgreSQL database dump complete
--

