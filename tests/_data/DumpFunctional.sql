--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 13:46:41 CEST

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
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6858109)
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
-- TOC entry 227 (class 1259 OID 6858631)
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
-- TOC entry 226 (class 1259 OID 6858614)
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
-- TOC entry 219 (class 1259 OID 6858518)
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
-- TOC entry 194 (class 1259 OID 6858288)
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
-- TOC entry 197 (class 1259 OID 6858322)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6858231)
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
-- TOC entry 228 (class 1259 OID 6858645)
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
-- TOC entry 213 (class 1259 OID 6858448)
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
-- TOC entry 192 (class 1259 OID 6858268)
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
-- TOC entry 196 (class 1259 OID 6858316)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6858248)
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
-- TOC entry 202 (class 1259 OID 6858365)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6858390)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6858205)
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
-- TOC entry 181 (class 1259 OID 6858118)
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
-- TOC entry 182 (class 1259 OID 6858129)
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
-- TOC entry 177 (class 1259 OID 6858083)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6858102)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6858397)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6858428)
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
-- TOC entry 223 (class 1259 OID 6858564)
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
-- TOC entry 184 (class 1259 OID 6858162)
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
-- TOC entry 186 (class 1259 OID 6858197)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6858371)
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
-- TOC entry 185 (class 1259 OID 6858182)
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
-- TOC entry 191 (class 1259 OID 6858260)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6858383)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6858503)
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
-- TOC entry 222 (class 1259 OID 6858556)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6858671)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    potrjenprogram boolean NOT NULL,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 233 (class 1259 OID 6858722)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6858684)
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
-- TOC entry 231 (class 1259 OID 6858692)
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
-- TOC entry 209 (class 1259 OID 6858412)
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
-- TOC entry 201 (class 1259 OID 6858356)
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
-- TOC entry 200 (class 1259 OID 6858346)
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
-- TOC entry 221 (class 1259 OID 6858545)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6858480)
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
-- TOC entry 174 (class 1259 OID 6858054)
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
-- TOC entry 173 (class 1259 OID 6858052)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6858422)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6858092)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6858076)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6858436)
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
-- TOC entry 204 (class 1259 OID 6858377)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6858327)
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
-- TOC entry 236 (class 1259 OID 6858741)
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
-- TOC entry 235 (class 1259 OID 6858733)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6858728)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6858490)
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
-- TOC entry 183 (class 1259 OID 6858154)
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
-- TOC entry 199 (class 1259 OID 6858333)
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
-- TOC entry 220 (class 1259 OID 6858534)
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
-- TOC entry 232 (class 1259 OID 6858711)
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
-- TOC entry 188 (class 1259 OID 6858217)
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
-- TOC entry 175 (class 1259 OID 6858063)
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
-- TOC entry 225 (class 1259 OID 6858591)
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
-- TOC entry 193 (class 1259 OID 6858279)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6858404)
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
-- TOC entry 215 (class 1259 OID 6858473)
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
-- TOC entry 195 (class 1259 OID 6858311)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6858581)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6858463)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6858057)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2803 (class 0 OID 6858109)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6858631)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5578-23a0-fcc0-9e3306467b89	000d0000-5578-23a0-50fc-23c08b0f27d9	\N	00090000-5578-23a0-7c54-2637c93d0112	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-23a0-8d4c-310b26498457	000d0000-5578-23a0-6dab-7cd6b3762c97	\N	00090000-5578-23a0-63bf-f83a5dfd465d	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-23a0-eb88-194bfd9fff19	000d0000-5578-23a0-78c1-a561f030f1c5	\N	00090000-5578-23a0-2945-88ad6fad5831	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-23a0-f6c4-b64ac967bed8	000d0000-5578-23a0-8650-58274e3b594b	\N	00090000-5578-23a0-8f29-2a653ec2e602	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-23a0-0047-9120daa9c95d	000d0000-5578-23a0-a0ea-9dd1810f8750	\N	00090000-5578-23a0-8017-4f7bd2d6c14c	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-23a0-7708-55c57eb8dd73	000d0000-5578-23a0-f177-abba62280a37	\N	00090000-5578-23a0-63bf-f83a5dfd465d	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 6858614)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6858518)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5578-23a0-d28f-03ccc755fdf0	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5578-23a0-9e49-d1d04c810d4a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5578-23a0-9e0d-ee828bf0befc	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2817 (class 0 OID 6858288)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5578-23a0-ad1c-be4ae5089e4b	\N	\N	00200000-5578-23a0-5e17-0f0e741b12c6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5578-23a0-5450-4392b0db6ccf	\N	\N	00200000-5578-23a0-6f63-9a6b6444e4b5	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5578-23a0-d8ff-a2b285d45ab8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5578-23a0-72bc-206f18154ff1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5578-23a0-e89a-754eb31cc253	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2820 (class 0 OID 6858322)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6858231)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5578-239f-b3dc-7235eb43007e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5578-239f-6fa2-01391a8be52f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5578-239f-d1a1-afab1c3cee83	AL	ALB	008	Albania 	Albanija	\N
00040000-5578-239f-17cb-f25df09f7591	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5578-239f-3bb2-d7c5d5f20001	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5578-239f-16f2-aed414ca75ba	AD	AND	020	Andorra 	Andora	\N
00040000-5578-239f-97b4-df8af1a2125e	AO	AGO	024	Angola 	Angola	\N
00040000-5578-239f-564d-11654d0ff7bc	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5578-239f-c895-4d166f602523	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5578-239f-a74d-7d493ce073af	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-239f-d13c-ddc535c994d3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5578-239f-6f46-03999eb25af8	AM	ARM	051	Armenia 	Armenija	\N
00040000-5578-239f-1dbf-aaaf440d4b66	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5578-239f-3483-6204de8d1ffc	AU	AUS	036	Australia 	Avstralija	\N
00040000-5578-239f-2412-d29537636d1b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5578-239f-dba0-70d799ed6ac6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5578-239f-01a0-8c1c56972854	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5578-239f-bf62-9470d3eeeb4f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5578-239f-260c-c56fddcc44b9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5578-239f-f9d5-3488522bb3a4	BB	BRB	052	Barbados 	Barbados	\N
00040000-5578-239f-fe7a-acea6a547188	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5578-239f-a6b4-81a2caea24e9	BE	BEL	056	Belgium 	Belgija	\N
00040000-5578-239f-586d-354e8b255275	BZ	BLZ	084	Belize 	Belize	\N
00040000-5578-239f-b284-e6e6de4438fa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5578-239f-ecb6-1d6d0595b581	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5578-239f-d819-ae62da2c022f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5578-239f-b092-c7fbe3450ee4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5578-239f-51fe-ab4272c6396d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5578-239f-5e67-4d8434b7872c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5578-239f-fadd-a4ad08d0533f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5578-239f-3a89-1d1b234a27d4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5578-239f-66d7-9200be93034f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5578-239f-67e6-13e335ae92b5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5578-239f-4877-eccc4db96dcb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5578-239f-300f-43f1520bdd4b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5578-239f-6c33-e036adcaa44e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5578-239f-1a9d-eda127327719	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5578-239f-be14-c70367de0d25	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5578-239f-791e-d5a698b0f37e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5578-239f-75ec-3eefcf92f4bd	CA	CAN	124	Canada 	Kanada	\N
00040000-5578-239f-5d12-b9d1e8470b9c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5578-239f-4a8e-edb568995f5a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5578-239f-a030-8619d76206fc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5578-239f-f556-b416932fc1f8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5578-239f-c0e3-0a735b5a08d3	CL	CHL	152	Chile 	Čile	\N
00040000-5578-239f-88bc-e3d44b7fcd54	CN	CHN	156	China 	Kitajska	\N
00040000-5578-239f-0a3d-7c54228aca28	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5578-239f-8650-7c5fa9172276	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5578-239f-4e95-ec1ab2ef2e26	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5578-239f-ffaa-5cd66f0a663d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5578-239f-58e0-3e567c96d880	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5578-239f-3c52-913a5a9b729b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5578-239f-7c2a-8e51a466fccd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5578-239f-ee99-896fb68f5e30	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5578-239f-039d-bf5449b36dfa	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5578-239f-450b-ff7dc2781dd8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5578-239f-ffff-09c00006e740	CU	CUB	192	Cuba 	Kuba	\N
00040000-5578-239f-5c50-1779e6d12997	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5578-239f-c1c1-7433a8887d27	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5578-239f-e3ef-35fe8ffd9d53	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5578-239f-c9af-d5c07f376ca3	DK	DNK	208	Denmark 	Danska	\N
00040000-5578-239f-a1f1-86f319b08fb6	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5578-239f-0549-feeedb76f921	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-239f-cfdb-501833cd32f2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5578-239f-dcae-d0311c7de6a7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5578-239f-0fd5-41dd91d20f98	EG	EGY	818	Egypt 	Egipt	\N
00040000-5578-239f-0184-1f1fcd5ce39d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5578-239f-6e1c-79d44669fabe	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5578-239f-1c91-7166cb82e2a5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5578-239f-462f-cb1e22844790	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5578-239f-c9db-4d50c62fbdbb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5578-239f-365a-f0d3aaad7e34	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5578-239f-f542-2f2de09fa585	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5578-239f-cba6-67d71702f866	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5578-239f-2e18-79ec8f4fd00c	FI	FIN	246	Finland 	Finska	\N
00040000-5578-239f-9fa6-becf02a50441	FR	FRA	250	France 	Francija	\N
00040000-5578-239f-a491-c027f905954b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5578-239f-17a3-d4fbe2dda232	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5578-239f-e9d9-498b6b8cc7bd	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5578-239f-4a15-ac891d557f53	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5578-239f-8c79-ae206d9e2996	GA	GAB	266	Gabon 	Gabon	\N
00040000-5578-239f-d917-d7ff20b74232	GM	GMB	270	Gambia 	Gambija	\N
00040000-5578-239f-5ed0-f7c269890357	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5578-239f-72b8-e1167f8c138d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5578-239f-9027-1b94bcb4c170	GH	GHA	288	Ghana 	Gana	\N
00040000-5578-239f-b26b-d5b090eb3076	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5578-239f-4d9c-2bc30df5026f	GR	GRC	300	Greece 	Grčija	\N
00040000-5578-239f-1ae9-ffda27eb07fe	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5578-239f-b281-f7f89d4dd03d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5578-239f-3599-1fff05b8cd39	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5578-239f-7b87-e30ea5317fc9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5578-239f-abf5-eb64f864c33a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5578-239f-cc8a-62efcbe915f4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5578-239f-d150-c3b4599521dc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5578-239f-1a81-4331bfaf5238	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5578-239f-8dfd-d2d24c75b7c3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5578-239f-0c16-849e5e14372a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5578-239f-a6c7-d8e658bcf4a7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5578-239f-b20a-4eff77cef06f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5578-239f-2748-b0f386cfecd0	HN	HND	340	Honduras 	Honduras	\N
00040000-5578-239f-529e-2cf053b3ba4b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5578-239f-6f03-d8694b917e5f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5578-239f-f929-6fe50e0490ed	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5578-239f-29b0-f085967f621a	IN	IND	356	India 	Indija	\N
00040000-5578-239f-c873-1d7f4093ca39	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5578-239f-1a7e-cc05f8642483	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5578-239f-fcc3-7ffea2a70fc7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5578-239f-9e33-c416a80cb195	IE	IRL	372	Ireland 	Irska	\N
00040000-5578-239f-21db-b2e666303d90	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5578-239f-1b2f-6334262b1021	IL	ISR	376	Israel 	Izrael	\N
00040000-5578-239f-cb9d-bd46133f31d2	IT	ITA	380	Italy 	Italija	\N
00040000-5578-239f-cc56-b2b1b85acea0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5578-239f-a7e3-53f94cdb9456	JP	JPN	392	Japan 	Japonska	\N
00040000-5578-239f-4455-542634055b5a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5578-239f-320b-a44d2112e944	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5578-239f-8c2f-dcb7998c4d0d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5578-239f-474e-092eaf06f8b1	KE	KEN	404	Kenya 	Kenija	\N
00040000-5578-239f-b9c1-ac41d416f067	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5578-239f-22ef-66e74a17abbb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5578-239f-a358-3b87bef01245	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5578-239f-d6b4-c90dedbbdcec	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5578-239f-a346-bdc51da61ff2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5578-239f-f3d2-4965444024fa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5578-239f-e981-486d02a33012	LV	LVA	428	Latvia 	Latvija	\N
00040000-5578-239f-d59d-8590a8494d4e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5578-239f-d8e8-225810679d4c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5578-239f-896d-46382088e912	LR	LBR	430	Liberia 	Liberija	\N
00040000-5578-239f-f35f-e543b5d9af16	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5578-239f-5c06-cc7d1bf3154a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5578-239f-e38e-0fb4edb43c84	LT	LTU	440	Lithuania 	Litva	\N
00040000-5578-239f-2936-a453c0b2edb1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5578-239f-beaf-e20725347f06	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5578-239f-ae93-042dc374ed16	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5578-239f-58de-a8c3a8066347	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5578-239f-2c3b-7c065ed9ad5c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5578-239f-98eb-7ce14675a7ff	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5578-239f-c067-4b51b4a66f9e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5578-239f-de40-e77ed375cd32	ML	MLI	466	Mali 	Mali	\N
00040000-5578-239f-4da6-51378aa28400	MT	MLT	470	Malta 	Malta	\N
00040000-5578-239f-5b10-3174cb734a5f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5578-239f-89e4-e03294785180	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5578-239f-c91e-c623794c202a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5578-239f-afe2-a49d8f7bd46b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5578-239f-78ae-a3cfd1d9aaae	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5578-239f-9d60-f733b9c0512b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5578-239f-c9d2-c46f627b910c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5578-239f-b15f-ec254103a0e3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5578-239f-1e68-3fac47605d85	MC	MCO	492	Monaco 	Monako	\N
00040000-5578-239f-6675-bb76c44e369e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5578-239f-0886-5d7a7ecdf60e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5578-239f-22be-2097e3b89194	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5578-239f-6789-498abe56e58b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5578-239f-2b28-caeadd8b87aa	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5578-239f-a56e-8915053c8a83	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5578-239f-46e2-04a8e9d6cc8b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5578-239f-9d08-425cd5c255bc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5578-239f-0142-ce64c3556c65	NP	NPL	524	Nepal 	Nepal	\N
00040000-5578-239f-e0ca-381471b7f76b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5578-239f-0d88-3ee48e4332f9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5578-239f-c939-af7fb269bcdb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5578-239f-0fdb-e0863bff4e40	NE	NER	562	Niger 	Niger 	\N
00040000-5578-239f-790a-3a31a205122a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5578-239f-ae01-1004aef5958a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5578-239f-ffe8-1f3aca9f208c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5578-239f-a2a9-a48098b1d66e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5578-239f-46bb-0794f4eb1a42	NO	NOR	578	Norway 	Norveška	\N
00040000-5578-239f-fc1a-80fbdd506b7d	OM	OMN	512	Oman 	Oman	\N
00040000-5578-239f-e390-096d138936ac	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5578-239f-ed19-325b241ade03	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5578-239f-03fe-d12c0438df57	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5578-239f-024c-82f2babc1ab4	PA	PAN	591	Panama 	Panama	\N
00040000-5578-239f-1448-635bf29358a2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5578-239f-84d6-9d2d4af61a72	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5578-239f-5fef-17c24477b56d	PE	PER	604	Peru 	Peru	\N
00040000-5578-239f-a201-c7ff1e692774	PH	PHL	608	Philippines 	Filipini	\N
00040000-5578-239f-f6a3-ca9ce26115c6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5578-239f-8180-376c7190e887	PL	POL	616	Poland 	Poljska	\N
00040000-5578-239f-293f-81da91c0246e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5578-239f-6a6d-d8499d8c42da	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5578-239f-ad42-3549506851d9	QA	QAT	634	Qatar 	Katar	\N
00040000-5578-239f-c53b-d07bb3d3be95	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5578-239f-486b-286f4999d23e	RO	ROU	642	Romania 	Romunija	\N
00040000-5578-239f-c92f-202882570af9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5578-239f-2851-8a734dfc8194	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5578-239f-9a9e-dabb3d6bf9be	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5578-239f-b4b8-5054c1afa500	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5578-239f-5519-703ef2d18e79	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5578-239f-c10a-1f347456d2f4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5578-239f-c9ce-d6a6996c83e0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5578-239f-bf6f-8bb3bac48941	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5578-239f-4712-281278f949d5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5578-239f-0962-e1d3c0bf4516	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5578-239f-1233-846aff133096	SM	SMR	674	San Marino 	San Marino	\N
00040000-5578-239f-7465-c87ed63c9a34	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5578-239f-92b0-c60926424102	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5578-239f-d27a-79e732270039	SN	SEN	686	Senegal 	Senegal	\N
00040000-5578-239f-f30a-7ab46e34faf5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5578-239f-40bf-0a7f039189de	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5578-239f-b5ee-794dda1ae913	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5578-239f-2808-571d7a034f94	SG	SGP	702	Singapore 	Singapur	\N
00040000-5578-239f-a9b7-26102d54be88	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5578-239f-8bf0-ae21bca956b7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5578-239f-198b-e81cca785a62	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5578-239f-dd38-21c1ec3f8e7c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5578-239f-5b9c-5c04b158b130	SO	SOM	706	Somalia 	Somalija	\N
00040000-5578-239f-d565-08732f8e389a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5578-239f-a4b7-af741b0ca4aa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5578-239f-8e86-59fc5f2ca102	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5578-239f-637b-f6f577a0f01b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5578-239f-84fc-b45c990ca57e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5578-239f-d4c6-5a2135523a22	SD	SDN	729	Sudan 	Sudan	\N
00040000-5578-239f-c6aa-18283efa52ac	SR	SUR	740	Suriname 	Surinam	\N
00040000-5578-239f-4cb7-fe6ab253818d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5578-239f-9979-16a3c14ef353	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5578-239f-ad6e-cd6792e0dc36	SE	SWE	752	Sweden 	Švedska	\N
00040000-5578-239f-dcbe-e4f61ac40668	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5578-239f-fc5a-0b5e6853bd0c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5578-239f-cda3-41d54707731c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5578-239f-7355-216c8817e815	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5578-239f-b913-92db60a700b4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5578-239f-b68a-0c06ba0ab973	TH	THA	764	Thailand 	Tajska	\N
00040000-5578-239f-2854-bd623a82b733	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5578-239f-b3e0-5dddb83ae425	TG	TGO	768	Togo 	Togo	\N
00040000-5578-239f-9242-2fa4375fd574	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5578-239f-5318-38d490dd1155	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5578-239f-2d04-b2deb3df4d63	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5578-239f-e3e0-1e72b2244a4f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5578-239f-7831-5cca357e572e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5578-239f-253f-3697e2911b85	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5578-239f-a87b-a7cc55e94c4e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-239f-3647-93174863bda3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5578-239f-777a-c16d1d222aab	UG	UGA	800	Uganda 	Uganda	\N
00040000-5578-239f-a7b2-2af61572397e	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5578-239f-e387-94e705478e4f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5578-239f-44d0-0c4cfc70a7ae	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5578-239f-b85c-198c3529dd2c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5578-239f-ba17-1688f9f99d83	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5578-239f-a400-c1a45a720c8e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5578-239f-4f6a-72116500c17e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5578-239f-b34c-dca5e0d5eaba	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5578-239f-be18-3dc8315ce0e8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5578-239f-32c2-d03f4f0db1ea	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5578-239f-a792-7d088deb171f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-239f-e157-1f6665a65ca9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5578-239f-65e3-13a4574a4290	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5578-239f-a859-c9c108f02d94	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5578-239f-c7a1-73057feaf53b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5578-239f-41cf-fb47c16d9e05	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5578-239f-6c73-47fb1f2aa130	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2851 (class 0 OID 6858645)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6858448)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5578-23a0-b9d5-ca1951a84bfa	000e0000-5578-23a0-9b52-c4be34498ac5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5578-239f-5ec9-69c11bc8a3b8
000d0000-5578-23a0-50fc-23c08b0f27d9	000e0000-5578-23a0-9b52-c4be34498ac5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-239f-5ec9-69c11bc8a3b8
000d0000-5578-23a0-6dab-7cd6b3762c97	000e0000-5578-23a0-9b52-c4be34498ac5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5578-239f-6bfb-3793047c3746
000d0000-5578-23a0-78c1-a561f030f1c5	000e0000-5578-23a0-9b52-c4be34498ac5	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5578-239f-5d3e-eef5ca583d33
000d0000-5578-23a0-8650-58274e3b594b	000e0000-5578-23a0-9b52-c4be34498ac5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5578-239f-5d3e-eef5ca583d33
000d0000-5578-23a0-a0ea-9dd1810f8750	000e0000-5578-23a0-9b52-c4be34498ac5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5578-239f-5d3e-eef5ca583d33
000d0000-5578-23a0-f177-abba62280a37	000e0000-5578-23a0-9b52-c4be34498ac5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-239f-5ec9-69c11bc8a3b8
\.


--
-- TOC entry 2815 (class 0 OID 6858268)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6858316)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6858248)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5578-23a0-a600-fc805829020e	00080000-5578-23a0-67cf-961769f8a6a2	00090000-5578-23a0-7c54-2637c93d0112	AK		
\.


--
-- TOC entry 2793 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6858365)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6858390)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6858205)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5578-239f-6e70-001ea1434645	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5578-239f-4cfd-eba74d7926b8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5578-239f-e682-10a9bbd7aa39	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5578-239f-70d3-282bd036e9e4	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5578-239f-34a6-e6efa5e368f2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5578-239f-dfe0-825290e69f55	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5578-239f-8137-cb8e63ebdafd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5578-239f-affb-30acfab83de6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5578-239f-3d81-a193019a51d2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5578-239f-4926-82612c502cee	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5578-239f-0ae6-d8810f253931	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5578-239f-5dae-b4178e3ede8c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5578-239f-9a27-8a8ceb19cb38	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-239f-e0be-2e8fd8b602b8	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-239f-ba60-4022482f731b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5578-239f-02f5-2fcd960bd720	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2804 (class 0 OID 6858118)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5578-239f-cb49-b588f02bca16	00000000-5578-239f-34a6-e6efa5e368f2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5578-239f-db7f-3b6d6d19c8e1	00000000-5578-239f-34a6-e6efa5e368f2	00010000-5578-239f-a786-5387cbfbdb78	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5578-239f-fef4-c2fe29f33994	00000000-5578-239f-dfe0-825290e69f55	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2805 (class 0 OID 6858129)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5578-23a0-1500-83fd83ce567b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5578-23a0-8f29-2a653ec2e602	00010000-5578-23a0-0b8f-71cbcb540d58	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5578-23a0-2945-88ad6fad5831	00010000-5578-23a0-aa0f-f2263576d895	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5578-23a0-70a5-1da478b2972f	00010000-5578-23a0-92eb-994f927a2668	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5578-23a0-9bef-c446b2c306f0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5578-23a0-1edc-01f72983c38c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5578-23a0-6bbb-a0ffce03f212	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5578-23a0-c35f-3b1cfe9d8923	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5578-23a0-7c54-2637c93d0112	00010000-5578-23a0-f5c1-4d70fa6cc701	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5578-23a0-63bf-f83a5dfd465d	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5578-23a0-1c44-d496f5e736ca	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5578-23a0-8017-4f7bd2d6c14c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5578-23a0-7dbe-7f00454d0f8a	00010000-5578-23a0-ff19-0dffe65dec7f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2795 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6858083)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5578-239f-f107-4dffefeae222	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5578-239f-2537-d5aa749fad32	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5578-239f-fbca-8198057bd47f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5578-239f-1eb6-64ebdc562760	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5578-239f-5919-962be4e4f375	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5578-239f-8b84-6ed827949326	Abonma-read	Abonma - branje	f
00030000-5578-239f-934b-8b2efef914d7	Abonma-write	Abonma - spreminjanje	f
00030000-5578-239f-c04e-2976b7663483	Alternacija-read	Alternacija - branje	f
00030000-5578-239f-1901-b006704a5ed2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5578-239f-649b-dd1522c1d66c	Arhivalija-read	Arhivalija - branje	f
00030000-5578-239f-acbf-dc6d939bdd5d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5578-239f-e1df-826bf92d78e2	Besedilo-read	Besedilo - branje	f
00030000-5578-239f-cc79-30e6ad32dd64	Besedilo-write	Besedilo - spreminjanje	f
00030000-5578-239f-cece-5e48b154f90b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5578-239f-3bdf-6ca7cf6dd5ac	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5578-239f-3c97-f553d22e357e	Dogodek-read	Dogodek - branje	f
00030000-5578-239f-1e43-b55d87f7f4e8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5578-239f-2a64-ddab3d4344ea	Drzava-read	Drzava - branje	f
00030000-5578-239f-7a2b-8cf85bf4eb5f	Drzava-write	Drzava - spreminjanje	f
00030000-5578-239f-58cf-fed3d6972887	Funkcija-read	Funkcija - branje	f
00030000-5578-239f-e977-928e873985c2	Funkcija-write	Funkcija - spreminjanje	f
00030000-5578-239f-699d-920fde0faa0a	Gostovanje-read	Gostovanje - branje	f
00030000-5578-239f-9b13-5cfa3e4d84a4	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5578-239f-29a9-adfbf9a73460	Gostujoca-read	Gostujoca - branje	f
00030000-5578-239f-d9a6-7227e3ed9e83	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5578-239f-c56d-5686f5420193	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5578-239f-82e0-1647c89e8c15	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5578-239f-cd8b-a74e8185680b	Kupec-read	Kupec - branje	f
00030000-5578-239f-0c1c-1aaf5d431f81	Kupec-write	Kupec - spreminjanje	f
00030000-5578-239f-e890-50040edf61d9	NacinPlacina-read	NacinPlacina - branje	f
00030000-5578-239f-d206-e55704f3d115	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5578-239f-fd80-a759e61d4bc0	Option-read	Option - branje	f
00030000-5578-239f-1f9f-09c0e5b0a16d	Option-write	Option - spreminjanje	f
00030000-5578-239f-9a24-75860ce2d20f	OptionValue-read	OptionValue - branje	f
00030000-5578-239f-6dc7-57c998584328	OptionValue-write	OptionValue - spreminjanje	f
00030000-5578-239f-8eff-af00faff7189	Oseba-read	Oseba - branje	f
00030000-5578-239f-4b23-28899af7bb80	Oseba-write	Oseba - spreminjanje	f
00030000-5578-239f-3d81-7fce4b228b0d	Permission-read	Permission - branje	f
00030000-5578-239f-4907-e3d39e45c81b	Permission-write	Permission - spreminjanje	f
00030000-5578-239f-ffe3-a3784540c01c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5578-239f-bb15-4e2d8d955541	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5578-239f-6309-e732fae0fbfc	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5578-239f-1be4-867b9a568a50	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5578-239f-f1cd-261318655129	Pogodba-read	Pogodba - branje	f
00030000-5578-239f-988b-a5e526387287	Pogodba-write	Pogodba - spreminjanje	f
00030000-5578-239f-de6e-b2fde6302a7f	Popa-read	Popa - branje	f
00030000-5578-239f-0291-187feb9aebd4	Popa-write	Popa - spreminjanje	f
00030000-5578-239f-04de-4cf52c04cb09	Posta-read	Posta - branje	f
00030000-5578-239f-ad8f-db93bd0988ff	Posta-write	Posta - spreminjanje	f
00030000-5578-239f-64bd-0af4ca6d7ca1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5578-239f-e299-a7da17058173	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5578-239f-cabc-233c7c3a5725	PostniNaslov-read	PostniNaslov - branje	f
00030000-5578-239f-103c-fc04102d7b45	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5578-239f-f05e-99229cfef54e	Predstava-read	Predstava - branje	f
00030000-5578-239f-ca8c-6902e1ab6bc7	Predstava-write	Predstava - spreminjanje	f
00030000-5578-239f-781e-e792dfa13983	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5578-239f-16b4-b11571db5248	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5578-239f-bb49-f4f6f55abc3d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5578-239f-5db1-3e26e0402bd0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5578-239f-c23b-96f0d4f4724c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5578-239f-96b3-b8f7b1361819	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5578-239f-1533-8d90bf25e859	ProgramDela-read	ProgramDela - branje	f
00030000-5578-239f-9aab-4638f4f65db0	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5578-239f-74dc-310c85050c81	ProgramFestival-read	ProgramFestival - branje	f
00030000-5578-239f-6272-85dff144dfb2	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5578-239f-c3e8-12a2e760f607	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5578-239f-a1a6-cd1c0b586af6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5578-239f-0c56-ff62d1098d8f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5578-239f-d3c9-c1bdf4899317	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5578-239f-99ff-9c8e8b3f13a3	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5578-239f-10fb-fc60a9cead55	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5578-239f-2061-8ba2d62566d3	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5578-239f-8d72-1a411fc98a84	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5578-239f-327d-73bd77ec5bc9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5578-239f-855f-c23dff5aa78d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5578-239f-77f0-f1736a2f5897	Prostor-read	Prostor - branje	f
00030000-5578-239f-f6a3-8446e09a7c21	Prostor-write	Prostor - spreminjanje	f
00030000-5578-239f-ed1d-69450ffee157	Racun-read	Racun - branje	f
00030000-5578-239f-f977-dc753491b776	Racun-write	Racun - spreminjanje	f
00030000-5578-239f-b128-e1dc9f836841	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5578-239f-4617-f901e45b5289	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5578-239f-b68c-d591b0ce887a	Readme-read	Readme - branje	f
00030000-5578-239f-d32f-ba589b701e0a	Readme-write	Readme - spreminjanje	f
00030000-5578-239f-71f1-20fdaee29ca9	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5578-239f-5420-32a71004ae7c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5578-239f-36b1-5a57d802b38e	Rekvizit-read	Rekvizit - branje	f
00030000-5578-239f-e98f-1c35dfe3d76b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5578-239f-5d5e-f01d76240adb	Revizija-read	Revizija - branje	f
00030000-5578-239f-26d9-ad09a56a0bf0	Revizija-write	Revizija - spreminjanje	f
00030000-5578-239f-908c-090a75fb8605	Rezervacija-read	Rezervacija - branje	f
00030000-5578-239f-13ed-802e1e79fdf2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5578-239f-85be-c6790d0ee977	Role-read	Role - branje	f
00030000-5578-239f-8dee-f00a17aa6057	Role-write	Role - spreminjanje	f
00030000-5578-239f-8876-787c186330ad	SedezniRed-read	SedezniRed - branje	f
00030000-5578-239f-8e4a-6f2376f8a199	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5578-239f-c282-6b06d674dc62	Sedez-read	Sedez - branje	f
00030000-5578-239f-34b7-3a1adabe4121	Sedez-write	Sedez - spreminjanje	f
00030000-5578-239f-1c8d-def8f116f035	Sezona-read	Sezona - branje	f
00030000-5578-239f-9217-e6e35908e9b1	Sezona-write	Sezona - spreminjanje	f
00030000-5578-239f-4c85-30b5d27bfa03	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5578-239f-91ba-95d781feae9c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5578-239f-5108-464490ddd806	Stevilcenje-read	Stevilcenje - branje	f
00030000-5578-239f-960e-ac1b27d832cf	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5578-239f-58a9-133b06ad60cd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5578-239f-8186-e42ced2ead2d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5578-239f-2985-640606f3a0e1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5578-239f-c773-756da6b8fc27	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5578-239f-841c-d471e2d786e7	Telefonska-read	Telefonska - branje	f
00030000-5578-239f-82ec-a43ed06c892d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5578-239f-d317-455215413266	TerminStoritve-read	TerminStoritve - branje	f
00030000-5578-239f-b674-5ba04461b904	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5578-239f-6e72-59b8f6b47f8c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5578-239f-c036-06010b71906a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5578-239f-81a3-3f23784b1328	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5578-239f-66f8-e676b38e2ef2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5578-239f-90ab-a53f68bf7e20	Trr-read	Trr - branje	f
00030000-5578-239f-8f57-9e8960488eaa	Trr-write	Trr - spreminjanje	f
00030000-5578-239f-23c3-e155016033f4	Uprizoritev-read	Uprizoritev - branje	f
00030000-5578-239f-dfd9-2239b06282e5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5578-239f-76f4-dfce5bf7b150	User-read	User - branje	f
00030000-5578-239f-a2fd-cfb7b0ed3a6c	User-write	User - spreminjanje	f
00030000-5578-239f-aeec-bba19ff7dec6	Vaja-read	Vaja - branje	f
00030000-5578-239f-8163-9ed4e9a7cb12	Vaja-write	Vaja - spreminjanje	f
00030000-5578-239f-8ae3-d5565f011a86	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5578-239f-0dcb-6d7b36bdbf6f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5578-239f-c98f-d56a43877ab7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5578-239f-e351-76a1196e8ce8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5578-239f-3925-3dba928f2454	Zasedenost-read	Zasedenost - branje	f
00030000-5578-239f-43fa-20e318520a87	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5578-239f-6368-7a349bb803cc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5578-239f-b2df-b17cb4da9e1a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5578-239f-66f5-5a227b01ea55	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5578-239f-52d6-f3227a6f6c1c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2802 (class 0 OID 6858102)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5578-239f-9996-10dbef63dfe4	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-8b84-6ed827949326
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-934b-8b2efef914d7
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-c04e-2976b7663483
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-1901-b006704a5ed2
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-649b-dd1522c1d66c
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-3c97-f553d22e357e
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-1eb6-64ebdc562760
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-1e43-b55d87f7f4e8
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-7a2b-8cf85bf4eb5f
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-58cf-fed3d6972887
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-e977-928e873985c2
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-699d-920fde0faa0a
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-9b13-5cfa3e4d84a4
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-29a9-adfbf9a73460
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-d9a6-7227e3ed9e83
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-c56d-5686f5420193
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-82e0-1647c89e8c15
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-fd80-a759e61d4bc0
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-9a24-75860ce2d20f
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-8eff-af00faff7189
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-4b23-28899af7bb80
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-de6e-b2fde6302a7f
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-0291-187feb9aebd4
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-04de-4cf52c04cb09
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-ad8f-db93bd0988ff
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-cabc-233c7c3a5725
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-103c-fc04102d7b45
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-f05e-99229cfef54e
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-ca8c-6902e1ab6bc7
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-c23b-96f0d4f4724c
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-96b3-b8f7b1361819
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-77f0-f1736a2f5897
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-f6a3-8446e09a7c21
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-71f1-20fdaee29ca9
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-5420-32a71004ae7c
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-36b1-5a57d802b38e
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-e98f-1c35dfe3d76b
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-1c8d-def8f116f035
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-9217-e6e35908e9b1
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-6e72-59b8f6b47f8c
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-23c3-e155016033f4
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-dfd9-2239b06282e5
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-aeec-bba19ff7dec6
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-8163-9ed4e9a7cb12
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-3925-3dba928f2454
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-43fa-20e318520a87
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-6368-7a349bb803cc
00020000-5578-239f-89c4-7af6884c5d4c	00030000-5578-239f-66f5-5a227b01ea55
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-8b84-6ed827949326
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-649b-dd1522c1d66c
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-3c97-f553d22e357e
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-699d-920fde0faa0a
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-29a9-adfbf9a73460
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-c56d-5686f5420193
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-82e0-1647c89e8c15
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-fd80-a759e61d4bc0
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-9a24-75860ce2d20f
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-8eff-af00faff7189
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-4b23-28899af7bb80
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-de6e-b2fde6302a7f
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-04de-4cf52c04cb09
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-cabc-233c7c3a5725
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-103c-fc04102d7b45
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-f05e-99229cfef54e
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-77f0-f1736a2f5897
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-71f1-20fdaee29ca9
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-36b1-5a57d802b38e
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-1c8d-def8f116f035
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-841c-d471e2d786e7
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-82ec-a43ed06c892d
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-90ab-a53f68bf7e20
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-8f57-9e8960488eaa
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-c98f-d56a43877ab7
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-e351-76a1196e8ce8
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-6368-7a349bb803cc
00020000-5578-239f-b0e0-2a073cec9939	00030000-5578-239f-66f5-5a227b01ea55
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-8b84-6ed827949326
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-c04e-2976b7663483
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-649b-dd1522c1d66c
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-acbf-dc6d939bdd5d
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-e1df-826bf92d78e2
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-cece-5e48b154f90b
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-3c97-f553d22e357e
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-58cf-fed3d6972887
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-699d-920fde0faa0a
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-29a9-adfbf9a73460
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-c56d-5686f5420193
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-fd80-a759e61d4bc0
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-9a24-75860ce2d20f
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-8eff-af00faff7189
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-de6e-b2fde6302a7f
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-04de-4cf52c04cb09
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-f05e-99229cfef54e
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-c23b-96f0d4f4724c
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-77f0-f1736a2f5897
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-71f1-20fdaee29ca9
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-36b1-5a57d802b38e
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-1c8d-def8f116f035
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-6e72-59b8f6b47f8c
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-aeec-bba19ff7dec6
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-3925-3dba928f2454
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-6368-7a349bb803cc
00020000-5578-239f-9849-18e05e2865e2	00030000-5578-239f-66f5-5a227b01ea55
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-8b84-6ed827949326
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-934b-8b2efef914d7
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-1901-b006704a5ed2
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-649b-dd1522c1d66c
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-3c97-f553d22e357e
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-699d-920fde0faa0a
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-29a9-adfbf9a73460
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-fd80-a759e61d4bc0
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-9a24-75860ce2d20f
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-de6e-b2fde6302a7f
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-04de-4cf52c04cb09
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-f05e-99229cfef54e
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-77f0-f1736a2f5897
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-71f1-20fdaee29ca9
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-36b1-5a57d802b38e
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-1c8d-def8f116f035
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-6e72-59b8f6b47f8c
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-6368-7a349bb803cc
00020000-5578-239f-fea3-ead7ed2d3d4d	00030000-5578-239f-66f5-5a227b01ea55
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-8b84-6ed827949326
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-649b-dd1522c1d66c
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-3c97-f553d22e357e
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-2a64-ddab3d4344ea
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-699d-920fde0faa0a
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-29a9-adfbf9a73460
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-fd80-a759e61d4bc0
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-9a24-75860ce2d20f
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-de6e-b2fde6302a7f
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-04de-4cf52c04cb09
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-f05e-99229cfef54e
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-77f0-f1736a2f5897
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-71f1-20fdaee29ca9
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-36b1-5a57d802b38e
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-1c8d-def8f116f035
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-d317-455215413266
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-fbca-8198057bd47f
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-6e72-59b8f6b47f8c
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-6368-7a349bb803cc
00020000-5578-239f-e7e1-c0cc06e518dc	00030000-5578-239f-66f5-5a227b01ea55
\.


--
-- TOC entry 2830 (class 0 OID 6858397)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6858428)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6858564)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6858162)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5578-23a0-67cf-961769f8a6a2	00040000-5578-239f-b3dc-7235eb43007e	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-23a0-0c5a-98e70f1c2079	00040000-5578-239f-b3dc-7235eb43007e	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-23a0-3cf5-ad585aecfe43	00040000-5578-239f-b3dc-7235eb43007e	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-23a0-1750-a498d948bc5b	00040000-5578-239f-b3dc-7235eb43007e	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2809 (class 0 OID 6858197)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5578-239e-2a49-9e0fcaa9ec97	8341	Adlešiči
00050000-5578-239e-6dd1-52703406795f	5270	Ajdovščina
00050000-5578-239e-329b-f9e04012bb6c	6280	Ankaran/Ancarano
00050000-5578-239e-4273-0d6ec5a9f72a	9253	Apače
00050000-5578-239e-29df-00c28ed1f985	8253	Artiče
00050000-5578-239e-c375-ea8e36697049	4275	Begunje na Gorenjskem
00050000-5578-239e-36ad-3f8c946981ea	1382	Begunje pri Cerknici
00050000-5578-239e-8442-88d6732af749	9231	Beltinci
00050000-5578-239e-41fb-1772e544d261	2234	Benedikt
00050000-5578-239e-e2dd-fc87ed881c24	2345	Bistrica ob Dravi
00050000-5578-239e-b1c7-5364a3eeb709	3256	Bistrica ob Sotli
00050000-5578-239e-f8af-4075079ec9c2	8259	Bizeljsko
00050000-5578-239e-6e12-077f32c40f2a	1223	Blagovica
00050000-5578-239e-1869-28019367a8cf	8283	Blanca
00050000-5578-239e-5547-5624af8a3910	4260	Bled
00050000-5578-239e-4ed8-f8a4a95fd1be	4273	Blejska Dobrava
00050000-5578-239e-2951-a311055a5e07	9265	Bodonci
00050000-5578-239e-e10f-2023f6f55c57	9222	Bogojina
00050000-5578-239e-23c3-876ddcf6f15e	4263	Bohinjska Bela
00050000-5578-239e-c3a9-aaedb903b622	4264	Bohinjska Bistrica
00050000-5578-239e-8320-798f04ec8c35	4265	Bohinjsko jezero
00050000-5578-239e-1441-d7b4a49995cd	1353	Borovnica
00050000-5578-239e-4e1f-ded92f2bb2b6	8294	Boštanj
00050000-5578-239e-3a53-6b95f79d3747	5230	Bovec
00050000-5578-239e-6e98-9462df3ac6fb	5295	Branik
00050000-5578-239e-3f76-45748256e21e	3314	Braslovče
00050000-5578-239e-d78d-5717f491bafb	5223	Breginj
00050000-5578-239e-0e24-66a1ed73a8b1	8280	Brestanica
00050000-5578-239e-f8ec-0443affc8aac	2354	Bresternica
00050000-5578-239e-9138-c7c84e6ca968	4243	Brezje
00050000-5578-239e-bbb5-374db47bb04a	1351	Brezovica pri Ljubljani
00050000-5578-239e-c53c-6fc9628cb781	8250	Brežice
00050000-5578-239e-fb24-7032f882e9f7	4210	Brnik - Aerodrom
00050000-5578-239e-4ea2-3d45481bef6c	8321	Brusnice
00050000-5578-239e-f6e9-ee4e105478a5	3255	Buče
00050000-5578-239e-91b7-f75c5c5ed8ec	8276	Bučka 
00050000-5578-239e-ca1e-4128cdec0cc3	9261	Cankova
00050000-5578-239e-1125-7ed4bef16d87	3000	Celje 
00050000-5578-239e-dbd8-52f1340fc718	3001	Celje - poštni predali
00050000-5578-239e-8ded-7e2a69b608c3	4207	Cerklje na Gorenjskem
00050000-5578-239e-343a-b49c230b3caf	8263	Cerklje ob Krki
00050000-5578-239e-be40-012283b2b315	1380	Cerknica
00050000-5578-239e-6cc8-12e3a4b8a689	5282	Cerkno
00050000-5578-239e-089e-cdcc12deb59e	2236	Cerkvenjak
00050000-5578-239e-51eb-fbb5579aa148	2215	Ceršak
00050000-5578-239e-1ee7-748ec1a02cac	2326	Cirkovce
00050000-5578-239e-79fb-747bc3de6b5f	2282	Cirkulane
00050000-5578-239e-5916-008ef8ed28b9	5273	Col
00050000-5578-239e-0d64-545c33b507a2	8251	Čatež ob Savi
00050000-5578-239e-14b6-e8c08181c166	1413	Čemšenik
00050000-5578-239e-7ad6-49e339bcf96a	5253	Čepovan
00050000-5578-239e-f174-f9c92c3129b1	9232	Črenšovci
00050000-5578-239e-aa0a-6c4dd91b23e8	2393	Črna na Koroškem
00050000-5578-239e-fcc1-f12a1f8c21cd	6275	Črni Kal
00050000-5578-239e-c5ec-38bf89c1d061	5274	Črni Vrh nad Idrijo
00050000-5578-239e-c169-a15e09fc0e55	5262	Črniče
00050000-5578-239e-e7b4-b9df6afe1a04	8340	Črnomelj
00050000-5578-239e-70dc-b5df24279ce0	6271	Dekani
00050000-5578-239e-68f3-1256b7257263	5210	Deskle
00050000-5578-239e-1017-3aa5b6767966	2253	Destrnik
00050000-5578-239e-12d7-1486370c92c7	6215	Divača
00050000-5578-239e-4213-31acc206ec03	1233	Dob
00050000-5578-239e-52a8-64656cdb49da	3224	Dobje pri Planini
00050000-5578-239e-1586-0baa05865f14	8257	Dobova
00050000-5578-239e-21b5-c1e4b107a7ea	1423	Dobovec
00050000-5578-239e-921f-9e31d5e81cce	5263	Dobravlje
00050000-5578-239e-e0c4-818338a6e080	3204	Dobrna
00050000-5578-239e-db93-c56704d83f7b	8211	Dobrnič
00050000-5578-239e-3296-cef8ba2ee95d	1356	Dobrova
00050000-5578-239e-cab3-93747d6603fb	9223	Dobrovnik/Dobronak 
00050000-5578-239e-cdd5-6a4fc71611e7	5212	Dobrovo v Brdih
00050000-5578-239e-518e-f4ce2606532c	1431	Dol pri Hrastniku
00050000-5578-239e-dec4-9da88e0bb380	1262	Dol pri Ljubljani
00050000-5578-239e-08ec-ce3ece133623	1273	Dole pri Litiji
00050000-5578-239e-6aa2-c4a48112c58f	1331	Dolenja vas
00050000-5578-239e-10ab-86f1dbd9813a	8350	Dolenjske Toplice
00050000-5578-239e-18ad-e4780a3e371a	1230	Domžale
00050000-5578-239e-907f-01551149fe78	2252	Dornava
00050000-5578-239e-3dac-967b08f6793a	5294	Dornberk
00050000-5578-239e-aa57-ae89771e9492	1319	Draga
00050000-5578-239e-f7d2-5ce62ec6ce6c	8343	Dragatuš
00050000-5578-239e-fc7b-4f8b9faa26bb	3222	Dramlje
00050000-5578-239e-030e-1d61ada3bd0f	2370	Dravograd
00050000-5578-239e-59a3-19e4d038cc4f	4203	Duplje
00050000-5578-239e-a1a9-00cde96c504d	6221	Dutovlje
00050000-5578-239e-8115-c961a5dfc37e	8361	Dvor
00050000-5578-239e-3517-2e3158dd9663	2343	Fala
00050000-5578-239e-1a08-74887993cbbb	9208	Fokovci
00050000-5578-239e-5fda-b182593c3ed4	2313	Fram
00050000-5578-239e-ff8b-c3f113665abb	3213	Frankolovo
00050000-5578-239e-af55-74399a65acfb	1274	Gabrovka
00050000-5578-239e-1a35-fc7c7542313c	8254	Globoko
00050000-5578-239e-6312-16ddd648a02a	5275	Godovič
00050000-5578-239e-118e-3dcca5ef0dee	4204	Golnik
00050000-5578-239e-f432-bbb1da8591eb	3303	Gomilsko
00050000-5578-239e-2fe7-73c0a6df802a	4224	Gorenja vas
00050000-5578-239e-f63f-6ff5cdd2b172	3263	Gorica pri Slivnici
00050000-5578-239e-06c8-3b32a4c08eba	2272	Gorišnica
00050000-5578-239e-079a-293e4101a185	9250	Gornja Radgona
00050000-5578-239e-3a7e-720b584d974e	3342	Gornji Grad
00050000-5578-239e-fa35-fd61a5de8d6a	4282	Gozd Martuljek
00050000-5578-239e-33a8-885c1aa84506	6272	Gračišče
00050000-5578-239e-3efd-9672051b833c	9264	Grad
00050000-5578-239e-5c0c-a3afb0cb768f	8332	Gradac
00050000-5578-239e-d9ca-dc88e33e3d66	1384	Grahovo
00050000-5578-239e-9319-e3eb52582fa8	5242	Grahovo ob Bači
00050000-5578-239e-177f-21120ab0f936	5251	Grgar
00050000-5578-239e-9e5e-bbcc07d722ab	3302	Griže
00050000-5578-239e-a781-87331bec3898	3231	Grobelno
00050000-5578-239e-b189-c15c90def13a	1290	Grosuplje
00050000-5578-239e-7d5e-3d8ebba28330	2288	Hajdina
00050000-5578-239e-9eb2-244f609a8a83	8362	Hinje
00050000-5578-239e-14e8-4163aaf7f8c2	2311	Hoče
00050000-5578-239e-5529-fefcfa8d8bfb	9205	Hodoš/Hodos
00050000-5578-239e-7ad0-867ab5cdffcd	1354	Horjul
00050000-5578-239e-6e9f-771c7e258f59	1372	Hotedršica
00050000-5578-239e-86d6-6dba9fec639e	1430	Hrastnik
00050000-5578-239e-e031-bc5a255e6b7a	6225	Hruševje
00050000-5578-239e-5183-5b12af3f0ab1	4276	Hrušica
00050000-5578-239e-affb-d01621dfb35c	5280	Idrija
00050000-5578-239e-d263-7ef65be29f65	1292	Ig
00050000-5578-239e-febf-6fceea19b43c	6250	Ilirska Bistrica
00050000-5578-239e-ad52-71c55bd7c6ed	6251	Ilirska Bistrica-Trnovo
00050000-5578-239e-6dfe-b8b3f538cfd3	1295	Ivančna Gorica
00050000-5578-239e-6432-01e399cf35a5	2259	Ivanjkovci
00050000-5578-239e-ef5c-7d49a56b0e90	1411	Izlake
00050000-5578-239e-fb75-c7fde6b83e4b	6310	Izola/Isola
00050000-5578-239e-65e2-391dc77d29cd	2222	Jakobski Dol
00050000-5578-239e-ebd5-299d45877ffc	2221	Jarenina
00050000-5578-239e-b4f6-bc941acc05a1	6254	Jelšane
00050000-5578-239e-6447-b57981bd6f02	4270	Jesenice
00050000-5578-239e-9d21-114a559b862c	8261	Jesenice na Dolenjskem
00050000-5578-239e-ea63-f1777f5dd176	3273	Jurklošter
00050000-5578-239e-5b59-388c025a0239	2223	Jurovski Dol
00050000-5578-239e-67f8-01d8d4cad830	2256	Juršinci
00050000-5578-239e-f963-17683d8572fb	5214	Kal nad Kanalom
00050000-5578-239e-f9e6-a693e1153871	3233	Kalobje
00050000-5578-239e-3242-9adb5357908e	4246	Kamna Gorica
00050000-5578-239e-3759-8401ce24beb7	2351	Kamnica
00050000-5578-239e-ebe3-579400dea6c9	1241	Kamnik
00050000-5578-239e-2bc8-ef951b578252	5213	Kanal
00050000-5578-239e-dd0e-890014cd11fc	8258	Kapele
00050000-5578-239e-2a8d-a3b086e892da	2362	Kapla
00050000-5578-239e-e9d6-d8fcf5aaf936	2325	Kidričevo
00050000-5578-239f-b0e3-32bdf564e6b3	1412	Kisovec
00050000-5578-239f-bc12-472316e7ce38	6253	Knežak
00050000-5578-239f-9851-41acb59639fd	5222	Kobarid
00050000-5578-239f-0cad-e68bf77cd9d9	9227	Kobilje
00050000-5578-239f-1366-4e21da0263c1	1330	Kočevje
00050000-5578-239f-7657-dffc5f0c3ccf	1338	Kočevska Reka
00050000-5578-239f-c341-d7d583362f59	2276	Kog
00050000-5578-239f-c188-2a4a6545bb5e	5211	Kojsko
00050000-5578-239f-ebb1-f3d5b91246f3	6223	Komen
00050000-5578-239f-257d-e5c64ff70544	1218	Komenda
00050000-5578-239f-3701-aa8da7b6886a	6000	Koper/Capodistria 
00050000-5578-239f-3496-a67ef52f45d8	6001	Koper/Capodistria - poštni predali
00050000-5578-239f-4b19-d56798fee188	8282	Koprivnica
00050000-5578-239f-8795-2ee059551d64	5296	Kostanjevica na Krasu
00050000-5578-239f-047e-cbabaa0fdd52	8311	Kostanjevica na Krki
00050000-5578-239f-f6fa-7f49359be166	1336	Kostel
00050000-5578-239f-e000-b04e07f2ce88	6256	Košana
00050000-5578-239f-e9de-32057175211f	2394	Kotlje
00050000-5578-239f-fe8e-dbe5d85668cc	6240	Kozina
00050000-5578-239f-aa78-e96242727d06	3260	Kozje
00050000-5578-239f-6f95-f289f101dff4	4000	Kranj 
00050000-5578-239f-266e-b09faac1b9aa	4001	Kranj - poštni predali
00050000-5578-239f-846a-0b8ce730c42e	4280	Kranjska Gora
00050000-5578-239f-974e-24c5703c1fde	1281	Kresnice
00050000-5578-239f-51e4-6fc9ec476e84	4294	Križe
00050000-5578-239f-cbd7-3fb40e70aeec	9206	Križevci
00050000-5578-239f-951c-4c11a1803576	9242	Križevci pri Ljutomeru
00050000-5578-239f-a49d-12e8662739ac	1301	Krka
00050000-5578-239f-9243-b05bbd4fcfd2	8296	Krmelj
00050000-5578-239f-5269-2505d6714251	4245	Kropa
00050000-5578-239f-532b-680f89b6af81	8262	Krška vas
00050000-5578-239f-c8d3-8f7a065b40eb	8270	Krško
00050000-5578-239f-1f44-08991e4ac30b	9263	Kuzma
00050000-5578-239f-b479-7649a8afd2e4	2318	Laporje
00050000-5578-239f-3b82-43c59f1502aa	3270	Laško
00050000-5578-239f-39a7-c31158e1f0ec	1219	Laze v Tuhinju
00050000-5578-239f-2359-ecc437ce1f44	2230	Lenart v Slovenskih goricah
00050000-5578-239f-b5a7-d0b9523d40a5	9220	Lendava/Lendva
00050000-5578-239f-ea1a-3a4a9c10c63e	4248	Lesce
00050000-5578-239f-19e6-60c4671bcea4	3261	Lesično
00050000-5578-239f-3ced-19081af4f22b	8273	Leskovec pri Krškem
00050000-5578-239f-5def-d4cfc7d184f7	2372	Libeliče
00050000-5578-239f-62c1-b50a68d7837d	2341	Limbuš
00050000-5578-239f-b5ea-941550f05438	1270	Litija
00050000-5578-239f-2969-38df7d3a0376	3202	Ljubečna
00050000-5578-239f-1fbd-6eaa7c210d97	1000	Ljubljana 
00050000-5578-239f-0d43-d11c67e9fd0c	1001	Ljubljana - poštni predali
00050000-5578-239f-7da0-79c5f93ee71d	1231	Ljubljana - Črnuče
00050000-5578-239f-4823-9a4b41581baa	1261	Ljubljana - Dobrunje
00050000-5578-239f-603a-66cf50ce2644	1260	Ljubljana - Polje
00050000-5578-239f-c296-f05dbe8223a8	1210	Ljubljana - Šentvid
00050000-5578-239f-c993-0ffafdfb31df	1211	Ljubljana - Šmartno
00050000-5578-239f-856b-78fe02557b5b	3333	Ljubno ob Savinji
00050000-5578-239f-2da6-e9917e907390	9240	Ljutomer
00050000-5578-239f-c0bd-4de0c56ec830	3215	Loče
00050000-5578-239f-123c-61c200eebce3	5231	Log pod Mangartom
00050000-5578-239f-6e20-73b28a1d8ee7	1358	Log pri Brezovici
00050000-5578-239f-3810-4dcaeac91425	1370	Logatec
00050000-5578-239f-3812-3c7d0b5efea2	1371	Logatec
00050000-5578-239f-3c0c-a9f5fe65ef5b	1434	Loka pri Zidanem Mostu
00050000-5578-239f-ce24-f6161fd48f87	3223	Loka pri Žusmu
00050000-5578-239f-e9e5-58019d467a27	6219	Lokev
00050000-5578-239f-cda3-e03bea035ff5	1318	Loški Potok
00050000-5578-239f-acbd-abcb2ec636f7	2324	Lovrenc na Dravskem polju
00050000-5578-239f-54b8-34dbdef09bb3	2344	Lovrenc na Pohorju
00050000-5578-239f-8d93-e9a7b3b54131	3334	Luče
00050000-5578-239f-62d1-854e3e286ec9	1225	Lukovica
00050000-5578-239f-804e-ce796bbd33bc	9202	Mačkovci
00050000-5578-239f-277d-4c0c6dc1e5fc	2322	Majšperk
00050000-5578-239f-baac-1e73cab52c8d	2321	Makole
00050000-5578-239f-7427-8f5f6b869aea	9243	Mala Nedelja
00050000-5578-239f-ab51-4f65bab9aaa0	2229	Malečnik
00050000-5578-239f-9069-cc31687b7e3e	6273	Marezige
00050000-5578-239f-a8cf-4896811f4cde	2000	Maribor 
00050000-5578-239f-acde-836342ffc276	2001	Maribor - poštni predali
00050000-5578-239f-8ee8-844cf8e05e11	2206	Marjeta na Dravskem polju
00050000-5578-239f-351c-a3ffa0309d33	2281	Markovci
00050000-5578-239f-c9e3-a48d8fc96600	9221	Martjanci
00050000-5578-239f-2a7a-d98dd22dcc57	6242	Materija
00050000-5578-239f-b5ea-42dce844adde	4211	Mavčiče
00050000-5578-239f-db45-37d603c02f87	1215	Medvode
00050000-5578-239f-58b8-77002f0c1f4f	1234	Mengeš
00050000-5578-239f-a3b5-ca3f3422bcbf	8330	Metlika
00050000-5578-239f-34b8-89148e9c15d0	2392	Mežica
00050000-5578-239f-7872-0d9b9a21b13e	2204	Miklavž na Dravskem polju
00050000-5578-239f-de80-fc334beb7f4d	2275	Miklavž pri Ormožu
00050000-5578-239f-e20b-c48ad9dd7ec3	5291	Miren
00050000-5578-239f-bd48-bd69794c7056	8233	Mirna
00050000-5578-239f-df7a-c4431a4f0c3c	8216	Mirna Peč
00050000-5578-239f-a0c1-a0059e4f2ea7	2382	Mislinja
00050000-5578-239f-79ea-9cbc6f7fb5c4	4281	Mojstrana
00050000-5578-239f-e465-c2bcd977dd13	8230	Mokronog
00050000-5578-239f-7338-90ef52fe310e	1251	Moravče
00050000-5578-239f-85eb-8899402037be	9226	Moravske Toplice
00050000-5578-239f-0a2f-05a73c1cf76f	5216	Most na Soči
00050000-5578-239f-b062-26e9e04222e5	1221	Motnik
00050000-5578-239f-0108-ac6f36d361fb	3330	Mozirje
00050000-5578-239f-eb89-01d5392356e1	9000	Murska Sobota 
00050000-5578-239f-f39b-d4377c961fc2	9001	Murska Sobota - poštni predali
00050000-5578-239f-d01f-e9e935fc9148	2366	Muta
00050000-5578-239f-d5b0-1018f47f74a0	4202	Naklo
00050000-5578-239f-5c16-59cb233d235e	3331	Nazarje
00050000-5578-239f-f80c-a391d850395b	1357	Notranje Gorice
00050000-5578-239f-b528-70f42940c5a1	3203	Nova Cerkev
00050000-5578-239f-24ca-78a642deffe7	5000	Nova Gorica 
00050000-5578-239f-5b75-be389d97a0b4	5001	Nova Gorica - poštni predali
00050000-5578-239f-0817-9e3337b63eea	1385	Nova vas
00050000-5578-239f-bb0d-05d0c42ec692	8000	Novo mesto
00050000-5578-239f-6304-27dda7ca7639	8001	Novo mesto - poštni predali
00050000-5578-239f-e16f-1af28d796a8f	6243	Obrov
00050000-5578-239f-85a6-991945123496	9233	Odranci
00050000-5578-239f-94a5-346052fd9a4c	2317	Oplotnica
00050000-5578-239f-feac-3575220f7b3f	2312	Orehova vas
00050000-5578-239f-6a59-c9873354d56e	2270	Ormož
00050000-5578-239f-775e-b76e28c7ce3c	1316	Ortnek
00050000-5578-239f-ddee-51fceee39cea	1337	Osilnica
00050000-5578-239f-c522-103075999adf	8222	Otočec
00050000-5578-239f-15d1-1ca069d022c8	2361	Ožbalt
00050000-5578-239f-3b63-0ac3737bee2b	2231	Pernica
00050000-5578-239f-f8be-77a8f823a94a	2211	Pesnica pri Mariboru
00050000-5578-239f-cf8f-c4df9816b901	9203	Petrovci
00050000-5578-239f-9847-0adc2671fbac	3301	Petrovče
00050000-5578-239f-a90b-232f85fab8f0	6330	Piran/Pirano
00050000-5578-239f-cf77-70350d1c149a	8255	Pišece
00050000-5578-239f-470e-e16c0d721a47	6257	Pivka
00050000-5578-239f-4d04-4054c5fb95ba	6232	Planina
00050000-5578-239f-7e34-a38eca52c2db	3225	Planina pri Sevnici
00050000-5578-239f-84da-365cb025d1d6	6276	Pobegi
00050000-5578-239f-111c-b6d9dacce6e8	8312	Podbočje
00050000-5578-239f-f676-8e19a1008399	5243	Podbrdo
00050000-5578-239f-4b34-4690a4f4890f	3254	Podčetrtek
00050000-5578-239f-4512-59f4ae294776	2273	Podgorci
00050000-5578-239f-9000-ab909c0e2f83	6216	Podgorje
00050000-5578-239f-c569-40076d1f4afb	2381	Podgorje pri Slovenj Gradcu
00050000-5578-239f-c052-605f9685d8a4	6244	Podgrad
00050000-5578-239f-bc79-4cf6f33ee4f4	1414	Podkum
00050000-5578-239f-909f-60e40e8152d7	2286	Podlehnik
00050000-5578-239f-2fa5-552621b18ad5	5272	Podnanos
00050000-5578-239f-39b9-2a62e03ebc88	4244	Podnart
00050000-5578-239f-2d31-0b11103349e2	3241	Podplat
00050000-5578-239f-8659-3f96ae1fcf34	3257	Podsreda
00050000-5578-239f-6fbf-7493d8ac62c4	2363	Podvelka
00050000-5578-239f-769e-17e70c8aa853	2208	Pohorje
00050000-5578-239f-cdc4-53d0871d675d	2257	Polenšak
00050000-5578-239f-ac8b-4f0764304467	1355	Polhov Gradec
00050000-5578-239f-8874-549a9d0ddf82	4223	Poljane nad Škofjo Loko
00050000-5578-239f-81b7-b7a2b8266130	2319	Poljčane
00050000-5578-239f-a2ff-ceb0239a1ce0	1272	Polšnik
00050000-5578-239f-0af0-d40ea3479028	3313	Polzela
00050000-5578-239f-f10b-9de189761625	3232	Ponikva
00050000-5578-239f-65fe-8b18f25037ae	6320	Portorož/Portorose
00050000-5578-239f-4887-b48ee445ace9	6230	Postojna
00050000-5578-239f-2c48-bee6003c2734	2331	Pragersko
00050000-5578-239f-f2ad-32529ec5b017	3312	Prebold
00050000-5578-239f-9946-e7811afb4626	4205	Preddvor
00050000-5578-239f-385c-e4cb69359a38	6255	Prem
00050000-5578-239f-4c83-e3e26047f579	1352	Preserje
00050000-5578-239f-1dde-68128b404e0a	6258	Prestranek
00050000-5578-239f-b275-2789423400c0	2391	Prevalje
00050000-5578-239f-c728-a0d85e8c7517	3262	Prevorje
00050000-5578-239f-2c91-fea7d93eff9a	1276	Primskovo 
00050000-5578-239f-d01e-d57929e2a051	3253	Pristava pri Mestinju
00050000-5578-239f-a102-8c528160cc39	9207	Prosenjakovci/Partosfalva
00050000-5578-239f-8a39-56770cd44945	5297	Prvačina
00050000-5578-239f-9f90-149bece3e16e	2250	Ptuj
00050000-5578-239f-a601-905a36e13872	2323	Ptujska Gora
00050000-5578-239f-8ca2-630b39a273fd	9201	Puconci
00050000-5578-239f-ac74-ecd100294d68	2327	Rače
00050000-5578-239f-a64a-a316381ed6c8	1433	Radeče
00050000-5578-239f-2e65-7efc4003c97b	9252	Radenci
00050000-5578-239f-46e6-e7c39f7677b1	2360	Radlje ob Dravi
00050000-5578-239f-3e0c-4b2283f8650e	1235	Radomlje
00050000-5578-239f-5308-552ad25b2d4b	4240	Radovljica
00050000-5578-239f-e203-780c3d1a35a5	8274	Raka
00050000-5578-239f-5cb1-4bc574988aa4	1381	Rakek
00050000-5578-239f-5401-b3ca36701b24	4283	Rateče - Planica
00050000-5578-239f-c241-f97596f44d19	2390	Ravne na Koroškem
00050000-5578-239f-fa7d-eb24fabb91b2	9246	Razkrižje
00050000-5578-239f-a392-9b475e035517	3332	Rečica ob Savinji
00050000-5578-239f-0c8d-fec2d266374d	5292	Renče
00050000-5578-239f-a646-6da5b8dbf94e	1310	Ribnica
00050000-5578-239f-778d-ea9d5fcd398d	2364	Ribnica na Pohorju
00050000-5578-239f-f00e-e14731322d80	3272	Rimske Toplice
00050000-5578-239f-9ca9-e552c4197ec5	1314	Rob
00050000-5578-239f-e6dd-245a1d0b932e	5215	Ročinj
00050000-5578-239f-8f62-74586e8dc62b	3250	Rogaška Slatina
00050000-5578-239f-6dbd-d6f63f8e3dc6	9262	Rogašovci
00050000-5578-239f-0607-abc234255808	3252	Rogatec
00050000-5578-239f-1967-f67de1d876c5	1373	Rovte
00050000-5578-239f-2e92-a66c55fe4ac0	2342	Ruše
00050000-5578-239f-93eb-97f0216de6fa	1282	Sava
00050000-5578-239f-5022-4a65c8ef7494	6333	Sečovlje/Sicciole
00050000-5578-239f-1145-4305f98ebe04	4227	Selca
00050000-5578-239f-e9ca-6a44f5520a45	2352	Selnica ob Dravi
00050000-5578-239f-6825-6c1bf141686a	8333	Semič
00050000-5578-239f-cdd3-5d554f19b91b	8281	Senovo
00050000-5578-239f-f11e-0f7d3ae511e6	6224	Senožeče
00050000-5578-239f-f02a-916e40564a24	8290	Sevnica
00050000-5578-239f-7930-5389ca475a8c	6210	Sežana
00050000-5578-239f-566e-e4a21ca2a0dc	2214	Sladki Vrh
00050000-5578-239f-8271-978457b366a1	5283	Slap ob Idrijci
00050000-5578-239f-0d09-c5cee84d1d8e	2380	Slovenj Gradec
00050000-5578-239f-7fcb-c823a911b8c8	2310	Slovenska Bistrica
00050000-5578-239f-1b01-f492a3dbad9a	3210	Slovenske Konjice
00050000-5578-239f-f689-46a19fbd43e4	1216	Smlednik
00050000-5578-239f-72f5-a90b13f0838a	5232	Soča
00050000-5578-239f-387d-90c5656e9aa7	1317	Sodražica
00050000-5578-239f-7578-16b31fb940d9	3335	Solčava
00050000-5578-239f-5551-9ec21533e8f8	5250	Solkan
00050000-5578-239f-291b-c03c22bdcb28	4229	Sorica
00050000-5578-239f-23ab-d1690550f8a1	4225	Sovodenj
00050000-5578-239f-1e24-3989eda5e56c	5281	Spodnja Idrija
00050000-5578-239f-1440-bc77ba2bc4a5	2241	Spodnji Duplek
00050000-5578-239f-3800-dd650d3c0c77	9245	Spodnji Ivanjci
00050000-5578-239f-3f81-ca6f5602ac46	2277	Središče ob Dravi
00050000-5578-239f-2a52-aad4e0fe36d1	4267	Srednja vas v Bohinju
00050000-5578-239f-9e05-6bf98cd5ef56	8256	Sromlje 
00050000-5578-239f-cb48-22a140d6eb04	5224	Srpenica
00050000-5578-239f-0ed4-e703380509ea	1242	Stahovica
00050000-5578-239f-25d4-21a18ce7c09e	1332	Stara Cerkev
00050000-5578-239f-b96d-e2ae308fc789	8342	Stari trg ob Kolpi
00050000-5578-239f-5d9e-42e654e4f50c	1386	Stari trg pri Ložu
00050000-5578-239f-01c4-15153e316d45	2205	Starše
00050000-5578-239f-cfff-d059bc644293	2289	Stoperce
00050000-5578-239f-946f-1eeb384168cb	8322	Stopiče
00050000-5578-239f-c689-9612fa367439	3206	Stranice
00050000-5578-239f-e170-af8cc97f7f3f	8351	Straža
00050000-5578-239f-7063-09efa9c68c75	1313	Struge
00050000-5578-239f-062a-97ed44f78e5b	8293	Studenec
00050000-5578-239f-6f40-8ab3408ef1e9	8331	Suhor
00050000-5578-239f-3004-99b6d09ef093	2233	Sv. Ana v Slovenskih goricah
00050000-5578-239f-9ab5-78394fd5ff02	2235	Sv. Trojica v Slovenskih goricah
00050000-5578-239f-3874-2749c629b427	2353	Sveti Duh na Ostrem Vrhu
00050000-5578-239f-4dec-98ae1a17535f	9244	Sveti Jurij ob Ščavnici
00050000-5578-239f-1907-9c7f857a2a30	3264	Sveti Štefan
00050000-5578-239f-a5f7-176fe58f3386	2258	Sveti Tomaž
00050000-5578-239f-e6e8-843557a14292	9204	Šalovci
00050000-5578-239f-45ba-55d08a70263c	5261	Šempas
00050000-5578-239f-e95a-2798aaaf783e	5290	Šempeter pri Gorici
00050000-5578-239f-9b5f-4a6320c2e3c5	3311	Šempeter v Savinjski dolini
00050000-5578-239f-ab55-934d8882fe81	4208	Šenčur
00050000-5578-239f-f221-40a4183eb84f	2212	Šentilj v Slovenskih goricah
00050000-5578-239f-845b-3b14bfc3dc53	8297	Šentjanž
00050000-5578-239f-2706-719603c690a6	2373	Šentjanž pri Dravogradu
00050000-5578-239f-8dea-38d4e037a7ad	8310	Šentjernej
00050000-5578-239f-aea2-0ed00fec79fc	3230	Šentjur
00050000-5578-239f-e8c3-64001cc7c82d	3271	Šentrupert
00050000-5578-239f-bd23-e402d624e33c	8232	Šentrupert
00050000-5578-239f-1aac-2e21fda0397b	1296	Šentvid pri Stični
00050000-5578-239f-a822-81ee91901c9b	8275	Škocjan
00050000-5578-239f-474e-74cc2c0481ce	6281	Škofije
00050000-5578-239f-d071-c1ec009b5ece	4220	Škofja Loka
00050000-5578-239f-d04b-986406455fb4	3211	Škofja vas
00050000-5578-239f-8025-f21c102cf98d	1291	Škofljica
00050000-5578-239f-64ae-5e72824047e3	6274	Šmarje
00050000-5578-239f-71c9-b3ce68e3f4d8	1293	Šmarje - Sap
00050000-5578-239f-a779-dc801b731752	3240	Šmarje pri Jelšah
00050000-5578-239f-09a6-ea8dff939e1d	8220	Šmarješke Toplice
00050000-5578-239f-2293-9fa762ee3f13	2315	Šmartno na Pohorju
00050000-5578-239f-4dbc-79df1bbedcf4	3341	Šmartno ob Dreti
00050000-5578-239f-3491-d851123931de	3327	Šmartno ob Paki
00050000-5578-239f-476f-7fc8c6dd02f2	1275	Šmartno pri Litiji
00050000-5578-239f-0ab6-616ccdeb2936	2383	Šmartno pri Slovenj Gradcu
00050000-5578-239f-11d8-fe1641a02d4c	3201	Šmartno v Rožni dolini
00050000-5578-239f-9417-60b4d097ec07	3325	Šoštanj
00050000-5578-239f-fcae-c869d477ce5a	6222	Štanjel
00050000-5578-239f-509b-6d51ab41c81c	3220	Štore
00050000-5578-239f-8a6f-bf80d957d1dd	3304	Tabor
00050000-5578-239f-da62-bd778c691b14	3221	Teharje
00050000-5578-239f-6c91-cdb1eb324ddf	9251	Tišina
00050000-5578-239f-1b71-92989e5a4bac	5220	Tolmin
00050000-5578-239f-a44d-60ef8a0fa872	3326	Topolšica
00050000-5578-239f-1eb4-5d8a8e121a54	2371	Trbonje
00050000-5578-239f-6ea1-968bfdb69643	1420	Trbovlje
00050000-5578-239f-5e52-167bba296ddb	8231	Trebelno 
00050000-5578-239f-b866-32e0d510448a	8210	Trebnje
00050000-5578-239f-d66a-e57269073aa0	5252	Trnovo pri Gorici
00050000-5578-239f-5872-4082d49f556f	2254	Trnovska vas
00050000-5578-239f-8207-dbfb2dfa1c37	1222	Trojane
00050000-5578-239f-80be-e50f9199089d	1236	Trzin
00050000-5578-239f-276e-e04bfa9d72d4	4290	Tržič
00050000-5578-239f-dae8-af4e3778d8ec	8295	Tržišče
00050000-5578-239f-1030-e551b3642948	1311	Turjak
00050000-5578-239f-4318-a2657eb0b7df	9224	Turnišče
00050000-5578-239f-0918-29dcc877a04c	8323	Uršna sela
00050000-5578-239f-3783-7d60b0ccb3ce	1252	Vače
00050000-5578-239f-536e-9f6de03bbce4	3320	Velenje 
00050000-5578-239f-7886-0596db36e7cf	3322	Velenje - poštni predali
00050000-5578-239f-ae4e-a69f8f63a82e	8212	Velika Loka
00050000-5578-239f-dc1e-6e990d0734f1	2274	Velika Nedelja
00050000-5578-239f-87b3-5c5b2798ae95	9225	Velika Polana
00050000-5578-239f-f690-5c22e72f6942	1315	Velike Lašče
00050000-5578-239f-6942-e9373a74ac55	8213	Veliki Gaber
00050000-5578-239f-6514-4bf031db6b84	9241	Veržej
00050000-5578-239f-c942-bb9fdb08facb	1312	Videm - Dobrepolje
00050000-5578-239f-8f6f-d3e1cc4b8f4e	2284	Videm pri Ptuju
00050000-5578-239f-32fe-022b1eb1dbdd	8344	Vinica
00050000-5578-239f-5b8f-1ba6f2ea41e9	5271	Vipava
00050000-5578-239f-5dc5-dfa46413ea86	4212	Visoko
00050000-5578-239f-85bd-df14ceebc625	1294	Višnja Gora
00050000-5578-239f-9726-34b528135fbd	3205	Vitanje
00050000-5578-239f-acf5-5573e74ee3b3	2255	Vitomarci
00050000-5578-239f-eaac-5c39f4539edc	1217	Vodice
00050000-5578-239f-5fd1-e46e94de1b79	3212	Vojnik\t
00050000-5578-239f-d176-bbf8fc8506d9	5293	Volčja Draga
00050000-5578-239f-4d6e-8b025e2d9f56	2232	Voličina
00050000-5578-239f-f232-d48d6dd09d8f	3305	Vransko
00050000-5578-239f-22fe-8245b384b92e	6217	Vremski Britof
00050000-5578-239f-2ab4-7e0534049d14	1360	Vrhnika
00050000-5578-239f-0b5a-01cee18215dc	2365	Vuhred
00050000-5578-239f-0a4d-ee5e5d82fa19	2367	Vuzenica
00050000-5578-239f-dfdf-17af0670b4bd	8292	Zabukovje 
00050000-5578-239f-eebe-78db4f040a7e	1410	Zagorje ob Savi
00050000-5578-239f-a8e4-12da05dcbbfb	1303	Zagradec
00050000-5578-239f-75c0-17d5fa2af981	2283	Zavrč
00050000-5578-239f-b481-1f0eecc540fb	8272	Zdole 
00050000-5578-239f-7e73-4569048024f1	4201	Zgornja Besnica
00050000-5578-239f-8e68-c2df79f5a9d8	2242	Zgornja Korena
00050000-5578-239f-52af-1e2eda246e97	2201	Zgornja Kungota
00050000-5578-239f-364b-937de2b05eab	2316	Zgornja Ložnica
00050000-5578-239f-2ee0-5f64d91a24ea	2314	Zgornja Polskava
00050000-5578-239f-6a78-a197adf2e1c9	2213	Zgornja Velka
00050000-5578-239f-0efa-b626aec263cf	4247	Zgornje Gorje
00050000-5578-239f-128b-7c827f3f8622	4206	Zgornje Jezersko
00050000-5578-239f-ae8e-5d52dc4afe3d	2285	Zgornji Leskovec
00050000-5578-239f-b921-cf90fe745956	1432	Zidani Most
00050000-5578-239f-b249-bb569148cf32	3214	Zreče
00050000-5578-239f-c013-2b04810f50e6	4209	Žabnica
00050000-5578-239f-4708-3e0ed5f92494	3310	Žalec
00050000-5578-239f-2f77-dc57cd3f974e	4228	Železniki
00050000-5578-239f-f709-305ce5a286d5	2287	Žetale
00050000-5578-239f-1430-622541130ec6	4226	Žiri
00050000-5578-239f-1fde-a719d6cee094	4274	Žirovnica
00050000-5578-239f-b6c1-e3e0f63d2a7c	8360	Žužemberk
\.


--
-- TOC entry 2826 (class 0 OID 6858371)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6858182)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6858260)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6858383)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6858503)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6858556)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5578-23a0-229f-db73666ef7a6	00080000-5578-23a0-3cf5-ad585aecfe43	0987	A
00190000-5578-23a0-990f-8ce43c2107c1	00080000-5578-23a0-0c5a-98e70f1c2079	0989	A
\.


--
-- TOC entry 2852 (class 0 OID 6858671)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6858722)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6858684)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6858692)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6858412)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5578-23a0-5bf1-7ff2781ea65b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5578-23a0-d419-beea8ed35912	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5578-23a0-9aac-3e9c79eb23b3	0003	Kazinska	t	84	Kazinska dvorana
00220000-5578-23a0-5f4d-5e99c293de77	0004	Mali oder	t	24	Mali oder 
00220000-5578-23a0-f020-1dc374712848	0005	Komorni oder	t	15	Komorni oder
00220000-5578-23a0-4ccc-6e57e862105c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5578-23a0-2859-23e0e35d6278	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2824 (class 0 OID 6858356)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6858346)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6858545)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6858480)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6858054)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5578-239f-a786-5387cbfbdb78	00010000-5578-239f-fa42-ebc1270cd8fc	2015-06-10 13:46:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROHhTKwnlcGRkHdAtXHPOCsVRyXM4OdkC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2833 (class 0 OID 6858422)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6858092)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5578-239f-5a0f-8cb4ed2662d3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5578-239f-9996-10dbef63dfe4	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5578-239f-3022-27a7ef922c2b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5578-239f-41b8-d6db597c875e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5578-239f-89c4-7af6884c5d4c	planer	Planer dogodkov v koledarju	t
00020000-5578-239f-b0e0-2a073cec9939	kadrovska	Kadrovska služba	t
00020000-5578-239f-9849-18e05e2865e2	arhivar	Ažuriranje arhivalij	t
00020000-5578-239f-fea3-ead7ed2d3d4d	igralec	Igralec	t
00020000-5578-239f-e7e1-c0cc06e518dc	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2799 (class 0 OID 6858076)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5578-239f-a786-5387cbfbdb78	00020000-5578-239f-3022-27a7ef922c2b
00010000-5578-239f-fa42-ebc1270cd8fc	00020000-5578-239f-3022-27a7ef922c2b
\.


--
-- TOC entry 2835 (class 0 OID 6858436)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6858377)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6858327)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 6858741)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5578-239f-0bbd-8c7fbd8718ca	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5578-239f-6368-6a9e34557b1d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5578-239f-33ef-b88267ac04ec	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5578-239f-0f7b-46cf2f7a2a90	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5578-239f-023a-ebe6cd4cb9fa	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2858 (class 0 OID 6858733)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5578-239f-0269-6c7c2c0caabf	00230000-5578-239f-0f7b-46cf2f7a2a90	popa
00240000-5578-239f-a582-0f430d439a8e	00230000-5578-239f-0f7b-46cf2f7a2a90	oseba
00240000-5578-239f-b6ed-773333587f36	00230000-5578-239f-6368-6a9e34557b1d	prostor
00240000-5578-239f-f182-dafa83e80350	00230000-5578-239f-0f7b-46cf2f7a2a90	besedilo
00240000-5578-239f-dac9-47c824d2fb2c	00230000-5578-239f-0f7b-46cf2f7a2a90	uprizoritev
00240000-5578-239f-3e8e-99aeebf53371	00230000-5578-239f-0f7b-46cf2f7a2a90	funkcija
00240000-5578-239f-0b36-146918cb83d0	00230000-5578-239f-0f7b-46cf2f7a2a90	tipfunkcije
00240000-5578-239f-abf4-eb63c181b855	00230000-5578-239f-0f7b-46cf2f7a2a90	alternacija
00240000-5578-239f-e8bd-1aa25f9e5555	00230000-5578-239f-0bbd-8c7fbd8718ca	pogodba
00240000-5578-239f-3adb-fa7a1a772e19	00230000-5578-239f-0f7b-46cf2f7a2a90	zaposlitev
\.


--
-- TOC entry 2857 (class 0 OID 6858728)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6858490)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6858154)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6858333)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5578-23a0-83a1-0f230607bd9a	00180000-5578-23a0-ad1c-be4ae5089e4b	000c0000-5578-23a0-fcc0-9e3306467b89	00090000-5578-23a0-7c54-2637c93d0112	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-23a0-c3a0-a8276ecdfd67	00180000-5578-23a0-ad1c-be4ae5089e4b	000c0000-5578-23a0-8d4c-310b26498457	00090000-5578-23a0-63bf-f83a5dfd465d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-23a0-d74a-c0717887f731	00180000-5578-23a0-ad1c-be4ae5089e4b	000c0000-5578-23a0-eb88-194bfd9fff19	00090000-5578-23a0-2945-88ad6fad5831	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-23a0-c6e7-debbb1c64ff5	00180000-5578-23a0-ad1c-be4ae5089e4b	000c0000-5578-23a0-f6c4-b64ac967bed8	00090000-5578-23a0-8f29-2a653ec2e602	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-23a0-3b76-897931b80c58	00180000-5578-23a0-ad1c-be4ae5089e4b	000c0000-5578-23a0-0047-9120daa9c95d	00090000-5578-23a0-8017-4f7bd2d6c14c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-23a0-ba60-26f67fc8360f	00180000-5578-23a0-d8ff-a2b285d45ab8	\N	00090000-5578-23a0-8017-4f7bd2d6c14c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2843 (class 0 OID 6858534)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5578-239f-5ec9-69c11bc8a3b8	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5578-239f-211a-eec2946f8fca	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5578-239f-ff53-4e52e98b1f43	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5578-239f-6bfb-3793047c3746	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5578-239f-ac9d-7214d38f545a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5578-239f-63ec-93a315418202	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5578-239f-e1f4-07cbae8c3f5a	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5578-239f-1950-43b2448cf6db	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5578-239f-bf91-e771131d6b5c	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5578-239f-555c-469fd91c5ccb	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5578-239f-08b0-a2a55a44e602	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5578-239f-9049-22f7563e15a7	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5578-239f-e10f-0a23e2a07e22	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5578-239f-cfc6-2e24cd95aac4	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5578-239f-a588-204e5810dd60	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5578-239f-5d3e-eef5ca583d33	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2855 (class 0 OID 6858711)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5578-239f-3ebc-4ebea100ab82	01	Velika predstava	f	1.00	1.00
002b0000-5578-239f-6c36-ee9bfb327f29	02	Mala predstava	f	0.50	0.50
002b0000-5578-239f-a5e1-35673c5693cd	03	Mala koprodukcija	t	0.40	1.00
002b0000-5578-239f-83e3-3e540b6431c3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5578-239f-ec38-d3917d051bb9	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2811 (class 0 OID 6858217)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6858063)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5578-239f-fa42-ebc1270cd8fc	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROI861H0mLguAM1nEwEa1H3oCY9tYD4ke	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5578-23a0-aa0f-f2263576d895	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5578-23a0-0b8f-71cbcb540d58	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5578-23a0-f5c1-4d70fa6cc701	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5578-23a0-ff19-0dffe65dec7f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5578-23a0-92eb-994f927a2668	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5578-23a0-dd4f-cc4deed532ac	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5578-239f-a786-5387cbfbdb78	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 6858591)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5578-23a0-c6d8-c9e535acde44	00160000-5578-23a0-d28f-03ccc755fdf0	00150000-5578-239f-2fea-79bb1484255a	00140000-5578-239f-55c1-c1248e8ec26d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5578-23a0-f020-1dc374712848
000e0000-5578-23a0-9b52-c4be34498ac5	00160000-5578-23a0-9e0d-ee828bf0befc	00150000-5578-239f-3b84-c2fe35f4eaa4	00140000-5578-239f-a7ff-591a76f50ebf	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5578-23a0-4ccc-6e57e862105c
000e0000-5578-23a0-5393-6539ed4bb68c	\N	00150000-5578-239f-3b84-c2fe35f4eaa4	00140000-5578-239f-a7ff-591a76f50ebf	00190000-5578-23a0-229f-db73666ef7a6	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5578-23a0-f020-1dc374712848
000e0000-5578-23a0-c44f-e46dd6f842b6	\N	00150000-5578-239f-3b84-c2fe35f4eaa4	00140000-5578-239f-a7ff-591a76f50ebf	00190000-5578-23a0-229f-db73666ef7a6	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5578-23a0-f020-1dc374712848
\.


--
-- TOC entry 2816 (class 0 OID 6858279)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5578-23a0-5e17-0f0e741b12c6	000e0000-5578-23a0-9b52-c4be34498ac5	1	
00200000-5578-23a0-6f63-9a6b6444e4b5	000e0000-5578-23a0-9b52-c4be34498ac5	2	
\.


--
-- TOC entry 2831 (class 0 OID 6858404)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6858473)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6858311)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6858581)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5578-239f-55c1-c1248e8ec26d	01	Drama	drama (SURS 01)
00140000-5578-239f-c4fb-84bba0accd80	02	Opera	opera (SURS 02)
00140000-5578-239f-e217-5f7aef0962c7	03	Balet	balet (SURS 03)
00140000-5578-239f-f576-530a70122374	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5578-239f-981f-b68ea4363e18	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5578-239f-a7ff-591a76f50ebf	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5578-239f-04ec-097413bcb010	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2837 (class 0 OID 6858463)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5578-239f-b05f-7ade50e98945	01	Opera	opera
00150000-5578-239f-c5f0-1a5b41210fbd	02	Opereta	opereta
00150000-5578-239f-b55b-fcb557a82160	03	Balet	balet
00150000-5578-239f-8a8a-722378d2b35d	04	Plesne prireditve	plesne prireditve
00150000-5578-239f-9915-e7a4011160d3	05	Lutkovno gledališče	lutkovno gledališče
00150000-5578-239f-2d08-33cf9ca6e267	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5578-239f-8ecd-ddbe21e0c0ec	07	Biografska drama	biografska drama
00150000-5578-239f-2fea-79bb1484255a	08	Komedija	komedija
00150000-5578-239f-f9a9-08e5d94dff39	09	Črna komedija	črna komedija
00150000-5578-239f-3bb7-ca7e5f5f42ec	10	E-igra	E-igra
00150000-5578-239f-3b84-c2fe35f4eaa4	11	Kriminalka	kriminalka
00150000-5578-239f-607a-34f238442020	12	Musical	musical
\.


--
-- TOC entry 2383 (class 2606 OID 6858117)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6858638)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6858628)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6858533)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6858301)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6858326)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6858243)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6858667)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6858459)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6858277)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 6858320)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6858257)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6858369)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6858396)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6858215)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 6858126)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2390 (class 2606 OID 6858150)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6858106)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2374 (class 2606 OID 6858091)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6858402)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6858435)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6858576)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6858179)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6858203)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6858375)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 6858193)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6858264)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6858387)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6858515)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6858561)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6858682)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6858726)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6858689)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 6858709)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6858419)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6858360)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 6858351)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6858555)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6858487)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6858062)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 6858426)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6858080)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2376 (class 2606 OID 6858100)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6858444)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6858382)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6858332)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6858750)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 6858738)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6858732)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6858500)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6858159)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6858342)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6858544)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 6858721)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6858228)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6858075)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6858607)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6858286)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6858410)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6858478)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 6858315)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6858589)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6858471)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 1259 OID 6858308)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2523 (class 1259 OID 6858501)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6858502)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6858181)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2356 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2358 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2488 (class 1259 OID 6858403)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2482 (class 1259 OID 6858389)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2483 (class 1259 OID 6858388)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 6858287)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2510 (class 1259 OID 6858460)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6858462)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2512 (class 1259 OID 6858461)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2422 (class 1259 OID 6858259)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2423 (class 1259 OID 6858258)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 6858578)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 6858579)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 6858580)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2582 (class 1259 OID 6858710)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2550 (class 1259 OID 6858612)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2551 (class 1259 OID 6858609)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2552 (class 1259 OID 6858613)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2553 (class 1259 OID 6858611)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2554 (class 1259 OID 6858610)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2412 (class 1259 OID 6858230)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 6858229)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2361 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2362 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 6858153)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2498 (class 1259 OID 6858427)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 6858321)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2378 (class 1259 OID 6858107)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2379 (class 1259 OID 6858108)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2503 (class 1259 OID 6858447)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2504 (class 1259 OID 6858446)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2505 (class 1259 OID 6858445)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2426 (class 1259 OID 6858265)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2427 (class 1259 OID 6858267)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2428 (class 1259 OID 6858266)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2592 (class 1259 OID 6858740)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2462 (class 1259 OID 6858355)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2463 (class 1259 OID 6858353)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2464 (class 1259 OID 6858352)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2465 (class 1259 OID 6858354)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2369 (class 1259 OID 6858081)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6858082)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 6858411)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2477 (class 1259 OID 6858376)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2519 (class 1259 OID 6858488)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2520 (class 1259 OID 6858489)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 6858668)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 6858669)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2574 (class 1259 OID 6858670)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2401 (class 1259 OID 6858195)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6858194)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2403 (class 1259 OID 6858196)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 6858727)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 6858516)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 6858517)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2564 (class 1259 OID 6858642)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2565 (class 1259 OID 6858644)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2566 (class 1259 OID 6858640)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2567 (class 1259 OID 6858643)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2568 (class 1259 OID 6858641)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2516 (class 1259 OID 6858479)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 6858364)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2469 (class 1259 OID 6858363)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2470 (class 1259 OID 6858361)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2471 (class 1259 OID 6858362)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2352 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 6858630)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6858629)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2575 (class 1259 OID 6858683)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2433 (class 1259 OID 6858278)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 6858128)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2385 (class 1259 OID 6858127)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2393 (class 1259 OID 6858160)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6858161)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2457 (class 1259 OID 6858345)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 6858344)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2459 (class 1259 OID 6858343)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2578 (class 1259 OID 6858691)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2579 (class 1259 OID 6858690)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2440 (class 1259 OID 6858310)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2441 (class 1259 OID 6858306)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2442 (class 1259 OID 6858303)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2443 (class 1259 OID 6858304)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2444 (class 1259 OID 6858302)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2445 (class 1259 OID 6858307)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2446 (class 1259 OID 6858305)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2400 (class 1259 OID 6858180)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 6858244)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2419 (class 1259 OID 6858246)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2420 (class 1259 OID 6858245)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2421 (class 1259 OID 6858247)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2476 (class 1259 OID 6858370)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2546 (class 1259 OID 6858577)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6858608)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2391 (class 1259 OID 6858151)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6858152)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2513 (class 1259 OID 6858472)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 6858751)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6858216)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2595 (class 1259 OID 6858739)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2496 (class 1259 OID 6858421)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2497 (class 1259 OID 6858420)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 6858639)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2355 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2408 (class 1259 OID 6858204)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6858590)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 6858562)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 6858563)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 6858101)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2447 (class 1259 OID 6858309)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2624 (class 2606 OID 6858887)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2627 (class 2606 OID 6858872)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2626 (class 2606 OID 6858877)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2622 (class 2606 OID 6858897)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2628 (class 2606 OID 6858867)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2623 (class 2606 OID 6858892)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2625 (class 2606 OID 6858882)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6859042)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6859047)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6858802)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2645 (class 2606 OID 6858982)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2643 (class 2606 OID 6858977)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2644 (class 2606 OID 6858972)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2621 (class 2606 OID 6858862)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6859012)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6859022)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2652 (class 2606 OID 6859017)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6858837)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6858832)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6858962)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6859067)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 6859072)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 6859077)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2683 (class 2606 OID 6859172)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 6859097)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2669 (class 2606 OID 6859082)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2665 (class 2606 OID 6859102)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2667 (class 2606 OID 6859092)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2668 (class 2606 OID 6859087)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2613 (class 2606 OID 6858827)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6858822)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6858787)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2606 (class 2606 OID 6858782)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 6858992)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2629 (class 2606 OID 6858902)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6858762)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2601 (class 2606 OID 6858767)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2648 (class 2606 OID 6859007)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2649 (class 2606 OID 6859002)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2650 (class 2606 OID 6858997)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2619 (class 2606 OID 6858842)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2617 (class 2606 OID 6858852)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2618 (class 2606 OID 6858847)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2685 (class 2606 OID 6859182)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2633 (class 2606 OID 6858937)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2635 (class 2606 OID 6858927)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2636 (class 2606 OID 6858922)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2634 (class 2606 OID 6858932)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2600 (class 2606 OID 6858752)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2599 (class 2606 OID 6858757)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 6858987)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2642 (class 2606 OID 6858967)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2656 (class 2606 OID 6859032)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2655 (class 2606 OID 6859037)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 6859142)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 6859147)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2677 (class 2606 OID 6859152)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2611 (class 2606 OID 6858812)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6858807)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2610 (class 2606 OID 6858817)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2684 (class 2606 OID 6859177)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2660 (class 2606 OID 6859052)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2659 (class 2606 OID 6859057)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2674 (class 2606 OID 6859127)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 6859137)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2676 (class 2606 OID 6859117)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2673 (class 2606 OID 6859132)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2675 (class 2606 OID 6859122)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2654 (class 2606 OID 6859027)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6858957)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2638 (class 2606 OID 6858952)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2640 (class 2606 OID 6858942)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2639 (class 2606 OID 6858947)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2670 (class 2606 OID 6859112)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 6859107)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2680 (class 2606 OID 6859157)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2620 (class 2606 OID 6858857)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6859062)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2603 (class 2606 OID 6858777)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2604 (class 2606 OID 6858772)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2608 (class 2606 OID 6858792)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2607 (class 2606 OID 6858797)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 6858917)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2631 (class 2606 OID 6858912)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2632 (class 2606 OID 6858907)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2681 (class 2606 OID 6859167)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2682 (class 2606 OID 6859162)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 13:46:41 CEST

--
-- PostgreSQL database dump complete
--

