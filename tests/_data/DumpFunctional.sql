--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 15:12:56 CEST

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
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 236
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6607308)
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
-- TOC entry 227 (class 1259 OID 6607831)
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
-- TOC entry 226 (class 1259 OID 6607814)
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
-- TOC entry 219 (class 1259 OID 6607717)
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
-- TOC entry 194 (class 1259 OID 6607487)
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
-- TOC entry 197 (class 1259 OID 6607521)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6607430)
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
-- TOC entry 228 (class 1259 OID 6607845)
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
-- TOC entry 213 (class 1259 OID 6607647)
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
-- TOC entry 192 (class 1259 OID 6607467)
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
-- TOC entry 196 (class 1259 OID 6607515)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6607447)
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
-- TOC entry 202 (class 1259 OID 6607564)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6607589)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6607404)
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
-- TOC entry 181 (class 1259 OID 6607317)
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
-- TOC entry 182 (class 1259 OID 6607328)
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
-- TOC entry 177 (class 1259 OID 6607282)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6607301)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6607596)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6607627)
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
-- TOC entry 223 (class 1259 OID 6607765)
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
-- TOC entry 184 (class 1259 OID 6607361)
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
-- TOC entry 186 (class 1259 OID 6607396)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6607570)
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
-- TOC entry 185 (class 1259 OID 6607381)
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
-- TOC entry 191 (class 1259 OID 6607459)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6607582)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6607702)
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
-- TOC entry 222 (class 1259 OID 6607757)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6607871)
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
-- TOC entry 232 (class 1259 OID 6607899)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6607880)
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
-- TOC entry 209 (class 1259 OID 6607611)
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
-- TOC entry 201 (class 1259 OID 6607555)
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
-- TOC entry 200 (class 1259 OID 6607545)
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
-- TOC entry 221 (class 1259 OID 6607746)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6607679)
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
-- TOC entry 174 (class 1259 OID 6607253)
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
-- TOC entry 173 (class 1259 OID 6607251)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6607621)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6607291)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6607275)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6607635)
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
-- TOC entry 204 (class 1259 OID 6607576)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6607526)
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
-- TOC entry 235 (class 1259 OID 6607918)
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
-- TOC entry 234 (class 1259 OID 6607910)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6607905)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6607689)
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
-- TOC entry 183 (class 1259 OID 6607353)
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
-- TOC entry 199 (class 1259 OID 6607532)
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
-- TOC entry 220 (class 1259 OID 6607735)
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
-- TOC entry 231 (class 1259 OID 6607888)
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
-- TOC entry 188 (class 1259 OID 6607416)
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
-- TOC entry 175 (class 1259 OID 6607262)
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
-- TOC entry 225 (class 1259 OID 6607792)
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
-- TOC entry 193 (class 1259 OID 6607478)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6607603)
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
-- TOC entry 215 (class 1259 OID 6607672)
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
-- TOC entry 195 (class 1259 OID 6607510)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6607782)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6607662)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2168 (class 2604 OID 6607256)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2780 (class 0 OID 6607308)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6607831)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-94d8-1593-b1160805bac1	000d0000-5575-94d7-e1c8-d0999036f09e	\N	00090000-5575-94d7-b4e5-a3518568d080	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-94d8-ef39-bfb9109bb545	000d0000-5575-94d7-83a5-6965e07619e9	\N	00090000-5575-94d7-b36b-339cc740c027	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-94d8-9e09-1dd2cbc47b8e	000d0000-5575-94d7-2af9-8a1c2c3d04e7	\N	00090000-5575-94d7-3809-63e8cf400503	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-94d8-b7e1-fcb21d3c9679	000d0000-5575-94d7-bb8d-4658467fe3aa	\N	00090000-5575-94d7-e6ec-c58c6550fce7	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-94d8-e569-71f480aba007	000d0000-5575-94d7-3626-523b3f973ce2	\N	00090000-5575-94d7-dce4-d9fb71979c9e	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-94d8-912f-c589bbfa13c5	000d0000-5575-94d7-d60e-83988996e59f	\N	00090000-5575-94d7-b36b-339cc740c027	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2826 (class 0 OID 6607814)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6607717)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-94d7-7bbd-e4ae8ca4bc50	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-94d7-50ad-535c3d5a85a6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-94d7-645e-434f5fe06573	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2794 (class 0 OID 6607487)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-94d7-b0f4-cc0d7c1e9038	\N	\N	00200000-5575-94d7-bc5e-c9e463f0ab71	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-94d7-0c0f-ffc4360f6e5a	\N	\N	00200000-5575-94d7-4f89-fcc828411eec	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-94d7-9e23-a8c706b291d4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-94d7-d6c6-3e0cd4c1a351	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-94d7-c8b7-37b04c68d08c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2797 (class 0 OID 6607521)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6607430)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-94d6-2408-e1bd6197509b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-94d6-47a4-2335aaa93f10	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-94d6-7b87-a6446242f16c	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-94d6-017b-0827dc4ce744	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-94d6-a853-e3f4f15dcb02	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-94d6-295c-71e117c3fc0d	AD	AND	020	Andorra 	Andora	\N
00040000-5575-94d6-0259-e66d53608865	AO	AGO	024	Angola 	Angola	\N
00040000-5575-94d6-43e7-1913958f0116	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-94d6-da3d-b44078d673cf	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-94d6-14f2-8f3f7a20453f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-94d6-ae0c-52884bdd66e3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-94d6-6fc0-fd15aae8650d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-94d6-305c-364a4e8b6341	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-94d6-4add-be07a82c601a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-94d6-0de1-97c2a04e855d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-94d6-34a1-eeaa65c64f28	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-94d6-123d-a9a4dd094191	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-94d6-adb9-8351da53cd8f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-94d6-5d1d-2e9e14398da6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-94d6-4c52-e1076e187064	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-94d6-3072-5053c6b23d5a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-94d6-3286-73783f6fe4af	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-94d6-2edf-3dd4a389dd23	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-94d6-1682-2fb7976ca0df	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-94d6-9860-cf6582d3b5d7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-94d6-22a1-81b28e0518bc	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-94d6-518a-80872fbac12b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-94d6-29cc-1f2f0c9650b6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-94d6-00bc-5070f5190808	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-94d6-77e1-0459b48cce94	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-94d6-a563-fd5398d72124	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-94d6-e646-dfc3549edea0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-94d6-64cb-ebc02029e9ea	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-94d6-aedd-6703c71535ad	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-94d6-4dcb-612a7ea37dd1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-94d6-466f-8bf6e8ff96bb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-94d6-4489-d98407794fc7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-94d6-8ac0-36a4e33f3ad7	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-94d6-eadb-9e73cc3beb8c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-94d6-d0b8-97c1bbd04511	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-94d6-0d00-492ba71d9499	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-94d6-a83e-7a00a43bcc87	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-94d6-d670-80257030b566	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-94d6-9ebc-2fb278f3706c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-94d6-029a-67804a6506e4	CL	CHL	152	Chile 	Čile	\N
00040000-5575-94d6-d429-3c1e03118287	CN	CHN	156	China 	Kitajska	\N
00040000-5575-94d6-f129-1d2929b0d348	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-94d6-6fe3-a8430eed560e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-94d6-6c52-e703fde9124a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-94d6-942b-898d26ddb31a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-94d6-be59-86f86f1937db	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-94d6-a775-2f12d1280018	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-94d6-3a68-fc1050c0ede8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-94d6-5247-216592f11925	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-94d6-62ec-4bda28067d1d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-94d6-82e2-0bac3475ed9d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-94d6-dd53-35df42993585	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-94d6-c0e7-8a6fee0da247	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-94d6-6ba3-a85f837089c2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-94d6-a821-930e6d53d3a1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-94d6-4cd3-8582ac150489	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-94d6-dcdb-b3505c33c995	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-94d6-6a7b-6e45449d67ba	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-94d6-ca0b-5fa5f90c6a11	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-94d6-2303-eb2fbf590100	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-94d6-fdb2-3d86b741839b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-94d6-8bd5-dbac0cd28fba	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-94d6-7ff3-5b171b2c0612	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-94d6-8bb2-77b75f875849	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-94d6-f0c7-eb3ba054b7a4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-94d6-36e3-a37ab0243615	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-94d6-14fb-ba06344fd980	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-94d6-2698-435b08ca8b89	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-94d6-feca-99a511631883	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-94d6-f6ce-947bfc432d67	FI	FIN	246	Finland 	Finska	\N
00040000-5575-94d6-1d1e-25eabd8666ab	FR	FRA	250	France 	Francija	\N
00040000-5575-94d6-9b45-541267afe553	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-94d6-0062-f3c0f0a445be	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-94d6-7057-b68a9cf647d4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-94d6-fac8-c37e95b52dd4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-94d6-5d07-1a7d6c2b2e69	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-94d6-2329-71ccef2d4a45	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-94d6-e853-08cf6ef749c1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-94d6-dbbc-db5de438bc5b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-94d6-ed9e-5cc1ddcd1b50	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-94d6-2f48-e4b7b7b84303	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-94d6-dbbd-dca874897108	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-94d6-9bde-196b5b743c30	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-94d6-3961-91514774559a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-94d6-4928-5144a15c8cb7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-94d6-49b2-fd78ed54ca13	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-94d6-69cd-c9f2413ca0fc	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-94d6-2c3a-ca8b665caa57	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-94d6-b9ca-f763c98e7497	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-94d6-120c-9636e91c5aeb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-94d6-5635-5c6730e55ddb	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-94d6-7e0b-a428de3f1622	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-94d6-c90e-1afe7eb40f9e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-94d6-5a7e-0d036ecb134b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-94d6-597e-2b10a2526458	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-94d6-41df-24cd9f17d004	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-94d6-07e9-5c694412bf1b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-94d6-2869-9ff7784f1e29	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-94d6-fdc1-4e8c52783ae7	IN	IND	356	India 	Indija	\N
00040000-5575-94d6-2d5b-e94a74dd2bff	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-94d6-d82c-c49d2d0f12b1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-94d6-2c66-4697e7ee7c09	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-94d6-f0d3-ecbceac3ed51	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-94d6-c008-d1e0dd9cba59	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-94d6-829d-20eb854c8f15	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-94d6-1f36-251a9419cebb	IT	ITA	380	Italy 	Italija	\N
00040000-5575-94d6-5cbc-44288452a119	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-94d6-9515-b8c4c7cb39f9	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-94d6-3527-9bc9b70ebc47	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-94d6-8153-16974ec57219	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-94d6-a10b-1ade62f95135	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-94d6-a7de-c226faf8ee4f	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-94d6-2ab8-a10b067d8742	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-94d6-d482-f573968cce94	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-94d6-9e3e-3482780cb3c0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-94d6-20ec-db8ac749d40f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-94d6-607c-e2186fbe1ca0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-94d6-6925-057a45dac923	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-94d6-add3-bff848e7665d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-94d6-a992-7b8dded712ec	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-94d6-3b72-2c940e5f184d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-94d6-e826-a2484c8d4ec8	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-94d6-769a-85c17be438e0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-94d6-d82e-6e2a2b633dc6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-94d6-adbf-87e0b32feb16	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-94d6-0aa2-981583d8daa4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-94d6-c228-533fe7d8dba6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-94d6-1c6d-2139d952fac9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-94d6-c560-da97e6c3644f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-94d6-f9aa-1cee4d496553	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-94d6-83cd-e08e0396cfe5	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-94d6-1890-a9f539e89c06	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-94d6-631d-76b5f3c8c77f	ML	MLI	466	Mali 	Mali	\N
00040000-5575-94d6-d998-aadfa564fe63	MT	MLT	470	Malta 	Malta	\N
00040000-5575-94d6-845b-05a68e0fc8a5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-94d6-a685-4cd5dc4e1316	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-94d6-0557-013c9d6dd949	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-94d6-29a2-1c0f5c633d96	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-94d6-feb5-5ce56117b7ec	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-94d6-aeb4-9db0dde6272a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-94d6-ee2a-7c5948043622	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-94d6-6ad4-974437da6c24	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-94d6-291a-74e0ae40fd04	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-94d6-797f-9ec68d8b1ffe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-94d6-2d8d-047ded21b02f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-94d6-e97f-dbb1984bbce8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-94d6-c408-27a013af953f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-94d6-f287-2026cae70eb4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-94d6-293d-3e89bef029ec	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-94d6-a8b9-a798d27c3375	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-94d6-fe75-af1d42536253	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-94d6-f38a-18d6fea0379a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-94d6-34e2-a8d0c2b906f0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-94d6-df96-7440f5f86af7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-94d6-f1be-44ef8ab84d2d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-94d6-bb71-9a244e092234	NE	NER	562	Niger 	Niger 	\N
00040000-5575-94d6-5e8d-2c017b47d31f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-94d6-a533-ce60bdf87788	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-94d6-7984-37c93eb7ef62	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-94d6-7003-7645e21c05e7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-94d6-9109-14bebfcc5371	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-94d6-d7af-49279ae777fb	OM	OMN	512	Oman 	Oman	\N
00040000-5575-94d6-062b-722140f8844a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-94d6-6383-19afe5b91fcb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-94d6-4f6a-7ff680648cd9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-94d6-e625-8855149f8b9c	PA	PAN	591	Panama 	Panama	\N
00040000-5575-94d6-7269-25b4d0ba8778	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-94d6-b208-4b87d39e32c9	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-94d6-bd28-d84d424bb16c	PE	PER	604	Peru 	Peru	\N
00040000-5575-94d6-0c04-4faf6259f928	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-94d6-52b4-367772a72476	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-94d6-5ec0-81b0ef9928bf	PL	POL	616	Poland 	Poljska	\N
00040000-5575-94d6-2ea0-32a222f72ebc	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-94d6-b644-c15ce9c9164f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-94d6-12fc-450cf7a4eb5a	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-94d6-ea7a-32e6ed73fcfd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-94d6-989a-92442add8efb	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-94d6-131e-4e3b300baeea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-94d6-0cd6-0b15dbb35a79	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-94d6-00dc-152293cf42eb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-94d6-ef30-155a2501e8c7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-94d6-a40d-5de6a1a0a643	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-94d6-988a-1cf999bf7197	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-94d6-e457-488e6f06661d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-94d6-2027-13a486f191f1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-94d6-fed1-363fcb86c4e0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-94d6-3f2f-8ef1a7f80093	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-94d6-0c3e-7949c1bcad28	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-94d6-7675-ca9da0cf2f1a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-94d6-7ce2-c2c224b3b09b	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-94d6-2559-717d9abd837b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-94d6-09bb-f8b689d7b985	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-94d6-8f6f-4a09c4f62a10	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-94d6-2d1d-0bb4f2a8c09b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-94d6-c0c8-878882541104	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-94d6-7913-e2ba55bfaed9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-94d6-c608-b942bd616103	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-94d6-af9a-6f7547b8bfe1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-94d6-932f-b3ea5b3afe7c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-94d6-8eda-529609416876	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-94d6-981c-9ac9199b70ce	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-94d6-db76-1e1a9e51e297	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-94d6-ca60-8284da9ba626	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-94d6-6853-62efd484b4dc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-94d6-1d45-6a2b2885f6e7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-94d6-bb45-ec52c78a080a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-94d6-5d8f-42cb301338e1	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-94d6-83d8-bc2b356b47ff	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-94d6-f63c-1073d6f9385e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-94d6-1b09-92038b35405c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-94d6-a41a-510989c24f1e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-94d6-1e5b-ddb680451b8f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-94d6-d94e-9cdfc8c51081	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-94d6-b5a4-ecb8511530e1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-94d6-63ac-f6a219a3ba23	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-94d6-30fc-3173aa0f9e8c	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-94d6-a130-842942053238	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-94d6-d1c1-3783a15761c7	TG	TGO	768	Togo 	Togo	\N
00040000-5575-94d6-1cf5-3b7cb48ab11c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-94d6-2fda-ab2f7298ca92	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-94d6-a029-055d35fdad11	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-94d6-8769-c662046555cc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-94d6-2834-7e3e680b768c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-94d6-e2f6-b8101875b829	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-94d6-0a52-f22a287bb926	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-94d6-e9b1-7ff3b2f35bc3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-94d6-6ece-88e51feb4739	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-94d6-b279-9ecc9e062e74	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-94d6-fcdb-62991f446077	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-94d6-7d29-9f4008723a07	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-94d6-446b-9ef59ae732d6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-94d6-dace-3c94687dc5d5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-94d6-7d07-19d54f0346ef	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-94d6-987e-17350caceddc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-94d6-676e-3eb03e8c935b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-94d6-30ac-fbfa268ae5a1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-94d6-f950-6f952072f0fa	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-94d6-862f-8bd3a4bec3b3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-94d6-fc8f-65393faa2c29	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-94d6-2056-cf27fb830309	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-94d6-805f-42103f6c860a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-94d6-559c-e5bb083af2a2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-94d6-cde7-bf0380816807	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-94d6-210f-fcc8d04fa862	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2828 (class 0 OID 6607845)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6607647)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-94d7-90fb-b114b4c4d81e	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-94d6-8984-fa07a594c5bc
000d0000-5575-94d7-e1c8-d0999036f09e	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-94d6-8984-fa07a594c5bc
000d0000-5575-94d7-83a5-6965e07619e9	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-94d6-5264-2ce099f466eb
000d0000-5575-94d7-2af9-8a1c2c3d04e7	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-94d6-aa8a-ec161bd19982
000d0000-5575-94d7-bb8d-4658467fe3aa	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-94d6-aa8a-ec161bd19982
000d0000-5575-94d7-3626-523b3f973ce2	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-94d6-aa8a-ec161bd19982
000d0000-5575-94d7-d60e-83988996e59f	000e0000-5575-94d7-c03f-cd2cd7aa77ee	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-94d6-8984-fa07a594c5bc
\.


--
-- TOC entry 2792 (class 0 OID 6607467)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6607515)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6607447)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-94d7-7b4c-1a05bb24f947	00080000-5575-94d7-d8e7-44c9a172de14	00090000-5575-94d7-b4e5-a3518568d080	AK		
\.


--
-- TOC entry 2770 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6607564)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6607589)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6607404)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-94d7-8be3-8df6ff77559a	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-94d7-5857-4b0ede0e0072	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-94d7-6131-cb74365dd7df	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-94d7-3d23-1e91003ee1a2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-94d7-1315-335a17dcda05	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-94d7-c518-aef5a987cdae	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-94d7-ac7e-709caac35ba7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-94d7-6ef7-81963ebbf6b4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-94d7-64ca-d5d9cc12d3c7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-94d7-c192-f273b67a120b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-94d7-be72-5e2e5c41950f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-94d7-4967-efaf8496939a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-94d7-fa32-73c3f4fc00b2	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-94d7-1385-e1b8e7469c20	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-94d7-4d53-72c6789d4e8e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-94d7-13aa-1754fb22cee7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2781 (class 0 OID 6607317)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-94d7-f388-56beedc37696	00000000-5575-94d7-1315-335a17dcda05	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-94d7-c184-d8696aee5fb6	00000000-5575-94d7-1315-335a17dcda05	00010000-5575-94d7-84b3-9154d4c67052	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-94d7-0611-202a8da02d75	00000000-5575-94d7-c518-aef5a987cdae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2782 (class 0 OID 6607328)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-94d7-ef96-260182124032	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-94d7-e6ec-c58c6550fce7	00010000-5575-94d7-3c8a-5ace81440ae5	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-94d7-3809-63e8cf400503	00010000-5575-94d7-1737-1b99773e58c3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-94d7-5705-b2d1554921b0	00010000-5575-94d7-4045-b34515e7df13	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-94d7-e7fb-d2bebcb73db6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-94d7-45f0-5e0da06938e1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-94d7-dc64-e4cfbea1a893	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-94d7-c1da-edf7c95c16c1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-94d7-b4e5-a3518568d080	00010000-5575-94d7-5069-23726506fe06	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-94d7-b36b-339cc740c027	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-94d7-8ca1-521634a91aac	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-94d7-dce4-d9fb71979c9e	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-94d7-346e-23a61538dc62	00010000-5575-94d7-25b0-6a36b27be1a7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2772 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2777 (class 0 OID 6607282)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-94d6-423b-2182171d2d3e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-94d6-b2fa-b763c5574914	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-94d6-9b71-969ff63faf34	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-94d6-e60e-0740b905c73f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-94d6-eb36-dac9a7de2556	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-94d6-2eff-2de514034842	Abonma-read	Abonma - branje	f
00030000-5575-94d6-6100-8df6d1f94cbe	Abonma-write	Abonma - spreminjanje	f
00030000-5575-94d6-e837-217163bb98c6	Alternacija-read	Alternacija - branje	f
00030000-5575-94d6-874f-92e134edee57	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-94d7-0786-f4e2b2763b78	Arhivalija-read	Arhivalija - branje	f
00030000-5575-94d7-417a-b666ea795772	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-94d7-1731-ff5de44d962c	Besedilo-read	Besedilo - branje	f
00030000-5575-94d7-0ace-ba42ffc916c4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-94d7-0e7b-03ada961876f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-94d7-93bb-0860ea50781d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-94d7-e032-b57d04d501c4	Dogodek-read	Dogodek - branje	f
00030000-5575-94d7-9d9e-6ab747de4c0e	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-94d7-5489-c1ed38f0bca3	Drzava-read	Drzava - branje	f
00030000-5575-94d7-3d70-8edd8888904e	Drzava-write	Drzava - spreminjanje	f
00030000-5575-94d7-f191-101e9132e538	Funkcija-read	Funkcija - branje	f
00030000-5575-94d7-850d-96e2f24cd346	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-94d7-7b2a-af75cbafb230	Gostovanje-read	Gostovanje - branje	f
00030000-5575-94d7-3ed4-a192d0b61047	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-94d7-11f4-7eddfca7741a	Gostujoca-read	Gostujoca - branje	f
00030000-5575-94d7-5f1c-c8987a5d9f9e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-94d7-e917-c49f5e37218a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-94d7-4694-da782e087f83	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-94d7-847a-536a89cbaeea	Kupec-read	Kupec - branje	f
00030000-5575-94d7-da38-33c561883df1	Kupec-write	Kupec - spreminjanje	f
00030000-5575-94d7-d391-538eed006bd1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-94d7-090b-72a9936c86a1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-94d7-d1ee-b0501ac556e7	Option-read	Option - branje	f
00030000-5575-94d7-9af7-fc2ac512b027	Option-write	Option - spreminjanje	f
00030000-5575-94d7-a1c5-f2856329ecbe	OptionValue-read	OptionValue - branje	f
00030000-5575-94d7-7e28-af143f93524c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-94d7-d438-eca601c037e4	Oseba-read	Oseba - branje	f
00030000-5575-94d7-c68c-7a85feb7aaef	Oseba-write	Oseba - spreminjanje	f
00030000-5575-94d7-abe9-9a3294c9f06f	Permission-read	Permission - branje	f
00030000-5575-94d7-0a67-e307ecd004e7	Permission-write	Permission - spreminjanje	f
00030000-5575-94d7-83af-ed3733205ffc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-94d7-4087-003d05b189fa	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-94d7-0bc7-944a3f11ebff	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-94d7-e027-82699d5f36b6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-94d7-092a-d8f41d63e332	Pogodba-read	Pogodba - branje	f
00030000-5575-94d7-cf77-9bc642d0dd29	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-94d7-2827-e2f5c6f5020e	Popa-read	Popa - branje	f
00030000-5575-94d7-8e44-d1d178a8c017	Popa-write	Popa - spreminjanje	f
00030000-5575-94d7-0648-eb5265b10e8d	Posta-read	Posta - branje	f
00030000-5575-94d7-8688-7bbf63e65de2	Posta-write	Posta - spreminjanje	f
00030000-5575-94d7-eeec-a7100c201635	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-94d7-48bd-f0cecdc2b674	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-94d7-91ec-370d37d9b738	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-94d7-4832-0a648883efa3	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-94d7-f201-4f3d0703aa89	Predstava-read	Predstava - branje	f
00030000-5575-94d7-4919-dbb805de38ee	Predstava-write	Predstava - spreminjanje	f
00030000-5575-94d7-19ff-7b5347d7f1d0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-94d7-a17a-535385b0d730	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-94d7-82f1-c89cb49affdb	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-94d7-53b3-a83c17c9d753	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-94d7-fc2d-0f75e49a94a8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-94d7-8c99-650e9247f82f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-94d7-a29b-cf4353ab1754	ProgramDela-read	ProgramDela - branje	f
00030000-5575-94d7-b5a8-d55df479b7bb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-94d7-cbae-0b873854fb8e	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-94d7-c76f-d86a87152166	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-94d7-a85b-af4a7463b758	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-94d7-169c-69892c808f60	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-94d7-d482-8ca466507f89	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-94d7-1764-7d4a5383a9b8	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-94d7-a696-ec19eeb9d4bf	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-94d7-29d8-2d1b44c74778	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-94d7-c82d-82a2a7dfa854	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-94d7-d239-9c11e39cfc1a	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-94d7-b8fd-c4eabb7cf7a2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-94d7-cdd5-e0d36d10b513	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-94d7-a8b6-36c181913fa7	Prostor-read	Prostor - branje	f
00030000-5575-94d7-c58d-fdbfd49b5b6e	Prostor-write	Prostor - spreminjanje	f
00030000-5575-94d7-dc61-2eac16c50f94	Racun-read	Racun - branje	f
00030000-5575-94d7-b66c-39f36f0241d6	Racun-write	Racun - spreminjanje	f
00030000-5575-94d7-b81f-205286866fb5	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-94d7-e9c8-e5a1a32c4e62	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-94d7-3222-b717b9422ba2	Readme-read	Readme - branje	f
00030000-5575-94d7-8830-71fce5bbe6a8	Readme-write	Readme - spreminjanje	f
00030000-5575-94d7-4e44-b981c3551358	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-94d7-74ca-7bfab0248527	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-94d7-cad6-cbe4e1b8b4d7	Rekvizit-read	Rekvizit - branje	f
00030000-5575-94d7-489c-ddf9a14db995	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-94d7-6737-257cb1b660a8	Revizija-read	Revizija - branje	f
00030000-5575-94d7-4b7d-fa84a3e52490	Revizija-write	Revizija - spreminjanje	f
00030000-5575-94d7-55ef-adb2fb44f8ec	Rezervacija-read	Rezervacija - branje	f
00030000-5575-94d7-e4bf-39f80d9bab7e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-94d7-eccb-842114fd8025	Role-read	Role - branje	f
00030000-5575-94d7-93c4-40ceb6ea63f1	Role-write	Role - spreminjanje	f
00030000-5575-94d7-cf75-d5cf490fe487	SedezniRed-read	SedezniRed - branje	f
00030000-5575-94d7-3283-aa63b33578a2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-94d7-b0c0-71c3b5a17706	Sedez-read	Sedez - branje	f
00030000-5575-94d7-a9c4-5c5ac8efca52	Sedez-write	Sedez - spreminjanje	f
00030000-5575-94d7-300f-027ca502523e	Sezona-read	Sezona - branje	f
00030000-5575-94d7-45a3-1592b3505d65	Sezona-write	Sezona - spreminjanje	f
00030000-5575-94d7-bcda-d3f3fb1093db	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-94d7-1c53-0a74eb593a7f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-94d7-73cf-381528a957e9	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-94d7-7b50-73258486257c	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-94d7-5c7c-710e4059d457	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-94d7-cfb3-8924f506d568	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-94d7-a773-3de4324a3faa	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-94d7-e9b8-5562d1a5f274	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-94d7-e983-517cc45837c7	Telefonska-read	Telefonska - branje	f
00030000-5575-94d7-78e3-6ae5a8557ced	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-94d7-b62f-754847e7595f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-94d7-9573-150112677363	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-94d7-9901-46691d8cc802	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-94d7-b0bb-32eea9e01dad	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-94d7-96d4-064e1e391071	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-94d7-50be-912385aa2f09	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-94d7-c573-7759cd3ab340	Trr-read	Trr - branje	f
00030000-5575-94d7-ace7-4b13401adf50	Trr-write	Trr - spreminjanje	f
00030000-5575-94d7-002d-1006746b190a	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-94d7-04e1-37acbbf232a0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-94d7-a976-5d5eee78fddd	User-read	User - branje	f
00030000-5575-94d7-1e1f-b75669c424aa	User-write	User - spreminjanje	f
00030000-5575-94d7-8fe1-c7764179cb38	Vaja-read	Vaja - branje	f
00030000-5575-94d7-ab49-f7c0ca9adc97	Vaja-write	Vaja - spreminjanje	f
00030000-5575-94d7-a0cc-e568f0fc46b2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-94d7-0efd-c1f7132f0f01	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-94d7-15a6-0a6aef49a498	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-94d7-8228-58a821db3d2f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-94d7-e202-e2eb0f1ee44e	Zasedenost-read	Zasedenost - branje	f
00030000-5575-94d7-2e40-b742f8898778	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-94d7-c6bd-168698c3b871	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-94d7-e8ee-555c27086055	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-94d7-cc7e-5b0825bc66bc	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-94d7-3126-be0d606502aa	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2779 (class 0 OID 6607301)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-94d7-6610-72e6804cb6a8	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d6-2eff-2de514034842
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d6-6100-8df6d1f94cbe
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d6-e837-217163bb98c6
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d6-874f-92e134edee57
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-0786-f4e2b2763b78
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-e032-b57d04d501c4
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d6-e60e-0740b905c73f
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-9d9e-6ab747de4c0e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-3d70-8edd8888904e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-f191-101e9132e538
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-850d-96e2f24cd346
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-7b2a-af75cbafb230
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-3ed4-a192d0b61047
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-11f4-7eddfca7741a
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-5f1c-c8987a5d9f9e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-e917-c49f5e37218a
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-4694-da782e087f83
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-d1ee-b0501ac556e7
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-a1c5-f2856329ecbe
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-d438-eca601c037e4
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-c68c-7a85feb7aaef
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-2827-e2f5c6f5020e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-8e44-d1d178a8c017
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-0648-eb5265b10e8d
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-8688-7bbf63e65de2
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-91ec-370d37d9b738
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-4832-0a648883efa3
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-f201-4f3d0703aa89
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-4919-dbb805de38ee
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-fc2d-0f75e49a94a8
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-8c99-650e9247f82f
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-a8b6-36c181913fa7
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-c58d-fdbfd49b5b6e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-4e44-b981c3551358
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-74ca-7bfab0248527
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-cad6-cbe4e1b8b4d7
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-489c-ddf9a14db995
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-300f-027ca502523e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-45a3-1592b3505d65
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-9901-46691d8cc802
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-002d-1006746b190a
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-04e1-37acbbf232a0
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-8fe1-c7764179cb38
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-ab49-f7c0ca9adc97
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-e202-e2eb0f1ee44e
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-2e40-b742f8898778
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-c6bd-168698c3b871
00020000-5575-94d7-4b14-54a1b487d41b	00030000-5575-94d7-cc7e-5b0825bc66bc
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d6-2eff-2de514034842
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-0786-f4e2b2763b78
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-e032-b57d04d501c4
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-7b2a-af75cbafb230
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-11f4-7eddfca7741a
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-e917-c49f5e37218a
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-4694-da782e087f83
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-d1ee-b0501ac556e7
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-a1c5-f2856329ecbe
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-d438-eca601c037e4
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-c68c-7a85feb7aaef
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-2827-e2f5c6f5020e
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-0648-eb5265b10e8d
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-91ec-370d37d9b738
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-4832-0a648883efa3
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-f201-4f3d0703aa89
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-a8b6-36c181913fa7
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-4e44-b981c3551358
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-cad6-cbe4e1b8b4d7
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-300f-027ca502523e
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-e983-517cc45837c7
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-78e3-6ae5a8557ced
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-c573-7759cd3ab340
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-ace7-4b13401adf50
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-15a6-0a6aef49a498
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-8228-58a821db3d2f
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-c6bd-168698c3b871
00020000-5575-94d7-2e8f-8f4f542428ab	00030000-5575-94d7-cc7e-5b0825bc66bc
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d6-2eff-2de514034842
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d6-e837-217163bb98c6
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-0786-f4e2b2763b78
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-417a-b666ea795772
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-1731-ff5de44d962c
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-0e7b-03ada961876f
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-e032-b57d04d501c4
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-f191-101e9132e538
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-7b2a-af75cbafb230
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-11f4-7eddfca7741a
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-e917-c49f5e37218a
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-d1ee-b0501ac556e7
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-a1c5-f2856329ecbe
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-d438-eca601c037e4
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-2827-e2f5c6f5020e
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-0648-eb5265b10e8d
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-f201-4f3d0703aa89
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-fc2d-0f75e49a94a8
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-a8b6-36c181913fa7
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-4e44-b981c3551358
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-cad6-cbe4e1b8b4d7
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-300f-027ca502523e
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-9901-46691d8cc802
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-8fe1-c7764179cb38
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-e202-e2eb0f1ee44e
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-c6bd-168698c3b871
00020000-5575-94d7-9c27-aaee932350bc	00030000-5575-94d7-cc7e-5b0825bc66bc
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d6-2eff-2de514034842
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d6-6100-8df6d1f94cbe
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d6-874f-92e134edee57
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-0786-f4e2b2763b78
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-e032-b57d04d501c4
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-7b2a-af75cbafb230
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-11f4-7eddfca7741a
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-d1ee-b0501ac556e7
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-a1c5-f2856329ecbe
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-2827-e2f5c6f5020e
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-0648-eb5265b10e8d
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-f201-4f3d0703aa89
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-a8b6-36c181913fa7
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-4e44-b981c3551358
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-cad6-cbe4e1b8b4d7
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-300f-027ca502523e
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-9901-46691d8cc802
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-c6bd-168698c3b871
00020000-5575-94d7-b13d-363c942b5859	00030000-5575-94d7-cc7e-5b0825bc66bc
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d6-2eff-2de514034842
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-0786-f4e2b2763b78
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-e032-b57d04d501c4
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-5489-c1ed38f0bca3
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-7b2a-af75cbafb230
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-11f4-7eddfca7741a
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-d1ee-b0501ac556e7
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-a1c5-f2856329ecbe
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-2827-e2f5c6f5020e
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-0648-eb5265b10e8d
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-f201-4f3d0703aa89
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-a8b6-36c181913fa7
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-4e44-b981c3551358
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-cad6-cbe4e1b8b4d7
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-300f-027ca502523e
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-b62f-754847e7595f
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d6-9b71-969ff63faf34
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-9901-46691d8cc802
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-c6bd-168698c3b871
00020000-5575-94d7-a3f8-5cbd632d9d3a	00030000-5575-94d7-cc7e-5b0825bc66bc
\.


--
-- TOC entry 2807 (class 0 OID 6607596)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6607627)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6607765)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6607361)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-94d7-d8e7-44c9a172de14	00040000-5575-94d6-2408-e1bd6197509b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-94d7-0d7a-2b50ed8ffd90	00040000-5575-94d6-2408-e1bd6197509b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-94d7-910e-8bb569deed81	00040000-5575-94d6-2408-e1bd6197509b	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-94d7-28d1-70dbda5f62b9	00040000-5575-94d6-2408-e1bd6197509b	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2786 (class 0 OID 6607396)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-94d6-bce9-7b8f61fd0459	8341	Adlešiči
00050000-5575-94d6-f68f-9af2b6222659	5270	Ajdovščina
00050000-5575-94d6-1dad-ec000da21175	6280	Ankaran/Ancarano
00050000-5575-94d6-00ef-e5fe04eea3b7	9253	Apače
00050000-5575-94d6-7752-314f72f53fdb	8253	Artiče
00050000-5575-94d6-d08c-916450ca8c2a	4275	Begunje na Gorenjskem
00050000-5575-94d6-22e6-21303f023ec7	1382	Begunje pri Cerknici
00050000-5575-94d6-f95e-a7108563ac09	9231	Beltinci
00050000-5575-94d6-5b59-bbb3453d3c07	2234	Benedikt
00050000-5575-94d6-eb82-3d27dbc59870	2345	Bistrica ob Dravi
00050000-5575-94d6-feb3-2e93526d46ff	3256	Bistrica ob Sotli
00050000-5575-94d6-20e4-c6ffa84a36d2	8259	Bizeljsko
00050000-5575-94d6-2c9e-7033e0211e68	1223	Blagovica
00050000-5575-94d6-51a2-096d4a5cfdcc	8283	Blanca
00050000-5575-94d6-fba7-0fce49c590f4	4260	Bled
00050000-5575-94d6-1640-a759c60e121d	4273	Blejska Dobrava
00050000-5575-94d6-2297-222cc78a32a0	9265	Bodonci
00050000-5575-94d6-c053-f15e7fcc45fd	9222	Bogojina
00050000-5575-94d6-1c97-78899edb6703	4263	Bohinjska Bela
00050000-5575-94d6-827a-1af2276a21c0	4264	Bohinjska Bistrica
00050000-5575-94d6-fd51-290c5f0e514d	4265	Bohinjsko jezero
00050000-5575-94d6-41b5-f692ac2f0493	1353	Borovnica
00050000-5575-94d6-6206-45b39f1a139e	8294	Boštanj
00050000-5575-94d6-66d4-9538e6bb05d1	5230	Bovec
00050000-5575-94d6-dd77-4cc3d143b605	5295	Branik
00050000-5575-94d6-2e26-3329b0ec241d	3314	Braslovče
00050000-5575-94d6-c27c-5281c784ae08	5223	Breginj
00050000-5575-94d6-508e-05be17ab825c	8280	Brestanica
00050000-5575-94d6-5536-fe13f2b868f9	2354	Bresternica
00050000-5575-94d6-b44b-a2784d5b2e22	4243	Brezje
00050000-5575-94d6-2eec-1466036a9363	1351	Brezovica pri Ljubljani
00050000-5575-94d6-2210-9a03c6edd500	8250	Brežice
00050000-5575-94d6-eb60-1bf2d4b5bfd2	4210	Brnik - Aerodrom
00050000-5575-94d6-e316-0b8f71fdcefb	8321	Brusnice
00050000-5575-94d6-5aad-591660587beb	3255	Buče
00050000-5575-94d6-b3f5-56fcf06ac4d2	8276	Bučka 
00050000-5575-94d6-444c-5e072042aa3b	9261	Cankova
00050000-5575-94d6-957d-8f6020030974	3000	Celje 
00050000-5575-94d6-5a06-6e9b8b54b0ff	3001	Celje - poštni predali
00050000-5575-94d6-1512-34952108dfcb	4207	Cerklje na Gorenjskem
00050000-5575-94d6-e42a-da8db667a924	8263	Cerklje ob Krki
00050000-5575-94d6-398e-5f36a2077c8c	1380	Cerknica
00050000-5575-94d6-8210-7f0b0d2441e9	5282	Cerkno
00050000-5575-94d6-3847-bccc49948e93	2236	Cerkvenjak
00050000-5575-94d6-fe2a-926b25c15360	2215	Ceršak
00050000-5575-94d6-bfab-a9fd5bd72aed	2326	Cirkovce
00050000-5575-94d6-3ca9-551e7b1781e0	2282	Cirkulane
00050000-5575-94d6-cca9-c90aa75de806	5273	Col
00050000-5575-94d6-decc-5603920f22da	8251	Čatež ob Savi
00050000-5575-94d6-59f6-6a1f67d81573	1413	Čemšenik
00050000-5575-94d6-c9e7-1fa0e7042459	5253	Čepovan
00050000-5575-94d6-a19b-9f427f9c0d79	9232	Črenšovci
00050000-5575-94d6-f475-7857ae4891d3	2393	Črna na Koroškem
00050000-5575-94d6-e834-6987459a0419	6275	Črni Kal
00050000-5575-94d6-27e8-69be01b92db0	5274	Črni Vrh nad Idrijo
00050000-5575-94d6-9b04-48eaba648a87	5262	Črniče
00050000-5575-94d6-9b44-16238b9b82c0	8340	Črnomelj
00050000-5575-94d6-e990-c60ad43d36e5	6271	Dekani
00050000-5575-94d6-1f75-49d0c090cec0	5210	Deskle
00050000-5575-94d6-e781-9d6430d84742	2253	Destrnik
00050000-5575-94d6-00e9-5520cb760b4b	6215	Divača
00050000-5575-94d6-bda8-5ce7fbe646da	1233	Dob
00050000-5575-94d6-fbb3-a6374b8290fe	3224	Dobje pri Planini
00050000-5575-94d6-29dd-8327b99f3812	8257	Dobova
00050000-5575-94d6-c0dc-9e40f3b612d2	1423	Dobovec
00050000-5575-94d6-9834-024ef468a276	5263	Dobravlje
00050000-5575-94d6-4206-d06307aa547c	3204	Dobrna
00050000-5575-94d6-5dab-88afd78d4386	8211	Dobrnič
00050000-5575-94d6-e4af-151c2be4f2e0	1356	Dobrova
00050000-5575-94d6-e0fa-8f7397fcfa23	9223	Dobrovnik/Dobronak 
00050000-5575-94d6-128b-6d65d3f87485	5212	Dobrovo v Brdih
00050000-5575-94d6-9fc7-ccd584a0ec49	1431	Dol pri Hrastniku
00050000-5575-94d6-6c26-1356e1d7e358	1262	Dol pri Ljubljani
00050000-5575-94d6-400d-159638248bdf	1273	Dole pri Litiji
00050000-5575-94d6-9c48-194131fda26c	1331	Dolenja vas
00050000-5575-94d6-7f92-1b739699f17c	8350	Dolenjske Toplice
00050000-5575-94d6-ff74-011490269935	1230	Domžale
00050000-5575-94d6-5fdc-7561f40597e5	2252	Dornava
00050000-5575-94d6-b70f-cbe371dddb00	5294	Dornberk
00050000-5575-94d6-d27d-f64af4766d69	1319	Draga
00050000-5575-94d6-45cc-64bfa8ad9cdb	8343	Dragatuš
00050000-5575-94d6-8fe3-9a0a3633a5c3	3222	Dramlje
00050000-5575-94d6-b9d2-9eda0e24921c	2370	Dravograd
00050000-5575-94d6-6f74-a1c4346a1c38	4203	Duplje
00050000-5575-94d6-13f9-65645e2abf22	6221	Dutovlje
00050000-5575-94d6-b631-c3f0e6e585e5	8361	Dvor
00050000-5575-94d6-d669-76d9fcf71f22	2343	Fala
00050000-5575-94d6-85b3-e9f6b9ec56fd	9208	Fokovci
00050000-5575-94d6-13a0-4bdf8cc3ede3	2313	Fram
00050000-5575-94d6-f7c4-64d30cfefd8c	3213	Frankolovo
00050000-5575-94d6-4a4e-aea842814cef	1274	Gabrovka
00050000-5575-94d6-1baf-4ca388e3f8f4	8254	Globoko
00050000-5575-94d6-c89e-9a273cb5afb0	5275	Godovič
00050000-5575-94d6-2869-4e86fffba321	4204	Golnik
00050000-5575-94d6-68f2-6eaa7212febb	3303	Gomilsko
00050000-5575-94d6-4a27-5e3c2f7a70a9	4224	Gorenja vas
00050000-5575-94d6-3705-e870ffe6164c	3263	Gorica pri Slivnici
00050000-5575-94d6-dac7-d966249e19f1	2272	Gorišnica
00050000-5575-94d6-3661-10a248f4f670	9250	Gornja Radgona
00050000-5575-94d6-1bfe-8bce9d48d3a3	3342	Gornji Grad
00050000-5575-94d6-e46f-ba4f3c4a2612	4282	Gozd Martuljek
00050000-5575-94d6-c5cf-324e74e09898	6272	Gračišče
00050000-5575-94d6-6a6f-ad7dbe2c562e	9264	Grad
00050000-5575-94d6-31a0-7019e6fa0626	8332	Gradac
00050000-5575-94d6-9e86-eac667997831	1384	Grahovo
00050000-5575-94d6-23e1-edc7f5d75e7c	5242	Grahovo ob Bači
00050000-5575-94d6-3de3-d7f363f9653d	5251	Grgar
00050000-5575-94d6-0deb-835502023223	3302	Griže
00050000-5575-94d6-e472-f46bfcca3a36	3231	Grobelno
00050000-5575-94d6-3b34-0d7712d8f136	1290	Grosuplje
00050000-5575-94d6-6ff6-7e8de5c973e8	2288	Hajdina
00050000-5575-94d6-154e-dff865b404f5	8362	Hinje
00050000-5575-94d6-0c4f-e64ab6d8b76d	2311	Hoče
00050000-5575-94d6-3e2e-efc524b6993d	9205	Hodoš/Hodos
00050000-5575-94d6-cd30-6aaa24b5c00f	1354	Horjul
00050000-5575-94d6-0d2d-c7dda39e47ed	1372	Hotedršica
00050000-5575-94d6-1d50-587577b3c04d	1430	Hrastnik
00050000-5575-94d6-2dd6-b07aa0a4e0d4	6225	Hruševje
00050000-5575-94d6-2c79-d5851298f7ba	4276	Hrušica
00050000-5575-94d6-2508-19e14e7bee02	5280	Idrija
00050000-5575-94d6-d692-4d5e35b36546	1292	Ig
00050000-5575-94d6-1e27-c4c117ec94e6	6250	Ilirska Bistrica
00050000-5575-94d6-2452-b4dd78fde525	6251	Ilirska Bistrica-Trnovo
00050000-5575-94d6-cb9f-d29654d14995	1295	Ivančna Gorica
00050000-5575-94d6-5bde-c4fd9f582893	2259	Ivanjkovci
00050000-5575-94d6-6324-513367bba327	1411	Izlake
00050000-5575-94d6-953a-1e3d7c0fb4a7	6310	Izola/Isola
00050000-5575-94d6-86b6-845420fc8db4	2222	Jakobski Dol
00050000-5575-94d6-ff28-f94c0e19a4a6	2221	Jarenina
00050000-5575-94d6-f5c8-2a3b933fc643	6254	Jelšane
00050000-5575-94d6-3379-a91527fef587	4270	Jesenice
00050000-5575-94d6-a866-fe9d73c57308	8261	Jesenice na Dolenjskem
00050000-5575-94d6-9a30-7da61c21e38e	3273	Jurklošter
00050000-5575-94d6-4eb3-017508435b44	2223	Jurovski Dol
00050000-5575-94d6-7c6b-c6d38ab1a094	2256	Juršinci
00050000-5575-94d6-0a50-107b74746567	5214	Kal nad Kanalom
00050000-5575-94d6-e90e-016be5ce500f	3233	Kalobje
00050000-5575-94d6-2bd6-8ccc217fc058	4246	Kamna Gorica
00050000-5575-94d6-d33d-1c74713bdc7d	2351	Kamnica
00050000-5575-94d6-5cb8-d209ad8c4c4a	1241	Kamnik
00050000-5575-94d6-4ac3-3fed33f1f30a	5213	Kanal
00050000-5575-94d6-e64b-e5dd3fc76755	8258	Kapele
00050000-5575-94d6-9967-204e91e43a02	2362	Kapla
00050000-5575-94d6-78b2-12a2d59a83b0	2325	Kidričevo
00050000-5575-94d6-7160-a972ca14120e	1412	Kisovec
00050000-5575-94d6-de65-63a89c15c620	6253	Knežak
00050000-5575-94d6-8e33-2f789c8b5bfb	5222	Kobarid
00050000-5575-94d6-2f32-75e6bb107383	9227	Kobilje
00050000-5575-94d6-6ca0-4f0ce5119472	1330	Kočevje
00050000-5575-94d6-16a9-7da7fffa8a73	1338	Kočevska Reka
00050000-5575-94d6-024f-537928076d41	2276	Kog
00050000-5575-94d6-06f5-05bb3cc2ccc2	5211	Kojsko
00050000-5575-94d6-2af2-831297315bec	6223	Komen
00050000-5575-94d6-235a-6493d90368c7	1218	Komenda
00050000-5575-94d6-b0a5-e544f5952668	6000	Koper/Capodistria 
00050000-5575-94d6-c062-65b00ef91285	6001	Koper/Capodistria - poštni predali
00050000-5575-94d6-3ad2-1972b383feaa	8282	Koprivnica
00050000-5575-94d6-7688-fd6ef0692155	5296	Kostanjevica na Krasu
00050000-5575-94d6-d8e8-fa086a9b9790	8311	Kostanjevica na Krki
00050000-5575-94d6-6844-a57adf96ee29	1336	Kostel
00050000-5575-94d6-9ac8-cc2fba292d87	6256	Košana
00050000-5575-94d6-ce30-16a0e4ce6df4	2394	Kotlje
00050000-5575-94d6-3087-2c4bcdaa19fd	6240	Kozina
00050000-5575-94d6-a37f-2dbe1622f2da	3260	Kozje
00050000-5575-94d6-e16e-bd334218e54b	4000	Kranj 
00050000-5575-94d6-185f-82938b6f06d5	4001	Kranj - poštni predali
00050000-5575-94d6-29b8-2bd2c0537bd1	4280	Kranjska Gora
00050000-5575-94d6-f6f3-b7e44889577d	1281	Kresnice
00050000-5575-94d6-b8aa-88602e7515de	4294	Križe
00050000-5575-94d6-2813-caf36ceb2c0c	9206	Križevci
00050000-5575-94d6-00db-5a2a5bad34d5	9242	Križevci pri Ljutomeru
00050000-5575-94d6-0da8-119f3827c5f4	1301	Krka
00050000-5575-94d6-d465-efb3ff70ba70	8296	Krmelj
00050000-5575-94d6-d8b2-8d3e9b482b75	4245	Kropa
00050000-5575-94d6-d7c0-26ccffed5aca	8262	Krška vas
00050000-5575-94d6-1774-9826d03b3e51	8270	Krško
00050000-5575-94d6-4554-d460b9f7ccc8	9263	Kuzma
00050000-5575-94d6-2a8e-455d7ea7d591	2318	Laporje
00050000-5575-94d6-898a-ed0dc4be9a78	3270	Laško
00050000-5575-94d6-bf9c-bd26c484d289	1219	Laze v Tuhinju
00050000-5575-94d6-1bf9-a6aad40e4fe9	2230	Lenart v Slovenskih goricah
00050000-5575-94d6-5c47-48d31504bf6f	9220	Lendava/Lendva
00050000-5575-94d6-2228-09ec1c1c2507	4248	Lesce
00050000-5575-94d6-9eac-bd93ff7e4efc	3261	Lesično
00050000-5575-94d6-44d3-0d36ced6b763	8273	Leskovec pri Krškem
00050000-5575-94d6-3903-4b989c737b8d	2372	Libeliče
00050000-5575-94d6-dd09-6ef526228a21	2341	Limbuš
00050000-5575-94d6-71fb-bbb3a7382d65	1270	Litija
00050000-5575-94d6-368a-71b50c318372	3202	Ljubečna
00050000-5575-94d6-eb6e-ce15b0eea31d	1000	Ljubljana 
00050000-5575-94d6-4393-9658f25a00c8	1001	Ljubljana - poštni predali
00050000-5575-94d6-53a5-ac054dd8259d	1231	Ljubljana - Črnuče
00050000-5575-94d6-bf42-eb35d83e807a	1261	Ljubljana - Dobrunje
00050000-5575-94d6-f528-668101f02293	1260	Ljubljana - Polje
00050000-5575-94d6-572e-043544efb164	1210	Ljubljana - Šentvid
00050000-5575-94d6-5545-204d228b81a7	1211	Ljubljana - Šmartno
00050000-5575-94d6-9b0a-6d1414f5213f	3333	Ljubno ob Savinji
00050000-5575-94d6-84ba-d32ce140c728	9240	Ljutomer
00050000-5575-94d6-3f46-ba5835ccd9ea	3215	Loče
00050000-5575-94d6-5553-2a0b82bda9e5	5231	Log pod Mangartom
00050000-5575-94d6-7a96-4dd0134d0f2a	1358	Log pri Brezovici
00050000-5575-94d6-7226-fd09ff334e22	1370	Logatec
00050000-5575-94d6-5bfc-d75458eb77c3	1371	Logatec
00050000-5575-94d6-4b34-9f7bb1d020ee	1434	Loka pri Zidanem Mostu
00050000-5575-94d6-0325-a7e1a003b2de	3223	Loka pri Žusmu
00050000-5575-94d6-11f0-b84e1e12d0b0	6219	Lokev
00050000-5575-94d6-a0d8-c79d53ecc4ae	1318	Loški Potok
00050000-5575-94d6-f84d-089adf2a30d2	2324	Lovrenc na Dravskem polju
00050000-5575-94d6-b11e-ad0aec515d8d	2344	Lovrenc na Pohorju
00050000-5575-94d6-b379-eb8814b6b28f	3334	Luče
00050000-5575-94d6-f54d-3baedcc28003	1225	Lukovica
00050000-5575-94d6-2c80-1a1c012c5ae9	9202	Mačkovci
00050000-5575-94d6-6eed-5611515a3521	2322	Majšperk
00050000-5575-94d6-18fe-fb2e6c8906b4	2321	Makole
00050000-5575-94d6-5478-34c4554d6ed0	9243	Mala Nedelja
00050000-5575-94d6-480f-c9b0891d87d1	2229	Malečnik
00050000-5575-94d6-9d1e-79d3ee902ddf	6273	Marezige
00050000-5575-94d6-4ae9-d12980ba89a8	2000	Maribor 
00050000-5575-94d6-322a-9764950870fc	2001	Maribor - poštni predali
00050000-5575-94d6-04c8-c6e15a014fd7	2206	Marjeta na Dravskem polju
00050000-5575-94d6-dcb3-1f5338ee16da	2281	Markovci
00050000-5575-94d6-6ee3-0fc4b5aa0ffa	9221	Martjanci
00050000-5575-94d6-a364-a8aa5e598381	6242	Materija
00050000-5575-94d6-e375-9e0a7414bfc0	4211	Mavčiče
00050000-5575-94d6-4d40-9a510340e753	1215	Medvode
00050000-5575-94d6-1556-fdf915ec665c	1234	Mengeš
00050000-5575-94d6-cbbe-57db9f0a1b11	8330	Metlika
00050000-5575-94d6-252f-fb71d3d60382	2392	Mežica
00050000-5575-94d6-82dc-21f036fb9b57	2204	Miklavž na Dravskem polju
00050000-5575-94d6-4275-f39401b09145	2275	Miklavž pri Ormožu
00050000-5575-94d6-5692-efaad70723b4	5291	Miren
00050000-5575-94d6-8745-5e8a7403463a	8233	Mirna
00050000-5575-94d6-c78c-558db2f23133	8216	Mirna Peč
00050000-5575-94d6-18bc-b54d64fba012	2382	Mislinja
00050000-5575-94d6-2f47-59d64bde8907	4281	Mojstrana
00050000-5575-94d6-5903-74fc3f8e95b7	8230	Mokronog
00050000-5575-94d6-7620-db04530e0da7	1251	Moravče
00050000-5575-94d6-a132-d689ca02839c	9226	Moravske Toplice
00050000-5575-94d6-37d3-9f2afd317e78	5216	Most na Soči
00050000-5575-94d6-ca64-8a80df128ea8	1221	Motnik
00050000-5575-94d6-c687-9c61fbc5698a	3330	Mozirje
00050000-5575-94d6-099c-5f2d5e0bd3a3	9000	Murska Sobota 
00050000-5575-94d6-79e5-65c3c57dcfef	9001	Murska Sobota - poštni predali
00050000-5575-94d6-c379-62779f60229c	2366	Muta
00050000-5575-94d6-1c57-6a40b43e2e76	4202	Naklo
00050000-5575-94d6-c973-a10683af3e55	3331	Nazarje
00050000-5575-94d6-e1cd-a52a4c05cd93	1357	Notranje Gorice
00050000-5575-94d6-3d9a-b24ae07a4e1b	3203	Nova Cerkev
00050000-5575-94d6-f632-76ad8c8fb6ac	5000	Nova Gorica 
00050000-5575-94d6-ded9-9f3b5ee0242d	5001	Nova Gorica - poštni predali
00050000-5575-94d6-962c-b6be77361e2e	1385	Nova vas
00050000-5575-94d6-0c0b-a9dc95ea7cda	8000	Novo mesto
00050000-5575-94d6-f428-326108842391	8001	Novo mesto - poštni predali
00050000-5575-94d6-27f0-ff77732be79c	6243	Obrov
00050000-5575-94d6-2e46-7ab37826c9e9	9233	Odranci
00050000-5575-94d6-f864-cf55a495daa4	2317	Oplotnica
00050000-5575-94d6-7064-b3c4e42085d2	2312	Orehova vas
00050000-5575-94d6-af54-d4b3c0ca8930	2270	Ormož
00050000-5575-94d6-fd60-9d3c1942b32c	1316	Ortnek
00050000-5575-94d6-fa5f-e2a48101ed20	1337	Osilnica
00050000-5575-94d6-3059-243afc55df8d	8222	Otočec
00050000-5575-94d6-146f-2bb5e6e28d73	2361	Ožbalt
00050000-5575-94d6-b620-c74d56a1eb16	2231	Pernica
00050000-5575-94d6-0a6f-479ac6d8a5f7	2211	Pesnica pri Mariboru
00050000-5575-94d6-71dd-5653955ea38d	9203	Petrovci
00050000-5575-94d6-5211-d2013008e57e	3301	Petrovče
00050000-5575-94d6-959c-5fdfedb5a514	6330	Piran/Pirano
00050000-5575-94d6-d601-3c4a6f604f91	8255	Pišece
00050000-5575-94d6-3878-3c85100f2e0f	6257	Pivka
00050000-5575-94d6-8904-b82f0737ee01	6232	Planina
00050000-5575-94d6-3c3b-8ce2120c2a35	3225	Planina pri Sevnici
00050000-5575-94d6-d749-6c7dcf05f411	6276	Pobegi
00050000-5575-94d6-09b3-51374859095f	8312	Podbočje
00050000-5575-94d6-1b6b-9d54d99cb33d	5243	Podbrdo
00050000-5575-94d6-050a-6989522af230	3254	Podčetrtek
00050000-5575-94d6-de60-8a18ea8a1afb	2273	Podgorci
00050000-5575-94d6-92b7-7ddb66c9fff7	6216	Podgorje
00050000-5575-94d6-a5da-30b1ab9a3185	2381	Podgorje pri Slovenj Gradcu
00050000-5575-94d6-efcc-b4849276ff26	6244	Podgrad
00050000-5575-94d6-d873-e51fcf81a027	1414	Podkum
00050000-5575-94d6-20a6-1e39ac704f12	2286	Podlehnik
00050000-5575-94d6-af83-f3b8d980e092	5272	Podnanos
00050000-5575-94d6-c54d-b580c5c3dcd8	4244	Podnart
00050000-5575-94d6-89a6-ba18f6ca6e39	3241	Podplat
00050000-5575-94d6-fd3b-953dfcaea5f8	3257	Podsreda
00050000-5575-94d6-d1e8-7583d804d83c	2363	Podvelka
00050000-5575-94d6-e077-012ab26831d6	2208	Pohorje
00050000-5575-94d6-3800-c3d7ca584772	2257	Polenšak
00050000-5575-94d6-8515-211e486cd591	1355	Polhov Gradec
00050000-5575-94d6-2a22-cf2ebe26cb7a	4223	Poljane nad Škofjo Loko
00050000-5575-94d6-5f0e-b8a6137a083f	2319	Poljčane
00050000-5575-94d6-9763-781b3b4920ae	1272	Polšnik
00050000-5575-94d6-4203-f8f202c50beb	3313	Polzela
00050000-5575-94d6-2cea-d3ec08aefd5f	3232	Ponikva
00050000-5575-94d6-28af-e159e3bc0822	6320	Portorož/Portorose
00050000-5575-94d6-f2d9-6fb939881993	6230	Postojna
00050000-5575-94d6-58aa-60412b89c67f	2331	Pragersko
00050000-5575-94d6-94a2-ef21def6a563	3312	Prebold
00050000-5575-94d6-a8fb-33f9c3305ca9	4205	Preddvor
00050000-5575-94d6-448a-d696e560a90f	6255	Prem
00050000-5575-94d6-44b4-c95a90b5fab2	1352	Preserje
00050000-5575-94d6-58d8-c075dd5fb390	6258	Prestranek
00050000-5575-94d6-042e-4049f5fa37be	2391	Prevalje
00050000-5575-94d6-42ab-55adbf6bd1ec	3262	Prevorje
00050000-5575-94d6-e3ee-031ee1c97ee0	1276	Primskovo 
00050000-5575-94d6-f6d8-e2b0191ce406	3253	Pristava pri Mestinju
00050000-5575-94d6-a1cb-92b0e0ef4a89	9207	Prosenjakovci/Partosfalva
00050000-5575-94d6-4815-e4e80293c70d	5297	Prvačina
00050000-5575-94d6-21a1-c2a8e0519c5f	2250	Ptuj
00050000-5575-94d6-7f9b-292a99284a81	2323	Ptujska Gora
00050000-5575-94d6-541b-55c8ab790fbf	9201	Puconci
00050000-5575-94d6-35a6-77b289150c8c	2327	Rače
00050000-5575-94d6-68a6-d96390222171	1433	Radeče
00050000-5575-94d6-1622-af1c3effd355	9252	Radenci
00050000-5575-94d6-26ab-733ee643e915	2360	Radlje ob Dravi
00050000-5575-94d6-fa1b-b0e3fc4584c8	1235	Radomlje
00050000-5575-94d6-9d3e-a4ffd040e400	4240	Radovljica
00050000-5575-94d6-2ea7-ab388cc84531	8274	Raka
00050000-5575-94d6-a45f-ecd6112078be	1381	Rakek
00050000-5575-94d6-1839-13e5f57b99b9	4283	Rateče - Planica
00050000-5575-94d6-0140-df65d2c5c453	2390	Ravne na Koroškem
00050000-5575-94d6-cfab-a437f0c445ed	9246	Razkrižje
00050000-5575-94d6-5979-a252d81a9ea5	3332	Rečica ob Savinji
00050000-5575-94d6-a2ed-2156e9a0d58c	5292	Renče
00050000-5575-94d6-a972-42234a834fb8	1310	Ribnica
00050000-5575-94d6-04e1-5dbc5812f551	2364	Ribnica na Pohorju
00050000-5575-94d6-ee0c-170e52822977	3272	Rimske Toplice
00050000-5575-94d6-6615-3b2ef4ae47d8	1314	Rob
00050000-5575-94d6-12c1-ed0b26b1119a	5215	Ročinj
00050000-5575-94d6-c0b3-86fa20c64ec5	3250	Rogaška Slatina
00050000-5575-94d6-e40b-52d0eb81b146	9262	Rogašovci
00050000-5575-94d6-2976-43a053ba0d68	3252	Rogatec
00050000-5575-94d6-a93e-62fc8227d3de	1373	Rovte
00050000-5575-94d6-9708-30063f02aaff	2342	Ruše
00050000-5575-94d6-125d-f9a3afd1f94c	1282	Sava
00050000-5575-94d6-715b-1ede9b3b9c4f	6333	Sečovlje/Sicciole
00050000-5575-94d6-62e7-c6f22b3447eb	4227	Selca
00050000-5575-94d6-9d7a-ee19a822da17	2352	Selnica ob Dravi
00050000-5575-94d6-2d77-712b13b01959	8333	Semič
00050000-5575-94d6-8abc-f593b44c5d9f	8281	Senovo
00050000-5575-94d6-7ab4-90b5835bcda4	6224	Senožeče
00050000-5575-94d6-a354-3de541a514d8	8290	Sevnica
00050000-5575-94d6-9119-3b5640c14431	6210	Sežana
00050000-5575-94d6-74db-41e194af8498	2214	Sladki Vrh
00050000-5575-94d6-12a8-fa344fa27dcc	5283	Slap ob Idrijci
00050000-5575-94d6-0a64-f01cbd99f6e1	2380	Slovenj Gradec
00050000-5575-94d6-010c-876f3c8648d4	2310	Slovenska Bistrica
00050000-5575-94d6-f0e5-8ea074184a3b	3210	Slovenske Konjice
00050000-5575-94d6-4b00-20c22ac1735a	1216	Smlednik
00050000-5575-94d6-c467-463125c5e9bb	5232	Soča
00050000-5575-94d6-536f-0363b4959d4a	1317	Sodražica
00050000-5575-94d6-38d5-44542eb5d2d1	3335	Solčava
00050000-5575-94d6-369d-6373be358694	5250	Solkan
00050000-5575-94d6-1a47-6abf04e3faf1	4229	Sorica
00050000-5575-94d6-2755-1ca45ee8f669	4225	Sovodenj
00050000-5575-94d6-6dab-d9d3640d89d3	5281	Spodnja Idrija
00050000-5575-94d6-34a6-faca2b17f6ad	2241	Spodnji Duplek
00050000-5575-94d6-c47d-c064e79d1f85	9245	Spodnji Ivanjci
00050000-5575-94d6-022f-b85febf9d34a	2277	Središče ob Dravi
00050000-5575-94d6-215b-22115cd7ce54	4267	Srednja vas v Bohinju
00050000-5575-94d6-7fe7-14b6e2c7125d	8256	Sromlje 
00050000-5575-94d6-2f79-bd7f669b2082	5224	Srpenica
00050000-5575-94d6-6e96-4f41c1d6fdd7	1242	Stahovica
00050000-5575-94d6-33c3-e8b4b8c83959	1332	Stara Cerkev
00050000-5575-94d6-0b32-8c875fdb35df	8342	Stari trg ob Kolpi
00050000-5575-94d6-b14a-c464571178ae	1386	Stari trg pri Ložu
00050000-5575-94d6-6431-050da69e71ee	2205	Starše
00050000-5575-94d6-e757-303330ddd0c9	2289	Stoperce
00050000-5575-94d6-317e-961596e80870	8322	Stopiče
00050000-5575-94d6-a559-35e2dc3a802f	3206	Stranice
00050000-5575-94d6-91ee-42f96093f216	8351	Straža
00050000-5575-94d6-ff81-5d14f192aff8	1313	Struge
00050000-5575-94d6-d6d6-2e9b615b9004	8293	Studenec
00050000-5575-94d6-4968-7050d8bac7ad	8331	Suhor
00050000-5575-94d6-c626-f31e2f6955a2	2233	Sv. Ana v Slovenskih goricah
00050000-5575-94d6-b96e-0ce4578655a3	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-94d6-5aae-583043dd6093	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-94d6-4362-83a25aa875bd	9244	Sveti Jurij ob Ščavnici
00050000-5575-94d6-78c7-b22d9e82b4c9	3264	Sveti Štefan
00050000-5575-94d6-96ab-78e589fa38b7	2258	Sveti Tomaž
00050000-5575-94d6-53de-d44d05daeea7	9204	Šalovci
00050000-5575-94d6-4498-9b8a5e355c90	5261	Šempas
00050000-5575-94d6-4ff8-2485ccc64275	5290	Šempeter pri Gorici
00050000-5575-94d6-71bf-f46caf86ec6f	3311	Šempeter v Savinjski dolini
00050000-5575-94d6-7d28-c2b926427e3f	4208	Šenčur
00050000-5575-94d6-b814-1dead46e584b	2212	Šentilj v Slovenskih goricah
00050000-5575-94d6-d7b1-38e2270c1b5a	8297	Šentjanž
00050000-5575-94d6-ac75-7427a57123d6	2373	Šentjanž pri Dravogradu
00050000-5575-94d6-9db4-780b27d680dd	8310	Šentjernej
00050000-5575-94d6-c30d-834d6fdf799f	3230	Šentjur
00050000-5575-94d6-d7d8-cc59ab8e7d3f	3271	Šentrupert
00050000-5575-94d6-fc0d-5ee66deafba4	8232	Šentrupert
00050000-5575-94d6-c1e4-14fed2aada8d	1296	Šentvid pri Stični
00050000-5575-94d6-7ffb-3ba6909c52a4	8275	Škocjan
00050000-5575-94d6-bc72-b306506ee9d4	6281	Škofije
00050000-5575-94d6-b20b-eb6d7f1127d3	4220	Škofja Loka
00050000-5575-94d6-1c11-29edca784646	3211	Škofja vas
00050000-5575-94d6-4922-c95ceb98aa74	1291	Škofljica
00050000-5575-94d6-d935-70171f39ac67	6274	Šmarje
00050000-5575-94d6-88b2-f2cef3df9b76	1293	Šmarje - Sap
00050000-5575-94d6-8765-2ef172c4f545	3240	Šmarje pri Jelšah
00050000-5575-94d6-f585-26ef5e60991c	8220	Šmarješke Toplice
00050000-5575-94d6-b1d1-419679618aa4	2315	Šmartno na Pohorju
00050000-5575-94d6-7eac-bfcba7177f4c	3341	Šmartno ob Dreti
00050000-5575-94d6-0f9f-4fe7c5570ab5	3327	Šmartno ob Paki
00050000-5575-94d6-2466-ac45ed484391	1275	Šmartno pri Litiji
00050000-5575-94d6-89c6-dc9a5ce0d8dc	2383	Šmartno pri Slovenj Gradcu
00050000-5575-94d6-9e17-41d66a36fab6	3201	Šmartno v Rožni dolini
00050000-5575-94d6-9af1-5aebea8becd6	3325	Šoštanj
00050000-5575-94d6-d381-fa5b88ba7c59	6222	Štanjel
00050000-5575-94d6-07df-c2e80abbebcd	3220	Štore
00050000-5575-94d6-b0c2-0ef8e9a69f98	3304	Tabor
00050000-5575-94d6-1b59-34e427cc4eb1	3221	Teharje
00050000-5575-94d6-1beb-86329683f969	9251	Tišina
00050000-5575-94d6-9340-7a1f28880704	5220	Tolmin
00050000-5575-94d6-06b7-de25122a9676	3326	Topolšica
00050000-5575-94d6-6507-21e44c6df3f9	2371	Trbonje
00050000-5575-94d6-9b94-a4cff6f29f68	1420	Trbovlje
00050000-5575-94d6-d173-1e72ef0f8cc8	8231	Trebelno 
00050000-5575-94d6-7a1f-b1b4186fc7ce	8210	Trebnje
00050000-5575-94d6-24b2-d5aa209a4b72	5252	Trnovo pri Gorici
00050000-5575-94d6-7f03-f61663b371bd	2254	Trnovska vas
00050000-5575-94d6-e662-5d0c7b95e414	1222	Trojane
00050000-5575-94d6-0e52-df6f2ecbf653	1236	Trzin
00050000-5575-94d6-25b2-6a4a13398103	4290	Tržič
00050000-5575-94d6-23d3-ec4b2ea133ac	8295	Tržišče
00050000-5575-94d6-5557-cae6abb85607	1311	Turjak
00050000-5575-94d6-dbac-d458c0cb896d	9224	Turnišče
00050000-5575-94d6-2b2f-e087473583d9	8323	Uršna sela
00050000-5575-94d6-f9df-ae24f633b554	1252	Vače
00050000-5575-94d6-fb1c-b0da94ef126b	3320	Velenje 
00050000-5575-94d6-26de-f50ecd0077af	3322	Velenje - poštni predali
00050000-5575-94d6-965c-20f1beb0783f	8212	Velika Loka
00050000-5575-94d6-48c9-12a88dcf895f	2274	Velika Nedelja
00050000-5575-94d6-46fc-6c9c38c9fa42	9225	Velika Polana
00050000-5575-94d6-0c52-e188ceb47fc8	1315	Velike Lašče
00050000-5575-94d6-13a5-f62a5880bda5	8213	Veliki Gaber
00050000-5575-94d6-7d71-f90eb0071721	9241	Veržej
00050000-5575-94d6-772f-3d4a0ad8cff0	1312	Videm - Dobrepolje
00050000-5575-94d6-731b-f6dd2bf648e5	2284	Videm pri Ptuju
00050000-5575-94d6-94e9-bb602ffd94a9	8344	Vinica
00050000-5575-94d6-dddb-2a8995f7ed34	5271	Vipava
00050000-5575-94d6-344b-ef94118ee6c3	4212	Visoko
00050000-5575-94d6-be2c-7e1131c27e5b	1294	Višnja Gora
00050000-5575-94d6-f576-9191c91afcb3	3205	Vitanje
00050000-5575-94d6-beac-205c98a877bb	2255	Vitomarci
00050000-5575-94d6-51e5-7149e93918fb	1217	Vodice
00050000-5575-94d6-75ce-ce0f74c933b7	3212	Vojnik\t
00050000-5575-94d6-7a0c-a2d98bd57dd6	5293	Volčja Draga
00050000-5575-94d6-ae49-6135da7c64d5	2232	Voličina
00050000-5575-94d6-501f-43c1bb111df3	3305	Vransko
00050000-5575-94d6-b0c9-4cb2f205efe3	6217	Vremski Britof
00050000-5575-94d6-3583-72568eabe9b2	1360	Vrhnika
00050000-5575-94d6-d49d-45f5e931120d	2365	Vuhred
00050000-5575-94d6-2b02-9f759efc1134	2367	Vuzenica
00050000-5575-94d6-4fb9-0b4fee55f576	8292	Zabukovje 
00050000-5575-94d6-d2e9-355362bba886	1410	Zagorje ob Savi
00050000-5575-94d6-23ea-bbc7f36166db	1303	Zagradec
00050000-5575-94d6-a8ab-29e34976cb33	2283	Zavrč
00050000-5575-94d6-d945-fea35faed20e	8272	Zdole 
00050000-5575-94d6-78f1-87e1506f8486	4201	Zgornja Besnica
00050000-5575-94d6-91a5-283627d79bbd	2242	Zgornja Korena
00050000-5575-94d6-b4e0-4603ecbae490	2201	Zgornja Kungota
00050000-5575-94d6-bd6b-2ffd18c3106a	2316	Zgornja Ložnica
00050000-5575-94d6-83f8-684cace791e0	2314	Zgornja Polskava
00050000-5575-94d6-4742-2a1888f37fb3	2213	Zgornja Velka
00050000-5575-94d6-05bd-b149641562b0	4247	Zgornje Gorje
00050000-5575-94d6-f972-c97edf58cc8a	4206	Zgornje Jezersko
00050000-5575-94d6-d106-cb6b3069bc0e	2285	Zgornji Leskovec
00050000-5575-94d6-fe0d-30d2714159d9	1432	Zidani Most
00050000-5575-94d6-4d02-532be701c9ce	3214	Zreče
00050000-5575-94d6-223a-c3c6ecf994ed	4209	Žabnica
00050000-5575-94d6-6de4-6a263ea338ea	3310	Žalec
00050000-5575-94d6-3b8c-2457ec78528f	4228	Železniki
00050000-5575-94d6-a70c-d7d4b718509a	2287	Žetale
00050000-5575-94d6-ee04-dc4b0ae036a0	4226	Žiri
00050000-5575-94d6-05bc-adae87c6ea30	4274	Žirovnica
00050000-5575-94d6-05d3-728ddd4afaf2	8360	Žužemberk
\.


--
-- TOC entry 2803 (class 0 OID 6607570)
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
-- TOC entry 2785 (class 0 OID 6607381)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6607459)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6607582)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6607702)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6607757)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-94d7-b6e9-beca148818e7	00080000-5575-94d7-910e-8bb569deed81	0987	A
00190000-5575-94d7-e3d0-9e4bd7746045	00080000-5575-94d7-0d7a-2b50ed8ffd90	0989	A
\.


--
-- TOC entry 2829 (class 0 OID 6607871)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6607899)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6607880)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6607611)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-94d7-d6c8-6002cc8674ef	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-94d7-3056-890a3c2d06ad	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-94d7-6611-06ce7721ee27	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-94d7-0f53-41d34a6ef383	0004	Mali oder	t	24	Mali oder 
00220000-5575-94d7-20dd-9075c325ca8d	0005	Komorni oder	t	15	Komorni oder
00220000-5575-94d7-b7db-22e1168287e8	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-94d7-022f-0f6d07670fc0	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2801 (class 0 OID 6607555)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6607545)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6607746)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6607679)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6607253)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-94d7-84b3-9154d4c67052	00010000-5575-94d7-814e-9a1882ef116a	2015-06-08 15:12:56	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROOuuwAX7LKJRMOU2fsl3jfJdWvv3J9vW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2810 (class 0 OID 6607621)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6607291)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-94d7-c4a0-4f1e37e8f496	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-94d7-6610-72e6804cb6a8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-94d7-3eac-b6309888cc80	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-94d7-e17e-72c97ef543cd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-94d7-4b14-54a1b487d41b	planer	Planer dogodkov v koledarju	t
00020000-5575-94d7-2e8f-8f4f542428ab	kadrovska	Kadrovska služba	t
00020000-5575-94d7-9c27-aaee932350bc	arhivar	Ažuriranje arhivalij	t
00020000-5575-94d7-b13d-363c942b5859	igralec	Igralec	t
00020000-5575-94d7-a3f8-5cbd632d9d3a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2776 (class 0 OID 6607275)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-94d7-84b3-9154d4c67052	00020000-5575-94d7-3eac-b6309888cc80
00010000-5575-94d7-814e-9a1882ef116a	00020000-5575-94d7-3eac-b6309888cc80
\.


--
-- TOC entry 2812 (class 0 OID 6607635)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6607576)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6607526)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6607918)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-94d6-85c8-b44765cbc181	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-94d6-33a5-c5882d9cdd67	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-94d6-193c-4d011b39553c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-94d6-8e69-66b65ba0b5ec	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-94d6-fe8d-abf3e07c6c61	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2834 (class 0 OID 6607910)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-94d6-644a-d1142de4ad6a	00230000-5575-94d6-8e69-66b65ba0b5ec	popa
00240000-5575-94d6-4e57-e8ad5cec2353	00230000-5575-94d6-8e69-66b65ba0b5ec	oseba
00240000-5575-94d6-b04a-7b965971591d	00230000-5575-94d6-33a5-c5882d9cdd67	prostor
00240000-5575-94d6-3d54-786aaefd76ad	00230000-5575-94d6-8e69-66b65ba0b5ec	besedilo
00240000-5575-94d6-ac57-c8c242f3e06a	00230000-5575-94d6-8e69-66b65ba0b5ec	uprizoritev
00240000-5575-94d6-f8be-c5e748ad07a9	00230000-5575-94d6-8e69-66b65ba0b5ec	funkcija
00240000-5575-94d6-911f-bd849039d805	00230000-5575-94d6-8e69-66b65ba0b5ec	tipfunkcije
00240000-5575-94d6-9fc6-d602aa667511	00230000-5575-94d6-8e69-66b65ba0b5ec	alternacija
00240000-5575-94d6-4beb-634529b82869	00230000-5575-94d6-85c8-b44765cbc181	pogodba
00240000-5575-94d6-2cf8-d32eacef9eb8	00230000-5575-94d6-8e69-66b65ba0b5ec	zaposlitev
\.


--
-- TOC entry 2833 (class 0 OID 6607905)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6607689)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6607353)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6607532)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-94d8-b42b-26eac52b6113	00180000-5575-94d7-b0f4-cc0d7c1e9038	000c0000-5575-94d8-1593-b1160805bac1	00090000-5575-94d7-b4e5-a3518568d080	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-94d8-39d6-216307ae8b63	00180000-5575-94d7-b0f4-cc0d7c1e9038	000c0000-5575-94d8-ef39-bfb9109bb545	00090000-5575-94d7-b36b-339cc740c027	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-94d8-b4f4-ff055dbaa24f	00180000-5575-94d7-b0f4-cc0d7c1e9038	000c0000-5575-94d8-9e09-1dd2cbc47b8e	00090000-5575-94d7-3809-63e8cf400503	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-94d8-7588-8a0f3cbc86ee	00180000-5575-94d7-b0f4-cc0d7c1e9038	000c0000-5575-94d8-b7e1-fcb21d3c9679	00090000-5575-94d7-e6ec-c58c6550fce7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-94d8-9d8d-bd33fd86290b	00180000-5575-94d7-b0f4-cc0d7c1e9038	000c0000-5575-94d8-e569-71f480aba007	00090000-5575-94d7-dce4-d9fb71979c9e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-94d8-0158-c2ce2bb29caf	00180000-5575-94d7-9e23-a8c706b291d4	\N	00090000-5575-94d7-dce4-d9fb71979c9e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2820 (class 0 OID 6607735)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-94d6-8984-fa07a594c5bc	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-94d6-7134-f5f0161c201e	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-94d6-1867-c87b6ad0d88f	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-94d6-5264-2ce099f466eb	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-94d6-13be-87ea8d241b7b	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-94d6-fe6a-6dbe448360c2	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-94d6-503e-b323e0a94956	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-94d6-a6f0-ca7727f63b3f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-94d6-b5f0-795f6ec06d57	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-94d6-eece-d95661295fda	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-94d6-0589-9102c5f26f98	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-94d6-56eb-ec9e799b1696	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-94d6-d403-1ac00b7b0e2c	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-94d6-e38c-f0bb7a951c66	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-94d6-e86e-27e42a1c66a8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-94d6-aa8a-ec161bd19982	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2831 (class 0 OID 6607888)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6607416)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6607262)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-94d7-814e-9a1882ef116a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROmPUPuC0sKxULzKE/1tI7e0cCvLh4VIu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-94d7-1737-1b99773e58c3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-94d7-3c8a-5ace81440ae5	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-94d7-5069-23726506fe06	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-94d7-25b0-6a36b27be1a7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-94d7-4045-b34515e7df13	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-94d7-c548-1169addf989c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-94d7-84b3-9154d4c67052	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2825 (class 0 OID 6607792)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-94d7-be1c-603f12959abb	00160000-5575-94d7-7bbd-e4ae8ca4bc50	00150000-5575-94d6-e219-b1f73013a15e	00140000-5575-94d6-106d-f43ed1fac5cf	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-94d7-20dd-9075c325ca8d
000e0000-5575-94d7-c03f-cd2cd7aa77ee	00160000-5575-94d7-645e-434f5fe06573	00150000-5575-94d6-6022-4eb19a93c0db	00140000-5575-94d6-4627-aa8cb1b7c7be	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-94d7-b7db-22e1168287e8
\.


--
-- TOC entry 2793 (class 0 OID 6607478)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-94d7-bc5e-c9e463f0ab71	000e0000-5575-94d7-c03f-cd2cd7aa77ee	1	
00200000-5575-94d7-4f89-fcc828411eec	000e0000-5575-94d7-c03f-cd2cd7aa77ee	2	
\.


--
-- TOC entry 2808 (class 0 OID 6607603)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6607672)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6607510)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6607782)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-94d6-106d-f43ed1fac5cf	01	Drama	drama (SURS 01)
00140000-5575-94d6-3ccc-138cdd4ffab5	02	Opera	opera (SURS 02)
00140000-5575-94d6-9f7f-8b5f7c95966f	03	Balet	balet (SURS 03)
00140000-5575-94d6-2bd3-e3a4cc56e7b6	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-94d6-d724-bcde06a2b965	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-94d6-4627-aa8cb1b7c7be	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-94d6-ee95-4fe6f3466715	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2814 (class 0 OID 6607662)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-94d6-4d58-3e952aab4fa4	01	Opera	opera
00150000-5575-94d6-64f8-0fe9c04d9784	02	Opereta	opereta
00150000-5575-94d6-c7c0-9d1e3d53cbac	03	Balet	balet
00150000-5575-94d6-a2aa-97bd7b0b5374	04	Plesne prireditve	plesne prireditve
00150000-5575-94d6-21cc-d51846bb71ce	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-94d6-1a2e-d52ca622aeb9	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-94d6-f2c4-44871153d241	07	Biografska drama	biografska drama
00150000-5575-94d6-e219-b1f73013a15e	08	Komedija	komedija
00150000-5575-94d6-56a2-889af716e790	09	Črna komedija	črna komedija
00150000-5575-94d6-7bb3-ac2d31ce519c	10	E-igra	E-igra
00150000-5575-94d6-6022-4eb19a93c0db	11	Kriminalka	kriminalka
00150000-5575-94d6-4bec-71061c096b44	12	Musical	musical
\.


--
-- TOC entry 2366 (class 2606 OID 6607316)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6607838)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6607828)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6607734)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6607500)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6607525)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 6607442)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 6607867)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 6607658)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6607476)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 6607519)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 6607456)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6607568)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6607595)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 6607414)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6607325)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2373 (class 2606 OID 6607349)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 6607305)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2357 (class 2606 OID 6607290)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6607601)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6607634)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6607777)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 6607378)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 6607402)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6607574)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6607392)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6607463)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6607586)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6607714)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6607762)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6607878)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6607903)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6607885)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 6607618)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6607559)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6607550)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6607756)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6607686)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6607261)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6607625)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6607279)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2359 (class 2606 OID 6607299)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6607643)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 6607581)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 6607531)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6607927)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 6607915)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 6607909)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6607699)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 6607358)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 6607541)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6607745)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6607898)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6607427)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 6607274)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6607808)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6607485)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6607609)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6607677)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6607514)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6607790)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6607670)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 1259 OID 6607507)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2506 (class 1259 OID 6607700)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2507 (class 1259 OID 6607701)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2380 (class 1259 OID 6607380)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2340 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2341 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2471 (class 1259 OID 6607602)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2465 (class 1259 OID 6607588)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2466 (class 1259 OID 6607587)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2417 (class 1259 OID 6607486)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2493 (class 1259 OID 6607659)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2494 (class 1259 OID 6607661)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2495 (class 1259 OID 6607660)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2405 (class 1259 OID 6607458)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2406 (class 1259 OID 6607457)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2524 (class 1259 OID 6607779)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 6607780)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 6607781)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2533 (class 1259 OID 6607813)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2534 (class 1259 OID 6607810)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2535 (class 1259 OID 6607812)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2536 (class 1259 OID 6607811)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2395 (class 1259 OID 6607429)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2396 (class 1259 OID 6607428)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2344 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2371 (class 1259 OID 6607352)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2481 (class 1259 OID 6607626)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2435 (class 1259 OID 6607520)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2361 (class 1259 OID 6607306)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2362 (class 1259 OID 6607307)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2486 (class 1259 OID 6607646)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2487 (class 1259 OID 6607645)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2488 (class 1259 OID 6607644)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2409 (class 1259 OID 6607464)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2410 (class 1259 OID 6607466)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2411 (class 1259 OID 6607465)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2571 (class 1259 OID 6607917)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2445 (class 1259 OID 6607554)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2446 (class 1259 OID 6607552)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2447 (class 1259 OID 6607551)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2448 (class 1259 OID 6607553)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2352 (class 1259 OID 6607280)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2353 (class 1259 OID 6607281)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2474 (class 1259 OID 6607610)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2460 (class 1259 OID 6607575)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2502 (class 1259 OID 6607687)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2503 (class 1259 OID 6607688)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2554 (class 1259 OID 6607868)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2555 (class 1259 OID 6607869)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2556 (class 1259 OID 6607870)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2384 (class 1259 OID 6607394)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2385 (class 1259 OID 6607393)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2386 (class 1259 OID 6607395)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2566 (class 1259 OID 6607904)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2510 (class 1259 OID 6607715)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6607716)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2546 (class 1259 OID 6607842)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2547 (class 1259 OID 6607844)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2548 (class 1259 OID 6607840)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2549 (class 1259 OID 6607843)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2550 (class 1259 OID 6607841)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2499 (class 1259 OID 6607678)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2451 (class 1259 OID 6607563)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2452 (class 1259 OID 6607562)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2453 (class 1259 OID 6607560)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2454 (class 1259 OID 6607561)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2335 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2542 (class 1259 OID 6607830)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2543 (class 1259 OID 6607829)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2557 (class 1259 OID 6607879)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2416 (class 1259 OID 6607477)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2367 (class 1259 OID 6607327)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2368 (class 1259 OID 6607326)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2376 (class 1259 OID 6607359)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2377 (class 1259 OID 6607360)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 6607544)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2441 (class 1259 OID 6607543)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6607542)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2560 (class 1259 OID 6607887)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2561 (class 1259 OID 6607886)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2423 (class 1259 OID 6607509)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2424 (class 1259 OID 6607505)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2425 (class 1259 OID 6607502)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2426 (class 1259 OID 6607503)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2427 (class 1259 OID 6607501)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2428 (class 1259 OID 6607506)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2429 (class 1259 OID 6607504)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2383 (class 1259 OID 6607379)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 6607443)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2402 (class 1259 OID 6607445)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2403 (class 1259 OID 6607444)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2404 (class 1259 OID 6607446)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2459 (class 1259 OID 6607569)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 6607778)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2537 (class 1259 OID 6607809)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2374 (class 1259 OID 6607350)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 6607351)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2496 (class 1259 OID 6607671)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 6607928)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2394 (class 1259 OID 6607415)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2574 (class 1259 OID 6607916)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2479 (class 1259 OID 6607620)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2480 (class 1259 OID 6607619)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 6607839)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2338 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2391 (class 1259 OID 6607403)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 6607791)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 6607763)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 6607764)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2360 (class 1259 OID 6607300)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2430 (class 1259 OID 6607508)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2603 (class 2606 OID 6608064)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2606 (class 2606 OID 6608049)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2605 (class 2606 OID 6608054)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2601 (class 2606 OID 6608074)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2607 (class 2606 OID 6608044)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2602 (class 2606 OID 6608069)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2604 (class 2606 OID 6608059)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2637 (class 2606 OID 6608219)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6608224)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6607979)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2624 (class 2606 OID 6608159)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2622 (class 2606 OID 6608154)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2623 (class 2606 OID 6608149)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2600 (class 2606 OID 6608039)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6608189)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6608199)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2631 (class 2606 OID 6608194)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2594 (class 2606 OID 6608014)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6608009)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2620 (class 2606 OID 6608139)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 6608244)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 6608249)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6608254)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2644 (class 2606 OID 6608274)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2647 (class 2606 OID 6608259)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2645 (class 2606 OID 6608269)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2646 (class 2606 OID 6608264)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2592 (class 2606 OID 6608004)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6607999)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6607964)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2585 (class 2606 OID 6607959)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 6608169)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2608 (class 2606 OID 6608079)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2581 (class 2606 OID 6607939)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2580 (class 2606 OID 6607944)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2627 (class 2606 OID 6608184)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2628 (class 2606 OID 6608179)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2629 (class 2606 OID 6608174)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2598 (class 2606 OID 6608019)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2596 (class 2606 OID 6608029)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2597 (class 2606 OID 6608024)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2662 (class 2606 OID 6608349)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2612 (class 2606 OID 6608114)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2614 (class 2606 OID 6608104)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2615 (class 2606 OID 6608099)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2613 (class 2606 OID 6608109)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2579 (class 2606 OID 6607929)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2578 (class 2606 OID 6607934)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2625 (class 2606 OID 6608164)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2621 (class 2606 OID 6608144)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2635 (class 2606 OID 6608209)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2634 (class 2606 OID 6608214)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6608314)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2656 (class 2606 OID 6608319)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2655 (class 2606 OID 6608324)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2590 (class 2606 OID 6607989)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6607984)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6607994)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6608344)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2639 (class 2606 OID 6608229)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6608234)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2652 (class 2606 OID 6608299)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2650 (class 2606 OID 6608309)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2654 (class 2606 OID 6608289)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2651 (class 2606 OID 6608304)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2653 (class 2606 OID 6608294)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2633 (class 2606 OID 6608204)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6608134)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2617 (class 2606 OID 6608129)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2619 (class 2606 OID 6608119)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2618 (class 2606 OID 6608124)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2648 (class 2606 OID 6608284)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2649 (class 2606 OID 6608279)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 6608329)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2599 (class 2606 OID 6608034)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2640 (class 2606 OID 6608239)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6607954)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2583 (class 2606 OID 6607949)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2587 (class 2606 OID 6607969)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2586 (class 2606 OID 6607974)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6608094)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2610 (class 2606 OID 6608089)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2611 (class 2606 OID 6608084)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2659 (class 2606 OID 6608339)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 6608334)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 15:12:56 CEST

--
-- PostgreSQL database dump complete
--

