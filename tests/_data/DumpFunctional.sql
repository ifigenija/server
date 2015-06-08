--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 15:35:02 CEST

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
-- TOC entry 180 (class 1259 OID 6617988)
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
-- TOC entry 227 (class 1259 OID 6618509)
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
-- TOC entry 226 (class 1259 OID 6618492)
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
-- TOC entry 219 (class 1259 OID 6618397)
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
-- TOC entry 194 (class 1259 OID 6618167)
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
-- TOC entry 197 (class 1259 OID 6618201)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6618110)
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
-- TOC entry 228 (class 1259 OID 6618523)
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
-- TOC entry 213 (class 1259 OID 6618327)
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
-- TOC entry 192 (class 1259 OID 6618147)
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
-- TOC entry 196 (class 1259 OID 6618195)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6618127)
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
-- TOC entry 202 (class 1259 OID 6618244)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6618269)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6618084)
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
-- TOC entry 181 (class 1259 OID 6617997)
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
-- TOC entry 182 (class 1259 OID 6618008)
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
-- TOC entry 177 (class 1259 OID 6617962)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6617981)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6618276)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6618307)
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
-- TOC entry 223 (class 1259 OID 6618443)
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
-- TOC entry 184 (class 1259 OID 6618041)
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
-- TOC entry 186 (class 1259 OID 6618076)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6618250)
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
-- TOC entry 185 (class 1259 OID 6618061)
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
-- TOC entry 191 (class 1259 OID 6618139)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6618262)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6618382)
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
-- TOC entry 222 (class 1259 OID 6618435)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6618549)
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
-- TOC entry 232 (class 1259 OID 6618577)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6618558)
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
-- TOC entry 209 (class 1259 OID 6618291)
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
-- TOC entry 201 (class 1259 OID 6618235)
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
-- TOC entry 200 (class 1259 OID 6618225)
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
-- TOC entry 221 (class 1259 OID 6618424)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6618359)
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
-- TOC entry 174 (class 1259 OID 6617933)
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
-- TOC entry 173 (class 1259 OID 6617931)
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
-- TOC entry 210 (class 1259 OID 6618301)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6617971)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6617955)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6618315)
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
-- TOC entry 204 (class 1259 OID 6618256)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6618206)
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
-- TOC entry 235 (class 1259 OID 6618596)
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
-- TOC entry 234 (class 1259 OID 6618588)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6618583)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6618369)
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
-- TOC entry 183 (class 1259 OID 6618033)
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
-- TOC entry 199 (class 1259 OID 6618212)
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
-- TOC entry 220 (class 1259 OID 6618413)
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
-- TOC entry 231 (class 1259 OID 6618566)
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
-- TOC entry 188 (class 1259 OID 6618096)
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
-- TOC entry 175 (class 1259 OID 6617942)
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
-- TOC entry 225 (class 1259 OID 6618470)
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
-- TOC entry 193 (class 1259 OID 6618158)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6618283)
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
-- TOC entry 215 (class 1259 OID 6618352)
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
-- TOC entry 195 (class 1259 OID 6618190)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6618460)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6618342)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2168 (class 2604 OID 6617936)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2778 (class 0 OID 6617988)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6618509)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-9a05-82c3-14072c7f8407	000d0000-5575-9a05-42eb-98f9449ee7f7	\N	00090000-5575-9a05-5a8c-bfbb2297b47c	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-9a05-b973-9a77b47292fe	000d0000-5575-9a05-fc36-c441649f1d02	\N	00090000-5575-9a05-372e-fb63e2d24497	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-9a05-4302-6c176e059f3a	000d0000-5575-9a05-b583-03065dc9d3c7	\N	00090000-5575-9a05-0a2e-8ed54e684420	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-9a05-8e4a-a9624e4aea28	000d0000-5575-9a05-b881-50410208eecd	\N	00090000-5575-9a05-27cb-ce34c5e4f63d	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-9a05-e46c-a9c9bb0bb5dd	000d0000-5575-9a05-bb60-08ded67634a2	\N	00090000-5575-9a05-4d89-49d86ebcc6ed	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-9a05-c7cc-3bd0acdbf7f1	000d0000-5575-9a05-6788-a043743c2a12	\N	00090000-5575-9a05-372e-fb63e2d24497	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 6618492)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6618397)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-9a05-55a6-894123c08790	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-9a05-c493-8d89b9dafecb	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-9a05-e303-54d08452d501	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2792 (class 0 OID 6618167)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-9a05-d1f9-2b5e61619a65	\N	\N	00200000-5575-9a05-47fc-33c236ab0786	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-9a05-3b87-73c3b8c1be47	\N	\N	00200000-5575-9a05-7acc-2576773175d3	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-9a05-998e-32f5c591d103	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-9a05-46bc-4152ac6d696a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-9a05-fbff-eb0b782ee59f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2795 (class 0 OID 6618201)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6618110)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-9a04-8395-f50981c7caea	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-9a04-06ec-324681546123	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-9a04-2d7c-7f66745f1d19	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-9a04-9a08-1b17689bfca6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-9a04-9147-3bfaa6773108	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-9a04-cd14-ec47a967b529	AD	AND	020	Andorra 	Andora	\N
00040000-5575-9a04-016c-ecbc144d3d67	AO	AGO	024	Angola 	Angola	\N
00040000-5575-9a04-3915-5527f2520c9f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-9a04-6826-f556d481b4c7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-9a04-178f-4db2bae5adbb	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-9a04-8fc3-5b21d0fe5b3f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-9a04-15dd-b138938cdfa8	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-9a04-5ef7-e5e025b52da0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-9a04-0309-9f98b5abda7e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-9a04-0510-aad2491875bb	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-9a04-ca9b-11a2a1604f81	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-9a04-f252-3764494984bd	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-9a04-39e8-89e6606728af	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-9a04-61b4-92d6c102af3d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-9a04-a827-080c5c3f46a0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-9a04-9c21-913700c159a2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-9a04-95a7-8803e3920227	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-9a04-a2d5-5ae7bae815fb	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-9a04-f919-ccc616f52d81	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-9a04-3d36-60a1eba5115f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-9a04-d13c-682404741c53	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-9a04-4af8-3024726953b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-9a04-2923-fa384fc76135	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-9a04-8c67-2595510539b6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-9a04-12b0-280fbcc973c7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-9a04-1007-102b4315f79b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-9a04-76ba-39b05da183ce	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-9a04-a48a-92ecbbe7b908	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-9a04-9fea-418102c5cc72	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-9a04-a2ac-512d0957afcb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-9a04-f89d-f3e5acaf7a06	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-9a04-c427-569323c76f8a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-9a04-1ac1-ffb204225f4c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-9a04-939e-18d9bb361607	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-9a04-5b23-074b576a4214	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-9a04-38a1-157072a148dc	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-9a04-db31-f893ab073686	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-9a04-4404-32a59b06ec8e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-9a04-cd65-5b4a1855ed5e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-9a04-abf6-972b3f606b54	CL	CHL	152	Chile 	Čile	\N
00040000-5575-9a04-85b4-a1e9aeb0cf4a	CN	CHN	156	China 	Kitajska	\N
00040000-5575-9a04-943a-598662f53d19	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-9a04-5726-217569a2c056	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-9a04-1e9c-5e680e0da5e8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-9a04-1424-66be5b9913ec	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-9a04-300f-bd27902751d3	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-9a04-bf9d-6f5fcc4275f0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-9a04-db28-8a55030a1a32	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-9a04-09a2-661904c046ec	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-9a04-4e70-06b84ad9dee0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-9a04-2613-f635d2c58884	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-9a04-3e88-5de4cb1c3707	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-9a04-e156-4dee2d671d08	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-9a04-0dc4-0c3941128dd4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-9a04-1a09-a33d1ec15dbd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-9a04-b319-db25a11105ed	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-9a04-b97a-09529c08d17c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-9a04-41d6-9f17c3eec8d7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-9a04-0496-51e97a35e469	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-9a04-c34c-fd74d2cdb0e7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-9a04-1fe6-d1f12bc14423	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-9a04-41e2-ca282a9c27ca	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-9a04-67dd-bb4fb3dba23e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-9a04-2e86-295a1557c0ac	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-9a04-c985-c7dc60cd2d84	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-9a04-e644-6d6efb4a2d29	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-9a04-138f-97b4ac84f387	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-9a04-b5d2-a459bb4c014e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-9a04-5c51-828477b03546	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-9a04-52ec-5e74e47f7c25	FI	FIN	246	Finland 	Finska	\N
00040000-5575-9a04-2d0d-c447f8d6bb2f	FR	FRA	250	France 	Francija	\N
00040000-5575-9a04-0c1e-ae4095015367	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-9a04-ba2e-dd49e65178f9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-9a04-f5ef-0e54a4e4fb0c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-9a04-6ebb-f1da6f101906	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-9a04-3d3e-14fb364d2a18	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-9a04-1e83-ba74bad340aa	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-9a04-c4b1-ca847dbcd068	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-9a04-9b99-b7c3c91acd74	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-9a04-f5ef-708046128e51	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-9a04-9122-6e280befa5dc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-9a04-a8bf-5d8c88cc9b38	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-9a04-2b46-8c8a7b3aa1b8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-9a04-50f8-92522e20cfc2	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-9a04-c8e7-a7b4db78f56c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-9a04-1ab8-675b6f447615	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-9a04-48ac-3c15da0de4de	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-9a04-a144-875a4d60112e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-9a04-a568-d2e6f34d1783	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-9a04-622c-3c8d8b4069ab	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-9a04-e093-9db84c65ef23	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-9a04-5684-ca5aa73dfe8d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-9a04-4634-bd83137b89d6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-9a04-f2eb-c56648b93dcb	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-9a04-e4f3-ab4bda651e53	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-9a04-6ff7-e94bbfacf46e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-9a04-176c-c44e75e415c5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-9a04-b64d-4b233fc6c5eb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-9a04-b836-95596fbdf423	IN	IND	356	India 	Indija	\N
00040000-5575-9a04-9cff-55e3c6c1b66b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-9a04-ff0a-bdfbaf3b005f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-9a04-d38f-8ce7660fb754	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-9a04-7138-8085cc7930e4	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-9a04-6221-34dae01b2091	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-9a04-e5c7-a1c976b53c71	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-9a04-04fb-b872808ee868	IT	ITA	380	Italy 	Italija	\N
00040000-5575-9a04-50d9-16be37375fa8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-9a04-15cc-1555eae4860d	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-9a04-e54d-4d0dbaaf2644	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-9a04-301f-e0773d215057	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-9a04-38ea-493650fec467	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-9a04-77ab-5beed37ef17b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-9a04-4bc7-fa9762e0263f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-9a04-9f58-dda400a4040c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-9a04-a708-3b7197a9c4e1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-9a04-ebae-9396b3901a39	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-9a04-3603-cb37ef148e39	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-9a04-c4fa-c3f5078ad401	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-9a04-ce2c-b510fe07397d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-9a04-86de-abbae969547d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-9a04-fc14-593c293ffb1f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-9a04-faac-9f2b69a91e9c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-9a04-02a7-71387f9384cd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-9a04-e698-80a116ad9d8b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-9a04-03e6-db4796a2ed78	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-9a04-78be-7d378fb86934	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-9a04-9b19-ff49925c7963	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-9a04-2a16-ca5ff3a95145	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-9a04-e365-caf36e817b7e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-9a04-6cd1-e1039fc9866c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-9a04-f1b7-e8e482d64f26	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-9a04-69ee-8b3ca5ab077a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-9a04-f248-5420fc0092a4	ML	MLI	466	Mali 	Mali	\N
00040000-5575-9a04-0c21-7a3c70e8c4ff	MT	MLT	470	Malta 	Malta	\N
00040000-5575-9a04-55af-2f294b63b9e8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-9a04-1a2b-b38056930bd3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-9a04-fa90-5aacb807cc91	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-9a04-a978-f9d89a864793	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-9a04-8bca-516204817069	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-9a04-2645-accfe374c726	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-9a04-e36d-c4da36ba3e84	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-9a04-e3ba-c0ac0ac79145	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-9a04-a988-c9db254680e7	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-9a04-f31d-5fdad8fd3c01	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-9a04-f163-27e1cbda0b2c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-9a04-2bb0-d5d4e3b2afb5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-9a04-0de5-76ead13ca342	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-9a04-9fe8-d6e25c14e742	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-9a04-3616-51cec4f43a10	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-9a04-eecb-fe9e91cc07de	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-9a04-eb26-a8751070c563	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-9a04-d546-9c1f1bee9250	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-9a04-779a-dbef5c99c0e0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-9a04-a5b2-6df3ab5f374c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-9a04-e06f-36891631ac3c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-9a04-7017-ff31f0efefec	NE	NER	562	Niger 	Niger 	\N
00040000-5575-9a04-e078-c2cc306cb119	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-9a04-dac8-9985bdd636d1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-9a04-6962-5b2440ffe380	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-9a04-cc0e-b5d67d88f267	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-9a04-485d-18aafb47848c	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-9a04-fa3a-1720c2d67627	OM	OMN	512	Oman 	Oman	\N
00040000-5575-9a04-4abc-fe0023c552f1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-9a04-a747-398b31ea7692	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-9a04-1c0a-be5e1f405551	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-9a04-fcc5-db613f302a9f	PA	PAN	591	Panama 	Panama	\N
00040000-5575-9a04-a496-8e7180d76085	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-9a04-14e9-38d766d3b39b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-9a04-22a8-5eba7e946129	PE	PER	604	Peru 	Peru	\N
00040000-5575-9a04-bb44-424af49e3b91	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-9a04-c365-89aa5b60b4bd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-9a04-1c77-67326bd2645c	PL	POL	616	Poland 	Poljska	\N
00040000-5575-9a04-b111-c7bd14e3b8fd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-9a04-5ae8-9e03bdb278ac	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-9a04-cb2c-9e0839f62522	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-9a04-80e1-e221fa1b5f66	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-9a04-542f-8ecf0554230d	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-9a04-1d15-95bfe3e8b85a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-9a04-318f-7d9e38c16cb2	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-9a04-7fbf-d10ad0eb283f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-9a04-0c4e-3c6dcefd5037	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-9a04-893c-d5a7dde29dcb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-9a04-920d-f7c098895b84	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-9a04-c177-d11991dfe47f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-9a04-61b9-4613601e1551	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-9a04-dfbb-00a813728f83	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-9a04-4b4d-fbd6fb3241c5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-9a04-ee86-3efd43e26bf4	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-9a04-637d-1a0375f9ae54	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-9a04-d9d5-da3de2d73431	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-9a04-7f52-255242048295	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-9a04-63fd-22c058325203	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-9a04-96ac-376fff96b5a5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-9a04-3bb6-6f2948e56e66	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-9a04-721a-f9897036ede3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-9a04-6008-f8fc064d51cc	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-9a04-0cd8-10d6d2bf892f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-9a04-529f-33e795ed0458	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-9a04-119c-2efe7fde22b5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-9a04-85a7-7a59dede5700	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-9a04-fb10-ebb535eb5291	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-9a04-ef65-a65dca916564	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-9a04-0a62-204dbebfe471	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-9a04-50ee-75057f201f5f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-9a04-e846-37037bc9a2cc	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-9a04-67e5-3adeec5fd1ff	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-9a04-bf54-e953b24d4abe	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-9a04-7c21-2daa7215e23c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-9a04-4e3f-c25264caa10b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-9a04-48cd-4d357d02400e	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-9a04-2647-2882528fc29c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-9a04-0ed3-a9210acaa1b2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-9a04-75a9-431fd2a66d54	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-9a04-7e9c-128658accce9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-9a04-1b5f-88e83848c305	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-9a04-3e67-3fc306bf83d8	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-9a04-f909-de4b9bdbb1a1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-9a04-0385-4d25e447f376	TG	TGO	768	Togo 	Togo	\N
00040000-5575-9a04-a698-000e755aa5a6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-9a04-79e1-21d660aa4990	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-9a04-2b62-26f06863b7b7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-9a04-12ba-28eee9ba63af	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-9a04-ea44-fff54b77eae0	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-9a04-abe4-8aa7d9fe7feb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-9a04-6b45-23e730fff3f3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-9a04-f82e-f8ceb4f473e9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-9a04-8de3-38e21c73d594	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-9a04-933f-9b7c4d6c7f26	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-9a04-c7ed-d73ff89675f9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-9a04-baec-f46662270c4c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-9a04-3afc-9f0b4e3b80fd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-9a04-96ed-eb742a8f2ecb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-9a04-661c-34a65e8a016f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-9a04-7ac1-1e9e9a97dc9d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-9a04-6ebb-b21e51af6958	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-9a04-0b9a-3762490ff86a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-9a04-f191-50235780140f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-9a04-8b40-4b47fa047d3d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-9a04-8946-b57c8a9cb974	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-9a04-9b9a-667690e9e74a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-9a04-4049-3e8a3e192850	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-9a04-239f-0974e19e270e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-9a04-3efb-d9bba5262a94	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-9a04-56c3-c3d04f8484ef	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2826 (class 0 OID 6618523)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6618327)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-9a05-e245-db1ca35b5bc6	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-9a04-6e35-bdd0dec88b67
000d0000-5575-9a05-42eb-98f9449ee7f7	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-9a04-6e35-bdd0dec88b67
000d0000-5575-9a05-fc36-c441649f1d02	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-9a04-5e7a-30d0d024d5cc
000d0000-5575-9a05-b583-03065dc9d3c7	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-9a04-ec0c-10d1dcd0205b
000d0000-5575-9a05-b881-50410208eecd	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-9a04-ec0c-10d1dcd0205b
000d0000-5575-9a05-bb60-08ded67634a2	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-9a04-ec0c-10d1dcd0205b
000d0000-5575-9a05-6788-a043743c2a12	000e0000-5575-9a05-54fe-d6ab945da4ee	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-9a04-6e35-bdd0dec88b67
\.


--
-- TOC entry 2790 (class 0 OID 6618147)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6618195)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6618127)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-9a05-13f9-ce2bda5c7eee	00080000-5575-9a05-5081-d5ad0224953f	00090000-5575-9a05-5a8c-bfbb2297b47c	AK		
\.


--
-- TOC entry 2768 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6618244)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6618269)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6618084)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-9a05-295a-cd3a06aae90c	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-9a05-7d25-f963458a63dd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-9a05-387c-8eec483e2139	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-9a05-0890-e40e909490e9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-9a05-4159-c42518608b00	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-9a05-df6d-52803cc067ee	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-9a05-9057-000ff7eaa22b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-9a05-6fd4-f4fb8cd98611	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-9a05-a26c-9e387d9e3798	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-9a05-1108-bd7e1c511345	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-9a05-1189-fcdf57677214	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-9a05-5958-0d19c4e78222	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-9a05-03a2-63f9bf986fe8	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-9a05-2629-7b07e95bf764	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-9a05-8c39-f0e1e1d46b40	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-9a05-f2a6-71482c0f2f6f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2779 (class 0 OID 6617997)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-9a05-0f0c-d4af628e2c8d	00000000-5575-9a05-4159-c42518608b00	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-9a05-ebf1-3d6e5d696c3f	00000000-5575-9a05-4159-c42518608b00	00010000-5575-9a05-b97f-8db5241be547	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-9a05-87fe-a934faf94f81	00000000-5575-9a05-df6d-52803cc067ee	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2780 (class 0 OID 6618008)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-9a05-8146-f1b38936758d	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-9a05-27cb-ce34c5e4f63d	00010000-5575-9a05-c988-e99680422fa4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-9a05-0a2e-8ed54e684420	00010000-5575-9a05-69a7-72e06a760621	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-9a05-87ad-cdbfcb71d151	00010000-5575-9a05-1241-dc7dd15c409d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-9a05-23f5-cc7b32c49d04	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-9a05-a236-ca612a939c97	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-9a05-2bf9-2cac4435495e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-9a05-ac26-611f63c5b71e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-9a05-5a8c-bfbb2297b47c	00010000-5575-9a05-67c8-58f4f9f7f560	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-9a05-372e-fb63e2d24497	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-9a05-f16f-8ee3d1fd2e1b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-9a05-4d89-49d86ebcc6ed	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-9a05-0cd3-eeed20e2c4c6	00010000-5575-9a05-057f-48ef39f11c48	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2770 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 6617962)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-9a04-286d-135ca6fee6e4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-9a04-4716-495bd329ba81	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-9a04-60ba-26bccab369ad	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-9a04-ff94-63f3df9a033f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-9a04-6e11-b65ceaef5a09	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-9a04-71d6-f40743c55b24	Abonma-read	Abonma - branje	f
00030000-5575-9a04-672f-62f97b229686	Abonma-write	Abonma - spreminjanje	f
00030000-5575-9a04-9e6c-7e1a255a8e53	Alternacija-read	Alternacija - branje	f
00030000-5575-9a04-710c-86422a7d25c1	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-9a04-eefd-16aa202f3022	Arhivalija-read	Arhivalija - branje	f
00030000-5575-9a04-9233-55c1ced49b71	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-9a04-5f3d-dfc0e690a8c7	Besedilo-read	Besedilo - branje	f
00030000-5575-9a04-2192-bf431ef962de	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-9a04-e3bd-aefa5aafda50	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-9a04-7ce2-e846611da557	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-9a04-93c5-3a5bd4f08b80	Dogodek-read	Dogodek - branje	f
00030000-5575-9a04-9f07-6a5a6ebe1489	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-9a04-5dc3-759f73f69b77	Drzava-read	Drzava - branje	f
00030000-5575-9a04-1b80-8b5cbd897f89	Drzava-write	Drzava - spreminjanje	f
00030000-5575-9a04-daa8-b87449a21191	Funkcija-read	Funkcija - branje	f
00030000-5575-9a04-e6ab-dbea0c12300a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-9a04-26af-9a42a997dac9	Gostovanje-read	Gostovanje - branje	f
00030000-5575-9a04-e5ad-a40ab5885b8f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-9a04-3ff6-7d4ba68114a6	Gostujoca-read	Gostujoca - branje	f
00030000-5575-9a04-b69e-6cdea0252073	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-9a04-fa17-6255beb4042b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-9a04-549c-7e08e40bc4b4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-9a04-2ae7-69cb8e06bc38	Kupec-read	Kupec - branje	f
00030000-5575-9a04-084e-c4a3c53bc7d8	Kupec-write	Kupec - spreminjanje	f
00030000-5575-9a04-4d44-ce8c594d8fec	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-9a04-d55a-45585c466d92	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-9a04-19f4-c7648ec0eea3	Option-read	Option - branje	f
00030000-5575-9a04-0be7-aa760e5e5e2b	Option-write	Option - spreminjanje	f
00030000-5575-9a04-45af-5a3cbd182116	OptionValue-read	OptionValue - branje	f
00030000-5575-9a04-96cc-a8d880fb1e90	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-9a04-90e6-2a47466db9af	Oseba-read	Oseba - branje	f
00030000-5575-9a04-fdfa-c2dc83d86de1	Oseba-write	Oseba - spreminjanje	f
00030000-5575-9a04-6530-97fd85797daf	Permission-read	Permission - branje	f
00030000-5575-9a04-f614-0fabaff86fad	Permission-write	Permission - spreminjanje	f
00030000-5575-9a04-f7a6-bb1fadecad6a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-9a04-7c49-f08a90ecb8c4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-9a04-72f9-357f0d0235aa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-9a04-ea42-8589e6c5e090	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-9a04-0433-346c462e8cea	Pogodba-read	Pogodba - branje	f
00030000-5575-9a04-0954-82d713f6f795	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-9a04-5a13-aa68a9b38c47	Popa-read	Popa - branje	f
00030000-5575-9a04-d496-784494288ef7	Popa-write	Popa - spreminjanje	f
00030000-5575-9a04-4739-dac5646985ed	Posta-read	Posta - branje	f
00030000-5575-9a04-2006-7b1b69ea28ea	Posta-write	Posta - spreminjanje	f
00030000-5575-9a04-596c-082d2f105070	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-9a04-a06d-7e1fd4aaea67	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-9a04-3f86-ac64398defb0	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-9a04-56f8-f245a2694601	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-9a04-1f89-84effc21b263	Predstava-read	Predstava - branje	f
00030000-5575-9a04-97da-914baa382f00	Predstava-write	Predstava - spreminjanje	f
00030000-5575-9a04-e387-e94c4252b153	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-9a04-4079-57efae80c9f7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-9a04-fd4d-3dca2a2d85e8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-9a04-a270-d08801863f56	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-9a04-9476-585fbbe0e72b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-9a04-abab-b6f4d5693d72	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-9a04-f4cc-fb3d6d56ba3c	ProgramDela-read	ProgramDela - branje	f
00030000-5575-9a04-e8e1-b23e8c9e22ad	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-9a04-135d-c0b4815c2427	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-9a04-9695-9832d3b70be4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-9a04-0d04-ac94bfdead82	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-9a04-520b-4a9e56166732	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-9a04-a0f8-6a9d9d6ac1b9	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-9a04-20d6-e0a169556d02	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-9a04-7ade-72767faba78b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-9a04-d093-da6ad1804e99	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-9a04-08f8-54be243c68bf	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-9a04-1158-93ab4cfe9dd8	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-9a04-c3b4-c93227bad25d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-9a04-73f4-ff7d2993673b	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-9a04-765b-cbfa01e1d6e7	Prostor-read	Prostor - branje	f
00030000-5575-9a04-365a-aa3b64d86503	Prostor-write	Prostor - spreminjanje	f
00030000-5575-9a04-4f42-7d391a5d2696	Racun-read	Racun - branje	f
00030000-5575-9a04-2fcb-266ce3ee8ba3	Racun-write	Racun - spreminjanje	f
00030000-5575-9a04-203e-94057c0649a1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-9a04-80b5-97cb44fc433a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-9a04-51be-dd71a3d5f53f	Readme-read	Readme - branje	f
00030000-5575-9a04-866f-2a163b7ad428	Readme-write	Readme - spreminjanje	f
00030000-5575-9a04-b031-cacdf5481b6b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-9a04-68f7-9fb65182603a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-9a04-a95a-1dee9877beed	Rekvizit-read	Rekvizit - branje	f
00030000-5575-9a04-43af-a8a4f9ee07e1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-9a04-ceac-cb2f09c2aa6b	Revizija-read	Revizija - branje	f
00030000-5575-9a04-1c65-b87be8209ad7	Revizija-write	Revizija - spreminjanje	f
00030000-5575-9a04-7c07-bcdb746d3604	Rezervacija-read	Rezervacija - branje	f
00030000-5575-9a04-465e-9cda0b8cf286	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-9a04-7cb1-95d1c218069c	Role-read	Role - branje	f
00030000-5575-9a04-921d-a9fc1fa80ded	Role-write	Role - spreminjanje	f
00030000-5575-9a04-b4e7-e6a6f347023b	SedezniRed-read	SedezniRed - branje	f
00030000-5575-9a04-b0bf-72b610215960	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-9a04-c00d-0035279f94b0	Sedez-read	Sedez - branje	f
00030000-5575-9a04-ecdb-56b7d2ae8089	Sedez-write	Sedez - spreminjanje	f
00030000-5575-9a04-7f48-fc74dbeb97a1	Sezona-read	Sezona - branje	f
00030000-5575-9a04-9cab-baf15598ddff	Sezona-write	Sezona - spreminjanje	f
00030000-5575-9a04-b9e6-fc99ed715128	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-9a04-2fd2-59e338f61286	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-9a04-dd3e-e7d3fbea7e9a	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-9a04-be83-92ecc3c35a1a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-9a04-6cc5-53cc8489ba3b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-9a04-cdc6-151d3ff1e2f5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-9a04-78ad-9b72d5f153e1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-9a04-5b15-833a8a3f46f1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-9a04-f343-0d08be427e32	Telefonska-read	Telefonska - branje	f
00030000-5575-9a04-529d-b974926184f4	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-9a04-1671-5b2c2305852f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-9a04-58cb-be9eb1b3dc96	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-9a04-a80d-129e399413f0	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-9a04-3f35-2e1797130646	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-9a04-bc62-8f3a22c9bf3a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-9a04-cfa3-f0730c8cb2ef	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-9a04-268d-409a1cacac1f	Trr-read	Trr - branje	f
00030000-5575-9a04-3068-abedbdf4fb0e	Trr-write	Trr - spreminjanje	f
00030000-5575-9a04-7e98-3655494ce994	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-9a04-443c-ed0ea9f4d063	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-9a04-bf9f-19bc6dcbbb27	User-read	User - branje	f
00030000-5575-9a04-de3f-f00157d36a37	User-write	User - spreminjanje	f
00030000-5575-9a04-02be-630cb91ec4b0	Vaja-read	Vaja - branje	f
00030000-5575-9a04-70a8-3dd6817a72c1	Vaja-write	Vaja - spreminjanje	f
00030000-5575-9a04-b076-e1c2a0287f19	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-9a04-c2eb-fc314267ee83	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-9a04-81f9-1d0eb0744aa5	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-9a04-5156-c40035b0dd6b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-9a04-1231-b7383e87dfe2	Zasedenost-read	Zasedenost - branje	f
00030000-5575-9a04-c9b8-677f8e3d1029	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-9a04-aff4-b185966b2983	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-9a04-6373-3e4e7c591a96	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-9a04-d05a-e68940120bda	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-9a04-04ae-28bdd8fe99a4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2777 (class 0 OID 6617981)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-9a04-f8ea-3a440ac04994	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-71d6-f40743c55b24
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-672f-62f97b229686
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-9e6c-7e1a255a8e53
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-710c-86422a7d25c1
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-eefd-16aa202f3022
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-93c5-3a5bd4f08b80
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-ff94-63f3df9a033f
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-9f07-6a5a6ebe1489
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-1b80-8b5cbd897f89
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-daa8-b87449a21191
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-e6ab-dbea0c12300a
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-26af-9a42a997dac9
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-e5ad-a40ab5885b8f
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-3ff6-7d4ba68114a6
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-b69e-6cdea0252073
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-fa17-6255beb4042b
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-549c-7e08e40bc4b4
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-19f4-c7648ec0eea3
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-45af-5a3cbd182116
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-90e6-2a47466db9af
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-fdfa-c2dc83d86de1
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-5a13-aa68a9b38c47
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-d496-784494288ef7
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-4739-dac5646985ed
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-2006-7b1b69ea28ea
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-3f86-ac64398defb0
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-56f8-f245a2694601
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-1f89-84effc21b263
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-97da-914baa382f00
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-9476-585fbbe0e72b
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-abab-b6f4d5693d72
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-765b-cbfa01e1d6e7
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-365a-aa3b64d86503
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-b031-cacdf5481b6b
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-68f7-9fb65182603a
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-a95a-1dee9877beed
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-43af-a8a4f9ee07e1
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-7f48-fc74dbeb97a1
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-9cab-baf15598ddff
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-a80d-129e399413f0
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-7e98-3655494ce994
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-443c-ed0ea9f4d063
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-02be-630cb91ec4b0
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-70a8-3dd6817a72c1
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-1231-b7383e87dfe2
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-c9b8-677f8e3d1029
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-aff4-b185966b2983
00020000-5575-9a04-2297-ae600db4a10f	00030000-5575-9a04-d05a-e68940120bda
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-71d6-f40743c55b24
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-eefd-16aa202f3022
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-93c5-3a5bd4f08b80
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-26af-9a42a997dac9
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-3ff6-7d4ba68114a6
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-fa17-6255beb4042b
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-549c-7e08e40bc4b4
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-19f4-c7648ec0eea3
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-45af-5a3cbd182116
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-90e6-2a47466db9af
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-fdfa-c2dc83d86de1
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-5a13-aa68a9b38c47
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-4739-dac5646985ed
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-3f86-ac64398defb0
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-56f8-f245a2694601
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-1f89-84effc21b263
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-765b-cbfa01e1d6e7
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-b031-cacdf5481b6b
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-a95a-1dee9877beed
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-7f48-fc74dbeb97a1
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-f343-0d08be427e32
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-529d-b974926184f4
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-268d-409a1cacac1f
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-3068-abedbdf4fb0e
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-81f9-1d0eb0744aa5
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-5156-c40035b0dd6b
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-aff4-b185966b2983
00020000-5575-9a04-43b3-bdb390cc6682	00030000-5575-9a04-d05a-e68940120bda
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-71d6-f40743c55b24
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-9e6c-7e1a255a8e53
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-eefd-16aa202f3022
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-9233-55c1ced49b71
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-5f3d-dfc0e690a8c7
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-e3bd-aefa5aafda50
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-93c5-3a5bd4f08b80
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-daa8-b87449a21191
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-26af-9a42a997dac9
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-3ff6-7d4ba68114a6
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-fa17-6255beb4042b
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-19f4-c7648ec0eea3
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-45af-5a3cbd182116
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-90e6-2a47466db9af
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-5a13-aa68a9b38c47
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-4739-dac5646985ed
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-1f89-84effc21b263
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-9476-585fbbe0e72b
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-765b-cbfa01e1d6e7
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-b031-cacdf5481b6b
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-a95a-1dee9877beed
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-7f48-fc74dbeb97a1
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-a80d-129e399413f0
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-02be-630cb91ec4b0
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-1231-b7383e87dfe2
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-aff4-b185966b2983
00020000-5575-9a04-8c58-a08aa68ec079	00030000-5575-9a04-d05a-e68940120bda
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-71d6-f40743c55b24
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-672f-62f97b229686
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-710c-86422a7d25c1
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-eefd-16aa202f3022
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-93c5-3a5bd4f08b80
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-26af-9a42a997dac9
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-3ff6-7d4ba68114a6
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-19f4-c7648ec0eea3
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-45af-5a3cbd182116
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-5a13-aa68a9b38c47
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-4739-dac5646985ed
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-1f89-84effc21b263
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-765b-cbfa01e1d6e7
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-b031-cacdf5481b6b
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-a95a-1dee9877beed
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-7f48-fc74dbeb97a1
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-a80d-129e399413f0
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-aff4-b185966b2983
00020000-5575-9a05-e848-8b5926ccfcf9	00030000-5575-9a04-d05a-e68940120bda
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-71d6-f40743c55b24
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-eefd-16aa202f3022
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-93c5-3a5bd4f08b80
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-5dc3-759f73f69b77
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-26af-9a42a997dac9
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-3ff6-7d4ba68114a6
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-19f4-c7648ec0eea3
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-45af-5a3cbd182116
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-5a13-aa68a9b38c47
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-4739-dac5646985ed
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-1f89-84effc21b263
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-765b-cbfa01e1d6e7
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-b031-cacdf5481b6b
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-a95a-1dee9877beed
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-7f48-fc74dbeb97a1
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-1671-5b2c2305852f
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-60ba-26bccab369ad
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-a80d-129e399413f0
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-aff4-b185966b2983
00020000-5575-9a05-2892-2eff791fb5c2	00030000-5575-9a04-d05a-e68940120bda
\.


--
-- TOC entry 2805 (class 0 OID 6618276)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6618307)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6618443)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6618041)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-9a05-5081-d5ad0224953f	00040000-5575-9a04-8395-f50981c7caea	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-9a05-5b1b-3a03aaa2c293	00040000-5575-9a04-8395-f50981c7caea	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-9a05-11db-79ca95e29068	00040000-5575-9a04-8395-f50981c7caea	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-9a05-eebe-7b2e34746fa9	00040000-5575-9a04-8395-f50981c7caea	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2784 (class 0 OID 6618076)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-9a04-8e24-dca17edb90e2	8341	Adlešiči
00050000-5575-9a04-27ec-ca9b71ad85dd	5270	Ajdovščina
00050000-5575-9a04-a7c4-648c50ea66df	6280	Ankaran/Ancarano
00050000-5575-9a04-71cd-9a1e76ccae28	9253	Apače
00050000-5575-9a04-dbb4-86259fc68d5c	8253	Artiče
00050000-5575-9a04-c532-5863573e7803	4275	Begunje na Gorenjskem
00050000-5575-9a04-3415-16f5c5b01456	1382	Begunje pri Cerknici
00050000-5575-9a04-7abe-199af1961b48	9231	Beltinci
00050000-5575-9a04-67e3-f06073da2ba8	2234	Benedikt
00050000-5575-9a04-ab14-f49cb9cf810d	2345	Bistrica ob Dravi
00050000-5575-9a04-2851-f3cbb4faed7c	3256	Bistrica ob Sotli
00050000-5575-9a04-6a07-6f79b6cb0ee7	8259	Bizeljsko
00050000-5575-9a04-3666-ee6b84f3db90	1223	Blagovica
00050000-5575-9a04-c41e-46c3339ad9ac	8283	Blanca
00050000-5575-9a04-1330-dfdc48199f52	4260	Bled
00050000-5575-9a04-f2f4-7a20bad6a533	4273	Blejska Dobrava
00050000-5575-9a04-b3c7-f9c5fcade4f5	9265	Bodonci
00050000-5575-9a04-9546-fabdadbac8fd	9222	Bogojina
00050000-5575-9a04-1850-7b7e1da87fdb	4263	Bohinjska Bela
00050000-5575-9a04-655a-13ddc0b48fd5	4264	Bohinjska Bistrica
00050000-5575-9a04-3644-b9d1d2307de6	4265	Bohinjsko jezero
00050000-5575-9a04-9b98-815abad1023c	1353	Borovnica
00050000-5575-9a04-f1c6-7758d5d94723	8294	Boštanj
00050000-5575-9a04-1629-d7e12cc0e063	5230	Bovec
00050000-5575-9a04-9fab-cf8628103575	5295	Branik
00050000-5575-9a04-2487-764aa256892a	3314	Braslovče
00050000-5575-9a04-8ee3-fad5d1a6c898	5223	Breginj
00050000-5575-9a04-8919-c1dc667deec8	8280	Brestanica
00050000-5575-9a04-22c8-19988a1b8308	2354	Bresternica
00050000-5575-9a04-e755-87d15b4c70bd	4243	Brezje
00050000-5575-9a04-14fc-551fbe4642d9	1351	Brezovica pri Ljubljani
00050000-5575-9a04-74b6-3148fecd705a	8250	Brežice
00050000-5575-9a04-c2a9-928c4131ccdb	4210	Brnik - Aerodrom
00050000-5575-9a04-13c7-33ce8d58cad4	8321	Brusnice
00050000-5575-9a04-0aa7-8125b80395fa	3255	Buče
00050000-5575-9a04-8efc-82bad64eceec	8276	Bučka 
00050000-5575-9a04-0f35-4604eb0199ff	9261	Cankova
00050000-5575-9a04-8d70-15440233b341	3000	Celje 
00050000-5575-9a04-1fdd-575410818ec9	3001	Celje - poštni predali
00050000-5575-9a04-7600-e45734d5c51b	4207	Cerklje na Gorenjskem
00050000-5575-9a04-2485-23fe55990d37	8263	Cerklje ob Krki
00050000-5575-9a04-9bf7-efc505451e89	1380	Cerknica
00050000-5575-9a04-884b-d9867d0403c3	5282	Cerkno
00050000-5575-9a04-7d5c-1d8b9d2baa9c	2236	Cerkvenjak
00050000-5575-9a04-0d7d-ae3873e4445a	2215	Ceršak
00050000-5575-9a04-334b-9bedb47354ce	2326	Cirkovce
00050000-5575-9a04-c301-f6e64a9dac3e	2282	Cirkulane
00050000-5575-9a04-009c-7dd6ce8c1429	5273	Col
00050000-5575-9a04-1157-70736f155a3a	8251	Čatež ob Savi
00050000-5575-9a04-5ecc-e20a74b6370f	1413	Čemšenik
00050000-5575-9a04-25e5-cc019647bf5f	5253	Čepovan
00050000-5575-9a04-52ef-10bf0a6fa431	9232	Črenšovci
00050000-5575-9a04-7149-786685fcf6d2	2393	Črna na Koroškem
00050000-5575-9a04-042e-e08be6a7d58b	6275	Črni Kal
00050000-5575-9a04-081d-0579d276388b	5274	Črni Vrh nad Idrijo
00050000-5575-9a04-f0c4-80e23fc705eb	5262	Črniče
00050000-5575-9a04-20d2-23f1a57d10da	8340	Črnomelj
00050000-5575-9a04-2215-a0c19cab8380	6271	Dekani
00050000-5575-9a04-4b95-6f69041e11bb	5210	Deskle
00050000-5575-9a04-1313-10446d0b9470	2253	Destrnik
00050000-5575-9a04-c6c2-13b201e9f01d	6215	Divača
00050000-5575-9a04-c910-8da526fa6c64	1233	Dob
00050000-5575-9a04-acc7-dbe6ddd96363	3224	Dobje pri Planini
00050000-5575-9a04-5efc-404363a8ead8	8257	Dobova
00050000-5575-9a04-8e45-83b3692cecc8	1423	Dobovec
00050000-5575-9a04-054f-1670b6eac6f5	5263	Dobravlje
00050000-5575-9a04-d24b-3991c16b28b7	3204	Dobrna
00050000-5575-9a04-f95f-0e1b161c42dd	8211	Dobrnič
00050000-5575-9a04-a1a5-9bc827cebd0a	1356	Dobrova
00050000-5575-9a04-2abf-d2f03ecbfe40	9223	Dobrovnik/Dobronak 
00050000-5575-9a04-c22b-56ef1847cff3	5212	Dobrovo v Brdih
00050000-5575-9a04-f12b-f1a67ef90c78	1431	Dol pri Hrastniku
00050000-5575-9a04-f31e-7ac9a812e055	1262	Dol pri Ljubljani
00050000-5575-9a04-1342-2860afd3ee27	1273	Dole pri Litiji
00050000-5575-9a04-bacb-0f949069c89c	1331	Dolenja vas
00050000-5575-9a04-3302-6300d7e80482	8350	Dolenjske Toplice
00050000-5575-9a04-b29b-f3fafc3bc6b2	1230	Domžale
00050000-5575-9a04-1ba0-a8118c3d38d4	2252	Dornava
00050000-5575-9a04-de46-b746b2a6f6d7	5294	Dornberk
00050000-5575-9a04-14c9-f6e88d7ce144	1319	Draga
00050000-5575-9a04-f570-2a59edecbf17	8343	Dragatuš
00050000-5575-9a04-43c7-82f702d8824c	3222	Dramlje
00050000-5575-9a04-e189-53bad9a0d9ba	2370	Dravograd
00050000-5575-9a04-abda-985e481ad2a8	4203	Duplje
00050000-5575-9a04-733e-5af39d1abee3	6221	Dutovlje
00050000-5575-9a04-3224-caa5f97b8627	8361	Dvor
00050000-5575-9a04-9833-0e3ec03fdc6f	2343	Fala
00050000-5575-9a04-6e3e-b6bbe7e958f9	9208	Fokovci
00050000-5575-9a04-2525-26863ee630ea	2313	Fram
00050000-5575-9a04-21da-8e7cf382287a	3213	Frankolovo
00050000-5575-9a04-60c0-ef849a771bc3	1274	Gabrovka
00050000-5575-9a04-524c-56e4f91fe154	8254	Globoko
00050000-5575-9a04-dbf1-9415625d0751	5275	Godovič
00050000-5575-9a04-8fa7-dde7ddcc116c	4204	Golnik
00050000-5575-9a04-40da-a98cc9edbb1c	3303	Gomilsko
00050000-5575-9a04-59b1-0afeb81b679d	4224	Gorenja vas
00050000-5575-9a04-b06c-bd177623bf21	3263	Gorica pri Slivnici
00050000-5575-9a04-121e-b5c30a15fd70	2272	Gorišnica
00050000-5575-9a04-2521-0caf8ef0b005	9250	Gornja Radgona
00050000-5575-9a04-5db2-4261165653e5	3342	Gornji Grad
00050000-5575-9a04-f259-faa8ad9c2ee9	4282	Gozd Martuljek
00050000-5575-9a04-2b6c-9578f56c8ae0	6272	Gračišče
00050000-5575-9a04-0572-d6c87ab36831	9264	Grad
00050000-5575-9a04-a656-0727dfe2e8cb	8332	Gradac
00050000-5575-9a04-fad3-42d69c3e612f	1384	Grahovo
00050000-5575-9a04-5f96-3c721bd8f9fc	5242	Grahovo ob Bači
00050000-5575-9a04-0085-5da09127a981	5251	Grgar
00050000-5575-9a04-4f0e-9139c5bf97a3	3302	Griže
00050000-5575-9a04-f30e-bcea6286279d	3231	Grobelno
00050000-5575-9a04-d904-192d2b2da64d	1290	Grosuplje
00050000-5575-9a04-b1b1-ab9d1d81c8e5	2288	Hajdina
00050000-5575-9a04-07ff-e1521d67311c	8362	Hinje
00050000-5575-9a04-6c29-cf3d2a0e53f9	2311	Hoče
00050000-5575-9a04-e6c1-214400312c26	9205	Hodoš/Hodos
00050000-5575-9a04-695c-4b82d717b147	1354	Horjul
00050000-5575-9a04-32a9-cfa0847ef7ad	1372	Hotedršica
00050000-5575-9a04-4214-4afa6d3d48ae	1430	Hrastnik
00050000-5575-9a04-89f1-177cd8ac96d6	6225	Hruševje
00050000-5575-9a04-ec13-1a321af8d683	4276	Hrušica
00050000-5575-9a04-0e58-93b15ef9af7e	5280	Idrija
00050000-5575-9a04-5070-0ab55830ce5d	1292	Ig
00050000-5575-9a04-e141-f9e05e54e666	6250	Ilirska Bistrica
00050000-5575-9a04-e304-df177221bde0	6251	Ilirska Bistrica-Trnovo
00050000-5575-9a04-e6a3-9fa7a4736e9c	1295	Ivančna Gorica
00050000-5575-9a04-fd25-15879548cc90	2259	Ivanjkovci
00050000-5575-9a04-67dd-113c1c64a530	1411	Izlake
00050000-5575-9a04-6b3f-95a5b20bed63	6310	Izola/Isola
00050000-5575-9a04-b0f3-9585fb216a19	2222	Jakobski Dol
00050000-5575-9a04-63ab-9a01eb138dcc	2221	Jarenina
00050000-5575-9a04-07e2-7225b2f11ce9	6254	Jelšane
00050000-5575-9a04-1194-b403595d5355	4270	Jesenice
00050000-5575-9a04-26fc-47dab13b20ef	8261	Jesenice na Dolenjskem
00050000-5575-9a04-02da-398bc4d642b7	3273	Jurklošter
00050000-5575-9a04-9b14-66a54697997e	2223	Jurovski Dol
00050000-5575-9a04-257c-056b64ba8590	2256	Juršinci
00050000-5575-9a04-589b-d0f6d0bddcfe	5214	Kal nad Kanalom
00050000-5575-9a04-6a09-4a7a6c7c327b	3233	Kalobje
00050000-5575-9a04-9e9b-c29b182220fb	4246	Kamna Gorica
00050000-5575-9a04-8ca7-5c3726550f5c	2351	Kamnica
00050000-5575-9a04-2cf0-51eb28c0f695	1241	Kamnik
00050000-5575-9a04-f4a8-37cc53ed50ce	5213	Kanal
00050000-5575-9a04-355d-5e783ac544fa	8258	Kapele
00050000-5575-9a04-32ad-9088ef62060c	2362	Kapla
00050000-5575-9a04-fa8a-f7bf8b03a11a	2325	Kidričevo
00050000-5575-9a04-33eb-b0e6c7b01351	1412	Kisovec
00050000-5575-9a04-5a80-e1296c6bc833	6253	Knežak
00050000-5575-9a04-06a1-ce5445a9f3f7	5222	Kobarid
00050000-5575-9a04-9a77-f92d14cb0af9	9227	Kobilje
00050000-5575-9a04-c91d-09a022f8541f	1330	Kočevje
00050000-5575-9a04-0fe3-8ce71224b9e7	1338	Kočevska Reka
00050000-5575-9a04-6523-13bfca0e2d78	2276	Kog
00050000-5575-9a04-6650-4af9c5f534a7	5211	Kojsko
00050000-5575-9a04-3e60-a31d83264ecb	6223	Komen
00050000-5575-9a04-c2dc-2637ad3ccae1	1218	Komenda
00050000-5575-9a04-4b4e-ff275f1839f9	6000	Koper/Capodistria 
00050000-5575-9a04-ea7a-6badc22824cb	6001	Koper/Capodistria - poštni predali
00050000-5575-9a04-5cf6-a446a4692844	8282	Koprivnica
00050000-5575-9a04-0b65-dd1aa0031c98	5296	Kostanjevica na Krasu
00050000-5575-9a04-5d9b-b4f68e77250f	8311	Kostanjevica na Krki
00050000-5575-9a04-8f1c-369cafcee6a4	1336	Kostel
00050000-5575-9a04-e1fa-d0952458f3ba	6256	Košana
00050000-5575-9a04-1e25-133e8edcfdf7	2394	Kotlje
00050000-5575-9a04-e314-1b46bce42683	6240	Kozina
00050000-5575-9a04-5376-ea4bc7824c38	3260	Kozje
00050000-5575-9a04-7dec-944fe33346f2	4000	Kranj 
00050000-5575-9a04-79be-33fd12462ca6	4001	Kranj - poštni predali
00050000-5575-9a04-4b08-95a700a2e285	4280	Kranjska Gora
00050000-5575-9a04-dcf2-d0cd2cff7095	1281	Kresnice
00050000-5575-9a04-549a-5c10f3bfb13a	4294	Križe
00050000-5575-9a04-2585-93f1e8469ea5	9206	Križevci
00050000-5575-9a04-6323-b7c396bc6b72	9242	Križevci pri Ljutomeru
00050000-5575-9a04-604c-872c3358cd9b	1301	Krka
00050000-5575-9a04-6158-f3321094bbe2	8296	Krmelj
00050000-5575-9a04-4120-063915987a7e	4245	Kropa
00050000-5575-9a04-2deb-6a0fa3d63785	8262	Krška vas
00050000-5575-9a04-40ca-a94670f69c32	8270	Krško
00050000-5575-9a04-064b-af42587b3d5f	9263	Kuzma
00050000-5575-9a04-3a94-56f92689fcd5	2318	Laporje
00050000-5575-9a04-6081-555cfa088e2f	3270	Laško
00050000-5575-9a04-d3c7-ca87311939df	1219	Laze v Tuhinju
00050000-5575-9a04-eb5c-497a1eb11e73	2230	Lenart v Slovenskih goricah
00050000-5575-9a04-b651-ba08312f6afb	9220	Lendava/Lendva
00050000-5575-9a04-59f7-d46f51995ee9	4248	Lesce
00050000-5575-9a04-a550-ae2d09fced2b	3261	Lesično
00050000-5575-9a04-e52b-a51eb6bf002b	8273	Leskovec pri Krškem
00050000-5575-9a04-ab8c-484f98f0ab23	2372	Libeliče
00050000-5575-9a04-490a-0d746e49623f	2341	Limbuš
00050000-5575-9a04-f12f-f9296c370230	1270	Litija
00050000-5575-9a04-8727-f260906ce1c0	3202	Ljubečna
00050000-5575-9a04-3e19-ff0686668dda	1000	Ljubljana 
00050000-5575-9a04-ee43-edb91be2a63a	1001	Ljubljana - poštni predali
00050000-5575-9a04-5bdb-3b40662ad83c	1231	Ljubljana - Črnuče
00050000-5575-9a04-5102-b4365708de13	1261	Ljubljana - Dobrunje
00050000-5575-9a04-74dd-3e2bd507390d	1260	Ljubljana - Polje
00050000-5575-9a04-f0e8-11cff359a05f	1210	Ljubljana - Šentvid
00050000-5575-9a04-7598-162c153143d5	1211	Ljubljana - Šmartno
00050000-5575-9a04-d533-e447a9031840	3333	Ljubno ob Savinji
00050000-5575-9a04-d506-f04c64e2f896	9240	Ljutomer
00050000-5575-9a04-fc1e-a215a7e4e3b5	3215	Loče
00050000-5575-9a04-bbb6-90c2571ff3a5	5231	Log pod Mangartom
00050000-5575-9a04-3687-a01d0126fbfe	1358	Log pri Brezovici
00050000-5575-9a04-944b-55ca642e8764	1370	Logatec
00050000-5575-9a04-9f17-a3441b70b302	1371	Logatec
00050000-5575-9a04-bf85-391de5315c15	1434	Loka pri Zidanem Mostu
00050000-5575-9a04-d8bc-891009e3e092	3223	Loka pri Žusmu
00050000-5575-9a04-d10b-f90ada7e9c0c	6219	Lokev
00050000-5575-9a04-eca3-426a7ad50ef6	1318	Loški Potok
00050000-5575-9a04-e394-1db3da8b77b8	2324	Lovrenc na Dravskem polju
00050000-5575-9a04-78c9-429cbd482739	2344	Lovrenc na Pohorju
00050000-5575-9a04-e5a4-14c3c0dae365	3334	Luče
00050000-5575-9a04-ed99-9c239c33a87f	1225	Lukovica
00050000-5575-9a04-cf65-cb25752c79b6	9202	Mačkovci
00050000-5575-9a04-b104-74eb87912f36	2322	Majšperk
00050000-5575-9a04-715f-699f910e62aa	2321	Makole
00050000-5575-9a04-a039-66cc704c3282	9243	Mala Nedelja
00050000-5575-9a04-cbf3-2e3b789efa03	2229	Malečnik
00050000-5575-9a04-546c-13f2c7b17d56	6273	Marezige
00050000-5575-9a04-072a-7a1133675888	2000	Maribor 
00050000-5575-9a04-390a-232047e07280	2001	Maribor - poštni predali
00050000-5575-9a04-a03b-6d5874cc42c6	2206	Marjeta na Dravskem polju
00050000-5575-9a04-4306-008013a6855b	2281	Markovci
00050000-5575-9a04-56bf-09d2f3506f9f	9221	Martjanci
00050000-5575-9a04-fa3e-f44ca69d98c3	6242	Materija
00050000-5575-9a04-2216-5a8b7355d98b	4211	Mavčiče
00050000-5575-9a04-33d6-971170e7d546	1215	Medvode
00050000-5575-9a04-8d43-b63e98a08891	1234	Mengeš
00050000-5575-9a04-2fca-d309915b69d3	8330	Metlika
00050000-5575-9a04-a802-9a6ab37006ce	2392	Mežica
00050000-5575-9a04-64d7-cac5b7fb5090	2204	Miklavž na Dravskem polju
00050000-5575-9a04-1bf3-c09c08e83552	2275	Miklavž pri Ormožu
00050000-5575-9a04-043d-59670477f495	5291	Miren
00050000-5575-9a04-5ec7-a243b955c4af	8233	Mirna
00050000-5575-9a04-a7ed-20d69d20f18e	8216	Mirna Peč
00050000-5575-9a04-0496-d800ca654816	2382	Mislinja
00050000-5575-9a04-2a15-4315f08e75aa	4281	Mojstrana
00050000-5575-9a04-d1a7-524a34f6d2dd	8230	Mokronog
00050000-5575-9a04-f59d-9009cc250a7c	1251	Moravče
00050000-5575-9a04-ad3f-59dbeb656abc	9226	Moravske Toplice
00050000-5575-9a04-8a7b-23e0ce883cb5	5216	Most na Soči
00050000-5575-9a04-d116-de0835a57afa	1221	Motnik
00050000-5575-9a04-b944-ab9804c301ac	3330	Mozirje
00050000-5575-9a04-0711-5479e1b0f93a	9000	Murska Sobota 
00050000-5575-9a04-06a5-e2ee27059346	9001	Murska Sobota - poštni predali
00050000-5575-9a04-2dfb-d6818e749e6d	2366	Muta
00050000-5575-9a04-edb5-1e5662e2c379	4202	Naklo
00050000-5575-9a04-7500-ad24149aa934	3331	Nazarje
00050000-5575-9a04-4346-891cd4231ec3	1357	Notranje Gorice
00050000-5575-9a04-748e-538f8e7ef57e	3203	Nova Cerkev
00050000-5575-9a04-2210-ce9d2a1bceac	5000	Nova Gorica 
00050000-5575-9a04-c419-0f01cf9c2bf3	5001	Nova Gorica - poštni predali
00050000-5575-9a04-0e46-3338d82d2f5a	1385	Nova vas
00050000-5575-9a04-c693-164c43a182ce	8000	Novo mesto
00050000-5575-9a04-5b52-675b2e6dcb5f	8001	Novo mesto - poštni predali
00050000-5575-9a04-c342-5618d10de332	6243	Obrov
00050000-5575-9a04-624c-41a845a8bb88	9233	Odranci
00050000-5575-9a04-ecb2-918af91f4e93	2317	Oplotnica
00050000-5575-9a04-2503-dcc7a654a26a	2312	Orehova vas
00050000-5575-9a04-386f-497c2a14c9ca	2270	Ormož
00050000-5575-9a04-8864-de130a097efa	1316	Ortnek
00050000-5575-9a04-b0d5-4bd21dd4c06e	1337	Osilnica
00050000-5575-9a04-a5f1-091d8835bb52	8222	Otočec
00050000-5575-9a04-ef1b-345eb60218e8	2361	Ožbalt
00050000-5575-9a04-98e0-40050e80a07a	2231	Pernica
00050000-5575-9a04-bf66-1c9f1048e7d1	2211	Pesnica pri Mariboru
00050000-5575-9a04-ac04-18b4432573ee	9203	Petrovci
00050000-5575-9a04-4528-77ef40ed5928	3301	Petrovče
00050000-5575-9a04-2f71-f97181588de9	6330	Piran/Pirano
00050000-5575-9a04-9d21-99d5337f2acb	8255	Pišece
00050000-5575-9a04-4d87-1f671eb06d87	6257	Pivka
00050000-5575-9a04-7eb9-769a57adcc8b	6232	Planina
00050000-5575-9a04-3e56-8e2eb5d49883	3225	Planina pri Sevnici
00050000-5575-9a04-fe73-d1aa9a4802eb	6276	Pobegi
00050000-5575-9a04-a26a-923e9faf70fc	8312	Podbočje
00050000-5575-9a04-efe9-850e47d463b5	5243	Podbrdo
00050000-5575-9a04-98d3-45095d240c42	3254	Podčetrtek
00050000-5575-9a04-23e2-55932168034e	2273	Podgorci
00050000-5575-9a04-0d21-51f40086596e	6216	Podgorje
00050000-5575-9a04-25db-90a1f95e4250	2381	Podgorje pri Slovenj Gradcu
00050000-5575-9a04-3265-c638542c968f	6244	Podgrad
00050000-5575-9a04-de33-f23799e27508	1414	Podkum
00050000-5575-9a04-b32d-df83e60d94fb	2286	Podlehnik
00050000-5575-9a04-f286-46d69c2156e4	5272	Podnanos
00050000-5575-9a04-ab47-c1115da04b89	4244	Podnart
00050000-5575-9a04-440a-bdfc614ab1c3	3241	Podplat
00050000-5575-9a04-01bf-72a5517fd993	3257	Podsreda
00050000-5575-9a04-91df-9dc0a6fa5a00	2363	Podvelka
00050000-5575-9a04-b03c-1bbc751688de	2208	Pohorje
00050000-5575-9a04-d33d-43f945f6f731	2257	Polenšak
00050000-5575-9a04-77d7-662bcc2c3cc9	1355	Polhov Gradec
00050000-5575-9a04-d259-ca8897b2d3c6	4223	Poljane nad Škofjo Loko
00050000-5575-9a04-32d4-8ca7d747488b	2319	Poljčane
00050000-5575-9a04-2a0b-8d5d11b34e04	1272	Polšnik
00050000-5575-9a04-012b-3cc074968ad7	3313	Polzela
00050000-5575-9a04-d717-9337a55f7739	3232	Ponikva
00050000-5575-9a04-f37f-608e363dea3f	6320	Portorož/Portorose
00050000-5575-9a04-16fa-50268e5b7f2f	6230	Postojna
00050000-5575-9a04-8b01-4a8341cfa1a0	2331	Pragersko
00050000-5575-9a04-adf5-8d861b1dfd63	3312	Prebold
00050000-5575-9a04-4fdb-13031ad974f5	4205	Preddvor
00050000-5575-9a04-7e01-73561cda8e6c	6255	Prem
00050000-5575-9a04-98b8-0793315beefe	1352	Preserje
00050000-5575-9a04-7168-957639fb6ca2	6258	Prestranek
00050000-5575-9a04-a48a-1917b423b3c9	2391	Prevalje
00050000-5575-9a04-2bfe-84950366e508	3262	Prevorje
00050000-5575-9a04-691e-9e54eed563e6	1276	Primskovo 
00050000-5575-9a04-c169-5cf7a791056b	3253	Pristava pri Mestinju
00050000-5575-9a04-072d-90d3d67ffbbc	9207	Prosenjakovci/Partosfalva
00050000-5575-9a04-d29f-128ec3841835	5297	Prvačina
00050000-5575-9a04-10a8-198753a8024a	2250	Ptuj
00050000-5575-9a04-37e9-7d79d40dbd1d	2323	Ptujska Gora
00050000-5575-9a04-e697-c8930c29a66a	9201	Puconci
00050000-5575-9a04-92c0-33d1d977ba6f	2327	Rače
00050000-5575-9a04-67f8-0232b019728d	1433	Radeče
00050000-5575-9a04-47c3-33e650d4a249	9252	Radenci
00050000-5575-9a04-0ab4-de8abec98956	2360	Radlje ob Dravi
00050000-5575-9a04-91f9-2aae43c2e30c	1235	Radomlje
00050000-5575-9a04-e3cb-5384aaad2952	4240	Radovljica
00050000-5575-9a04-67dd-70f5b7f8930c	8274	Raka
00050000-5575-9a04-1b2d-1597533aa5f5	1381	Rakek
00050000-5575-9a04-7b02-392904c7af23	4283	Rateče - Planica
00050000-5575-9a04-990c-45b330e3e4b7	2390	Ravne na Koroškem
00050000-5575-9a04-958e-c43e58d98c30	9246	Razkrižje
00050000-5575-9a04-d547-34264e27cf65	3332	Rečica ob Savinji
00050000-5575-9a04-8d55-d2442ca85e95	5292	Renče
00050000-5575-9a04-526d-f6638117863c	1310	Ribnica
00050000-5575-9a04-8739-9102826887e4	2364	Ribnica na Pohorju
00050000-5575-9a04-143c-f2ce404b2013	3272	Rimske Toplice
00050000-5575-9a04-cb61-e80ac6cc588e	1314	Rob
00050000-5575-9a04-dbc1-c94be7856318	5215	Ročinj
00050000-5575-9a04-cbc8-463a2d1ec5e3	3250	Rogaška Slatina
00050000-5575-9a04-4921-2f0766d9254a	9262	Rogašovci
00050000-5575-9a04-ac59-58a4a604f5f6	3252	Rogatec
00050000-5575-9a04-732a-5c259aadd660	1373	Rovte
00050000-5575-9a04-e619-3cf64c49923b	2342	Ruše
00050000-5575-9a04-0bdd-971b32f19cbd	1282	Sava
00050000-5575-9a04-1f54-ad4c59f22ffa	6333	Sečovlje/Sicciole
00050000-5575-9a04-3a70-004f1cb9e100	4227	Selca
00050000-5575-9a04-41e2-153c59c527ed	2352	Selnica ob Dravi
00050000-5575-9a04-6067-eeb4e11eba8d	8333	Semič
00050000-5575-9a04-3b3b-09e4da73c546	8281	Senovo
00050000-5575-9a04-51b9-191a756140dc	6224	Senožeče
00050000-5575-9a04-6f20-b2f8369c0b6b	8290	Sevnica
00050000-5575-9a04-ab98-cf86fa05544c	6210	Sežana
00050000-5575-9a04-9560-d4c3ec29490b	2214	Sladki Vrh
00050000-5575-9a04-b275-36d81c228b24	5283	Slap ob Idrijci
00050000-5575-9a04-972f-84ef546a6bad	2380	Slovenj Gradec
00050000-5575-9a04-a222-c87c2f21473f	2310	Slovenska Bistrica
00050000-5575-9a04-00d6-4a3f1ab27fa6	3210	Slovenske Konjice
00050000-5575-9a04-f233-79f4ced74ef2	1216	Smlednik
00050000-5575-9a04-4318-718508e5df99	5232	Soča
00050000-5575-9a04-037e-e465682157b4	1317	Sodražica
00050000-5575-9a04-2c13-5b3b101d8c88	3335	Solčava
00050000-5575-9a04-a3b5-4e5e6be5b1c5	5250	Solkan
00050000-5575-9a04-2ab3-2b5e80b662e9	4229	Sorica
00050000-5575-9a04-5532-7a5d61649b00	4225	Sovodenj
00050000-5575-9a04-4f6c-9ac5db9f1e6c	5281	Spodnja Idrija
00050000-5575-9a04-e0f9-d85999c65e3f	2241	Spodnji Duplek
00050000-5575-9a04-81dd-45963879686d	9245	Spodnji Ivanjci
00050000-5575-9a04-000b-ddb2b4cb5609	2277	Središče ob Dravi
00050000-5575-9a04-6ba4-f895a9bc73f5	4267	Srednja vas v Bohinju
00050000-5575-9a04-bd25-4d6b63e1d272	8256	Sromlje 
00050000-5575-9a04-5be0-a95b148e40af	5224	Srpenica
00050000-5575-9a04-f83a-54479cc72a6b	1242	Stahovica
00050000-5575-9a04-27e9-d4bb738b0d33	1332	Stara Cerkev
00050000-5575-9a04-141a-ff870e4d3b22	8342	Stari trg ob Kolpi
00050000-5575-9a04-8b4d-2c796c114aad	1386	Stari trg pri Ložu
00050000-5575-9a04-2ba7-ea4627b12012	2205	Starše
00050000-5575-9a04-5f02-863d7b64f134	2289	Stoperce
00050000-5575-9a04-fda3-949a7caed7d4	8322	Stopiče
00050000-5575-9a04-da10-1851bc1fa6e8	3206	Stranice
00050000-5575-9a04-e71b-8c176866048b	8351	Straža
00050000-5575-9a04-efe5-c497669c9855	1313	Struge
00050000-5575-9a04-a8ef-7c07c7368ddf	8293	Studenec
00050000-5575-9a04-092f-249e37ade4e1	8331	Suhor
00050000-5575-9a04-1df2-047e52845f27	2233	Sv. Ana v Slovenskih goricah
00050000-5575-9a04-2051-dc3f07573d32	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-9a04-4b79-776696fd8108	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-9a04-529a-d8cacbc924b9	9244	Sveti Jurij ob Ščavnici
00050000-5575-9a04-0858-49a202b1a9b0	3264	Sveti Štefan
00050000-5575-9a04-d42b-5e8d37f5acfd	2258	Sveti Tomaž
00050000-5575-9a04-6c15-35a425a95789	9204	Šalovci
00050000-5575-9a04-f1a9-5b5ff7b1c536	5261	Šempas
00050000-5575-9a04-4769-99e6d57d048b	5290	Šempeter pri Gorici
00050000-5575-9a04-c098-b0195717e7e6	3311	Šempeter v Savinjski dolini
00050000-5575-9a04-9429-8ab5da96dfcb	4208	Šenčur
00050000-5575-9a04-6703-4f4571d6ea46	2212	Šentilj v Slovenskih goricah
00050000-5575-9a04-ddcd-d5922c3e394f	8297	Šentjanž
00050000-5575-9a04-f4d9-2c0680107e8f	2373	Šentjanž pri Dravogradu
00050000-5575-9a04-8937-cf453c74c405	8310	Šentjernej
00050000-5575-9a04-958a-1f4926b0d586	3230	Šentjur
00050000-5575-9a04-7112-b28c5f078ee8	3271	Šentrupert
00050000-5575-9a04-fb3e-80cd2d0f1b36	8232	Šentrupert
00050000-5575-9a04-d6d6-3557c878255f	1296	Šentvid pri Stični
00050000-5575-9a04-a05f-7938ff0df2bd	8275	Škocjan
00050000-5575-9a04-d300-d9472151a712	6281	Škofije
00050000-5575-9a04-ff49-d24e42af71f2	4220	Škofja Loka
00050000-5575-9a04-465b-aeb4cb611e3f	3211	Škofja vas
00050000-5575-9a04-75b5-5e12b415c228	1291	Škofljica
00050000-5575-9a04-1157-9a14ae7870a0	6274	Šmarje
00050000-5575-9a04-7026-3bc85bf7fb87	1293	Šmarje - Sap
00050000-5575-9a04-be5a-f94e6dd9ef61	3240	Šmarje pri Jelšah
00050000-5575-9a04-8b91-b89eda18bfce	8220	Šmarješke Toplice
00050000-5575-9a04-301b-1650edc24aca	2315	Šmartno na Pohorju
00050000-5575-9a04-a931-2214a7d78b00	3341	Šmartno ob Dreti
00050000-5575-9a04-35b7-b884405ac548	3327	Šmartno ob Paki
00050000-5575-9a04-53b4-ea0171ae504a	1275	Šmartno pri Litiji
00050000-5575-9a04-3496-cf2ed5f38f88	2383	Šmartno pri Slovenj Gradcu
00050000-5575-9a04-eb10-ac71f34460fd	3201	Šmartno v Rožni dolini
00050000-5575-9a04-4d16-7f6aa8ec2218	3325	Šoštanj
00050000-5575-9a04-460d-3b91f740ac82	6222	Štanjel
00050000-5575-9a04-98dd-523291ad9054	3220	Štore
00050000-5575-9a04-0f36-5b07013b367d	3304	Tabor
00050000-5575-9a04-9ca3-74a960004d8d	3221	Teharje
00050000-5575-9a04-c039-82deedbd141b	9251	Tišina
00050000-5575-9a04-5a9e-f33be11dc4db	5220	Tolmin
00050000-5575-9a04-762d-062c065bba16	3326	Topolšica
00050000-5575-9a04-c78f-080ad10cb564	2371	Trbonje
00050000-5575-9a04-f169-6452a14a17a0	1420	Trbovlje
00050000-5575-9a04-066b-40b0334f5cb0	8231	Trebelno 
00050000-5575-9a04-c151-d320d197291b	8210	Trebnje
00050000-5575-9a04-e93e-3210f33a22ee	5252	Trnovo pri Gorici
00050000-5575-9a04-853f-29a43d4f1cf1	2254	Trnovska vas
00050000-5575-9a04-048f-f500a182ad8f	1222	Trojane
00050000-5575-9a04-08f0-245443223c56	1236	Trzin
00050000-5575-9a04-214c-36aebf2aeb1a	4290	Tržič
00050000-5575-9a04-f326-1f165b39e0b5	8295	Tržišče
00050000-5575-9a04-1d46-2d6930fc4ff2	1311	Turjak
00050000-5575-9a04-0d6c-aa8690006155	9224	Turnišče
00050000-5575-9a04-6ab9-bffb4f02b297	8323	Uršna sela
00050000-5575-9a04-ed15-5a1279aee32b	1252	Vače
00050000-5575-9a04-c0b5-8df42de89cab	3320	Velenje 
00050000-5575-9a04-2d86-3bc17a69a379	3322	Velenje - poštni predali
00050000-5575-9a04-d7b7-99e0cb55fd9a	8212	Velika Loka
00050000-5575-9a04-fe3c-676998b5f711	2274	Velika Nedelja
00050000-5575-9a04-bec0-c52d8e42ec04	9225	Velika Polana
00050000-5575-9a04-25f4-02754f0f485c	1315	Velike Lašče
00050000-5575-9a04-455a-df45784bbef2	8213	Veliki Gaber
00050000-5575-9a04-6bc0-521818ed0562	9241	Veržej
00050000-5575-9a04-00ef-59b379d4b40e	1312	Videm - Dobrepolje
00050000-5575-9a04-2dcd-20377f1ee521	2284	Videm pri Ptuju
00050000-5575-9a04-1f45-fc2953bf4400	8344	Vinica
00050000-5575-9a04-0437-ee2605f422ce	5271	Vipava
00050000-5575-9a04-7343-94540bb934f3	4212	Visoko
00050000-5575-9a04-af64-f0979f2d6340	1294	Višnja Gora
00050000-5575-9a04-6a46-693cd30de460	3205	Vitanje
00050000-5575-9a04-1b3f-131b977167f7	2255	Vitomarci
00050000-5575-9a04-9ebe-add4601417ca	1217	Vodice
00050000-5575-9a04-b98a-7ccf6215b6f8	3212	Vojnik\t
00050000-5575-9a04-8dd0-29e031eacf67	5293	Volčja Draga
00050000-5575-9a04-5563-de0b64e126e8	2232	Voličina
00050000-5575-9a04-155b-a78c2b6b9475	3305	Vransko
00050000-5575-9a04-e262-d5755c07a217	6217	Vremski Britof
00050000-5575-9a04-e7da-0273e055861a	1360	Vrhnika
00050000-5575-9a04-4734-a30e0e91f6af	2365	Vuhred
00050000-5575-9a04-3476-54b1ac1a095e	2367	Vuzenica
00050000-5575-9a04-3431-eb3eabaf2d76	8292	Zabukovje 
00050000-5575-9a04-1e80-e70f59b98a2e	1410	Zagorje ob Savi
00050000-5575-9a04-8b98-a332e1f92c60	1303	Zagradec
00050000-5575-9a04-4b06-b28bfef2af05	2283	Zavrč
00050000-5575-9a04-e9f8-1b64a0ec3262	8272	Zdole 
00050000-5575-9a04-9898-b17af41ace3d	4201	Zgornja Besnica
00050000-5575-9a04-0b9c-d817cf7cbd3a	2242	Zgornja Korena
00050000-5575-9a04-c227-8f011a9cd5c0	2201	Zgornja Kungota
00050000-5575-9a04-75d2-89a429f6c09d	2316	Zgornja Ložnica
00050000-5575-9a04-3f6d-e4977f9b0217	2314	Zgornja Polskava
00050000-5575-9a04-5746-1c2d2fa1da67	2213	Zgornja Velka
00050000-5575-9a04-ae8b-0e6c4613c8a9	4247	Zgornje Gorje
00050000-5575-9a04-e376-3b097bed057b	4206	Zgornje Jezersko
00050000-5575-9a04-50b1-15a3341a8734	2285	Zgornji Leskovec
00050000-5575-9a04-ffae-3feda51563f0	1432	Zidani Most
00050000-5575-9a04-77de-44b9c71ddd38	3214	Zreče
00050000-5575-9a04-5570-6f5831128169	4209	Žabnica
00050000-5575-9a04-9ecb-cb20f0524160	3310	Žalec
00050000-5575-9a04-bf31-ec91b6ad0dc2	4228	Železniki
00050000-5575-9a04-c7ba-b76af6fb39ab	2287	Žetale
00050000-5575-9a04-ad33-55ec53394c38	4226	Žiri
00050000-5575-9a04-b449-417a5ceff56d	4274	Žirovnica
00050000-5575-9a04-c7c4-61f0ffe75865	8360	Žužemberk
\.


--
-- TOC entry 2801 (class 0 OID 6618250)
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
-- TOC entry 2783 (class 0 OID 6618061)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6618139)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6618262)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6618382)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6618435)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-9a05-ce54-2032720717a5	00080000-5575-9a05-11db-79ca95e29068	0987	A
00190000-5575-9a05-c542-5bc32b6d06fe	00080000-5575-9a05-5b1b-3a03aaa2c293	0989	A
\.


--
-- TOC entry 2827 (class 0 OID 6618549)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6618577)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6618558)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6618291)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-9a05-44d1-a9f79cd273b8	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-9a05-cdf4-93871c1d2ca6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-9a05-d773-4a3bca1d8295	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-9a05-59ea-67423df601c8	0004	Mali oder	t	24	Mali oder 
00220000-5575-9a05-8fd5-e444d304a187	0005	Komorni oder	t	15	Komorni oder
00220000-5575-9a05-c02d-c64b7e85b111	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-9a05-6c33-a4846e270b7f	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2799 (class 0 OID 6618235)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6618225)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6618424)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6618359)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2772 (class 0 OID 6617933)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-9a05-b97f-8db5241be547	00010000-5575-9a05-85c2-29a43c418619	2015-06-08 15:35:02	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROithtD1RKjLyA5uWqdQYczZqDR.x9a6S";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2808 (class 0 OID 6618301)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2776 (class 0 OID 6617971)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-9a04-d16e-3b17197ea571	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-9a04-f8ea-3a440ac04994	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-9a04-205e-c3f46c98042d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-9a04-b5dc-c1c5f6aa5943	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-9a04-2297-ae600db4a10f	planer	Planer dogodkov v koledarju	t
00020000-5575-9a04-43b3-bdb390cc6682	kadrovska	Kadrovska služba	t
00020000-5575-9a04-8c58-a08aa68ec079	arhivar	Ažuriranje arhivalij	t
00020000-5575-9a05-e848-8b5926ccfcf9	igralec	Igralec	t
00020000-5575-9a05-2892-2eff791fb5c2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2774 (class 0 OID 6617955)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-9a05-b97f-8db5241be547	00020000-5575-9a04-205e-c3f46c98042d
00010000-5575-9a05-85c2-29a43c418619	00020000-5575-9a04-205e-c3f46c98042d
\.


--
-- TOC entry 2810 (class 0 OID 6618315)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6618256)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6618206)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6618596)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-9a04-1daa-84666c721462	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-9a04-194f-76f47e538026	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-9a04-ee71-d314f983bb46	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-9a04-b3d7-4cd65d70619c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-9a04-e831-f318dd15916c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2832 (class 0 OID 6618588)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-9a04-cb4e-90f49939b47e	00230000-5575-9a04-b3d7-4cd65d70619c	popa
00240000-5575-9a04-86ed-35f771caf09b	00230000-5575-9a04-b3d7-4cd65d70619c	oseba
00240000-5575-9a04-582a-dd8d387b88df	00230000-5575-9a04-194f-76f47e538026	prostor
00240000-5575-9a04-f1ed-77683aa3379f	00230000-5575-9a04-b3d7-4cd65d70619c	besedilo
00240000-5575-9a04-e0d2-890d1f406c22	00230000-5575-9a04-b3d7-4cd65d70619c	uprizoritev
00240000-5575-9a04-445b-bc9c53454e73	00230000-5575-9a04-b3d7-4cd65d70619c	funkcija
00240000-5575-9a04-67f1-5732938c70d9	00230000-5575-9a04-b3d7-4cd65d70619c	tipfunkcije
00240000-5575-9a04-654d-6369ccd53b64	00230000-5575-9a04-b3d7-4cd65d70619c	alternacija
00240000-5575-9a04-810e-2bc48cbbf3b3	00230000-5575-9a04-1daa-84666c721462	pogodba
00240000-5575-9a04-05cf-79fc78e685e5	00230000-5575-9a04-b3d7-4cd65d70619c	zaposlitev
\.


--
-- TOC entry 2831 (class 0 OID 6618583)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6618369)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6618033)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6618212)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-9a05-f996-d68b00b6c496	00180000-5575-9a05-d1f9-2b5e61619a65	000c0000-5575-9a05-82c3-14072c7f8407	00090000-5575-9a05-5a8c-bfbb2297b47c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-9a05-ce24-131b012f2151	00180000-5575-9a05-d1f9-2b5e61619a65	000c0000-5575-9a05-b973-9a77b47292fe	00090000-5575-9a05-372e-fb63e2d24497	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-9a05-d956-354b8241ac5d	00180000-5575-9a05-d1f9-2b5e61619a65	000c0000-5575-9a05-4302-6c176e059f3a	00090000-5575-9a05-0a2e-8ed54e684420	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-9a05-1d21-13ed45ac07cb	00180000-5575-9a05-d1f9-2b5e61619a65	000c0000-5575-9a05-8e4a-a9624e4aea28	00090000-5575-9a05-27cb-ce34c5e4f63d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-9a05-c9ca-1b10d2175e3f	00180000-5575-9a05-d1f9-2b5e61619a65	000c0000-5575-9a05-e46c-a9c9bb0bb5dd	00090000-5575-9a05-4d89-49d86ebcc6ed	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-9a05-a5cb-efe05a9e8e52	00180000-5575-9a05-998e-32f5c591d103	\N	00090000-5575-9a05-4d89-49d86ebcc6ed	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2818 (class 0 OID 6618413)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-9a04-6e35-bdd0dec88b67	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-9a04-7686-8832af4f579d	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-9a04-30f9-9466325e5f59	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-9a04-5e7a-30d0d024d5cc	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-9a04-dfbb-d5804071f5d6	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-9a04-ad4b-0b7450397ed0	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-9a04-6b57-97a83fbd4c43	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-9a04-265d-8673e8dd3547	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-9a04-913c-4f30d4f4238c	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-9a04-b12d-e73df3bfbe98	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-9a04-928a-3bfa8e90b04f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-9a04-7dcf-2618639d2918	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-9a04-7d9c-2965c89b53c2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-9a04-2890-a66728a670b8	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-9a04-a41a-6da07759da4d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-9a04-ec0c-10d1dcd0205b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2829 (class 0 OID 6618566)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6618096)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6617942)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-9a05-85c2-29a43c418619	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROyyoFTXJgIFC7gbV8RzdqXLHtUHH.qey	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-9a05-69a7-72e06a760621	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-9a05-c988-e99680422fa4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-9a05-67c8-58f4f9f7f560	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-9a05-057f-48ef39f11c48	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-9a05-1241-dc7dd15c409d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-9a05-9897-ddbd9d0ad761	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-9a05-b97f-8db5241be547	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 6618470)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-9a05-6a94-02a7ad36c504	00160000-5575-9a05-55a6-894123c08790	00150000-5575-9a04-2fa0-217d3e175044	00140000-5575-9a04-ca34-2c53a8cc5f49	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-9a05-8fd5-e444d304a187
000e0000-5575-9a05-54fe-d6ab945da4ee	00160000-5575-9a05-e303-54d08452d501	00150000-5575-9a04-30e7-770918bb3ff6	00140000-5575-9a04-e1f9-4c73d98a8506	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-9a05-c02d-c64b7e85b111
\.


--
-- TOC entry 2791 (class 0 OID 6618158)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-9a05-47fc-33c236ab0786	000e0000-5575-9a05-54fe-d6ab945da4ee	1	
00200000-5575-9a05-7acc-2576773175d3	000e0000-5575-9a05-54fe-d6ab945da4ee	2	
\.


--
-- TOC entry 2806 (class 0 OID 6618283)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6618352)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6618190)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6618460)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-9a04-ca34-2c53a8cc5f49	01	Drama	drama (SURS 01)
00140000-5575-9a04-c921-422e3810610b	02	Opera	opera (SURS 02)
00140000-5575-9a04-d23d-edd7953eca9f	03	Balet	balet (SURS 03)
00140000-5575-9a04-0f37-97cb1fc92874	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-9a04-f2dc-2bf677eecf68	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-9a04-e1f9-4c73d98a8506	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-9a04-1512-88b67f303f8b	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2812 (class 0 OID 6618342)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-9a04-480a-7a54e5f1f871	01	Opera	opera
00150000-5575-9a04-231a-baf3d2b5efe2	02	Opereta	opereta
00150000-5575-9a04-1fd2-2afc6e1f01f5	03	Balet	balet
00150000-5575-9a04-014b-b759a6849c7a	04	Plesne prireditve	plesne prireditve
00150000-5575-9a04-eeec-912bce6e695a	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-9a04-94d4-d74ceb9eb03b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-9a04-dc82-fd440d0a1fa0	07	Biografska drama	biografska drama
00150000-5575-9a04-2fa0-217d3e175044	08	Komedija	komedija
00150000-5575-9a04-65aa-e900ea453a7f	09	Črna komedija	črna komedija
00150000-5575-9a04-3134-9adf8e5dd9d1	10	E-igra	E-igra
00150000-5575-9a04-30e7-770918bb3ff6	11	Kriminalka	kriminalka
00150000-5575-9a04-4368-8fc299688c9e	12	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6617996)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6618516)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 6618506)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6618412)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6618180)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6618205)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6618122)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6618545)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6618338)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6618156)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6618199)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6618136)
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
-- TOC entry 2456 (class 2606 OID 6618248)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6618275)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6618094)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6618005)
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
-- TOC entry 2371 (class 2606 OID 6618029)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6617985)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6617970)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6618281)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6618314)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6618455)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6618058)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6618082)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6618254)
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
-- TOC entry 2386 (class 2606 OID 6618072)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6618143)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6618266)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6618394)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6618440)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6618556)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6618581)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6618563)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6618298)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6618239)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6618230)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6618434)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6618366)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6617941)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6618305)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6617959)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6617979)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6618323)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6618261)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6618211)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6618605)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6618593)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6618587)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6618379)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6618038)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6618221)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6618423)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6618576)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6618107)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6617954)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6618486)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6618165)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6618289)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6618357)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6618194)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6618468)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6618350)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6618187)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2504 (class 1259 OID 6618380)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2505 (class 1259 OID 6618381)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6618060)
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
-- TOC entry 2469 (class 1259 OID 6618282)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6618268)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6618267)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6618166)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6618339)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6618341)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6618340)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6618138)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6618137)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2522 (class 1259 OID 6618457)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2523 (class 1259 OID 6618458)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2524 (class 1259 OID 6618459)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2531 (class 1259 OID 6618491)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2532 (class 1259 OID 6618488)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2533 (class 1259 OID 6618490)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2534 (class 1259 OID 6618489)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6618109)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6618108)
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
-- TOC entry 2369 (class 1259 OID 6618032)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6618306)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6618200)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6617986)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6617987)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6618326)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6618325)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6618324)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6618144)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6618146)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6618145)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2569 (class 1259 OID 6618595)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6618234)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6618232)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6618231)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6618233)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6617960)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6617961)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6618290)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6618255)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2500 (class 1259 OID 6618367)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2501 (class 1259 OID 6618368)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 6618546)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 6618547)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2554 (class 1259 OID 6618548)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2382 (class 1259 OID 6618074)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6618073)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6618075)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2564 (class 1259 OID 6618582)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2508 (class 1259 OID 6618395)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2509 (class 1259 OID 6618396)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2544 (class 1259 OID 6618520)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2545 (class 1259 OID 6618522)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2546 (class 1259 OID 6618518)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2547 (class 1259 OID 6618521)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2548 (class 1259 OID 6618519)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2497 (class 1259 OID 6618358)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6618243)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6618242)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6618240)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6618241)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2540 (class 1259 OID 6618508)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2541 (class 1259 OID 6618507)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2555 (class 1259 OID 6618557)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6618157)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6618007)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6618006)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6618039)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6618040)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6618224)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6618223)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6618222)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2558 (class 1259 OID 6618565)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2559 (class 1259 OID 6618564)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6618189)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6618185)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6618182)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6618183)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6618181)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6618186)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6618184)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6618059)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6618123)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6618125)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6618124)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6618126)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6618249)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2527 (class 1259 OID 6618456)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6618487)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6618030)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6618031)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2494 (class 1259 OID 6618351)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6618606)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6618095)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2572 (class 1259 OID 6618594)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6618300)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6618299)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2549 (class 1259 OID 6618517)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6618083)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6618469)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6618441)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2521 (class 1259 OID 6618442)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6617980)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6618188)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2601 (class 2606 OID 6618742)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2604 (class 2606 OID 6618727)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2603 (class 2606 OID 6618732)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2599 (class 2606 OID 6618752)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6618722)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2600 (class 2606 OID 6618747)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2602 (class 2606 OID 6618737)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2635 (class 2606 OID 6618897)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6618902)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6618657)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2622 (class 2606 OID 6618837)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2620 (class 2606 OID 6618832)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2621 (class 2606 OID 6618827)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2598 (class 2606 OID 6618717)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2630 (class 2606 OID 6618867)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6618877)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2629 (class 2606 OID 6618872)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2592 (class 2606 OID 6618692)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6618687)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2618 (class 2606 OID 6618817)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6618922)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 6618927)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6618932)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2642 (class 2606 OID 6618952)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2645 (class 2606 OID 6618937)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2643 (class 2606 OID 6618947)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2644 (class 2606 OID 6618942)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2590 (class 2606 OID 6618682)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6618677)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2582 (class 2606 OID 6618642)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2583 (class 2606 OID 6618637)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2624 (class 2606 OID 6618847)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2606 (class 2606 OID 6618757)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2579 (class 2606 OID 6618617)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2578 (class 2606 OID 6618622)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2625 (class 2606 OID 6618862)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2626 (class 2606 OID 6618857)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2627 (class 2606 OID 6618852)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2596 (class 2606 OID 6618697)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2594 (class 2606 OID 6618707)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2595 (class 2606 OID 6618702)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2660 (class 2606 OID 6619027)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2610 (class 2606 OID 6618792)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2612 (class 2606 OID 6618782)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2613 (class 2606 OID 6618777)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2611 (class 2606 OID 6618787)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2577 (class 2606 OID 6618607)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2576 (class 2606 OID 6618612)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6618842)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2619 (class 2606 OID 6618822)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2633 (class 2606 OID 6618887)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2632 (class 2606 OID 6618892)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6618992)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6618997)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2653 (class 2606 OID 6619002)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2588 (class 2606 OID 6618667)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6618662)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2587 (class 2606 OID 6618672)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2659 (class 2606 OID 6619022)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 6618907)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6618912)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2650 (class 2606 OID 6618977)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6618987)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2652 (class 2606 OID 6618967)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2649 (class 2606 OID 6618982)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2651 (class 2606 OID 6618972)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2631 (class 2606 OID 6618882)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6618812)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2615 (class 2606 OID 6618807)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2617 (class 2606 OID 6618797)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2616 (class 2606 OID 6618802)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2646 (class 2606 OID 6618962)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2647 (class 2606 OID 6618957)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 6619007)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2597 (class 2606 OID 6618712)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2638 (class 2606 OID 6618917)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6618632)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2581 (class 2606 OID 6618627)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2585 (class 2606 OID 6618647)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2584 (class 2606 OID 6618652)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2607 (class 2606 OID 6618772)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6618767)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2609 (class 2606 OID 6618762)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2657 (class 2606 OID 6619017)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 6619012)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 15:35:02 CEST

--
-- PostgreSQL database dump complete
--

