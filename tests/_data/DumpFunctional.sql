--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-09 14:16:59 CEST

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
-- TOC entry 180 (class 1259 OID 6760763)
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
-- TOC entry 227 (class 1259 OID 6761284)
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
-- TOC entry 226 (class 1259 OID 6761267)
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
-- TOC entry 219 (class 1259 OID 6761172)
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
-- TOC entry 194 (class 1259 OID 6760942)
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
-- TOC entry 197 (class 1259 OID 6760976)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6760885)
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
-- TOC entry 228 (class 1259 OID 6761298)
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
-- TOC entry 213 (class 1259 OID 6761102)
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
-- TOC entry 192 (class 1259 OID 6760922)
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
-- TOC entry 196 (class 1259 OID 6760970)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6760902)
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
-- TOC entry 202 (class 1259 OID 6761019)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6761044)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6760859)
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
-- TOC entry 181 (class 1259 OID 6760772)
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
-- TOC entry 182 (class 1259 OID 6760783)
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
-- TOC entry 177 (class 1259 OID 6760737)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6760756)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6761051)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6761082)
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
-- TOC entry 223 (class 1259 OID 6761218)
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
-- TOC entry 184 (class 1259 OID 6760816)
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
-- TOC entry 186 (class 1259 OID 6760851)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6761025)
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
-- TOC entry 185 (class 1259 OID 6760836)
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
-- TOC entry 191 (class 1259 OID 6760914)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6761037)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6761157)
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
-- TOC entry 222 (class 1259 OID 6761210)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6761324)
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
-- TOC entry 232 (class 1259 OID 6761352)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6761333)
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
-- TOC entry 209 (class 1259 OID 6761066)
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
-- TOC entry 201 (class 1259 OID 6761010)
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
-- TOC entry 200 (class 1259 OID 6761000)
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
-- TOC entry 221 (class 1259 OID 6761199)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6761134)
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
-- TOC entry 174 (class 1259 OID 6760708)
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
-- TOC entry 173 (class 1259 OID 6760706)
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
-- TOC entry 210 (class 1259 OID 6761076)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6760746)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6760730)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6761090)
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
-- TOC entry 204 (class 1259 OID 6761031)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6760981)
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
-- TOC entry 235 (class 1259 OID 6761371)
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
-- TOC entry 234 (class 1259 OID 6761363)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6761358)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6761144)
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
-- TOC entry 183 (class 1259 OID 6760808)
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
-- TOC entry 199 (class 1259 OID 6760987)
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
-- TOC entry 220 (class 1259 OID 6761188)
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
-- TOC entry 231 (class 1259 OID 6761341)
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
-- TOC entry 188 (class 1259 OID 6760871)
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
-- TOC entry 175 (class 1259 OID 6760717)
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
-- TOC entry 225 (class 1259 OID 6761245)
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
-- TOC entry 193 (class 1259 OID 6760933)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6761058)
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
-- TOC entry 215 (class 1259 OID 6761127)
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
-- TOC entry 195 (class 1259 OID 6760965)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6761235)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6761117)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2168 (class 2604 OID 6760711)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2778 (class 0 OID 6760763)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6761284)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5576-d93a-0f07-6a34e78b7a7e	000d0000-5576-d93a-fbd1-01bda2879c38	\N	00090000-5576-d93a-8e95-a9e5e056e980	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-d93a-889a-0fce9b20ce34	000d0000-5576-d93a-4069-06b43f5ca06d	\N	00090000-5576-d93a-22d7-efbd8dedb7c5	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-d93a-a7cc-fb95fe9cb8b6	000d0000-5576-d93a-d447-a5f66a132ca0	\N	00090000-5576-d93a-c978-9f64ec7ae49f	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-d93a-db6a-731bbc0c438c	000d0000-5576-d93a-8780-105abc03883d	\N	00090000-5576-d93a-8ae2-ce3fa957a229	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-d93a-f6f0-264d21603245	000d0000-5576-d93a-c0c5-b181e3e2bbc4	\N	00090000-5576-d93a-ac96-d387e3fd2783	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5576-d93a-81fd-61255c6cf85b	000d0000-5576-d93a-12f1-79b123f0d12f	\N	00090000-5576-d93a-22d7-efbd8dedb7c5	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 6761267)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6761172)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5576-d93a-abf1-731f942665ab	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5576-d93a-512d-6557affb9dc4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5576-d93a-3456-4015d361f42a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2792 (class 0 OID 6760942)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5576-d93a-fdd1-78a4fe12bc2e	\N	\N	00200000-5576-d93a-9d4f-6d9f86e8a644	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5576-d93a-6e0f-80d005d40c4b	\N	\N	00200000-5576-d93a-71fb-ad4b5004e941	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5576-d93a-03f9-9e2a2754991f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5576-d93a-fe9a-3f21db1ed014	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5576-d93a-6512-ae83e29b3fd2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2795 (class 0 OID 6760976)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6760885)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5576-d939-6d19-17a0c936ff4d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5576-d939-18d1-d8aab21f36c6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5576-d939-c5f2-620038d51396	AL	ALB	008	Albania 	Albanija	\N
00040000-5576-d939-185d-8513bd0ee3a7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5576-d939-ede5-69aa37183d0c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5576-d939-1fab-655ff355f831	AD	AND	020	Andorra 	Andora	\N
00040000-5576-d939-ef21-f0779988be0d	AO	AGO	024	Angola 	Angola	\N
00040000-5576-d939-919e-71eb08b304e9	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5576-d939-727e-e10c9c442bf0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5576-d939-f78d-1f0f7b55b79d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5576-d939-8b01-6707671df893	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5576-d939-0e11-8605446aaafc	AM	ARM	051	Armenia 	Armenija	\N
00040000-5576-d939-fff4-1e664aee86b4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5576-d939-d378-6f91e8685440	AU	AUS	036	Australia 	Avstralija	\N
00040000-5576-d939-4f92-92189e3dd998	AT	AUT	040	Austria 	Avstrija	\N
00040000-5576-d939-c0c3-f720c6e1c913	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5576-d939-408f-b4f583163439	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5576-d939-2a30-284018b793b2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5576-d939-2243-9aee90229fa2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5576-d939-04f4-06363df6a323	BB	BRB	052	Barbados 	Barbados	\N
00040000-5576-d939-6804-fc4a219601c5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5576-d939-e94c-d0462b7ee79d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5576-d939-a743-fb40897c77e6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5576-d939-e9df-5c7d1edc74f1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5576-d939-58c8-1fa57b470580	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5576-d939-0417-472eb0f7ac0b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5576-d939-7b97-0f9310d952b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5576-d939-5bc7-3b955a341fc1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5576-d939-f3e2-9fb0750d60ab	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5576-d939-d911-3d7f22aa56c3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5576-d939-a960-d1b763ecdee5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5576-d939-cfba-3a0b388239a1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5576-d939-25bb-067c1c0b1e89	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5576-d939-5946-16f62aedc709	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5576-d939-bdf3-f63ca6928059	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5576-d939-7f84-ac9b9e0a6ffb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5576-d939-ae9c-3347a6d1bca8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5576-d939-9abe-850c51b1d076	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5576-d939-312b-340c01b69d34	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5576-d939-ef26-49447238c3e0	CA	CAN	124	Canada 	Kanada	\N
00040000-5576-d939-7319-dfad70664895	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5576-d939-6769-30aa4827c771	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5576-d939-2a8b-ae747ca07153	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5576-d939-7f25-53a1f70cdda6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5576-d939-7a77-b7bdc4efb8ab	CL	CHL	152	Chile 	Čile	\N
00040000-5576-d939-aadf-7d624600d2fc	CN	CHN	156	China 	Kitajska	\N
00040000-5576-d939-fc56-4b7b3675d962	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5576-d939-907d-774b72d239ab	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5576-d939-3daa-28599406365e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5576-d939-71db-76fc05fed4dc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5576-d939-6d68-62cfa600e3b2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5576-d939-0b5a-69ee16cba63c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5576-d939-5b43-e7759dbc70bd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5576-d939-84e3-3744239bb7a3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5576-d939-2d4b-00b0f36cebf5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5576-d939-0060-e1d80d094709	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5576-d939-24da-b5431d767951	CU	CUB	192	Cuba 	Kuba	\N
00040000-5576-d939-a0f0-af1fd4f9415c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5576-d939-03e0-2fdd61dd6289	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5576-d939-2151-12afef9be466	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5576-d939-e97e-41a6b9b23acf	DK	DNK	208	Denmark 	Danska	\N
00040000-5576-d939-2727-31b906b59a4d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5576-d939-ec9e-bd2712727ce1	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5576-d939-44a2-eb793309be67	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5576-d939-d763-6a5dba978e20	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5576-d939-0b00-3d7cd912cbe1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5576-d939-e18c-375b1b6e2f48	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5576-d939-f061-ac413953d686	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5576-d939-a9ac-3ea37dd550ed	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5576-d939-e9ec-421703dc8b54	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5576-d939-8ff2-c41f0e225745	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5576-d939-30b8-b40b57c6d87e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5576-d939-baa0-41a3c5c1567c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5576-d939-e7c0-3c8c1f3fef49	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5576-d939-2870-65653f794eca	FI	FIN	246	Finland 	Finska	\N
00040000-5576-d939-9ab9-c41a6e360f69	FR	FRA	250	France 	Francija	\N
00040000-5576-d939-bfc2-b4a16f75b734	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5576-d939-91a5-63da0f93b0e9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5576-d939-2c66-d7ab81ed2152	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5576-d939-1ce0-7a2fa0e824b7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5576-d939-f5d8-029087e27854	GA	GAB	266	Gabon 	Gabon	\N
00040000-5576-d939-d4ec-270ce3419c00	GM	GMB	270	Gambia 	Gambija	\N
00040000-5576-d939-192f-b8601fac4b42	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5576-d939-d6f6-cae1e6b9b8c9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5576-d939-673b-6f85980bf0b9	GH	GHA	288	Ghana 	Gana	\N
00040000-5576-d939-b0b0-845d0e802b0d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5576-d939-e18e-2df60f196298	GR	GRC	300	Greece 	Grčija	\N
00040000-5576-d939-da20-7493573fcaae	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5576-d939-61b9-f640209063a9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5576-d939-a688-b7eb7684958b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5576-d939-bdf2-e0abb6ab7e1c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5576-d939-7f3d-07eb7a137255	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5576-d939-b0a6-fea68a1d7dba	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5576-d939-a61f-fd233ca7eedc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5576-d939-6d77-317ef14238d9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5576-d939-2b05-04e0306365eb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5576-d939-e9a1-bb97472453c7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5576-d939-bc86-1ed2bab0061f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5576-d939-a711-3801b8939818	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5576-d939-316e-88f6287828ac	HN	HND	340	Honduras 	Honduras	\N
00040000-5576-d939-6a41-371fe36a6130	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5576-d939-0914-09766af25b04	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5576-d939-f4ee-dc3b2e43590c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5576-d939-fb0c-ddab70416233	IN	IND	356	India 	Indija	\N
00040000-5576-d939-10a9-f8a735e6330a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5576-d939-e695-c69752d7aece	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5576-d939-e2ab-46442364f09f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5576-d939-7207-adbbbd5c911c	IE	IRL	372	Ireland 	Irska	\N
00040000-5576-d939-918b-38f429cca886	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5576-d939-69f1-3c43580552eb	IL	ISR	376	Israel 	Izrael	\N
00040000-5576-d939-ad2a-e4be2742d572	IT	ITA	380	Italy 	Italija	\N
00040000-5576-d939-e2b8-545f190ac908	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5576-d939-1da2-1e51e314a1da	JP	JPN	392	Japan 	Japonska	\N
00040000-5576-d939-8964-a14de2850119	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5576-d939-cc35-c4b7fa1375bb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5576-d939-0ba4-a358dcb49237	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5576-d939-1b62-79a3635ef32d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5576-d939-0bcf-6cc18b6660d7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5576-d939-a036-617a4ee33644	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5576-d939-aa7c-1b4345968c19	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5576-d939-fde8-b8697b8b278b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5576-d939-e779-c526350d6feb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5576-d939-3e47-01b2cecfaa86	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5576-d939-3140-6537381301e4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5576-d939-b23f-1eab49f04a8b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5576-d939-a990-805f90c4f6d8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5576-d939-bf8d-a445adb03b39	LR	LBR	430	Liberia 	Liberija	\N
00040000-5576-d939-e95f-767e78dd95e7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5576-d939-240e-b5dc6eeb7b42	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5576-d939-9f4c-44eef7b676a9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5576-d939-ba1a-d6f367108b4b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5576-d939-c84a-a62966540495	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5576-d939-321e-0296468dd769	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5576-d939-0d27-848f8c2a38ab	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5576-d939-597b-1a7cabe267e3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5576-d939-7b99-ce7385695d6a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5576-d939-637c-ec1c88a986a3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5576-d939-ea48-60b9db3adf03	ML	MLI	466	Mali 	Mali	\N
00040000-5576-d939-56f0-ce6cb30d3e02	MT	MLT	470	Malta 	Malta	\N
00040000-5576-d939-cfd5-556073772b8d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5576-d939-7f48-e58084bb0806	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5576-d939-0917-61beecfd4cd3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5576-d939-46b4-c74185d2d04d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5576-d939-7f80-6105f8535e11	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5576-d939-d34b-786e374501fd	MX	MEX	484	Mexico 	Mehika	\N
00040000-5576-d939-ef6b-74c71028c4c5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5576-d939-eea5-845e18b04313	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5576-d939-7c90-7c2d139fa6a6	MC	MCO	492	Monaco 	Monako	\N
00040000-5576-d939-2fdd-31542e7e6d2c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5576-d939-221d-069fb860e58e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5576-d939-c5ee-db78f5b06ec1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5576-d939-745c-74acf906b07b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5576-d939-72b8-a6e0816fe211	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5576-d939-ecc9-8e325dea56a3	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5576-d939-cdb1-61f3bfd87aee	NA	NAM	516	Namibia 	Namibija	\N
00040000-5576-d939-0fda-a2e2fc55369d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5576-d939-5b82-9db812848969	NP	NPL	524	Nepal 	Nepal	\N
00040000-5576-d939-f67d-7009379509a3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5576-d939-b06b-031a713a6396	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5576-d939-eb1e-bb3ef3a8be98	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5576-d939-bb5b-9d7791e92526	NE	NER	562	Niger 	Niger 	\N
00040000-5576-d939-a759-9cb722cab922	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5576-d939-3538-3b4bf9012895	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5576-d939-5125-4967695a906b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5576-d939-5d7a-17b06114dd86	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5576-d939-e48b-2e42b515cf41	NO	NOR	578	Norway 	Norveška	\N
00040000-5576-d939-3c87-350c0bbc2dd5	OM	OMN	512	Oman 	Oman	\N
00040000-5576-d939-2739-0a896b22479f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5576-d939-3dd4-604de7c4ad39	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5576-d939-0891-f7122a88cf6d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5576-d939-d71a-0db1445c2f1d	PA	PAN	591	Panama 	Panama	\N
00040000-5576-d939-d42c-c2bcbf7de765	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5576-d939-1666-f4e305611270	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5576-d939-5f75-624dfc925f68	PE	PER	604	Peru 	Peru	\N
00040000-5576-d939-1358-7b06461bc7e8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5576-d939-e829-9e4c3644c42b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5576-d939-3b7d-826281385bce	PL	POL	616	Poland 	Poljska	\N
00040000-5576-d939-20c8-34f1637fabc3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5576-d939-44ad-a715602547c6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5576-d939-b6af-37bcc929d2e3	QA	QAT	634	Qatar 	Katar	\N
00040000-5576-d939-7c56-9ecdc1e42ab9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5576-d939-bd44-65d793c7d5d8	RO	ROU	642	Romania 	Romunija	\N
00040000-5576-d939-94df-13dbb12d9342	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5576-d939-f1b3-042ebe21730d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5576-d939-a335-b3b61c7a9a23	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5576-d939-e8ce-5f79230c8af6	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5576-d939-c402-126ab5579877	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5576-d939-2969-965df54d1307	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5576-d939-b361-7ca992daf6c1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5576-d939-9061-cd6d050b40fe	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5576-d939-0ceb-1f2879cf3ac9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5576-d939-0248-1764137f58bc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5576-d939-aae5-476397e6fd1f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5576-d939-0ef1-981a913dba41	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5576-d939-2f9f-37a00a6c92ca	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5576-d939-eac9-6f6c1f713b13	SN	SEN	686	Senegal 	Senegal	\N
00040000-5576-d939-a63b-c198a73db1a5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5576-d939-5fbd-6223bfcd09e1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5576-d939-36af-ee6f8c342968	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5576-d939-335b-218382da555a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5576-d939-04bd-bdb1ddb5a4e7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5576-d939-fe5a-cb991eac6a51	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5576-d939-107d-b7a91b7a115c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5576-d939-d3cd-ee35c5de6446	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5576-d939-dd29-6dd87f7c319f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5576-d939-361f-4b58137a54ba	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5576-d939-3a7d-6e528c7111ab	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5576-d939-25d8-70d6f02e2f5c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5576-d939-c283-a1ed143f072f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5576-d939-9f05-20903357a14b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5576-d939-5fc7-74b882b291b0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5576-d939-47b4-db31f909dbac	SR	SUR	740	Suriname 	Surinam	\N
00040000-5576-d939-aedc-d35834194bd4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5576-d939-1d58-a2e450ca20b0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5576-d939-0672-39e418430a3a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5576-d939-0f5e-d369e7041868	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5576-d939-160b-da3cc49298a2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5576-d939-aa2e-efb2f2366dcc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5576-d939-8d5f-fc877eb768f0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5576-d939-8a85-1494e936f72d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5576-d939-5097-cf48d7f7cc76	TH	THA	764	Thailand 	Tajska	\N
00040000-5576-d939-0a58-20a2b1bc2dc5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5576-d939-3e80-5b4926e5ebdd	TG	TGO	768	Togo 	Togo	\N
00040000-5576-d939-b3b9-42b94a918b95	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5576-d939-3e4f-f6bd70bd6a56	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5576-d939-909f-96f0572ad72c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5576-d939-b521-606bcb0bda67	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5576-d939-615c-8110e3ad6e04	TR	TUR	792	Turkey 	Turčija	\N
00040000-5576-d939-aa7a-98370cede737	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5576-d939-601a-b4b79b09f908	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5576-d939-6484-e26f7c8879ed	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5576-d939-4759-9c12c195e640	UG	UGA	800	Uganda 	Uganda	\N
00040000-5576-d939-0483-0e3665371b67	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5576-d939-f99a-dc5809017a85	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5576-d939-aec6-e70b332d2de3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5576-d939-d234-8dcf46f492da	US	USA	840	United States 	Združene države Amerike	\N
00040000-5576-d939-be4b-aa4dcfc70e57	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5576-d939-2f0e-0a4452462c5f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5576-d939-8c82-54fb10c63e68	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5576-d939-2bbd-1053b415134f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5576-d939-491a-60a4bdaf3ebf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5576-d939-8078-fd3d93adbb94	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5576-d939-1736-406edd212447	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5576-d939-521b-142ca29ceafc	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5576-d939-7304-e5543ecc630d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5576-d939-1f0a-cd6258d941a3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5576-d939-14a1-6de31c02a69f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5576-d939-c981-7d02da8bbb18	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5576-d939-3abd-1f4cc66cb88a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2826 (class 0 OID 6761298)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6761102)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5576-d93a-e17b-b7af00aa83a0	000e0000-5576-d93a-b136-739e0fb01738	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5576-d939-14c6-60bb5d3e2703
000d0000-5576-d93a-fbd1-01bda2879c38	000e0000-5576-d93a-b136-739e0fb01738	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5576-d939-14c6-60bb5d3e2703
000d0000-5576-d93a-4069-06b43f5ca06d	000e0000-5576-d93a-b136-739e0fb01738	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5576-d939-fb04-89079ae8eeb0
000d0000-5576-d93a-d447-a5f66a132ca0	000e0000-5576-d93a-b136-739e0fb01738	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5576-d939-1bb0-7632ea6f091a
000d0000-5576-d93a-8780-105abc03883d	000e0000-5576-d93a-b136-739e0fb01738	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5576-d939-1bb0-7632ea6f091a
000d0000-5576-d93a-c0c5-b181e3e2bbc4	000e0000-5576-d93a-b136-739e0fb01738	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5576-d939-1bb0-7632ea6f091a
000d0000-5576-d93a-12f1-79b123f0d12f	000e0000-5576-d93a-b136-739e0fb01738	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5576-d939-14c6-60bb5d3e2703
\.


--
-- TOC entry 2790 (class 0 OID 6760922)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6760970)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6760902)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5576-d93a-cfc0-47ef23f55043	00080000-5576-d93a-93c5-08ecc150cf9b	00090000-5576-d93a-8e95-a9e5e056e980	AK		
\.


--
-- TOC entry 2768 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6761019)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6761044)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6760859)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5576-d939-4709-df1bd36e4d87	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5576-d939-ae03-01780a704045	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5576-d939-be33-8d32230b60f2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5576-d939-2137-aedfeb9168f9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5576-d939-1a47-5cefd9ba21b6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5576-d939-6ed1-2750e8c5ecb3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5576-d939-2e38-14dd4e3da7b7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5576-d939-3d57-c250b08368cf	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5576-d939-1746-38c5a9844de3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5576-d939-a6e3-dce922797e93	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5576-d939-9c99-fff884b047b4	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5576-d939-b435-9c195e2d27cb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5576-d939-54ad-71f220953693	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5576-d939-16c6-e922dd913c66	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5576-d939-fe7b-d14aa8ce0071	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5576-d939-2700-1ed774e1910c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2779 (class 0 OID 6760772)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5576-d939-0d20-966331b00077	00000000-5576-d939-1a47-5cefd9ba21b6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5576-d939-7327-2806dc401286	00000000-5576-d939-1a47-5cefd9ba21b6	00010000-5576-d939-4ea4-a06c1bfc01ef	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5576-d939-a1a7-461e190ecdb0	00000000-5576-d939-6ed1-2750e8c5ecb3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2780 (class 0 OID 6760783)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5576-d93a-cfd2-41788ec882dc	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5576-d93a-8ae2-ce3fa957a229	00010000-5576-d93a-5316-0086a5fa8a83	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5576-d93a-c978-9f64ec7ae49f	00010000-5576-d93a-66b9-0dfc0e83f240	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5576-d93a-c96d-160c5b95c903	00010000-5576-d93a-a4e3-c5a493c360d7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5576-d93a-b93d-45a5ac659bf9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5576-d93a-f665-ef19dd3a58bb	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5576-d93a-a907-63b7e4fe6287	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5576-d93a-5f4d-bb13b7954e6e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5576-d93a-8e95-a9e5e056e980	00010000-5576-d93a-09b9-a2310a330f4f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5576-d93a-22d7-efbd8dedb7c5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5576-d93a-5a83-0fae924bfc4f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5576-d93a-ac96-d387e3fd2783	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5576-d93a-ea0d-388bb68cf275	00010000-5576-d93a-c7ca-f841c4dad2c7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2770 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6760737)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5576-d939-a176-726e66ca4537	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5576-d939-cc5f-1efe59308d2f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5576-d939-d44b-09c366bda550	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5576-d939-15b7-fb46e81b2e53	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5576-d939-3eaf-6c02ef8b431a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5576-d939-f0b0-0c8b2d6a6789	Abonma-read	Abonma - branje	f
00030000-5576-d939-4426-153f3bcf0d07	Abonma-write	Abonma - spreminjanje	f
00030000-5576-d939-2472-f12327dd985e	Alternacija-read	Alternacija - branje	f
00030000-5576-d939-3f81-b896a4ee67ce	Alternacija-write	Alternacija - spreminjanje	f
00030000-5576-d939-dac8-b7919ce63115	Arhivalija-read	Arhivalija - branje	f
00030000-5576-d939-2a19-d1ff6ee26f8d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5576-d939-d8e8-eff06545442f	Besedilo-read	Besedilo - branje	f
00030000-5576-d939-de57-85e4a30712e5	Besedilo-write	Besedilo - spreminjanje	f
00030000-5576-d939-be02-a40bcc4632c5	DogodekIzven-read	DogodekIzven - branje	f
00030000-5576-d939-18c2-d21b77d91cac	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5576-d939-f0e0-7d690e1ddf5e	Dogodek-read	Dogodek - branje	f
00030000-5576-d939-9636-25531da91cdd	Dogodek-write	Dogodek - spreminjanje	f
00030000-5576-d939-7072-93e2c96b7cf0	Drzava-read	Drzava - branje	f
00030000-5576-d939-0772-0e521178c6e2	Drzava-write	Drzava - spreminjanje	f
00030000-5576-d939-dee6-37f04e454a1d	Funkcija-read	Funkcija - branje	f
00030000-5576-d939-4011-a5590ca7f9e9	Funkcija-write	Funkcija - spreminjanje	f
00030000-5576-d939-e6ec-06c60f542927	Gostovanje-read	Gostovanje - branje	f
00030000-5576-d939-9df3-f4e7f04cf27a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5576-d939-d40e-5a67f4549dbc	Gostujoca-read	Gostujoca - branje	f
00030000-5576-d939-223c-e6dc562da794	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5576-d939-0897-3c0be933e8a8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5576-d939-068e-0791bfb3a061	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5576-d939-48da-a28b53746f83	Kupec-read	Kupec - branje	f
00030000-5576-d939-9f94-b236157c9ac6	Kupec-write	Kupec - spreminjanje	f
00030000-5576-d939-1005-ba6e5664a7c1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5576-d939-9659-addc99f92c9b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5576-d939-ec39-f2531dbb236d	Option-read	Option - branje	f
00030000-5576-d939-2b4b-d0182abce1f6	Option-write	Option - spreminjanje	f
00030000-5576-d939-f297-135de3538ba7	OptionValue-read	OptionValue - branje	f
00030000-5576-d939-3842-4a2a5dcb8af6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5576-d939-a788-8dd67754babe	Oseba-read	Oseba - branje	f
00030000-5576-d939-57ad-8508ebe1699d	Oseba-write	Oseba - spreminjanje	f
00030000-5576-d939-2db5-40b3d111f372	Permission-read	Permission - branje	f
00030000-5576-d939-da34-537f57b8420b	Permission-write	Permission - spreminjanje	f
00030000-5576-d939-9544-12e81c827d5e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5576-d939-61bd-14e697a4aab2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5576-d939-be04-21ea1095ae5e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5576-d939-b504-cd5ef0b0c833	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5576-d939-8f94-487aaa650375	Pogodba-read	Pogodba - branje	f
00030000-5576-d939-e069-71006296f588	Pogodba-write	Pogodba - spreminjanje	f
00030000-5576-d939-9dd8-c20ab574e757	Popa-read	Popa - branje	f
00030000-5576-d939-efff-01ccb51781bc	Popa-write	Popa - spreminjanje	f
00030000-5576-d939-ad0c-5217b8c73297	Posta-read	Posta - branje	f
00030000-5576-d939-2d51-7a70523c23fe	Posta-write	Posta - spreminjanje	f
00030000-5576-d939-3305-89985f8cae61	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5576-d939-7f21-2ac612c24050	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5576-d939-435b-d4edaf0ea66e	PostniNaslov-read	PostniNaslov - branje	f
00030000-5576-d939-34a7-184de4aa0553	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5576-d939-91fe-49f3e5bd0481	Predstava-read	Predstava - branje	f
00030000-5576-d939-df8d-4fccde94ec5f	Predstava-write	Predstava - spreminjanje	f
00030000-5576-d939-5eb0-4d13349def6d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5576-d939-1563-0d4f4349a6de	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5576-d939-ee38-1b569e7de651	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5576-d939-783c-53e95b3e04c5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5576-d939-7752-382204bb37f9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5576-d939-ffd9-c59903f7da67	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5576-d939-4d77-fb63cb647a74	ProgramDela-read	ProgramDela - branje	f
00030000-5576-d939-5046-bb5410d03faa	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5576-d939-f2ce-45466eafec72	ProgramFestival-read	ProgramFestival - branje	f
00030000-5576-d939-ffb2-381d7e06db23	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5576-d939-4bc3-b72673efc584	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5576-d939-1db1-0678f9ffed6f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5576-d939-2551-5bfc1dd4215f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5576-d939-f503-53d536a58ce5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5576-d939-3342-b02775f4690a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5576-d939-7518-6f8f25d1ce07	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5576-d939-f4c6-7754d44e582f	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5576-d939-7984-36b7ce965e65	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5576-d939-37ef-3806cfe11880	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5576-d939-ada9-e6571bdbe258	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5576-d939-7d6d-81967f2f2feb	Prostor-read	Prostor - branje	f
00030000-5576-d939-7df2-e6745f102d8b	Prostor-write	Prostor - spreminjanje	f
00030000-5576-d939-7c08-856a750c8239	Racun-read	Racun - branje	f
00030000-5576-d939-39fb-ee429034f993	Racun-write	Racun - spreminjanje	f
00030000-5576-d939-655f-f53ea094f254	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5576-d939-9df3-edce871819be	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5576-d939-e173-b8aa3ca4e604	Readme-read	Readme - branje	f
00030000-5576-d939-9f56-324c471f65ac	Readme-write	Readme - spreminjanje	f
00030000-5576-d939-543b-f85ae401eb02	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5576-d939-61fb-88460ef3ec75	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5576-d939-a692-adee14106836	Rekvizit-read	Rekvizit - branje	f
00030000-5576-d939-c652-652570bd7578	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5576-d939-27f0-5d7e1451f6bf	Revizija-read	Revizija - branje	f
00030000-5576-d939-767e-5a4ccdd73dc8	Revizija-write	Revizija - spreminjanje	f
00030000-5576-d939-c753-b7ef4d075762	Rezervacija-read	Rezervacija - branje	f
00030000-5576-d939-5d75-cbd70bac1952	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5576-d939-4c1a-0ff53ac717c1	Role-read	Role - branje	f
00030000-5576-d939-9770-7475c395148f	Role-write	Role - spreminjanje	f
00030000-5576-d939-3f1b-67b55b826d97	SedezniRed-read	SedezniRed - branje	f
00030000-5576-d939-bd54-cd7a2e2b9104	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5576-d939-b395-4fa672941836	Sedez-read	Sedez - branje	f
00030000-5576-d939-595a-42a2b69a0dc2	Sedez-write	Sedez - spreminjanje	f
00030000-5576-d939-16a8-6bc66a4d2614	Sezona-read	Sezona - branje	f
00030000-5576-d939-c4de-a1270a576b25	Sezona-write	Sezona - spreminjanje	f
00030000-5576-d939-7824-4c97d0d88f21	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5576-d939-0c06-ed69e5c968b0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5576-d939-2675-3833a12c0a44	Stevilcenje-read	Stevilcenje - branje	f
00030000-5576-d939-7b28-fbb557024acb	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5576-d939-263d-cca065d10b1f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5576-d939-cf83-89363d466214	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5576-d939-334b-da200721c4c7	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5576-d939-e753-268855e76acd	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5576-d939-3a8e-75ddd4026a05	Telefonska-read	Telefonska - branje	f
00030000-5576-d939-1b65-1328b1b530dd	Telefonska-write	Telefonska - spreminjanje	f
00030000-5576-d939-8783-efb205925708	TerminStoritve-read	TerminStoritve - branje	f
00030000-5576-d939-7862-da48b80a5dbb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5576-d939-6e84-5e185c7ca324	TipFunkcije-read	TipFunkcije - branje	f
00030000-5576-d939-56dd-42aadd4fbb91	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5576-d939-69e2-346bebc8c23c	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5576-d939-2cdf-326cb50d5fcf	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5576-d939-85e6-0bb5e0662747	Trr-read	Trr - branje	f
00030000-5576-d939-05c1-11ab736856d7	Trr-write	Trr - spreminjanje	f
00030000-5576-d939-bf67-3194763d7262	Uprizoritev-read	Uprizoritev - branje	f
00030000-5576-d939-8057-7c454b13c046	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5576-d939-4733-59e610d3a1eb	User-read	User - branje	f
00030000-5576-d939-ce0b-20119551c310	User-write	User - spreminjanje	f
00030000-5576-d939-9cf6-bb64958e1a15	Vaja-read	Vaja - branje	f
00030000-5576-d939-b077-b4f3ca93bcaf	Vaja-write	Vaja - spreminjanje	f
00030000-5576-d939-43a9-f2af33987249	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5576-d939-8f84-ec2b5f3fc41e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5576-d939-ea17-284c2fd4df0f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5576-d939-df83-719f4de8b19a	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5576-d939-90e8-6440319cd44b	Zasedenost-read	Zasedenost - branje	f
00030000-5576-d939-f2bd-7a6820b86104	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5576-d939-d87a-d0bcd8bab1a1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5576-d939-f683-76eb96223d49	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5576-d939-b54c-0f7846aaa0e3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5576-d939-492a-de58ce43cbaa	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2777 (class 0 OID 6760756)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5576-d939-1c65-ccc50674330f	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-f0b0-0c8b2d6a6789
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-4426-153f3bcf0d07
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-2472-f12327dd985e
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-3f81-b896a4ee67ce
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-dac8-b7919ce63115
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-f0e0-7d690e1ddf5e
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-15b7-fb46e81b2e53
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-9636-25531da91cdd
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-0772-0e521178c6e2
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-dee6-37f04e454a1d
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-4011-a5590ca7f9e9
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-e6ec-06c60f542927
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-9df3-f4e7f04cf27a
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-d40e-5a67f4549dbc
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-223c-e6dc562da794
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-0897-3c0be933e8a8
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-068e-0791bfb3a061
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-ec39-f2531dbb236d
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-f297-135de3538ba7
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-a788-8dd67754babe
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-57ad-8508ebe1699d
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-9dd8-c20ab574e757
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-efff-01ccb51781bc
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-ad0c-5217b8c73297
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-2d51-7a70523c23fe
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-435b-d4edaf0ea66e
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-34a7-184de4aa0553
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-91fe-49f3e5bd0481
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-df8d-4fccde94ec5f
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-7752-382204bb37f9
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-ffd9-c59903f7da67
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-7d6d-81967f2f2feb
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-7df2-e6745f102d8b
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-543b-f85ae401eb02
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-61fb-88460ef3ec75
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-a692-adee14106836
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-c652-652570bd7578
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-16a8-6bc66a4d2614
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-c4de-a1270a576b25
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-6e84-5e185c7ca324
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-bf67-3194763d7262
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-8057-7c454b13c046
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-9cf6-bb64958e1a15
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-b077-b4f3ca93bcaf
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-90e8-6440319cd44b
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-f2bd-7a6820b86104
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-d87a-d0bcd8bab1a1
00020000-5576-d939-b56d-8b1cbcc1a390	00030000-5576-d939-b54c-0f7846aaa0e3
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-f0b0-0c8b2d6a6789
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-dac8-b7919ce63115
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-f0e0-7d690e1ddf5e
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-e6ec-06c60f542927
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-d40e-5a67f4549dbc
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-0897-3c0be933e8a8
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-068e-0791bfb3a061
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-ec39-f2531dbb236d
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-f297-135de3538ba7
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-a788-8dd67754babe
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-57ad-8508ebe1699d
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-9dd8-c20ab574e757
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-ad0c-5217b8c73297
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-435b-d4edaf0ea66e
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-34a7-184de4aa0553
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-91fe-49f3e5bd0481
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-7d6d-81967f2f2feb
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-543b-f85ae401eb02
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-a692-adee14106836
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-16a8-6bc66a4d2614
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-3a8e-75ddd4026a05
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-1b65-1328b1b530dd
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-85e6-0bb5e0662747
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-05c1-11ab736856d7
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-ea17-284c2fd4df0f
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-df83-719f4de8b19a
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-d87a-d0bcd8bab1a1
00020000-5576-d939-15de-7a233faa2a55	00030000-5576-d939-b54c-0f7846aaa0e3
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-f0b0-0c8b2d6a6789
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-2472-f12327dd985e
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-dac8-b7919ce63115
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-2a19-d1ff6ee26f8d
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-d8e8-eff06545442f
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-be02-a40bcc4632c5
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-f0e0-7d690e1ddf5e
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-dee6-37f04e454a1d
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-e6ec-06c60f542927
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-d40e-5a67f4549dbc
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-0897-3c0be933e8a8
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-ec39-f2531dbb236d
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-f297-135de3538ba7
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-a788-8dd67754babe
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-9dd8-c20ab574e757
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-ad0c-5217b8c73297
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-91fe-49f3e5bd0481
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-7752-382204bb37f9
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-7d6d-81967f2f2feb
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-543b-f85ae401eb02
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-a692-adee14106836
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-16a8-6bc66a4d2614
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-6e84-5e185c7ca324
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-9cf6-bb64958e1a15
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-90e8-6440319cd44b
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-d87a-d0bcd8bab1a1
00020000-5576-d939-2cc5-a24b93be7b40	00030000-5576-d939-b54c-0f7846aaa0e3
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-f0b0-0c8b2d6a6789
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-4426-153f3bcf0d07
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-3f81-b896a4ee67ce
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-dac8-b7919ce63115
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-f0e0-7d690e1ddf5e
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-e6ec-06c60f542927
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-d40e-5a67f4549dbc
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-ec39-f2531dbb236d
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-f297-135de3538ba7
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-9dd8-c20ab574e757
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-ad0c-5217b8c73297
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-91fe-49f3e5bd0481
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-7d6d-81967f2f2feb
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-543b-f85ae401eb02
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-a692-adee14106836
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-16a8-6bc66a4d2614
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-6e84-5e185c7ca324
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-d87a-d0bcd8bab1a1
00020000-5576-d939-b0e0-fd698429d451	00030000-5576-d939-b54c-0f7846aaa0e3
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-f0b0-0c8b2d6a6789
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-dac8-b7919ce63115
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-f0e0-7d690e1ddf5e
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-7072-93e2c96b7cf0
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-e6ec-06c60f542927
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-d40e-5a67f4549dbc
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-ec39-f2531dbb236d
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-f297-135de3538ba7
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-9dd8-c20ab574e757
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-ad0c-5217b8c73297
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-91fe-49f3e5bd0481
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-7d6d-81967f2f2feb
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-543b-f85ae401eb02
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-a692-adee14106836
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-16a8-6bc66a4d2614
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-8783-efb205925708
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-d44b-09c366bda550
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-6e84-5e185c7ca324
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-d87a-d0bcd8bab1a1
00020000-5576-d939-e5c3-e1095a657a69	00030000-5576-d939-b54c-0f7846aaa0e3
\.


--
-- TOC entry 2805 (class 0 OID 6761051)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6761082)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6761218)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6760816)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5576-d93a-93c5-08ecc150cf9b	00040000-5576-d939-6d19-17a0c936ff4d	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-d93a-7db8-ba3b6f9c666b	00040000-5576-d939-6d19-17a0c936ff4d	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-d93a-0700-971897bbdf8b	00040000-5576-d939-6d19-17a0c936ff4d	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5576-d93a-ecff-8e974f630b18	00040000-5576-d939-6d19-17a0c936ff4d	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2784 (class 0 OID 6760851)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5576-d939-9a41-09fc11954581	8341	Adlešiči
00050000-5576-d939-df1c-bab6f2903ddd	5270	Ajdovščina
00050000-5576-d939-b8aa-0c36970f51f9	6280	Ankaran/Ancarano
00050000-5576-d939-9a43-9f953d95078e	9253	Apače
00050000-5576-d939-b675-dad632a6437e	8253	Artiče
00050000-5576-d939-5307-36c48018482e	4275	Begunje na Gorenjskem
00050000-5576-d939-1319-8107ff74d2df	1382	Begunje pri Cerknici
00050000-5576-d939-78dd-396f20cbf92f	9231	Beltinci
00050000-5576-d939-97bf-0e0310f645af	2234	Benedikt
00050000-5576-d939-cb60-012e18d5028d	2345	Bistrica ob Dravi
00050000-5576-d939-9ac1-56a222ca10a9	3256	Bistrica ob Sotli
00050000-5576-d939-ca12-b528d8d189c1	8259	Bizeljsko
00050000-5576-d939-04fa-73ba83ecb898	1223	Blagovica
00050000-5576-d939-063e-1005a2df1bd1	8283	Blanca
00050000-5576-d939-bef5-b86cf21323dc	4260	Bled
00050000-5576-d939-bc2d-344d97f52ca3	4273	Blejska Dobrava
00050000-5576-d939-16ca-4db2387a006b	9265	Bodonci
00050000-5576-d939-c2ba-61ab1d354315	9222	Bogojina
00050000-5576-d939-95e8-0c5a779f7dce	4263	Bohinjska Bela
00050000-5576-d939-ab34-455c218d1860	4264	Bohinjska Bistrica
00050000-5576-d939-bb04-72c6726c7331	4265	Bohinjsko jezero
00050000-5576-d939-60e0-a49c572e74db	1353	Borovnica
00050000-5576-d939-032c-7d1cc28a63b2	8294	Boštanj
00050000-5576-d939-c023-f94ff628f375	5230	Bovec
00050000-5576-d939-9c30-ac5bd41ce345	5295	Branik
00050000-5576-d939-b691-88b6bc293894	3314	Braslovče
00050000-5576-d939-4da9-db4cbbbe06a2	5223	Breginj
00050000-5576-d939-9ef8-949ba357e528	8280	Brestanica
00050000-5576-d939-1928-6a8160a01659	2354	Bresternica
00050000-5576-d939-a9c0-50d51cea8e11	4243	Brezje
00050000-5576-d939-1e05-96fed68d5f8c	1351	Brezovica pri Ljubljani
00050000-5576-d939-aaac-7a4978da8e59	8250	Brežice
00050000-5576-d939-c319-26d3ff05d780	4210	Brnik - Aerodrom
00050000-5576-d939-f826-cee1d15da982	8321	Brusnice
00050000-5576-d939-b387-6fcc32da0afc	3255	Buče
00050000-5576-d939-5cd1-31b637a0cbf4	8276	Bučka 
00050000-5576-d939-0eb5-6acff391d227	9261	Cankova
00050000-5576-d939-5aca-6d6caa276b3e	3000	Celje 
00050000-5576-d939-53cf-0d67375a1ec3	3001	Celje - poštni predali
00050000-5576-d939-8efe-d1fe9c065e54	4207	Cerklje na Gorenjskem
00050000-5576-d939-d3e4-86bd9a44324a	8263	Cerklje ob Krki
00050000-5576-d939-b0ad-cebbdea5ce8b	1380	Cerknica
00050000-5576-d939-e73a-da88b3da7d4b	5282	Cerkno
00050000-5576-d939-b37b-59539ae2148a	2236	Cerkvenjak
00050000-5576-d939-fb26-0b66f93c75a0	2215	Ceršak
00050000-5576-d939-43d0-ea00178a4ff8	2326	Cirkovce
00050000-5576-d939-23b1-ceb4f6411a22	2282	Cirkulane
00050000-5576-d939-1b94-76a01fa6a3c1	5273	Col
00050000-5576-d939-ca23-88575d4856c7	8251	Čatež ob Savi
00050000-5576-d939-4775-f6f737a04896	1413	Čemšenik
00050000-5576-d939-73a7-a22748d238b8	5253	Čepovan
00050000-5576-d939-ecc4-93da7b23dd34	9232	Črenšovci
00050000-5576-d939-9149-538504300535	2393	Črna na Koroškem
00050000-5576-d939-715e-7debe15a7054	6275	Črni Kal
00050000-5576-d939-f900-9377307e2e65	5274	Črni Vrh nad Idrijo
00050000-5576-d939-5abb-3bc7d3393d7d	5262	Črniče
00050000-5576-d939-7c35-85f0cc615dfd	8340	Črnomelj
00050000-5576-d939-3082-d2e48f6c6349	6271	Dekani
00050000-5576-d939-c8b7-ee1f0c4573c9	5210	Deskle
00050000-5576-d939-5a43-e4181ff9d397	2253	Destrnik
00050000-5576-d939-32ea-44f2213b77df	6215	Divača
00050000-5576-d939-9d5a-13abf2ca51e1	1233	Dob
00050000-5576-d939-d371-4b55358744d3	3224	Dobje pri Planini
00050000-5576-d939-a7a5-9132c5ee2260	8257	Dobova
00050000-5576-d939-4a85-1ea9ff8dd1ee	1423	Dobovec
00050000-5576-d939-5bf4-551f6ec52efd	5263	Dobravlje
00050000-5576-d939-ea6d-a1d3fa7d7294	3204	Dobrna
00050000-5576-d939-d051-990f6bcc12f1	8211	Dobrnič
00050000-5576-d939-9d1f-944f1abb77eb	1356	Dobrova
00050000-5576-d939-ffba-e83722708287	9223	Dobrovnik/Dobronak 
00050000-5576-d939-7199-4f5b95f5fb59	5212	Dobrovo v Brdih
00050000-5576-d939-39a1-a1f9f0d09b50	1431	Dol pri Hrastniku
00050000-5576-d939-107c-f74a98c77e2a	1262	Dol pri Ljubljani
00050000-5576-d939-5980-30047b589939	1273	Dole pri Litiji
00050000-5576-d939-e815-087506c27701	1331	Dolenja vas
00050000-5576-d939-80d7-b9a2c933e917	8350	Dolenjske Toplice
00050000-5576-d939-ffd7-b2d948d1ba58	1230	Domžale
00050000-5576-d939-a7a2-a5c5bd3e58eb	2252	Dornava
00050000-5576-d939-1305-16c5add95aa4	5294	Dornberk
00050000-5576-d939-bbee-efe67b3f5e29	1319	Draga
00050000-5576-d939-b21d-f1dced773a93	8343	Dragatuš
00050000-5576-d939-9c7b-07d6900aa33c	3222	Dramlje
00050000-5576-d939-70ed-f9b4e84bce2b	2370	Dravograd
00050000-5576-d939-c84b-2c4d23d60135	4203	Duplje
00050000-5576-d939-654d-5e9cc26f6dc0	6221	Dutovlje
00050000-5576-d939-3d98-aaf16b7cee16	8361	Dvor
00050000-5576-d939-4ada-467b42997107	2343	Fala
00050000-5576-d939-355e-21b2afd98bbe	9208	Fokovci
00050000-5576-d939-322b-1fcf8ca3169f	2313	Fram
00050000-5576-d939-6a63-abfe37acf0ef	3213	Frankolovo
00050000-5576-d939-95ca-1b2651147cc2	1274	Gabrovka
00050000-5576-d939-47d0-12706bdec1e7	8254	Globoko
00050000-5576-d939-27ac-48c20fbbe184	5275	Godovič
00050000-5576-d939-48aa-2e56a8f0840c	4204	Golnik
00050000-5576-d939-872f-16e331d42081	3303	Gomilsko
00050000-5576-d939-80c4-220f236d3f7c	4224	Gorenja vas
00050000-5576-d939-cab5-196d9e345caf	3263	Gorica pri Slivnici
00050000-5576-d939-2402-c4e12035cccc	2272	Gorišnica
00050000-5576-d939-1be5-3cac5be92668	9250	Gornja Radgona
00050000-5576-d939-2922-376692eef2a1	3342	Gornji Grad
00050000-5576-d939-3509-9c1444e572c5	4282	Gozd Martuljek
00050000-5576-d939-0aa2-a6bb8fd12137	6272	Gračišče
00050000-5576-d939-a9a8-361550da116f	9264	Grad
00050000-5576-d939-e267-fabffee65570	8332	Gradac
00050000-5576-d939-5e0e-2575119cec02	1384	Grahovo
00050000-5576-d939-5a40-da2eeee80fb3	5242	Grahovo ob Bači
00050000-5576-d939-d81c-6f40daa38429	5251	Grgar
00050000-5576-d939-ff5a-e4ab8ee3cccb	3302	Griže
00050000-5576-d939-f8be-6c53ece3fe82	3231	Grobelno
00050000-5576-d939-5ce2-fad0600c6605	1290	Grosuplje
00050000-5576-d939-00c5-20ed14632c99	2288	Hajdina
00050000-5576-d939-2022-2c2c95d9029f	8362	Hinje
00050000-5576-d939-9e01-2ade5b0b22ea	2311	Hoče
00050000-5576-d939-77fb-aa9bac7c0a43	9205	Hodoš/Hodos
00050000-5576-d939-797e-9bad110efc59	1354	Horjul
00050000-5576-d939-482d-95deb519347d	1372	Hotedršica
00050000-5576-d939-728f-36caae6cf7de	1430	Hrastnik
00050000-5576-d939-ffb2-fa55de29416d	6225	Hruševje
00050000-5576-d939-7cf5-c80589e2c922	4276	Hrušica
00050000-5576-d939-a05e-4edf590d9a67	5280	Idrija
00050000-5576-d939-9e4c-3e3413b19c3c	1292	Ig
00050000-5576-d939-e6ea-5a69f3a7a82c	6250	Ilirska Bistrica
00050000-5576-d939-c37e-d65431d8adf5	6251	Ilirska Bistrica-Trnovo
00050000-5576-d939-2db9-b058d918c748	1295	Ivančna Gorica
00050000-5576-d939-e8fc-aad74d9f4d6d	2259	Ivanjkovci
00050000-5576-d939-81f9-11a04f44d059	1411	Izlake
00050000-5576-d939-2a04-5318a7aab9b4	6310	Izola/Isola
00050000-5576-d939-5eb6-20ca8160683a	2222	Jakobski Dol
00050000-5576-d939-ac05-7e43f6fad95f	2221	Jarenina
00050000-5576-d939-c4dd-5abfb26c2242	6254	Jelšane
00050000-5576-d939-dca1-fa5000eccef2	4270	Jesenice
00050000-5576-d939-76ca-3ef253076a03	8261	Jesenice na Dolenjskem
00050000-5576-d939-1428-d361f39ddd1c	3273	Jurklošter
00050000-5576-d939-301b-14c46e05fdec	2223	Jurovski Dol
00050000-5576-d939-36ec-10d5515f745c	2256	Juršinci
00050000-5576-d939-221e-c17a552f1818	5214	Kal nad Kanalom
00050000-5576-d939-7a94-9be94cba9875	3233	Kalobje
00050000-5576-d939-6f53-25dd3361dbee	4246	Kamna Gorica
00050000-5576-d939-b4da-df72a20d3470	2351	Kamnica
00050000-5576-d939-1509-a2ee9909c4f8	1241	Kamnik
00050000-5576-d939-5488-13374f8c6c74	5213	Kanal
00050000-5576-d939-df8a-5b4e7d80142e	8258	Kapele
00050000-5576-d939-d00c-1b37dd8d6f11	2362	Kapla
00050000-5576-d939-ca2d-e3c58a399f1c	2325	Kidričevo
00050000-5576-d939-e773-15b5926f4b07	1412	Kisovec
00050000-5576-d939-f521-d4a2698d9e7d	6253	Knežak
00050000-5576-d939-a431-eb4ad22b0c61	5222	Kobarid
00050000-5576-d939-8aeb-18192eab4777	9227	Kobilje
00050000-5576-d939-1f5b-434434f717dd	1330	Kočevje
00050000-5576-d939-edc8-10b2de389c30	1338	Kočevska Reka
00050000-5576-d939-96c7-6afa263296f3	2276	Kog
00050000-5576-d939-6c54-36798233358d	5211	Kojsko
00050000-5576-d939-64af-8f3c90546298	6223	Komen
00050000-5576-d939-e701-3a29305d16b2	1218	Komenda
00050000-5576-d939-39a4-791979349af1	6000	Koper/Capodistria 
00050000-5576-d939-a000-accadab27079	6001	Koper/Capodistria - poštni predali
00050000-5576-d939-79a6-1e66a3d93d62	8282	Koprivnica
00050000-5576-d939-2690-c75e53620cbf	5296	Kostanjevica na Krasu
00050000-5576-d939-3884-e9a581145072	8311	Kostanjevica na Krki
00050000-5576-d939-234d-58fb5e74ce22	1336	Kostel
00050000-5576-d939-147a-7acb923359dc	6256	Košana
00050000-5576-d939-a4a0-589d76c6a3e8	2394	Kotlje
00050000-5576-d939-1604-9d74cc2a4ca1	6240	Kozina
00050000-5576-d939-519e-c0de2a2add74	3260	Kozje
00050000-5576-d939-7dcb-0eac9f6b1954	4000	Kranj 
00050000-5576-d939-6066-4406e0d5d4f5	4001	Kranj - poštni predali
00050000-5576-d939-1238-061254c37edc	4280	Kranjska Gora
00050000-5576-d939-721b-e49189f03728	1281	Kresnice
00050000-5576-d939-4155-466abcb31265	4294	Križe
00050000-5576-d939-d1f3-137c64915db2	9206	Križevci
00050000-5576-d939-fb30-7bb6b1922849	9242	Križevci pri Ljutomeru
00050000-5576-d939-a579-543ef3eeee72	1301	Krka
00050000-5576-d939-1e28-39127c997c6f	8296	Krmelj
00050000-5576-d939-b3d7-0db8c8925403	4245	Kropa
00050000-5576-d939-e039-aea422911554	8262	Krška vas
00050000-5576-d939-32f1-52e8e63b608a	8270	Krško
00050000-5576-d939-011e-7ad6b6445172	9263	Kuzma
00050000-5576-d939-0fd8-70e86ee4c387	2318	Laporje
00050000-5576-d939-e00d-cc2213fa11a8	3270	Laško
00050000-5576-d939-502c-a097c4b61373	1219	Laze v Tuhinju
00050000-5576-d939-6762-d35014344d4d	2230	Lenart v Slovenskih goricah
00050000-5576-d939-5321-cb20cef3b014	9220	Lendava/Lendva
00050000-5576-d939-1a11-67663e133ac6	4248	Lesce
00050000-5576-d939-2930-299b4efe5fb1	3261	Lesično
00050000-5576-d939-7ac4-083623217713	8273	Leskovec pri Krškem
00050000-5576-d939-5d54-5a9d49a2b74a	2372	Libeliče
00050000-5576-d939-bf8e-c7c0eda9f707	2341	Limbuš
00050000-5576-d939-c7e6-56babc84d649	1270	Litija
00050000-5576-d939-5cfa-83e0415a92a6	3202	Ljubečna
00050000-5576-d939-eebd-61e7bb1bd5d2	1000	Ljubljana 
00050000-5576-d939-8ab1-060737e452ac	1001	Ljubljana - poštni predali
00050000-5576-d939-1055-9552b3197d2e	1231	Ljubljana - Črnuče
00050000-5576-d939-1562-4bf3e51a1c3b	1261	Ljubljana - Dobrunje
00050000-5576-d939-95d5-f8d20af233bd	1260	Ljubljana - Polje
00050000-5576-d939-72ff-de42bdbdcb15	1210	Ljubljana - Šentvid
00050000-5576-d939-d680-1706cd77179b	1211	Ljubljana - Šmartno
00050000-5576-d939-62d7-11e7190495ec	3333	Ljubno ob Savinji
00050000-5576-d939-16fe-3838f07ee858	9240	Ljutomer
00050000-5576-d939-9355-1aae2cb365ce	3215	Loče
00050000-5576-d939-be8b-e25f12edb41c	5231	Log pod Mangartom
00050000-5576-d939-f805-6e2c2507d44e	1358	Log pri Brezovici
00050000-5576-d939-7df2-926849190bbd	1370	Logatec
00050000-5576-d939-0a4d-c714e6a818c2	1371	Logatec
00050000-5576-d939-4589-d8301e7d7ea5	1434	Loka pri Zidanem Mostu
00050000-5576-d939-8bef-8b61b9503176	3223	Loka pri Žusmu
00050000-5576-d939-93a3-033786de4252	6219	Lokev
00050000-5576-d939-95e6-16625e347fea	1318	Loški Potok
00050000-5576-d939-71ed-a07294cbf1e1	2324	Lovrenc na Dravskem polju
00050000-5576-d939-e832-503cc15e2112	2344	Lovrenc na Pohorju
00050000-5576-d939-dc8c-6c4ab3fd5015	3334	Luče
00050000-5576-d939-c437-f42d7060df61	1225	Lukovica
00050000-5576-d939-3b21-0478f215a862	9202	Mačkovci
00050000-5576-d939-b04a-20ed5b4bac71	2322	Majšperk
00050000-5576-d939-4e68-345a51d86e3b	2321	Makole
00050000-5576-d939-5e8d-ba64cc8cd2f5	9243	Mala Nedelja
00050000-5576-d939-95a5-656b02c654a5	2229	Malečnik
00050000-5576-d939-f5c5-8798200f44f8	6273	Marezige
00050000-5576-d939-daf7-d53554a311fd	2000	Maribor 
00050000-5576-d939-32bc-8ca3c6545d72	2001	Maribor - poštni predali
00050000-5576-d939-c9bb-d38ded42d230	2206	Marjeta na Dravskem polju
00050000-5576-d939-0c25-28e68a3f7bd7	2281	Markovci
00050000-5576-d939-79b4-631e63c87af8	9221	Martjanci
00050000-5576-d939-a393-726f0fa12ba9	6242	Materija
00050000-5576-d939-4f2c-c8197226ac51	4211	Mavčiče
00050000-5576-d939-6260-37fc523b6da9	1215	Medvode
00050000-5576-d939-f35e-307cef1ff33f	1234	Mengeš
00050000-5576-d939-4f9c-29f96a038743	8330	Metlika
00050000-5576-d939-7f66-6a9b523bbded	2392	Mežica
00050000-5576-d939-c3cf-045a9b1d94ee	2204	Miklavž na Dravskem polju
00050000-5576-d939-aaf2-89ca0f96fb41	2275	Miklavž pri Ormožu
00050000-5576-d939-159a-60fc01ad9b5e	5291	Miren
00050000-5576-d939-5b34-5604b89c7cba	8233	Mirna
00050000-5576-d939-bd29-6bdafed97460	8216	Mirna Peč
00050000-5576-d939-fa1e-69b0283eb77c	2382	Mislinja
00050000-5576-d939-5db4-736a4f371ed8	4281	Mojstrana
00050000-5576-d939-53f9-3f625b2a5d2c	8230	Mokronog
00050000-5576-d939-752e-9380e6b574d9	1251	Moravče
00050000-5576-d939-80b9-310dfa53b724	9226	Moravske Toplice
00050000-5576-d939-55a0-e426b26d8b39	5216	Most na Soči
00050000-5576-d939-2333-0295fc36fc6a	1221	Motnik
00050000-5576-d939-81c0-77f5ee0b2840	3330	Mozirje
00050000-5576-d939-3a18-1caa01862dd9	9000	Murska Sobota 
00050000-5576-d939-4483-9854c3dfec55	9001	Murska Sobota - poštni predali
00050000-5576-d939-8542-31c7da3b7f2e	2366	Muta
00050000-5576-d939-dcc4-bac66450ab53	4202	Naklo
00050000-5576-d939-d08e-f139ccff72b5	3331	Nazarje
00050000-5576-d939-7398-ed0aa459787f	1357	Notranje Gorice
00050000-5576-d939-5512-d4f1a730eba0	3203	Nova Cerkev
00050000-5576-d939-99a8-f7c0fd4f88f7	5000	Nova Gorica 
00050000-5576-d939-30c9-bb02a969697b	5001	Nova Gorica - poštni predali
00050000-5576-d939-c530-9c11473f4996	1385	Nova vas
00050000-5576-d939-9a11-3c5837182e1f	8000	Novo mesto
00050000-5576-d939-22be-4632b076f162	8001	Novo mesto - poštni predali
00050000-5576-d939-ba18-565e707b48c1	6243	Obrov
00050000-5576-d939-135e-2fb49f996a76	9233	Odranci
00050000-5576-d939-1d6a-3b5f464b69f2	2317	Oplotnica
00050000-5576-d939-fedf-0baf4578c48c	2312	Orehova vas
00050000-5576-d939-6f3e-3838b84e8661	2270	Ormož
00050000-5576-d939-5023-aaac1014e8ba	1316	Ortnek
00050000-5576-d939-b070-a9dc56b93e45	1337	Osilnica
00050000-5576-d939-1cbb-8d78288e594c	8222	Otočec
00050000-5576-d939-53c9-3a14870e2f69	2361	Ožbalt
00050000-5576-d939-35b6-2999df9b2035	2231	Pernica
00050000-5576-d939-7f40-cddc5b363b5a	2211	Pesnica pri Mariboru
00050000-5576-d939-6195-afe486943f43	9203	Petrovci
00050000-5576-d939-1ffb-de273391c5a4	3301	Petrovče
00050000-5576-d939-63e3-c2853247dd5f	6330	Piran/Pirano
00050000-5576-d939-7f3b-afe0788253b4	8255	Pišece
00050000-5576-d939-4dc7-5849c1764e41	6257	Pivka
00050000-5576-d939-8cd4-325643459c32	6232	Planina
00050000-5576-d939-0ac4-3ca9179a2c15	3225	Planina pri Sevnici
00050000-5576-d939-01af-f033d7a18745	6276	Pobegi
00050000-5576-d939-8486-9c1c7a1bc6d4	8312	Podbočje
00050000-5576-d939-434a-517538c3c935	5243	Podbrdo
00050000-5576-d939-c905-f2f57b4646ae	3254	Podčetrtek
00050000-5576-d939-e1b1-80e8920ce374	2273	Podgorci
00050000-5576-d939-f1ec-4c8f06fa8890	6216	Podgorje
00050000-5576-d939-8c90-aab3ba82ffa5	2381	Podgorje pri Slovenj Gradcu
00050000-5576-d939-39a2-75178410d919	6244	Podgrad
00050000-5576-d939-e1e2-3f4ab092c434	1414	Podkum
00050000-5576-d939-81dd-1b310b0b0e6b	2286	Podlehnik
00050000-5576-d939-d7bd-577110f967ac	5272	Podnanos
00050000-5576-d939-e2c8-eff47f8f6948	4244	Podnart
00050000-5576-d939-5bb9-b4dc74b0df5c	3241	Podplat
00050000-5576-d939-9ed9-473e3cb8b54f	3257	Podsreda
00050000-5576-d939-e95f-9ac2f61c882e	2363	Podvelka
00050000-5576-d939-a3fc-677564e34c9b	2208	Pohorje
00050000-5576-d939-fba6-04d6f6e368f2	2257	Polenšak
00050000-5576-d939-ed44-a25a3aff400f	1355	Polhov Gradec
00050000-5576-d939-bd6f-36e529d8fc01	4223	Poljane nad Škofjo Loko
00050000-5576-d939-5511-5bbf62fd8d20	2319	Poljčane
00050000-5576-d939-e43e-520219da83e6	1272	Polšnik
00050000-5576-d939-402b-59becfe248df	3313	Polzela
00050000-5576-d939-c550-c5d8d38812c2	3232	Ponikva
00050000-5576-d939-1bc9-8f099ed97ac0	6320	Portorož/Portorose
00050000-5576-d939-de4f-c4e7d7ef80d3	6230	Postojna
00050000-5576-d939-5900-d12eb4db6f64	2331	Pragersko
00050000-5576-d939-18f3-cd59f20b4147	3312	Prebold
00050000-5576-d939-53cd-1bcbc6ca5f75	4205	Preddvor
00050000-5576-d939-2d6e-5198b076d48d	6255	Prem
00050000-5576-d939-668b-4728d68ffd2a	1352	Preserje
00050000-5576-d939-1a8e-c281c9145d09	6258	Prestranek
00050000-5576-d939-41ec-689f2d66f45a	2391	Prevalje
00050000-5576-d939-1805-abadd50987e1	3262	Prevorje
00050000-5576-d939-9006-1b4c8d068f22	1276	Primskovo 
00050000-5576-d939-0185-6619204ceb4f	3253	Pristava pri Mestinju
00050000-5576-d939-3e54-995d58b34a05	9207	Prosenjakovci/Partosfalva
00050000-5576-d939-5b30-51f9908e02f6	5297	Prvačina
00050000-5576-d939-5569-c2af4fc2d475	2250	Ptuj
00050000-5576-d939-7f29-2d0e3b36b82e	2323	Ptujska Gora
00050000-5576-d939-2db6-c579c090ed2d	9201	Puconci
00050000-5576-d939-509e-3688efae4943	2327	Rače
00050000-5576-d939-9af3-d02c7ca66ddb	1433	Radeče
00050000-5576-d939-9239-1123d4e96ee9	9252	Radenci
00050000-5576-d939-22cd-4954b3ea0fbb	2360	Radlje ob Dravi
00050000-5576-d939-c806-fd12f0029e67	1235	Radomlje
00050000-5576-d939-e153-d96713493658	4240	Radovljica
00050000-5576-d939-e727-449b343b6512	8274	Raka
00050000-5576-d939-019c-180757d2d5e4	1381	Rakek
00050000-5576-d939-0281-8767789809d5	4283	Rateče - Planica
00050000-5576-d939-fdd5-2b0e712e8ee9	2390	Ravne na Koroškem
00050000-5576-d939-1729-1bb9f9703b80	9246	Razkrižje
00050000-5576-d939-7dd8-9732e4d2cb1d	3332	Rečica ob Savinji
00050000-5576-d939-3778-103eba03779d	5292	Renče
00050000-5576-d939-ebd9-a1e4dea8c334	1310	Ribnica
00050000-5576-d939-ca56-18e8253f53b1	2364	Ribnica na Pohorju
00050000-5576-d939-0951-a5745780054f	3272	Rimske Toplice
00050000-5576-d939-609c-a6fd49ce0ca3	1314	Rob
00050000-5576-d939-37ce-a6d52ebe5f45	5215	Ročinj
00050000-5576-d939-160f-11c5bfd7d80a	3250	Rogaška Slatina
00050000-5576-d939-0711-b7004a4314f2	9262	Rogašovci
00050000-5576-d939-c5f5-c599a5e9f065	3252	Rogatec
00050000-5576-d939-558c-47d680b80698	1373	Rovte
00050000-5576-d939-45d2-3eb7061f8f3c	2342	Ruše
00050000-5576-d939-2ad5-c0bc66a5fc5c	1282	Sava
00050000-5576-d939-4825-28c524b51a43	6333	Sečovlje/Sicciole
00050000-5576-d939-c989-9a7e5cd3bd18	4227	Selca
00050000-5576-d939-c35c-83f8f5e706dd	2352	Selnica ob Dravi
00050000-5576-d939-73e6-02b617fc7255	8333	Semič
00050000-5576-d939-97b3-25e0bf1f94d5	8281	Senovo
00050000-5576-d939-0d9d-bfb05000f5c0	6224	Senožeče
00050000-5576-d939-89e0-bd871b15269d	8290	Sevnica
00050000-5576-d939-6682-aaf224fdb560	6210	Sežana
00050000-5576-d939-9d8e-3ec83cac67c8	2214	Sladki Vrh
00050000-5576-d939-d9a1-6efbf2151e18	5283	Slap ob Idrijci
00050000-5576-d939-21c4-35b7bb1be8c2	2380	Slovenj Gradec
00050000-5576-d939-dbc6-e3c0218fdfc9	2310	Slovenska Bistrica
00050000-5576-d939-0418-36fb2020dc4a	3210	Slovenske Konjice
00050000-5576-d939-6acb-02e1fd062c1f	1216	Smlednik
00050000-5576-d939-252e-5d9e63410662	5232	Soča
00050000-5576-d939-ac93-833d05fde4c6	1317	Sodražica
00050000-5576-d939-7d39-076e597b226d	3335	Solčava
00050000-5576-d939-6f7e-d3b533aed27b	5250	Solkan
00050000-5576-d939-8028-e4536b813eab	4229	Sorica
00050000-5576-d939-0ada-9df04d495552	4225	Sovodenj
00050000-5576-d939-8107-62cdaa88500c	5281	Spodnja Idrija
00050000-5576-d939-6bde-3773a2e9aa0e	2241	Spodnji Duplek
00050000-5576-d939-ab9c-e2f62bb7b499	9245	Spodnji Ivanjci
00050000-5576-d939-93af-a422e28c08d5	2277	Središče ob Dravi
00050000-5576-d939-3dd9-dbf3b0380031	4267	Srednja vas v Bohinju
00050000-5576-d939-d49d-b8bb9da12485	8256	Sromlje 
00050000-5576-d939-2ef8-33f4a36854f6	5224	Srpenica
00050000-5576-d939-3dc6-54d1f23eed24	1242	Stahovica
00050000-5576-d939-bf32-9281ab0a0220	1332	Stara Cerkev
00050000-5576-d939-0378-c08f0e26e6b8	8342	Stari trg ob Kolpi
00050000-5576-d939-2f57-137977ebade1	1386	Stari trg pri Ložu
00050000-5576-d939-59fc-7c65864b1e9e	2205	Starše
00050000-5576-d939-b415-81832ed4de5d	2289	Stoperce
00050000-5576-d939-97e6-ee3aa40736c6	8322	Stopiče
00050000-5576-d939-1c53-c4138223056a	3206	Stranice
00050000-5576-d939-8dec-c7bfbbd3da26	8351	Straža
00050000-5576-d939-2373-f10fcb26f615	1313	Struge
00050000-5576-d939-faf0-73b35a20bf3a	8293	Studenec
00050000-5576-d939-42aa-75f6458d0146	8331	Suhor
00050000-5576-d939-5621-a94c77903585	2233	Sv. Ana v Slovenskih goricah
00050000-5576-d939-aa1e-9708429d41cc	2235	Sv. Trojica v Slovenskih goricah
00050000-5576-d939-00f2-2fa9988979b2	2353	Sveti Duh na Ostrem Vrhu
00050000-5576-d939-a571-78e52707d6cd	9244	Sveti Jurij ob Ščavnici
00050000-5576-d939-b581-dcddfd1f305e	3264	Sveti Štefan
00050000-5576-d939-ead3-cb38c18ccc72	2258	Sveti Tomaž
00050000-5576-d939-e0ea-0fca10d2b4c7	9204	Šalovci
00050000-5576-d939-19d1-0b89a789a298	5261	Šempas
00050000-5576-d939-6c27-5bfb9ceee912	5290	Šempeter pri Gorici
00050000-5576-d939-e711-28d43a46d683	3311	Šempeter v Savinjski dolini
00050000-5576-d939-5c21-31d928f240a1	4208	Šenčur
00050000-5576-d939-faac-dc55df80ccb8	2212	Šentilj v Slovenskih goricah
00050000-5576-d939-e28d-9e9a5ebf8fb5	8297	Šentjanž
00050000-5576-d939-5b65-435a322bad12	2373	Šentjanž pri Dravogradu
00050000-5576-d939-153d-5771c5eb39aa	8310	Šentjernej
00050000-5576-d939-07d4-15f010a5543d	3230	Šentjur
00050000-5576-d939-07ad-a288ec053da6	3271	Šentrupert
00050000-5576-d939-57e6-b535a8998682	8232	Šentrupert
00050000-5576-d939-dede-cc2d6f1850ff	1296	Šentvid pri Stični
00050000-5576-d939-43f9-c8d0f70ed9e8	8275	Škocjan
00050000-5576-d939-f569-36b08c211a98	6281	Škofije
00050000-5576-d939-d5aa-31cee29a1188	4220	Škofja Loka
00050000-5576-d939-bae6-2e371c4a4ff4	3211	Škofja vas
00050000-5576-d939-d72d-7d8abc3b3631	1291	Škofljica
00050000-5576-d939-f685-66f58dc012a6	6274	Šmarje
00050000-5576-d939-6955-be6982e158a0	1293	Šmarje - Sap
00050000-5576-d939-676e-80648bd34a3b	3240	Šmarje pri Jelšah
00050000-5576-d939-7cea-2716e7b98f46	8220	Šmarješke Toplice
00050000-5576-d939-924f-6f64790d752f	2315	Šmartno na Pohorju
00050000-5576-d939-7d6e-49cdaa1227a8	3341	Šmartno ob Dreti
00050000-5576-d939-22f7-2d3952ffd733	3327	Šmartno ob Paki
00050000-5576-d939-277f-71421362720b	1275	Šmartno pri Litiji
00050000-5576-d939-ffd7-f47aaf0c5abf	2383	Šmartno pri Slovenj Gradcu
00050000-5576-d939-adab-43fcd09aaa4f	3201	Šmartno v Rožni dolini
00050000-5576-d939-a486-ad09268e4628	3325	Šoštanj
00050000-5576-d939-99cc-57b1d2968a2b	6222	Štanjel
00050000-5576-d939-e132-e50e0ec69313	3220	Štore
00050000-5576-d939-aeb9-e61be7710843	3304	Tabor
00050000-5576-d939-d16a-bc62d333a100	3221	Teharje
00050000-5576-d939-42fa-32ddef0734d9	9251	Tišina
00050000-5576-d939-66ef-a49055ee109d	5220	Tolmin
00050000-5576-d939-f516-bc2f12602731	3326	Topolšica
00050000-5576-d939-1553-e7a3407c4098	2371	Trbonje
00050000-5576-d939-ac06-681b1183dad2	1420	Trbovlje
00050000-5576-d939-5a49-6557359aaa1f	8231	Trebelno 
00050000-5576-d939-054b-12de34199b8d	8210	Trebnje
00050000-5576-d939-0eef-a66f68f4fcb6	5252	Trnovo pri Gorici
00050000-5576-d939-9175-99b1cf77bb65	2254	Trnovska vas
00050000-5576-d939-78c3-c64af7a5848c	1222	Trojane
00050000-5576-d939-7360-d758b5630f96	1236	Trzin
00050000-5576-d939-0860-33275a1f43fc	4290	Tržič
00050000-5576-d939-2cda-9c4335963444	8295	Tržišče
00050000-5576-d939-5f84-0d29af8945ac	1311	Turjak
00050000-5576-d939-5f63-83c1e969d615	9224	Turnišče
00050000-5576-d939-1572-bec4a7216192	8323	Uršna sela
00050000-5576-d939-aa34-4fce9067137b	1252	Vače
00050000-5576-d939-5604-58c7f61d7617	3320	Velenje 
00050000-5576-d939-80f6-80befce357e1	3322	Velenje - poštni predali
00050000-5576-d939-947a-87e8abc2434d	8212	Velika Loka
00050000-5576-d939-e5d4-fd8382ea153e	2274	Velika Nedelja
00050000-5576-d939-5394-710283d5bfe8	9225	Velika Polana
00050000-5576-d939-c4ec-3d22e6dc92a6	1315	Velike Lašče
00050000-5576-d939-21d5-5161e25ee2b8	8213	Veliki Gaber
00050000-5576-d939-ed6c-daa39fca3108	9241	Veržej
00050000-5576-d939-f891-0f54ea7f05eb	1312	Videm - Dobrepolje
00050000-5576-d939-423a-d8793ec38ad2	2284	Videm pri Ptuju
00050000-5576-d939-4053-df55301a1238	8344	Vinica
00050000-5576-d939-9308-dc1ce344d34a	5271	Vipava
00050000-5576-d939-f763-0655384b60f0	4212	Visoko
00050000-5576-d939-695c-0bfa40bead74	1294	Višnja Gora
00050000-5576-d939-28bc-79c3797e4de0	3205	Vitanje
00050000-5576-d939-bd61-a03914754734	2255	Vitomarci
00050000-5576-d939-4595-5af10bdfc2cb	1217	Vodice
00050000-5576-d939-7794-4cbc8983b713	3212	Vojnik\t
00050000-5576-d939-7126-d1e3b70dd289	5293	Volčja Draga
00050000-5576-d939-a3a9-85f50f78bcbd	2232	Voličina
00050000-5576-d939-81df-c7f61790aebe	3305	Vransko
00050000-5576-d939-c4ae-9d42b34a6b86	6217	Vremski Britof
00050000-5576-d939-4113-1db1c8cb093d	1360	Vrhnika
00050000-5576-d939-3c6b-6297e341100d	2365	Vuhred
00050000-5576-d939-c9b6-1e6a77f3c9de	2367	Vuzenica
00050000-5576-d939-9ff6-a498be06f422	8292	Zabukovje 
00050000-5576-d939-b59c-07cd51e9d174	1410	Zagorje ob Savi
00050000-5576-d939-afb2-0e15e548e4f7	1303	Zagradec
00050000-5576-d939-9f21-77eb344545f6	2283	Zavrč
00050000-5576-d939-0883-6eac7de114ee	8272	Zdole 
00050000-5576-d939-e927-b03482cca337	4201	Zgornja Besnica
00050000-5576-d939-7910-f33606d7486b	2242	Zgornja Korena
00050000-5576-d939-61a7-ad3a87583b66	2201	Zgornja Kungota
00050000-5576-d939-64ee-48275be2cf86	2316	Zgornja Ložnica
00050000-5576-d939-2a85-e23fd884baa1	2314	Zgornja Polskava
00050000-5576-d939-1c49-5ad23099064a	2213	Zgornja Velka
00050000-5576-d939-9be2-7e2e2a4d30c0	4247	Zgornje Gorje
00050000-5576-d939-a5f3-593ba0da41cd	4206	Zgornje Jezersko
00050000-5576-d939-754c-f9165d24ab3d	2285	Zgornji Leskovec
00050000-5576-d939-74ba-995386319c51	1432	Zidani Most
00050000-5576-d939-3899-66d81e6e95ff	3214	Zreče
00050000-5576-d939-612e-07b6cc52a6df	4209	Žabnica
00050000-5576-d939-65a6-c2a2ca8f5b39	3310	Žalec
00050000-5576-d939-b2cd-b02413f2554e	4228	Železniki
00050000-5576-d939-b5de-41c51787dec1	2287	Žetale
00050000-5576-d939-a7fe-18cc20403015	4226	Žiri
00050000-5576-d939-c865-54773823785c	4274	Žirovnica
00050000-5576-d939-9a78-f9dc221606ef	8360	Žužemberk
\.


--
-- TOC entry 2801 (class 0 OID 6761025)
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
-- TOC entry 2783 (class 0 OID 6760836)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6760914)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6761037)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6761157)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6761210)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5576-d93a-7316-43e0600d3c10	00080000-5576-d93a-0700-971897bbdf8b	0987	A
00190000-5576-d93a-a875-b35c5caec625	00080000-5576-d93a-7db8-ba3b6f9c666b	0989	A
\.


--
-- TOC entry 2827 (class 0 OID 6761324)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6761352)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6761333)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6761066)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5576-d93a-7ae8-2b2a5767577a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5576-d93a-71c9-a53dbcf772b6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5576-d93a-e862-d3b64d3981e2	0003	Kazinska	t	84	Kazinska dvorana
00220000-5576-d93a-7e53-a41e938a1a13	0004	Mali oder	t	24	Mali oder 
00220000-5576-d93a-10fc-bc9cddc6c905	0005	Komorni oder	t	15	Komorni oder
00220000-5576-d93a-8340-cb37bb98bf70	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5576-d93a-4c1f-2eea98ff4d9a	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2799 (class 0 OID 6761010)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6761000)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6761199)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6761134)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2772 (class 0 OID 6760708)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5576-d939-4ea4-a06c1bfc01ef	00010000-5576-d939-8d00-33cd6553c3b4	2015-06-09 14:16:59	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROR1YZtBW26zAFrocXZy4uUH5jYq43hYa";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2808 (class 0 OID 6761076)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2776 (class 0 OID 6760746)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5576-d939-3b03-9048d2e0d00f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5576-d939-1c65-ccc50674330f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5576-d939-de18-0d21a458ce88	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5576-d939-ad1f-78f503fb376f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5576-d939-b56d-8b1cbcc1a390	planer	Planer dogodkov v koledarju	t
00020000-5576-d939-15de-7a233faa2a55	kadrovska	Kadrovska služba	t
00020000-5576-d939-2cc5-a24b93be7b40	arhivar	Ažuriranje arhivalij	t
00020000-5576-d939-b0e0-fd698429d451	igralec	Igralec	t
00020000-5576-d939-e5c3-e1095a657a69	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2774 (class 0 OID 6760730)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5576-d939-4ea4-a06c1bfc01ef	00020000-5576-d939-de18-0d21a458ce88
00010000-5576-d939-8d00-33cd6553c3b4	00020000-5576-d939-de18-0d21a458ce88
\.


--
-- TOC entry 2810 (class 0 OID 6761090)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6761031)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6760981)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6761371)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5576-d939-44c2-51c71cacbffb	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5576-d939-f971-e120fd42a8ce	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5576-d939-2fd8-363409b9d894	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5576-d939-ac66-91ecf6dfc237	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5576-d939-fc66-60e14e951b2c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2832 (class 0 OID 6761363)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5576-d939-1160-81f211d6fc8b	00230000-5576-d939-ac66-91ecf6dfc237	popa
00240000-5576-d939-5c9b-1d3c7d47e971	00230000-5576-d939-ac66-91ecf6dfc237	oseba
00240000-5576-d939-8ea5-79b1e4061032	00230000-5576-d939-f971-e120fd42a8ce	prostor
00240000-5576-d939-dbff-cb0fd9e0b98e	00230000-5576-d939-ac66-91ecf6dfc237	besedilo
00240000-5576-d939-8c24-ba6961d4ebf0	00230000-5576-d939-ac66-91ecf6dfc237	uprizoritev
00240000-5576-d939-9f13-2d6dc78609b2	00230000-5576-d939-ac66-91ecf6dfc237	funkcija
00240000-5576-d939-8aed-7683430fac02	00230000-5576-d939-ac66-91ecf6dfc237	tipfunkcije
00240000-5576-d939-9cd2-0e7310e05d27	00230000-5576-d939-ac66-91ecf6dfc237	alternacija
00240000-5576-d939-fe80-f3806df211cc	00230000-5576-d939-44c2-51c71cacbffb	pogodba
00240000-5576-d939-37de-e26c618dfbbe	00230000-5576-d939-ac66-91ecf6dfc237	zaposlitev
\.


--
-- TOC entry 2831 (class 0 OID 6761358)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6761144)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6760808)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6760987)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5576-d93a-8fc2-0236eca06fd6	00180000-5576-d93a-fdd1-78a4fe12bc2e	000c0000-5576-d93a-0f07-6a34e78b7a7e	00090000-5576-d93a-8e95-a9e5e056e980	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-d93a-5340-25f0d6e3283b	00180000-5576-d93a-fdd1-78a4fe12bc2e	000c0000-5576-d93a-889a-0fce9b20ce34	00090000-5576-d93a-22d7-efbd8dedb7c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-d93a-642a-31a81b885413	00180000-5576-d93a-fdd1-78a4fe12bc2e	000c0000-5576-d93a-a7cc-fb95fe9cb8b6	00090000-5576-d93a-c978-9f64ec7ae49f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-d93a-a795-98e094271b7c	00180000-5576-d93a-fdd1-78a4fe12bc2e	000c0000-5576-d93a-db6a-731bbc0c438c	00090000-5576-d93a-8ae2-ce3fa957a229	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-d93a-739b-09226c288ac1	00180000-5576-d93a-fdd1-78a4fe12bc2e	000c0000-5576-d93a-f6f0-264d21603245	00090000-5576-d93a-ac96-d387e3fd2783	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5576-d93a-a8c8-0265fe82149f	00180000-5576-d93a-03f9-9e2a2754991f	\N	00090000-5576-d93a-ac96-d387e3fd2783	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2818 (class 0 OID 6761188)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5576-d939-14c6-60bb5d3e2703	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5576-d939-7819-6159c0164c7a	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5576-d939-a157-f6726a540234	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5576-d939-fb04-89079ae8eeb0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5576-d939-eef3-954f73028bbb	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5576-d939-81c3-b4c98c7af224	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5576-d939-bd42-0ff31a63b8a9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5576-d939-309b-7daf4def0fec	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5576-d939-94de-687965407284	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5576-d939-2cbf-df2d55851f9a	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5576-d939-01a7-92733f625372	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5576-d939-e21e-2de819069722	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5576-d939-6d93-8152dd628616	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5576-d939-e2f8-799f195c835c	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5576-d939-1321-a77ea23bdfd6	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5576-d939-1bb0-7632ea6f091a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2829 (class 0 OID 6761341)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5576-d939-4a4e-86cd61554c5a	01	Velika predstava	f	1.00	1.00
002b0000-5576-d939-fff2-838314104a52	02	Mala predstava	f	0.50	0.50
002b0000-5576-d939-7326-f947a3eab000	03	Mala koprodukcija	t	0.40	1.00
002b0000-5576-d939-02e8-1d476ed59dd3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5576-d939-302e-cecfb4d139ba	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2786 (class 0 OID 6760871)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6760717)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5576-d939-8d00-33cd6553c3b4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROqjobNcT215679cOZd9H1pIxCnv2D0Ja	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5576-d93a-66b9-0dfc0e83f240	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5576-d93a-5316-0086a5fa8a83	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5576-d93a-09b9-a2310a330f4f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5576-d93a-c7ca-f841c4dad2c7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5576-d93a-a4e3-c5a493c360d7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5576-d93a-49d0-e140ee155609	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5576-d939-4ea4-a06c1bfc01ef	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 6761245)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5576-d93a-844a-2a7ab2f5d7b7	00160000-5576-d93a-abf1-731f942665ab	00150000-5576-d939-961d-75f4f7f49b19	00140000-5576-d939-a43e-79bfedc3a1e6	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5576-d93a-10fc-bc9cddc6c905
000e0000-5576-d93a-b136-739e0fb01738	00160000-5576-d93a-3456-4015d361f42a	00150000-5576-d939-f408-f647b544f55a	00140000-5576-d939-0ceb-8eb7e2373ab8	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5576-d93a-8340-cb37bb98bf70
\.


--
-- TOC entry 2791 (class 0 OID 6760933)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5576-d93a-9d4f-6d9f86e8a644	000e0000-5576-d93a-b136-739e0fb01738	1	
00200000-5576-d93a-71fb-ad4b5004e941	000e0000-5576-d93a-b136-739e0fb01738	2	
\.


--
-- TOC entry 2806 (class 0 OID 6761058)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6761127)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6760965)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6761235)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5576-d939-a43e-79bfedc3a1e6	01	Drama	drama (SURS 01)
00140000-5576-d939-68e3-b63519e15ae8	02	Opera	opera (SURS 02)
00140000-5576-d939-ca8a-39c4396c7c29	03	Balet	balet (SURS 03)
00140000-5576-d939-042f-0719560c3ab8	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5576-d939-921e-4961d3912109	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5576-d939-0ceb-8eb7e2373ab8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5576-d939-e865-0d603e45f2e2	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2812 (class 0 OID 6761117)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5576-d939-2173-3d1dff6561af	01	Opera	opera
00150000-5576-d939-316f-9a9770a7241f	02	Opereta	opereta
00150000-5576-d939-4259-99bd1c2d4d96	03	Balet	balet
00150000-5576-d939-f8ee-54afde49df08	04	Plesne prireditve	plesne prireditve
00150000-5576-d939-4611-25f4d0f13f68	05	Lutkovno gledališče	lutkovno gledališče
00150000-5576-d939-6090-e0308e62122d	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5576-d939-a4df-56cad16451ae	07	Biografska drama	biografska drama
00150000-5576-d939-961d-75f4f7f49b19	08	Komedija	komedija
00150000-5576-d939-3067-597661ff0844	09	Črna komedija	črna komedija
00150000-5576-d939-44f7-dd24c66ed4c1	10	E-igra	E-igra
00150000-5576-d939-f408-f647b544f55a	11	Kriminalka	kriminalka
00150000-5576-d939-7261-5afd32eb8f8d	12	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6760771)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6761291)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6761281)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6761187)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6760955)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6760980)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6760897)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6761320)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6761113)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6760931)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6760974)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6760911)
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
-- TOC entry 2456 (class 2606 OID 6761023)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6761050)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6760869)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6760780)
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
-- TOC entry 2371 (class 2606 OID 6760804)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6760760)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6760745)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6761056)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6761089)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6761230)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6760833)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6760857)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6761029)
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
-- TOC entry 2386 (class 2606 OID 6760847)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6760918)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6761041)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6761169)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6761215)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6761331)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6761356)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6761338)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6761073)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6761014)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6761005)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6761209)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6761141)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6760716)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6761080)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6760734)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6760754)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6761098)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6761036)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6760986)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6761380)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6761368)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6761362)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6761154)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6760813)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6760996)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6761198)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6761351)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6760882)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6760729)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6761261)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6760940)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6761064)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6761132)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6760969)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6761243)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6761125)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6760962)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2504 (class 1259 OID 6761155)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 6761156)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6760835)
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
-- TOC entry 2469 (class 1259 OID 6761057)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6761043)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6761042)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6760941)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6761114)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6761116)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6761115)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6760913)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6760912)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 6761232)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 6761233)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2524 (class 1259 OID 6761234)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2531 (class 1259 OID 6761266)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2532 (class 1259 OID 6761263)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2533 (class 1259 OID 6761265)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2534 (class 1259 OID 6761264)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6760884)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6760883)
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
-- TOC entry 2369 (class 1259 OID 6760807)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6761081)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6760975)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6760761)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6760762)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6761101)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6761100)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6761099)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6760919)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6760921)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6760920)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 6761370)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6761009)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6761007)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6761006)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6761008)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6760735)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6760736)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6761065)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6761030)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2500 (class 1259 OID 6761142)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2501 (class 1259 OID 6761143)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 6761321)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 6761322)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2554 (class 1259 OID 6761323)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2382 (class 1259 OID 6760849)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6760848)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6760850)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2564 (class 1259 OID 6761357)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2508 (class 1259 OID 6761170)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 6761171)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2544 (class 1259 OID 6761295)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2545 (class 1259 OID 6761297)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2546 (class 1259 OID 6761293)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2547 (class 1259 OID 6761296)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2548 (class 1259 OID 6761294)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2497 (class 1259 OID 6761133)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6761018)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6761017)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6761015)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6761016)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2540 (class 1259 OID 6761283)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2541 (class 1259 OID 6761282)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 6761332)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6760932)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6760782)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6760781)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6760814)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6760815)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6760999)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6760998)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6760997)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2558 (class 1259 OID 6761340)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2559 (class 1259 OID 6761339)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6760964)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6760960)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6760957)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6760958)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6760956)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6760961)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6760959)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6760834)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6760898)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6760900)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6760899)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6760901)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6761024)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6761231)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6761262)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6760805)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6760806)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 6761126)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6761381)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6760870)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 6761369)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6761075)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6761074)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 6761292)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6760858)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6761244)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6761216)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 6761217)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6760755)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6760963)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2601 (class 2606 OID 6761517)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2604 (class 2606 OID 6761502)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2603 (class 2606 OID 6761507)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2599 (class 2606 OID 6761527)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6761497)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2600 (class 2606 OID 6761522)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2602 (class 2606 OID 6761512)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2635 (class 2606 OID 6761672)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6761677)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6761432)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2622 (class 2606 OID 6761612)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2620 (class 2606 OID 6761607)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2621 (class 2606 OID 6761602)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2598 (class 2606 OID 6761492)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6761642)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6761652)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2629 (class 2606 OID 6761647)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2592 (class 2606 OID 6761467)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6761462)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2618 (class 2606 OID 6761592)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6761697)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 6761702)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6761707)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2642 (class 2606 OID 6761727)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2645 (class 2606 OID 6761712)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2643 (class 2606 OID 6761722)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2644 (class 2606 OID 6761717)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2590 (class 2606 OID 6761457)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6761452)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6761417)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2583 (class 2606 OID 6761412)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2624 (class 2606 OID 6761622)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2606 (class 2606 OID 6761532)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2579 (class 2606 OID 6761392)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2578 (class 2606 OID 6761397)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2625 (class 2606 OID 6761637)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2626 (class 2606 OID 6761632)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2627 (class 2606 OID 6761627)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2596 (class 2606 OID 6761472)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2594 (class 2606 OID 6761482)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2595 (class 2606 OID 6761477)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2660 (class 2606 OID 6761802)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2610 (class 2606 OID 6761567)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2612 (class 2606 OID 6761557)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2613 (class 2606 OID 6761552)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2611 (class 2606 OID 6761562)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2577 (class 2606 OID 6761382)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2576 (class 2606 OID 6761387)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6761617)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2619 (class 2606 OID 6761597)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2633 (class 2606 OID 6761662)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2632 (class 2606 OID 6761667)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6761767)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6761772)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2653 (class 2606 OID 6761777)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2588 (class 2606 OID 6761442)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6761437)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2587 (class 2606 OID 6761447)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2659 (class 2606 OID 6761797)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 6761682)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6761687)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2650 (class 2606 OID 6761752)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6761762)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2652 (class 2606 OID 6761742)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2649 (class 2606 OID 6761757)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2651 (class 2606 OID 6761747)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2631 (class 2606 OID 6761657)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6761587)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2615 (class 2606 OID 6761582)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2617 (class 2606 OID 6761572)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2616 (class 2606 OID 6761577)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2646 (class 2606 OID 6761737)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 6761732)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 6761782)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2597 (class 2606 OID 6761487)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2638 (class 2606 OID 6761692)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6761407)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2581 (class 2606 OID 6761402)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2585 (class 2606 OID 6761422)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2584 (class 2606 OID 6761427)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2607 (class 2606 OID 6761547)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6761542)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2609 (class 2606 OID 6761537)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2657 (class 2606 OID 6761792)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 6761787)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-09 14:16:59 CEST

--
-- PostgreSQL database dump complete
--

