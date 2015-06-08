--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 16:56:53 CEST

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
-- TOC entry 180 (class 1259 OID 6660050)
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
-- TOC entry 227 (class 1259 OID 6660571)
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
-- TOC entry 226 (class 1259 OID 6660554)
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
-- TOC entry 219 (class 1259 OID 6660459)
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
-- TOC entry 194 (class 1259 OID 6660229)
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
-- TOC entry 197 (class 1259 OID 6660263)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6660172)
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
-- TOC entry 228 (class 1259 OID 6660585)
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
-- TOC entry 213 (class 1259 OID 6660389)
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
-- TOC entry 192 (class 1259 OID 6660209)
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
-- TOC entry 196 (class 1259 OID 6660257)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6660189)
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
-- TOC entry 202 (class 1259 OID 6660306)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6660331)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6660146)
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
-- TOC entry 181 (class 1259 OID 6660059)
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
-- TOC entry 182 (class 1259 OID 6660070)
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
-- TOC entry 177 (class 1259 OID 6660024)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6660043)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6660338)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6660369)
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
-- TOC entry 223 (class 1259 OID 6660505)
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
-- TOC entry 184 (class 1259 OID 6660103)
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
-- TOC entry 186 (class 1259 OID 6660138)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6660312)
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
-- TOC entry 185 (class 1259 OID 6660123)
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
-- TOC entry 191 (class 1259 OID 6660201)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6660324)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6660444)
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
-- TOC entry 222 (class 1259 OID 6660497)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6660611)
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
-- TOC entry 232 (class 1259 OID 6660639)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6660620)
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
-- TOC entry 209 (class 1259 OID 6660353)
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
-- TOC entry 201 (class 1259 OID 6660297)
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
-- TOC entry 200 (class 1259 OID 6660287)
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
-- TOC entry 221 (class 1259 OID 6660486)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6660421)
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
-- TOC entry 174 (class 1259 OID 6659995)
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
-- TOC entry 173 (class 1259 OID 6659993)
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
-- TOC entry 210 (class 1259 OID 6660363)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6660033)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6660017)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6660377)
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
-- TOC entry 204 (class 1259 OID 6660318)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6660268)
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
-- TOC entry 235 (class 1259 OID 6660658)
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
-- TOC entry 234 (class 1259 OID 6660650)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6660645)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6660431)
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
-- TOC entry 183 (class 1259 OID 6660095)
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
-- TOC entry 199 (class 1259 OID 6660274)
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
-- TOC entry 220 (class 1259 OID 6660475)
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
-- TOC entry 231 (class 1259 OID 6660628)
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
-- TOC entry 188 (class 1259 OID 6660158)
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
-- TOC entry 175 (class 1259 OID 6660004)
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
-- TOC entry 225 (class 1259 OID 6660532)
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
-- TOC entry 193 (class 1259 OID 6660220)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6660345)
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
-- TOC entry 215 (class 1259 OID 6660414)
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
-- TOC entry 195 (class 1259 OID 6660252)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6660522)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6660404)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2168 (class 2604 OID 6659998)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2778 (class 0 OID 6660050)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6660571)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-ad34-3fae-73df3abfc78b	000d0000-5575-ad34-060d-267821453338	\N	00090000-5575-ad34-71d2-29dd2893e1cf	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-ad34-ee15-18cacc6322af	000d0000-5575-ad34-bc9c-1bbba5099eeb	\N	00090000-5575-ad34-85e3-b04bfe253e19	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-ad34-2075-befb6224d693	000d0000-5575-ad34-eed8-012b4e5ecbc7	\N	00090000-5575-ad34-4b58-5b0a955880a9	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-ad34-3129-d160c220f03f	000d0000-5575-ad34-8f30-b7d10e2441ec	\N	00090000-5575-ad34-18b4-b6bded4dbd6c	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-ad34-2d7e-639716647536	000d0000-5575-ad34-42bc-b8259f3ebe04	\N	00090000-5575-ad34-f2bc-d836750124cb	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-ad34-eef8-02ea892566ca	000d0000-5575-ad34-f8f3-eee5555b80ef	\N	00090000-5575-ad34-85e3-b04bfe253e19	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 6660554)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6660459)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-ad34-0aeb-12fe4704a507	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-ad34-e0e5-4b920e006dfe	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-ad34-aab5-afba08ac6307	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2792 (class 0 OID 6660229)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-ad34-3f53-43205d5981b4	\N	\N	00200000-5575-ad34-1b67-6beba3de8261	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-ad34-6a0d-cf9fad125ca7	\N	\N	00200000-5575-ad34-30d1-4500eb0d6f71	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-ad34-c23e-9a381f15d7fc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-ad34-b789-b07f834755fa	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-ad34-c3ea-e074aff8565b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2795 (class 0 OID 6660263)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6660172)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-ad33-7bb2-ba729cb5a143	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-ad33-84d2-2eea65a54687	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-ad33-726c-0b66849f8c3e	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-ad33-e7d2-24290a8ad38e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-ad33-f997-d284625f0fd6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-ad33-07af-ab45496a650f	AD	AND	020	Andorra 	Andora	\N
00040000-5575-ad33-80dd-543b26451ad9	AO	AGO	024	Angola 	Angola	\N
00040000-5575-ad33-eb6a-0704b366c5bf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-ad33-9d97-c759057e784d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-ad33-3b84-3b8ff4350eec	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-ad33-28ac-77042ecc2454	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-ad33-feba-31be5c842f9d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-ad33-1ccf-371cb6c64e4b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-ad33-b102-bfa8251ad41b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-ad33-9f17-7989c0502b0d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-ad33-5706-c2929cd1c047	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-ad33-7936-f5cfda30264c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-ad33-9f83-16da395c7926	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-ad33-1479-bfffe67ababf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-ad33-de01-d84c8692dc3a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-ad33-5307-377719b950c7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-ad33-a22e-42b8b5e523da	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-ad33-4ada-9c63195db304	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-ad33-1ede-31c92580eda2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-ad33-7e92-d58b90400336	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-ad33-f132-ad9a2a99ac57	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-ad33-4a67-80402d128d1e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-ad33-6345-9b99ff98f2d8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-ad33-069c-be77c39826c7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-ad33-c586-d0a8ec7911e4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-ad33-f259-0ef405961b1c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-ad33-efd6-5c5c6a573012	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-ad33-afdc-4f25003347df	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-ad33-c0ba-9cb6146c7ea9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-ad33-e940-4624774cb511	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-ad33-1274-baef08f0004f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-ad33-1241-99ff39630d1b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-ad33-9a2c-811bfc065031	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-ad33-7ac7-2dc1aedf027c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-ad33-5f03-913da5dff33e	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-ad33-2fc2-52706f380f80	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-ad33-98b6-f07b7a0a3895	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-ad33-6292-dfd216757dee	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-ad33-4025-6b329f5a9195	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-ad33-5f63-a1c9a01812d8	CL	CHL	152	Chile 	Čile	\N
00040000-5575-ad33-764e-3da1bab34c56	CN	CHN	156	China 	Kitajska	\N
00040000-5575-ad33-ca91-77f62ad65c0e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-ad33-ac2e-f431c48eb3eb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-ad33-7973-342e0f735658	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-ad33-e755-1f5aff3fe3ee	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-ad33-199c-1979e8bfec46	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-ad33-44c6-0c92ba932d40	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-ad33-4245-bd8295c57704	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-ad33-69af-03e9d10232db	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-ad33-91f7-2b023444e5a9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-ad33-7da6-cdf24c38392c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-ad33-eecf-85d9b37f26f5	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-ad33-279a-7c9d3653e8c2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-ad33-955f-00b7cb3c2bb8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-ad33-dcda-b5195ef36c62	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-ad33-6a5a-10d6782c3174	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-ad33-cab2-4d20e36952f1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-ad33-27ad-0e7697e7baab	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-ad33-96c4-02bdbe73a9ad	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-ad33-8952-6fd456833801	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-ad33-0fe9-2cb7be68de4d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-ad33-4c9a-c32a8c8f39a2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-ad33-5778-c70ef95e4e22	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-ad33-b1f4-b89117ac4e6f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-ad33-9a93-449e1475bba8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-ad33-6d6f-136996f00136	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-ad33-665d-26109ba8971a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-ad33-ecce-ee057f391057	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-ad33-d949-24fbaba07d78	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-ad33-7b03-7f3b6d5b5ba9	FI	FIN	246	Finland 	Finska	\N
00040000-5575-ad33-4c1b-245076b7f73d	FR	FRA	250	France 	Francija	\N
00040000-5575-ad33-cf5e-75f4c8c6bdfc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-ad33-8b79-e68643f45082	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-ad33-d8e0-c250d7ef08d7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-ad33-cfed-7323a1fb1b60	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-ad33-3135-43f7c0c3e546	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-ad33-875a-5c29f6d1ed93	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-ad33-2d2e-1e32071432c2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-ad33-b699-91e53cd2462a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-ad33-5833-11a576bb16ec	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-ad33-05cf-0d3192d05825	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-ad33-62e7-d075d595a858	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-ad33-12fc-8966be01653a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-ad33-b6d2-b018064cc558	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-ad33-2e73-b7c4988218f4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-ad33-f85c-9f707608c3b0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-ad33-fcdb-93a58845fa81	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-ad33-775a-4fd2b68df999	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-ad33-4740-8dff678a0e27	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-ad33-4a4f-ec1506643011	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-ad33-b955-4708d447c544	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-ad33-53b4-dbbfe313f64d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-ad33-ccd9-31f82197e020	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-ad33-21d1-a24d58225107	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-ad33-fb0a-c4c0def7c87a	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-ad33-7ef8-d28a4f875868	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-ad33-c1ab-7a33eeda7d01	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-ad33-3a54-762612c3af25	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-ad33-1d0b-98fc389e27c6	IN	IND	356	India 	Indija	\N
00040000-5575-ad33-d120-33d9c10b01c8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-ad33-dbbd-5aa68d2d6657	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-ad33-7087-35ba51159d2e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-ad33-dca3-d25ac0b075d6	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-ad33-a953-2e07cddfc8ea	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-ad33-2471-c49afeea3911	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-ad33-dd7b-80dda8f284c7	IT	ITA	380	Italy 	Italija	\N
00040000-5575-ad33-5ed3-b4df763e9e9f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-ad33-f6f3-0b8b2163d22c	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-ad33-7bc1-26d303e0c96a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-ad33-5bee-d2ab0646448b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-ad33-6a69-62b89eadd8da	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-ad33-7cc4-55020488d624	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-ad33-7b43-02ff0ac2e435	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-ad33-d3b3-2f1244139ef9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-ad33-89ee-f4935896091a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-ad33-f507-6ff81a382c19	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-ad33-940f-5b81331fda47	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-ad33-6f82-af9c88ac26cf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-ad33-deb6-8a37a2aae0b7	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-ad33-a8b8-cc05acd2459e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-ad33-81d0-fa78fdde0a9e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-ad33-7b90-6a9e082bfb3c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-ad33-fa40-747266a0ea93	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-ad33-3017-a334096330c2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-ad33-eeb0-43fd160c3db5	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-ad33-cefa-e71a36224045	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-ad33-9e9c-9ef47e6aef5c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-ad33-31e7-d252347ce675	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-ad33-6aac-169a35468c11	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-ad33-aedd-91b7d745add5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-ad33-4772-6ed5b445f4b0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-ad33-c638-06e5cfb0bf7c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-ad33-d850-f3ae4860d0e5	ML	MLI	466	Mali 	Mali	\N
00040000-5575-ad33-38c0-a39981c619b9	MT	MLT	470	Malta 	Malta	\N
00040000-5575-ad33-6cca-62f488ea1d61	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-ad33-e619-df310efa9fb6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-ad33-1835-dd1a100f995b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-ad33-4ebe-fa6d70ba0dfc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-ad33-37c7-17539e2e4c00	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-ad33-28bf-aa8c42683743	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-ad33-cbc3-56b86aa0b02f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-ad33-a64f-df82b1d3c7fe	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-ad33-e660-f1051c97a6b4	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-ad33-05bc-6c946455b586	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-ad33-19b5-bdc013debf35	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-ad33-cd97-f6a01e086f3f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-ad33-cc0d-5725e02c2777	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-ad33-814e-ae7576888ed4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-ad33-8301-2204cb4ec450	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-ad33-f932-e954e44c37c8	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-ad33-f563-6a361477ab16	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-ad33-ed44-185546fe9e82	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-ad33-0e5f-a5cab0f0bf09	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-ad33-81c2-041755f8914f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-ad33-6789-0a3e6d0cb4f2	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-ad33-310a-ca9b16135228	NE	NER	562	Niger 	Niger 	\N
00040000-5575-ad33-3a8b-b69b3fb9773b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-ad33-39c5-6e1ee00eb8b8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-ad33-30eb-37398b16db1c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-ad33-3fb8-cd1fe81c22d7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-ad33-b580-fee7c6caace9	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-ad33-92c7-140850050088	OM	OMN	512	Oman 	Oman	\N
00040000-5575-ad33-62ba-5d8bdb03b2c6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-ad33-f4ef-a0619395074c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-ad33-2214-b8793d9fa5d6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-ad33-f658-fc4906a9bbb3	PA	PAN	591	Panama 	Panama	\N
00040000-5575-ad33-8d04-bb616f694d84	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-ad33-79ee-084ab8c8bb10	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-ad33-d023-76203a6befb3	PE	PER	604	Peru 	Peru	\N
00040000-5575-ad33-9c60-a8e73ce0b8b4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-ad33-44f9-9fbdc94d1209	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-ad33-19c7-04b3b33fdf12	PL	POL	616	Poland 	Poljska	\N
00040000-5575-ad33-4e50-1215150085d5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-ad33-4835-e0ee326948ab	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-ad33-9cba-0d363a5e0737	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-ad33-a0e1-5a41c42067b5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-ad33-d820-d839761a1e77	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-ad33-ac49-9a15af48c976	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-ad33-be60-45f8652f5e86	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-ad33-9207-f7fbc57bd53d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-ad33-7628-362acce01411	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-ad33-3556-fafb22028f92	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-ad33-63d4-fda11f64fc44	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-ad33-cced-e58bf61d2f01	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-ad33-e96f-4473be03c16a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-ad33-6f59-705cf19f488c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-ad33-b2bc-9afe47e1d95f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-ad33-312e-572babf42902	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-ad33-1cc9-f6ef72a9a52d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-ad33-16e9-9cc670e9fd20	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-ad33-f940-7e550d9166cb	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-ad33-abf2-c9b8e95e0dfd	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-ad33-e6d1-556ed6e7ade6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-ad33-00f4-a1ce73ba07f4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-ad33-15b5-5f1e6246fa37	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-ad33-c104-ccf327ac8430	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-ad33-dd56-4f44f0b065c0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-ad33-d024-10c8e9611678	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-ad33-5a99-456bdeb713dd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-ad33-b38c-96febdc59fcc	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-ad33-4575-0c4f862e3159	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-ad33-ba24-452d6f11eec4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-ad33-74cb-127795abd2ca	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-ad33-ff48-defbb2d53ea3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-ad33-f8d8-5c527bde7b1a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-ad33-3e1f-8fd94b2eb477	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-ad33-324a-bde8fe374e95	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-ad33-970d-23ec592f8553	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-ad33-c1cb-d3ff9ef220ac	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-ad33-7e2f-ef936976d329	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-ad33-ed28-5ce6a8fa33d8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-ad33-3fed-5715ed693c9b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-ad33-5115-b22da24e3ec2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-ad33-7049-60e4ed9fef7e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-ad33-0d29-8246ab85e3cd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-ad33-85be-e495a9a7a863	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-ad33-0107-2308c29dd80b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-ad33-0df6-88a4b2d03336	TG	TGO	768	Togo 	Togo	\N
00040000-5575-ad33-63a9-e13f3b0bd28a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-ad33-2f6e-76e53d43ee7a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-ad33-0172-189dc8150b1c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-ad33-ff2c-5ab35b7a22ab	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-ad33-454a-93f8cb568b83	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-ad33-a050-40a4f321a41a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-ad33-31bc-9ba1ac13420e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-ad33-e968-d78a87b0c371	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-ad33-ccf2-f877f0454544	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-ad33-8457-46b5f5a6d767	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-ad33-2125-e5aae472eaf6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-ad33-8a32-460eaea0ecc4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-ad33-01b5-315a8cc7f980	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-ad33-f619-7ac5f4826ec3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-ad33-f56b-ac24444d3def	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-ad33-0461-d963b56a7ebf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-ad33-d508-5976484db26f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-ad33-c9de-8f3907c3f10a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-ad33-8761-8062869f743f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-ad33-69a1-498a8a8d2e4f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-ad33-f201-d9239284bee9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-ad33-94d8-63964428baa2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-ad33-353b-f2e4204fd6e1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-ad33-b1e2-ce2610efda14	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-ad33-3eac-349ea28a9ce0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-ad33-1870-dd0989546bd4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2826 (class 0 OID 6660585)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6660389)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-ad34-32a1-e19c480ba8ae	000e0000-5575-ad34-7c61-05079032a335	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-ad33-c76c-c2d09eb7f0ac
000d0000-5575-ad34-060d-267821453338	000e0000-5575-ad34-7c61-05079032a335	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-ad33-c76c-c2d09eb7f0ac
000d0000-5575-ad34-bc9c-1bbba5099eeb	000e0000-5575-ad34-7c61-05079032a335	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-ad33-6b6a-666d4f15f331
000d0000-5575-ad34-eed8-012b4e5ecbc7	000e0000-5575-ad34-7c61-05079032a335	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-ad33-a987-7d68d1d197c0
000d0000-5575-ad34-8f30-b7d10e2441ec	000e0000-5575-ad34-7c61-05079032a335	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-ad33-a987-7d68d1d197c0
000d0000-5575-ad34-42bc-b8259f3ebe04	000e0000-5575-ad34-7c61-05079032a335	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-ad33-a987-7d68d1d197c0
000d0000-5575-ad34-f8f3-eee5555b80ef	000e0000-5575-ad34-7c61-05079032a335	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-ad33-c76c-c2d09eb7f0ac
\.


--
-- TOC entry 2790 (class 0 OID 6660209)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6660257)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6660189)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-ad34-a2c7-3e19fbb5aba5	00080000-5575-ad34-ba51-d8f8e73f2883	00090000-5575-ad34-71d2-29dd2893e1cf	AK		
\.


--
-- TOC entry 2768 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6660306)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6660331)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6660146)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-ad34-3fc7-677e500a0ff0	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-ad34-b27a-874dbf47c4ef	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-ad34-8ec5-7dd36f5b4f75	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-ad34-9c08-11b330e00d0d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-ad34-6b98-a3aa5dd2d735	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-ad34-edc6-fc7e14d3c0b5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-ad34-b8b2-7c77bafcc8d3	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-ad34-bc57-19bef95c6160	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-ad34-e525-d556803920b4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-ad34-78dd-901a46ffbbb3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-ad34-77fb-57eed2e0462f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-ad34-42b2-ef6f6b0d0a0d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-ad34-3838-08b0f9556833	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-ad34-04c0-4ef93cbf4e4d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-ad34-3a78-ced90988e858	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-ad34-8315-8641b0788d34	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2779 (class 0 OID 6660059)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-ad34-7bdc-df35ad36fa12	00000000-5575-ad34-6b98-a3aa5dd2d735	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-ad34-dcbc-161fc605da05	00000000-5575-ad34-6b98-a3aa5dd2d735	00010000-5575-ad33-cc8e-cb536b53bb14	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-ad34-164f-f015773e9e01	00000000-5575-ad34-edc6-fc7e14d3c0b5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2780 (class 0 OID 6660070)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-ad34-50ff-af0fd4f8226d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-ad34-18b4-b6bded4dbd6c	00010000-5575-ad34-1b4f-f8447e446f73	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-ad34-4b58-5b0a955880a9	00010000-5575-ad34-cbf6-e36ea5dd3e3e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-ad34-5a9d-109f84111a11	00010000-5575-ad34-756f-bb92e1a20a4b	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-ad34-818f-15628de54efa	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-ad34-9109-a112da943005	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-ad34-ddd6-1ed1409c1b59	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-ad34-21b9-02e9f0a345fa	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-ad34-71d2-29dd2893e1cf	00010000-5575-ad34-1c2a-f0697e4b01b2	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-ad34-85e3-b04bfe253e19	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-ad34-bf9d-dcdb0be06fc1	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-ad34-f2bc-d836750124cb	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-ad34-b265-fa743e1f2983	00010000-5575-ad34-fb49-250159fb9967	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2770 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6660024)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-ad33-5bcf-99371ac4bf4c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-ad33-8ad1-b42c8bb270cf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-ad33-7a83-1461df27a953	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-ad33-c205-bdc9d67947e4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-ad33-cbcb-5241c8683469	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-ad33-eb40-88d1ae24f81c	Abonma-read	Abonma - branje	f
00030000-5575-ad33-d7e7-94cdb5d0fafc	Abonma-write	Abonma - spreminjanje	f
00030000-5575-ad33-608a-b52833a1e283	Alternacija-read	Alternacija - branje	f
00030000-5575-ad33-60f1-cdf471d8b3a7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-ad33-1469-c8a4d6af7c7f	Arhivalija-read	Arhivalija - branje	f
00030000-5575-ad33-bf09-b378b72f005b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-ad33-0203-07400851c4ef	Besedilo-read	Besedilo - branje	f
00030000-5575-ad33-2bb4-7dfdaeb2308d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-ad33-9614-30c1d2f2066e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-ad33-5d69-5871c74eb158	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-ad33-a62f-c19ee775049e	Dogodek-read	Dogodek - branje	f
00030000-5575-ad33-9d44-6a50cab61e86	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-ad33-d5b7-467f9617fe41	Drzava-read	Drzava - branje	f
00030000-5575-ad33-7f2b-b131b83417d9	Drzava-write	Drzava - spreminjanje	f
00030000-5575-ad33-69de-25decc61ac07	Funkcija-read	Funkcija - branje	f
00030000-5575-ad33-7a80-ab17a33a649f	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-ad33-417d-5412fd382431	Gostovanje-read	Gostovanje - branje	f
00030000-5575-ad33-40ac-aa1107c60ecd	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-ad33-ff0c-3a05d3a2df8d	Gostujoca-read	Gostujoca - branje	f
00030000-5575-ad33-c6fd-72607db4ef94	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-ad33-1594-5865fe18d4fb	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-ad33-4d7c-3d1f63e80426	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-ad33-f288-4fdc58ca5835	Kupec-read	Kupec - branje	f
00030000-5575-ad33-7321-ec2dc67bab29	Kupec-write	Kupec - spreminjanje	f
00030000-5575-ad33-7525-5c7909f12ad3	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-ad33-81ca-1417233e4163	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-ad33-51fa-d3a57d351a98	Option-read	Option - branje	f
00030000-5575-ad33-8842-bd7141453b36	Option-write	Option - spreminjanje	f
00030000-5575-ad33-e04a-578ec7970ced	OptionValue-read	OptionValue - branje	f
00030000-5575-ad33-33bc-6fac4c32d2b0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-ad33-b5a6-853b62754458	Oseba-read	Oseba - branje	f
00030000-5575-ad33-26df-919ba6c3ffea	Oseba-write	Oseba - spreminjanje	f
00030000-5575-ad33-a865-6b9afdcdcd72	Permission-read	Permission - branje	f
00030000-5575-ad33-0e92-b77da0bed1d5	Permission-write	Permission - spreminjanje	f
00030000-5575-ad33-9a37-a43a0165af82	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-ad33-a176-3b10b88dffea	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-ad33-3d14-a0a1c3fa5aa4	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-ad33-8d25-d620412dfb10	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-ad33-7f74-70e2f7b71b7e	Pogodba-read	Pogodba - branje	f
00030000-5575-ad33-8f9d-de381641f282	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-ad33-dd68-b144ee44a82d	Popa-read	Popa - branje	f
00030000-5575-ad33-9aac-d5d8678efb75	Popa-write	Popa - spreminjanje	f
00030000-5575-ad33-d3d1-9ae168578ffe	Posta-read	Posta - branje	f
00030000-5575-ad33-fb31-6d36739a185f	Posta-write	Posta - spreminjanje	f
00030000-5575-ad33-69e7-888a80ff2a32	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-ad33-006e-a5c726219f38	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-ad33-2aa6-3fb090d854f8	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-ad33-1e2d-fdee38b97875	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-ad33-0ea3-e919405ecd6b	Predstava-read	Predstava - branje	f
00030000-5575-ad33-4775-7a1bf66066f6	Predstava-write	Predstava - spreminjanje	f
00030000-5575-ad33-1b9a-e3b52daa4a79	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-ad33-8cba-d3492cd4083c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-ad33-b305-cbd7d0925d57	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-ad33-4c38-53459156416e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-ad33-abad-613fc7c8a750	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-ad33-1797-bba35c2cb7de	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-ad33-b30a-3abe0145dd3a	ProgramDela-read	ProgramDela - branje	f
00030000-5575-ad33-8902-2b2ba6828715	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-ad33-d0d6-9e12a65b6e8f	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-ad33-b3b6-a14ef77b9d9f	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-ad33-6cb0-f15c1d860689	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-ad33-bd20-e006d2ffce91	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-ad33-e46c-eb4d1d9dc677	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-ad33-10e5-fe935d12113d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-ad33-1899-d4ff5c7fd17a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-ad33-2c02-e71c580f70ac	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-ad33-bbdd-b46d8730a503	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-ad33-2176-7a14844c4594	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-ad33-22cc-83afd41c4a64	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-ad33-ffbd-5c47f54ccc24	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-ad33-c082-e03ac37f824f	Prostor-read	Prostor - branje	f
00030000-5575-ad33-ee04-b76cf0cbbaeb	Prostor-write	Prostor - spreminjanje	f
00030000-5575-ad33-547e-12a556235ec6	Racun-read	Racun - branje	f
00030000-5575-ad33-8e54-18d780658457	Racun-write	Racun - spreminjanje	f
00030000-5575-ad33-c741-0a05043473d3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-ad33-190a-3836b5f37769	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-ad33-5e72-a3769a2b09bd	Readme-read	Readme - branje	f
00030000-5575-ad33-17ac-ab2125239279	Readme-write	Readme - spreminjanje	f
00030000-5575-ad33-3c15-a4cbcf793d93	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-ad33-52e3-dde78fcb21d3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-ad33-d2f5-cdba02e05d81	Rekvizit-read	Rekvizit - branje	f
00030000-5575-ad33-764c-2706998e7774	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-ad33-48a8-ec67963c2ff8	Revizija-read	Revizija - branje	f
00030000-5575-ad33-ef7e-74172a818726	Revizija-write	Revizija - spreminjanje	f
00030000-5575-ad33-3b18-81abe2865d57	Rezervacija-read	Rezervacija - branje	f
00030000-5575-ad33-6e6f-331013f39d63	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-ad33-b815-05da31eadd8f	Role-read	Role - branje	f
00030000-5575-ad33-1ee4-421b6d1dd606	Role-write	Role - spreminjanje	f
00030000-5575-ad33-3006-98a0f1e2fda5	SedezniRed-read	SedezniRed - branje	f
00030000-5575-ad33-86d2-a6bc9fd5e384	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-ad33-54dd-5906e8bca8be	Sedez-read	Sedez - branje	f
00030000-5575-ad33-5329-ad4ef340f63d	Sedez-write	Sedez - spreminjanje	f
00030000-5575-ad33-592b-14987a329c6d	Sezona-read	Sezona - branje	f
00030000-5575-ad33-3a22-f32cc1cf55a3	Sezona-write	Sezona - spreminjanje	f
00030000-5575-ad33-ce92-1cab3012cf4d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-ad33-f207-08295f7e2fb4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-ad33-7e8e-ffe04a389c40	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-ad33-afe8-ca9b6f8fdfa3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-ad33-979c-31e6fdb1dc8a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-ad33-9bbc-d7f13775be15	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-ad33-6d75-8075c7898d88	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-ad33-4e45-bd4f1ae142e6	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-ad33-695a-c230d27deb7a	Telefonska-read	Telefonska - branje	f
00030000-5575-ad33-0b2c-b88c9338db50	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-ad33-5c61-f3f9dd933c40	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-ad33-a343-075cab6b3429	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-ad33-b97f-ba780b3fb9a4	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-ad33-e098-f74700a03fe2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-ad33-ab29-63f8843473a5	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-ad33-04a1-07a7e5c14014	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-ad33-ea11-9b46cb506426	Trr-read	Trr - branje	f
00030000-5575-ad33-a457-79e602cc295c	Trr-write	Trr - spreminjanje	f
00030000-5575-ad33-828d-be26ab93148c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-ad33-b532-a3f95998ec92	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-ad33-93e3-e052439d651c	User-read	User - branje	f
00030000-5575-ad33-ca32-c274b08496eb	User-write	User - spreminjanje	f
00030000-5575-ad33-8819-84b21eaeaee2	Vaja-read	Vaja - branje	f
00030000-5575-ad33-f778-63f7711d76f9	Vaja-write	Vaja - spreminjanje	f
00030000-5575-ad33-31f1-50f1ebc16b86	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-ad33-abc3-315dca095ad5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-ad33-3a5a-eee45a50d38b	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-ad33-613d-8e0fdb4fc474	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-ad33-6d25-44b9ef6d17fd	Zasedenost-read	Zasedenost - branje	f
00030000-5575-ad33-f659-41785e584e83	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-ad33-b277-8ab8815982c1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-ad33-a3ff-49ce5ffaa997	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-ad33-db45-8599b67cc757	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-ad33-a102-7876ab2d2fe2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2777 (class 0 OID 6660043)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-ad33-5883-2d26fab12fd6	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-eb40-88d1ae24f81c
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-d7e7-94cdb5d0fafc
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-608a-b52833a1e283
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-60f1-cdf471d8b3a7
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-1469-c8a4d6af7c7f
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-a62f-c19ee775049e
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-c205-bdc9d67947e4
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-9d44-6a50cab61e86
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-7f2b-b131b83417d9
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-69de-25decc61ac07
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-7a80-ab17a33a649f
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-417d-5412fd382431
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-40ac-aa1107c60ecd
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-ff0c-3a05d3a2df8d
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-c6fd-72607db4ef94
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-1594-5865fe18d4fb
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-4d7c-3d1f63e80426
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-51fa-d3a57d351a98
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-e04a-578ec7970ced
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-b5a6-853b62754458
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-26df-919ba6c3ffea
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-dd68-b144ee44a82d
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-9aac-d5d8678efb75
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-d3d1-9ae168578ffe
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-fb31-6d36739a185f
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-2aa6-3fb090d854f8
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-1e2d-fdee38b97875
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-0ea3-e919405ecd6b
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-4775-7a1bf66066f6
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-abad-613fc7c8a750
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-1797-bba35c2cb7de
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-c082-e03ac37f824f
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-ee04-b76cf0cbbaeb
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-3c15-a4cbcf793d93
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-52e3-dde78fcb21d3
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-d2f5-cdba02e05d81
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-764c-2706998e7774
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-592b-14987a329c6d
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-3a22-f32cc1cf55a3
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-b97f-ba780b3fb9a4
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-828d-be26ab93148c
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-b532-a3f95998ec92
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-8819-84b21eaeaee2
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-f778-63f7711d76f9
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-6d25-44b9ef6d17fd
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-f659-41785e584e83
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-b277-8ab8815982c1
00020000-5575-ad33-8f04-6c0d6e212a8d	00030000-5575-ad33-db45-8599b67cc757
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-eb40-88d1ae24f81c
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-1469-c8a4d6af7c7f
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-a62f-c19ee775049e
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-417d-5412fd382431
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-ff0c-3a05d3a2df8d
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-1594-5865fe18d4fb
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-4d7c-3d1f63e80426
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-51fa-d3a57d351a98
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-e04a-578ec7970ced
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-b5a6-853b62754458
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-26df-919ba6c3ffea
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-dd68-b144ee44a82d
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-d3d1-9ae168578ffe
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-2aa6-3fb090d854f8
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-1e2d-fdee38b97875
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-0ea3-e919405ecd6b
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-c082-e03ac37f824f
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-3c15-a4cbcf793d93
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-d2f5-cdba02e05d81
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-592b-14987a329c6d
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-695a-c230d27deb7a
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-0b2c-b88c9338db50
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-ea11-9b46cb506426
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-a457-79e602cc295c
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-3a5a-eee45a50d38b
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-613d-8e0fdb4fc474
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-b277-8ab8815982c1
00020000-5575-ad33-e1dc-f71c2ea0cdb7	00030000-5575-ad33-db45-8599b67cc757
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-eb40-88d1ae24f81c
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-608a-b52833a1e283
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-1469-c8a4d6af7c7f
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-bf09-b378b72f005b
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-0203-07400851c4ef
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-9614-30c1d2f2066e
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-a62f-c19ee775049e
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-69de-25decc61ac07
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-417d-5412fd382431
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-ff0c-3a05d3a2df8d
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-1594-5865fe18d4fb
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-51fa-d3a57d351a98
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-e04a-578ec7970ced
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-b5a6-853b62754458
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-dd68-b144ee44a82d
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-d3d1-9ae168578ffe
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-0ea3-e919405ecd6b
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-abad-613fc7c8a750
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-c082-e03ac37f824f
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-3c15-a4cbcf793d93
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-d2f5-cdba02e05d81
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-592b-14987a329c6d
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-b97f-ba780b3fb9a4
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-8819-84b21eaeaee2
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-6d25-44b9ef6d17fd
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-b277-8ab8815982c1
00020000-5575-ad33-448b-5365df774606	00030000-5575-ad33-db45-8599b67cc757
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-eb40-88d1ae24f81c
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-d7e7-94cdb5d0fafc
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-60f1-cdf471d8b3a7
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-1469-c8a4d6af7c7f
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-a62f-c19ee775049e
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-417d-5412fd382431
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-ff0c-3a05d3a2df8d
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-51fa-d3a57d351a98
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-e04a-578ec7970ced
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-dd68-b144ee44a82d
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-d3d1-9ae168578ffe
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-0ea3-e919405ecd6b
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-c082-e03ac37f824f
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-3c15-a4cbcf793d93
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-d2f5-cdba02e05d81
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-592b-14987a329c6d
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-b97f-ba780b3fb9a4
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-b277-8ab8815982c1
00020000-5575-ad33-004b-c088dbdcb651	00030000-5575-ad33-db45-8599b67cc757
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-eb40-88d1ae24f81c
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-1469-c8a4d6af7c7f
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-a62f-c19ee775049e
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-d5b7-467f9617fe41
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-417d-5412fd382431
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-ff0c-3a05d3a2df8d
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-51fa-d3a57d351a98
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-e04a-578ec7970ced
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-dd68-b144ee44a82d
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-d3d1-9ae168578ffe
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-0ea3-e919405ecd6b
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-c082-e03ac37f824f
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-3c15-a4cbcf793d93
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-d2f5-cdba02e05d81
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-592b-14987a329c6d
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-5c61-f3f9dd933c40
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-7a83-1461df27a953
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-b97f-ba780b3fb9a4
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-b277-8ab8815982c1
00020000-5575-ad33-c681-2f9ef921ae21	00030000-5575-ad33-db45-8599b67cc757
\.


--
-- TOC entry 2805 (class 0 OID 6660338)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6660369)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6660505)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6660103)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-ad34-ba51-d8f8e73f2883	00040000-5575-ad33-7bb2-ba729cb5a143	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-ad34-0136-7125f52b9e66	00040000-5575-ad33-7bb2-ba729cb5a143	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-ad34-5432-c8c19754d85c	00040000-5575-ad33-7bb2-ba729cb5a143	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-ad34-f9dd-d995532f1f4b	00040000-5575-ad33-7bb2-ba729cb5a143	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2784 (class 0 OID 6660138)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-ad32-7d56-d8bd9ea46f2f	8341	Adlešiči
00050000-5575-ad32-6f20-56b7cb500397	5270	Ajdovščina
00050000-5575-ad32-f82d-91787136bb6e	6280	Ankaran/Ancarano
00050000-5575-ad32-ffb3-be42656ec69c	9253	Apače
00050000-5575-ad32-3028-b92205c6edbe	8253	Artiče
00050000-5575-ad32-75a3-c0555a479bdb	4275	Begunje na Gorenjskem
00050000-5575-ad32-0295-a4f115f93fb8	1382	Begunje pri Cerknici
00050000-5575-ad32-1406-51b5e3eccfe2	9231	Beltinci
00050000-5575-ad32-b82d-e95ce069ea64	2234	Benedikt
00050000-5575-ad32-75e6-5c59e527e7e4	2345	Bistrica ob Dravi
00050000-5575-ad32-1916-fcce2ad0af7f	3256	Bistrica ob Sotli
00050000-5575-ad32-7a6a-c3137723c08c	8259	Bizeljsko
00050000-5575-ad32-3099-975b209605bd	1223	Blagovica
00050000-5575-ad32-1db5-aeefd3a234cc	8283	Blanca
00050000-5575-ad32-d88d-0ee03019b540	4260	Bled
00050000-5575-ad32-d93f-c5352ee719a6	4273	Blejska Dobrava
00050000-5575-ad32-b609-488bdccc138b	9265	Bodonci
00050000-5575-ad32-7734-4b3e358a95d9	9222	Bogojina
00050000-5575-ad32-e547-5029b10c8a96	4263	Bohinjska Bela
00050000-5575-ad32-f38b-37949f232b5d	4264	Bohinjska Bistrica
00050000-5575-ad32-f0fc-1f135add055f	4265	Bohinjsko jezero
00050000-5575-ad32-116c-d8f34e76bf38	1353	Borovnica
00050000-5575-ad32-29fb-30ed15b4f07a	8294	Boštanj
00050000-5575-ad32-3b2e-f6c294500094	5230	Bovec
00050000-5575-ad32-7442-f3dcd382b53d	5295	Branik
00050000-5575-ad32-f857-1f86ccdf6fb6	3314	Braslovče
00050000-5575-ad32-4e1e-8ae933ca4dfb	5223	Breginj
00050000-5575-ad32-f704-e989a98f3ef0	8280	Brestanica
00050000-5575-ad32-a65a-ab4517d4b483	2354	Bresternica
00050000-5575-ad32-49e4-6b18a02f77fc	4243	Brezje
00050000-5575-ad32-890d-40ee36f62a96	1351	Brezovica pri Ljubljani
00050000-5575-ad32-c475-ac20c584da2a	8250	Brežice
00050000-5575-ad32-1ace-0d4dfb36ddfe	4210	Brnik - Aerodrom
00050000-5575-ad32-7317-78ecbdebbef1	8321	Brusnice
00050000-5575-ad32-0b61-85f5d20ab1b8	3255	Buče
00050000-5575-ad32-f19d-5c2ce75cea74	8276	Bučka 
00050000-5575-ad32-7a68-e5b3f23a403f	9261	Cankova
00050000-5575-ad32-108d-bf4a63e43e62	3000	Celje 
00050000-5575-ad32-c84d-4c9f6fd39c76	3001	Celje - poštni predali
00050000-5575-ad32-5444-96fbe760e97d	4207	Cerklje na Gorenjskem
00050000-5575-ad32-01cc-4f43f4e45d88	8263	Cerklje ob Krki
00050000-5575-ad32-58e2-cff5e1659251	1380	Cerknica
00050000-5575-ad32-0e48-09fec2eecf93	5282	Cerkno
00050000-5575-ad32-284e-487ee4ddfbd4	2236	Cerkvenjak
00050000-5575-ad32-28e1-bb61663856dd	2215	Ceršak
00050000-5575-ad32-4e03-6f3e225d80e8	2326	Cirkovce
00050000-5575-ad32-98d9-394938e29e33	2282	Cirkulane
00050000-5575-ad32-22be-99d805cc9d66	5273	Col
00050000-5575-ad32-35d6-346ccb806a95	8251	Čatež ob Savi
00050000-5575-ad32-29f1-f465e12bf6b3	1413	Čemšenik
00050000-5575-ad32-e525-cfc1ef034b0d	5253	Čepovan
00050000-5575-ad32-7738-da90b0d3f9c0	9232	Črenšovci
00050000-5575-ad32-5bb5-54eeab78ce09	2393	Črna na Koroškem
00050000-5575-ad32-873a-d01ee3f35269	6275	Črni Kal
00050000-5575-ad32-3534-14778006019c	5274	Črni Vrh nad Idrijo
00050000-5575-ad32-3f95-67f1e6e09e0c	5262	Črniče
00050000-5575-ad32-86fc-b5c972f0cb33	8340	Črnomelj
00050000-5575-ad32-cd06-8d683123ed83	6271	Dekani
00050000-5575-ad32-2e7d-6bb872617773	5210	Deskle
00050000-5575-ad32-01a8-14e52452c5a9	2253	Destrnik
00050000-5575-ad32-7090-7474d4a13ded	6215	Divača
00050000-5575-ad32-e348-b4febec61d82	1233	Dob
00050000-5575-ad32-583e-1ee58678a6c3	3224	Dobje pri Planini
00050000-5575-ad32-70e1-513c1603a85a	8257	Dobova
00050000-5575-ad32-d6de-d70d86964d7b	1423	Dobovec
00050000-5575-ad32-9a9d-3b3f23331a7b	5263	Dobravlje
00050000-5575-ad32-6895-ec5345689ed1	3204	Dobrna
00050000-5575-ad32-f8ec-be7e18577c0c	8211	Dobrnič
00050000-5575-ad32-f12b-9146f48921a6	1356	Dobrova
00050000-5575-ad32-8951-189c913d05b2	9223	Dobrovnik/Dobronak 
00050000-5575-ad32-d9b4-ef2b83dd6d8d	5212	Dobrovo v Brdih
00050000-5575-ad32-e4ae-e335601971e8	1431	Dol pri Hrastniku
00050000-5575-ad32-a522-2294a74e38ee	1262	Dol pri Ljubljani
00050000-5575-ad32-b223-1cf6cdc1b4d6	1273	Dole pri Litiji
00050000-5575-ad32-eb1d-0986f9073d59	1331	Dolenja vas
00050000-5575-ad32-e378-c8be85ff8300	8350	Dolenjske Toplice
00050000-5575-ad32-6948-399cc9f50a5b	1230	Domžale
00050000-5575-ad32-e5c2-0d33f7ae7f01	2252	Dornava
00050000-5575-ad32-f2a4-ca63f6bbd504	5294	Dornberk
00050000-5575-ad32-9b58-7f61a9a29ec5	1319	Draga
00050000-5575-ad32-6f97-29caf189d308	8343	Dragatuš
00050000-5575-ad32-ff23-b2201e84fde0	3222	Dramlje
00050000-5575-ad32-0380-0611e7c914d0	2370	Dravograd
00050000-5575-ad32-6793-2d7fe70b8795	4203	Duplje
00050000-5575-ad32-cd4e-c8791f9303f4	6221	Dutovlje
00050000-5575-ad32-6471-c6eba0e4bdad	8361	Dvor
00050000-5575-ad32-1c77-a66a60929ab7	2343	Fala
00050000-5575-ad32-8ee7-8215bdd6f6f8	9208	Fokovci
00050000-5575-ad32-c7ac-63fc0e3cb13a	2313	Fram
00050000-5575-ad32-64d8-392ba59c9270	3213	Frankolovo
00050000-5575-ad32-1001-95965da6e916	1274	Gabrovka
00050000-5575-ad32-3cc7-bc8cf85f3654	8254	Globoko
00050000-5575-ad32-8e9a-45b0bd78e277	5275	Godovič
00050000-5575-ad32-0f3f-3844a08d3461	4204	Golnik
00050000-5575-ad32-8f65-d74c8fd4e2c4	3303	Gomilsko
00050000-5575-ad32-96f5-5de1da9f6379	4224	Gorenja vas
00050000-5575-ad32-ea48-977aab7d7e33	3263	Gorica pri Slivnici
00050000-5575-ad32-5e18-d655003bdb39	2272	Gorišnica
00050000-5575-ad32-45d1-365002a9125e	9250	Gornja Radgona
00050000-5575-ad32-ec0f-c75e2bcd132f	3342	Gornji Grad
00050000-5575-ad32-3795-5db6be6129e1	4282	Gozd Martuljek
00050000-5575-ad32-ad5a-4e2b04d68700	6272	Gračišče
00050000-5575-ad32-fd6b-be71e274d232	9264	Grad
00050000-5575-ad32-693a-fb1a3e3fbd94	8332	Gradac
00050000-5575-ad32-b92a-812fa4be5cbe	1384	Grahovo
00050000-5575-ad32-2f0d-d31c9ec176bd	5242	Grahovo ob Bači
00050000-5575-ad32-7e37-22fc4fd19189	5251	Grgar
00050000-5575-ad32-aa34-089d7a94a37a	3302	Griže
00050000-5575-ad32-6378-d7e5e012479b	3231	Grobelno
00050000-5575-ad32-ebd6-640f0ab6429d	1290	Grosuplje
00050000-5575-ad32-9646-200424ec5c66	2288	Hajdina
00050000-5575-ad32-d54b-f4d4f880bf3b	8362	Hinje
00050000-5575-ad32-63f8-1905edfe6191	2311	Hoče
00050000-5575-ad32-b494-956df9318fc8	9205	Hodoš/Hodos
00050000-5575-ad32-14af-0de4e8659324	1354	Horjul
00050000-5575-ad32-4701-5141df204d80	1372	Hotedršica
00050000-5575-ad32-7434-f69f83499ca4	1430	Hrastnik
00050000-5575-ad32-a312-a2ef59cdde42	6225	Hruševje
00050000-5575-ad32-07eb-a0df123b4988	4276	Hrušica
00050000-5575-ad32-d110-839ca421f90c	5280	Idrija
00050000-5575-ad32-afd2-3f928ece35ee	1292	Ig
00050000-5575-ad32-02c7-22416de5c253	6250	Ilirska Bistrica
00050000-5575-ad32-c50e-77371fc7668a	6251	Ilirska Bistrica-Trnovo
00050000-5575-ad32-4511-a65083f6fca2	1295	Ivančna Gorica
00050000-5575-ad32-5c6e-218e6e8a5557	2259	Ivanjkovci
00050000-5575-ad32-a26c-a58c5cdb6555	1411	Izlake
00050000-5575-ad32-04e6-257f2cae08c0	6310	Izola/Isola
00050000-5575-ad32-5f56-e39491b7e25e	2222	Jakobski Dol
00050000-5575-ad32-801f-236b8080650f	2221	Jarenina
00050000-5575-ad32-05c4-e11b47c8a6a3	6254	Jelšane
00050000-5575-ad32-4f41-51d23a454ac9	4270	Jesenice
00050000-5575-ad32-956f-6322182057bb	8261	Jesenice na Dolenjskem
00050000-5575-ad32-1f7b-96fe4107fb03	3273	Jurklošter
00050000-5575-ad32-0926-6e4071ee276f	2223	Jurovski Dol
00050000-5575-ad32-daac-58f7f04d2e57	2256	Juršinci
00050000-5575-ad32-2fe1-8d9187cc42ba	5214	Kal nad Kanalom
00050000-5575-ad32-653e-5d0230cd17f8	3233	Kalobje
00050000-5575-ad32-a84a-d5e5bc0bdc9c	4246	Kamna Gorica
00050000-5575-ad32-6d91-b9c7b05c91fc	2351	Kamnica
00050000-5575-ad32-0f26-5735efc9c5c8	1241	Kamnik
00050000-5575-ad32-3ee9-8ace5977d325	5213	Kanal
00050000-5575-ad32-c9c0-a167c05df843	8258	Kapele
00050000-5575-ad32-2aad-8d3a906cffc3	2362	Kapla
00050000-5575-ad32-8f33-d81d539444c0	2325	Kidričevo
00050000-5575-ad32-8c94-70b8bd469986	1412	Kisovec
00050000-5575-ad32-87fe-9559541fda41	6253	Knežak
00050000-5575-ad32-2522-e17802496591	5222	Kobarid
00050000-5575-ad32-78ac-c944ec4a7aa2	9227	Kobilje
00050000-5575-ad32-7277-618dcd851b44	1330	Kočevje
00050000-5575-ad32-62db-7c1caa38a252	1338	Kočevska Reka
00050000-5575-ad32-997b-01a55e128090	2276	Kog
00050000-5575-ad32-2faf-29f8781296bf	5211	Kojsko
00050000-5575-ad32-85b0-2205822b7bc4	6223	Komen
00050000-5575-ad32-5b52-f57bc320d0f9	1218	Komenda
00050000-5575-ad32-df6c-e807e2671d7a	6000	Koper/Capodistria 
00050000-5575-ad32-3c7e-6e0707257e22	6001	Koper/Capodistria - poštni predali
00050000-5575-ad32-5f36-24e85b8d992c	8282	Koprivnica
00050000-5575-ad32-e12d-9ac580620680	5296	Kostanjevica na Krasu
00050000-5575-ad32-7c13-237bff6b3c04	8311	Kostanjevica na Krki
00050000-5575-ad32-d7fd-400c89e5934f	1336	Kostel
00050000-5575-ad32-e23b-b1f0ca9cec74	6256	Košana
00050000-5575-ad33-e714-bca0441336b9	2394	Kotlje
00050000-5575-ad33-39a9-bc5355ade7ca	6240	Kozina
00050000-5575-ad33-c9f7-f05e214a263e	3260	Kozje
00050000-5575-ad33-939b-6d6aa23ed207	4000	Kranj 
00050000-5575-ad33-57a4-e7f13b493a08	4001	Kranj - poštni predali
00050000-5575-ad33-c9fd-455e24c9eef5	4280	Kranjska Gora
00050000-5575-ad33-7143-68ffc73120be	1281	Kresnice
00050000-5575-ad33-bc6c-5f9be5c17596	4294	Križe
00050000-5575-ad33-a2cf-236f3177df0b	9206	Križevci
00050000-5575-ad33-fb96-ba865fa93c39	9242	Križevci pri Ljutomeru
00050000-5575-ad33-808e-2911cf33ccdf	1301	Krka
00050000-5575-ad33-8202-703b8d805fd0	8296	Krmelj
00050000-5575-ad33-73c4-04aa2c459aca	4245	Kropa
00050000-5575-ad33-dd11-c7995164e633	8262	Krška vas
00050000-5575-ad33-d44f-1d4c6475d481	8270	Krško
00050000-5575-ad33-e102-57b27a37fa14	9263	Kuzma
00050000-5575-ad33-3659-abfef71813e7	2318	Laporje
00050000-5575-ad33-85c6-8d37d604b3c2	3270	Laško
00050000-5575-ad33-9107-fc721a7029b7	1219	Laze v Tuhinju
00050000-5575-ad33-1092-2e921c940ab0	2230	Lenart v Slovenskih goricah
00050000-5575-ad33-3e37-062b67b5d595	9220	Lendava/Lendva
00050000-5575-ad33-2a53-f512474996e0	4248	Lesce
00050000-5575-ad33-2d6f-5883ff7d6e1b	3261	Lesično
00050000-5575-ad33-ea3c-dd56904e1494	8273	Leskovec pri Krškem
00050000-5575-ad33-a132-eb3f90eb96b0	2372	Libeliče
00050000-5575-ad33-0168-499f9b4c52ee	2341	Limbuš
00050000-5575-ad33-94ac-0bb9dfdf0947	1270	Litija
00050000-5575-ad33-6191-414ee703a963	3202	Ljubečna
00050000-5575-ad33-88fa-e8022f4bbef5	1000	Ljubljana 
00050000-5575-ad33-0354-1df92f864f12	1001	Ljubljana - poštni predali
00050000-5575-ad33-fde0-fe1565ba8c7b	1231	Ljubljana - Črnuče
00050000-5575-ad33-4878-8860fa4006ee	1261	Ljubljana - Dobrunje
00050000-5575-ad33-b793-2e9f5513565d	1260	Ljubljana - Polje
00050000-5575-ad33-4043-cac368c59307	1210	Ljubljana - Šentvid
00050000-5575-ad33-923b-a82133bb9b16	1211	Ljubljana - Šmartno
00050000-5575-ad33-47c3-861c1fee7275	3333	Ljubno ob Savinji
00050000-5575-ad33-b253-f12610866423	9240	Ljutomer
00050000-5575-ad33-2d35-50f61f12310e	3215	Loče
00050000-5575-ad33-e4f4-aaee1d3a51b8	5231	Log pod Mangartom
00050000-5575-ad33-247b-40c45f963c09	1358	Log pri Brezovici
00050000-5575-ad33-e619-4d499641cb6b	1370	Logatec
00050000-5575-ad33-f5fb-acbf17d17e42	1371	Logatec
00050000-5575-ad33-8bbf-75df5bca2f9f	1434	Loka pri Zidanem Mostu
00050000-5575-ad33-e198-6de8e51c2449	3223	Loka pri Žusmu
00050000-5575-ad33-3a1b-cc027a587d71	6219	Lokev
00050000-5575-ad33-9251-6c8d1f2cf96d	1318	Loški Potok
00050000-5575-ad33-491d-d7782db9db95	2324	Lovrenc na Dravskem polju
00050000-5575-ad33-5a66-4c67bc434269	2344	Lovrenc na Pohorju
00050000-5575-ad33-1608-97c6ffe6c7c2	3334	Luče
00050000-5575-ad33-3bd6-63402dec2828	1225	Lukovica
00050000-5575-ad33-50c4-5a637bab8525	9202	Mačkovci
00050000-5575-ad33-0304-482cd813c988	2322	Majšperk
00050000-5575-ad33-933d-b9cbf35bba62	2321	Makole
00050000-5575-ad33-c2f9-2f3d03e972fe	9243	Mala Nedelja
00050000-5575-ad33-e94f-972646de0f71	2229	Malečnik
00050000-5575-ad33-6222-1b282628211e	6273	Marezige
00050000-5575-ad33-9351-228525eedc30	2000	Maribor 
00050000-5575-ad33-fd6b-a34f8d45ccfe	2001	Maribor - poštni predali
00050000-5575-ad33-b27c-280864c69c21	2206	Marjeta na Dravskem polju
00050000-5575-ad33-3cdc-ba1ca88e4c80	2281	Markovci
00050000-5575-ad33-fcd0-6bfd20808226	9221	Martjanci
00050000-5575-ad33-6667-883a62b71efa	6242	Materija
00050000-5575-ad33-5a7e-da4d6f06de49	4211	Mavčiče
00050000-5575-ad33-879b-d67303b5e561	1215	Medvode
00050000-5575-ad33-7948-34a7bc4d759a	1234	Mengeš
00050000-5575-ad33-7d1d-00049cefdb63	8330	Metlika
00050000-5575-ad33-e325-06888a045e22	2392	Mežica
00050000-5575-ad33-9a11-2057e22ec30b	2204	Miklavž na Dravskem polju
00050000-5575-ad33-0b2d-3011153919ed	2275	Miklavž pri Ormožu
00050000-5575-ad33-ad9a-b98308bf31a6	5291	Miren
00050000-5575-ad33-227e-5cb1e5090d75	8233	Mirna
00050000-5575-ad33-bdab-f853f94c5fc1	8216	Mirna Peč
00050000-5575-ad33-db37-70bc691d27d5	2382	Mislinja
00050000-5575-ad33-099c-3f5198e17478	4281	Mojstrana
00050000-5575-ad33-85cc-5c6625ae8296	8230	Mokronog
00050000-5575-ad33-9e4d-83affb2c68f5	1251	Moravče
00050000-5575-ad33-7a5d-eab65a80f645	9226	Moravske Toplice
00050000-5575-ad33-1206-2e0573d742e3	5216	Most na Soči
00050000-5575-ad33-269a-69bc858a461a	1221	Motnik
00050000-5575-ad33-f67a-6463fe95c97b	3330	Mozirje
00050000-5575-ad33-10bb-f672c0bce899	9000	Murska Sobota 
00050000-5575-ad33-b597-05fa6d0d4680	9001	Murska Sobota - poštni predali
00050000-5575-ad33-94a4-201bd05bbb59	2366	Muta
00050000-5575-ad33-f51b-b5e5bc386c21	4202	Naklo
00050000-5575-ad33-4b74-ac9cebf1a2d7	3331	Nazarje
00050000-5575-ad33-50df-1478fd3fd882	1357	Notranje Gorice
00050000-5575-ad33-1e30-623d620c5612	3203	Nova Cerkev
00050000-5575-ad33-0232-62c3fda4ef28	5000	Nova Gorica 
00050000-5575-ad33-4e3f-5579a96f9109	5001	Nova Gorica - poštni predali
00050000-5575-ad33-cf63-035002fd011a	1385	Nova vas
00050000-5575-ad33-d4fa-c3ceb4ccbf2f	8000	Novo mesto
00050000-5575-ad33-02b3-f9ef60e14fd9	8001	Novo mesto - poštni predali
00050000-5575-ad33-ac4b-e7095dc56fc9	6243	Obrov
00050000-5575-ad33-ff22-18cb28834c55	9233	Odranci
00050000-5575-ad33-e544-29bf2400771a	2317	Oplotnica
00050000-5575-ad33-ad87-a902adf260fb	2312	Orehova vas
00050000-5575-ad33-168b-19142787fbf0	2270	Ormož
00050000-5575-ad33-f6db-dcd30ba82333	1316	Ortnek
00050000-5575-ad33-78fa-1f8f456bb7c6	1337	Osilnica
00050000-5575-ad33-851f-f874a1a3a406	8222	Otočec
00050000-5575-ad33-f569-11298ec08e07	2361	Ožbalt
00050000-5575-ad33-f9d0-ac1c5ab1c933	2231	Pernica
00050000-5575-ad33-1c13-2c25f5dcdf82	2211	Pesnica pri Mariboru
00050000-5575-ad33-155e-1045d67b375c	9203	Petrovci
00050000-5575-ad33-5bf1-6f4b7a223f4d	3301	Petrovče
00050000-5575-ad33-19c0-364e0120c553	6330	Piran/Pirano
00050000-5575-ad33-0d00-0cced345f231	8255	Pišece
00050000-5575-ad33-9bcb-fd5655707d21	6257	Pivka
00050000-5575-ad33-64be-612aa770f0c4	6232	Planina
00050000-5575-ad33-8134-83558c950fea	3225	Planina pri Sevnici
00050000-5575-ad33-1e11-050f8d6d663c	6276	Pobegi
00050000-5575-ad33-20b4-88852f9ea005	8312	Podbočje
00050000-5575-ad33-ce1b-1b0bb17541b1	5243	Podbrdo
00050000-5575-ad33-1922-102284c535c5	3254	Podčetrtek
00050000-5575-ad33-1460-f65be084d989	2273	Podgorci
00050000-5575-ad33-7445-17b971b48d78	6216	Podgorje
00050000-5575-ad33-9150-8ee6c424abe2	2381	Podgorje pri Slovenj Gradcu
00050000-5575-ad33-5481-072f94ae9815	6244	Podgrad
00050000-5575-ad33-ce8d-6fb2d3bd9154	1414	Podkum
00050000-5575-ad33-1fc8-45b617bc8876	2286	Podlehnik
00050000-5575-ad33-d3b3-fbd55f2d0259	5272	Podnanos
00050000-5575-ad33-188d-78d7ee45c08b	4244	Podnart
00050000-5575-ad33-69fa-766a91377e17	3241	Podplat
00050000-5575-ad33-cb32-0a3718c4a97a	3257	Podsreda
00050000-5575-ad33-dd6e-7288fa7fc00d	2363	Podvelka
00050000-5575-ad33-6c45-fbf1f3634ac3	2208	Pohorje
00050000-5575-ad33-d204-987e97502d2d	2257	Polenšak
00050000-5575-ad33-112b-0c9bd303fb0a	1355	Polhov Gradec
00050000-5575-ad33-491b-7c024c6e95c4	4223	Poljane nad Škofjo Loko
00050000-5575-ad33-23a5-7e43a7087672	2319	Poljčane
00050000-5575-ad33-af35-bb9f8c62ba16	1272	Polšnik
00050000-5575-ad33-65ab-1443142bbadd	3313	Polzela
00050000-5575-ad33-ec01-0f604b1f6f48	3232	Ponikva
00050000-5575-ad33-2923-56d1629fd22d	6320	Portorož/Portorose
00050000-5575-ad33-879e-2ed0fdfe4f91	6230	Postojna
00050000-5575-ad33-fc1d-2e724d089e1e	2331	Pragersko
00050000-5575-ad33-e48f-c68eedf2d251	3312	Prebold
00050000-5575-ad33-34c9-ba57c0775f99	4205	Preddvor
00050000-5575-ad33-1e23-436d252d456f	6255	Prem
00050000-5575-ad33-888e-91e63099c8d6	1352	Preserje
00050000-5575-ad33-24c1-0dd1988d0a1b	6258	Prestranek
00050000-5575-ad33-271f-99ce5a5d3277	2391	Prevalje
00050000-5575-ad33-0fae-f719b2e62246	3262	Prevorje
00050000-5575-ad33-541c-4c6cd760ef86	1276	Primskovo 
00050000-5575-ad33-aa5d-6767109206a0	3253	Pristava pri Mestinju
00050000-5575-ad33-10c2-6514c8831c51	9207	Prosenjakovci/Partosfalva
00050000-5575-ad33-d1f8-142a108154a2	5297	Prvačina
00050000-5575-ad33-6bdc-faa123b4f19e	2250	Ptuj
00050000-5575-ad33-481a-c1d9ef4699cb	2323	Ptujska Gora
00050000-5575-ad33-de47-ff96a4fb193e	9201	Puconci
00050000-5575-ad33-a102-2bfd2b8649ca	2327	Rače
00050000-5575-ad33-c5ee-f947f3e57131	1433	Radeče
00050000-5575-ad33-e6ec-f90a09de13a7	9252	Radenci
00050000-5575-ad33-4410-37acb627f3ef	2360	Radlje ob Dravi
00050000-5575-ad33-e49a-eeada70a7636	1235	Radomlje
00050000-5575-ad33-d3f5-36a30bc48f2d	4240	Radovljica
00050000-5575-ad33-8ec9-9f937096a10a	8274	Raka
00050000-5575-ad33-1bec-c6135447609b	1381	Rakek
00050000-5575-ad33-30f9-16cb65e54cfb	4283	Rateče - Planica
00050000-5575-ad33-11ad-96c9d3b1cdad	2390	Ravne na Koroškem
00050000-5575-ad33-8632-32765732164c	9246	Razkrižje
00050000-5575-ad33-3cf0-873c2356f0c6	3332	Rečica ob Savinji
00050000-5575-ad33-4cfe-8b95e926ffbd	5292	Renče
00050000-5575-ad33-d121-4eeca68e2c57	1310	Ribnica
00050000-5575-ad33-1fa1-e09ef7c9efe8	2364	Ribnica na Pohorju
00050000-5575-ad33-6a69-d897f7dcbc0e	3272	Rimske Toplice
00050000-5575-ad33-734f-f351395b3443	1314	Rob
00050000-5575-ad33-5b13-67bf5b976a1e	5215	Ročinj
00050000-5575-ad33-02ee-5bd88d43cf0e	3250	Rogaška Slatina
00050000-5575-ad33-80f4-8ea67688b35d	9262	Rogašovci
00050000-5575-ad33-cbd6-2ca4f0241d14	3252	Rogatec
00050000-5575-ad33-980e-a4440e217c61	1373	Rovte
00050000-5575-ad33-c959-bf730d05c272	2342	Ruše
00050000-5575-ad33-29cb-4cfacc253ac5	1282	Sava
00050000-5575-ad33-966c-f8bf32fd1bcd	6333	Sečovlje/Sicciole
00050000-5575-ad33-eb47-2131d173ade8	4227	Selca
00050000-5575-ad33-435c-2d36f9c46aab	2352	Selnica ob Dravi
00050000-5575-ad33-78bb-20213f3fe3de	8333	Semič
00050000-5575-ad33-f8f6-054772f6c2fc	8281	Senovo
00050000-5575-ad33-e7d8-62420b323d2d	6224	Senožeče
00050000-5575-ad33-40c0-3f5ffe744731	8290	Sevnica
00050000-5575-ad33-8e4d-6657b3f01085	6210	Sežana
00050000-5575-ad33-5b4d-71575ab28f2f	2214	Sladki Vrh
00050000-5575-ad33-b5d7-eb5e22868038	5283	Slap ob Idrijci
00050000-5575-ad33-c825-6ae9cfa1b42a	2380	Slovenj Gradec
00050000-5575-ad33-1f03-0e7697d59be3	2310	Slovenska Bistrica
00050000-5575-ad33-577d-ae36de8b4274	3210	Slovenske Konjice
00050000-5575-ad33-98d0-29434af934cd	1216	Smlednik
00050000-5575-ad33-b7fb-e7c4ae2c268c	5232	Soča
00050000-5575-ad33-04eb-2b15e047c785	1317	Sodražica
00050000-5575-ad33-d429-42f2bdfce8cf	3335	Solčava
00050000-5575-ad33-d321-f3a9c98e8db3	5250	Solkan
00050000-5575-ad33-71b3-9ee222965304	4229	Sorica
00050000-5575-ad33-5ddf-ca7c297f84f8	4225	Sovodenj
00050000-5575-ad33-da3d-68a2e34c04ad	5281	Spodnja Idrija
00050000-5575-ad33-fd3e-cdb004405023	2241	Spodnji Duplek
00050000-5575-ad33-9405-432313d51caa	9245	Spodnji Ivanjci
00050000-5575-ad33-58a7-8b0c3658a812	2277	Središče ob Dravi
00050000-5575-ad33-f6a0-757f03eab957	4267	Srednja vas v Bohinju
00050000-5575-ad33-3b73-03221d64a62d	8256	Sromlje 
00050000-5575-ad33-621c-8c915b735244	5224	Srpenica
00050000-5575-ad33-77ac-9d4121f9bd65	1242	Stahovica
00050000-5575-ad33-31e4-e1362fa37e65	1332	Stara Cerkev
00050000-5575-ad33-1c52-94b1c67b9b10	8342	Stari trg ob Kolpi
00050000-5575-ad33-c9ea-ac294f7ad514	1386	Stari trg pri Ložu
00050000-5575-ad33-3247-414550a60e09	2205	Starše
00050000-5575-ad33-6dfe-11bd65703a7e	2289	Stoperce
00050000-5575-ad33-aa51-306e01263e1e	8322	Stopiče
00050000-5575-ad33-5f4d-958e7cff2d5a	3206	Stranice
00050000-5575-ad33-2880-fdf214267b9b	8351	Straža
00050000-5575-ad33-2b63-23249f5d9657	1313	Struge
00050000-5575-ad33-9556-7682ec456748	8293	Studenec
00050000-5575-ad33-e0ba-d4ac971ae723	8331	Suhor
00050000-5575-ad33-4e13-6231faa7d382	2233	Sv. Ana v Slovenskih goricah
00050000-5575-ad33-f49d-700692ca94cf	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-ad33-7890-8976cbda7bdb	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-ad33-4bfd-a9c67ffd3ecd	9244	Sveti Jurij ob Ščavnici
00050000-5575-ad33-40f0-611579a23d55	3264	Sveti Štefan
00050000-5575-ad33-ab2c-97a88224ed3e	2258	Sveti Tomaž
00050000-5575-ad33-8117-4bdf5ca4ff86	9204	Šalovci
00050000-5575-ad33-cfb2-ed03865d8397	5261	Šempas
00050000-5575-ad33-9255-92cc4343d9a5	5290	Šempeter pri Gorici
00050000-5575-ad33-3a32-da68e9710b5c	3311	Šempeter v Savinjski dolini
00050000-5575-ad33-9965-2a339c6bcd1b	4208	Šenčur
00050000-5575-ad33-12f6-d7cfbb1138cf	2212	Šentilj v Slovenskih goricah
00050000-5575-ad33-ee4d-cfafdc8e15f1	8297	Šentjanž
00050000-5575-ad33-f2fb-db690cd9d239	2373	Šentjanž pri Dravogradu
00050000-5575-ad33-cbbb-0109b752a4ff	8310	Šentjernej
00050000-5575-ad33-6800-bc97c357fd0f	3230	Šentjur
00050000-5575-ad33-7bd6-bb935138c979	3271	Šentrupert
00050000-5575-ad33-2c49-ade32534e332	8232	Šentrupert
00050000-5575-ad33-321c-1b31383254fd	1296	Šentvid pri Stični
00050000-5575-ad33-a430-68985730915e	8275	Škocjan
00050000-5575-ad33-874e-b7e65cf565b2	6281	Škofije
00050000-5575-ad33-6205-f11465932db8	4220	Škofja Loka
00050000-5575-ad33-0219-31e5ed001784	3211	Škofja vas
00050000-5575-ad33-2c3d-a6dfa0c270b9	1291	Škofljica
00050000-5575-ad33-d200-c60f3c65fe7f	6274	Šmarje
00050000-5575-ad33-2e6e-79c245f5441e	1293	Šmarje - Sap
00050000-5575-ad33-a959-fe793211479c	3240	Šmarje pri Jelšah
00050000-5575-ad33-0ef6-5d20f2e2a00b	8220	Šmarješke Toplice
00050000-5575-ad33-c026-c36c71952af2	2315	Šmartno na Pohorju
00050000-5575-ad33-b3a4-ed61512624fc	3341	Šmartno ob Dreti
00050000-5575-ad33-139c-2b9523ede849	3327	Šmartno ob Paki
00050000-5575-ad33-2b12-d3dad0e94f16	1275	Šmartno pri Litiji
00050000-5575-ad33-af18-2052b940fc49	2383	Šmartno pri Slovenj Gradcu
00050000-5575-ad33-98d3-0af937a78aaa	3201	Šmartno v Rožni dolini
00050000-5575-ad33-606e-98ce2739f835	3325	Šoštanj
00050000-5575-ad33-2722-94e831e98073	6222	Štanjel
00050000-5575-ad33-7fc2-350b7e2d34c5	3220	Štore
00050000-5575-ad33-a94a-2caec01e5bde	3304	Tabor
00050000-5575-ad33-6b78-dd64c2680e3a	3221	Teharje
00050000-5575-ad33-1402-d93b1c930270	9251	Tišina
00050000-5575-ad33-88bc-f22319ae637b	5220	Tolmin
00050000-5575-ad33-e7a0-59044ab89c87	3326	Topolšica
00050000-5575-ad33-215c-237a64c03438	2371	Trbonje
00050000-5575-ad33-3a12-9a89802a8f7d	1420	Trbovlje
00050000-5575-ad33-2f1c-d0fee8c44bd6	8231	Trebelno 
00050000-5575-ad33-3c7c-ab2b8275337b	8210	Trebnje
00050000-5575-ad33-870a-ab32b584192b	5252	Trnovo pri Gorici
00050000-5575-ad33-142a-adf8edb8b72f	2254	Trnovska vas
00050000-5575-ad33-830a-e4b9b52b6c76	1222	Trojane
00050000-5575-ad33-2ff4-6c535efb17e4	1236	Trzin
00050000-5575-ad33-c5e2-4c84f9c99b37	4290	Tržič
00050000-5575-ad33-cb3e-bf83ad130fcd	8295	Tržišče
00050000-5575-ad33-4c4d-6e0d33eb94f2	1311	Turjak
00050000-5575-ad33-81ac-320523693da8	9224	Turnišče
00050000-5575-ad33-fb91-5528c7010bf0	8323	Uršna sela
00050000-5575-ad33-a002-69c8f926ca4f	1252	Vače
00050000-5575-ad33-c3db-13be67ba7990	3320	Velenje 
00050000-5575-ad33-d200-1ecfe9f61cbf	3322	Velenje - poštni predali
00050000-5575-ad33-7585-a38aa3d63759	8212	Velika Loka
00050000-5575-ad33-76b8-f975a1c8c2b2	2274	Velika Nedelja
00050000-5575-ad33-9190-09b07350fe39	9225	Velika Polana
00050000-5575-ad33-9a01-3e85dad46d13	1315	Velike Lašče
00050000-5575-ad33-1ff8-2a50582d95f9	8213	Veliki Gaber
00050000-5575-ad33-6d21-11d440e166a9	9241	Veržej
00050000-5575-ad33-1820-95a6257927e2	1312	Videm - Dobrepolje
00050000-5575-ad33-20e2-cb510d45b5f6	2284	Videm pri Ptuju
00050000-5575-ad33-6f20-2ddf90c4c4e8	8344	Vinica
00050000-5575-ad33-1898-667fbcda4e64	5271	Vipava
00050000-5575-ad33-3712-7a132e7faec3	4212	Visoko
00050000-5575-ad33-bb06-d25d04d4e61b	1294	Višnja Gora
00050000-5575-ad33-2c7f-d08691c991a9	3205	Vitanje
00050000-5575-ad33-686d-2eaaf15bfa35	2255	Vitomarci
00050000-5575-ad33-622a-b00689a2e9b3	1217	Vodice
00050000-5575-ad33-16df-ef41e78f88f7	3212	Vojnik\t
00050000-5575-ad33-264a-e773ebcbaa75	5293	Volčja Draga
00050000-5575-ad33-c769-dfe5016ac838	2232	Voličina
00050000-5575-ad33-fe3f-e0937250bc9f	3305	Vransko
00050000-5575-ad33-cc74-a194884e63c1	6217	Vremski Britof
00050000-5575-ad33-abd1-3399278f5032	1360	Vrhnika
00050000-5575-ad33-dd0a-80885c52ded7	2365	Vuhred
00050000-5575-ad33-26c1-2d74d286768d	2367	Vuzenica
00050000-5575-ad33-da9d-dfc9e9a04426	8292	Zabukovje 
00050000-5575-ad33-c7ed-ea7fc8ce8aad	1410	Zagorje ob Savi
00050000-5575-ad33-e04d-a41fef535ae2	1303	Zagradec
00050000-5575-ad33-e641-d569bd9d7715	2283	Zavrč
00050000-5575-ad33-f814-5f088624bb6d	8272	Zdole 
00050000-5575-ad33-121b-3b29d3666902	4201	Zgornja Besnica
00050000-5575-ad33-01ce-0c5e50696fc5	2242	Zgornja Korena
00050000-5575-ad33-2f1b-b462ddbbeaaa	2201	Zgornja Kungota
00050000-5575-ad33-9d5d-f0c2e107ef8c	2316	Zgornja Ložnica
00050000-5575-ad33-7eba-a39b53288548	2314	Zgornja Polskava
00050000-5575-ad33-37ae-421e6764021a	2213	Zgornja Velka
00050000-5575-ad33-f97c-e5e2789e010c	4247	Zgornje Gorje
00050000-5575-ad33-3aeb-7054a7825e2a	4206	Zgornje Jezersko
00050000-5575-ad33-95c9-6cebfee55ba1	2285	Zgornji Leskovec
00050000-5575-ad33-4ddb-16ec2f2b5dc7	1432	Zidani Most
00050000-5575-ad33-2458-0e65a56190ec	3214	Zreče
00050000-5575-ad33-3eee-b1936eb80df1	4209	Žabnica
00050000-5575-ad33-2570-ed8423d7a5a9	3310	Žalec
00050000-5575-ad33-d4c7-f755e671d5dd	4228	Železniki
00050000-5575-ad33-cdca-f8ebae2172f1	2287	Žetale
00050000-5575-ad33-9c20-377858fc0d10	4226	Žiri
00050000-5575-ad33-d589-e73e4af4650d	4274	Žirovnica
00050000-5575-ad33-672c-14c8ba785691	8360	Žužemberk
\.


--
-- TOC entry 2801 (class 0 OID 6660312)
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
-- TOC entry 2783 (class 0 OID 6660123)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6660201)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6660324)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6660444)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6660497)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-ad34-a7c7-9a06068cb5b8	00080000-5575-ad34-5432-c8c19754d85c	0987	A
00190000-5575-ad34-5638-5a3048fa512a	00080000-5575-ad34-0136-7125f52b9e66	0989	A
\.


--
-- TOC entry 2827 (class 0 OID 6660611)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6660639)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6660620)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6660353)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-ad34-64c6-88a1c6d77164	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-ad34-b428-1eba1ca0e652	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-ad34-581e-2b154ff87bb6	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-ad34-46bd-5fd6e30288af	0004	Mali oder	t	24	Mali oder 
00220000-5575-ad34-9c03-bd2545d0522c	0005	Komorni oder	t	15	Komorni oder
00220000-5575-ad34-f59f-136d7d4ba449	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-ad34-3c0a-edbaac3e3873	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2799 (class 0 OID 6660297)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6660287)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6660486)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6660421)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2772 (class 0 OID 6659995)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-ad33-cc8e-cb536b53bb14	00010000-5575-ad34-9884-825b398d053a	2015-06-08 16:56:53	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROg7Vjwc3Gq6mMBE0U4v9LqMnh/n44CIC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2808 (class 0 OID 6660363)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2776 (class 0 OID 6660033)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-ad33-7c62-037cb2c9eaee	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-ad33-5883-2d26fab12fd6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-ad33-fe03-fb6314ee73bd	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-ad33-c949-cc7e9e90c85e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-ad33-8f04-6c0d6e212a8d	planer	Planer dogodkov v koledarju	t
00020000-5575-ad33-e1dc-f71c2ea0cdb7	kadrovska	Kadrovska služba	t
00020000-5575-ad33-448b-5365df774606	arhivar	Ažuriranje arhivalij	t
00020000-5575-ad33-004b-c088dbdcb651	igralec	Igralec	t
00020000-5575-ad33-c681-2f9ef921ae21	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2774 (class 0 OID 6660017)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-ad33-cc8e-cb536b53bb14	00020000-5575-ad33-fe03-fb6314ee73bd
00010000-5575-ad34-9884-825b398d053a	00020000-5575-ad33-fe03-fb6314ee73bd
\.


--
-- TOC entry 2810 (class 0 OID 6660377)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6660318)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6660268)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6660658)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-ad33-12b6-11db3eaf1c24	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-ad33-f101-177ee4453f92	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-ad33-8dd7-8e7d8b8631aa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-ad33-e73b-0882858335ac	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-ad33-d3fe-7fef35d06bd0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2832 (class 0 OID 6660650)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-ad33-99f5-6a89c5b8f87e	00230000-5575-ad33-e73b-0882858335ac	popa
00240000-5575-ad33-f053-dd00dd3c294e	00230000-5575-ad33-e73b-0882858335ac	oseba
00240000-5575-ad33-b677-398bd7d77b67	00230000-5575-ad33-f101-177ee4453f92	prostor
00240000-5575-ad33-631e-304a1e744261	00230000-5575-ad33-e73b-0882858335ac	besedilo
00240000-5575-ad33-7d90-9f2b219be5b7	00230000-5575-ad33-e73b-0882858335ac	uprizoritev
00240000-5575-ad33-e8dd-c470ac610678	00230000-5575-ad33-e73b-0882858335ac	funkcija
00240000-5575-ad33-9e4e-4a5d1b4e03f5	00230000-5575-ad33-e73b-0882858335ac	tipfunkcije
00240000-5575-ad33-6768-87e78b3b3f22	00230000-5575-ad33-e73b-0882858335ac	alternacija
00240000-5575-ad33-cbc1-05c344c6875d	00230000-5575-ad33-12b6-11db3eaf1c24	pogodba
00240000-5575-ad33-14e8-939ca36e93e1	00230000-5575-ad33-e73b-0882858335ac	zaposlitev
\.


--
-- TOC entry 2831 (class 0 OID 6660645)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6660431)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6660095)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6660274)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-ad34-ceef-4cde780f82a5	00180000-5575-ad34-3f53-43205d5981b4	000c0000-5575-ad34-3fae-73df3abfc78b	00090000-5575-ad34-71d2-29dd2893e1cf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-ad34-b8af-3d5de2d7ab14	00180000-5575-ad34-3f53-43205d5981b4	000c0000-5575-ad34-ee15-18cacc6322af	00090000-5575-ad34-85e3-b04bfe253e19	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-ad34-db16-91e369bf707c	00180000-5575-ad34-3f53-43205d5981b4	000c0000-5575-ad34-2075-befb6224d693	00090000-5575-ad34-4b58-5b0a955880a9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-ad34-e60b-369507ab3e85	00180000-5575-ad34-3f53-43205d5981b4	000c0000-5575-ad34-3129-d160c220f03f	00090000-5575-ad34-18b4-b6bded4dbd6c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-ad34-8a15-53aeb99ea6c1	00180000-5575-ad34-3f53-43205d5981b4	000c0000-5575-ad34-2d7e-639716647536	00090000-5575-ad34-f2bc-d836750124cb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-ad34-f5bd-3360b202aa52	00180000-5575-ad34-c23e-9a381f15d7fc	\N	00090000-5575-ad34-f2bc-d836750124cb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2818 (class 0 OID 6660475)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-ad33-c76c-c2d09eb7f0ac	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-ad33-310f-d02558cfaff9	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-ad33-2f24-80a4d0a7199e	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-ad33-6b6a-666d4f15f331	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-ad33-3bc2-711715bfbf66	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-ad33-08bf-befb56470fba	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-ad33-efb9-4f6a3f0f4875	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-ad33-ec12-bd740b6944a9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-ad33-5b23-ddf9fc6edd39	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-ad33-0264-f2fb72ee9ca0	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-ad33-2465-dfdf8d0ca4c1	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-ad33-129e-854c5d16532e	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-ad33-aeb8-c5de887c8e2e	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-ad33-ec1c-dbc2f48c2a7f	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-ad33-1bfc-00a23a1febd4	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-ad33-a987-7d68d1d197c0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2829 (class 0 OID 6660628)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6660158)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6660004)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-ad34-9884-825b398d053a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROzK5EfIy3mrRcz7h8YRjXJG26HsVE0DK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-ad34-cbf6-e36ea5dd3e3e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-ad34-1b4f-f8447e446f73	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-ad34-1c2a-f0697e4b01b2	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-ad34-fb49-250159fb9967	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-ad34-756f-bb92e1a20a4b	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-ad34-64c9-a30f296ec2e6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-ad33-cc8e-cb536b53bb14	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 6660532)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-ad34-1ab1-39791f8f57b4	00160000-5575-ad34-0aeb-12fe4704a507	00150000-5575-ad33-9b44-24565b4fb32d	00140000-5575-ad33-c53e-52d68516db1f	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-ad34-9c03-bd2545d0522c
000e0000-5575-ad34-7c61-05079032a335	00160000-5575-ad34-aab5-afba08ac6307	00150000-5575-ad33-d2ae-db2517a2696c	00140000-5575-ad33-bc97-a9ecc734132a	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-ad34-f59f-136d7d4ba449
\.


--
-- TOC entry 2791 (class 0 OID 6660220)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-ad34-1b67-6beba3de8261	000e0000-5575-ad34-7c61-05079032a335	1	
00200000-5575-ad34-30d1-4500eb0d6f71	000e0000-5575-ad34-7c61-05079032a335	2	
\.


--
-- TOC entry 2806 (class 0 OID 6660345)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6660414)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6660252)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6660522)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-ad33-c53e-52d68516db1f	01	Drama	drama (SURS 01)
00140000-5575-ad33-5db4-9c638ab26c75	02	Opera	opera (SURS 02)
00140000-5575-ad33-1d2e-04bc86199128	03	Balet	balet (SURS 03)
00140000-5575-ad33-36b6-e816f01345cb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-ad33-b7ad-6cc66143eb95	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-ad33-bc97-a9ecc734132a	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-ad33-7c5b-47b76de3d38a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2812 (class 0 OID 6660404)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-ad33-4dd3-a07c4c9bcbb4	01	Opera	opera
00150000-5575-ad33-7ff4-1f59d7b1c87e	02	Opereta	opereta
00150000-5575-ad33-fd09-f48adbc393a0	03	Balet	balet
00150000-5575-ad33-3e34-3ab5eb0bda09	04	Plesne prireditve	plesne prireditve
00150000-5575-ad33-0e32-b2b35a4987d4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-ad33-fa9d-a502a826e172	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-ad33-8979-b2a9e523ebd9	07	Biografska drama	biografska drama
00150000-5575-ad33-9b44-24565b4fb32d	08	Komedija	komedija
00150000-5575-ad33-7ecd-bca549472761	09	Črna komedija	črna komedija
00150000-5575-ad33-4060-2ed5e9697a8f	10	E-igra	E-igra
00150000-5575-ad33-d2ae-db2517a2696c	11	Kriminalka	kriminalka
00150000-5575-ad33-1d67-ab5559f1f1eb	12	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6660058)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6660578)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6660568)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6660474)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6660242)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6660267)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6660184)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6660607)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6660400)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6660218)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6660261)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6660198)
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
-- TOC entry 2456 (class 2606 OID 6660310)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6660337)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6660156)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6660067)
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
-- TOC entry 2371 (class 2606 OID 6660091)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6660047)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6660032)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6660343)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6660376)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6660517)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6660120)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6660144)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6660316)
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
-- TOC entry 2386 (class 2606 OID 6660134)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6660205)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6660328)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6660456)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6660502)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6660618)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6660643)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6660625)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6660360)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6660301)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6660292)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6660496)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6660428)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6660003)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6660367)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6660021)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6660041)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6660385)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6660323)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6660273)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6660667)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6660655)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6660649)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6660441)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6660100)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6660283)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6660485)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6660638)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6660169)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6660016)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6660548)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6660227)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6660351)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6660419)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6660256)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6660530)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6660412)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6660249)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2504 (class 1259 OID 6660442)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 6660443)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6660122)
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
-- TOC entry 2469 (class 1259 OID 6660344)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6660330)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6660329)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6660228)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6660401)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6660403)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6660402)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6660200)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6660199)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 6660519)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 6660520)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2524 (class 1259 OID 6660521)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2531 (class 1259 OID 6660553)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2532 (class 1259 OID 6660550)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2533 (class 1259 OID 6660552)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2534 (class 1259 OID 6660551)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6660171)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6660170)
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
-- TOC entry 2369 (class 1259 OID 6660094)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6660368)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6660262)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6660048)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6660049)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6660388)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6660387)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6660386)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6660206)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6660208)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6660207)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 6660657)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6660296)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6660294)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6660293)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6660295)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6660022)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6660023)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6660352)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6660317)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2500 (class 1259 OID 6660429)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2501 (class 1259 OID 6660430)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 6660608)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 6660609)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2554 (class 1259 OID 6660610)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2382 (class 1259 OID 6660136)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6660135)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6660137)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2564 (class 1259 OID 6660644)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2508 (class 1259 OID 6660457)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 6660458)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2544 (class 1259 OID 6660582)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2545 (class 1259 OID 6660584)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2546 (class 1259 OID 6660580)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2547 (class 1259 OID 6660583)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2548 (class 1259 OID 6660581)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2497 (class 1259 OID 6660420)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6660305)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6660304)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6660302)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6660303)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2540 (class 1259 OID 6660570)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2541 (class 1259 OID 6660569)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 6660619)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6660219)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6660069)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6660068)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6660101)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6660102)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6660286)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6660285)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6660284)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2558 (class 1259 OID 6660627)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2559 (class 1259 OID 6660626)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6660251)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6660247)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6660244)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6660245)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6660243)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6660248)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6660246)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6660121)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6660185)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6660187)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6660186)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6660188)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6660311)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6660518)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6660549)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6660092)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6660093)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 6660413)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6660668)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6660157)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 6660656)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6660362)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6660361)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 6660579)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6660145)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6660531)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6660503)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 6660504)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6660042)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6660250)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2603 (class 2606 OID 6660804)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2600 (class 2606 OID 6660789)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 6660794)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2605 (class 2606 OID 6660814)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2599 (class 2606 OID 6660784)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2604 (class 2606 OID 6660809)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2602 (class 2606 OID 6660799)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2634 (class 2606 OID 6660959)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2635 (class 2606 OID 6660964)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6660719)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2622 (class 2606 OID 6660899)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2621 (class 2606 OID 6660894)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2620 (class 2606 OID 6660889)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2598 (class 2606 OID 6660779)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6660929)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6660939)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2629 (class 2606 OID 6660934)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2593 (class 2606 OID 6660754)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2592 (class 2606 OID 6660749)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2618 (class 2606 OID 6660879)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6660984)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 6660989)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6660994)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2645 (class 2606 OID 6661014)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2642 (class 2606 OID 6660999)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2644 (class 2606 OID 6661009)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2643 (class 2606 OID 6661004)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2591 (class 2606 OID 6660744)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2590 (class 2606 OID 6660739)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2583 (class 2606 OID 6660704)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2582 (class 2606 OID 6660699)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2624 (class 2606 OID 6660909)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2606 (class 2606 OID 6660819)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2578 (class 2606 OID 6660679)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2579 (class 2606 OID 6660684)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2627 (class 2606 OID 6660924)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2626 (class 2606 OID 6660919)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 6660914)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 6660759)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2596 (class 2606 OID 6660769)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2595 (class 2606 OID 6660764)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2660 (class 2606 OID 6661089)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2613 (class 2606 OID 6660854)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2611 (class 2606 OID 6660844)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2610 (class 2606 OID 6660839)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2612 (class 2606 OID 6660849)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2576 (class 2606 OID 6660669)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2577 (class 2606 OID 6660674)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6660904)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2619 (class 2606 OID 6660884)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2632 (class 2606 OID 6660949)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2633 (class 2606 OID 6660954)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6661054)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6661059)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2655 (class 2606 OID 6661064)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2588 (class 2606 OID 6660729)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 6660724)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6660734)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2659 (class 2606 OID 6661084)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2636 (class 2606 OID 6660969)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2637 (class 2606 OID 6660974)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2650 (class 2606 OID 6661039)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 6661049)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2648 (class 2606 OID 6661029)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2651 (class 2606 OID 6661044)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2649 (class 2606 OID 6661034)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2631 (class 2606 OID 6660944)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2617 (class 2606 OID 6660874)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2616 (class 2606 OID 6660869)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2614 (class 2606 OID 6660859)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2615 (class 2606 OID 6660864)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2647 (class 2606 OID 6661024)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2646 (class 2606 OID 6661019)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 6661069)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2597 (class 2606 OID 6660774)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2638 (class 2606 OID 6660979)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2581 (class 2606 OID 6660694)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2580 (class 2606 OID 6660689)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2584 (class 2606 OID 6660709)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2585 (class 2606 OID 6660714)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6660834)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6660829)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 6660824)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 6661079)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2657 (class 2606 OID 6661074)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 16:56:53 CEST

--
-- PostgreSQL database dump complete
--

