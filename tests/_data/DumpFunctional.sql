--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-09 11:55:25 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 236 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 236
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6759659)
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
-- TOC entry 227 (class 1259 OID 6760180)
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
-- TOC entry 226 (class 1259 OID 6760163)
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
-- TOC entry 219 (class 1259 OID 6760068)
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
-- TOC entry 194 (class 1259 OID 6759838)
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
-- TOC entry 197 (class 1259 OID 6759872)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6759781)
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
-- TOC entry 228 (class 1259 OID 6760194)
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
    tip character varying(15) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 6759998)
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
-- TOC entry 192 (class 1259 OID 6759818)
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
-- TOC entry 196 (class 1259 OID 6759866)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6759798)
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
-- TOC entry 202 (class 1259 OID 6759915)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6759940)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6759755)
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
-- TOC entry 181 (class 1259 OID 6759668)
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
-- TOC entry 182 (class 1259 OID 6759679)
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
-- TOC entry 177 (class 1259 OID 6759633)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6759652)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6759947)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6759978)
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
-- TOC entry 223 (class 1259 OID 6760114)
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
-- TOC entry 184 (class 1259 OID 6759712)
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
-- TOC entry 186 (class 1259 OID 6759747)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6759921)
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
-- TOC entry 185 (class 1259 OID 6759732)
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
-- TOC entry 191 (class 1259 OID 6759810)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6759933)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6760053)
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
-- TOC entry 222 (class 1259 OID 6760106)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6760220)
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
-- TOC entry 232 (class 1259 OID 6760248)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6760229)
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
-- TOC entry 209 (class 1259 OID 6759962)
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
-- TOC entry 201 (class 1259 OID 6759906)
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
-- TOC entry 200 (class 1259 OID 6759896)
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
-- TOC entry 221 (class 1259 OID 6760095)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6760030)
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
-- TOC entry 174 (class 1259 OID 6759604)
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
-- TOC entry 173 (class 1259 OID 6759602)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6759972)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6759642)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6759626)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6759986)
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
-- TOC entry 204 (class 1259 OID 6759927)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6759877)
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
-- TOC entry 235 (class 1259 OID 6760267)
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
-- TOC entry 234 (class 1259 OID 6760259)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6760254)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6760040)
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
-- TOC entry 183 (class 1259 OID 6759704)
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
-- TOC entry 199 (class 1259 OID 6759883)
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
-- TOC entry 220 (class 1259 OID 6760084)
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
-- TOC entry 231 (class 1259 OID 6760237)
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
-- TOC entry 188 (class 1259 OID 6759767)
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
-- TOC entry 175 (class 1259 OID 6759613)
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
-- TOC entry 225 (class 1259 OID 6760141)
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
-- TOC entry 193 (class 1259 OID 6759829)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6759954)
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
-- TOC entry 215 (class 1259 OID 6760023)
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
-- TOC entry 195 (class 1259 OID 6759861)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6760131)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6760013)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2168 (class 2604 OID 6759607)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2778 (class 0 OID 6759659)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6760180)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5576-b80d-984f-13b91c34f2d3	000d0000-5576-b80d-47fa-ad8ac7e84368	\N	00090000-5576-b80d-3c82-c0d72b1dac8c	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-b80d-66b3-13a85d7da9cf	000d0000-5576-b80d-0abb-3c4d37a42b02	\N	00090000-5576-b80d-f1f7-6c090598483d	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-b80d-b4c9-e9a7df41aa49	000d0000-5576-b80d-977c-f295184fd492	\N	00090000-5576-b80c-f5fe-a8e4b8a9b643	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-b80d-39ae-1839017420d6	000d0000-5576-b80d-f31f-3936f04f5c3f	\N	00090000-5576-b80c-c7d6-fb25977f91d8	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-b80d-2180-ad3854a1b602	000d0000-5576-b80d-0166-42eb2ea1a150	\N	00090000-5576-b80d-a6ec-c39cd4cc39a3	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-b80d-e4df-da9c936711e8	000d0000-5576-b80d-90f1-27e106bb0d26	\N	00090000-5576-b80d-f1f7-6c090598483d	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 6760163)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6760068)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5576-b80c-dee0-db3d9c479e35	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5576-b80c-17e6-abbca0d654ec	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5576-b80c-f820-08b6595346a6	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2792 (class 0 OID 6759838)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5576-b80d-5126-ea9bd068adf9	\N	\N	00200000-5576-b80d-cf5e-953882bf0915	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5576-b80d-bda4-5e07e80e10d0	\N	\N	00200000-5576-b80d-014e-8093ed5dbb8c	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5576-b80d-0ce1-a7db8c3fb588	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5576-b80d-8222-45ca1d5cd2cd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5576-b80d-b7f5-64dac68b43ba	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2795 (class 0 OID 6759872)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6759781)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5576-b80b-d7aa-601eb2c9596a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5576-b80b-f811-05eb1f289e77	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5576-b80b-5e36-c904ddfda751	AL	ALB	008	Albania 	Albanija	\N
00040000-5576-b80b-87f8-9a0a57f1afdd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5576-b80b-1bee-d19dea3d9d69	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5576-b80b-19d0-92a15e737de6	AD	AND	020	Andorra 	Andora	\N
00040000-5576-b80b-f4d6-8ebd26cc64c0	AO	AGO	024	Angola 	Angola	\N
00040000-5576-b80b-a3c4-d62d165fb752	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5576-b80b-6254-31b782c1f641	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5576-b80b-2379-7673882d1eee	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5576-b80b-b0a4-2757c8289c10	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5576-b80b-5ade-de17f0575f9f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5576-b80b-c645-b774c23443a1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5576-b80b-bf52-7b0258095082	AU	AUS	036	Australia 	Avstralija	\N
00040000-5576-b80b-7c37-be9b4ed40414	AT	AUT	040	Austria 	Avstrija	\N
00040000-5576-b80b-8434-721b7013f673	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5576-b80b-5230-3c2c6f13e729	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5576-b80b-92a4-7b39d2c0ae4a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5576-b80b-90e1-cb3bc3341cf2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5576-b80b-959d-dff1deb0765e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5576-b80b-30bd-bcd30644c6d2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5576-b80b-7937-ceddc742b665	BE	BEL	056	Belgium 	Belgija	\N
00040000-5576-b80b-8f6d-941fd6c9b706	BZ	BLZ	084	Belize 	Belize	\N
00040000-5576-b80b-f05d-fc89723ac1b3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5576-b80b-872a-bb48344b2db7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5576-b80b-2332-a01d7bebb665	BT	BTN	064	Bhutan 	Butan	\N
00040000-5576-b80b-acc7-31e236cfe149	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5576-b80b-f85e-e5758affe002	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5576-b80b-7d53-eca7d6e1871a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5576-b80b-8a24-4e5a87cdce23	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5576-b80b-c3b6-6637a2ea1e16	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5576-b80b-9eda-49fc0b46c417	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5576-b80b-3b7b-b63e8ce65009	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5576-b80b-2c4c-24e447a4dd2f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5576-b80b-ea50-fc14df4b2fd2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5576-b80b-9e4d-91fca3e542a7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5576-b80b-a972-b093f45b4677	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5576-b80b-a8d2-45f8b2186d22	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5576-b80b-4b1f-e48d2bb2d5e4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5576-b80b-e8bd-17aead7274b1	CA	CAN	124	Canada 	Kanada	\N
00040000-5576-b80b-dd0e-6b78e7deec8d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5576-b80b-dc44-a47160cc9b47	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5576-b80b-d794-aecfcdc22263	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5576-b80b-c8f6-3ad6ea0849fd	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5576-b80b-2040-fb2d4c2da260	CL	CHL	152	Chile 	Čile	\N
00040000-5576-b80b-066f-14035f32aec5	CN	CHN	156	China 	Kitajska	\N
00040000-5576-b80b-4486-242a673b0daa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5576-b80b-4561-5165d8eb5274	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5576-b80b-73d9-ff9a1c7b1480	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5576-b80b-f543-1140b69255c3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5576-b80b-7a3d-47e95d1e5c1e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5576-b80b-bf4f-985654366930	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5576-b80b-b0f4-db82d27fdfb1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5576-b80b-03ed-9d8c0450be92	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5576-b80b-2065-bef066a6ddfc	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5576-b80b-7cc3-545e8e198e10	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5576-b80b-f1d1-ac04863040f2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5576-b80b-86c1-76a170fedc10	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5576-b80b-3c06-74f9f233812b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5576-b80b-6a85-6ef208ff4503	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5576-b80b-3d2f-eb0df63a490e	DK	DNK	208	Denmark 	Danska	\N
00040000-5576-b80b-8d75-a8daa74b52cf	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5576-b80b-e2a7-75039c9e1db2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5576-b80b-dbf9-50f374ee1cdc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5576-b80b-dbd2-1d6b57d02499	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5576-b80b-1a98-411f48334673	EG	EGY	818	Egypt 	Egipt	\N
00040000-5576-b80b-e24c-20166225ce2f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5576-b80b-2d04-f2059d8c4159	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5576-b80b-1bfd-7c35a0a3683c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5576-b80b-37fa-3c3acf23c05a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5576-b80b-7bb7-72ae462a33b1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5576-b80b-6f30-22ed55d4fe2b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5576-b80b-7d70-9fd0c802f16c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5576-b80b-99bf-7dcdb4aa324b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5576-b80b-e50b-0f6291e86927	FI	FIN	246	Finland 	Finska	\N
00040000-5576-b80b-4685-ebab689bda44	FR	FRA	250	France 	Francija	\N
00040000-5576-b80b-34da-3b0be49d198c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5576-b80b-1701-6e19227e9af3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5576-b80b-da60-d024a28b2837	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5576-b80b-82de-7b46ea72004d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5576-b80b-6aed-0e7a52fca4dc	GA	GAB	266	Gabon 	Gabon	\N
00040000-5576-b80b-0010-5b0f1614491d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5576-b80b-4438-8457f53979af	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5576-b80b-530b-67f9e14827c1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5576-b80b-907b-9678302de255	GH	GHA	288	Ghana 	Gana	\N
00040000-5576-b80b-6a54-4a95b41c8454	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5576-b80b-1f9f-eeda7d58e443	GR	GRC	300	Greece 	Grčija	\N
00040000-5576-b80b-654b-5a2ae181075a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5576-b80b-2d08-a406c3f44cc8	GD	GRD	308	Grenada 	Grenada	\N
00040000-5576-b80b-5af3-631379c2996c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5576-b80b-75d3-a5e17617b3c7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5576-b80b-e70c-1625611fe6e5	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5576-b80b-a7ba-7b1dc588ecf9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5576-b80b-2b9f-966579662680	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5576-b80b-4db7-0d50b358bdac	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5576-b80b-f2ce-999bd7574c87	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5576-b80b-5c4f-a43ea8b538de	HT	HTI	332	Haiti 	Haiti	\N
00040000-5576-b80b-1161-b80cbde33f6a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5576-b80b-e815-cd1e8718a725	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5576-b80b-2e9d-757705e630bb	HN	HND	340	Honduras 	Honduras	\N
00040000-5576-b80b-b0e7-5298615709e0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5576-b80b-e6ae-4d8a083db253	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5576-b80b-b082-d68ec38c005d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5576-b80b-c761-1e5e9c09c591	IN	IND	356	India 	Indija	\N
00040000-5576-b80b-b499-bb28ec0565d1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5576-b80b-81cc-b1ffad6a957c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5576-b80b-7e21-01edbe6018bd	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5576-b80b-6d46-8f92f73845d7	IE	IRL	372	Ireland 	Irska	\N
00040000-5576-b80b-1acb-fcec824da0d0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5576-b80b-d930-7371d9dbe1e3	IL	ISR	376	Israel 	Izrael	\N
00040000-5576-b80b-3075-a04505f0a622	IT	ITA	380	Italy 	Italija	\N
00040000-5576-b80b-dc68-f4c953ed1c6b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5576-b80b-825b-6885eaa45f40	JP	JPN	392	Japan 	Japonska	\N
00040000-5576-b80b-2d70-ca85c7a906e1	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5576-b80b-6c47-e86b2923aca7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5576-b80b-7024-68895c32cf0f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5576-b80b-f62a-d13510556ad2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5576-b80b-d630-61c5ca266e6b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5576-b80b-eaaf-fdf1d258e389	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5576-b80b-7fb9-2edaaca25d34	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5576-b80b-071a-da7e4c84cb50	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5576-b80b-117d-9acb6d575f9a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5576-b80b-bdd8-41cf4a049e18	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5576-b80b-4639-3d1e0988c39f	LV	LVA	428	Latvia 	Latvija	\N
00040000-5576-b80b-8e77-0ff96fd12436	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5576-b80b-df7e-e58d5e57ac56	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5576-b80b-2f12-96d7887e7342	LR	LBR	430	Liberia 	Liberija	\N
00040000-5576-b80b-c889-682b9a878c78	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5576-b80b-5581-102afeee96e3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5576-b80b-601e-15656565e77f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5576-b80b-e567-fd1de0c4dc16	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5576-b80b-8ff6-4e58d487ecfa	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5576-b80b-6a5d-0ef40d8423cd	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5576-b80b-15aa-5858d21b7ab0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5576-b80b-9788-782728895067	MW	MWI	454	Malawi 	Malavi	\N
00040000-5576-b80b-4bd0-228871ec03c2	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5576-b80b-0c0e-01d3a9703b8a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5576-b80b-5860-f621937e4f5a	ML	MLI	466	Mali 	Mali	\N
00040000-5576-b80b-5002-24bcd07c2968	MT	MLT	470	Malta 	Malta	\N
00040000-5576-b80b-f7d8-919bb88695e6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5576-b80b-6aa7-f9c38461f597	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5576-b80b-c8bd-51d7ca07b4b0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5576-b80b-91b6-bf96da8b1443	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5576-b80b-fd52-0ab6f51188a3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5576-b80b-21e6-7351d5e28857	MX	MEX	484	Mexico 	Mehika	\N
00040000-5576-b80b-2a07-017c5b99b71c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5576-b80b-5265-cf4a6719cc84	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5576-b80b-2e84-fb27856f53d4	MC	MCO	492	Monaco 	Monako	\N
00040000-5576-b80b-a1bb-69ac32b71cd6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5576-b80b-f2a6-e6cfc496165c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5576-b80b-b4bf-1fc85c3e073d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5576-b80b-09dc-e0265a90a2e5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5576-b80b-d3bf-c88e782a1de7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5576-b80b-efd7-b7f363ecc1d1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5576-b80b-b11b-3cd195793399	NA	NAM	516	Namibia 	Namibija	\N
00040000-5576-b80b-d659-b5cb86b139f0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5576-b80b-d2b4-fea59c10db28	NP	NPL	524	Nepal 	Nepal	\N
00040000-5576-b80b-f7e6-2e0eea87fcf2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5576-b80b-1e85-38cfe455d588	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5576-b80b-4c8a-7a51e71e53d3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5576-b80b-a5b5-1869f2869af2	NE	NER	562	Niger 	Niger 	\N
00040000-5576-b80b-18e3-75e03cfc28a2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5576-b80b-3156-f09d279c2f8a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5576-b80b-e1a0-e9edb87c7f22	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5576-b80b-7817-dfeb6d3722ef	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5576-b80b-9524-e2363b62250d	NO	NOR	578	Norway 	Norveška	\N
00040000-5576-b80b-9488-9fc41b9a83fe	OM	OMN	512	Oman 	Oman	\N
00040000-5576-b80b-0b8d-28ff81a41aeb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5576-b80b-9266-eceb11e7c438	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5576-b80b-6381-200bb4165c81	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5576-b80b-3ac6-3cbe290b0134	PA	PAN	591	Panama 	Panama	\N
00040000-5576-b80b-7aa8-e724caa362ac	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5576-b80b-a1e9-7deca496bd9e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5576-b80b-9b03-b4477d25dadc	PE	PER	604	Peru 	Peru	\N
00040000-5576-b80b-3ac8-2a2139d7bc23	PH	PHL	608	Philippines 	Filipini	\N
00040000-5576-b80b-3ab1-966d59939190	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5576-b80b-5c63-cfbd6c9c5720	PL	POL	616	Poland 	Poljska	\N
00040000-5576-b80b-151d-703744b08b23	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5576-b80b-6f6f-0754c5f7904b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5576-b80b-90a0-e341d2e2e2c8	QA	QAT	634	Qatar 	Katar	\N
00040000-5576-b80b-159a-45e8e86444ac	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5576-b80b-b360-806be796e018	RO	ROU	642	Romania 	Romunija	\N
00040000-5576-b80b-412d-2583e6882fa0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5576-b80b-db7d-841c1740560a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5576-b80b-6df4-87af2ac3ecdc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5576-b80b-8e99-e9a436318b09	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5576-b80b-69d1-633944376156	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5576-b80b-97e4-f87781b71866	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5576-b80b-005f-17df229c29e3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5576-b80b-3d28-3bd38421aca0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5576-b80b-a2fa-9abf5ae13e30	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5576-b80b-d67f-88a37ea77c22	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5576-b80b-2e01-9553fa353bf1	SM	SMR	674	San Marino 	San Marino	\N
00040000-5576-b80b-90d5-0c30e34a1bce	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5576-b80b-17b9-af317901ec2b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5576-b80b-ce5a-f897d6ad0da1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5576-b80b-bc38-6fe1affcacc0	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5576-b80b-96e4-074bb97bc57c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5576-b80b-4d4b-6bf62275ecb2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5576-b80b-6442-fa8f7e65b194	SG	SGP	702	Singapore 	Singapur	\N
00040000-5576-b80b-09f2-116fe4e7c137	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5576-b80b-79ee-292a86eca697	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5576-b80b-7789-573904d167f2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5576-b80b-d71f-c3378dd21ccf	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5576-b80b-b888-9ac16a507d33	SO	SOM	706	Somalia 	Somalija	\N
00040000-5576-b80b-6cf4-79a154155289	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5576-b80b-1be5-cbdcf98631ae	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5576-b80b-ddde-f712468180d6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5576-b80b-d1f3-4d779e6c65a2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5576-b80b-df4d-fdba49f8109a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5576-b80b-8849-c0ac92c1759b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5576-b80b-73fd-658a31f08ebf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5576-b80b-b70e-eeb568d93637	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5576-b80b-ace8-3eae095b75fb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5576-b80b-2fbe-e49b910382a7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5576-b80b-9cda-d6b2f6152efa	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5576-b80b-0ce6-37f2ac452af9	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5576-b80b-6b19-2a9da22a38ef	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5576-b80b-d65b-149fc5e57724	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5576-b80b-057f-9a7b3469e627	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5576-b80b-3370-a7abdf0a0c43	TH	THA	764	Thailand 	Tajska	\N
00040000-5576-b80b-3bdd-1f979550d956	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5576-b80b-0cca-5354de6ec904	TG	TGO	768	Togo 	Togo	\N
00040000-5576-b80b-dfb8-bb6f580a0c69	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5576-b80b-91db-f814d93f8a27	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5576-b80b-412b-463329829d54	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5576-b80b-af51-2e951968d87a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5576-b80b-a373-b70a25c13a7d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5576-b80b-8f0f-8827fdea34f0	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5576-b80b-4f47-e482e8e4e91e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5576-b80b-f1c4-7dde1cd6b5d1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5576-b80b-da6c-875342cda4be	UG	UGA	800	Uganda 	Uganda	\N
00040000-5576-b80b-02dc-5122ae67a087	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5576-b80b-6ac9-ccab9f73dc6e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5576-b80b-37a8-703c4c820851	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5576-b80b-479f-174242448c91	US	USA	840	United States 	Združene države Amerike	\N
00040000-5576-b80b-cae6-f809049f6a66	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5576-b80b-ac8f-aa25a3960d93	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5576-b80b-c370-4b47ce3192a4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5576-b80b-40c4-e998781b7c4e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5576-b80b-b542-cad58dd7e53d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5576-b80b-7274-fa123e27e44c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5576-b80b-b448-0e55d2be99e0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5576-b80b-fef6-4a3b2278e646	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5576-b80b-b1e6-6d82372660ad	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5576-b80b-e99f-becb8e2ee76f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5576-b80b-5012-6ecdebaf6787	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5576-b80b-1f72-f6dbb978b8c4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5576-b80b-936b-0c65ba3b5942	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2826 (class 0 OID 6760194)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6759998)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5576-b80d-d847-f0770b09a477	000e0000-5576-b80c-087a-c30ca101cb06	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5576-b80b-ad8b-a366ef19ae16
000d0000-5576-b80d-47fa-ad8ac7e84368	000e0000-5576-b80c-087a-c30ca101cb06	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5576-b80b-ad8b-a366ef19ae16
000d0000-5576-b80d-0abb-3c4d37a42b02	000e0000-5576-b80c-087a-c30ca101cb06	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5576-b80b-6cd9-2ae42190048f
000d0000-5576-b80d-977c-f295184fd492	000e0000-5576-b80c-087a-c30ca101cb06	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5576-b80b-683e-419a01061982
000d0000-5576-b80d-f31f-3936f04f5c3f	000e0000-5576-b80c-087a-c30ca101cb06	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5576-b80b-683e-419a01061982
000d0000-5576-b80d-0166-42eb2ea1a150	000e0000-5576-b80c-087a-c30ca101cb06	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5576-b80b-683e-419a01061982
000d0000-5576-b80d-90f1-27e106bb0d26	000e0000-5576-b80c-087a-c30ca101cb06	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5576-b80b-ad8b-a366ef19ae16
\.


--
-- TOC entry 2790 (class 0 OID 6759818)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6759866)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6759798)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5576-b80d-8ae6-79ee5b799beb	00080000-5576-b80c-424a-72370b079e01	00090000-5576-b80d-3c82-c0d72b1dac8c	AK		
\.


--
-- TOC entry 2768 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6759915)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6759940)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6759755)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5576-b80c-76d0-cf638e2fed83	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5576-b80c-581b-94e979debf3f	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5576-b80c-f4f4-caf477e9d04d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5576-b80c-3259-129ea5bf4b57	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5576-b80c-a5b3-ad332de8d1cc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5576-b80c-6a37-c4330133b78b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5576-b80c-effe-99a056f0a40a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5576-b80c-fcd1-f518cad08067	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5576-b80c-1ada-b148b48954c8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5576-b80c-14be-dad0081fda92	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5576-b80c-5f6e-9edcbae8e02a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5576-b80c-778c-f905b1c84143	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5576-b80c-7ed1-059d1e47745d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5576-b80c-5751-b7c37f5dade2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5576-b80c-8479-d0e6e5c1df0b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5576-b80c-8ffe-a2f6223ff8ec	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2779 (class 0 OID 6759668)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5576-b80c-74f5-0187765b3564	00000000-5576-b80c-a5b3-ad332de8d1cc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5576-b80c-0424-ff8a170697ac	00000000-5576-b80c-a5b3-ad332de8d1cc	00010000-5576-b80c-3437-8dcb1fb8e0b0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5576-b80c-b53b-342595b034ec	00000000-5576-b80c-6a37-c4330133b78b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2780 (class 0 OID 6759679)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5576-b80c-30bd-9fd8377c18ad	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5576-b80c-c7d6-fb25977f91d8	00010000-5576-b80c-b336-1f75a68b2cf8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5576-b80c-f5fe-a8e4b8a9b643	00010000-5576-b80c-a331-9f05a78789b5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5576-b80c-94c3-91278d2bc845	00010000-5576-b80c-f146-976132ff2bf3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5576-b80c-f531-0e23934b70f0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5576-b80d-9265-9be81c9542f9	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5576-b80d-3502-19b4585aae9e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5576-b80d-d6e0-e06f4b937396	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5576-b80d-3c82-c0d72b1dac8c	00010000-5576-b80c-321b-d9436f611145	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5576-b80d-f1f7-6c090598483d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5576-b80d-b127-2b96927e71fe	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5576-b80d-a6ec-c39cd4cc39a3	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5576-b80d-1059-9bc77dbeb10e	00010000-5576-b80c-6d65-4bedcdbbb85b	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2770 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6759633)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5576-b80b-5456-8d597cdf85cf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5576-b80b-55f1-6476adba21dd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5576-b80b-4adc-01c6a95a7011	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5576-b80b-8a88-3215f0af3a8e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5576-b80b-ce63-dabe8462e464	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5576-b80b-966e-6f10895f46c6	Abonma-read	Abonma - branje	f
00030000-5576-b80b-dd37-794f605dee52	Abonma-write	Abonma - spreminjanje	f
00030000-5576-b80b-267e-e168ad4e9180	Alternacija-read	Alternacija - branje	f
00030000-5576-b80b-aadc-06aa748b4119	Alternacija-write	Alternacija - spreminjanje	f
00030000-5576-b80b-0446-9916d7d29735	Arhivalija-read	Arhivalija - branje	f
00030000-5576-b80b-bfc5-15ea0c4f1f09	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5576-b80b-8285-c2d16c7694ab	Besedilo-read	Besedilo - branje	f
00030000-5576-b80b-bfdc-fc6a2282c42f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5576-b80b-3e34-683249364630	DogodekIzven-read	DogodekIzven - branje	f
00030000-5576-b80b-3b94-c91d31fd9e2f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5576-b80b-e971-14302b2823fd	Dogodek-read	Dogodek - branje	f
00030000-5576-b80b-0173-f57730700741	Dogodek-write	Dogodek - spreminjanje	f
00030000-5576-b80b-5cec-3c73d5d727e7	Drzava-read	Drzava - branje	f
00030000-5576-b80b-f605-47a5832536c9	Drzava-write	Drzava - spreminjanje	f
00030000-5576-b80b-5b57-a9fa6b2d99fb	Funkcija-read	Funkcija - branje	f
00030000-5576-b80b-2ced-bacf3e7ef425	Funkcija-write	Funkcija - spreminjanje	f
00030000-5576-b80b-a49f-96a7ebccaee9	Gostovanje-read	Gostovanje - branje	f
00030000-5576-b80b-e8e2-fc298fe1d508	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5576-b80b-94c2-3ec6d03bdaeb	Gostujoca-read	Gostujoca - branje	f
00030000-5576-b80b-1923-4c4956cc5af8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5576-b80b-0214-fe86de3f75c7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5576-b80b-7f70-5e9adff0a1d7	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5576-b80b-ce23-17b69f01ddb2	Kupec-read	Kupec - branje	f
00030000-5576-b80b-d550-7a4ec27df0a4	Kupec-write	Kupec - spreminjanje	f
00030000-5576-b80b-af7b-92950f659ff4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5576-b80b-0e65-624054c11024	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5576-b80b-190e-67a63b801f4a	Option-read	Option - branje	f
00030000-5576-b80b-38ba-aad6e14be230	Option-write	Option - spreminjanje	f
00030000-5576-b80b-c3b7-93ce499b2456	OptionValue-read	OptionValue - branje	f
00030000-5576-b80b-01b5-5f2969912a64	OptionValue-write	OptionValue - spreminjanje	f
00030000-5576-b80b-e4cd-9b7c03278288	Oseba-read	Oseba - branje	f
00030000-5576-b80b-c870-013bf9fde610	Oseba-write	Oseba - spreminjanje	f
00030000-5576-b80b-9b1e-d1390f88255a	Permission-read	Permission - branje	f
00030000-5576-b80b-306b-4eee93e1919a	Permission-write	Permission - spreminjanje	f
00030000-5576-b80b-ac18-cbbe8d816343	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5576-b80b-254a-ae091eb1f72a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5576-b80b-2776-f5c6129a8c25	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5576-b80b-e990-c6cdd641a1b4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5576-b80b-3b85-018d773524c9	Pogodba-read	Pogodba - branje	f
00030000-5576-b80b-edc1-efc9b671ba7e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5576-b80b-57cc-013eb33dfeff	Popa-read	Popa - branje	f
00030000-5576-b80b-e953-ce84d7b99c87	Popa-write	Popa - spreminjanje	f
00030000-5576-b80b-637d-d5e6bf4655b8	Posta-read	Posta - branje	f
00030000-5576-b80b-e016-286dd1b1e15e	Posta-write	Posta - spreminjanje	f
00030000-5576-b80b-0e37-ac602d3be215	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5576-b80b-0657-34000e12bc78	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5576-b80b-5ee9-9c30d7cee885	PostniNaslov-read	PostniNaslov - branje	f
00030000-5576-b80b-a028-e0d65f0220e7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5576-b80b-d8e1-0ad590acac94	Predstava-read	Predstava - branje	f
00030000-5576-b80b-cc6d-5db0768bc494	Predstava-write	Predstava - spreminjanje	f
00030000-5576-b80b-fee0-bedbb37f96fc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5576-b80b-d2d9-293e99a5d50d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5576-b80b-7fcb-bee0a134f786	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5576-b80b-5381-921d7de0a65f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5576-b80b-42b6-9a7c7d853dee	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5576-b80b-4ebd-45defc5371cf	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5576-b80b-0c32-541f1aa3060b	ProgramDela-read	ProgramDela - branje	f
00030000-5576-b80b-c4b4-710dfee1dc0f	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5576-b80b-e4e0-ac7fe13a6fe3	ProgramFestival-read	ProgramFestival - branje	f
00030000-5576-b80b-d25a-8b24ce5bd951	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5576-b80b-9660-ccfac3dfc9aa	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5576-b80b-4f37-55a974c7c398	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5576-b80b-ca7b-8ccabe610297	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5576-b80b-944d-1b35fdd71ca8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5576-b80b-eb2c-5cca4d87079f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5576-b80b-8b64-adae9d3813da	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5576-b80b-6a08-c376dfcc397e	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5576-b80b-d043-96b7f95a61f6	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5576-b80b-4c4e-36872b478388	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5576-b80b-23d2-f736d153eb09	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5576-b80b-693a-3030948c20dd	Prostor-read	Prostor - branje	f
00030000-5576-b80b-fc45-fdd6cd236177	Prostor-write	Prostor - spreminjanje	f
00030000-5576-b80b-d68d-0e2ee35fd5e8	Racun-read	Racun - branje	f
00030000-5576-b80b-5a61-af797e9517a8	Racun-write	Racun - spreminjanje	f
00030000-5576-b80b-8ca8-0574074ef0c6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5576-b80b-64f5-29ef80125e6c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5576-b80b-fe4d-34cbb9545b33	Readme-read	Readme - branje	f
00030000-5576-b80b-485d-9f103f53e241	Readme-write	Readme - spreminjanje	f
00030000-5576-b80b-32ae-6d94d061274e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5576-b80b-9b14-a19cf5fd19bb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5576-b80b-8d2b-82c55c43ee06	Rekvizit-read	Rekvizit - branje	f
00030000-5576-b80b-2e17-9effbbe7824d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5576-b80b-e227-4a55d9e7b104	Revizija-read	Revizija - branje	f
00030000-5576-b80b-ccfe-cf5300401866	Revizija-write	Revizija - spreminjanje	f
00030000-5576-b80b-64d5-3b7204f956c4	Rezervacija-read	Rezervacija - branje	f
00030000-5576-b80b-a455-5375365d9a05	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5576-b80b-9a25-da1935fb8021	Role-read	Role - branje	f
00030000-5576-b80b-1341-2c7260fcf8bf	Role-write	Role - spreminjanje	f
00030000-5576-b80b-0d10-b3357dc93adc	SedezniRed-read	SedezniRed - branje	f
00030000-5576-b80b-e290-4bf406d09f03	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5576-b80b-c32b-769ba00e785b	Sedez-read	Sedez - branje	f
00030000-5576-b80b-01a4-7e87ee566fc4	Sedez-write	Sedez - spreminjanje	f
00030000-5576-b80b-ab0d-4ae0e6d13ca8	Sezona-read	Sezona - branje	f
00030000-5576-b80b-bccd-0738dac8de1f	Sezona-write	Sezona - spreminjanje	f
00030000-5576-b80b-f0e6-7c94eddf9c3a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5576-b80b-7456-4d4824b64dd0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5576-b80b-9782-bb6deb7af017	Stevilcenje-read	Stevilcenje - branje	f
00030000-5576-b80b-5003-107df431e8f8	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5576-b80b-70d4-9c481e96d476	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5576-b80b-409e-d4fca40ae333	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5576-b80b-05e3-3a30e862db01	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5576-b80b-2400-e209ca4f1b69	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5576-b80b-df66-bf53c8f04526	Telefonska-read	Telefonska - branje	f
00030000-5576-b80b-f3f0-2de91edb316c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5576-b80b-dfca-d50493426eaa	TerminStoritve-read	TerminStoritve - branje	f
00030000-5576-b80b-c90d-fa5bb8503f17	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5576-b80b-a4b3-b70e9beeca40	TipFunkcije-read	TipFunkcije - branje	f
00030000-5576-b80b-75b0-cb6f9bc0dd4f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5576-b80b-80c0-798e5e95776b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5576-b80b-cfd0-fa01c3029fe6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5576-b80b-b1c4-0ce97851948f	Trr-read	Trr - branje	f
00030000-5576-b80b-ed5d-91635cdf3580	Trr-write	Trr - spreminjanje	f
00030000-5576-b80b-cc69-b670016a9f98	Uprizoritev-read	Uprizoritev - branje	f
00030000-5576-b80b-202a-83e0825822d9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5576-b80b-ddbc-5021ed15feb0	User-read	User - branje	f
00030000-5576-b80b-234d-d3e65ab04159	User-write	User - spreminjanje	f
00030000-5576-b80b-4a5c-42877c659c43	Vaja-read	Vaja - branje	f
00030000-5576-b80b-e069-85b93095efa1	Vaja-write	Vaja - spreminjanje	f
00030000-5576-b80b-6cf9-9573f335c470	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5576-b80b-6663-7c8ff90a9d7a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5576-b80b-f0ad-f62f922674f8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5576-b80b-1d6e-ead865ac3d94	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5576-b80b-25a9-3a919f91297e	Zasedenost-read	Zasedenost - branje	f
00030000-5576-b80b-4f40-9ac036538306	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5576-b80b-0685-9713293f5462	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5576-b80b-19e1-0d9664366e4f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5576-b80b-556e-5dcae826431a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5576-b80b-4f7f-0f571a491e6e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2777 (class 0 OID 6759652)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5576-b80c-e7e0-99c18e32ef35	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-966e-6f10895f46c6
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-dd37-794f605dee52
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-267e-e168ad4e9180
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-aadc-06aa748b4119
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-0446-9916d7d29735
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e971-14302b2823fd
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-8a88-3215f0af3a8e
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-0173-f57730700741
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-f605-47a5832536c9
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-5b57-a9fa6b2d99fb
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-2ced-bacf3e7ef425
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-a49f-96a7ebccaee9
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e8e2-fc298fe1d508
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-94c2-3ec6d03bdaeb
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-1923-4c4956cc5af8
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-0214-fe86de3f75c7
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-7f70-5e9adff0a1d7
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-190e-67a63b801f4a
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-c3b7-93ce499b2456
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e4cd-9b7c03278288
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-c870-013bf9fde610
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-57cc-013eb33dfeff
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e953-ce84d7b99c87
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-637d-d5e6bf4655b8
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e016-286dd1b1e15e
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-5ee9-9c30d7cee885
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-a028-e0d65f0220e7
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-d8e1-0ad590acac94
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-cc6d-5db0768bc494
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-42b6-9a7c7d853dee
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-4ebd-45defc5371cf
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-693a-3030948c20dd
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-fc45-fdd6cd236177
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-32ae-6d94d061274e
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-9b14-a19cf5fd19bb
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-8d2b-82c55c43ee06
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-2e17-9effbbe7824d
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-ab0d-4ae0e6d13ca8
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-bccd-0738dac8de1f
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-a4b3-b70e9beeca40
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-cc69-b670016a9f98
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-202a-83e0825822d9
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-4a5c-42877c659c43
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-e069-85b93095efa1
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-25a9-3a919f91297e
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-4f40-9ac036538306
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-0685-9713293f5462
00020000-5576-b80c-2b08-8eb668c760c3	00030000-5576-b80b-556e-5dcae826431a
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-966e-6f10895f46c6
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-0446-9916d7d29735
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-e971-14302b2823fd
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-a49f-96a7ebccaee9
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-94c2-3ec6d03bdaeb
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-0214-fe86de3f75c7
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-7f70-5e9adff0a1d7
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-190e-67a63b801f4a
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-c3b7-93ce499b2456
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-e4cd-9b7c03278288
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-c870-013bf9fde610
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-57cc-013eb33dfeff
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-637d-d5e6bf4655b8
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-5ee9-9c30d7cee885
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-a028-e0d65f0220e7
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-d8e1-0ad590acac94
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-693a-3030948c20dd
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-32ae-6d94d061274e
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-8d2b-82c55c43ee06
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-ab0d-4ae0e6d13ca8
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-df66-bf53c8f04526
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-f3f0-2de91edb316c
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-b1c4-0ce97851948f
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-ed5d-91635cdf3580
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-f0ad-f62f922674f8
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-1d6e-ead865ac3d94
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-0685-9713293f5462
00020000-5576-b80c-c6da-cd7ef36a132d	00030000-5576-b80b-556e-5dcae826431a
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-966e-6f10895f46c6
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-267e-e168ad4e9180
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-0446-9916d7d29735
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-bfc5-15ea0c4f1f09
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-8285-c2d16c7694ab
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-3e34-683249364630
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-e971-14302b2823fd
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-5b57-a9fa6b2d99fb
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-a49f-96a7ebccaee9
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-94c2-3ec6d03bdaeb
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-0214-fe86de3f75c7
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-190e-67a63b801f4a
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-c3b7-93ce499b2456
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-e4cd-9b7c03278288
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-57cc-013eb33dfeff
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-637d-d5e6bf4655b8
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-d8e1-0ad590acac94
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-42b6-9a7c7d853dee
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-693a-3030948c20dd
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-32ae-6d94d061274e
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-8d2b-82c55c43ee06
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-ab0d-4ae0e6d13ca8
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-a4b3-b70e9beeca40
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-4a5c-42877c659c43
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-25a9-3a919f91297e
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-0685-9713293f5462
00020000-5576-b80c-e450-5fdc487cbf1f	00030000-5576-b80b-556e-5dcae826431a
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-966e-6f10895f46c6
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-dd37-794f605dee52
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-aadc-06aa748b4119
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-0446-9916d7d29735
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-e971-14302b2823fd
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-a49f-96a7ebccaee9
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-94c2-3ec6d03bdaeb
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-190e-67a63b801f4a
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-c3b7-93ce499b2456
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-57cc-013eb33dfeff
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-637d-d5e6bf4655b8
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-d8e1-0ad590acac94
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-693a-3030948c20dd
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-32ae-6d94d061274e
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-8d2b-82c55c43ee06
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-ab0d-4ae0e6d13ca8
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-a4b3-b70e9beeca40
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-0685-9713293f5462
00020000-5576-b80c-ab00-a522a3d9f60a	00030000-5576-b80b-556e-5dcae826431a
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-966e-6f10895f46c6
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-0446-9916d7d29735
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-e971-14302b2823fd
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-5cec-3c73d5d727e7
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-a49f-96a7ebccaee9
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-94c2-3ec6d03bdaeb
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-190e-67a63b801f4a
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-c3b7-93ce499b2456
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-57cc-013eb33dfeff
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-637d-d5e6bf4655b8
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-d8e1-0ad590acac94
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-693a-3030948c20dd
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-32ae-6d94d061274e
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-8d2b-82c55c43ee06
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-ab0d-4ae0e6d13ca8
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-dfca-d50493426eaa
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-4adc-01c6a95a7011
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-a4b3-b70e9beeca40
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-0685-9713293f5462
00020000-5576-b80c-0087-5ed3d5c5be81	00030000-5576-b80b-556e-5dcae826431a
\.


--
-- TOC entry 2805 (class 0 OID 6759947)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6759978)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6760114)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6759712)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5576-b80c-424a-72370b079e01	00040000-5576-b80b-d7aa-601eb2c9596a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-b80c-38fe-bc56aa840d08	00040000-5576-b80b-d7aa-601eb2c9596a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-b80c-9532-7d216c25ff1a	00040000-5576-b80b-d7aa-601eb2c9596a	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-b80c-c0cb-2d9110f24acf	00040000-5576-b80b-d7aa-601eb2c9596a	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2784 (class 0 OID 6759747)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5576-b80b-e3ae-285fbaa409ca	8341	Adlešiči
00050000-5576-b80b-e962-0f2243acde53	5270	Ajdovščina
00050000-5576-b80b-a3ca-52c92f471ef8	6280	Ankaran/Ancarano
00050000-5576-b80b-d16b-7ba5e348b996	9253	Apače
00050000-5576-b80b-4bcf-e8f22153aacf	8253	Artiče
00050000-5576-b80b-790d-6617be6901d6	4275	Begunje na Gorenjskem
00050000-5576-b80b-e5e7-2dcfef24f1a3	1382	Begunje pri Cerknici
00050000-5576-b80b-e58d-336117b532aa	9231	Beltinci
00050000-5576-b80b-6831-60a80e62ed80	2234	Benedikt
00050000-5576-b80b-1b71-bff3472d44b9	2345	Bistrica ob Dravi
00050000-5576-b80b-dfbc-50d0f7f7c786	3256	Bistrica ob Sotli
00050000-5576-b80b-5a19-2f594080e6fc	8259	Bizeljsko
00050000-5576-b80b-f21f-6b3daaa1e639	1223	Blagovica
00050000-5576-b80b-bb5a-d9f6dd384506	8283	Blanca
00050000-5576-b80b-b724-bc6219359cfc	4260	Bled
00050000-5576-b80b-f721-2c0daa9b6659	4273	Blejska Dobrava
00050000-5576-b80b-6072-5ce1d674b06b	9265	Bodonci
00050000-5576-b80b-16b0-9832ca4d4760	9222	Bogojina
00050000-5576-b80b-1476-14266a2f190a	4263	Bohinjska Bela
00050000-5576-b80b-25f8-cb68cdf0700b	4264	Bohinjska Bistrica
00050000-5576-b80b-d0af-121d822398bb	4265	Bohinjsko jezero
00050000-5576-b80b-83d1-f5d0cb3ab2b2	1353	Borovnica
00050000-5576-b80b-505f-c59bd03d840c	8294	Boštanj
00050000-5576-b80b-d7dd-b380f57f85d8	5230	Bovec
00050000-5576-b80b-1576-96870c36960e	5295	Branik
00050000-5576-b80b-6ffb-c742edf6bb49	3314	Braslovče
00050000-5576-b80b-07f9-a69f43e1249b	5223	Breginj
00050000-5576-b80b-5286-e79c218b592a	8280	Brestanica
00050000-5576-b80b-94a9-ba1c81d414cd	2354	Bresternica
00050000-5576-b80b-bae8-9758cab8e650	4243	Brezje
00050000-5576-b80b-e2fb-eed661b79aa8	1351	Brezovica pri Ljubljani
00050000-5576-b80b-6b93-8b3252714bf8	8250	Brežice
00050000-5576-b80b-efa1-d7dd45eb68ed	4210	Brnik - Aerodrom
00050000-5576-b80b-20a2-df309d3c231b	8321	Brusnice
00050000-5576-b80b-a3a7-3305db463add	3255	Buče
00050000-5576-b80b-57ef-b7c704b72379	8276	Bučka 
00050000-5576-b80b-297b-2c1612833dbd	9261	Cankova
00050000-5576-b80b-365e-ad0a42f72df6	3000	Celje 
00050000-5576-b80b-f3cc-f6ab772c8496	3001	Celje - poštni predali
00050000-5576-b80b-936d-09a551913585	4207	Cerklje na Gorenjskem
00050000-5576-b80b-3d8d-0d812770625d	8263	Cerklje ob Krki
00050000-5576-b80b-7221-068bc373024d	1380	Cerknica
00050000-5576-b80b-097b-bcf2e8abdeb2	5282	Cerkno
00050000-5576-b80b-e351-2a186668f2d8	2236	Cerkvenjak
00050000-5576-b80b-d94c-af02f5020097	2215	Ceršak
00050000-5576-b80b-8bf3-c630af8d0843	2326	Cirkovce
00050000-5576-b80b-025a-3542e70389e2	2282	Cirkulane
00050000-5576-b80b-ea96-4590b44fab0a	5273	Col
00050000-5576-b80b-d5a8-b7ccb76d18c8	8251	Čatež ob Savi
00050000-5576-b80b-9b3b-762d279a60fa	1413	Čemšenik
00050000-5576-b80b-7975-9c11fe899818	5253	Čepovan
00050000-5576-b80b-5dae-da8069c86d7a	9232	Črenšovci
00050000-5576-b80b-edfa-f1bb9e4c398e	2393	Črna na Koroškem
00050000-5576-b80b-964a-cc7c17279999	6275	Črni Kal
00050000-5576-b80b-4c4e-c5da8bfb6b7f	5274	Črni Vrh nad Idrijo
00050000-5576-b80b-14e5-1b6087f81ccc	5262	Črniče
00050000-5576-b80b-4182-1cce6ce9c329	8340	Črnomelj
00050000-5576-b80b-9431-589b6c1e6444	6271	Dekani
00050000-5576-b80b-bd09-f65ccb01fe33	5210	Deskle
00050000-5576-b80b-7656-a89ff76e8144	2253	Destrnik
00050000-5576-b80b-ad16-d40f51a028fc	6215	Divača
00050000-5576-b80b-3f89-b19e1aa3a67a	1233	Dob
00050000-5576-b80b-2d40-54c2df6977c4	3224	Dobje pri Planini
00050000-5576-b80b-ba7e-699df5fc6b9a	8257	Dobova
00050000-5576-b80b-8d31-d8164e707631	1423	Dobovec
00050000-5576-b80b-c386-8df5a5e32ae9	5263	Dobravlje
00050000-5576-b80b-aacd-d7760f08b3dc	3204	Dobrna
00050000-5576-b80b-608b-f2a32722f024	8211	Dobrnič
00050000-5576-b80b-79b9-cb8f86761986	1356	Dobrova
00050000-5576-b80b-dd31-92854fd028f1	9223	Dobrovnik/Dobronak 
00050000-5576-b80b-b910-894a592e7abf	5212	Dobrovo v Brdih
00050000-5576-b80b-e221-f094c2cac70f	1431	Dol pri Hrastniku
00050000-5576-b80b-31ba-0baf11588b62	1262	Dol pri Ljubljani
00050000-5576-b80b-293f-68c1789b188a	1273	Dole pri Litiji
00050000-5576-b80b-5666-1e27366db380	1331	Dolenja vas
00050000-5576-b80b-b132-b722b2304de2	8350	Dolenjske Toplice
00050000-5576-b80b-6d8e-e0184dd3b344	1230	Domžale
00050000-5576-b80b-403e-17c526e76428	2252	Dornava
00050000-5576-b80b-b898-5976fbedce38	5294	Dornberk
00050000-5576-b80b-525b-1d7757b8c83a	1319	Draga
00050000-5576-b80b-eaab-9cc26ba184da	8343	Dragatuš
00050000-5576-b80b-cf22-690933c87270	3222	Dramlje
00050000-5576-b80b-d333-3f9cf0f4e22d	2370	Dravograd
00050000-5576-b80b-6702-3b6d1921d362	4203	Duplje
00050000-5576-b80b-1d18-222ee6c5e447	6221	Dutovlje
00050000-5576-b80b-a657-984908ff9ab8	8361	Dvor
00050000-5576-b80b-dea9-cba26c63f347	2343	Fala
00050000-5576-b80b-91c6-86e9aec57679	9208	Fokovci
00050000-5576-b80b-be51-8caf4e66a0c8	2313	Fram
00050000-5576-b80b-43b7-5aeea6a9d92e	3213	Frankolovo
00050000-5576-b80b-e2e4-683fcc1c696f	1274	Gabrovka
00050000-5576-b80b-85f2-1e37a88f4792	8254	Globoko
00050000-5576-b80b-54d6-fab0559cbfd2	5275	Godovič
00050000-5576-b80b-9ce3-659813aa4d36	4204	Golnik
00050000-5576-b80b-f8c0-fa3aeb4a223d	3303	Gomilsko
00050000-5576-b80b-79f1-4642658f4be4	4224	Gorenja vas
00050000-5576-b80b-bef6-e38fa2515a6f	3263	Gorica pri Slivnici
00050000-5576-b80b-7a02-4b0f45698885	2272	Gorišnica
00050000-5576-b80b-496e-0f8d74ba7e42	9250	Gornja Radgona
00050000-5576-b80b-dc33-9e6874a77d1f	3342	Gornji Grad
00050000-5576-b80b-0d88-75f4c55c7641	4282	Gozd Martuljek
00050000-5576-b80b-2047-7678b86be32a	6272	Gračišče
00050000-5576-b80b-dcfb-8d890c597890	9264	Grad
00050000-5576-b80b-15a7-a2207ef7d91c	8332	Gradac
00050000-5576-b80b-de30-8d485b9bc000	1384	Grahovo
00050000-5576-b80b-f202-749eaf376229	5242	Grahovo ob Bači
00050000-5576-b80b-b5f9-7f47e33fd076	5251	Grgar
00050000-5576-b80b-2a1a-df545bf516f2	3302	Griže
00050000-5576-b80b-8d2c-04d23576730c	3231	Grobelno
00050000-5576-b80b-77e6-916422660f44	1290	Grosuplje
00050000-5576-b80b-2e41-3f27d4ee6061	2288	Hajdina
00050000-5576-b80b-6a96-f5d217a7cf1c	8362	Hinje
00050000-5576-b80b-8f50-751adc39024a	2311	Hoče
00050000-5576-b80b-4cda-1a1dd685035d	9205	Hodoš/Hodos
00050000-5576-b80b-d297-d72a9ddf55e9	1354	Horjul
00050000-5576-b80b-a345-fc60c620f56f	1372	Hotedršica
00050000-5576-b80b-e7bd-16d409454be9	1430	Hrastnik
00050000-5576-b80b-870b-5be90954d9bc	6225	Hruševje
00050000-5576-b80b-8077-650f29f2c8a9	4276	Hrušica
00050000-5576-b80b-6035-cf1518336c87	5280	Idrija
00050000-5576-b80b-7d5a-222fd13a7548	1292	Ig
00050000-5576-b80b-c671-ccd14ef210c3	6250	Ilirska Bistrica
00050000-5576-b80b-d6bd-f32655ef87a0	6251	Ilirska Bistrica-Trnovo
00050000-5576-b80b-acd1-f657aef9cbcc	1295	Ivančna Gorica
00050000-5576-b80b-685d-83818071b57d	2259	Ivanjkovci
00050000-5576-b80b-ec73-cc7428cdbd1c	1411	Izlake
00050000-5576-b80b-27f3-78fcb30e62a0	6310	Izola/Isola
00050000-5576-b80b-9a44-6d183cd11049	2222	Jakobski Dol
00050000-5576-b80b-0133-b2cb7c35cfda	2221	Jarenina
00050000-5576-b80b-a098-02281b9be7f1	6254	Jelšane
00050000-5576-b80b-d623-a7ffa0111dca	4270	Jesenice
00050000-5576-b80b-f659-27392bcb9017	8261	Jesenice na Dolenjskem
00050000-5576-b80b-2c94-1de5e23e4c03	3273	Jurklošter
00050000-5576-b80b-37f5-08ae7b33d0b5	2223	Jurovski Dol
00050000-5576-b80b-58b8-6b8683cc1899	2256	Juršinci
00050000-5576-b80b-6e68-c872ff62347b	5214	Kal nad Kanalom
00050000-5576-b80b-6e03-abd5ba8903b4	3233	Kalobje
00050000-5576-b80b-7632-331a66592c39	4246	Kamna Gorica
00050000-5576-b80b-e647-7ee350a5b222	2351	Kamnica
00050000-5576-b80b-93ee-b99df8cfbc1d	1241	Kamnik
00050000-5576-b80b-b86a-c9070c12d65e	5213	Kanal
00050000-5576-b80b-db4e-1c5cd9b9093d	8258	Kapele
00050000-5576-b80b-dd43-6056b8a35c61	2362	Kapla
00050000-5576-b80b-ddf4-e9ddb1b99079	2325	Kidričevo
00050000-5576-b80b-f42e-c0988193e0d9	1412	Kisovec
00050000-5576-b80b-68b8-3cc774e60f76	6253	Knežak
00050000-5576-b80b-41ef-1bb502bcf784	5222	Kobarid
00050000-5576-b80b-edea-1a120b613149	9227	Kobilje
00050000-5576-b80b-5b75-daad34bca47e	1330	Kočevje
00050000-5576-b80b-c2f5-41c19ce1e865	1338	Kočevska Reka
00050000-5576-b80b-4005-bfd0ec49ce78	2276	Kog
00050000-5576-b80b-fa82-17d7693c0fd7	5211	Kojsko
00050000-5576-b80b-a7b8-bf12db6c3ebe	6223	Komen
00050000-5576-b80b-6e77-6e00f6a333f1	1218	Komenda
00050000-5576-b80b-f916-14a4d134d66e	6000	Koper/Capodistria 
00050000-5576-b80b-3708-b91ba6ce9592	6001	Koper/Capodistria - poštni predali
00050000-5576-b80b-2db3-bdfe3ef0ef59	8282	Koprivnica
00050000-5576-b80b-915a-e131bf059fa7	5296	Kostanjevica na Krasu
00050000-5576-b80b-2593-2733d5978104	8311	Kostanjevica na Krki
00050000-5576-b80b-8e26-fe2c01a5989e	1336	Kostel
00050000-5576-b80b-872e-b7133ccf194f	6256	Košana
00050000-5576-b80b-25cc-f208455ae1d3	2394	Kotlje
00050000-5576-b80b-7e67-80e89511ce11	6240	Kozina
00050000-5576-b80b-1476-ebbe5ef408e9	3260	Kozje
00050000-5576-b80b-a8eb-f030976a2bcb	4000	Kranj 
00050000-5576-b80b-a457-2f6fea1ec73d	4001	Kranj - poštni predali
00050000-5576-b80b-3087-fbb7a7bc9781	4280	Kranjska Gora
00050000-5576-b80b-9339-fbb54920e94f	1281	Kresnice
00050000-5576-b80b-3f86-1ce1f9a991ce	4294	Križe
00050000-5576-b80b-1e2e-adfcec58d306	9206	Križevci
00050000-5576-b80b-7a5b-fa5c8e8c4e47	9242	Križevci pri Ljutomeru
00050000-5576-b80b-2319-88c2eb7b75f3	1301	Krka
00050000-5576-b80b-715d-bd36f533c541	8296	Krmelj
00050000-5576-b80b-e57f-142eb302d1c7	4245	Kropa
00050000-5576-b80b-5d0f-0a0c02d12373	8262	Krška vas
00050000-5576-b80b-f178-dbb9d429ab84	8270	Krško
00050000-5576-b80b-3706-cfa83819fa69	9263	Kuzma
00050000-5576-b80b-56f2-b9c02e8616c5	2318	Laporje
00050000-5576-b80b-ee93-62fa0cf7ea9d	3270	Laško
00050000-5576-b80b-c4a7-8172c5d44197	1219	Laze v Tuhinju
00050000-5576-b80b-027f-816df1230ec1	2230	Lenart v Slovenskih goricah
00050000-5576-b80b-14ca-c6f783bdbaaa	9220	Lendava/Lendva
00050000-5576-b80b-6838-26eb214e571b	4248	Lesce
00050000-5576-b80b-e836-b3f6efb4433b	3261	Lesično
00050000-5576-b80b-c64b-cc736dcb223d	8273	Leskovec pri Krškem
00050000-5576-b80b-b009-0558f8027eab	2372	Libeliče
00050000-5576-b80b-381f-3daeb834a431	2341	Limbuš
00050000-5576-b80b-9d34-4db1b49b1219	1270	Litija
00050000-5576-b80b-122f-ef222ab3e43e	3202	Ljubečna
00050000-5576-b80b-1632-6a93a20fdf32	1000	Ljubljana 
00050000-5576-b80b-9510-32cb5480c7f0	1001	Ljubljana - poštni predali
00050000-5576-b80b-89d3-7d4ed29c049b	1231	Ljubljana - Črnuče
00050000-5576-b80b-2047-2cd2801c6e3f	1261	Ljubljana - Dobrunje
00050000-5576-b80b-8718-ee92362cffcc	1260	Ljubljana - Polje
00050000-5576-b80b-1344-9aff6f17580c	1210	Ljubljana - Šentvid
00050000-5576-b80b-77aa-d148f21531f6	1211	Ljubljana - Šmartno
00050000-5576-b80b-56b7-c5c6a48a0b62	3333	Ljubno ob Savinji
00050000-5576-b80b-a85c-c5428a138a59	9240	Ljutomer
00050000-5576-b80b-0dd1-965680d5a797	3215	Loče
00050000-5576-b80b-6306-5fe1bb073fd4	5231	Log pod Mangartom
00050000-5576-b80b-d082-09b8ea72651d	1358	Log pri Brezovici
00050000-5576-b80b-9f91-d3231acd08c6	1370	Logatec
00050000-5576-b80b-e2d6-07f95f9a7762	1371	Logatec
00050000-5576-b80b-d7af-dede9e8095c0	1434	Loka pri Zidanem Mostu
00050000-5576-b80b-d963-bd45e6f1a1cf	3223	Loka pri Žusmu
00050000-5576-b80b-5282-678fee625e70	6219	Lokev
00050000-5576-b80b-289e-438a7f7cf166	1318	Loški Potok
00050000-5576-b80b-5c96-2088f96c4d8c	2324	Lovrenc na Dravskem polju
00050000-5576-b80b-2509-b6dd9abbc1da	2344	Lovrenc na Pohorju
00050000-5576-b80b-3889-df08899afdaf	3334	Luče
00050000-5576-b80b-4b80-1ec437774566	1225	Lukovica
00050000-5576-b80b-75c6-b05bd474966c	9202	Mačkovci
00050000-5576-b80b-312a-01638bab8c12	2322	Majšperk
00050000-5576-b80b-cf17-cedd5e5cb2e6	2321	Makole
00050000-5576-b80b-8724-a00ee7decac0	9243	Mala Nedelja
00050000-5576-b80b-f3b6-c387d0fb690b	2229	Malečnik
00050000-5576-b80b-0733-aed52960ed49	6273	Marezige
00050000-5576-b80b-d32c-f859d6459dd3	2000	Maribor 
00050000-5576-b80b-883c-f352c93307e5	2001	Maribor - poštni predali
00050000-5576-b80b-35fb-2aabeb47de0e	2206	Marjeta na Dravskem polju
00050000-5576-b80b-a487-765b374c8e9d	2281	Markovci
00050000-5576-b80b-d811-b5e2f4199c1e	9221	Martjanci
00050000-5576-b80b-6e50-cadea4437b68	6242	Materija
00050000-5576-b80b-3f6e-a30906152d02	4211	Mavčiče
00050000-5576-b80b-e0e0-4db324568ac1	1215	Medvode
00050000-5576-b80b-a1ab-730328aaf70e	1234	Mengeš
00050000-5576-b80b-d079-9615725a5d62	8330	Metlika
00050000-5576-b80b-cb66-924d1fcfaafc	2392	Mežica
00050000-5576-b80b-1dbf-754f04e15719	2204	Miklavž na Dravskem polju
00050000-5576-b80b-5ac6-e95fcbfa11a9	2275	Miklavž pri Ormožu
00050000-5576-b80b-7c3a-aa8c4e129570	5291	Miren
00050000-5576-b80b-b3b8-25e993f260b2	8233	Mirna
00050000-5576-b80b-e434-dea65fea34a7	8216	Mirna Peč
00050000-5576-b80b-8777-62a8b81c43ae	2382	Mislinja
00050000-5576-b80b-6c3b-f74c29d175ff	4281	Mojstrana
00050000-5576-b80b-83c4-ac4da4951c0d	8230	Mokronog
00050000-5576-b80b-04ed-4928be2d96cb	1251	Moravče
00050000-5576-b80b-2689-0e8d0a1c6d25	9226	Moravske Toplice
00050000-5576-b80b-baef-a17f1b19a8ed	5216	Most na Soči
00050000-5576-b80b-b28a-676bc51cfe70	1221	Motnik
00050000-5576-b80b-20d6-a3272e005f02	3330	Mozirje
00050000-5576-b80b-9fee-afdd136dd40e	9000	Murska Sobota 
00050000-5576-b80b-22ee-e353386eaf2b	9001	Murska Sobota - poštni predali
00050000-5576-b80b-e429-abe4bd0a5653	2366	Muta
00050000-5576-b80b-4905-503d5967a819	4202	Naklo
00050000-5576-b80b-100b-794f1ae66a10	3331	Nazarje
00050000-5576-b80b-85cc-ff9152ccc01d	1357	Notranje Gorice
00050000-5576-b80b-e012-3e4d5a5dec6f	3203	Nova Cerkev
00050000-5576-b80b-5d1a-e5b6da55eee8	5000	Nova Gorica 
00050000-5576-b80b-5149-5a611ce4f6c0	5001	Nova Gorica - poštni predali
00050000-5576-b80b-3ea7-dc4a3b8fa03c	1385	Nova vas
00050000-5576-b80b-cf25-2f2b1c4be6f6	8000	Novo mesto
00050000-5576-b80b-4c61-39719b8e8807	8001	Novo mesto - poštni predali
00050000-5576-b80b-4def-ad6092866bfc	6243	Obrov
00050000-5576-b80b-f30e-486183f05e1d	9233	Odranci
00050000-5576-b80b-b95e-9d1922bf4d5d	2317	Oplotnica
00050000-5576-b80b-26c7-e4ca8aee8ec8	2312	Orehova vas
00050000-5576-b80b-3527-8dd536de5d26	2270	Ormož
00050000-5576-b80b-c46a-8fb3ce33929f	1316	Ortnek
00050000-5576-b80b-e933-215d51a954ec	1337	Osilnica
00050000-5576-b80b-a9fc-a82943e36606	8222	Otočec
00050000-5576-b80b-7f87-63a7ecbff043	2361	Ožbalt
00050000-5576-b80b-0b06-6032508be36a	2231	Pernica
00050000-5576-b80b-44d8-b73d4fa770bf	2211	Pesnica pri Mariboru
00050000-5576-b80b-22dc-3441aa3fd3e9	9203	Petrovci
00050000-5576-b80b-d383-91d3e1cefc2e	3301	Petrovče
00050000-5576-b80b-b0b1-0124f6897538	6330	Piran/Pirano
00050000-5576-b80b-f36b-9a0ef73c5951	8255	Pišece
00050000-5576-b80b-96d8-9237e7358200	6257	Pivka
00050000-5576-b80b-f1cd-2e53298b79b8	6232	Planina
00050000-5576-b80b-9626-d5757b68ce97	3225	Planina pri Sevnici
00050000-5576-b80b-e8c9-c41d81342997	6276	Pobegi
00050000-5576-b80b-d2c7-bff2766671e7	8312	Podbočje
00050000-5576-b80b-8e8b-63b410a2aa1c	5243	Podbrdo
00050000-5576-b80b-242d-e7901b5db9a1	3254	Podčetrtek
00050000-5576-b80b-f71d-99057241a01b	2273	Podgorci
00050000-5576-b80b-a056-895a52d48442	6216	Podgorje
00050000-5576-b80b-02f3-9f6595450b30	2381	Podgorje pri Slovenj Gradcu
00050000-5576-b80b-ca3e-0e15f390c3b1	6244	Podgrad
00050000-5576-b80b-ac90-5d2a56995808	1414	Podkum
00050000-5576-b80b-d52c-b238a3a7615f	2286	Podlehnik
00050000-5576-b80b-0787-4a9885ae2eaf	5272	Podnanos
00050000-5576-b80b-95eb-104685e7d628	4244	Podnart
00050000-5576-b80b-744c-1f669e597502	3241	Podplat
00050000-5576-b80b-e1d4-e3b2b547f6e1	3257	Podsreda
00050000-5576-b80b-4e15-8737ab7f6da6	2363	Podvelka
00050000-5576-b80b-b673-5738ed7dfb05	2208	Pohorje
00050000-5576-b80b-d2f8-7cf3804498c5	2257	Polenšak
00050000-5576-b80b-560b-02c7a6eefec0	1355	Polhov Gradec
00050000-5576-b80b-d036-4161e5154b5c	4223	Poljane nad Škofjo Loko
00050000-5576-b80b-bea4-c4857664bd9f	2319	Poljčane
00050000-5576-b80b-0a99-9c1376656dd5	1272	Polšnik
00050000-5576-b80b-2a01-a878a4d035bf	3313	Polzela
00050000-5576-b80b-7935-3697626432e2	3232	Ponikva
00050000-5576-b80b-d4b2-82a612432b8e	6320	Portorož/Portorose
00050000-5576-b80b-cc2e-e81bce16c285	6230	Postojna
00050000-5576-b80b-0c3f-9c1db26060af	2331	Pragersko
00050000-5576-b80b-d3cf-69c1cac8520d	3312	Prebold
00050000-5576-b80b-a721-3c38df7a2c86	4205	Preddvor
00050000-5576-b80b-cbcc-887332b296da	6255	Prem
00050000-5576-b80b-2e02-da2d9ec0db61	1352	Preserje
00050000-5576-b80b-daa0-ee67333a1c5a	6258	Prestranek
00050000-5576-b80b-610e-a970a1b70f0a	2391	Prevalje
00050000-5576-b80b-5dc3-a1257a7fb5f7	3262	Prevorje
00050000-5576-b80b-d9c3-1f906231d7dc	1276	Primskovo 
00050000-5576-b80b-3fc1-f774d44f70e2	3253	Pristava pri Mestinju
00050000-5576-b80b-56f6-c749146f3d9a	9207	Prosenjakovci/Partosfalva
00050000-5576-b80b-feed-357623e9e69c	5297	Prvačina
00050000-5576-b80b-379c-c683a6070d52	2250	Ptuj
00050000-5576-b80b-0f46-350ba63e93da	2323	Ptujska Gora
00050000-5576-b80b-efdc-58e4a114bc24	9201	Puconci
00050000-5576-b80b-30bb-cfe11450d58a	2327	Rače
00050000-5576-b80b-b8be-8f263392a907	1433	Radeče
00050000-5576-b80b-65b4-f34fa5596244	9252	Radenci
00050000-5576-b80b-5f09-dec2bb953e82	2360	Radlje ob Dravi
00050000-5576-b80b-8048-4bdca5726046	1235	Radomlje
00050000-5576-b80b-d6f5-dc0ea5bd18e1	4240	Radovljica
00050000-5576-b80b-f0cb-5bb9ce583f58	8274	Raka
00050000-5576-b80b-1a72-990494d47d87	1381	Rakek
00050000-5576-b80b-fd65-9d488ae2cbec	4283	Rateče - Planica
00050000-5576-b80b-4998-b436191940b2	2390	Ravne na Koroškem
00050000-5576-b80b-0bef-453c45a6f4b9	9246	Razkrižje
00050000-5576-b80b-cb8b-7a23e5305445	3332	Rečica ob Savinji
00050000-5576-b80b-f766-b74184464409	5292	Renče
00050000-5576-b80b-ec75-e09d739bc5bc	1310	Ribnica
00050000-5576-b80b-05fb-c52bb9e233dc	2364	Ribnica na Pohorju
00050000-5576-b80b-3baf-74ec2254fa88	3272	Rimske Toplice
00050000-5576-b80b-0e8d-22dd7c820466	1314	Rob
00050000-5576-b80b-1755-087a29a6a563	5215	Ročinj
00050000-5576-b80b-27bf-0c84853f9a59	3250	Rogaška Slatina
00050000-5576-b80b-aafb-05550a67c2e9	9262	Rogašovci
00050000-5576-b80b-0163-ae4c2b50a093	3252	Rogatec
00050000-5576-b80b-73ce-75eeb96b6202	1373	Rovte
00050000-5576-b80b-8018-dfbbcc14c88b	2342	Ruše
00050000-5576-b80b-daf7-3f9b5a53ffef	1282	Sava
00050000-5576-b80b-2f12-8df02027f7ec	6333	Sečovlje/Sicciole
00050000-5576-b80b-ccf2-1e89e4a57cb6	4227	Selca
00050000-5576-b80b-0edc-ca5df46ea802	2352	Selnica ob Dravi
00050000-5576-b80b-49a4-22c9f1828f43	8333	Semič
00050000-5576-b80b-536c-cb78b13635e0	8281	Senovo
00050000-5576-b80b-821d-8bc3a5644a1f	6224	Senožeče
00050000-5576-b80b-89a0-0179f8cae5b7	8290	Sevnica
00050000-5576-b80b-5d64-a9e6508aef76	6210	Sežana
00050000-5576-b80b-63cc-b81879efc1d3	2214	Sladki Vrh
00050000-5576-b80b-fa31-01e06708fdd5	5283	Slap ob Idrijci
00050000-5576-b80b-b86f-5ef57b1ff95d	2380	Slovenj Gradec
00050000-5576-b80b-279c-38eecd0c0e89	2310	Slovenska Bistrica
00050000-5576-b80b-dd33-db07c9ac31b0	3210	Slovenske Konjice
00050000-5576-b80b-2fdc-ded3e8ce9f76	1216	Smlednik
00050000-5576-b80b-0271-834c48a19221	5232	Soča
00050000-5576-b80b-8d79-04eb4588ee8a	1317	Sodražica
00050000-5576-b80b-cf36-4b317896a490	3335	Solčava
00050000-5576-b80b-ee2d-0e356e2cd18b	5250	Solkan
00050000-5576-b80b-415b-a2017ceb015b	4229	Sorica
00050000-5576-b80b-f87f-4298fe1a78c8	4225	Sovodenj
00050000-5576-b80b-8b61-34bb532a27ee	5281	Spodnja Idrija
00050000-5576-b80b-7978-a35f5c3d6c08	2241	Spodnji Duplek
00050000-5576-b80b-75cc-4944e53e03a2	9245	Spodnji Ivanjci
00050000-5576-b80b-bd53-e1e31d64fe8c	2277	Središče ob Dravi
00050000-5576-b80b-d24d-30f89d3799ab	4267	Srednja vas v Bohinju
00050000-5576-b80b-6d0b-2ba37753a38a	8256	Sromlje 
00050000-5576-b80b-56fe-7a70b29911f5	5224	Srpenica
00050000-5576-b80b-2821-0b2fddf5e557	1242	Stahovica
00050000-5576-b80b-3d77-f319695d0406	1332	Stara Cerkev
00050000-5576-b80b-67d5-1046ff819b4b	8342	Stari trg ob Kolpi
00050000-5576-b80b-0eaf-1887ec4b2b97	1386	Stari trg pri Ložu
00050000-5576-b80b-55bc-ce58b8cdfd8e	2205	Starše
00050000-5576-b80b-1585-3d54defb0216	2289	Stoperce
00050000-5576-b80b-6eb7-399c0e98ac53	8322	Stopiče
00050000-5576-b80b-dbf8-f5922d06239b	3206	Stranice
00050000-5576-b80b-067e-33aa9a6ef31a	8351	Straža
00050000-5576-b80b-c020-eea4b4df4ed1	1313	Struge
00050000-5576-b80b-aed1-468ba41cc146	8293	Studenec
00050000-5576-b80b-e620-1472bf472e83	8331	Suhor
00050000-5576-b80b-7b14-2379dabfe034	2233	Sv. Ana v Slovenskih goricah
00050000-5576-b80b-2ece-5827ae6f3a4b	2235	Sv. Trojica v Slovenskih goricah
00050000-5576-b80b-f859-fd8b4fa09491	2353	Sveti Duh na Ostrem Vrhu
00050000-5576-b80b-8ad2-593f89b5fe7b	9244	Sveti Jurij ob Ščavnici
00050000-5576-b80b-7edf-a33d7bec6dbe	3264	Sveti Štefan
00050000-5576-b80b-b1d4-399e3d36f509	2258	Sveti Tomaž
00050000-5576-b80b-0d52-e51e17413ca5	9204	Šalovci
00050000-5576-b80b-72f9-867fe8bff618	5261	Šempas
00050000-5576-b80b-d533-fc0e653b76f1	5290	Šempeter pri Gorici
00050000-5576-b80b-44da-4d7b10924fe1	3311	Šempeter v Savinjski dolini
00050000-5576-b80b-d92b-20e30a14f28f	4208	Šenčur
00050000-5576-b80b-e10d-54ea00cfdb7b	2212	Šentilj v Slovenskih goricah
00050000-5576-b80b-cdc2-545d1780e34f	8297	Šentjanž
00050000-5576-b80b-2093-e12790f413cd	2373	Šentjanž pri Dravogradu
00050000-5576-b80b-9ff0-e44d3a69e982	8310	Šentjernej
00050000-5576-b80b-419b-4567e2645562	3230	Šentjur
00050000-5576-b80b-8db4-31ca42f7c736	3271	Šentrupert
00050000-5576-b80b-dd3d-e48c019f1ef1	8232	Šentrupert
00050000-5576-b80b-c4ed-37377069d546	1296	Šentvid pri Stični
00050000-5576-b80b-885c-f9f3248e6e76	8275	Škocjan
00050000-5576-b80b-6114-c42a1ba9dda8	6281	Škofije
00050000-5576-b80b-7c1a-33185ab9fdc1	4220	Škofja Loka
00050000-5576-b80b-ce8a-735231343198	3211	Škofja vas
00050000-5576-b80b-5ade-8896ba0b7cc9	1291	Škofljica
00050000-5576-b80b-b693-ebef13ee427c	6274	Šmarje
00050000-5576-b80b-e0f2-ad737203cc22	1293	Šmarje - Sap
00050000-5576-b80b-cff6-57229fa0bb1c	3240	Šmarje pri Jelšah
00050000-5576-b80b-a356-4392b2be56b9	8220	Šmarješke Toplice
00050000-5576-b80b-ad53-f6032416a408	2315	Šmartno na Pohorju
00050000-5576-b80b-69f4-99db8e8cc9ac	3341	Šmartno ob Dreti
00050000-5576-b80b-ec14-cd67b04988a7	3327	Šmartno ob Paki
00050000-5576-b80b-ecd9-4adf2a3ae69b	1275	Šmartno pri Litiji
00050000-5576-b80b-760b-9cd58f68f3b9	2383	Šmartno pri Slovenj Gradcu
00050000-5576-b80b-1195-8bfd7a92698d	3201	Šmartno v Rožni dolini
00050000-5576-b80b-cb66-da23ae15270a	3325	Šoštanj
00050000-5576-b80b-a0ca-8f9253cd6f75	6222	Štanjel
00050000-5576-b80b-aa62-5f45574681fe	3220	Štore
00050000-5576-b80b-8cf4-d6da75a46e4a	3304	Tabor
00050000-5576-b80b-40c3-5b3391ecbfa1	3221	Teharje
00050000-5576-b80b-a0e1-8972cd6138a9	9251	Tišina
00050000-5576-b80b-096c-64a15f86bc5e	5220	Tolmin
00050000-5576-b80b-616c-49dc1872a304	3326	Topolšica
00050000-5576-b80b-fa2e-dd631810392a	2371	Trbonje
00050000-5576-b80b-ea01-eef893eb54b2	1420	Trbovlje
00050000-5576-b80b-d3e5-c3b565c09886	8231	Trebelno 
00050000-5576-b80b-d46b-73a300ddbd74	8210	Trebnje
00050000-5576-b80b-8eec-6c889502b291	5252	Trnovo pri Gorici
00050000-5576-b80b-b5fd-18e65ff5e516	2254	Trnovska vas
00050000-5576-b80b-2102-ceca51e601be	1222	Trojane
00050000-5576-b80b-339c-d19da5e450e6	1236	Trzin
00050000-5576-b80b-1dc4-65d14c872379	4290	Tržič
00050000-5576-b80b-cdcb-fa12b5ee5398	8295	Tržišče
00050000-5576-b80b-c988-8078c303a9a0	1311	Turjak
00050000-5576-b80b-801c-6d0787aed3fb	9224	Turnišče
00050000-5576-b80b-7913-b035c104ff9b	8323	Uršna sela
00050000-5576-b80b-5c2c-d3ec1aeac3c3	1252	Vače
00050000-5576-b80b-c421-84d599ac95a0	3320	Velenje 
00050000-5576-b80b-97ed-1b401294dff4	3322	Velenje - poštni predali
00050000-5576-b80b-b849-4d75419806d4	8212	Velika Loka
00050000-5576-b80b-c903-7de0ab70e36e	2274	Velika Nedelja
00050000-5576-b80b-86ce-0679c20d4d13	9225	Velika Polana
00050000-5576-b80b-f944-419e052b4596	1315	Velike Lašče
00050000-5576-b80b-a4f7-0f69c9aae5ea	8213	Veliki Gaber
00050000-5576-b80b-1ae5-4d0192b5b725	9241	Veržej
00050000-5576-b80b-33e7-3349a7b0b53e	1312	Videm - Dobrepolje
00050000-5576-b80b-07ca-a038e6723d0a	2284	Videm pri Ptuju
00050000-5576-b80b-4a3e-ec0e2201afe3	8344	Vinica
00050000-5576-b80b-a652-0c272073992d	5271	Vipava
00050000-5576-b80b-7180-2cbf04e797ce	4212	Visoko
00050000-5576-b80b-1205-a36650b5e8ab	1294	Višnja Gora
00050000-5576-b80b-dc9a-b0e0b5b11d66	3205	Vitanje
00050000-5576-b80b-2d49-56b78c9d0c2c	2255	Vitomarci
00050000-5576-b80b-407e-09b5f3af28fd	1217	Vodice
00050000-5576-b80b-635b-a2ae95976ac1	3212	Vojnik\t
00050000-5576-b80b-1a8c-64fe5e8e17dd	5293	Volčja Draga
00050000-5576-b80b-8ea1-4e2b87bffafe	2232	Voličina
00050000-5576-b80b-b004-43121368f57e	3305	Vransko
00050000-5576-b80b-3774-4a58c7414d36	6217	Vremski Britof
00050000-5576-b80b-e2c7-83fac041df5f	1360	Vrhnika
00050000-5576-b80b-e616-f20a27981268	2365	Vuhred
00050000-5576-b80b-a019-989a627e29f5	2367	Vuzenica
00050000-5576-b80b-5874-ea474db44575	8292	Zabukovje 
00050000-5576-b80b-b936-421069495a48	1410	Zagorje ob Savi
00050000-5576-b80b-1ed4-6cc397095dfc	1303	Zagradec
00050000-5576-b80b-4b98-0b4a93a678dc	2283	Zavrč
00050000-5576-b80b-270a-a21dd09f4866	8272	Zdole 
00050000-5576-b80b-fafe-0b9f1a9176b8	4201	Zgornja Besnica
00050000-5576-b80b-465b-4a5ba7a47e6c	2242	Zgornja Korena
00050000-5576-b80b-bb1e-16a6c72dfb77	2201	Zgornja Kungota
00050000-5576-b80b-ed97-a83737fbf479	2316	Zgornja Ložnica
00050000-5576-b80b-02eb-e0629e6961fc	2314	Zgornja Polskava
00050000-5576-b80b-7658-083d6f13789b	2213	Zgornja Velka
00050000-5576-b80b-7258-5f3dcd1aefc8	4247	Zgornje Gorje
00050000-5576-b80b-cc95-d5f07c00f78e	4206	Zgornje Jezersko
00050000-5576-b80b-255a-d97104b7e3eb	2285	Zgornji Leskovec
00050000-5576-b80b-2633-504728e6fbb4	1432	Zidani Most
00050000-5576-b80b-1a77-b4bef2e5232d	3214	Zreče
00050000-5576-b80b-f82b-d76568ddb8a1	4209	Žabnica
00050000-5576-b80b-6cbc-151d93db27c3	3310	Žalec
00050000-5576-b80b-ffdd-68fc1fd0c37f	4228	Železniki
00050000-5576-b80b-aecb-5f7c459ee0ff	2287	Žetale
00050000-5576-b80b-2945-98c288302c7c	4226	Žiri
00050000-5576-b80b-d954-cdb947fad6cf	4274	Žirovnica
00050000-5576-b80b-7802-ed15ed7cf035	8360	Žužemberk
\.


--
-- TOC entry 2801 (class 0 OID 6759921)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2769 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6759732)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6759810)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6759933)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6760053)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6760106)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5576-b80d-499a-bd862e996c3f	00080000-5576-b80c-9532-7d216c25ff1a	0987	A
00190000-5576-b80d-ca31-f86d989c8ac0	00080000-5576-b80c-38fe-bc56aa840d08	0989	A
\.


--
-- TOC entry 2827 (class 0 OID 6760220)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6760248)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6760229)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6759962)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5576-b80c-1d5f-a1564090a6bb	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5576-b80c-647d-e0054c678a34	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5576-b80c-dde6-422e36237863	0003	Kazinska	t	84	Kazinska dvorana
00220000-5576-b80c-4234-6bb8281bc0a7	0004	Mali oder	t	24	Mali oder 
00220000-5576-b80c-db89-4076c69950b4	0005	Komorni oder	t	15	Komorni oder
00220000-5576-b80c-90ad-7b87f971fc7e	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5576-b80c-f567-f21bab466792	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2799 (class 0 OID 6759906)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6759896)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6760095)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6760030)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2772 (class 0 OID 6759604)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5576-b80c-3437-8dcb1fb8e0b0	00010000-5576-b80c-e21a-034f9b62681e	2015-06-09 11:55:25	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO.iuM9tNh4IS2i2bd4U3Mmpxuj6wuR.O";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2808 (class 0 OID 6759972)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2776 (class 0 OID 6759642)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5576-b80c-a94b-2de05e373483	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5576-b80c-e7e0-99c18e32ef35	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5576-b80c-b4f2-54045967a2ad	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5576-b80c-beda-9c21d379135e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5576-b80c-2b08-8eb668c760c3	planer	Planer dogodkov v koledarju	t
00020000-5576-b80c-c6da-cd7ef36a132d	kadrovska	Kadrovska služba	t
00020000-5576-b80c-e450-5fdc487cbf1f	arhivar	Ažuriranje arhivalij	t
00020000-5576-b80c-ab00-a522a3d9f60a	igralec	Igralec	t
00020000-5576-b80c-0087-5ed3d5c5be81	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2774 (class 0 OID 6759626)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5576-b80c-3437-8dcb1fb8e0b0	00020000-5576-b80c-b4f2-54045967a2ad
00010000-5576-b80c-e21a-034f9b62681e	00020000-5576-b80c-b4f2-54045967a2ad
\.


--
-- TOC entry 2810 (class 0 OID 6759986)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6759927)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6759877)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6760267)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5576-b80b-b8c9-d0ca3435d812	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5576-b80b-dc0d-d49da90cfcfe	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5576-b80b-674a-951bce050de4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5576-b80b-badd-c77be2de27d7	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5576-b80b-9f24-9dbcf0fee584	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2832 (class 0 OID 6760259)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5576-b80b-7607-46862a225eeb	00230000-5576-b80b-badd-c77be2de27d7	popa
00240000-5576-b80b-7099-676fa7b521c4	00230000-5576-b80b-badd-c77be2de27d7	oseba
00240000-5576-b80b-289c-c3fdb9ef7e74	00230000-5576-b80b-dc0d-d49da90cfcfe	prostor
00240000-5576-b80b-f92b-e77a79a8a4f8	00230000-5576-b80b-badd-c77be2de27d7	besedilo
00240000-5576-b80b-4657-dc0b19947ce0	00230000-5576-b80b-badd-c77be2de27d7	uprizoritev
00240000-5576-b80b-d2a5-e4535d9ef4b1	00230000-5576-b80b-badd-c77be2de27d7	funkcija
00240000-5576-b80b-4df6-bbe93e849b6a	00230000-5576-b80b-badd-c77be2de27d7	tipfunkcije
00240000-5576-b80b-18a4-b1a2c7af6a4d	00230000-5576-b80b-badd-c77be2de27d7	alternacija
00240000-5576-b80b-f6f7-1392be8b6611	00230000-5576-b80b-b8c9-d0ca3435d812	pogodba
00240000-5576-b80b-a31e-ffabd7609600	00230000-5576-b80b-badd-c77be2de27d7	zaposlitev
\.


--
-- TOC entry 2831 (class 0 OID 6760254)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6760040)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6759704)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6759883)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5576-b80d-cca5-0d3c2ea2a416	00180000-5576-b80d-5126-ea9bd068adf9	000c0000-5576-b80d-984f-13b91c34f2d3	00090000-5576-b80d-3c82-c0d72b1dac8c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-b80d-e084-9b764bfeca62	00180000-5576-b80d-5126-ea9bd068adf9	000c0000-5576-b80d-66b3-13a85d7da9cf	00090000-5576-b80d-f1f7-6c090598483d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-b80d-3ed9-f0111afc3227	00180000-5576-b80d-5126-ea9bd068adf9	000c0000-5576-b80d-b4c9-e9a7df41aa49	00090000-5576-b80c-f5fe-a8e4b8a9b643	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-b80d-b976-4d18b44103dd	00180000-5576-b80d-5126-ea9bd068adf9	000c0000-5576-b80d-39ae-1839017420d6	00090000-5576-b80c-c7d6-fb25977f91d8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-b80d-4ffc-c22e074f4000	00180000-5576-b80d-5126-ea9bd068adf9	000c0000-5576-b80d-2180-ad3854a1b602	00090000-5576-b80d-a6ec-c39cd4cc39a3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-b80d-12df-b14336d0b86b	00180000-5576-b80d-0ce1-a7db8c3fb588	\N	00090000-5576-b80d-a6ec-c39cd4cc39a3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2818 (class 0 OID 6760084)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5576-b80b-ad8b-a366ef19ae16	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5576-b80b-b2c0-cbb2187ca05b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5576-b80b-a933-cd5b97588b95	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5576-b80b-6cd9-2ae42190048f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5576-b80b-e5f9-f3354ed73001	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5576-b80b-f2b1-fc62c0b55bc3	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5576-b80b-51c6-ac502d986d15	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5576-b80b-9588-ab92d2a3665f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5576-b80b-90dc-469feb14a4a8	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5576-b80b-019e-7e56cca5552e	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5576-b80b-fe04-e215aaab3fa3	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5576-b80b-3bb3-c569a8de26b1	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5576-b80b-573b-5455eca3f611	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5576-b80b-978b-f1022d6e2197	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5576-b80b-b6d1-47615606e1f0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5576-b80b-683e-419a01061982	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2829 (class 0 OID 6760237)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6759767)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6759613)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5576-b80c-e21a-034f9b62681e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.BTW9QDaq4LWzyKjX9sIu0ez4QKkCK6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5576-b80c-a331-9f05a78789b5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5576-b80c-b336-1f75a68b2cf8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5576-b80c-321b-d9436f611145	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5576-b80c-6d65-4bedcdbbb85b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5576-b80c-f146-976132ff2bf3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5576-b80c-43d0-e026c35d9455	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5576-b80c-3437-8dcb1fb8e0b0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 6760141)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5576-b80c-4985-f05d2222735e	00160000-5576-b80c-dee0-db3d9c479e35	00150000-5576-b80b-8eb2-600fbe9d8640	00140000-5576-b80b-d14e-c70ed7d07a66	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5576-b80c-db89-4076c69950b4
000e0000-5576-b80c-087a-c30ca101cb06	00160000-5576-b80c-f820-08b6595346a6	00150000-5576-b80b-d45e-3fb4b0d6f4c8	00140000-5576-b80b-cde3-f11c4a4c8584	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5576-b80c-90ad-7b87f971fc7e
\.


--
-- TOC entry 2791 (class 0 OID 6759829)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5576-b80d-cf5e-953882bf0915	000e0000-5576-b80c-087a-c30ca101cb06	1	
00200000-5576-b80d-014e-8093ed5dbb8c	000e0000-5576-b80c-087a-c30ca101cb06	2	
\.


--
-- TOC entry 2806 (class 0 OID 6759954)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6760023)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6759861)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6760131)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5576-b80b-d14e-c70ed7d07a66	01	Drama	drama (SURS 01)
00140000-5576-b80b-0651-ef13ff89f866	02	Opera	opera (SURS 02)
00140000-5576-b80b-526c-cc1ec8d64887	03	Balet	balet (SURS 03)
00140000-5576-b80b-8728-b6710cfa3370	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5576-b80b-299d-f8b1d8571c48	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5576-b80b-cde3-f11c4a4c8584	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5576-b80b-3c06-54246654745b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2812 (class 0 OID 6760013)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5576-b80b-52aa-9b08f4fefede	01	Opera	opera
00150000-5576-b80b-32be-85f6cafca1a0	02	Opereta	opereta
00150000-5576-b80b-7766-f0598893f8a1	03	Balet	balet
00150000-5576-b80b-db6f-50d6cbedd135	04	Plesne prireditve	plesne prireditve
00150000-5576-b80b-eb71-fc542baaf331	05	Lutkovno gledališče	lutkovno gledališče
00150000-5576-b80b-418f-118fb24d60f4	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5576-b80b-eeb2-961923d09964	07	Biografska drama	biografska drama
00150000-5576-b80b-8eb2-600fbe9d8640	08	Komedija	komedija
00150000-5576-b80b-cf49-d7d3407a877a	09	Črna komedija	črna komedija
00150000-5576-b80b-f7bc-02235f45e35b	10	E-igra	E-igra
00150000-5576-b80b-d45e-3fb4b0d6f4c8	11	Kriminalka	kriminalka
00150000-5576-b80b-ce97-a84307fa9e9f	12	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6759667)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6760187)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6760177)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6760083)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6759851)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6759876)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6759793)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6760216)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6760009)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6759827)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6759870)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6759807)
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
-- TOC entry 2456 (class 2606 OID 6759919)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6759946)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6759765)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6759676)
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
-- TOC entry 2371 (class 2606 OID 6759700)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6759656)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6759641)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6759952)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6759985)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6760126)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6759729)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6759753)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6759925)
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
-- TOC entry 2386 (class 2606 OID 6759743)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6759814)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6759937)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6760065)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6760111)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6760227)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6760252)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6760234)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6759969)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6759910)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6759901)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6760105)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6760037)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6759612)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6759976)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6759630)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6759650)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6759994)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6759932)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6759882)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6760276)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6760264)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6760258)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6760050)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6759709)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6759892)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6760094)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6760247)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6759778)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6759625)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6760157)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6759836)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6759960)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6760028)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6759865)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6760139)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6760021)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6759858)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2504 (class 1259 OID 6760051)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 6760052)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6759731)
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
-- TOC entry 2469 (class 1259 OID 6759953)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6759939)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6759938)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6759837)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6760010)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6760012)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6760011)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6759809)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6759808)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 6760128)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 6760129)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2524 (class 1259 OID 6760130)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2531 (class 1259 OID 6760162)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2532 (class 1259 OID 6760159)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2533 (class 1259 OID 6760161)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2534 (class 1259 OID 6760160)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6759780)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6759779)
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
-- TOC entry 2369 (class 1259 OID 6759703)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6759977)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6759871)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6759657)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6759658)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6759997)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6759996)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6759995)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6759815)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6759817)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6759816)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 6760266)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6759905)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6759903)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6759902)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6759904)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6759631)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6759632)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6759961)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6759926)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2500 (class 1259 OID 6760038)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2501 (class 1259 OID 6760039)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 6760217)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 6760218)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2554 (class 1259 OID 6760219)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2382 (class 1259 OID 6759745)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6759744)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6759746)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2564 (class 1259 OID 6760253)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2508 (class 1259 OID 6760066)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 6760067)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2544 (class 1259 OID 6760191)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2545 (class 1259 OID 6760193)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2546 (class 1259 OID 6760189)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2547 (class 1259 OID 6760192)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2548 (class 1259 OID 6760190)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2497 (class 1259 OID 6760029)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6759914)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6759913)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6759911)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6759912)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2540 (class 1259 OID 6760179)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2541 (class 1259 OID 6760178)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 6760228)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6759828)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6759678)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6759677)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6759710)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6759711)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6759895)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6759894)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6759893)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2558 (class 1259 OID 6760236)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2559 (class 1259 OID 6760235)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6759860)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6759856)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6759853)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6759854)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6759852)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6759857)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6759855)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6759730)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6759794)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6759796)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6759795)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6759797)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6759920)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6760127)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6760158)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6759701)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6759702)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 6760022)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6760277)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6759766)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 6760265)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6759971)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6759970)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 6760188)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6759754)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6760140)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6760112)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 6760113)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6759651)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6759859)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2601 (class 2606 OID 6760413)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2604 (class 2606 OID 6760398)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2603 (class 2606 OID 6760403)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2599 (class 2606 OID 6760423)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6760393)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2600 (class 2606 OID 6760418)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2602 (class 2606 OID 6760408)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2635 (class 2606 OID 6760568)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6760573)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6760328)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2622 (class 2606 OID 6760508)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2620 (class 2606 OID 6760503)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2621 (class 2606 OID 6760498)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2598 (class 2606 OID 6760388)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6760538)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6760548)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2629 (class 2606 OID 6760543)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2592 (class 2606 OID 6760363)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6760358)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2618 (class 2606 OID 6760488)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6760593)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 6760598)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6760603)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2642 (class 2606 OID 6760623)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2645 (class 2606 OID 6760608)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2643 (class 2606 OID 6760618)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2644 (class 2606 OID 6760613)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2590 (class 2606 OID 6760353)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6760348)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6760313)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2583 (class 2606 OID 6760308)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2624 (class 2606 OID 6760518)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2606 (class 2606 OID 6760428)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2579 (class 2606 OID 6760288)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2578 (class 2606 OID 6760293)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2625 (class 2606 OID 6760533)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2626 (class 2606 OID 6760528)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2627 (class 2606 OID 6760523)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2596 (class 2606 OID 6760368)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2594 (class 2606 OID 6760378)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2595 (class 2606 OID 6760373)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2660 (class 2606 OID 6760698)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2610 (class 2606 OID 6760463)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2612 (class 2606 OID 6760453)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2613 (class 2606 OID 6760448)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2611 (class 2606 OID 6760458)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2577 (class 2606 OID 6760278)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2576 (class 2606 OID 6760283)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6760513)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2619 (class 2606 OID 6760493)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2633 (class 2606 OID 6760558)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2632 (class 2606 OID 6760563)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6760663)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6760668)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2653 (class 2606 OID 6760673)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2588 (class 2606 OID 6760338)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6760333)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2587 (class 2606 OID 6760343)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2659 (class 2606 OID 6760693)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 6760578)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6760583)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2650 (class 2606 OID 6760648)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6760658)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2652 (class 2606 OID 6760638)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2649 (class 2606 OID 6760653)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2651 (class 2606 OID 6760643)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2631 (class 2606 OID 6760553)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6760483)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2615 (class 2606 OID 6760478)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2617 (class 2606 OID 6760468)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2616 (class 2606 OID 6760473)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2646 (class 2606 OID 6760633)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 6760628)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 6760678)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2597 (class 2606 OID 6760383)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2638 (class 2606 OID 6760588)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6760303)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2581 (class 2606 OID 6760298)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2585 (class 2606 OID 6760318)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2584 (class 2606 OID 6760323)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2607 (class 2606 OID 6760443)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6760438)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2609 (class 2606 OID 6760433)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2657 (class 2606 OID 6760688)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 6760683)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-09 11:55:25 CEST

--
-- PostgreSQL database dump complete
--

