--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 14:46:01 CEST

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
-- TOC entry 180 (class 1259 OID 6863971)
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
-- TOC entry 227 (class 1259 OID 6864493)
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
-- TOC entry 226 (class 1259 OID 6864476)
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
-- TOC entry 219 (class 1259 OID 6864380)
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
-- TOC entry 194 (class 1259 OID 6864150)
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
-- TOC entry 197 (class 1259 OID 6864184)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6864093)
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
-- TOC entry 228 (class 1259 OID 6864507)
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
-- TOC entry 213 (class 1259 OID 6864310)
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
-- TOC entry 192 (class 1259 OID 6864130)
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
-- TOC entry 196 (class 1259 OID 6864178)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6864110)
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
-- TOC entry 202 (class 1259 OID 6864227)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6864252)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6864067)
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
-- TOC entry 181 (class 1259 OID 6863980)
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
-- TOC entry 182 (class 1259 OID 6863991)
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
-- TOC entry 177 (class 1259 OID 6863945)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6863964)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6864259)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6864290)
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
-- TOC entry 223 (class 1259 OID 6864426)
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
-- TOC entry 184 (class 1259 OID 6864024)
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
-- TOC entry 186 (class 1259 OID 6864059)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6864233)
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
-- TOC entry 185 (class 1259 OID 6864044)
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
-- TOC entry 191 (class 1259 OID 6864122)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6864245)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6864365)
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
-- TOC entry 222 (class 1259 OID 6864418)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6864533)
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
-- TOC entry 233 (class 1259 OID 6864584)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6864546)
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
-- TOC entry 231 (class 1259 OID 6864554)
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
-- TOC entry 209 (class 1259 OID 6864274)
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
-- TOC entry 201 (class 1259 OID 6864218)
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
-- TOC entry 200 (class 1259 OID 6864208)
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
-- TOC entry 221 (class 1259 OID 6864407)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6864342)
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
-- TOC entry 174 (class 1259 OID 6863916)
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
-- TOC entry 173 (class 1259 OID 6863914)
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
-- TOC entry 210 (class 1259 OID 6864284)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6863954)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6863938)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6864298)
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
-- TOC entry 204 (class 1259 OID 6864239)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6864189)
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
-- TOC entry 236 (class 1259 OID 6864603)
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
-- TOC entry 235 (class 1259 OID 6864595)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6864590)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6864352)
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
-- TOC entry 183 (class 1259 OID 6864016)
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
-- TOC entry 199 (class 1259 OID 6864195)
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
-- TOC entry 220 (class 1259 OID 6864396)
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
-- TOC entry 232 (class 1259 OID 6864573)
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
-- TOC entry 188 (class 1259 OID 6864079)
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
-- TOC entry 175 (class 1259 OID 6863925)
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
-- TOC entry 225 (class 1259 OID 6864453)
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
-- TOC entry 193 (class 1259 OID 6864141)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6864266)
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
-- TOC entry 215 (class 1259 OID 6864335)
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
-- TOC entry 195 (class 1259 OID 6864173)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6864443)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6864325)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6863919)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2803 (class 0 OID 6863971)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6864493)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5578-3188-458a-f827ab5c3181	000d0000-5578-3188-4afd-d9211ccd6ede	\N	00090000-5578-3188-ca17-225bd715c060	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-3188-4ad3-670982a7cf78	000d0000-5578-3188-7a80-9cb0bba92b21	\N	00090000-5578-3188-c77d-fe125cd6cdc4	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-3188-1714-ba4e7b2ad9d8	000d0000-5578-3188-1afd-02f715fbaee1	\N	00090000-5578-3188-bcc5-fc3d12e910b2	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-3188-ff1d-9d3ea3ef8dce	000d0000-5578-3188-1139-a7f94b23cde3	\N	00090000-5578-3188-de2f-b7540dfcef69	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-3188-2a3f-93cb01485781	000d0000-5578-3188-1d7e-70bcebaaa331	\N	00090000-5578-3188-7cfc-18a1ea4bc3c1	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-3188-e57c-c59bca2cae79	000d0000-5578-3188-e016-29e0a5f9619b	\N	00090000-5578-3188-c77d-fe125cd6cdc4	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 6864476)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6864380)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5578-3188-03ce-d7028f2a0eb9	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5578-3188-bc1b-8c7917ec09de	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5578-3188-8d52-715dd1c1b9ce	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2817 (class 0 OID 6864150)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5578-3188-a682-19ac196084fd	\N	\N	00200000-5578-3188-3d14-286b5466b588	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5578-3188-45be-5fc2e1800c41	\N	\N	00200000-5578-3188-1483-a095ac20a230	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5578-3188-90f0-32575a6ea5f2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5578-3188-41c3-7966169d1e9c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5578-3188-6f9d-2949a5372fe2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2820 (class 0 OID 6864184)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6864093)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5578-3187-1d0d-39b57dc261c8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5578-3187-872e-26e717f3c374	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5578-3187-aff7-44c58a87a9c7	AL	ALB	008	Albania 	Albanija	\N
00040000-5578-3187-2674-1b1345955ecb	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5578-3187-74ca-eaf5bb2e80c8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5578-3187-0333-97017f54a6a6	AD	AND	020	Andorra 	Andora	\N
00040000-5578-3187-8795-d7ec446f0f7f	AO	AGO	024	Angola 	Angola	\N
00040000-5578-3187-2c50-1f69a8cfbcb0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5578-3187-aa76-d5c0dc7cf01e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5578-3187-2ba7-7e5f77468d84	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-3187-e693-0a47aa861561	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5578-3187-473b-01011197cad2	AM	ARM	051	Armenia 	Armenija	\N
00040000-5578-3187-a4d4-0cef54e53461	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5578-3187-cb06-f01191fa7e74	AU	AUS	036	Australia 	Avstralija	\N
00040000-5578-3187-6fb0-6fc9e7af9488	AT	AUT	040	Austria 	Avstrija	\N
00040000-5578-3187-7570-c5b7d08d7c41	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5578-3187-e98f-54521960e05a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5578-3187-7d59-1830ad2cc8bb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5578-3187-e909-dd31690c6de7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5578-3187-1184-5bb8d9bae917	BB	BRB	052	Barbados 	Barbados	\N
00040000-5578-3187-5fe0-1e8dda1e79de	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5578-3187-a905-9dc6fa2af7e3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5578-3187-9390-81bc2d96bca3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5578-3187-8414-d3a5f01a72e5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5578-3187-580a-9ec79dbc09ab	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5578-3187-acb1-83ec55e130a0	BT	BTN	064	Bhutan 	Butan	\N
00040000-5578-3187-a17a-2e7a4fd1803a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5578-3187-0508-721ef8a626c6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5578-3187-3cda-022433c49e1c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5578-3187-0cb2-005b4c3e4dea	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5578-3187-d4f2-1df11540a07b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5578-3187-69f2-8061f67f4d5d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5578-3187-ec42-7cc857607ee4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5578-3187-a8af-ead8a7d468d2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5578-3187-c3a8-ec33b2cc90e7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5578-3187-a20b-78a6470ab326	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5578-3187-ef1d-4bf8a1255bb2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5578-3187-6a35-89459a8d4291	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5578-3187-d8aa-4f0475e0d1d2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5578-3187-c62e-ca3a0f1bc433	CA	CAN	124	Canada 	Kanada	\N
00040000-5578-3187-2c8d-b6f75166a927	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5578-3187-6645-ce7d22bfea46	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5578-3187-b5d4-2be3f8f91e19	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5578-3187-5123-32419b754bfc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5578-3187-2808-47c3bc234d7f	CL	CHL	152	Chile 	Čile	\N
00040000-5578-3187-016b-ee42aa8debff	CN	CHN	156	China 	Kitajska	\N
00040000-5578-3187-3835-ad9a858842c1	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5578-3187-423d-5d028abc2970	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5578-3187-79aa-42edc7b3bd33	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5578-3187-65fe-f71d7fd5a4ab	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5578-3187-0ab3-53c4d4e47003	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5578-3187-e8d1-396cc0d0687b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5578-3187-e6a7-b04ddb1eee0d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5578-3187-8f44-54277f390995	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5578-3187-08dd-40e0b11f9589	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5578-3187-8cf9-70e3af1883ee	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5578-3187-a169-37f1fa9a855c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5578-3187-3d30-518f4c9bb8df	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5578-3187-6f5f-f0fc9c65b00d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5578-3187-0152-404dcd408e19	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5578-3187-2712-a293b9e3bd68	DK	DNK	208	Denmark 	Danska	\N
00040000-5578-3187-72cd-6f803b3ac257	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5578-3187-3326-f79320ff4345	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-3187-4fe1-3806d5ccf560	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5578-3187-765c-38a24f5f633a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5578-3187-b452-0219f915f108	EG	EGY	818	Egypt 	Egipt	\N
00040000-5578-3187-8695-3042f621f903	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5578-3187-573f-cdb47f991b30	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5578-3187-7de5-11685c705e73	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5578-3187-ffc0-768879317810	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5578-3187-9739-1019102030f7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5578-3187-0ff2-f5407610cedf	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5578-3187-c1ac-c759dae160e1	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5578-3187-90b2-8b7844a9e181	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5578-3187-33d5-a91667a58686	FI	FIN	246	Finland 	Finska	\N
00040000-5578-3187-abf5-3dcdbee23af4	FR	FRA	250	France 	Francija	\N
00040000-5578-3187-35f8-e8a70eb0031e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5578-3187-9e8b-892c636afdcf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5578-3187-86ca-5ad7424f59ad	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5578-3187-707b-a6078e798ab5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5578-3187-adb7-2f4cf41fe42a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5578-3187-e529-cf908bcad997	GM	GMB	270	Gambia 	Gambija	\N
00040000-5578-3187-e650-d0802d547700	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5578-3187-545e-49e8e1769533	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5578-3187-6490-69335917d859	GH	GHA	288	Ghana 	Gana	\N
00040000-5578-3187-bed4-f42707c50e27	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5578-3187-3e11-62c6bd6e8d3b	GR	GRC	300	Greece 	Grčija	\N
00040000-5578-3187-701b-39b6defdb1b4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5578-3187-9f26-0a8cf90a89a8	GD	GRD	308	Grenada 	Grenada	\N
00040000-5578-3187-e241-7d7c37e49ca2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5578-3187-9421-5d350292dd0d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5578-3187-f14a-acae8aa996c7	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5578-3187-1876-926df6278a79	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5578-3187-1d1c-2b16a81a3563	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5578-3187-c9e9-0065080ac3a2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5578-3187-e488-ae4f0aa56bd5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5578-3187-0ce9-540f69cae038	HT	HTI	332	Haiti 	Haiti	\N
00040000-5578-3187-1696-a8f591f47820	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5578-3187-cb6d-aefd6e794582	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5578-3187-9c5b-9ef0483743e5	HN	HND	340	Honduras 	Honduras	\N
00040000-5578-3187-dfab-0137db521e37	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5578-3187-8b8f-cc46d632da54	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5578-3187-bd03-28eeb204982b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5578-3187-7a41-2c27f4c48692	IN	IND	356	India 	Indija	\N
00040000-5578-3187-eb83-4e412ce7ed58	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5578-3187-175c-21c37ebe18af	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5578-3187-7617-5f86a4c6de77	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5578-3187-8010-8d7e4796d5ce	IE	IRL	372	Ireland 	Irska	\N
00040000-5578-3187-4d99-0fa30d96fc2e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5578-3187-9393-d3f876388d10	IL	ISR	376	Israel 	Izrael	\N
00040000-5578-3187-6421-a919c901c407	IT	ITA	380	Italy 	Italija	\N
00040000-5578-3187-5cdf-fbb5bdb505c6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5578-3187-9b8e-28212cf422a6	JP	JPN	392	Japan 	Japonska	\N
00040000-5578-3187-731b-3f41acf1e85d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5578-3187-c79b-2b159604d32b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5578-3187-241c-63c78502f2b3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5578-3187-bd5c-9e4bec681ba4	KE	KEN	404	Kenya 	Kenija	\N
00040000-5578-3187-1512-68b37e494394	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5578-3187-0d25-179bbe2db523	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5578-3187-647e-1119bf07cbf4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5578-3187-879b-854226deadf4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5578-3187-9726-34051434ddeb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5578-3187-7cce-c260269a44ed	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5578-3187-575c-841e59b2c9cb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5578-3187-7ec5-64d9218f394c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5578-3187-f96a-a03da4fed5df	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5578-3187-bd10-18232a28d42c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5578-3187-c418-152007667452	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5578-3187-421a-077054a1055e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5578-3187-f9b8-c9ccae9a3ef7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5578-3187-daad-8974948c79dc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5578-3187-5bb7-0e8563c62b18	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5578-3187-366f-bd2c38d899d8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5578-3187-6665-a8e1e8ea8eb1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5578-3187-a6ff-acefb5017497	MW	MWI	454	Malawi 	Malavi	\N
00040000-5578-3187-09c4-82d4546db80c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5578-3187-3f2b-4ac921cfa1f2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5578-3187-e317-130bdfa5a696	ML	MLI	466	Mali 	Mali	\N
00040000-5578-3187-b5b2-c731dfe99be7	MT	MLT	470	Malta 	Malta	\N
00040000-5578-3187-09be-aa178b602573	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5578-3187-5e0e-109a39696754	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5578-3187-172f-f75b7d572652	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5578-3187-7b4d-bd8512c24a16	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5578-3187-83bd-7e0fddfa9e56	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5578-3187-cf02-c3fe507bb7be	MX	MEX	484	Mexico 	Mehika	\N
00040000-5578-3187-821b-d1ee7750cb6a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5578-3187-414e-0dfa407bfb86	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5578-3187-dd7a-463d86cc9c45	MC	MCO	492	Monaco 	Monako	\N
00040000-5578-3187-3037-f140187cdd75	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5578-3187-2abd-530fc8dfd2c9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5578-3187-ba73-70bf36a09183	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5578-3187-bed5-300d515bfb6c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5578-3187-244f-7fc6dac8c9d1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5578-3187-1129-d229338708eb	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5578-3187-d8a5-3d8d4a4bb6c0	NA	NAM	516	Namibia 	Namibija	\N
00040000-5578-3187-da8d-0a1dbb3585be	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5578-3187-cbd5-c5f1651bbd49	NP	NPL	524	Nepal 	Nepal	\N
00040000-5578-3187-a835-09ab8755e9ed	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5578-3187-eb38-4cff8b357e83	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5578-3187-340a-84d83c6d4ed4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5578-3187-829c-377dbab1297d	NE	NER	562	Niger 	Niger 	\N
00040000-5578-3187-7b1b-a27cd4c4e1d2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5578-3187-ca72-f403d9014480	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5578-3187-e76d-96019a057932	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5578-3187-be59-d1896a150827	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5578-3187-1554-faf375ed625d	NO	NOR	578	Norway 	Norveška	\N
00040000-5578-3187-e516-ec1c6ecb696b	OM	OMN	512	Oman 	Oman	\N
00040000-5578-3187-9090-519f38c4c3e5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5578-3187-35d6-3f034823a368	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5578-3187-540a-c3e4edf809d8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5578-3187-d5dc-fe8069ae7158	PA	PAN	591	Panama 	Panama	\N
00040000-5578-3187-4e0b-e28a6d1918c3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5578-3187-63c6-d2736ce5db59	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5578-3187-faba-09ec2af9a444	PE	PER	604	Peru 	Peru	\N
00040000-5578-3187-00ec-634aa0af3636	PH	PHL	608	Philippines 	Filipini	\N
00040000-5578-3187-42f6-f1a797173eeb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5578-3187-e41a-5fbeb9a9b252	PL	POL	616	Poland 	Poljska	\N
00040000-5578-3187-d9d2-8bd20051248a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5578-3187-624e-e20f5f21cb82	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5578-3187-6bbb-a9e1b84e1a79	QA	QAT	634	Qatar 	Katar	\N
00040000-5578-3187-244a-ea2a737948c1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5578-3187-7eab-c1081a9350e4	RO	ROU	642	Romania 	Romunija	\N
00040000-5578-3187-04da-3e32cdda0753	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5578-3187-3d08-cc8cba37c2cc	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5578-3187-71e8-7aa322a1fb65	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5578-3187-8220-d53dd0095d82	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5578-3187-3fda-bb6a5d33bc7e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5578-3187-540f-361ccccb9cee	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5578-3187-f358-ad54b5a47967	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5578-3187-4d27-4623c95fbb41	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5578-3187-03de-2d31651bf121	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5578-3187-57ab-25f786500421	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5578-3187-e720-1d7bd0cf5b07	SM	SMR	674	San Marino 	San Marino	\N
00040000-5578-3187-b6b0-fde0304b49fa	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5578-3187-7ff4-4ab0ec9eee72	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5578-3187-0db3-fdecae30e900	SN	SEN	686	Senegal 	Senegal	\N
00040000-5578-3187-e1ed-d4ea71bc7149	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5578-3187-6d6a-589fec8d635e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5578-3187-e0e7-d57a013d8c89	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5578-3187-1814-6714d1e95aae	SG	SGP	702	Singapore 	Singapur	\N
00040000-5578-3187-79a5-85a31c82b511	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5578-3187-c3a7-e53a53239752	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5578-3187-a403-28f75532728a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5578-3187-8140-bf43a7307293	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5578-3187-9717-7e291f5db5f8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5578-3187-cc8c-10ccdb6b03c0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5578-3187-2122-048bc4b5c131	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5578-3187-7b9a-be4739bac14f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5578-3187-a0cd-cb6c5dfc3a02	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5578-3187-d99b-ab3bb41a981c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5578-3187-0ca9-890e35fc4a60	SD	SDN	729	Sudan 	Sudan	\N
00040000-5578-3187-e31a-7a6de7684097	SR	SUR	740	Suriname 	Surinam	\N
00040000-5578-3187-9d68-5a9369cca2ba	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5578-3187-83f3-6b6d951a072b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5578-3187-87a5-0ca0477bca2c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5578-3187-ddfa-ca51a67f01db	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5578-3187-bc32-28cb4f132c40	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5578-3187-59dd-8a8238ab1602	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5578-3187-cefc-45cef30cc84d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5578-3187-d495-1eec9eb04c36	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5578-3187-336f-b788b7aaf01e	TH	THA	764	Thailand 	Tajska	\N
00040000-5578-3187-fe0e-72c2c7beab97	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5578-3187-d748-89f290e61194	TG	TGO	768	Togo 	Togo	\N
00040000-5578-3187-0c61-f6774621ae9c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5578-3187-494a-60a21aa5c969	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5578-3187-74b4-2346a0bb89f5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5578-3187-3ada-c7cdebb046ed	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5578-3187-6c4c-3536660483ad	TR	TUR	792	Turkey 	Turčija	\N
00040000-5578-3187-d324-6be1f3611409	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5578-3187-4493-75fa98e1ffd9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-3187-1889-f3f6f60b0c3c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5578-3187-5fe8-3c5781e06e54	UG	UGA	800	Uganda 	Uganda	\N
00040000-5578-3187-9387-0b703fc7d918	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5578-3187-60dd-61d363542df8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5578-3187-6df3-59b332ff892e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5578-3187-5f60-e1006d6c25c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5578-3187-d12a-af8c4cd6fc12	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5578-3187-89f3-55cd90b75ada	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5578-3187-c3bc-eac86bb624c1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5578-3187-5d21-9839361e0566	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5578-3187-8c49-cce8d3088275	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5578-3187-a182-e7b3e9e0927b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5578-3187-70b4-a12757fa25a9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-3187-c1af-60a0b29a36c8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5578-3187-ecec-14eec0ea64e6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5578-3187-be50-8e7499b1cbb0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5578-3187-114e-cc5ed338c5d8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5578-3187-0547-2ac706b6bcea	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5578-3187-5b92-81b9a7eab251	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2851 (class 0 OID 6864507)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6864310)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5578-3188-7613-420741420fe6	000e0000-5578-3188-d41b-4c057abed579	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5578-3187-5fd6-11fae57e0e48
000d0000-5578-3188-4afd-d9211ccd6ede	000e0000-5578-3188-d41b-4c057abed579	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-3187-5fd6-11fae57e0e48
000d0000-5578-3188-7a80-9cb0bba92b21	000e0000-5578-3188-d41b-4c057abed579	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5578-3187-3e52-30252b2ac6ed
000d0000-5578-3188-1afd-02f715fbaee1	000e0000-5578-3188-d41b-4c057abed579	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5578-3187-2399-49dba7ab9f84
000d0000-5578-3188-1139-a7f94b23cde3	000e0000-5578-3188-d41b-4c057abed579	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5578-3187-2399-49dba7ab9f84
000d0000-5578-3188-1d7e-70bcebaaa331	000e0000-5578-3188-d41b-4c057abed579	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5578-3187-2399-49dba7ab9f84
000d0000-5578-3188-e016-29e0a5f9619b	000e0000-5578-3188-d41b-4c057abed579	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-3187-5fd6-11fae57e0e48
\.


--
-- TOC entry 2815 (class 0 OID 6864130)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6864178)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6864110)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5578-3188-8bbd-aab4efa1e406	00080000-5578-3188-ec05-e181271c4df3	00090000-5578-3188-ca17-225bd715c060	AK		
\.


--
-- TOC entry 2793 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6864227)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6864252)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6864067)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5578-3188-0332-05f86920ee38	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5578-3188-15c4-18e1f810184a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5578-3188-5366-35727ed7993d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5578-3188-05cf-01729efdc2a3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5578-3188-6c67-0b531208ba62	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5578-3188-157a-fe61d6d381dd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5578-3188-d28d-032c2b39ea6d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5578-3188-2f55-cd65e439bf75	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5578-3188-067f-12f791bce5d9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5578-3188-1e35-defd6cce4ebc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5578-3188-6dda-72a14a784121	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5578-3188-ac52-09cc6a00b591	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5578-3188-d52f-6d1a2c853eaf	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-3188-a058-3c483e92a22c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-3188-6f53-82bfd6a9d834	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5578-3188-014e-b77e5b4da3cd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2804 (class 0 OID 6863980)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5578-3188-9030-bfff85319ddf	00000000-5578-3188-6c67-0b531208ba62	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5578-3188-e839-749a407ce346	00000000-5578-3188-6c67-0b531208ba62	00010000-5578-3188-b6f1-801f167180f9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5578-3188-e915-8a34c3ae9307	00000000-5578-3188-157a-fe61d6d381dd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2805 (class 0 OID 6863991)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5578-3188-2647-6a0e2cf86960	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5578-3188-de2f-b7540dfcef69	00010000-5578-3188-3730-b8629c36c6a2	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5578-3188-bcc5-fc3d12e910b2	00010000-5578-3188-71d9-2cb1904bb7cc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5578-3188-5e92-234a89667378	00010000-5578-3188-8e70-180c5b257265	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5578-3188-9aed-d02b77e23ecf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5578-3188-8e93-17296f673b57	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5578-3188-eb9d-f97ec85606da	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5578-3188-13ff-f23946689f2e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5578-3188-ca17-225bd715c060	00010000-5578-3188-b846-14ae5ae94883	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5578-3188-c77d-fe125cd6cdc4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5578-3188-bce5-0e6048055163	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5578-3188-7cfc-18a1ea4bc3c1	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5578-3188-065f-35a37c585ed5	00010000-5578-3188-97f3-4e19a58161e2	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2795 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6863945)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5578-3187-8ccb-00589967afa2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5578-3187-196d-947c3bc253c1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5578-3187-2821-a64c1fe9ce5b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5578-3187-1762-695f3ea6e613	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5578-3187-103e-4aade32fa73c	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5578-3187-1c7c-5c31ad9d7b4a	Abonma-read	Abonma - branje	f
00030000-5578-3187-8940-76394f9a5bba	Abonma-write	Abonma - spreminjanje	f
00030000-5578-3187-8b22-6b447170cd34	Alternacija-read	Alternacija - branje	f
00030000-5578-3187-ee47-925d1aed9704	Alternacija-write	Alternacija - spreminjanje	f
00030000-5578-3187-09b4-431851d31e5d	Arhivalija-read	Arhivalija - branje	f
00030000-5578-3187-baba-cba83e6bff11	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5578-3187-29ac-8cba15956137	Besedilo-read	Besedilo - branje	f
00030000-5578-3187-f6a1-dd58b2ae2613	Besedilo-write	Besedilo - spreminjanje	f
00030000-5578-3187-34c0-9ba41f73e19e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5578-3187-4ccb-69e941a8ac34	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5578-3187-d96e-28946a32e2d1	Dogodek-read	Dogodek - branje	f
00030000-5578-3187-405d-5666624e584b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5578-3187-04ef-b93772a50f4f	Drzava-read	Drzava - branje	f
00030000-5578-3187-dfc1-129830633f64	Drzava-write	Drzava - spreminjanje	f
00030000-5578-3187-6868-ea9379807e48	Funkcija-read	Funkcija - branje	f
00030000-5578-3187-7399-94b0ba48cf09	Funkcija-write	Funkcija - spreminjanje	f
00030000-5578-3187-c198-4850dec9a28f	Gostovanje-read	Gostovanje - branje	f
00030000-5578-3187-3f96-312e037e3939	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5578-3187-f53e-7406e4b1f679	Gostujoca-read	Gostujoca - branje	f
00030000-5578-3187-d682-f932eec1279c	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5578-3187-52b2-9fdb3f5c86be	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5578-3187-9206-030640b3e616	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5578-3187-d40f-4d67b5969739	Kupec-read	Kupec - branje	f
00030000-5578-3187-781d-930a2898ed9b	Kupec-write	Kupec - spreminjanje	f
00030000-5578-3187-5a7c-9d42d5bfb9b7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5578-3187-a74b-3ac9f34a8d1a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5578-3187-7b6f-346a89cf713b	Option-read	Option - branje	f
00030000-5578-3187-2be6-06e66df5a19f	Option-write	Option - spreminjanje	f
00030000-5578-3187-5a44-cd67dd7add4b	OptionValue-read	OptionValue - branje	f
00030000-5578-3187-10bb-c2783a3000ed	OptionValue-write	OptionValue - spreminjanje	f
00030000-5578-3187-f352-86e63ba19d80	Oseba-read	Oseba - branje	f
00030000-5578-3187-b6b4-950e7f2196fc	Oseba-write	Oseba - spreminjanje	f
00030000-5578-3187-d70d-dda1f1443c46	Permission-read	Permission - branje	f
00030000-5578-3187-b2f7-0b8a0b9f4741	Permission-write	Permission - spreminjanje	f
00030000-5578-3187-659e-ca64654d7e5a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5578-3187-9c3d-36f8655e6ba9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5578-3187-1a02-8a4adfb8fffb	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5578-3187-a21c-8579a0e93c35	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5578-3187-2a5a-2defd8b4dae7	Pogodba-read	Pogodba - branje	f
00030000-5578-3187-9f99-53c627917c1f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5578-3187-09ac-4ebdb89ee4bf	Popa-read	Popa - branje	f
00030000-5578-3187-0054-13a17a3f809c	Popa-write	Popa - spreminjanje	f
00030000-5578-3187-edb0-b3ce2e771497	Posta-read	Posta - branje	f
00030000-5578-3187-c383-b2c0289c4617	Posta-write	Posta - spreminjanje	f
00030000-5578-3187-8d06-6d52c86567a5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5578-3187-c3da-0d9f2d4dd06a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5578-3187-40d5-148c8321547c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5578-3187-b908-ec86e14efdef	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5578-3187-aa87-6079ed9554bd	Predstava-read	Predstava - branje	f
00030000-5578-3187-e5a3-6172827cc880	Predstava-write	Predstava - spreminjanje	f
00030000-5578-3187-030f-4c86be37f06b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5578-3187-6866-259e298c9b03	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5578-3187-1d4f-425d132a52a6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5578-3187-5cad-e451d0fdc0df	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5578-3187-6982-3f5faca4b8cc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5578-3187-7490-77bb01d726d2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5578-3187-5c43-521aef34ed1b	ProgramDela-read	ProgramDela - branje	f
00030000-5578-3187-ffa4-49eb58b8e0a5	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5578-3187-aff9-b2ae6c718efe	ProgramFestival-read	ProgramFestival - branje	f
00030000-5578-3187-88ff-ec0bfbf0830c	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5578-3187-d4fe-ecd55c2df413	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5578-3187-9ff7-388bd9616310	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5578-3187-f0e6-01e7a7439a22	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5578-3187-d440-6dfe219fe3f7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5578-3187-da13-0494ed9ff0cf	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5578-3187-a3a1-103f5350cf7f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5578-3187-b94b-4c55a459634e	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5578-3187-f80c-09d61eed1e03	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5578-3187-b8a2-72520cf322a1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5578-3187-2471-f2ae3b575651	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5578-3187-3b03-bcb271b3a00e	Prostor-read	Prostor - branje	f
00030000-5578-3187-85e7-d2ebca7bd49a	Prostor-write	Prostor - spreminjanje	f
00030000-5578-3187-b605-2fe3fd11b9af	Racun-read	Racun - branje	f
00030000-5578-3187-2217-36b4ff2ed8ec	Racun-write	Racun - spreminjanje	f
00030000-5578-3187-19c4-7df241776e17	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5578-3187-8b51-fd03bb8ad258	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5578-3187-1fa8-0025ff358e84	Readme-read	Readme - branje	f
00030000-5578-3187-35f0-3e8f910b1b74	Readme-write	Readme - spreminjanje	f
00030000-5578-3187-040a-aed6a9d6ca65	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5578-3187-f886-d15d4817cd5d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5578-3187-9b81-2e9f709d05c3	Rekvizit-read	Rekvizit - branje	f
00030000-5578-3187-a87f-4cc573c784a6	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5578-3187-8bd8-351d591b8694	Revizija-read	Revizija - branje	f
00030000-5578-3187-d66a-f5b41125a272	Revizija-write	Revizija - spreminjanje	f
00030000-5578-3187-2357-83783ca03ec9	Rezervacija-read	Rezervacija - branje	f
00030000-5578-3187-d2ac-0f02df649970	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5578-3187-937a-d380a6bb3b85	Role-read	Role - branje	f
00030000-5578-3187-c1ca-5ed7c160bf01	Role-write	Role - spreminjanje	f
00030000-5578-3187-f300-1c42deba394d	SedezniRed-read	SedezniRed - branje	f
00030000-5578-3187-b464-f56f195e40e2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5578-3187-b066-688432613aed	Sedez-read	Sedez - branje	f
00030000-5578-3187-32fd-7b470fdf569c	Sedez-write	Sedez - spreminjanje	f
00030000-5578-3187-eafa-6c914e1be40c	Sezona-read	Sezona - branje	f
00030000-5578-3187-dd88-ae0c7d86c813	Sezona-write	Sezona - spreminjanje	f
00030000-5578-3187-dd34-4496a5ca2705	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5578-3187-5198-e6a41e1bdb00	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5578-3187-5bcf-283eb87ff543	Stevilcenje-read	Stevilcenje - branje	f
00030000-5578-3187-ade3-f58a90811cb3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5578-3187-ebb6-56b2b588f464	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5578-3187-fb31-ca85fbfad83b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5578-3187-ac21-2e091049e5e3	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5578-3187-743b-727518b3fa39	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5578-3187-06c6-a44032633fc4	Telefonska-read	Telefonska - branje	f
00030000-5578-3187-5911-f3f545c66478	Telefonska-write	Telefonska - spreminjanje	f
00030000-5578-3187-4327-1b7349f718d9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5578-3187-176b-4e06d31d2e1e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5578-3187-cba2-78b0e6de8644	TipFunkcije-read	TipFunkcije - branje	f
00030000-5578-3187-0993-68f951692aae	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5578-3187-7202-1f516545d4c8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5578-3187-1ec0-a728a4e2e384	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5578-3187-7da4-688e019329da	Trr-read	Trr - branje	f
00030000-5578-3187-5c35-c4ec622324ee	Trr-write	Trr - spreminjanje	f
00030000-5578-3187-3282-1154e7fa297a	Uprizoritev-read	Uprizoritev - branje	f
00030000-5578-3187-c177-cbea590aff26	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5578-3187-7aa8-42dbd46bea82	User-read	User - branje	f
00030000-5578-3187-ee71-0d45d0c52b59	User-write	User - spreminjanje	f
00030000-5578-3187-e90f-3daf673df698	Vaja-read	Vaja - branje	f
00030000-5578-3187-241b-722afc88c726	Vaja-write	Vaja - spreminjanje	f
00030000-5578-3187-6e1e-f3dde03f7642	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5578-3187-cbd2-9e961783f57b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5578-3187-b816-a4fc981d02f0	Zaposlitev-read	Zaposlitev - branje	f
00030000-5578-3187-4f3b-55e9f41ff22f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5578-3187-644f-26e8ca124fa6	Zasedenost-read	Zasedenost - branje	f
00030000-5578-3187-2aa3-a714ae8e04fd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5578-3187-484a-9876dc2c88d2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5578-3187-75b2-a6b3043943a4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5578-3187-7a1b-3ec49bfd73c9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5578-3187-8dc1-799d05dd0a11	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2802 (class 0 OID 6863964)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5578-3188-c3e9-b6b4e35aef32	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-1c7c-5c31ad9d7b4a
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-8940-76394f9a5bba
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-8b22-6b447170cd34
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-ee47-925d1aed9704
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-09b4-431851d31e5d
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-d96e-28946a32e2d1
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-1762-695f3ea6e613
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-405d-5666624e584b
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-dfc1-129830633f64
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-6868-ea9379807e48
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-7399-94b0ba48cf09
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-c198-4850dec9a28f
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-3f96-312e037e3939
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-f53e-7406e4b1f679
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-d682-f932eec1279c
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-52b2-9fdb3f5c86be
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-9206-030640b3e616
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-7b6f-346a89cf713b
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-5a44-cd67dd7add4b
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-f352-86e63ba19d80
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-b6b4-950e7f2196fc
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-09ac-4ebdb89ee4bf
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-0054-13a17a3f809c
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-edb0-b3ce2e771497
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-c383-b2c0289c4617
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-40d5-148c8321547c
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-b908-ec86e14efdef
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-aa87-6079ed9554bd
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-e5a3-6172827cc880
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-6982-3f5faca4b8cc
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-7490-77bb01d726d2
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-3b03-bcb271b3a00e
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-85e7-d2ebca7bd49a
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-040a-aed6a9d6ca65
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-f886-d15d4817cd5d
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-9b81-2e9f709d05c3
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-a87f-4cc573c784a6
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-eafa-6c914e1be40c
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-dd88-ae0c7d86c813
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-cba2-78b0e6de8644
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-3282-1154e7fa297a
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-c177-cbea590aff26
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-e90f-3daf673df698
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-241b-722afc88c726
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-644f-26e8ca124fa6
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-2aa3-a714ae8e04fd
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-484a-9876dc2c88d2
00020000-5578-3188-348e-ac0296d38553	00030000-5578-3187-7a1b-3ec49bfd73c9
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-1c7c-5c31ad9d7b4a
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-09b4-431851d31e5d
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-d96e-28946a32e2d1
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-c198-4850dec9a28f
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-f53e-7406e4b1f679
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-52b2-9fdb3f5c86be
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-9206-030640b3e616
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-7b6f-346a89cf713b
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-5a44-cd67dd7add4b
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-f352-86e63ba19d80
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-b6b4-950e7f2196fc
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-09ac-4ebdb89ee4bf
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-edb0-b3ce2e771497
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-40d5-148c8321547c
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-b908-ec86e14efdef
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-aa87-6079ed9554bd
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-3b03-bcb271b3a00e
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-040a-aed6a9d6ca65
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-9b81-2e9f709d05c3
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-eafa-6c914e1be40c
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-06c6-a44032633fc4
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-5911-f3f545c66478
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-7da4-688e019329da
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-5c35-c4ec622324ee
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-b816-a4fc981d02f0
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-4f3b-55e9f41ff22f
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-484a-9876dc2c88d2
00020000-5578-3188-41ea-1a971060b1d4	00030000-5578-3187-7a1b-3ec49bfd73c9
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-1c7c-5c31ad9d7b4a
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-8b22-6b447170cd34
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-09b4-431851d31e5d
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-baba-cba83e6bff11
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-29ac-8cba15956137
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-34c0-9ba41f73e19e
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-d96e-28946a32e2d1
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-6868-ea9379807e48
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-c198-4850dec9a28f
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-f53e-7406e4b1f679
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-52b2-9fdb3f5c86be
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-7b6f-346a89cf713b
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-5a44-cd67dd7add4b
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-f352-86e63ba19d80
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-09ac-4ebdb89ee4bf
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-edb0-b3ce2e771497
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-aa87-6079ed9554bd
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-6982-3f5faca4b8cc
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-3b03-bcb271b3a00e
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-040a-aed6a9d6ca65
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-9b81-2e9f709d05c3
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-eafa-6c914e1be40c
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-cba2-78b0e6de8644
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-e90f-3daf673df698
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-644f-26e8ca124fa6
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-484a-9876dc2c88d2
00020000-5578-3188-5938-cee94086834d	00030000-5578-3187-7a1b-3ec49bfd73c9
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-1c7c-5c31ad9d7b4a
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-8940-76394f9a5bba
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-ee47-925d1aed9704
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-09b4-431851d31e5d
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-d96e-28946a32e2d1
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-c198-4850dec9a28f
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-f53e-7406e4b1f679
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-7b6f-346a89cf713b
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-5a44-cd67dd7add4b
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-09ac-4ebdb89ee4bf
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-edb0-b3ce2e771497
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-aa87-6079ed9554bd
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-3b03-bcb271b3a00e
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-040a-aed6a9d6ca65
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-9b81-2e9f709d05c3
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-eafa-6c914e1be40c
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-cba2-78b0e6de8644
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-484a-9876dc2c88d2
00020000-5578-3188-392b-0476b7bad02f	00030000-5578-3187-7a1b-3ec49bfd73c9
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-1c7c-5c31ad9d7b4a
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-09b4-431851d31e5d
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-d96e-28946a32e2d1
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-04ef-b93772a50f4f
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-c198-4850dec9a28f
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-f53e-7406e4b1f679
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-7b6f-346a89cf713b
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-5a44-cd67dd7add4b
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-09ac-4ebdb89ee4bf
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-edb0-b3ce2e771497
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-aa87-6079ed9554bd
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-3b03-bcb271b3a00e
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-040a-aed6a9d6ca65
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-9b81-2e9f709d05c3
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-eafa-6c914e1be40c
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-4327-1b7349f718d9
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-2821-a64c1fe9ce5b
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-cba2-78b0e6de8644
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-484a-9876dc2c88d2
00020000-5578-3188-3332-927e1f63d03d	00030000-5578-3187-7a1b-3ec49bfd73c9
\.


--
-- TOC entry 2830 (class 0 OID 6864259)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6864290)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6864426)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6864024)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5578-3188-ec05-e181271c4df3	00040000-5578-3187-1d0d-39b57dc261c8	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-3188-ba39-4cc0c129b35d	00040000-5578-3187-1d0d-39b57dc261c8	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-3188-5c26-ff0195b92abd	00040000-5578-3187-1d0d-39b57dc261c8	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-3188-93b4-bd1703bbdc5d	00040000-5578-3187-1d0d-39b57dc261c8	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2809 (class 0 OID 6864059)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5578-3187-c43c-efde8c9b0a31	8341	Adlešiči
00050000-5578-3187-9237-3b5f6e79c80d	5270	Ajdovščina
00050000-5578-3187-6698-83edc491abc9	6280	Ankaran/Ancarano
00050000-5578-3187-0ca4-876d4de11aa3	9253	Apače
00050000-5578-3187-08da-159f59385c48	8253	Artiče
00050000-5578-3187-0a95-d82899a78ef6	4275	Begunje na Gorenjskem
00050000-5578-3187-d378-057c754ab752	1382	Begunje pri Cerknici
00050000-5578-3187-596a-72662d7edcf1	9231	Beltinci
00050000-5578-3187-4037-f662d8d8246c	2234	Benedikt
00050000-5578-3187-793e-e7d343bb98a8	2345	Bistrica ob Dravi
00050000-5578-3187-7e4b-1839cb6f7f44	3256	Bistrica ob Sotli
00050000-5578-3187-1f0f-95c98b9ca773	8259	Bizeljsko
00050000-5578-3187-c04f-d5e130be0b27	1223	Blagovica
00050000-5578-3187-bdac-1ebef0c0cddd	8283	Blanca
00050000-5578-3187-88b0-6ac0258ad3de	4260	Bled
00050000-5578-3187-b777-359bfd9f9e4f	4273	Blejska Dobrava
00050000-5578-3187-0e3c-cbd3ce556b06	9265	Bodonci
00050000-5578-3187-23a7-d5116c1402ed	9222	Bogojina
00050000-5578-3187-a257-a7de37c7c391	4263	Bohinjska Bela
00050000-5578-3187-f41d-0608d602562e	4264	Bohinjska Bistrica
00050000-5578-3187-e9a4-4bd5e1d315fa	4265	Bohinjsko jezero
00050000-5578-3187-e654-f05822ba059c	1353	Borovnica
00050000-5578-3187-bc27-56bf0fa1deab	8294	Boštanj
00050000-5578-3187-edea-7abaabf2fe13	5230	Bovec
00050000-5578-3187-f290-13939f81eda6	5295	Branik
00050000-5578-3187-8e75-fc117817af9b	3314	Braslovče
00050000-5578-3187-6a3b-b09a0bb3cfd3	5223	Breginj
00050000-5578-3187-0f25-1d9ff2bb358d	8280	Brestanica
00050000-5578-3187-42c7-248986fded94	2354	Bresternica
00050000-5578-3187-6e7b-3648928be17a	4243	Brezje
00050000-5578-3187-fda8-0710ab315333	1351	Brezovica pri Ljubljani
00050000-5578-3187-7fcd-45420a6a791e	8250	Brežice
00050000-5578-3187-cba3-ee4703c074e5	4210	Brnik - Aerodrom
00050000-5578-3187-ae05-b050b9fb1d44	8321	Brusnice
00050000-5578-3187-9f83-5195f2e2f77c	3255	Buče
00050000-5578-3187-5fe2-7f251847677d	8276	Bučka 
00050000-5578-3187-81f1-dea76ee8d57c	9261	Cankova
00050000-5578-3187-8ce5-dc16438fdb32	3000	Celje 
00050000-5578-3187-9d20-c155cbec034d	3001	Celje - poštni predali
00050000-5578-3187-cf7f-82edb8bbd364	4207	Cerklje na Gorenjskem
00050000-5578-3187-f832-ffad1cfa0f5f	8263	Cerklje ob Krki
00050000-5578-3187-8ff3-aeb161c9545b	1380	Cerknica
00050000-5578-3187-e871-a14cd75c17bc	5282	Cerkno
00050000-5578-3187-e45f-4abec6c57a0f	2236	Cerkvenjak
00050000-5578-3187-fe3f-41ab550abe31	2215	Ceršak
00050000-5578-3187-5f6a-e30353dac696	2326	Cirkovce
00050000-5578-3187-edc5-65c0e9765a63	2282	Cirkulane
00050000-5578-3187-4576-a950e759b058	5273	Col
00050000-5578-3187-2ee1-cdf4327cf277	8251	Čatež ob Savi
00050000-5578-3187-1571-869d5b8509d1	1413	Čemšenik
00050000-5578-3187-4087-f397f8b59613	5253	Čepovan
00050000-5578-3187-7784-f5b5405240f0	9232	Črenšovci
00050000-5578-3187-a51a-86346e23fcc6	2393	Črna na Koroškem
00050000-5578-3187-e3ce-bc6f8e7e46d6	6275	Črni Kal
00050000-5578-3187-0b11-b3748be09acf	5274	Črni Vrh nad Idrijo
00050000-5578-3187-b434-9218c53cfdac	5262	Črniče
00050000-5578-3187-edd5-948ffbae42fc	8340	Črnomelj
00050000-5578-3187-84b7-3790943c1532	6271	Dekani
00050000-5578-3187-2e40-935996aca63e	5210	Deskle
00050000-5578-3187-cda0-6636a53157b6	2253	Destrnik
00050000-5578-3187-a087-19c73e11efa8	6215	Divača
00050000-5578-3187-a661-5996afe037cd	1233	Dob
00050000-5578-3187-64a1-b3cce2513682	3224	Dobje pri Planini
00050000-5578-3187-7c31-333a93c113f8	8257	Dobova
00050000-5578-3187-b5cd-3fc332ccac43	1423	Dobovec
00050000-5578-3187-07d1-e7e6d4f8c328	5263	Dobravlje
00050000-5578-3187-94c5-85763df82456	3204	Dobrna
00050000-5578-3187-ddcc-f7420dae1c7c	8211	Dobrnič
00050000-5578-3187-5f88-acf1babee911	1356	Dobrova
00050000-5578-3187-ceae-76c627b77f83	9223	Dobrovnik/Dobronak 
00050000-5578-3187-c2de-a87fec784fb0	5212	Dobrovo v Brdih
00050000-5578-3187-5f44-e805bf7f9d9f	1431	Dol pri Hrastniku
00050000-5578-3187-a279-d46de06769fa	1262	Dol pri Ljubljani
00050000-5578-3187-7cf1-20c975f997f5	1273	Dole pri Litiji
00050000-5578-3187-bc8f-6ba674f672f4	1331	Dolenja vas
00050000-5578-3187-0085-b3f0daa418c2	8350	Dolenjske Toplice
00050000-5578-3187-d33a-f43ce4493eee	1230	Domžale
00050000-5578-3187-ead8-4bfe118fdcf6	2252	Dornava
00050000-5578-3187-e61d-a95e19e77894	5294	Dornberk
00050000-5578-3187-a16c-e3940571c3aa	1319	Draga
00050000-5578-3187-c098-03ec0e54a88b	8343	Dragatuš
00050000-5578-3187-ce71-eaad98b2b202	3222	Dramlje
00050000-5578-3187-d581-cd79d32c0096	2370	Dravograd
00050000-5578-3187-45e6-4c0d18b6652b	4203	Duplje
00050000-5578-3187-9643-646afd4a8cf0	6221	Dutovlje
00050000-5578-3187-11c5-c4418e865426	8361	Dvor
00050000-5578-3187-2944-068a3f11d09b	2343	Fala
00050000-5578-3187-d7e8-f87b8bd8611d	9208	Fokovci
00050000-5578-3187-2e27-b8db07ea7901	2313	Fram
00050000-5578-3187-5409-9f1663c5eb93	3213	Frankolovo
00050000-5578-3187-966f-2442c2ec614d	1274	Gabrovka
00050000-5578-3187-aee2-bfd713d4a906	8254	Globoko
00050000-5578-3187-42ff-58a4217a4029	5275	Godovič
00050000-5578-3187-98f2-27db1812c644	4204	Golnik
00050000-5578-3187-144e-4ce097c9effb	3303	Gomilsko
00050000-5578-3187-5e93-979849d8a488	4224	Gorenja vas
00050000-5578-3187-5561-599b169869cb	3263	Gorica pri Slivnici
00050000-5578-3187-c877-65f19465350e	2272	Gorišnica
00050000-5578-3187-616b-a7ee13f89370	9250	Gornja Radgona
00050000-5578-3187-ddc9-43a72e0e1b9c	3342	Gornji Grad
00050000-5578-3187-a301-c297d36bae95	4282	Gozd Martuljek
00050000-5578-3187-a479-c09fbb97f886	6272	Gračišče
00050000-5578-3187-872b-6b8794399b95	9264	Grad
00050000-5578-3187-7b13-c98b213cdc97	8332	Gradac
00050000-5578-3187-b478-b843b0eb37e8	1384	Grahovo
00050000-5578-3187-9901-ac3d56bdf124	5242	Grahovo ob Bači
00050000-5578-3187-bda6-d727499bd78a	5251	Grgar
00050000-5578-3187-9c35-13d07376a545	3302	Griže
00050000-5578-3187-c7c2-cc2145cf15a9	3231	Grobelno
00050000-5578-3187-338a-ec5fcec11841	1290	Grosuplje
00050000-5578-3187-32f9-0e1a89c08b19	2288	Hajdina
00050000-5578-3187-636e-286db69c8dcc	8362	Hinje
00050000-5578-3187-d97e-da5f391b522d	2311	Hoče
00050000-5578-3187-7714-351a40a35217	9205	Hodoš/Hodos
00050000-5578-3187-5ed7-18fc57367e64	1354	Horjul
00050000-5578-3187-4ffc-93fe377fb045	1372	Hotedršica
00050000-5578-3187-c6e5-decd2120dd31	1430	Hrastnik
00050000-5578-3187-024c-9f9619e0824c	6225	Hruševje
00050000-5578-3187-1dcb-773bee4e7a35	4276	Hrušica
00050000-5578-3187-cd96-89b6c5472776	5280	Idrija
00050000-5578-3187-9a1e-a8a288ce436c	1292	Ig
00050000-5578-3187-5fe7-8e1710c94da3	6250	Ilirska Bistrica
00050000-5578-3187-7c8d-c4f55a77dbb7	6251	Ilirska Bistrica-Trnovo
00050000-5578-3187-df1f-de2e7222ca06	1295	Ivančna Gorica
00050000-5578-3187-382d-e2aa48511d53	2259	Ivanjkovci
00050000-5578-3187-2f6d-58253d5717d2	1411	Izlake
00050000-5578-3187-e969-13d25545b111	6310	Izola/Isola
00050000-5578-3187-9058-75aab4ccfdd0	2222	Jakobski Dol
00050000-5578-3187-22a8-0c346128144d	2221	Jarenina
00050000-5578-3187-19fe-291da863d304	6254	Jelšane
00050000-5578-3187-b13f-b8e3fa883d20	4270	Jesenice
00050000-5578-3187-ce7a-7c5110696041	8261	Jesenice na Dolenjskem
00050000-5578-3187-4bd7-9ebdcf77a6ef	3273	Jurklošter
00050000-5578-3187-696d-b3fc0e673733	2223	Jurovski Dol
00050000-5578-3187-e97d-bf6f71604201	2256	Juršinci
00050000-5578-3187-6173-5a6f70b88e4f	5214	Kal nad Kanalom
00050000-5578-3187-e0f3-b05f8b6a4438	3233	Kalobje
00050000-5578-3187-5ad4-6c21eefc4c80	4246	Kamna Gorica
00050000-5578-3187-5a42-40851ec537de	2351	Kamnica
00050000-5578-3187-22af-30bd2749e646	1241	Kamnik
00050000-5578-3187-179b-04788fcd47d1	5213	Kanal
00050000-5578-3187-1e06-be0108142552	8258	Kapele
00050000-5578-3187-ad02-9026e4213b74	2362	Kapla
00050000-5578-3187-a57d-a89ca6983b1f	2325	Kidričevo
00050000-5578-3187-7b18-19fd423374ee	1412	Kisovec
00050000-5578-3187-e70d-4000c80732a5	6253	Knežak
00050000-5578-3187-0a32-432d608db00e	5222	Kobarid
00050000-5578-3187-c1a2-8932fd2f15da	9227	Kobilje
00050000-5578-3187-d945-541442b645d7	1330	Kočevje
00050000-5578-3187-6e64-83362b234141	1338	Kočevska Reka
00050000-5578-3187-5216-fb1ddc04cc7f	2276	Kog
00050000-5578-3187-e304-7d2b2f616825	5211	Kojsko
00050000-5578-3187-3485-bbf2f4396b27	6223	Komen
00050000-5578-3187-1a5b-4dc04168a6ea	1218	Komenda
00050000-5578-3187-921b-22cc93173937	6000	Koper/Capodistria 
00050000-5578-3187-13d7-7376dd5585cb	6001	Koper/Capodistria - poštni predali
00050000-5578-3187-2e45-61976e337172	8282	Koprivnica
00050000-5578-3187-b51c-75d16b4d0df2	5296	Kostanjevica na Krasu
00050000-5578-3187-b6d7-74978a8ea456	8311	Kostanjevica na Krki
00050000-5578-3187-df10-cd6d3f62d9fc	1336	Kostel
00050000-5578-3187-cfb1-bad41b6b7e03	6256	Košana
00050000-5578-3187-cb53-434ae04eeebc	2394	Kotlje
00050000-5578-3187-0e38-5c1f0a3fe618	6240	Kozina
00050000-5578-3187-a32e-5312a7951a03	3260	Kozje
00050000-5578-3187-32fc-31df7450d883	4000	Kranj 
00050000-5578-3187-2792-b236012113a9	4001	Kranj - poštni predali
00050000-5578-3187-834e-8c0487e42dc6	4280	Kranjska Gora
00050000-5578-3187-a18d-35e405551534	1281	Kresnice
00050000-5578-3187-1a1c-d8c10559deb0	4294	Križe
00050000-5578-3187-6ff7-01f82c03f761	9206	Križevci
00050000-5578-3187-a3d6-4c72438730ea	9242	Križevci pri Ljutomeru
00050000-5578-3187-6ed9-9a06c6092264	1301	Krka
00050000-5578-3187-4e22-3aeca5aa2788	8296	Krmelj
00050000-5578-3187-eab5-aa1fec593e44	4245	Kropa
00050000-5578-3187-b3fe-bf8140e403b4	8262	Krška vas
00050000-5578-3187-9943-6f2e605863ca	8270	Krško
00050000-5578-3187-200b-32efb5a4c647	9263	Kuzma
00050000-5578-3187-68c8-7ab0d8fade2d	2318	Laporje
00050000-5578-3187-6920-13568011f6c8	3270	Laško
00050000-5578-3187-3a9b-c71dc52c9407	1219	Laze v Tuhinju
00050000-5578-3187-cb09-c4f20b175026	2230	Lenart v Slovenskih goricah
00050000-5578-3187-7f63-10ba6510ff36	9220	Lendava/Lendva
00050000-5578-3187-46f6-93c41e65f465	4248	Lesce
00050000-5578-3187-d135-ae85b5f1714b	3261	Lesično
00050000-5578-3187-a3e9-96d1120575dc	8273	Leskovec pri Krškem
00050000-5578-3187-ef7d-8c6f4d798a84	2372	Libeliče
00050000-5578-3187-8aa7-a42880b56972	2341	Limbuš
00050000-5578-3187-f46a-6a403a1b916f	1270	Litija
00050000-5578-3187-1933-7b1e27914a18	3202	Ljubečna
00050000-5578-3187-a9da-c3f91cc167b2	1000	Ljubljana 
00050000-5578-3187-84d4-3f77c3a50ca0	1001	Ljubljana - poštni predali
00050000-5578-3187-def7-bc0eaf11095b	1231	Ljubljana - Črnuče
00050000-5578-3187-2eb1-4e3ff69e8c10	1261	Ljubljana - Dobrunje
00050000-5578-3187-92db-aa8df3e2c650	1260	Ljubljana - Polje
00050000-5578-3187-c484-f22057a43b40	1210	Ljubljana - Šentvid
00050000-5578-3187-951f-cfa7ecfb1d69	1211	Ljubljana - Šmartno
00050000-5578-3187-dd7c-7b61040017d5	3333	Ljubno ob Savinji
00050000-5578-3187-f3cf-bf21328bdf3b	9240	Ljutomer
00050000-5578-3187-8383-3bb6ba2aded0	3215	Loče
00050000-5578-3187-8944-88e6e068e6c4	5231	Log pod Mangartom
00050000-5578-3187-6bc9-b2fba6e8e6aa	1358	Log pri Brezovici
00050000-5578-3187-6eb0-886b2b11514e	1370	Logatec
00050000-5578-3187-4bff-6946a12575da	1371	Logatec
00050000-5578-3187-033b-fe7f7ed881cc	1434	Loka pri Zidanem Mostu
00050000-5578-3187-59b0-c825a87720de	3223	Loka pri Žusmu
00050000-5578-3187-f4d9-e0fd489b300d	6219	Lokev
00050000-5578-3187-1056-fc284631e168	1318	Loški Potok
00050000-5578-3187-a4a9-a172713a6106	2324	Lovrenc na Dravskem polju
00050000-5578-3187-28ef-9c7e43a4cd47	2344	Lovrenc na Pohorju
00050000-5578-3187-a45f-8f1a8a770ae5	3334	Luče
00050000-5578-3187-e41b-825867147488	1225	Lukovica
00050000-5578-3187-91e1-644b28140aef	9202	Mačkovci
00050000-5578-3187-8747-6d4935973386	2322	Majšperk
00050000-5578-3187-e660-f6568074bece	2321	Makole
00050000-5578-3187-4a10-0c6693652a4e	9243	Mala Nedelja
00050000-5578-3187-110c-70f15a21f451	2229	Malečnik
00050000-5578-3187-aa7f-c9e7a8d581a5	6273	Marezige
00050000-5578-3187-1bea-61b5aac4fb5e	2000	Maribor 
00050000-5578-3187-69df-9d2fcfb7f977	2001	Maribor - poštni predali
00050000-5578-3187-a86d-72d7124de8d3	2206	Marjeta na Dravskem polju
00050000-5578-3187-a60e-d6197877a230	2281	Markovci
00050000-5578-3187-669b-ae2ec196a964	9221	Martjanci
00050000-5578-3187-c7d3-06d0a285bd88	6242	Materija
00050000-5578-3187-821a-a19a6ceb7c34	4211	Mavčiče
00050000-5578-3187-68c3-202445f2d443	1215	Medvode
00050000-5578-3187-a5d2-6fd5d877adcd	1234	Mengeš
00050000-5578-3187-158e-c3d9da6558d8	8330	Metlika
00050000-5578-3187-8093-60f205874de9	2392	Mežica
00050000-5578-3187-7fd0-ff2ff5fe3000	2204	Miklavž na Dravskem polju
00050000-5578-3187-4b86-0a0c8f25f9b0	2275	Miklavž pri Ormožu
00050000-5578-3187-e10f-12f8696ada9d	5291	Miren
00050000-5578-3187-ca1d-01afa7e9774d	8233	Mirna
00050000-5578-3187-e59c-2935a423cab1	8216	Mirna Peč
00050000-5578-3187-e6ee-179107b38485	2382	Mislinja
00050000-5578-3187-33b0-5d2f57cd250e	4281	Mojstrana
00050000-5578-3187-918e-5b9d5b6a8f8a	8230	Mokronog
00050000-5578-3187-b879-40791d80b8e4	1251	Moravče
00050000-5578-3187-ac29-fbce4d9accc5	9226	Moravske Toplice
00050000-5578-3187-134d-278721309fe2	5216	Most na Soči
00050000-5578-3187-ee54-abad473c8606	1221	Motnik
00050000-5578-3187-cac5-d6ca778b9f91	3330	Mozirje
00050000-5578-3187-be87-37580baf34ff	9000	Murska Sobota 
00050000-5578-3187-df54-5b812d0afa97	9001	Murska Sobota - poštni predali
00050000-5578-3187-1cd7-b0badcabca91	2366	Muta
00050000-5578-3187-d94d-69e62384d73f	4202	Naklo
00050000-5578-3187-ce09-3c7f4c4b7ab9	3331	Nazarje
00050000-5578-3187-142d-ef6b405e6848	1357	Notranje Gorice
00050000-5578-3187-f82c-d5b5e67a3daa	3203	Nova Cerkev
00050000-5578-3187-ea2e-faf29842f8fb	5000	Nova Gorica 
00050000-5578-3187-e660-6ce335bed4d1	5001	Nova Gorica - poštni predali
00050000-5578-3187-c780-0fa452571295	1385	Nova vas
00050000-5578-3187-e83b-8bf569b28143	8000	Novo mesto
00050000-5578-3187-ad5e-45cd21dd1efe	8001	Novo mesto - poštni predali
00050000-5578-3187-81d8-1a5f98d26084	6243	Obrov
00050000-5578-3187-25ca-bfd59b88f980	9233	Odranci
00050000-5578-3187-b06b-66bf994db63e	2317	Oplotnica
00050000-5578-3187-2ddf-f2e6a133873b	2312	Orehova vas
00050000-5578-3187-83eb-90216695d54a	2270	Ormož
00050000-5578-3187-52cb-924f0c6c4f68	1316	Ortnek
00050000-5578-3187-6ed4-8c37ccfd0e60	1337	Osilnica
00050000-5578-3187-1ea8-2479763ccc80	8222	Otočec
00050000-5578-3187-d5b7-6ba31f7f1851	2361	Ožbalt
00050000-5578-3187-9507-f8dc45fff244	2231	Pernica
00050000-5578-3187-bab9-46f08ca8d540	2211	Pesnica pri Mariboru
00050000-5578-3187-1fdd-8985514f5cc7	9203	Petrovci
00050000-5578-3187-bc23-0133f9c51969	3301	Petrovče
00050000-5578-3187-ef5d-8966be361baa	6330	Piran/Pirano
00050000-5578-3187-1208-cdd776f5c980	8255	Pišece
00050000-5578-3187-5820-fd0c205c1430	6257	Pivka
00050000-5578-3187-565d-e2d0567cb044	6232	Planina
00050000-5578-3187-9b29-8c317cff5c5d	3225	Planina pri Sevnici
00050000-5578-3187-c6d7-6a37086d4176	6276	Pobegi
00050000-5578-3187-1c01-ecdc2e027d0a	8312	Podbočje
00050000-5578-3187-89fb-1d0bae868fe6	5243	Podbrdo
00050000-5578-3187-2bff-3ec4e6fdbed0	3254	Podčetrtek
00050000-5578-3187-4f72-54d95c528abb	2273	Podgorci
00050000-5578-3187-05b1-c63f08d92c1d	6216	Podgorje
00050000-5578-3187-5af7-b583afc25e55	2381	Podgorje pri Slovenj Gradcu
00050000-5578-3187-431c-b03188e81566	6244	Podgrad
00050000-5578-3187-e438-24eb8ca23ff5	1414	Podkum
00050000-5578-3187-da13-cbdb49306147	2286	Podlehnik
00050000-5578-3187-eab5-314d5dc23b8d	5272	Podnanos
00050000-5578-3187-bf16-f6a2bc5f5f13	4244	Podnart
00050000-5578-3187-8970-c7c139bd51d3	3241	Podplat
00050000-5578-3187-e627-317be9e6160e	3257	Podsreda
00050000-5578-3187-3039-6d06c7cc8483	2363	Podvelka
00050000-5578-3187-effb-fb82080119c0	2208	Pohorje
00050000-5578-3187-c910-33d2889d652f	2257	Polenšak
00050000-5578-3187-afa1-2b5b5029b7c3	1355	Polhov Gradec
00050000-5578-3187-eb54-b6141567320f	4223	Poljane nad Škofjo Loko
00050000-5578-3187-25d2-4bc009482f3b	2319	Poljčane
00050000-5578-3187-3b13-b566d7a3cfeb	1272	Polšnik
00050000-5578-3187-5463-88544d13cf3f	3313	Polzela
00050000-5578-3187-688f-a1c16e8e3534	3232	Ponikva
00050000-5578-3187-c328-da9268996b76	6320	Portorož/Portorose
00050000-5578-3187-23aa-a9da068bdc9c	6230	Postojna
00050000-5578-3187-caaa-8aadcfd85a96	2331	Pragersko
00050000-5578-3187-7183-6aef40e41239	3312	Prebold
00050000-5578-3187-6384-0819b02c5e85	4205	Preddvor
00050000-5578-3187-cfc7-a11b9bd197f4	6255	Prem
00050000-5578-3187-8e40-47366fcdfb11	1352	Preserje
00050000-5578-3187-c7c3-e15c1abd3deb	6258	Prestranek
00050000-5578-3187-df1e-980034e66c07	2391	Prevalje
00050000-5578-3187-11e3-ad19bb4af17f	3262	Prevorje
00050000-5578-3187-850e-80e7238162e8	1276	Primskovo 
00050000-5578-3187-bc05-81da3c6aea04	3253	Pristava pri Mestinju
00050000-5578-3187-dc67-4a0c21b97e36	9207	Prosenjakovci/Partosfalva
00050000-5578-3187-340e-35695a234781	5297	Prvačina
00050000-5578-3187-e466-3d44060bd6aa	2250	Ptuj
00050000-5578-3187-0324-ad88986fa18c	2323	Ptujska Gora
00050000-5578-3187-4e13-ecca4e10e121	9201	Puconci
00050000-5578-3187-c897-1295e7aa8fc1	2327	Rače
00050000-5578-3187-0ae3-978997b2bdf9	1433	Radeče
00050000-5578-3187-80dc-154c75a2211e	9252	Radenci
00050000-5578-3187-17c6-a35f4065bf63	2360	Radlje ob Dravi
00050000-5578-3187-ef7c-debbe1ae5392	1235	Radomlje
00050000-5578-3187-0cde-90fdc57349f0	4240	Radovljica
00050000-5578-3187-66e5-d9fc79bdb718	8274	Raka
00050000-5578-3187-609a-c16190300e3a	1381	Rakek
00050000-5578-3187-f09a-10cf13d9e228	4283	Rateče - Planica
00050000-5578-3187-537a-c8afd11630e0	2390	Ravne na Koroškem
00050000-5578-3187-6ead-a2239205cb3e	9246	Razkrižje
00050000-5578-3187-95aa-53eb777bb4a8	3332	Rečica ob Savinji
00050000-5578-3187-9623-e484dda8035d	5292	Renče
00050000-5578-3187-a3c4-e3a8301374c1	1310	Ribnica
00050000-5578-3187-c4f1-0da5e4a0fa5b	2364	Ribnica na Pohorju
00050000-5578-3187-b9bc-685f2ae62d72	3272	Rimske Toplice
00050000-5578-3187-2897-f59832a7d59b	1314	Rob
00050000-5578-3187-78b9-9d73f63f8111	5215	Ročinj
00050000-5578-3187-e24c-dde9b86bf52f	3250	Rogaška Slatina
00050000-5578-3187-b773-a7c6fc3a1b03	9262	Rogašovci
00050000-5578-3187-af63-b8b9543b5630	3252	Rogatec
00050000-5578-3187-03f6-c105618197e0	1373	Rovte
00050000-5578-3187-b8c7-bfbecba22d40	2342	Ruše
00050000-5578-3187-08f4-429d9d97e403	1282	Sava
00050000-5578-3187-ef71-9a3687c245d4	6333	Sečovlje/Sicciole
00050000-5578-3187-5b73-e2036bc14448	4227	Selca
00050000-5578-3187-aab4-b4974b9ca7da	2352	Selnica ob Dravi
00050000-5578-3187-894c-fc7815b2c648	8333	Semič
00050000-5578-3187-abe1-999b59df6301	8281	Senovo
00050000-5578-3187-c79f-14792d1e9a99	6224	Senožeče
00050000-5578-3187-d1e6-499f41988053	8290	Sevnica
00050000-5578-3187-6fd5-500040ac1b23	6210	Sežana
00050000-5578-3187-f434-da00b6a1d34c	2214	Sladki Vrh
00050000-5578-3187-f071-2f297072c847	5283	Slap ob Idrijci
00050000-5578-3187-2f24-db33c314efff	2380	Slovenj Gradec
00050000-5578-3187-0211-317234452af0	2310	Slovenska Bistrica
00050000-5578-3187-c214-f676b752c13b	3210	Slovenske Konjice
00050000-5578-3187-72b6-cd9bce757106	1216	Smlednik
00050000-5578-3187-c1fc-d3dd5e3f235d	5232	Soča
00050000-5578-3187-f55a-6694605ba054	1317	Sodražica
00050000-5578-3187-b49e-abe5b0d9979a	3335	Solčava
00050000-5578-3187-951b-0caca008b957	5250	Solkan
00050000-5578-3187-3f70-1c34f704d7bf	4229	Sorica
00050000-5578-3187-b748-1568a62d7cc6	4225	Sovodenj
00050000-5578-3187-2775-88f3b903f5bd	5281	Spodnja Idrija
00050000-5578-3187-61bc-507b8423ad14	2241	Spodnji Duplek
00050000-5578-3187-b57b-4a52fc5fbf7c	9245	Spodnji Ivanjci
00050000-5578-3187-859a-ab225dc5a735	2277	Središče ob Dravi
00050000-5578-3187-cc15-582a043d3826	4267	Srednja vas v Bohinju
00050000-5578-3187-fb72-e52371b4bec7	8256	Sromlje 
00050000-5578-3187-d0f4-6476c251569b	5224	Srpenica
00050000-5578-3187-1aba-474e509a2206	1242	Stahovica
00050000-5578-3187-9aae-cf247150213f	1332	Stara Cerkev
00050000-5578-3187-06a5-67ef755ace83	8342	Stari trg ob Kolpi
00050000-5578-3187-db5c-a87f64a3fd66	1386	Stari trg pri Ložu
00050000-5578-3187-b336-be716a314626	2205	Starše
00050000-5578-3187-c18d-469244309bba	2289	Stoperce
00050000-5578-3187-edf9-392e4320948b	8322	Stopiče
00050000-5578-3187-5613-dac2d0591bff	3206	Stranice
00050000-5578-3187-13f8-36611666eb6b	8351	Straža
00050000-5578-3187-428b-997c923d12a7	1313	Struge
00050000-5578-3187-e02c-c5cf7c665bd5	8293	Studenec
00050000-5578-3187-18a7-31641065e87a	8331	Suhor
00050000-5578-3187-c24b-f740e9d6dc5a	2233	Sv. Ana v Slovenskih goricah
00050000-5578-3187-970a-f249e61d6a2a	2235	Sv. Trojica v Slovenskih goricah
00050000-5578-3187-07ed-ac4d326118bb	2353	Sveti Duh na Ostrem Vrhu
00050000-5578-3187-55b3-476e6f542337	9244	Sveti Jurij ob Ščavnici
00050000-5578-3187-c1fa-24e6815c29d2	3264	Sveti Štefan
00050000-5578-3187-4a0d-aa2529df4129	2258	Sveti Tomaž
00050000-5578-3187-cbef-5266ab572e2f	9204	Šalovci
00050000-5578-3187-ea16-c32c713dadb9	5261	Šempas
00050000-5578-3187-7048-26541414aa1a	5290	Šempeter pri Gorici
00050000-5578-3187-63e8-3b74acb3150f	3311	Šempeter v Savinjski dolini
00050000-5578-3187-df4c-f7988347d316	4208	Šenčur
00050000-5578-3187-b320-4dca09524c8d	2212	Šentilj v Slovenskih goricah
00050000-5578-3187-4d7e-560483098ad3	8297	Šentjanž
00050000-5578-3187-dcce-64b73fbb306d	2373	Šentjanž pri Dravogradu
00050000-5578-3187-85a1-6828a4573b4f	8310	Šentjernej
00050000-5578-3187-f6e7-d0a75ad6b169	3230	Šentjur
00050000-5578-3187-eb51-549112328d4b	3271	Šentrupert
00050000-5578-3187-d7bc-bdbf78e188ea	8232	Šentrupert
00050000-5578-3187-b436-a9a472521f2f	1296	Šentvid pri Stični
00050000-5578-3187-4e61-9a6130c5e041	8275	Škocjan
00050000-5578-3187-cf18-9c773e766978	6281	Škofije
00050000-5578-3187-ffc4-ff3020e43ea5	4220	Škofja Loka
00050000-5578-3187-8a46-de3aaf9eb36b	3211	Škofja vas
00050000-5578-3187-b5ed-c41652fb1f89	1291	Škofljica
00050000-5578-3187-889b-4a9e08430361	6274	Šmarje
00050000-5578-3187-9748-3b2a42b5bf74	1293	Šmarje - Sap
00050000-5578-3187-5b23-0b7e4810e7f4	3240	Šmarje pri Jelšah
00050000-5578-3187-437c-998c155b0555	8220	Šmarješke Toplice
00050000-5578-3187-5106-b9af3fc89183	2315	Šmartno na Pohorju
00050000-5578-3187-6d96-0273f596d351	3341	Šmartno ob Dreti
00050000-5578-3187-e244-f46dfd3ba2d9	3327	Šmartno ob Paki
00050000-5578-3187-b2e4-e57304ea92a3	1275	Šmartno pri Litiji
00050000-5578-3187-58f1-f69cf77c61ea	2383	Šmartno pri Slovenj Gradcu
00050000-5578-3187-d793-c999edfcff99	3201	Šmartno v Rožni dolini
00050000-5578-3187-a783-87b49d3a6ec2	3325	Šoštanj
00050000-5578-3187-4267-ad8d79328892	6222	Štanjel
00050000-5578-3187-cb3a-54039b16cf48	3220	Štore
00050000-5578-3187-6faf-5a8b7fc37043	3304	Tabor
00050000-5578-3187-60ea-985f89509410	3221	Teharje
00050000-5578-3187-1fef-d2aa5a05995c	9251	Tišina
00050000-5578-3187-04da-d740425fa236	5220	Tolmin
00050000-5578-3187-4dc9-c7366d4dc7c4	3326	Topolšica
00050000-5578-3187-a33f-8a589707f13b	2371	Trbonje
00050000-5578-3187-267c-9f7ffcc6f580	1420	Trbovlje
00050000-5578-3187-9f19-468b6d85157a	8231	Trebelno 
00050000-5578-3187-a4c5-b7cb4753c4f9	8210	Trebnje
00050000-5578-3187-e2b1-f601abc4269d	5252	Trnovo pri Gorici
00050000-5578-3187-be48-a108f8c164b2	2254	Trnovska vas
00050000-5578-3187-18b1-9db0e6bb042b	1222	Trojane
00050000-5578-3187-842c-b2a14723a13a	1236	Trzin
00050000-5578-3187-f96a-10cb3c2997ef	4290	Tržič
00050000-5578-3187-a2c4-c9edc4503bd8	8295	Tržišče
00050000-5578-3187-8f0e-6294bb47c4ed	1311	Turjak
00050000-5578-3187-6963-174f8e7ddfca	9224	Turnišče
00050000-5578-3187-5553-f6fafbb2b04b	8323	Uršna sela
00050000-5578-3187-5af3-f0773b9cba34	1252	Vače
00050000-5578-3187-7b51-61b1346f28d6	3320	Velenje 
00050000-5578-3187-176b-07218eaaca6f	3322	Velenje - poštni predali
00050000-5578-3187-5f8d-ad79fb2fe6ef	8212	Velika Loka
00050000-5578-3187-5dca-ad5eea72dd2f	2274	Velika Nedelja
00050000-5578-3187-ceed-dfbe3532fc32	9225	Velika Polana
00050000-5578-3187-5d2c-a5272feebc8a	1315	Velike Lašče
00050000-5578-3187-8d4f-5afcdb4aaadf	8213	Veliki Gaber
00050000-5578-3187-4523-c67147d0c100	9241	Veržej
00050000-5578-3187-66b8-42b432b235a0	1312	Videm - Dobrepolje
00050000-5578-3187-4799-cae59a8b6681	2284	Videm pri Ptuju
00050000-5578-3187-66a2-58b47e586b71	8344	Vinica
00050000-5578-3187-7097-9eca7491421a	5271	Vipava
00050000-5578-3187-4248-d421ab9736ea	4212	Visoko
00050000-5578-3187-c15c-fba6233158f8	1294	Višnja Gora
00050000-5578-3187-41e4-72a6d767a79f	3205	Vitanje
00050000-5578-3187-d6df-52c226e2039c	2255	Vitomarci
00050000-5578-3187-9538-062de4c1930f	1217	Vodice
00050000-5578-3187-4041-749a4f8f00a6	3212	Vojnik\t
00050000-5578-3187-714e-8a7e68d8661a	5293	Volčja Draga
00050000-5578-3187-ed22-5a409482038a	2232	Voličina
00050000-5578-3187-0059-771fdf4cd850	3305	Vransko
00050000-5578-3187-09ec-4e3d81b7d30f	6217	Vremski Britof
00050000-5578-3187-a1b7-2ebd44331a43	1360	Vrhnika
00050000-5578-3187-e85a-a594f97c93fa	2365	Vuhred
00050000-5578-3187-1d02-121cddce753f	2367	Vuzenica
00050000-5578-3187-3fff-4284607121e6	8292	Zabukovje 
00050000-5578-3187-ddf5-e00ec3cbdf4e	1410	Zagorje ob Savi
00050000-5578-3187-8cb7-39c290571c05	1303	Zagradec
00050000-5578-3187-f18a-2c9405536348	2283	Zavrč
00050000-5578-3187-5c33-270dd4110e8d	8272	Zdole 
00050000-5578-3187-0b36-f1401a3d55f4	4201	Zgornja Besnica
00050000-5578-3187-0b30-d9232f014b65	2242	Zgornja Korena
00050000-5578-3187-23e2-99b00cb41322	2201	Zgornja Kungota
00050000-5578-3187-bc6e-d0c8b8769810	2316	Zgornja Ložnica
00050000-5578-3187-8fd8-d686d69b4ce1	2314	Zgornja Polskava
00050000-5578-3187-e4f4-ed78331b8e16	2213	Zgornja Velka
00050000-5578-3187-9649-ea8b536b00f1	4247	Zgornje Gorje
00050000-5578-3187-0786-ede4284998a3	4206	Zgornje Jezersko
00050000-5578-3187-1234-9589962ddf2e	2285	Zgornji Leskovec
00050000-5578-3187-03ab-5cac81425c99	1432	Zidani Most
00050000-5578-3187-f580-19c5eca5c2ef	3214	Zreče
00050000-5578-3187-0058-638e535649dd	4209	Žabnica
00050000-5578-3187-c437-fc70d64caacf	3310	Žalec
00050000-5578-3187-bf35-c1c82a9ee1eb	4228	Železniki
00050000-5578-3187-df85-9cbc4afdc393	2287	Žetale
00050000-5578-3187-9f11-1fc4d1d62806	4226	Žiri
00050000-5578-3187-7a70-c32462a1ed9f	4274	Žirovnica
00050000-5578-3187-bc86-74fc6a17762b	8360	Žužemberk
\.


--
-- TOC entry 2826 (class 0 OID 6864233)
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
-- TOC entry 2808 (class 0 OID 6864044)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6864122)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6864245)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6864365)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6864418)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5578-3188-d519-59fdf05f0c4a	00080000-5578-3188-5c26-ff0195b92abd	0987	A
00190000-5578-3188-e90f-1ef51cd185d5	00080000-5578-3188-ba39-4cc0c129b35d	0989	A
\.


--
-- TOC entry 2852 (class 0 OID 6864533)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6864584)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6864546)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6864554)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6864274)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5578-3188-fd08-a4f5eaa10ce3	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5578-3188-cf3e-1ab9253eb0d7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5578-3188-8c68-af49cf1f83a3	0003	Kazinska	t	84	Kazinska dvorana
00220000-5578-3188-4418-25075b69d273	0004	Mali oder	t	24	Mali oder 
00220000-5578-3188-5e88-7a3d18f13714	0005	Komorni oder	t	15	Komorni oder
00220000-5578-3188-943a-526f2979321f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5578-3188-a56c-6cbf34f0f61e	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2824 (class 0 OID 6864218)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6864208)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6864407)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6864342)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6863916)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5578-3188-b6f1-801f167180f9	00010000-5578-3188-6ec8-881c8ae7b4bc	2015-06-10 14:46:01	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROgRNWrWtSM0vpZr4Z9mJPELuSMNp5hm2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2833 (class 0 OID 6864284)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6863954)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5578-3188-00fe-92e00caa9cd4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5578-3188-c3e9-b6b4e35aef32	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5578-3188-d0f7-880efe569871	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5578-3188-7215-d359972f1718	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5578-3188-348e-ac0296d38553	planer	Planer dogodkov v koledarju	t
00020000-5578-3188-41ea-1a971060b1d4	kadrovska	Kadrovska služba	t
00020000-5578-3188-5938-cee94086834d	arhivar	Ažuriranje arhivalij	t
00020000-5578-3188-392b-0476b7bad02f	igralec	Igralec	t
00020000-5578-3188-3332-927e1f63d03d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2799 (class 0 OID 6863938)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5578-3188-b6f1-801f167180f9	00020000-5578-3188-d0f7-880efe569871
00010000-5578-3188-6ec8-881c8ae7b4bc	00020000-5578-3188-d0f7-880efe569871
\.


--
-- TOC entry 2835 (class 0 OID 6864298)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6864239)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6864189)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 6864603)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5578-3187-de3e-63a01dc25c4f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5578-3187-52ed-06314177fd65	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5578-3187-43ad-9b13bfab0630	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5578-3187-5115-4406a4f51a51	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5578-3187-32e6-221b92247375	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2858 (class 0 OID 6864595)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5578-3187-ad30-367f6dc15f14	00230000-5578-3187-5115-4406a4f51a51	popa
00240000-5578-3187-f772-ae144b79ac47	00230000-5578-3187-5115-4406a4f51a51	oseba
00240000-5578-3187-fb93-4080ca8853ae	00230000-5578-3187-52ed-06314177fd65	prostor
00240000-5578-3187-8eed-4fccbb2d273d	00230000-5578-3187-5115-4406a4f51a51	besedilo
00240000-5578-3187-2c03-a24b3a5ca36f	00230000-5578-3187-5115-4406a4f51a51	uprizoritev
00240000-5578-3187-3a71-65ea31329fad	00230000-5578-3187-5115-4406a4f51a51	funkcija
00240000-5578-3187-57f2-8d9dcb724264	00230000-5578-3187-5115-4406a4f51a51	tipfunkcije
00240000-5578-3187-e338-a767a1058d64	00230000-5578-3187-5115-4406a4f51a51	alternacija
00240000-5578-3187-694b-31e7cc1d4dbd	00230000-5578-3187-de3e-63a01dc25c4f	pogodba
00240000-5578-3187-494e-ac42348c2a57	00230000-5578-3187-5115-4406a4f51a51	zaposlitev
\.


--
-- TOC entry 2857 (class 0 OID 6864590)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6864352)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6864016)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6864195)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5578-3189-f7aa-f6b915620c6f	00180000-5578-3188-a682-19ac196084fd	000c0000-5578-3188-458a-f827ab5c3181	00090000-5578-3188-ca17-225bd715c060	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-3189-ef06-e1fa7288a045	00180000-5578-3188-a682-19ac196084fd	000c0000-5578-3188-4ad3-670982a7cf78	00090000-5578-3188-c77d-fe125cd6cdc4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-3189-2401-c665cc118373	00180000-5578-3188-a682-19ac196084fd	000c0000-5578-3188-1714-ba4e7b2ad9d8	00090000-5578-3188-bcc5-fc3d12e910b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-3189-a3ba-4563ceca118c	00180000-5578-3188-a682-19ac196084fd	000c0000-5578-3188-ff1d-9d3ea3ef8dce	00090000-5578-3188-de2f-b7540dfcef69	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-3189-239f-74985f564b9b	00180000-5578-3188-a682-19ac196084fd	000c0000-5578-3188-2a3f-93cb01485781	00090000-5578-3188-7cfc-18a1ea4bc3c1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-3189-a2d6-6580eac99bbf	00180000-5578-3188-90f0-32575a6ea5f2	\N	00090000-5578-3188-7cfc-18a1ea4bc3c1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2843 (class 0 OID 6864396)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5578-3187-5fd6-11fae57e0e48	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5578-3187-cb06-dba30c80f42e	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5578-3187-ba1b-722039ec6f59	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5578-3187-3e52-30252b2ac6ed	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5578-3187-52bf-8b8d9287c5b4	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5578-3187-dde1-d227960f4e07	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5578-3187-3221-d2d34cd92eb8	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5578-3187-8bc8-8e6c814d41bb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5578-3187-2410-004514ff2a8a	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5578-3187-0c32-a3d6ed4138a5	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5578-3187-3123-f3508d22a954	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5578-3187-4d03-2836adac7eaf	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5578-3187-ebea-95e321c0fcc5	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5578-3187-0831-099c69d0bb25	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5578-3187-9072-c459a1bedd84	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5578-3187-2399-49dba7ab9f84	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2855 (class 0 OID 6864573)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5578-3187-27a7-523951cc5724	01	Velika predstava	f	1.00	1.00
002b0000-5578-3187-92a4-4980398d3f5f	02	Mala predstava	f	0.50	0.50
002b0000-5578-3187-694e-74e7f99cf079	03	Mala koprodukcija	t	0.40	1.00
002b0000-5578-3187-7d47-10b1a73b7e7e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5578-3187-26c3-1adf37edd862	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2811 (class 0 OID 6864079)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6863925)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5578-3188-6ec8-881c8ae7b4bc	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROv9cGnzFR6E/zSU3QVgV0fJy.4zEy.iC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5578-3188-71d9-2cb1904bb7cc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5578-3188-3730-b8629c36c6a2	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5578-3188-b846-14ae5ae94883	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5578-3188-97f3-4e19a58161e2	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5578-3188-8e70-180c5b257265	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5578-3188-e60d-c2b4b296821e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5578-3188-b6f1-801f167180f9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 6864453)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5578-3188-4050-6d1c5302d96c	00160000-5578-3188-03ce-d7028f2a0eb9	00150000-5578-3187-0cde-53feda646c24	00140000-5578-3187-8ff9-2bb35d40f532	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5578-3188-5e88-7a3d18f13714
000e0000-5578-3188-d41b-4c057abed579	00160000-5578-3188-8d52-715dd1c1b9ce	00150000-5578-3187-e1f4-cff0905424f0	00140000-5578-3187-231a-62d21983f48f	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5578-3188-943a-526f2979321f
000e0000-5578-3188-8272-df8afc4ddf9d	\N	00150000-5578-3187-e1f4-cff0905424f0	00140000-5578-3187-231a-62d21983f48f	00190000-5578-3188-d519-59fdf05f0c4a	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5578-3188-5e88-7a3d18f13714
000e0000-5578-3188-17ec-0c4df9c22258	\N	00150000-5578-3187-e1f4-cff0905424f0	00140000-5578-3187-231a-62d21983f48f	00190000-5578-3188-d519-59fdf05f0c4a	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5578-3188-5e88-7a3d18f13714
\.


--
-- TOC entry 2816 (class 0 OID 6864141)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5578-3188-3d14-286b5466b588	000e0000-5578-3188-d41b-4c057abed579	1	
00200000-5578-3188-1483-a095ac20a230	000e0000-5578-3188-d41b-4c057abed579	2	
\.


--
-- TOC entry 2831 (class 0 OID 6864266)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6864335)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6864173)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6864443)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5578-3187-8ff9-2bb35d40f532	01	Drama	drama (SURS 01)
00140000-5578-3187-60d1-fdec230198db	02	Opera	opera (SURS 02)
00140000-5578-3187-e227-abc9a2f3374c	03	Balet	balet (SURS 03)
00140000-5578-3187-7e90-277537844fff	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5578-3187-61a4-526b756d8195	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5578-3187-231a-62d21983f48f	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5578-3187-aab9-c32300b60c44	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2837 (class 0 OID 6864325)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5578-3187-531d-3d5fd15c1e44	01	Opera	opera
00150000-5578-3187-974b-4eaf2fead8b3	02	Opereta	opereta
00150000-5578-3187-7f10-0dd22e0cd413	03	Balet	balet
00150000-5578-3187-7164-e05624bbbd86	04	Plesne prireditve	plesne prireditve
00150000-5578-3187-952c-fba2dc5507f0	05	Lutkovno gledališče	lutkovno gledališče
00150000-5578-3187-051f-23559fcaba44	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5578-3187-4b01-8ffea23b6ac8	07	Biografska drama	biografska drama
00150000-5578-3187-0cde-53feda646c24	08	Komedija	komedija
00150000-5578-3187-14f3-c40f97f6c0d0	09	Črna komedija	črna komedija
00150000-5578-3187-00d8-bdc80373b590	10	E-igra	E-igra
00150000-5578-3187-e1f4-cff0905424f0	11	Kriminalka	kriminalka
00150000-5578-3187-627b-3bccea6d7779	12	Musical	musical
\.


--
-- TOC entry 2383 (class 2606 OID 6863979)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6864500)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6864490)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6864395)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6864163)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6864188)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6864105)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6864529)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6864321)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6864139)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 6864182)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6864119)
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
-- TOC entry 2475 (class 2606 OID 6864231)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6864258)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6864077)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 6863988)
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
-- TOC entry 2390 (class 2606 OID 6864012)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6863968)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2374 (class 2606 OID 6863953)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6864264)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6864297)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6864438)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6864041)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6864065)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6864237)
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
-- TOC entry 2405 (class 2606 OID 6864055)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6864126)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6864249)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6864377)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6864423)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6864544)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6864588)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6864551)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 6864571)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6864281)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6864222)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 6864213)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6864417)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6864349)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6863924)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 6864288)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6863942)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2376 (class 2606 OID 6863962)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6864306)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6864244)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6864194)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6864612)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 6864600)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6864594)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6864362)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6864021)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6864204)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6864406)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 6864583)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6864090)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6863937)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6864469)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6864148)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6864272)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6864340)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 6864177)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6864451)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6864333)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 1259 OID 6864170)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2523 (class 1259 OID 6864363)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6864364)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6864043)
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
-- TOC entry 2488 (class 1259 OID 6864265)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2482 (class 1259 OID 6864251)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2483 (class 1259 OID 6864250)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 6864149)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2510 (class 1259 OID 6864322)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6864324)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2512 (class 1259 OID 6864323)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2422 (class 1259 OID 6864121)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2423 (class 1259 OID 6864120)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 6864440)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 6864441)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 6864442)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2582 (class 1259 OID 6864572)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2550 (class 1259 OID 6864474)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2551 (class 1259 OID 6864471)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2552 (class 1259 OID 6864475)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2553 (class 1259 OID 6864473)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2554 (class 1259 OID 6864472)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2412 (class 1259 OID 6864092)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 6864091)
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
-- TOC entry 2388 (class 1259 OID 6864015)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2498 (class 1259 OID 6864289)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 6864183)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2378 (class 1259 OID 6863969)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2379 (class 1259 OID 6863970)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2503 (class 1259 OID 6864309)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2504 (class 1259 OID 6864308)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2505 (class 1259 OID 6864307)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2426 (class 1259 OID 6864127)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2427 (class 1259 OID 6864129)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2428 (class 1259 OID 6864128)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2592 (class 1259 OID 6864602)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2462 (class 1259 OID 6864217)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2463 (class 1259 OID 6864215)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2464 (class 1259 OID 6864214)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2465 (class 1259 OID 6864216)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2369 (class 1259 OID 6863943)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6863944)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 6864273)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2477 (class 1259 OID 6864238)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2519 (class 1259 OID 6864350)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2520 (class 1259 OID 6864351)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 6864530)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 6864531)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2574 (class 1259 OID 6864532)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2401 (class 1259 OID 6864057)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6864056)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2403 (class 1259 OID 6864058)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 6864589)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 6864378)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 6864379)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2564 (class 1259 OID 6864504)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2565 (class 1259 OID 6864506)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2566 (class 1259 OID 6864502)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2567 (class 1259 OID 6864505)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2568 (class 1259 OID 6864503)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2516 (class 1259 OID 6864341)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 6864226)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2469 (class 1259 OID 6864225)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2470 (class 1259 OID 6864223)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2471 (class 1259 OID 6864224)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2352 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 6864492)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6864491)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2575 (class 1259 OID 6864545)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2433 (class 1259 OID 6864140)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 6863990)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2385 (class 1259 OID 6863989)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2393 (class 1259 OID 6864022)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6864023)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2457 (class 1259 OID 6864207)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 6864206)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2459 (class 1259 OID 6864205)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2578 (class 1259 OID 6864553)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2579 (class 1259 OID 6864552)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2440 (class 1259 OID 6864172)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2441 (class 1259 OID 6864168)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2442 (class 1259 OID 6864165)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2443 (class 1259 OID 6864166)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2444 (class 1259 OID 6864164)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2445 (class 1259 OID 6864169)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2446 (class 1259 OID 6864167)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2400 (class 1259 OID 6864042)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 6864106)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2419 (class 1259 OID 6864108)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2420 (class 1259 OID 6864107)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2421 (class 1259 OID 6864109)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2476 (class 1259 OID 6864232)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2546 (class 1259 OID 6864439)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6864470)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2391 (class 1259 OID 6864013)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6864014)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2513 (class 1259 OID 6864334)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 6864613)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6864078)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2595 (class 1259 OID 6864601)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2496 (class 1259 OID 6864283)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2497 (class 1259 OID 6864282)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 6864501)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2355 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2408 (class 1259 OID 6864066)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6864452)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 6864424)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 6864425)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 6863963)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2447 (class 1259 OID 6864171)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2626 (class 2606 OID 6864749)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2623 (class 2606 OID 6864734)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2624 (class 2606 OID 6864739)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2628 (class 2606 OID 6864759)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2622 (class 2606 OID 6864729)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2627 (class 2606 OID 6864754)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2625 (class 2606 OID 6864744)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2657 (class 2606 OID 6864904)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2658 (class 2606 OID 6864909)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6864664)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2645 (class 2606 OID 6864844)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2644 (class 2606 OID 6864839)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2643 (class 2606 OID 6864834)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2621 (class 2606 OID 6864724)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6864874)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6864884)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2652 (class 2606 OID 6864879)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2616 (class 2606 OID 6864699)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2615 (class 2606 OID 6864694)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6864824)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 6864929)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 6864934)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6864939)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2683 (class 2606 OID 6865034)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2668 (class 2606 OID 6864959)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2665 (class 2606 OID 6864944)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2669 (class 2606 OID 6864964)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2667 (class 2606 OID 6864954)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2666 (class 2606 OID 6864949)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2614 (class 2606 OID 6864689)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2613 (class 2606 OID 6864684)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2606 (class 2606 OID 6864649)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2605 (class 2606 OID 6864644)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 6864854)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2629 (class 2606 OID 6864764)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2601 (class 2606 OID 6864624)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2602 (class 2606 OID 6864629)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2650 (class 2606 OID 6864869)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2649 (class 2606 OID 6864864)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2648 (class 2606 OID 6864859)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2617 (class 2606 OID 6864704)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2619 (class 2606 OID 6864714)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2618 (class 2606 OID 6864709)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2685 (class 2606 OID 6865044)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2636 (class 2606 OID 6864799)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2634 (class 2606 OID 6864789)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2633 (class 2606 OID 6864784)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2635 (class 2606 OID 6864794)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2599 (class 2606 OID 6864614)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2600 (class 2606 OID 6864619)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 6864849)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2642 (class 2606 OID 6864829)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2655 (class 2606 OID 6864894)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2656 (class 2606 OID 6864899)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 6865004)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 6865009)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2679 (class 2606 OID 6865014)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2611 (class 2606 OID 6864674)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2610 (class 2606 OID 6864669)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2612 (class 2606 OID 6864679)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2684 (class 2606 OID 6865039)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2659 (class 2606 OID 6864914)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 6864919)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2674 (class 2606 OID 6864989)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2676 (class 2606 OID 6864999)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2672 (class 2606 OID 6864979)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2675 (class 2606 OID 6864994)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2673 (class 2606 OID 6864984)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2654 (class 2606 OID 6864889)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 6864819)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2639 (class 2606 OID 6864814)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2637 (class 2606 OID 6864804)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2638 (class 2606 OID 6864809)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2671 (class 2606 OID 6864974)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2670 (class 2606 OID 6864969)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2680 (class 2606 OID 6865019)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2620 (class 2606 OID 6864719)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6864924)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2604 (class 2606 OID 6864639)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2603 (class 2606 OID 6864634)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2607 (class 2606 OID 6864654)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2608 (class 2606 OID 6864659)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 6864779)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2631 (class 2606 OID 6864774)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2630 (class 2606 OID 6864769)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2682 (class 2606 OID 6865029)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 6865024)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 14:46:01 CEST

--
-- PostgreSQL database dump complete
--

