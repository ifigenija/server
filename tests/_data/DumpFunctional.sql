--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 12:26:57 CEST

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
-- TOC entry 180 (class 1259 OID 6823802)
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
-- TOC entry 227 (class 1259 OID 6824324)
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
-- TOC entry 226 (class 1259 OID 6824307)
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
-- TOC entry 219 (class 1259 OID 6824211)
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
-- TOC entry 194 (class 1259 OID 6823981)
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
-- TOC entry 197 (class 1259 OID 6824015)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6823924)
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
-- TOC entry 228 (class 1259 OID 6824338)
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
-- TOC entry 213 (class 1259 OID 6824141)
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
-- TOC entry 192 (class 1259 OID 6823961)
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
-- TOC entry 196 (class 1259 OID 6824009)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6823941)
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
-- TOC entry 202 (class 1259 OID 6824058)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6824083)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6823898)
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
-- TOC entry 181 (class 1259 OID 6823811)
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
-- TOC entry 182 (class 1259 OID 6823822)
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
-- TOC entry 177 (class 1259 OID 6823776)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6823795)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6824090)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6824121)
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
-- TOC entry 223 (class 1259 OID 6824257)
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
-- TOC entry 184 (class 1259 OID 6823855)
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
-- TOC entry 186 (class 1259 OID 6823890)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6824064)
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
-- TOC entry 185 (class 1259 OID 6823875)
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
-- TOC entry 191 (class 1259 OID 6823953)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6824076)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6824196)
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
-- TOC entry 222 (class 1259 OID 6824249)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6824364)
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
-- TOC entry 233 (class 1259 OID 6824415)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6824377)
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
-- TOC entry 231 (class 1259 OID 6824385)
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
-- TOC entry 209 (class 1259 OID 6824105)
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
-- TOC entry 201 (class 1259 OID 6824049)
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
-- TOC entry 200 (class 1259 OID 6824039)
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
-- TOC entry 221 (class 1259 OID 6824238)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6824173)
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
-- TOC entry 174 (class 1259 OID 6823747)
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
-- TOC entry 173 (class 1259 OID 6823745)
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
-- TOC entry 210 (class 1259 OID 6824115)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6823785)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6823769)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6824129)
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
-- TOC entry 204 (class 1259 OID 6824070)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6824020)
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
-- TOC entry 236 (class 1259 OID 6824434)
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
-- TOC entry 235 (class 1259 OID 6824426)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6824421)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6824183)
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
-- TOC entry 183 (class 1259 OID 6823847)
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
-- TOC entry 199 (class 1259 OID 6824026)
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
-- TOC entry 220 (class 1259 OID 6824227)
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
-- TOC entry 232 (class 1259 OID 6824404)
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
-- TOC entry 188 (class 1259 OID 6823910)
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
-- TOC entry 175 (class 1259 OID 6823756)
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
-- TOC entry 225 (class 1259 OID 6824284)
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
-- TOC entry 193 (class 1259 OID 6823972)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6824097)
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
-- TOC entry 215 (class 1259 OID 6824166)
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
-- TOC entry 195 (class 1259 OID 6824004)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6824274)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6824156)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6823750)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2803 (class 0 OID 6823802)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6824324)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5578-10f0-7efd-00fa483fd13e	000d0000-5578-10f0-81ab-7f6294daf801	\N	00090000-5578-10f0-21ef-a3ea481f6347	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-10f0-9882-2d94cc5bd8da	000d0000-5578-10f0-ccc1-7e625055c543	\N	00090000-5578-10f0-46a0-5c79ceb53408	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-10f0-407b-0a1d7c151190	000d0000-5578-10f0-537b-4b343d773244	\N	00090000-5578-10f0-f7e1-2bda8831818b	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-10f0-f599-be320bda54cc	000d0000-5578-10f0-d6b8-7a3c85b77dfa	\N	00090000-5578-10f0-7dfc-6f3b8ffdabcb	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-10f0-f4a5-45c317456b18	000d0000-5578-10f0-402b-2fa631517605	\N	00090000-5578-10f0-1b23-ef21fc0461a1	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-10f0-3a44-f495394464b5	000d0000-5578-10f0-be68-d91ee4ba4238	\N	00090000-5578-10f0-46a0-5c79ceb53408	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 6824307)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6824211)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5578-10f0-16e0-a75667d09248	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5578-10f0-f857-7ecad7f4f787	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5578-10f0-1b10-0160eedb5b7d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2817 (class 0 OID 6823981)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5578-10f0-cf87-46bba900dc84	\N	\N	00200000-5578-10f0-941b-31ad233761f7	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5578-10f0-9f7f-2d619c0685c8	\N	\N	00200000-5578-10f0-b41c-fb90b9055d7e	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5578-10f0-fdbd-c306e4ac45d1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5578-10f0-d81b-39807b1b013d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5578-10f0-e0a7-fdfceb5c1dad	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2820 (class 0 OID 6824015)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6823924)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5578-10ef-420f-712d25b24f07	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5578-10ef-6f48-4a51d786507c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5578-10ef-4cc5-c48f031902a5	AL	ALB	008	Albania 	Albanija	\N
00040000-5578-10ef-f5ef-85cffeb83d9c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5578-10ef-3622-2334f890b712	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5578-10ef-cda0-78a9bc1ad42b	AD	AND	020	Andorra 	Andora	\N
00040000-5578-10ef-4af3-6eb51f9851e8	AO	AGO	024	Angola 	Angola	\N
00040000-5578-10ef-ac65-026621361f5c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5578-10ef-6f85-517164d82169	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5578-10ef-24c5-ccaf4b3776f0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-10ef-e0e8-7fe7438a6cf7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5578-10ef-139d-195323021c59	AM	ARM	051	Armenia 	Armenija	\N
00040000-5578-10ef-a1a9-32b42cd9d7c3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5578-10ef-ed63-d810b19e7ad4	AU	AUS	036	Australia 	Avstralija	\N
00040000-5578-10ef-b172-51dc115a1262	AT	AUT	040	Austria 	Avstrija	\N
00040000-5578-10ef-9d65-4353f6591e47	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5578-10ef-7677-efe0a0aadd0e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5578-10ef-db09-9bcc53ad5c2c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5578-10ef-507c-a98e69fa22d6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5578-10ef-a05b-7fdcf8ebc8fa	BB	BRB	052	Barbados 	Barbados	\N
00040000-5578-10ef-5a6c-6204ac962fbd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5578-10ef-1e40-ecb8c2a9d85d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5578-10ef-003f-e2fbb58114ac	BZ	BLZ	084	Belize 	Belize	\N
00040000-5578-10ef-93a8-c195681216d6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5578-10ef-028b-cb9d7761e011	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5578-10ef-34f8-df0b893fb166	BT	BTN	064	Bhutan 	Butan	\N
00040000-5578-10ef-a502-28c69d638366	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5578-10ef-22b8-a0855b15f658	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5578-10ef-8fdd-bdec49856601	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5578-10ef-a715-f77e51bc943e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5578-10ef-4a66-63602eb72d8f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5578-10ef-0faf-66e3f00cc333	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5578-10ef-2212-fea007c39c2a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5578-10ef-c1f1-bbd73f3e4fa7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5578-10ef-1460-6e1e7d65d92b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5578-10ef-9b5c-a2336b44c1c6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5578-10ef-8e4d-2a4d4e603549	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5578-10ef-ec9a-b415949d00fe	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5578-10ef-ec35-c61e89c1e6c8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5578-10ef-bd50-61512d7ad75c	CA	CAN	124	Canada 	Kanada	\N
00040000-5578-10ef-86b7-38be447d596f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5578-10ef-c1cb-33ecd8fdf293	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5578-10ef-1c6f-313e91ba1ed0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5578-10ef-3aff-c079afcb3bd4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5578-10ef-2118-85360e07133d	CL	CHL	152	Chile 	Čile	\N
00040000-5578-10ef-074d-649e1615aea0	CN	CHN	156	China 	Kitajska	\N
00040000-5578-10ef-745c-44e2db2d9022	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5578-10ef-fbf9-87939b61a203	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5578-10ef-98fe-4db99fba4f92	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5578-10ef-0d3b-1687031a221c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5578-10ef-0362-ada3ddf3dc0b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5578-10ef-2e1a-e5c9222adcc1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5578-10ef-d629-1431e5bb03a1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5578-10ef-2d17-65526bad9f06	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5578-10ef-77d7-3b750a4bf753	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5578-10ef-099d-28968f602df4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5578-10ef-467e-e6d7bd82f40a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5578-10ef-4cc5-2776699a3642	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5578-10ef-5b1a-700d0111cf7c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5578-10ef-a233-e1d1d7874816	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5578-10ef-4f2e-485b4c72a215	DK	DNK	208	Denmark 	Danska	\N
00040000-5578-10ef-b1d5-61bb61d4f473	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5578-10ef-fedd-c43b756d3537	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-10ef-3eed-a00773c8c638	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5578-10ef-2bc2-24885c20d6a7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5578-10ef-6d33-5274b724d7fd	EG	EGY	818	Egypt 	Egipt	\N
00040000-5578-10ef-6a02-814925a4da09	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5578-10ef-1f39-e87cac2aff9a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5578-10ef-7f28-90866951df4a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5578-10ef-38f9-23671790bad9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5578-10ef-3620-4f267704ed20	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5578-10ef-e618-0b42aa84d486	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5578-10ef-d53c-00836119a57b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5578-10ef-2569-df3d4e71976c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5578-10ef-514b-2e6d3bb92208	FI	FIN	246	Finland 	Finska	\N
00040000-5578-10ef-d572-adc21acee5a7	FR	FRA	250	France 	Francija	\N
00040000-5578-10ef-cffa-74ba536e9448	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5578-10ef-e246-25029a99dac1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5578-10ef-052a-b88e3394d5b2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5578-10ef-ce23-777651bc626e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5578-10ef-117b-c5b73e1372c5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5578-10ef-494c-d6ab2784bedf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5578-10ef-c05a-72e920087eb5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5578-10ef-5c1b-67d01a168423	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5578-10ef-0c05-d2dab643b413	GH	GHA	288	Ghana 	Gana	\N
00040000-5578-10ef-57ca-89f05c6d6a6e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5578-10ef-9a9c-0cbe2664ce72	GR	GRC	300	Greece 	Grčija	\N
00040000-5578-10ef-70b9-102006d08046	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5578-10ef-9d7b-823312858403	GD	GRD	308	Grenada 	Grenada	\N
00040000-5578-10ef-b964-841f0b3d6bfc	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5578-10ef-80d6-cb46c1b83082	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5578-10ef-033f-39c1e5c54e79	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5578-10ef-f00f-87c4a4ea26b8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5578-10ef-d53f-9be3e357ee93	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5578-10ef-fa7f-5e89dec0c847	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5578-10ef-61cb-67b0a2965c32	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5578-10ef-783a-08d09d289937	HT	HTI	332	Haiti 	Haiti	\N
00040000-5578-10ef-3114-96d213f5af63	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5578-10ef-c2f0-735f94212ec1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5578-10ef-09a3-684cb908bc61	HN	HND	340	Honduras 	Honduras	\N
00040000-5578-10ef-e245-47ab85f75e32	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5578-10ef-a8a7-a5299a24f853	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5578-10ef-295b-e3e2f4161629	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5578-10ef-505f-582a7f01be6d	IN	IND	356	India 	Indija	\N
00040000-5578-10ef-a2df-764c1507d3cd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5578-10ef-f0a5-882aecb00235	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5578-10ef-6eb8-209308ec3d40	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5578-10ef-d29e-cbef9a45712b	IE	IRL	372	Ireland 	Irska	\N
00040000-5578-10ef-e106-d4932cba2334	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5578-10ef-2879-c01138e9e815	IL	ISR	376	Israel 	Izrael	\N
00040000-5578-10ef-e93d-feaa74e51e71	IT	ITA	380	Italy 	Italija	\N
00040000-5578-10ef-d9e4-fc8b3b8ef1c5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5578-10ef-9952-2cdb75de1d80	JP	JPN	392	Japan 	Japonska	\N
00040000-5578-10ef-6cb3-3f3855487cbb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5578-10ef-8722-5c1662547b57	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5578-10ef-b8fb-6df94bdc751a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5578-10ef-b6bf-4576c1eaca85	KE	KEN	404	Kenya 	Kenija	\N
00040000-5578-10ef-817e-2bdfcc41a86c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5578-10ef-7833-e2a3f3527c9f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5578-10ef-56df-b7a8b104377b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5578-10ef-64d3-93fbc248d91a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5578-10ef-4b9f-037136dc8c8f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5578-10ef-819e-b421b9026994	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5578-10ef-964b-817c836594f1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5578-10ef-fbb5-df80c42a0aa8	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5578-10ef-582d-ee30d3859a3a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5578-10ef-200b-9626cb7688dd	LR	LBR	430	Liberia 	Liberija	\N
00040000-5578-10ef-0340-495b10584607	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5578-10ef-c7a4-d87f8a39039c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5578-10ef-2ec0-973bb919984b	LT	LTU	440	Lithuania 	Litva	\N
00040000-5578-10ef-5403-1db4697866b2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5578-10ef-c170-812ac397779a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5578-10ef-b0c2-85612afb35c2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5578-10ef-4d8e-693c944e33b7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5578-10ef-2ef9-917d4acc9a6f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5578-10ef-e812-e697451b2d5a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5578-10ef-6e72-3e2a61373cf8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5578-10ef-2366-bde52dc99a5f	ML	MLI	466	Mali 	Mali	\N
00040000-5578-10ef-4e21-baf245194ba5	MT	MLT	470	Malta 	Malta	\N
00040000-5578-10ef-93e5-e57779800d9a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5578-10ef-2378-116bd7a9558b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5578-10ef-d993-3a173bda8383	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5578-10ef-dd5a-5bbaa590aeae	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5578-10ef-783e-e47206a4301d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5578-10ef-7c7b-766ecafb5f95	MX	MEX	484	Mexico 	Mehika	\N
00040000-5578-10ef-ec2e-4f1befe1c4e2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5578-10ef-a835-28cd7095dcaa	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5578-10ef-4bee-0b27b6efa94f	MC	MCO	492	Monaco 	Monako	\N
00040000-5578-10ef-27a1-e5ffe0069ea7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5578-10ef-0962-607f931a702b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5578-10ef-da1b-caf9cef93d4a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5578-10ef-40c9-d2098cc14b8e	MA	MAR	504	Morocco 	Maroko	\N
00040000-5578-10ef-4bb9-5e199adbcfb1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5578-10ef-9d52-23cf6bc1979d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5578-10ef-2b90-03fd930802b5	NA	NAM	516	Namibia 	Namibija	\N
00040000-5578-10ef-a643-888e22a8af8d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5578-10ef-fbcb-e265c0c52faa	NP	NPL	524	Nepal 	Nepal	\N
00040000-5578-10ef-5058-72a16f134a8b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5578-10ef-8a27-3664666f94a8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5578-10ef-1d5f-cb5109a3fd4c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5578-10ef-5d2c-a42a56b9d229	NE	NER	562	Niger 	Niger 	\N
00040000-5578-10ef-15fa-f5dc0bdf8c14	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5578-10ef-daf8-88dbc70fa55c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5578-10ef-5108-213e5c230d4b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5578-10ef-897a-72300ab26e18	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5578-10ef-ceff-a931c7ea65ab	NO	NOR	578	Norway 	Norveška	\N
00040000-5578-10ef-b195-a5dbb3f29431	OM	OMN	512	Oman 	Oman	\N
00040000-5578-10ef-8ac7-38368b6fcb26	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5578-10ef-9647-b5cec7b80ebf	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5578-10ef-fd93-1543dc70155f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5578-10ef-57b9-1058bbbfdea0	PA	PAN	591	Panama 	Panama	\N
00040000-5578-10ef-e0a2-cfce096690d2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5578-10ef-ef27-b01d4ae2d0d0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5578-10ef-b482-23a3705988ea	PE	PER	604	Peru 	Peru	\N
00040000-5578-10ef-0ba8-e40f177fe252	PH	PHL	608	Philippines 	Filipini	\N
00040000-5578-10ef-1de7-36a90af33797	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5578-10ef-0932-41b87fc3e06c	PL	POL	616	Poland 	Poljska	\N
00040000-5578-10ef-37b7-0e66d8f1edb3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5578-10ef-f12c-5b814f682fba	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5578-10ef-98cd-55e73a653f16	QA	QAT	634	Qatar 	Katar	\N
00040000-5578-10ef-9add-7e2fa27ec92c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5578-10ef-8647-b053f7de1bab	RO	ROU	642	Romania 	Romunija	\N
00040000-5578-10ef-6cf6-e3d4ae44d32d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5578-10ef-d24c-d2b36cd16444	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5578-10ef-19f0-65c2f24f77fb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5578-10ef-71e8-7d45e0c65409	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5578-10ef-9c20-8da8ba6aaec1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5578-10ef-8a7b-cbab2d085b5e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5578-10ef-416d-6a751eedd902	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5578-10ef-3d94-9868a24f2995	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5578-10ef-2d62-c52ffe0e1135	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5578-10ef-555b-4e98100f4bc7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5578-10ef-65e3-579a88bbb456	SM	SMR	674	San Marino 	San Marino	\N
00040000-5578-10ef-2498-9f806bf61da6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5578-10ef-eed4-4dcefa6a94d2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5578-10ef-0f53-7f0ea895842e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5578-10ef-06a5-011bd50e740a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5578-10ef-3797-6607d8f46a05	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5578-10ef-6383-ffc6e4745183	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5578-10ef-9794-90f1a8df4249	SG	SGP	702	Singapore 	Singapur	\N
00040000-5578-10ef-9e05-96b15e6a5a71	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5578-10ef-987e-6e7c40c970ef	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5578-10ef-2e4d-92d7f1b22c76	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5578-10ef-b3c8-ea691ffdb667	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5578-10ef-8013-5adf6a3dc959	SO	SOM	706	Somalia 	Somalija	\N
00040000-5578-10ef-446b-94ea23fa8885	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5578-10ef-0591-6ce4c9fbfa08	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5578-10ef-08cf-56af563b9246	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5578-10ef-eb21-d7653225d65d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5578-10ef-8e8b-74483ebaa32c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5578-10ef-4c80-83832839197d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5578-10ef-a4b6-4f639e59e61e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5578-10ef-db82-12e07ea9f7fb	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5578-10ef-8885-3a35427f42f6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5578-10ef-98a8-2ea5e67c1ce0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5578-10ef-9d30-fce502de4332	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5578-10ef-a187-d3968035354b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5578-10ef-1916-137e6044ffc8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5578-10ef-de23-98323d21f3b5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5578-10ef-9c24-cee02b7a9320	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5578-10ef-0c4f-8635a627eb5a	TH	THA	764	Thailand 	Tajska	\N
00040000-5578-10ef-3561-44dd3e9ded7b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5578-10ef-9239-8ca934cd9a15	TG	TGO	768	Togo 	Togo	\N
00040000-5578-10ef-2fdc-7113c5ef0280	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5578-10ef-ff0a-f8e0cea5d6a3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5578-10ef-12de-aa7c4cf423fc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5578-10ef-7d5f-dd2bc2670636	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5578-10ef-a8a3-75ad5baedcac	TR	TUR	792	Turkey 	Turčija	\N
00040000-5578-10ef-4413-f3437b4c4654	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5578-10ef-f088-772690751e9c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-10ef-68a0-fa95dc0c8a0b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5578-10ef-7a20-89564284edf7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5578-10ef-0ed8-473dc2eac13a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5578-10ef-203a-7ed6bcb3089f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5578-10ef-9b16-766d287088d0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5578-10ef-f3dc-829a24dfb988	US	USA	840	United States 	Združene države Amerike	\N
00040000-5578-10ef-01e1-44e3b8f77b34	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5578-10ef-65a5-e56a750fac3b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5578-10ef-8a81-88e21387963c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5578-10ef-702a-f281be513575	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5578-10ef-c31e-b61add8db104	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5578-10ef-df83-4da7696fb8b5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5578-10ef-76f0-7594736fb7a4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-10ef-1303-f0f4eb42217f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5578-10ef-b21c-5003a8e12baf	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5578-10ef-9b67-385d38e00e55	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5578-10ef-50eb-fc54cc2fa559	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5578-10ef-b17d-75d97365c201	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5578-10ef-e19d-87d32f7caef2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2851 (class 0 OID 6824338)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6824141)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5578-10f0-2483-d5139e302928	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5578-10ef-9852-6c37625311b7
000d0000-5578-10f0-81ab-7f6294daf801	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-10ef-9852-6c37625311b7
000d0000-5578-10f0-ccc1-7e625055c543	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5578-10ef-518a-481557b91536
000d0000-5578-10f0-537b-4b343d773244	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5578-10ef-702e-a3f4ff708fc7
000d0000-5578-10f0-d6b8-7a3c85b77dfa	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5578-10ef-702e-a3f4ff708fc7
000d0000-5578-10f0-402b-2fa631517605	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5578-10ef-702e-a3f4ff708fc7
000d0000-5578-10f0-be68-d91ee4ba4238	000e0000-5578-10f0-fd9a-6c932cb8ac5b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-10ef-9852-6c37625311b7
\.


--
-- TOC entry 2815 (class 0 OID 6823961)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6824009)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6823941)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5578-10f0-b49a-f7af77904d14	00080000-5578-10f0-deff-59c399d42eda	00090000-5578-10f0-21ef-a3ea481f6347	AK		
\.


--
-- TOC entry 2793 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6824058)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6824083)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6823898)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5578-10ef-0968-140422d94d55	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5578-10ef-bbff-7424ffe48115	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5578-10ef-32f0-fd30278bfe1d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5578-10ef-33a3-ebf6df78a074	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5578-10ef-67d2-1f11ba0ffa87	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5578-10ef-c135-53ffae9f2e75	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5578-10ef-c698-b2bfd8198411	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5578-10ef-0ae4-144ca4422960	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5578-10ef-c068-500bd267b064	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5578-10ef-1424-e9ca76013995	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5578-10ef-1a70-b67339a7ef0d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5578-10ef-c67e-2117b76edb63	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5578-10ef-2858-257ced96e64c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-10ef-a6b9-84048296795b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-10ef-b8fd-a2d94bfd60c2	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5578-10ef-a1e1-e41d590c1545	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2804 (class 0 OID 6823811)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5578-10ef-9efa-bb7c1e008b5d	00000000-5578-10ef-67d2-1f11ba0ffa87	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5578-10ef-1671-8c0fde0815d8	00000000-5578-10ef-67d2-1f11ba0ffa87	00010000-5578-10ef-530d-bda635d6fdc5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5578-10ef-1fa5-cef5fec52ffc	00000000-5578-10ef-c135-53ffae9f2e75	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2805 (class 0 OID 6823822)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5578-10f0-4924-c4e65d6d887f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5578-10f0-7dfc-6f3b8ffdabcb	00010000-5578-10f0-8470-fa80e23cf606	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5578-10f0-f7e1-2bda8831818b	00010000-5578-10f0-2635-602bce760dba	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5578-10f0-e685-3581497a8757	00010000-5578-10f0-bb2f-47a8a03832f9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5578-10f0-e9dc-e08da25acd4d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5578-10f0-8684-1f39f153fc94	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5578-10f0-1348-4b2a78107a00	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5578-10f0-c01f-736e8e55925c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5578-10f0-21ef-a3ea481f6347	00010000-5578-10f0-be7c-9ddab4761d93	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5578-10f0-46a0-5c79ceb53408	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5578-10f0-24c0-2ee28c30aad8	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5578-10f0-1b23-ef21fc0461a1	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5578-10f0-739e-bf352bd77810	00010000-5578-10f0-e824-7cadf8570016	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2795 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6823776)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5578-10ef-0bbf-d9751ebfb115	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5578-10ef-4f04-b43bd4fd2c6b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5578-10ef-580d-9b5c00e0d106	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5578-10ef-ea30-f0d138a39834	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5578-10ef-f5e4-03761c965ad9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5578-10ef-ac14-14bf18ac439f	Abonma-read	Abonma - branje	f
00030000-5578-10ef-c8bb-80b4077e2447	Abonma-write	Abonma - spreminjanje	f
00030000-5578-10ef-8461-96c968dcc0eb	Alternacija-read	Alternacija - branje	f
00030000-5578-10ef-def9-e13244c1dc78	Alternacija-write	Alternacija - spreminjanje	f
00030000-5578-10ef-6adc-ff012d94f9e9	Arhivalija-read	Arhivalija - branje	f
00030000-5578-10ef-e649-46db742a5097	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5578-10ef-39a4-6476941204b1	Besedilo-read	Besedilo - branje	f
00030000-5578-10ef-56c9-1265f97b8a11	Besedilo-write	Besedilo - spreminjanje	f
00030000-5578-10ef-97df-55a56e8904cd	DogodekIzven-read	DogodekIzven - branje	f
00030000-5578-10ef-74f4-04a3fb46cec6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5578-10ef-468b-c169170a71cb	Dogodek-read	Dogodek - branje	f
00030000-5578-10ef-8018-9cc017d1e303	Dogodek-write	Dogodek - spreminjanje	f
00030000-5578-10ef-3eed-eb6c4505583b	Drzava-read	Drzava - branje	f
00030000-5578-10ef-69ed-1c6ed537b193	Drzava-write	Drzava - spreminjanje	f
00030000-5578-10ef-c5c8-c6349b74777e	Funkcija-read	Funkcija - branje	f
00030000-5578-10ef-e372-19858de4d2cd	Funkcija-write	Funkcija - spreminjanje	f
00030000-5578-10ef-8eb2-a3a16b32d1e7	Gostovanje-read	Gostovanje - branje	f
00030000-5578-10ef-ae2b-11aa4904b87c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5578-10ef-6c0e-20ae71cf2744	Gostujoca-read	Gostujoca - branje	f
00030000-5578-10ef-cb6d-d74cf3b3061d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5578-10ef-85a3-d52cb1e2c9d8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5578-10ef-f446-dd834596e511	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5578-10ef-1bea-aa6ccb38ca88	Kupec-read	Kupec - branje	f
00030000-5578-10ef-ecae-d96828ac7044	Kupec-write	Kupec - spreminjanje	f
00030000-5578-10ef-5756-bc678c063da2	NacinPlacina-read	NacinPlacina - branje	f
00030000-5578-10ef-a95e-696545e7e9cb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5578-10ef-696b-a6bce8db7684	Option-read	Option - branje	f
00030000-5578-10ef-186d-c31b5a930531	Option-write	Option - spreminjanje	f
00030000-5578-10ef-1727-9bb0bbfdf432	OptionValue-read	OptionValue - branje	f
00030000-5578-10ef-01ef-f6b21a73df30	OptionValue-write	OptionValue - spreminjanje	f
00030000-5578-10ef-40e6-fdca71c0164a	Oseba-read	Oseba - branje	f
00030000-5578-10ef-47d4-1dbe4d60ad64	Oseba-write	Oseba - spreminjanje	f
00030000-5578-10ef-1361-5410c6bb095a	Permission-read	Permission - branje	f
00030000-5578-10ef-300d-deb22ccf3077	Permission-write	Permission - spreminjanje	f
00030000-5578-10ef-394a-4fe30b3d3c0f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5578-10ef-ab47-af4c55068255	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5578-10ef-1a1b-72de853869c0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5578-10ef-d13f-330fecb0d7b4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5578-10ef-9ea1-5bc61b01198e	Pogodba-read	Pogodba - branje	f
00030000-5578-10ef-e7c2-69ea4f8f8f64	Pogodba-write	Pogodba - spreminjanje	f
00030000-5578-10ef-6869-77dbeb182b7a	Popa-read	Popa - branje	f
00030000-5578-10ef-3143-40f4779d40b1	Popa-write	Popa - spreminjanje	f
00030000-5578-10ef-9b60-e82ec778fb1b	Posta-read	Posta - branje	f
00030000-5578-10ef-4c47-4bdd168ab2ff	Posta-write	Posta - spreminjanje	f
00030000-5578-10ef-edf4-47b84450600a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5578-10ef-b04e-5e3db78246bc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5578-10ef-5165-8f857f972ea2	PostniNaslov-read	PostniNaslov - branje	f
00030000-5578-10ef-d75e-204cf3ae21e0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5578-10ef-019d-d3ccedeebe9a	Predstava-read	Predstava - branje	f
00030000-5578-10ef-811c-83de3632578f	Predstava-write	Predstava - spreminjanje	f
00030000-5578-10ef-2fe4-6d547512658f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5578-10ef-ffeb-47f4b839366c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5578-10ef-d599-f53bb4cea553	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5578-10ef-7220-a346e9a450dc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5578-10ef-810d-13191443fde9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5578-10ef-37f6-1cd6ae8dd280	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5578-10ef-359c-b983aef91955	ProgramDela-read	ProgramDela - branje	f
00030000-5578-10ef-a12d-bdb7895869f8	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5578-10ef-326b-f60d704c9019	ProgramFestival-read	ProgramFestival - branje	f
00030000-5578-10ef-a26e-39fad71649e9	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5578-10ef-bb0f-23c4275653e3	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5578-10ef-9675-79aebd96883c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5578-10ef-36cc-68274b373f56	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5578-10ef-ce63-b8f3cf8f2712	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5578-10ef-c10c-d9fee9ec3939	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5578-10ef-ab56-52f1838f20f2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5578-10ef-7f6a-5cda7d9f0b90	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5578-10ef-1c65-003323a4fd45	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5578-10ef-ae71-070282985d1a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5578-10ef-b279-95266e500212	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5578-10ef-16b0-de9f6449f117	Prostor-read	Prostor - branje	f
00030000-5578-10ef-25f5-06ee0603b664	Prostor-write	Prostor - spreminjanje	f
00030000-5578-10ef-1658-a171b59ba42d	Racun-read	Racun - branje	f
00030000-5578-10ef-f0e8-d4f086c82995	Racun-write	Racun - spreminjanje	f
00030000-5578-10ef-38be-95d133648252	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5578-10ef-b11b-a8483c5d3a1c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5578-10ef-1a39-13d9bdc176ca	Readme-read	Readme - branje	f
00030000-5578-10ef-52b7-3ce6c09d6054	Readme-write	Readme - spreminjanje	f
00030000-5578-10ef-360f-7d1fd3551343	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5578-10ef-2c7d-c7a80095acd4	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5578-10ef-939b-30c466621a6c	Rekvizit-read	Rekvizit - branje	f
00030000-5578-10ef-d0bc-d76e57f8680c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5578-10ef-627e-0f2f313fd437	Revizija-read	Revizija - branje	f
00030000-5578-10ef-3b36-df6464614c7d	Revizija-write	Revizija - spreminjanje	f
00030000-5578-10ef-bbed-6e9584ab6f2b	Rezervacija-read	Rezervacija - branje	f
00030000-5578-10ef-0463-6effadb33a14	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5578-10ef-9064-cf519b9c25ba	Role-read	Role - branje	f
00030000-5578-10ef-6378-b15d303ce034	Role-write	Role - spreminjanje	f
00030000-5578-10ef-6a73-b6804a393c44	SedezniRed-read	SedezniRed - branje	f
00030000-5578-10ef-485d-b042170e261d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5578-10ef-a659-057fad408902	Sedez-read	Sedez - branje	f
00030000-5578-10ef-8757-620818daaeff	Sedez-write	Sedez - spreminjanje	f
00030000-5578-10ef-c5ff-2612b2981d44	Sezona-read	Sezona - branje	f
00030000-5578-10ef-5695-f12a54c51315	Sezona-write	Sezona - spreminjanje	f
00030000-5578-10ef-8624-7ac8d5c7c6e2	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5578-10ef-3c2c-52553f2aa34d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5578-10ef-51ec-8657973e6092	Stevilcenje-read	Stevilcenje - branje	f
00030000-5578-10ef-28ce-6db7c0b02a56	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5578-10ef-cf9d-e2ba59b6b771	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5578-10ef-c2a9-7089fc4e7fbd	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5578-10ef-2de4-ee3399f4e399	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5578-10ef-8cf5-24542f945232	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5578-10ef-3a5a-b9946e97adbb	Telefonska-read	Telefonska - branje	f
00030000-5578-10ef-1f2e-0a98ca386784	Telefonska-write	Telefonska - spreminjanje	f
00030000-5578-10ef-c98c-d31f34263c78	TerminStoritve-read	TerminStoritve - branje	f
00030000-5578-10ef-df05-5c41d8d6699f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5578-10ef-faa0-f0b35b481b68	TipFunkcije-read	TipFunkcije - branje	f
00030000-5578-10ef-f22d-59ceb05fc812	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5578-10ef-89f7-9607094dd885	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5578-10ef-4ca2-41780cc077b8	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5578-10ef-d387-2f08883c5f08	Trr-read	Trr - branje	f
00030000-5578-10ef-25dd-2f30aec1a7e5	Trr-write	Trr - spreminjanje	f
00030000-5578-10ef-41d9-36544b1d11e8	Uprizoritev-read	Uprizoritev - branje	f
00030000-5578-10ef-4d33-088177eed2ed	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5578-10ef-b40b-797e7e55ec10	User-read	User - branje	f
00030000-5578-10ef-9180-025b3c93f530	User-write	User - spreminjanje	f
00030000-5578-10ef-212a-c7e353959873	Vaja-read	Vaja - branje	f
00030000-5578-10ef-e3aa-5b50c5ed3530	Vaja-write	Vaja - spreminjanje	f
00030000-5578-10ef-af7a-6b3535fc668d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5578-10ef-c9ac-e879f93dbf0b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5578-10ef-758f-28bd63b4f391	Zaposlitev-read	Zaposlitev - branje	f
00030000-5578-10ef-096f-e72fbdb8d7f1	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5578-10ef-2aa6-9c5499947a59	Zasedenost-read	Zasedenost - branje	f
00030000-5578-10ef-d54d-d9e5839a44ab	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5578-10ef-223e-59547257b2ad	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5578-10ef-8f1e-94d7395ba6d2	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5578-10ef-443a-2e1c35ec58b8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5578-10ef-53f5-f0449d01507f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2802 (class 0 OID 6823795)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5578-10ef-eb5f-2c5c2bf2126e	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-ac14-14bf18ac439f
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-c8bb-80b4077e2447
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-8461-96c968dcc0eb
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-def9-e13244c1dc78
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-6adc-ff012d94f9e9
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-468b-c169170a71cb
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-ea30-f0d138a39834
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-8018-9cc017d1e303
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-69ed-1c6ed537b193
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-c5c8-c6349b74777e
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-e372-19858de4d2cd
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-8eb2-a3a16b32d1e7
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-ae2b-11aa4904b87c
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-6c0e-20ae71cf2744
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-cb6d-d74cf3b3061d
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-85a3-d52cb1e2c9d8
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-f446-dd834596e511
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-696b-a6bce8db7684
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-1727-9bb0bbfdf432
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-40e6-fdca71c0164a
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-47d4-1dbe4d60ad64
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-6869-77dbeb182b7a
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-3143-40f4779d40b1
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-9b60-e82ec778fb1b
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-4c47-4bdd168ab2ff
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-5165-8f857f972ea2
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-d75e-204cf3ae21e0
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-019d-d3ccedeebe9a
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-811c-83de3632578f
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-810d-13191443fde9
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-37f6-1cd6ae8dd280
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-16b0-de9f6449f117
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-25f5-06ee0603b664
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-360f-7d1fd3551343
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-2c7d-c7a80095acd4
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-939b-30c466621a6c
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-d0bc-d76e57f8680c
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-c5ff-2612b2981d44
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-5695-f12a54c51315
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-faa0-f0b35b481b68
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-41d9-36544b1d11e8
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-4d33-088177eed2ed
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-212a-c7e353959873
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-e3aa-5b50c5ed3530
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-2aa6-9c5499947a59
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-d54d-d9e5839a44ab
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-223e-59547257b2ad
00020000-5578-10ef-7190-ed47c84f41f4	00030000-5578-10ef-443a-2e1c35ec58b8
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-ac14-14bf18ac439f
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-6adc-ff012d94f9e9
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-468b-c169170a71cb
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-8eb2-a3a16b32d1e7
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-6c0e-20ae71cf2744
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-85a3-d52cb1e2c9d8
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-f446-dd834596e511
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-696b-a6bce8db7684
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-1727-9bb0bbfdf432
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-40e6-fdca71c0164a
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-47d4-1dbe4d60ad64
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-6869-77dbeb182b7a
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-9b60-e82ec778fb1b
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-5165-8f857f972ea2
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-d75e-204cf3ae21e0
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-019d-d3ccedeebe9a
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-16b0-de9f6449f117
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-360f-7d1fd3551343
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-939b-30c466621a6c
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-c5ff-2612b2981d44
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-3a5a-b9946e97adbb
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-1f2e-0a98ca386784
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-d387-2f08883c5f08
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-25dd-2f30aec1a7e5
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-758f-28bd63b4f391
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-096f-e72fbdb8d7f1
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-223e-59547257b2ad
00020000-5578-10ef-4252-20490343e5d0	00030000-5578-10ef-443a-2e1c35ec58b8
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-ac14-14bf18ac439f
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-8461-96c968dcc0eb
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-6adc-ff012d94f9e9
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-e649-46db742a5097
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-39a4-6476941204b1
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-97df-55a56e8904cd
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-468b-c169170a71cb
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-c5c8-c6349b74777e
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-8eb2-a3a16b32d1e7
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-6c0e-20ae71cf2744
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-85a3-d52cb1e2c9d8
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-696b-a6bce8db7684
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-1727-9bb0bbfdf432
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-40e6-fdca71c0164a
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-6869-77dbeb182b7a
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-9b60-e82ec778fb1b
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-019d-d3ccedeebe9a
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-810d-13191443fde9
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-16b0-de9f6449f117
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-360f-7d1fd3551343
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-939b-30c466621a6c
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-c5ff-2612b2981d44
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-faa0-f0b35b481b68
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-212a-c7e353959873
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-2aa6-9c5499947a59
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-223e-59547257b2ad
00020000-5578-10ef-d993-8ab468182c11	00030000-5578-10ef-443a-2e1c35ec58b8
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-ac14-14bf18ac439f
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-c8bb-80b4077e2447
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-def9-e13244c1dc78
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-6adc-ff012d94f9e9
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-468b-c169170a71cb
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-8eb2-a3a16b32d1e7
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-6c0e-20ae71cf2744
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-696b-a6bce8db7684
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-1727-9bb0bbfdf432
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-6869-77dbeb182b7a
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-9b60-e82ec778fb1b
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-019d-d3ccedeebe9a
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-16b0-de9f6449f117
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-360f-7d1fd3551343
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-939b-30c466621a6c
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-c5ff-2612b2981d44
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-faa0-f0b35b481b68
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-223e-59547257b2ad
00020000-5578-10ef-ecb0-3901d05b758a	00030000-5578-10ef-443a-2e1c35ec58b8
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-ac14-14bf18ac439f
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-6adc-ff012d94f9e9
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-468b-c169170a71cb
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-3eed-eb6c4505583b
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-8eb2-a3a16b32d1e7
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-6c0e-20ae71cf2744
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-696b-a6bce8db7684
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-1727-9bb0bbfdf432
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-6869-77dbeb182b7a
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-9b60-e82ec778fb1b
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-019d-d3ccedeebe9a
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-16b0-de9f6449f117
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-360f-7d1fd3551343
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-939b-30c466621a6c
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-c5ff-2612b2981d44
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-c98c-d31f34263c78
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-580d-9b5c00e0d106
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-faa0-f0b35b481b68
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-223e-59547257b2ad
00020000-5578-10ef-2fd1-23e462763ded	00030000-5578-10ef-443a-2e1c35ec58b8
\.


--
-- TOC entry 2830 (class 0 OID 6824090)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6824121)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6824257)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6823855)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5578-10f0-deff-59c399d42eda	00040000-5578-10ef-420f-712d25b24f07	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-10f0-dc66-b7b5762a3c3a	00040000-5578-10ef-420f-712d25b24f07	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-10f0-4777-547134053368	00040000-5578-10ef-420f-712d25b24f07	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-10f0-880f-e9c179d3bc44	00040000-5578-10ef-420f-712d25b24f07	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2809 (class 0 OID 6823890)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5578-10ee-e1f7-4e158e7ff8d7	8341	Adlešiči
00050000-5578-10ee-18b8-1761320b15f5	5270	Ajdovščina
00050000-5578-10ee-e7fa-7b45067c1197	6280	Ankaran/Ancarano
00050000-5578-10ee-629e-12e29a54f172	9253	Apače
00050000-5578-10ee-d0c9-94cf7fa4ea85	8253	Artiče
00050000-5578-10ee-265b-c9c4c230f5d0	4275	Begunje na Gorenjskem
00050000-5578-10ee-f56e-b466d69fa8d1	1382	Begunje pri Cerknici
00050000-5578-10ee-8ed6-b85e439e0238	9231	Beltinci
00050000-5578-10ee-f759-40b9e2440bfc	2234	Benedikt
00050000-5578-10ee-8acf-636a384c66cd	2345	Bistrica ob Dravi
00050000-5578-10ee-2c25-5b435a4f39f1	3256	Bistrica ob Sotli
00050000-5578-10ee-bdd1-155ba19d86a1	8259	Bizeljsko
00050000-5578-10ee-6434-205537d12e1a	1223	Blagovica
00050000-5578-10ee-9447-a720c2cbb578	8283	Blanca
00050000-5578-10ee-ce21-7cfd01eeb9c2	4260	Bled
00050000-5578-10ee-b2bc-0701a8c3617a	4273	Blejska Dobrava
00050000-5578-10ee-a357-d3cdc902f7af	9265	Bodonci
00050000-5578-10ee-8ccd-04a5096975b3	9222	Bogojina
00050000-5578-10ee-5315-9f3b8a7bc0c8	4263	Bohinjska Bela
00050000-5578-10ee-a642-fd33e269cfa4	4264	Bohinjska Bistrica
00050000-5578-10ee-8df2-c3411933c046	4265	Bohinjsko jezero
00050000-5578-10ee-e53b-22294bcfa319	1353	Borovnica
00050000-5578-10ee-1a94-cf25755e150d	8294	Boštanj
00050000-5578-10ee-e1a1-cc2557000063	5230	Bovec
00050000-5578-10ee-f184-befd59cab1ab	5295	Branik
00050000-5578-10ee-e00d-05c2f2c92b55	3314	Braslovče
00050000-5578-10ee-0380-1b6e7abbbaf4	5223	Breginj
00050000-5578-10ee-8702-beabd266c177	8280	Brestanica
00050000-5578-10ee-898e-be21673dacc1	2354	Bresternica
00050000-5578-10ee-227d-8c4212a4b791	4243	Brezje
00050000-5578-10ee-002c-99fa9a563029	1351	Brezovica pri Ljubljani
00050000-5578-10ee-20d9-1034e6dba26b	8250	Brežice
00050000-5578-10ee-7443-e30e9eb5db3f	4210	Brnik - Aerodrom
00050000-5578-10ee-d552-ca0962dde662	8321	Brusnice
00050000-5578-10ee-1d08-7d56d2c0b697	3255	Buče
00050000-5578-10ee-8d1d-6187d9f49833	8276	Bučka 
00050000-5578-10ee-c41f-7a3467ee8cdb	9261	Cankova
00050000-5578-10ee-0edf-5b2fbed50478	3000	Celje 
00050000-5578-10ee-8738-59f849579f44	3001	Celje - poštni predali
00050000-5578-10ee-c7a4-dab651fcc2b9	4207	Cerklje na Gorenjskem
00050000-5578-10ee-feed-6d8df2005cc0	8263	Cerklje ob Krki
00050000-5578-10ee-0239-67bea7c4a624	1380	Cerknica
00050000-5578-10ee-59c0-ff0bfb621b82	5282	Cerkno
00050000-5578-10ee-6676-5e6a1de623ee	2236	Cerkvenjak
00050000-5578-10ee-a032-98d3794589c2	2215	Ceršak
00050000-5578-10ee-a43c-3b7ed03e08e8	2326	Cirkovce
00050000-5578-10ee-3411-b5465b48e287	2282	Cirkulane
00050000-5578-10ee-e9a7-21925bd24e38	5273	Col
00050000-5578-10ee-a621-ba003cd02aca	8251	Čatež ob Savi
00050000-5578-10ee-bd6a-62ed5186f766	1413	Čemšenik
00050000-5578-10ee-812f-62ac40c9aede	5253	Čepovan
00050000-5578-10ee-7b89-00dd9db242c3	9232	Črenšovci
00050000-5578-10ee-8f56-6c2e2afdce76	2393	Črna na Koroškem
00050000-5578-10ee-6036-e703a37a05ab	6275	Črni Kal
00050000-5578-10ee-94fc-a3f8d69cebcc	5274	Črni Vrh nad Idrijo
00050000-5578-10ee-f50a-827b07888165	5262	Črniče
00050000-5578-10ee-fdd4-f5e80360f045	8340	Črnomelj
00050000-5578-10ee-9572-474ffc25ea1d	6271	Dekani
00050000-5578-10ee-8e42-1136e655f7ed	5210	Deskle
00050000-5578-10ee-a3b7-3e131ad43397	2253	Destrnik
00050000-5578-10ee-00b8-d67e74091b47	6215	Divača
00050000-5578-10ee-52a7-e80a5e817de8	1233	Dob
00050000-5578-10ee-8604-8ec510772a51	3224	Dobje pri Planini
00050000-5578-10ee-3585-b5b035a4e407	8257	Dobova
00050000-5578-10ee-591f-fcd943b11485	1423	Dobovec
00050000-5578-10ee-1b54-7625a92392df	5263	Dobravlje
00050000-5578-10ee-9b65-ef91bfc4dd1c	3204	Dobrna
00050000-5578-10ee-7ca1-7335126f1df2	8211	Dobrnič
00050000-5578-10ee-9a83-8bdc3280a488	1356	Dobrova
00050000-5578-10ee-b732-3df452fa5d4e	9223	Dobrovnik/Dobronak 
00050000-5578-10ee-72e2-34adffa89e3c	5212	Dobrovo v Brdih
00050000-5578-10ee-3796-690b838cd6ac	1431	Dol pri Hrastniku
00050000-5578-10ee-e29b-8524fe6736e4	1262	Dol pri Ljubljani
00050000-5578-10ee-5157-190b07cfb8dc	1273	Dole pri Litiji
00050000-5578-10ee-19af-f78d31cdb8ed	1331	Dolenja vas
00050000-5578-10ee-afd0-126a6c8827be	8350	Dolenjske Toplice
00050000-5578-10ee-14fe-84cce64840ae	1230	Domžale
00050000-5578-10ee-1ec4-c90cdaefa011	2252	Dornava
00050000-5578-10ee-9be0-b4bd0287bcd6	5294	Dornberk
00050000-5578-10ee-d067-45d6db40cc94	1319	Draga
00050000-5578-10ee-1141-ea484222cb95	8343	Dragatuš
00050000-5578-10ee-82bd-9f2350e74c5c	3222	Dramlje
00050000-5578-10ee-1aa4-c668c46f8408	2370	Dravograd
00050000-5578-10ee-320d-b7b358a4147a	4203	Duplje
00050000-5578-10ee-5293-240e7c5c2b17	6221	Dutovlje
00050000-5578-10ee-2e78-294f820cc718	8361	Dvor
00050000-5578-10ee-8567-010fab7222f9	2343	Fala
00050000-5578-10ee-01df-bd01745d54e7	9208	Fokovci
00050000-5578-10ee-2246-0572a900e24c	2313	Fram
00050000-5578-10ee-387e-e29bbc5c62b1	3213	Frankolovo
00050000-5578-10ee-cfe4-f61dea409484	1274	Gabrovka
00050000-5578-10ee-6936-7343635f2c8d	8254	Globoko
00050000-5578-10ee-d2d6-88d921cb0cbd	5275	Godovič
00050000-5578-10ee-09ab-ff8e8212a49d	4204	Golnik
00050000-5578-10ee-b9aa-30794615ae62	3303	Gomilsko
00050000-5578-10ee-f3b5-609bfc50acc8	4224	Gorenja vas
00050000-5578-10ee-3a86-73b371a3ecce	3263	Gorica pri Slivnici
00050000-5578-10ee-db05-09c17a666dbd	2272	Gorišnica
00050000-5578-10ee-3352-ab63ba6ee8eb	9250	Gornja Radgona
00050000-5578-10ee-1507-484ba6de3e25	3342	Gornji Grad
00050000-5578-10ee-18b7-e70223f92bfd	4282	Gozd Martuljek
00050000-5578-10ee-1731-081aa634260e	6272	Gračišče
00050000-5578-10ee-2d36-4a180f9e88fc	9264	Grad
00050000-5578-10ee-9cbb-4f48ae7e0ba9	8332	Gradac
00050000-5578-10ee-7926-583ba83a5ea0	1384	Grahovo
00050000-5578-10ee-70f6-bc401beef7a7	5242	Grahovo ob Bači
00050000-5578-10ee-8005-2ce03a3de7a0	5251	Grgar
00050000-5578-10ee-bc8b-000170cbe14d	3302	Griže
00050000-5578-10ee-6bc3-b4a030c1884d	3231	Grobelno
00050000-5578-10ee-f0a0-3f2c678a6289	1290	Grosuplje
00050000-5578-10ee-9d85-bbf308b7ea9c	2288	Hajdina
00050000-5578-10ee-5282-060a68f132f2	8362	Hinje
00050000-5578-10ee-6970-8244cd111a48	2311	Hoče
00050000-5578-10ee-04b3-d2058cc6ef22	9205	Hodoš/Hodos
00050000-5578-10ee-fef5-2471d8a4a7af	1354	Horjul
00050000-5578-10ee-0862-906c867cbe25	1372	Hotedršica
00050000-5578-10ee-45d0-8ff363a1163e	1430	Hrastnik
00050000-5578-10ee-91e2-5a8e7b5d32c6	6225	Hruševje
00050000-5578-10ee-90e2-4d2de47cb317	4276	Hrušica
00050000-5578-10ee-727c-c727349484b2	5280	Idrija
00050000-5578-10ee-f085-dc1083822da4	1292	Ig
00050000-5578-10ee-5f63-0b63179d0ba4	6250	Ilirska Bistrica
00050000-5578-10ee-889e-7dcba4e0ee42	6251	Ilirska Bistrica-Trnovo
00050000-5578-10ee-878a-0a0ad683ba23	1295	Ivančna Gorica
00050000-5578-10ee-29b3-0d80772fbd5d	2259	Ivanjkovci
00050000-5578-10ee-107d-0fa78fed8a74	1411	Izlake
00050000-5578-10ee-078b-db5cce8c8711	6310	Izola/Isola
00050000-5578-10ee-2dc2-8ce187bc94bb	2222	Jakobski Dol
00050000-5578-10ee-2749-d5820727ae8a	2221	Jarenina
00050000-5578-10ee-3ebd-b16d87315a89	6254	Jelšane
00050000-5578-10ee-78ec-e78177a5cbe1	4270	Jesenice
00050000-5578-10ee-c6d3-eb0712dab49b	8261	Jesenice na Dolenjskem
00050000-5578-10ee-b466-e6e477881f8d	3273	Jurklošter
00050000-5578-10ee-b9ce-fa93f08d8c70	2223	Jurovski Dol
00050000-5578-10ee-847d-d0c30688dab5	2256	Juršinci
00050000-5578-10ee-72ce-98fe75e28aa3	5214	Kal nad Kanalom
00050000-5578-10ee-d0da-ace9699a7a80	3233	Kalobje
00050000-5578-10ee-f828-5388b4df69bc	4246	Kamna Gorica
00050000-5578-10ee-5f91-258a2a5b8199	2351	Kamnica
00050000-5578-10ee-a54b-3951a529eb28	1241	Kamnik
00050000-5578-10ee-361e-4daa8d0f4496	5213	Kanal
00050000-5578-10ee-31ec-89b5484d2998	8258	Kapele
00050000-5578-10ee-47e7-93f90c04eeed	2362	Kapla
00050000-5578-10ee-f307-c481506fee0c	2325	Kidričevo
00050000-5578-10ee-f105-9dae3e5a66db	1412	Kisovec
00050000-5578-10ee-ffbe-b4e9f55455d2	6253	Knežak
00050000-5578-10ee-ce6f-6b31862035bf	5222	Kobarid
00050000-5578-10ee-8376-6ab05f9f8d6b	9227	Kobilje
00050000-5578-10ee-f68b-52258f16c51a	1330	Kočevje
00050000-5578-10ee-6147-39fa736adc85	1338	Kočevska Reka
00050000-5578-10ee-f87a-ed8faadf4792	2276	Kog
00050000-5578-10ee-e53e-7a57ff68bcb7	5211	Kojsko
00050000-5578-10ee-808d-b7f161e382f6	6223	Komen
00050000-5578-10ee-9b19-7264ff888a89	1218	Komenda
00050000-5578-10ee-1b19-06188d80580e	6000	Koper/Capodistria 
00050000-5578-10ee-4501-077d45858fcd	6001	Koper/Capodistria - poštni predali
00050000-5578-10ee-91c3-8353dd66e2d0	8282	Koprivnica
00050000-5578-10ee-6faf-5f2b7bda2e2c	5296	Kostanjevica na Krasu
00050000-5578-10ee-24cd-e549d482751c	8311	Kostanjevica na Krki
00050000-5578-10ee-442d-e2bc73a20ad8	1336	Kostel
00050000-5578-10ee-5ad8-101bb4092bf2	6256	Košana
00050000-5578-10ee-04e8-8521f0cf5820	2394	Kotlje
00050000-5578-10ee-5103-45e157febdec	6240	Kozina
00050000-5578-10ee-03e1-dbffe6cf134e	3260	Kozje
00050000-5578-10ee-72db-c880bfe2d74b	4000	Kranj 
00050000-5578-10ee-9c21-848d734c9bb2	4001	Kranj - poštni predali
00050000-5578-10ee-0944-676173c25deb	4280	Kranjska Gora
00050000-5578-10ee-bb39-2b5113f7e8b8	1281	Kresnice
00050000-5578-10ee-1525-9c40a1584955	4294	Križe
00050000-5578-10ee-7da9-a9377d1ce3d4	9206	Križevci
00050000-5578-10ee-5376-6a0b7a13a321	9242	Križevci pri Ljutomeru
00050000-5578-10ee-471c-1b0a813e2c5d	1301	Krka
00050000-5578-10ee-df77-1a38a30cb917	8296	Krmelj
00050000-5578-10ee-985c-7959f85030c6	4245	Kropa
00050000-5578-10ee-005f-a3166e23a473	8262	Krška vas
00050000-5578-10ee-0a72-d99ecc8b44b4	8270	Krško
00050000-5578-10ee-b1fc-2dbd968f8112	9263	Kuzma
00050000-5578-10ee-1610-8e505b840334	2318	Laporje
00050000-5578-10ee-77ef-7f5b22b8135c	3270	Laško
00050000-5578-10ee-3dd2-f5e280ef3e79	1219	Laze v Tuhinju
00050000-5578-10ee-04a9-0e351bc2a87e	2230	Lenart v Slovenskih goricah
00050000-5578-10ee-08fd-1cc38b3e3041	9220	Lendava/Lendva
00050000-5578-10ee-9a63-d49dee07424d	4248	Lesce
00050000-5578-10ee-1d66-55dfc2eaf4f3	3261	Lesično
00050000-5578-10ee-346a-0fe1208fbd1e	8273	Leskovec pri Krškem
00050000-5578-10ee-309e-0c03c097f621	2372	Libeliče
00050000-5578-10ee-ae25-77ac7d526111	2341	Limbuš
00050000-5578-10ee-2abc-fe6dda412c92	1270	Litija
00050000-5578-10ee-293c-a706c5ef505b	3202	Ljubečna
00050000-5578-10ee-656d-da1431420dcd	1000	Ljubljana 
00050000-5578-10ee-60d2-0a06ab71b36c	1001	Ljubljana - poštni predali
00050000-5578-10ee-d3a3-f655d365393c	1231	Ljubljana - Črnuče
00050000-5578-10ee-02a4-498e53464a96	1261	Ljubljana - Dobrunje
00050000-5578-10ee-6b28-4c1d4277fe16	1260	Ljubljana - Polje
00050000-5578-10ee-4fdb-5244b141324c	1210	Ljubljana - Šentvid
00050000-5578-10ee-e3d7-e5d3b24778a3	1211	Ljubljana - Šmartno
00050000-5578-10ee-e99c-5d12b8044e25	3333	Ljubno ob Savinji
00050000-5578-10ee-4c44-1a32bc1818f3	9240	Ljutomer
00050000-5578-10ee-39b7-521b4538d5f4	3215	Loče
00050000-5578-10ee-1e3f-63377fadf376	5231	Log pod Mangartom
00050000-5578-10ee-0edc-c06a98f95aa4	1358	Log pri Brezovici
00050000-5578-10ee-c496-960e6356a20d	1370	Logatec
00050000-5578-10ee-7faf-b5d599291eff	1371	Logatec
00050000-5578-10ee-939a-6b433eda34e7	1434	Loka pri Zidanem Mostu
00050000-5578-10ee-95a7-dc9c250615ac	3223	Loka pri Žusmu
00050000-5578-10ee-23ff-dc53ee117692	6219	Lokev
00050000-5578-10ee-3b91-d2d5674d20df	1318	Loški Potok
00050000-5578-10ee-fff7-11912b478841	2324	Lovrenc na Dravskem polju
00050000-5578-10ee-bd84-4d2488c5a5a7	2344	Lovrenc na Pohorju
00050000-5578-10ee-08b9-2bb679cade9a	3334	Luče
00050000-5578-10ee-042a-5db4b247e6cb	1225	Lukovica
00050000-5578-10ee-9a84-a5eacf0c7e20	9202	Mačkovci
00050000-5578-10ee-b11f-51b0f9440d1a	2322	Majšperk
00050000-5578-10ee-8890-30e09f8ac285	2321	Makole
00050000-5578-10ee-d063-0d315fb9da7b	9243	Mala Nedelja
00050000-5578-10ee-cbb3-ac01fe009d90	2229	Malečnik
00050000-5578-10ee-4ac6-169fbb7e4718	6273	Marezige
00050000-5578-10ee-edce-4a6143f7f423	2000	Maribor 
00050000-5578-10ee-86c3-babadbdf8be1	2001	Maribor - poštni predali
00050000-5578-10ee-c121-c97fea3ec1a1	2206	Marjeta na Dravskem polju
00050000-5578-10ee-74d8-b297f4dddf02	2281	Markovci
00050000-5578-10ee-07bf-51fc1cedecad	9221	Martjanci
00050000-5578-10ee-42ff-76b42ca50153	6242	Materija
00050000-5578-10ee-c78e-443280cfcd62	4211	Mavčiče
00050000-5578-10ee-9e44-8bff460f9383	1215	Medvode
00050000-5578-10ee-1487-34833f27ac46	1234	Mengeš
00050000-5578-10ee-e218-58bf7c46f225	8330	Metlika
00050000-5578-10ee-6c3f-c793d22df90a	2392	Mežica
00050000-5578-10ee-9be6-dd91afb76bdb	2204	Miklavž na Dravskem polju
00050000-5578-10ee-1a25-81147d014a14	2275	Miklavž pri Ormožu
00050000-5578-10ee-dc0e-8542ff75c9c8	5291	Miren
00050000-5578-10ee-0432-7fb79f859b37	8233	Mirna
00050000-5578-10ee-2ff1-dc8d9fdaefba	8216	Mirna Peč
00050000-5578-10ee-59cc-24eb3c694b0a	2382	Mislinja
00050000-5578-10ee-3003-d157f21af4bf	4281	Mojstrana
00050000-5578-10ee-9247-e1ba8338f18d	8230	Mokronog
00050000-5578-10ee-cf60-b9a2b2d325f4	1251	Moravče
00050000-5578-10ee-6206-af91b7bd4b5a	9226	Moravske Toplice
00050000-5578-10ee-5a77-50f0a23b3759	5216	Most na Soči
00050000-5578-10ee-b4ef-8626dbbec85d	1221	Motnik
00050000-5578-10ee-2188-4edf67359338	3330	Mozirje
00050000-5578-10ee-58c3-9fa4357831a0	9000	Murska Sobota 
00050000-5578-10ee-2b34-7b6d581e9451	9001	Murska Sobota - poštni predali
00050000-5578-10ee-a970-84201a58661a	2366	Muta
00050000-5578-10ee-ea41-fd1dff4eff75	4202	Naklo
00050000-5578-10ee-a53b-bc3822df058b	3331	Nazarje
00050000-5578-10ee-f5c2-390381694574	1357	Notranje Gorice
00050000-5578-10ee-2b5e-925350f41d61	3203	Nova Cerkev
00050000-5578-10ee-1696-741d90ddfa1e	5000	Nova Gorica 
00050000-5578-10ee-0fd2-95271bdb3694	5001	Nova Gorica - poštni predali
00050000-5578-10ee-12c5-8e9035681c9f	1385	Nova vas
00050000-5578-10ee-52f1-ceac971575ff	8000	Novo mesto
00050000-5578-10ee-1c19-c7b6aba368f8	8001	Novo mesto - poštni predali
00050000-5578-10ee-c7b3-06e56a16db26	6243	Obrov
00050000-5578-10ee-1fdb-9b7dae6ca79a	9233	Odranci
00050000-5578-10ee-3c17-f78dc5e8e9dc	2317	Oplotnica
00050000-5578-10ee-c171-ecb167e3eb1c	2312	Orehova vas
00050000-5578-10ee-9579-b59c4878ca45	2270	Ormož
00050000-5578-10ee-84dc-5a86b2b97d03	1316	Ortnek
00050000-5578-10ee-d910-8aeada44a19b	1337	Osilnica
00050000-5578-10ee-d891-704642793e8e	8222	Otočec
00050000-5578-10ee-dabd-6c5582767d0f	2361	Ožbalt
00050000-5578-10ee-52bc-419643e74a3d	2231	Pernica
00050000-5578-10ee-e2cd-23a85759bbe7	2211	Pesnica pri Mariboru
00050000-5578-10ee-0af3-ec43ecd20144	9203	Petrovci
00050000-5578-10ee-6bfe-0f9dcd406a5f	3301	Petrovče
00050000-5578-10ee-9188-3ca3ab1a8c35	6330	Piran/Pirano
00050000-5578-10ee-7cad-acaef9f43492	8255	Pišece
00050000-5578-10ee-bfa5-f9d0bd600ce8	6257	Pivka
00050000-5578-10ee-385c-3ab947a2ec22	6232	Planina
00050000-5578-10ee-c4e0-52710c44a2bd	3225	Planina pri Sevnici
00050000-5578-10ee-fae5-69060565682d	6276	Pobegi
00050000-5578-10ee-a38f-624283909c69	8312	Podbočje
00050000-5578-10ee-a8d3-dcccecf4982e	5243	Podbrdo
00050000-5578-10ee-83e8-cff6a054aca7	3254	Podčetrtek
00050000-5578-10ee-a5e7-bb04d8a58e72	2273	Podgorci
00050000-5578-10ee-4dcb-542ff8dd8802	6216	Podgorje
00050000-5578-10ee-6b13-c09ca83b4210	2381	Podgorje pri Slovenj Gradcu
00050000-5578-10ee-2ef6-d3923c8cd65c	6244	Podgrad
00050000-5578-10ee-a634-7267b82d7977	1414	Podkum
00050000-5578-10ee-5813-4779c9dcac54	2286	Podlehnik
00050000-5578-10ee-8752-e26f02ee762c	5272	Podnanos
00050000-5578-10ee-3223-7b0ed13bbe6f	4244	Podnart
00050000-5578-10ee-2925-24606c57d2e7	3241	Podplat
00050000-5578-10ee-b123-919bc9fba37d	3257	Podsreda
00050000-5578-10ee-6c29-9d168b7af1f1	2363	Podvelka
00050000-5578-10ee-55f3-b3dc990a873a	2208	Pohorje
00050000-5578-10ee-1da6-e6416b521872	2257	Polenšak
00050000-5578-10ee-7d0d-98c6299c4757	1355	Polhov Gradec
00050000-5578-10ee-e215-589534303db0	4223	Poljane nad Škofjo Loko
00050000-5578-10ee-f28a-0f62db138203	2319	Poljčane
00050000-5578-10ee-1050-c065bef3047e	1272	Polšnik
00050000-5578-10ee-262a-dad60465a1ce	3313	Polzela
00050000-5578-10ee-6e3c-6841c6528cc4	3232	Ponikva
00050000-5578-10ee-ccad-e168f858c51f	6320	Portorož/Portorose
00050000-5578-10ee-818b-4369684b1bf4	6230	Postojna
00050000-5578-10ee-3ce9-9d963911c0dc	2331	Pragersko
00050000-5578-10ee-bca1-97a8ba0d8ad2	3312	Prebold
00050000-5578-10ee-9236-8915ecb90197	4205	Preddvor
00050000-5578-10ee-56d4-e42c980887db	6255	Prem
00050000-5578-10ee-a3ea-8b60010dd69b	1352	Preserje
00050000-5578-10ee-5e44-41cac668bf7a	6258	Prestranek
00050000-5578-10ee-e786-ad84e1d751ed	2391	Prevalje
00050000-5578-10ee-6266-4b606ae1d096	3262	Prevorje
00050000-5578-10ee-39e6-d2e912e7b553	1276	Primskovo 
00050000-5578-10ee-f90e-24f5579b53b8	3253	Pristava pri Mestinju
00050000-5578-10ee-7c4d-9684a1a7e87f	9207	Prosenjakovci/Partosfalva
00050000-5578-10ee-03b7-78ad5cc679d9	5297	Prvačina
00050000-5578-10ee-2c20-6f2b46f84d23	2250	Ptuj
00050000-5578-10ee-26cf-8cf01431aafb	2323	Ptujska Gora
00050000-5578-10ee-25cb-20a63a02f29d	9201	Puconci
00050000-5578-10ee-18de-85620dc76113	2327	Rače
00050000-5578-10ee-d0fe-6b3112e9371c	1433	Radeče
00050000-5578-10ee-fe3c-25fd1d6ea7db	9252	Radenci
00050000-5578-10ee-d325-e9c3618dd9fb	2360	Radlje ob Dravi
00050000-5578-10ee-1f6e-63d57ccec7d5	1235	Radomlje
00050000-5578-10ee-2d96-7070222005d7	4240	Radovljica
00050000-5578-10ee-e896-e252d864977d	8274	Raka
00050000-5578-10ee-d87d-05d0d63d5736	1381	Rakek
00050000-5578-10ee-256c-3a45f8257d4a	4283	Rateče - Planica
00050000-5578-10ee-e394-a6f778d2820e	2390	Ravne na Koroškem
00050000-5578-10ee-f56b-be169a9db1d4	9246	Razkrižje
00050000-5578-10ee-df00-f5bf92f5bbde	3332	Rečica ob Savinji
00050000-5578-10ee-1fb5-33e45535bac7	5292	Renče
00050000-5578-10ee-4960-5ecbf2d753dd	1310	Ribnica
00050000-5578-10ee-151f-d747cdec25cb	2364	Ribnica na Pohorju
00050000-5578-10ee-53dc-bfa31e2d3c7d	3272	Rimske Toplice
00050000-5578-10ee-0e12-959e017d7002	1314	Rob
00050000-5578-10ee-84c5-54569c500051	5215	Ročinj
00050000-5578-10ee-57f1-035845374438	3250	Rogaška Slatina
00050000-5578-10ee-f409-95d68e363e7c	9262	Rogašovci
00050000-5578-10ee-a04d-d040ed190e15	3252	Rogatec
00050000-5578-10ee-1766-4e8230941c4c	1373	Rovte
00050000-5578-10ee-b3c8-02fb453524f8	2342	Ruše
00050000-5578-10ee-ff1a-784b014f4821	1282	Sava
00050000-5578-10ee-b19a-cdef604968ff	6333	Sečovlje/Sicciole
00050000-5578-10ee-fe6c-28f7e756861a	4227	Selca
00050000-5578-10ee-f2df-376f198b593a	2352	Selnica ob Dravi
00050000-5578-10ee-23bc-edc118d09494	8333	Semič
00050000-5578-10ee-af40-f4d561b13371	8281	Senovo
00050000-5578-10ee-7f50-0c0ff84727b6	6224	Senožeče
00050000-5578-10ee-d10c-032a4be7eef5	8290	Sevnica
00050000-5578-10ee-46c2-2295466e0ac5	6210	Sežana
00050000-5578-10ee-1930-353b297bfe6e	2214	Sladki Vrh
00050000-5578-10ee-d3ce-0928de240870	5283	Slap ob Idrijci
00050000-5578-10ee-5918-41757542c9b1	2380	Slovenj Gradec
00050000-5578-10ee-7728-0ec483d31697	2310	Slovenska Bistrica
00050000-5578-10ee-9fc6-efa34085ddfc	3210	Slovenske Konjice
00050000-5578-10ee-09f6-d7fff1c05639	1216	Smlednik
00050000-5578-10ee-e5c4-84ed10b47aa0	5232	Soča
00050000-5578-10ee-2e68-4d68fc3f3048	1317	Sodražica
00050000-5578-10ee-e07a-5d55fe472959	3335	Solčava
00050000-5578-10ee-cafe-91dc4b3663fa	5250	Solkan
00050000-5578-10ee-7f07-627c683376b3	4229	Sorica
00050000-5578-10ee-ae5d-3178b9b4be05	4225	Sovodenj
00050000-5578-10ee-5e65-f2db83fea0b1	5281	Spodnja Idrija
00050000-5578-10ee-9d80-8f4a93943b67	2241	Spodnji Duplek
00050000-5578-10ee-8045-e4fa03acebc3	9245	Spodnji Ivanjci
00050000-5578-10ee-a47f-f1173346e822	2277	Središče ob Dravi
00050000-5578-10ee-6c64-2ef0de8858fa	4267	Srednja vas v Bohinju
00050000-5578-10ee-829f-b32066fc0f5a	8256	Sromlje 
00050000-5578-10ee-9bec-e46dfe2c1b5d	5224	Srpenica
00050000-5578-10ee-2a0a-c801c5f33225	1242	Stahovica
00050000-5578-10ee-2782-8d42f2e37ce9	1332	Stara Cerkev
00050000-5578-10ee-bd43-8911b4e53744	8342	Stari trg ob Kolpi
00050000-5578-10ee-238d-9e857e73e7e7	1386	Stari trg pri Ložu
00050000-5578-10ee-588e-188e57e5d8d4	2205	Starše
00050000-5578-10ee-0c57-4dc76ce44b8c	2289	Stoperce
00050000-5578-10ee-75fb-7562d583df94	8322	Stopiče
00050000-5578-10ee-93da-30f494d11266	3206	Stranice
00050000-5578-10ee-3803-a01d22838682	8351	Straža
00050000-5578-10ee-a4ac-cb186a20d297	1313	Struge
00050000-5578-10ee-2742-d65631a46c3f	8293	Studenec
00050000-5578-10ee-c941-3837616b45cc	8331	Suhor
00050000-5578-10ee-3f8d-5566cde289ac	2233	Sv. Ana v Slovenskih goricah
00050000-5578-10ee-ff5a-6c1aefee4640	2235	Sv. Trojica v Slovenskih goricah
00050000-5578-10ee-070c-7f51b4e663f0	2353	Sveti Duh na Ostrem Vrhu
00050000-5578-10ee-e897-df62a5ae55a3	9244	Sveti Jurij ob Ščavnici
00050000-5578-10ee-1f28-58508f8f9ea7	3264	Sveti Štefan
00050000-5578-10ee-70de-94235b7a6ead	2258	Sveti Tomaž
00050000-5578-10ee-4b23-fde43669f68f	9204	Šalovci
00050000-5578-10ee-4c3f-2a42146a4e0a	5261	Šempas
00050000-5578-10ee-39d9-e67613527a68	5290	Šempeter pri Gorici
00050000-5578-10ee-9cf5-971f42720237	3311	Šempeter v Savinjski dolini
00050000-5578-10ee-9408-f917731b89a9	4208	Šenčur
00050000-5578-10ee-e787-920ece521b45	2212	Šentilj v Slovenskih goricah
00050000-5578-10ee-046f-c1a8567a6867	8297	Šentjanž
00050000-5578-10ee-c5f9-adfc4289a4ad	2373	Šentjanž pri Dravogradu
00050000-5578-10ee-6f70-5a2e4b5af011	8310	Šentjernej
00050000-5578-10ee-d824-62b8eba67acb	3230	Šentjur
00050000-5578-10ee-ac1a-9c147916dce4	3271	Šentrupert
00050000-5578-10ee-a648-1e0a4743bc18	8232	Šentrupert
00050000-5578-10ee-7bca-12b1865beb7b	1296	Šentvid pri Stični
00050000-5578-10ee-e8e0-338853602259	8275	Škocjan
00050000-5578-10ee-90c9-da53d4c10317	6281	Škofije
00050000-5578-10ee-0e11-a063f852a872	4220	Škofja Loka
00050000-5578-10ee-5441-458b1782a713	3211	Škofja vas
00050000-5578-10ee-d3a6-d501d954d19c	1291	Škofljica
00050000-5578-10ee-1713-db19a0d88f62	6274	Šmarje
00050000-5578-10ee-bd4d-1829f2edfb05	1293	Šmarje - Sap
00050000-5578-10ee-32ec-e781bcf5f82b	3240	Šmarje pri Jelšah
00050000-5578-10ee-1cab-c37417fed560	8220	Šmarješke Toplice
00050000-5578-10ee-bbe5-6b64a341e2fe	2315	Šmartno na Pohorju
00050000-5578-10ee-45c7-23145a929c04	3341	Šmartno ob Dreti
00050000-5578-10ee-26fc-9c7ab532e5bb	3327	Šmartno ob Paki
00050000-5578-10ee-1e36-3bb146516776	1275	Šmartno pri Litiji
00050000-5578-10ee-22ab-57dfb9cb7e3d	2383	Šmartno pri Slovenj Gradcu
00050000-5578-10ee-3a92-820f9008c5be	3201	Šmartno v Rožni dolini
00050000-5578-10ee-aa4b-750018d13ff4	3325	Šoštanj
00050000-5578-10ee-7897-f77b8420cf2b	6222	Štanjel
00050000-5578-10ee-c571-ca1a7491eb18	3220	Štore
00050000-5578-10ee-1d50-3cede25d5753	3304	Tabor
00050000-5578-10ee-6276-1d929b8defff	3221	Teharje
00050000-5578-10ee-aafe-16ca66773c4d	9251	Tišina
00050000-5578-10ee-b741-d82d79c3704a	5220	Tolmin
00050000-5578-10ee-74b3-be709d8c623c	3326	Topolšica
00050000-5578-10ee-4ddd-67410a072abb	2371	Trbonje
00050000-5578-10ee-99c9-a36845dd6c0c	1420	Trbovlje
00050000-5578-10ee-baa4-fb73fc36ea62	8231	Trebelno 
00050000-5578-10ee-c568-ad58fe3cc53a	8210	Trebnje
00050000-5578-10ee-fea3-0bbaa10560cf	5252	Trnovo pri Gorici
00050000-5578-10ee-7c12-0d095ac8b447	2254	Trnovska vas
00050000-5578-10ee-eca3-f60d8307100f	1222	Trojane
00050000-5578-10ee-ac56-ef0be808a56d	1236	Trzin
00050000-5578-10ee-d4f1-ed0bf6a1b4c3	4290	Tržič
00050000-5578-10ee-2b2a-726bfffbd6b0	8295	Tržišče
00050000-5578-10ee-c4a5-1b1cd70dbd43	1311	Turjak
00050000-5578-10ee-169e-c9ff0fd7af0d	9224	Turnišče
00050000-5578-10ee-d7fe-93ef8ecda9eb	8323	Uršna sela
00050000-5578-10ee-f723-bcd0850f96fb	1252	Vače
00050000-5578-10ee-4c4e-66624699c459	3320	Velenje 
00050000-5578-10ee-7930-b35edc067f64	3322	Velenje - poštni predali
00050000-5578-10ee-30b1-e1e87a9ed1b0	8212	Velika Loka
00050000-5578-10ee-b098-9d4a43fd7621	2274	Velika Nedelja
00050000-5578-10ee-30bf-757859d11b98	9225	Velika Polana
00050000-5578-10ee-1728-b2c989b02417	1315	Velike Lašče
00050000-5578-10ee-a523-fa20a8bbe5ee	8213	Veliki Gaber
00050000-5578-10ee-9353-4d8429c4d133	9241	Veržej
00050000-5578-10ee-1490-994a1bb522ea	1312	Videm - Dobrepolje
00050000-5578-10ee-1e0a-cf5e69163ec6	2284	Videm pri Ptuju
00050000-5578-10ee-665c-dca5907f585b	8344	Vinica
00050000-5578-10ee-a0f3-edd15e673e7e	5271	Vipava
00050000-5578-10ee-d86d-61b9c7dfd004	4212	Visoko
00050000-5578-10ee-cd0d-70038f85ec56	1294	Višnja Gora
00050000-5578-10ee-c0b8-acd14c0fa45b	3205	Vitanje
00050000-5578-10ee-6bed-a709cc70a6f5	2255	Vitomarci
00050000-5578-10ee-6a4b-8ea2547d601c	1217	Vodice
00050000-5578-10ee-1b12-bbe60ad2b2cb	3212	Vojnik\t
00050000-5578-10ee-4513-f81f158a85b1	5293	Volčja Draga
00050000-5578-10ee-a05a-709463b9efa1	2232	Voličina
00050000-5578-10ee-9325-53ff0a36bdcc	3305	Vransko
00050000-5578-10ee-0f5e-44de09d124f7	6217	Vremski Britof
00050000-5578-10ee-eabc-2636150757b5	1360	Vrhnika
00050000-5578-10ee-e3dc-597ad665c5d0	2365	Vuhred
00050000-5578-10ee-be21-4148b5ba4463	2367	Vuzenica
00050000-5578-10ee-5cc1-788e70f7765a	8292	Zabukovje 
00050000-5578-10ee-aee1-cf1b8755bdda	1410	Zagorje ob Savi
00050000-5578-10ee-b33f-465e9996ec7a	1303	Zagradec
00050000-5578-10ee-5deb-798d1eb530af	2283	Zavrč
00050000-5578-10ee-2163-54aa23b425bc	8272	Zdole 
00050000-5578-10ee-9bce-637492689405	4201	Zgornja Besnica
00050000-5578-10ee-51dc-332a4057adb4	2242	Zgornja Korena
00050000-5578-10ee-b981-5535219a15b4	2201	Zgornja Kungota
00050000-5578-10ee-1b16-afff63d3db15	2316	Zgornja Ložnica
00050000-5578-10ee-dde7-81805f80d191	2314	Zgornja Polskava
00050000-5578-10ee-c6e5-fcb61723eae4	2213	Zgornja Velka
00050000-5578-10ee-ec56-696e65fa92df	4247	Zgornje Gorje
00050000-5578-10ee-dc73-1b080503a9e9	4206	Zgornje Jezersko
00050000-5578-10ee-3c3a-5f7c99789dc3	2285	Zgornji Leskovec
00050000-5578-10ee-5b35-e89b952561e5	1432	Zidani Most
00050000-5578-10ee-c2f3-fb35b78d05e4	3214	Zreče
00050000-5578-10ee-ce68-4da18435a79d	4209	Žabnica
00050000-5578-10ee-c25e-b00dc7d4f509	3310	Žalec
00050000-5578-10ee-1749-2a7d7653ee73	4228	Železniki
00050000-5578-10ee-4f2a-dd0a953be5a1	2287	Žetale
00050000-5578-10ee-c4a1-d0a9506cb592	4226	Žiri
00050000-5578-10ee-efbc-652af9f9935a	4274	Žirovnica
00050000-5578-10ee-b807-a452479c7b85	8360	Žužemberk
\.


--
-- TOC entry 2826 (class 0 OID 6824064)
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
-- TOC entry 2808 (class 0 OID 6823875)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6823953)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6824076)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6824196)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6824249)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5578-10f0-1299-e56eb93e4b3b	00080000-5578-10f0-4777-547134053368	0987	A
00190000-5578-10f0-43f5-30b24824bb73	00080000-5578-10f0-dc66-b7b5762a3c3a	0989	A
\.


--
-- TOC entry 2852 (class 0 OID 6824364)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6824415)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6824377)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6824385)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6824105)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5578-10f0-d797-ee7998db08ab	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5578-10f0-c378-9d64d07af9fe	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5578-10f0-47b3-44ce7bd6c17c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5578-10f0-68a7-39bda092c49b	0004	Mali oder	t	24	Mali oder 
00220000-5578-10f0-5a46-7573a7b16108	0005	Komorni oder	t	15	Komorni oder
00220000-5578-10f0-eeb9-aefc8d183803	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5578-10f0-927a-440daf81e12d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2824 (class 0 OID 6824049)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6824039)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6824238)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6824173)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6823747)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5578-10ef-530d-bda635d6fdc5	00010000-5578-10ef-9e5c-ed7230083add	2015-06-10 12:26:57	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROU/sfq8fuR2g/RAIcNXTW.3zDn8iQm7u";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2833 (class 0 OID 6824115)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6823785)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5578-10ef-c653-c2099e9aedae	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5578-10ef-eb5f-2c5c2bf2126e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5578-10ef-6b82-02b3122dea3a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5578-10ef-1738-4ff840fc56d6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5578-10ef-7190-ed47c84f41f4	planer	Planer dogodkov v koledarju	t
00020000-5578-10ef-4252-20490343e5d0	kadrovska	Kadrovska služba	t
00020000-5578-10ef-d993-8ab468182c11	arhivar	Ažuriranje arhivalij	t
00020000-5578-10ef-ecb0-3901d05b758a	igralec	Igralec	t
00020000-5578-10ef-2fd1-23e462763ded	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2799 (class 0 OID 6823769)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5578-10ef-530d-bda635d6fdc5	00020000-5578-10ef-6b82-02b3122dea3a
00010000-5578-10ef-9e5c-ed7230083add	00020000-5578-10ef-6b82-02b3122dea3a
\.


--
-- TOC entry 2835 (class 0 OID 6824129)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6824070)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6824020)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 6824434)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5578-10ef-992f-4fbf24d5b913	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5578-10ef-4b40-dcaf2d889f6f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5578-10ef-9773-c7699374613e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5578-10ef-9068-ad2dea40a9b9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5578-10ef-3283-13374f84c23a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2858 (class 0 OID 6824426)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5578-10ef-82db-a23fafa5d159	00230000-5578-10ef-9068-ad2dea40a9b9	popa
00240000-5578-10ef-75b9-1a5958d5ed17	00230000-5578-10ef-9068-ad2dea40a9b9	oseba
00240000-5578-10ef-e16e-70ebef4388d5	00230000-5578-10ef-4b40-dcaf2d889f6f	prostor
00240000-5578-10ef-c14d-f2ded8e7db2f	00230000-5578-10ef-9068-ad2dea40a9b9	besedilo
00240000-5578-10ef-fe8b-b2fa02095d60	00230000-5578-10ef-9068-ad2dea40a9b9	uprizoritev
00240000-5578-10ef-7887-0f8c2c4e5f50	00230000-5578-10ef-9068-ad2dea40a9b9	funkcija
00240000-5578-10ef-0538-5c64c7cb0760	00230000-5578-10ef-9068-ad2dea40a9b9	tipfunkcije
00240000-5578-10ef-493b-94465206b426	00230000-5578-10ef-9068-ad2dea40a9b9	alternacija
00240000-5578-10ef-2385-adfcf97ff424	00230000-5578-10ef-992f-4fbf24d5b913	pogodba
00240000-5578-10ef-c554-9e8440542b76	00230000-5578-10ef-9068-ad2dea40a9b9	zaposlitev
\.


--
-- TOC entry 2857 (class 0 OID 6824421)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6824183)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6823847)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6824026)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5578-10f0-9884-e6174afa7350	00180000-5578-10f0-cf87-46bba900dc84	000c0000-5578-10f0-7efd-00fa483fd13e	00090000-5578-10f0-21ef-a3ea481f6347	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-10f0-ab56-383c77a592c8	00180000-5578-10f0-cf87-46bba900dc84	000c0000-5578-10f0-9882-2d94cc5bd8da	00090000-5578-10f0-46a0-5c79ceb53408	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-10f0-5957-36cf64588651	00180000-5578-10f0-cf87-46bba900dc84	000c0000-5578-10f0-407b-0a1d7c151190	00090000-5578-10f0-f7e1-2bda8831818b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-10f0-8633-e61fd9dbbd66	00180000-5578-10f0-cf87-46bba900dc84	000c0000-5578-10f0-f599-be320bda54cc	00090000-5578-10f0-7dfc-6f3b8ffdabcb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-10f0-1930-c12a358638d2	00180000-5578-10f0-cf87-46bba900dc84	000c0000-5578-10f0-f4a5-45c317456b18	00090000-5578-10f0-1b23-ef21fc0461a1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-10f0-dd6f-005fa21745e1	00180000-5578-10f0-fdbd-c306e4ac45d1	\N	00090000-5578-10f0-1b23-ef21fc0461a1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2843 (class 0 OID 6824227)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5578-10ef-9852-6c37625311b7	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5578-10ef-726b-ba155c0cf5f9	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5578-10ef-2804-f10e2caf80d7	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5578-10ef-518a-481557b91536	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5578-10ef-742b-e600798cef0c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5578-10ef-fc2d-bc63d85bba56	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5578-10ef-a037-8b9494db99cc	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5578-10ef-3882-11af1ba20a3d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5578-10ef-4d44-ee11b9b7418f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5578-10ef-d24d-af439753ce23	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5578-10ef-654e-639c9aa44459	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5578-10ef-0e39-2c005bf874f7	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5578-10ef-02b5-44cf6531d0e2	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5578-10ef-3d2a-cc85efff2e9b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5578-10ef-8593-e18e0e0cc1ec	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5578-10ef-702e-a3f4ff708fc7	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2855 (class 0 OID 6824404)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5578-10ef-3d44-6b64b699cc91	01	Velika predstava	f	1.00	1.00
002b0000-5578-10ef-e4c2-48e2c3f52320	02	Mala predstava	f	0.50	0.50
002b0000-5578-10ef-73fc-cd733f0bf893	03	Mala koprodukcija	t	0.40	1.00
002b0000-5578-10ef-4853-dff5eb86c39a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5578-10ef-ca87-c026840979a8	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2811 (class 0 OID 6823910)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6823756)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5578-10ef-9e5c-ed7230083add	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4Y1DrFmUuY0bGvWbdISdSqh1VOMWQPa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5578-10f0-2635-602bce760dba	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5578-10f0-8470-fa80e23cf606	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5578-10f0-be7c-9ddab4761d93	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5578-10f0-e824-7cadf8570016	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5578-10f0-bb2f-47a8a03832f9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5578-10f0-c706-797d644fe97b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5578-10ef-530d-bda635d6fdc5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 6824284)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5578-10f0-1b18-dd70614650ab	00160000-5578-10f0-16e0-a75667d09248	00150000-5578-10ef-7201-a7afa48e3972	00140000-5578-10ef-0515-026abfdf90b1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5578-10f0-5a46-7573a7b16108
000e0000-5578-10f0-fd9a-6c932cb8ac5b	00160000-5578-10f0-1b10-0160eedb5b7d	00150000-5578-10ef-1ea9-a0d4e915dc77	00140000-5578-10ef-a388-34586782ff05	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5578-10f0-eeb9-aefc8d183803
000e0000-5578-10f0-17a9-30dabf847670	\N	00150000-5578-10ef-1ea9-a0d4e915dc77	00140000-5578-10ef-a388-34586782ff05	00190000-5578-10f0-1299-e56eb93e4b3b	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5578-10f0-5a46-7573a7b16108
000e0000-5578-10f0-21cf-83644e7537d5	\N	00150000-5578-10ef-1ea9-a0d4e915dc77	00140000-5578-10ef-a388-34586782ff05	00190000-5578-10f0-1299-e56eb93e4b3b	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5578-10f0-5a46-7573a7b16108
\.


--
-- TOC entry 2816 (class 0 OID 6823972)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5578-10f0-941b-31ad233761f7	000e0000-5578-10f0-fd9a-6c932cb8ac5b	1	
00200000-5578-10f0-b41c-fb90b9055d7e	000e0000-5578-10f0-fd9a-6c932cb8ac5b	2	
\.


--
-- TOC entry 2831 (class 0 OID 6824097)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6824166)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6824004)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6824274)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5578-10ef-0515-026abfdf90b1	01	Drama	drama (SURS 01)
00140000-5578-10ef-4ab4-7fc76d910fee	02	Opera	opera (SURS 02)
00140000-5578-10ef-68b9-c24214aeb894	03	Balet	balet (SURS 03)
00140000-5578-10ef-6e23-1481fcfe19a2	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5578-10ef-8773-9bb77d449a97	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5578-10ef-a388-34586782ff05	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5578-10ef-2f8f-8a0644a8f894	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2837 (class 0 OID 6824156)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5578-10ef-9bc2-558711d877ce	01	Opera	opera
00150000-5578-10ef-ef30-9e623be02437	02	Opereta	opereta
00150000-5578-10ef-c9cb-974cfa04c442	03	Balet	balet
00150000-5578-10ef-37ea-c2c2e2da539b	04	Plesne prireditve	plesne prireditve
00150000-5578-10ef-79eb-ce064252ff65	05	Lutkovno gledališče	lutkovno gledališče
00150000-5578-10ef-651a-bc699c835bef	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5578-10ef-af8e-939a660d6631	07	Biografska drama	biografska drama
00150000-5578-10ef-7201-a7afa48e3972	08	Komedija	komedija
00150000-5578-10ef-1414-4d8d20f1e101	09	Črna komedija	črna komedija
00150000-5578-10ef-ecf3-0bde0649071e	10	E-igra	E-igra
00150000-5578-10ef-1ea9-a0d4e915dc77	11	Kriminalka	kriminalka
00150000-5578-10ef-ea83-c145d9aa0e28	12	Musical	musical
\.


--
-- TOC entry 2383 (class 2606 OID 6823810)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6824331)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6824321)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6824226)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6823994)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6824019)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6823936)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6824360)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6824152)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6823970)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 6824013)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6823950)
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
-- TOC entry 2475 (class 2606 OID 6824062)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6824089)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6823908)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 6823819)
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
-- TOC entry 2390 (class 2606 OID 6823843)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6823799)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2374 (class 2606 OID 6823784)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6824095)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6824128)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6824269)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6823872)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6823896)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6824068)
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
-- TOC entry 2405 (class 2606 OID 6823886)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6823957)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6824080)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6824208)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6824254)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6824375)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6824419)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6824382)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 6824402)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6824112)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6824053)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 6824044)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6824248)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6824180)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6823755)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 6824119)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6823773)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2376 (class 2606 OID 6823793)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6824137)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6824075)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6824025)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6824443)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 6824431)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6824425)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6824193)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6823852)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6824035)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6824237)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 6824414)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6823921)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6823768)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6824300)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6823979)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6824103)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6824171)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 6824008)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6824282)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6824164)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 1259 OID 6824001)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2523 (class 1259 OID 6824194)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6824195)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6823874)
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
-- TOC entry 2488 (class 1259 OID 6824096)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2482 (class 1259 OID 6824082)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2483 (class 1259 OID 6824081)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 6823980)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2510 (class 1259 OID 6824153)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6824155)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2512 (class 1259 OID 6824154)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2422 (class 1259 OID 6823952)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2423 (class 1259 OID 6823951)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 6824271)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 6824272)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 6824273)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2582 (class 1259 OID 6824403)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2550 (class 1259 OID 6824305)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2551 (class 1259 OID 6824302)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2552 (class 1259 OID 6824306)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2553 (class 1259 OID 6824304)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2554 (class 1259 OID 6824303)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2412 (class 1259 OID 6823923)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 6823922)
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
-- TOC entry 2388 (class 1259 OID 6823846)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2498 (class 1259 OID 6824120)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 6824014)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2378 (class 1259 OID 6823800)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2379 (class 1259 OID 6823801)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2503 (class 1259 OID 6824140)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2504 (class 1259 OID 6824139)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2505 (class 1259 OID 6824138)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2426 (class 1259 OID 6823958)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2427 (class 1259 OID 6823960)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2428 (class 1259 OID 6823959)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2592 (class 1259 OID 6824433)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2462 (class 1259 OID 6824048)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2463 (class 1259 OID 6824046)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2464 (class 1259 OID 6824045)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2465 (class 1259 OID 6824047)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2369 (class 1259 OID 6823774)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6823775)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 6824104)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2477 (class 1259 OID 6824069)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2519 (class 1259 OID 6824181)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2520 (class 1259 OID 6824182)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 6824361)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 6824362)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2574 (class 1259 OID 6824363)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2401 (class 1259 OID 6823888)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6823887)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2403 (class 1259 OID 6823889)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 6824420)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 6824209)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 6824210)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2564 (class 1259 OID 6824335)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2565 (class 1259 OID 6824337)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2566 (class 1259 OID 6824333)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2567 (class 1259 OID 6824336)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2568 (class 1259 OID 6824334)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2516 (class 1259 OID 6824172)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 6824057)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2469 (class 1259 OID 6824056)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2470 (class 1259 OID 6824054)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2471 (class 1259 OID 6824055)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2352 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 6824323)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6824322)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2575 (class 1259 OID 6824376)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2433 (class 1259 OID 6823971)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 6823821)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2385 (class 1259 OID 6823820)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2393 (class 1259 OID 6823853)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6823854)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2457 (class 1259 OID 6824038)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 6824037)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2459 (class 1259 OID 6824036)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2578 (class 1259 OID 6824384)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2579 (class 1259 OID 6824383)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2440 (class 1259 OID 6824003)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2441 (class 1259 OID 6823999)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2442 (class 1259 OID 6823996)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2443 (class 1259 OID 6823997)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2444 (class 1259 OID 6823995)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2445 (class 1259 OID 6824000)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2446 (class 1259 OID 6823998)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2400 (class 1259 OID 6823873)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 6823937)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2419 (class 1259 OID 6823939)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2420 (class 1259 OID 6823938)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2421 (class 1259 OID 6823940)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2476 (class 1259 OID 6824063)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2546 (class 1259 OID 6824270)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6824301)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2391 (class 1259 OID 6823844)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6823845)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2513 (class 1259 OID 6824165)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 6824444)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6823909)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2595 (class 1259 OID 6824432)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2496 (class 1259 OID 6824114)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2497 (class 1259 OID 6824113)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 6824332)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2355 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2408 (class 1259 OID 6823897)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6824283)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 6824255)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 6824256)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 6823794)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2447 (class 1259 OID 6824002)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2624 (class 2606 OID 6824580)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2627 (class 2606 OID 6824565)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2626 (class 2606 OID 6824570)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2622 (class 2606 OID 6824590)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2628 (class 2606 OID 6824560)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2623 (class 2606 OID 6824585)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2625 (class 2606 OID 6824575)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6824735)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6824740)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6824495)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2645 (class 2606 OID 6824675)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2643 (class 2606 OID 6824670)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2644 (class 2606 OID 6824665)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2621 (class 2606 OID 6824555)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6824705)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6824715)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2652 (class 2606 OID 6824710)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6824530)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6824525)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6824655)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6824760)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 6824765)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 6824770)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2683 (class 2606 OID 6824865)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 6824790)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2669 (class 2606 OID 6824775)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2665 (class 2606 OID 6824795)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2667 (class 2606 OID 6824785)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2668 (class 2606 OID 6824780)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2613 (class 2606 OID 6824520)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6824515)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6824480)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2606 (class 2606 OID 6824475)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 6824685)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2629 (class 2606 OID 6824595)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6824455)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2601 (class 2606 OID 6824460)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2648 (class 2606 OID 6824700)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2649 (class 2606 OID 6824695)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2650 (class 2606 OID 6824690)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2619 (class 2606 OID 6824535)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2617 (class 2606 OID 6824545)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2618 (class 2606 OID 6824540)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2685 (class 2606 OID 6824875)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2633 (class 2606 OID 6824630)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2635 (class 2606 OID 6824620)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2636 (class 2606 OID 6824615)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2634 (class 2606 OID 6824625)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2600 (class 2606 OID 6824445)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2599 (class 2606 OID 6824450)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 6824680)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2642 (class 2606 OID 6824660)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2656 (class 2606 OID 6824725)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2655 (class 2606 OID 6824730)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 6824835)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 6824840)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2677 (class 2606 OID 6824845)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2611 (class 2606 OID 6824505)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6824500)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2610 (class 2606 OID 6824510)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2684 (class 2606 OID 6824870)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2660 (class 2606 OID 6824745)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2659 (class 2606 OID 6824750)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2674 (class 2606 OID 6824820)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 6824830)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2676 (class 2606 OID 6824810)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2673 (class 2606 OID 6824825)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2675 (class 2606 OID 6824815)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2654 (class 2606 OID 6824720)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6824650)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2638 (class 2606 OID 6824645)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2640 (class 2606 OID 6824635)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2639 (class 2606 OID 6824640)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2670 (class 2606 OID 6824805)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 6824800)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2680 (class 2606 OID 6824850)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2620 (class 2606 OID 6824550)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6824755)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2603 (class 2606 OID 6824470)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2604 (class 2606 OID 6824465)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2608 (class 2606 OID 6824485)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2607 (class 2606 OID 6824490)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 6824610)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2631 (class 2606 OID 6824605)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2632 (class 2606 OID 6824600)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2681 (class 2606 OID 6824860)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2682 (class 2606 OID 6824855)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 12:26:57 CEST

--
-- PostgreSQL database dump complete
--

