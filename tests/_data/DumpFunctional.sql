--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-04 16:35:25 CEST

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
-- TOC entry 180 (class 1259 OID 6305787)
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
-- TOC entry 227 (class 1259 OID 6306310)
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
-- TOC entry 226 (class 1259 OID 6306293)
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
-- TOC entry 219 (class 1259 OID 6306196)
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
-- TOC entry 194 (class 1259 OID 6305966)
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
-- TOC entry 197 (class 1259 OID 6306000)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6305909)
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
-- TOC entry 228 (class 1259 OID 6306324)
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
-- TOC entry 213 (class 1259 OID 6306126)
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
-- TOC entry 192 (class 1259 OID 6305946)
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
-- TOC entry 196 (class 1259 OID 6305994)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6305926)
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
-- TOC entry 202 (class 1259 OID 6306043)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6306068)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6305883)
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
-- TOC entry 181 (class 1259 OID 6305796)
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
-- TOC entry 182 (class 1259 OID 6305807)
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
-- TOC entry 177 (class 1259 OID 6305761)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6305780)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6306075)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6306106)
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
-- TOC entry 223 (class 1259 OID 6306244)
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
-- TOC entry 184 (class 1259 OID 6305840)
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
-- TOC entry 186 (class 1259 OID 6305875)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6306049)
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
-- TOC entry 185 (class 1259 OID 6305860)
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
-- TOC entry 191 (class 1259 OID 6305938)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6306061)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6306181)
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
-- TOC entry 222 (class 1259 OID 6306236)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6306350)
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
-- TOC entry 232 (class 1259 OID 6306378)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6306412)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6306359)
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
-- TOC entry 236 (class 1259 OID 6306408)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6306090)
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
-- TOC entry 201 (class 1259 OID 6306034)
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
-- TOC entry 200 (class 1259 OID 6306024)
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
-- TOC entry 221 (class 1259 OID 6306225)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6306158)
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
-- TOC entry 174 (class 1259 OID 6305732)
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
-- TOC entry 173 (class 1259 OID 6305730)
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
-- TOC entry 210 (class 1259 OID 6306100)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6305770)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6305754)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6306114)
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
-- TOC entry 204 (class 1259 OID 6306055)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6306005)
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
-- TOC entry 235 (class 1259 OID 6306397)
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
-- TOC entry 234 (class 1259 OID 6306389)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6306384)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6306168)
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
-- TOC entry 183 (class 1259 OID 6305832)
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
-- TOC entry 199 (class 1259 OID 6306011)
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
-- TOC entry 220 (class 1259 OID 6306214)
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
-- TOC entry 231 (class 1259 OID 6306367)
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
-- TOC entry 237 (class 1259 OID 6306410)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6305895)
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
-- TOC entry 175 (class 1259 OID 6305741)
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
-- TOC entry 225 (class 1259 OID 6306271)
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
-- TOC entry 193 (class 1259 OID 6305957)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6306082)
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
-- TOC entry 215 (class 1259 OID 6306151)
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
-- TOC entry 195 (class 1259 OID 6305989)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6306261)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6306141)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6305735)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2786 (class 0 OID 6305787)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6306310)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5570-622c-a245-46fa10f9757c	000d0000-5570-622c-c4c7-84ecd7354d69	\N	00090000-5570-622c-49b7-e5443fa98cfc	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5570-622c-883a-880449916e50	000d0000-5570-622c-0aa1-b24b4ecfb96c	\N	00090000-5570-622c-ff0a-61b8b1f8c9a2	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5570-622c-af60-84bb7f66a0a6	000d0000-5570-622c-f492-b30978fbefab	\N	00090000-5570-622c-f2e8-a1947711b551	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5570-622c-9989-4b4552ab2573	000d0000-5570-622c-205b-27d232d21700	\N	00090000-5570-622c-7e40-4fbc2917814c	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-5570-622c-cbb6-f6bb1afeb589	000d0000-5570-622c-95e7-b760ae88950b	\N	00090000-5570-622c-1c93-bec7867449b5	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
000c0000-5570-622c-6b36-3cc93d9c01cf	000d0000-5570-622c-2619-40d30ed17cbc	\N	00090000-5570-622c-ff0a-61b8b1f8c9a2	\N	\N	0006	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2832 (class 0 OID 6306293)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6306196)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5570-622c-959b-03e74fde01ea	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5570-622c-b875-e9ebe2e52168	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5570-622c-1f70-b9f5d1f9011a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2800 (class 0 OID 6305966)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5570-622c-5eba-a5fb9984d4f3	\N	\N	00200000-5570-622c-2a4c-e2e1a5252f1a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5570-622c-9ee2-01129a0ff6e4	\N	\N	00200000-5570-622c-72ad-895200fdbcbc	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5570-622c-f6ae-809c06feb4b4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5570-622c-b953-8cb12c88be7e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5570-622c-fff1-c19a7a0f478e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2803 (class 0 OID 6306000)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6305909)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5570-622b-bfac-84730cf13bd7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5570-622b-bc34-3c7d72d43b9e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5570-622b-320c-f374bc6b7eb5	AL	ALB	008	Albania 	Albanija	\N
00040000-5570-622b-9643-b3f42d31c881	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5570-622b-e948-d0a6da6a6ba0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5570-622b-5bf3-f92ca62ed815	AD	AND	020	Andorra 	Andora	\N
00040000-5570-622b-bf80-7aadcb766d02	AO	AGO	024	Angola 	Angola	\N
00040000-5570-622b-8b2a-bffc54c230e3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5570-622b-0501-7d9b9ee58efb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5570-622b-7009-fe5607c1a5c0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5570-622b-96b1-6e210479d88b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5570-622b-ed2b-b2e09683e824	AM	ARM	051	Armenia 	Armenija	\N
00040000-5570-622b-0bd0-b3f419053127	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5570-622b-d1bc-8261378524bd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5570-622b-cd71-f479bb41fa51	AT	AUT	040	Austria 	Avstrija	\N
00040000-5570-622b-bc5a-4b71d0e2fb9c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5570-622b-d27a-08376c685097	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5570-622b-e4fa-f6d3c537df23	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5570-622b-67e8-92392c30ea54	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5570-622b-2140-656111df4eaf	BB	BRB	052	Barbados 	Barbados	\N
00040000-5570-622b-8d3b-fdfb7e92fd46	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5570-622b-9254-1444ea37642e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5570-622b-564a-31ef44e0f4d4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5570-622b-2213-8af9178ccab7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5570-622b-02b4-82331fc81c46	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5570-622b-38f1-879891993b12	BT	BTN	064	Bhutan 	Butan	\N
00040000-5570-622b-fd65-8df7c061db2b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5570-622b-bf95-3d46cdd8d466	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5570-622b-98c0-891858c6b217	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5570-622b-e37f-d4eb30ad6e0b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5570-622b-ce33-4e620df01b0c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5570-622b-dd0a-0f8851502282	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5570-622b-1d40-11bab0bcb46c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5570-622b-16f7-325815f5d844	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5570-622b-20bd-cf4e442df7ec	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5570-622b-2c80-501eda43455b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5570-622b-9d21-a68c0df07758	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5570-622b-12f2-cde502cd5aac	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5570-622b-4bb9-849c2e43284d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5570-622b-f83d-2d2affe55f3a	CA	CAN	124	Canada 	Kanada	\N
00040000-5570-622b-b86f-c603d4c82981	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5570-622b-8df2-69e174433550	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5570-622b-b71d-926d0c13a2a3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5570-622b-4476-34a823b84ede	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5570-622b-7bbc-66a0baee3f01	CL	CHL	152	Chile 	Čile	\N
00040000-5570-622b-91e5-a8a0758480b3	CN	CHN	156	China 	Kitajska	\N
00040000-5570-622b-af14-929a6a0b4199	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5570-622b-d9b5-76bff45f79e1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5570-622b-a26b-744a14d3219d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5570-622b-650e-30f4e22bdb66	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5570-622b-f918-90fcc57912e4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5570-622b-c456-cf289680e9eb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5570-622b-085a-25d3d127672f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5570-622b-3310-e28ed96879b4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5570-622b-132b-9edf275fc57b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5570-622b-d73f-754c799ee6a6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5570-622b-4d75-21f713bcf0f4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5570-622b-e3f1-6005af316d19	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5570-622b-1a79-67ce157c3cef	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5570-622b-5152-db97e6018c32	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5570-622b-c3d3-8522b0c4d7f5	DK	DNK	208	Denmark 	Danska	\N
00040000-5570-622b-973b-30e91255c5db	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5570-622b-09ec-f0d30a63c8f2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5570-622b-2dc9-e1d7d8529124	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5570-622b-78e8-0d9e3febf62d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5570-622b-6a98-de10cd474f2c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5570-622b-58e1-9666042077df	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5570-622b-390f-093326b0fda3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5570-622b-f32d-1a50811826a4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5570-622b-2e07-6fa70d513b54	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5570-622b-f4da-aa293ec074fa	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5570-622b-8d64-a9a98a8420c0	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5570-622b-04f5-bb3c0942b26c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5570-622b-1118-487c3267102d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5570-622b-4808-24e4cd7266d9	FI	FIN	246	Finland 	Finska	\N
00040000-5570-622b-29ec-4c230aa751ae	FR	FRA	250	France 	Francija	\N
00040000-5570-622b-d8cd-ea0e81dd166a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5570-622b-7918-115cca1c8344	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5570-622b-25fa-60f1347bb513	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5570-622b-5eb5-2e647aabe7c1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5570-622b-cd00-dde86ac1a620	GA	GAB	266	Gabon 	Gabon	\N
00040000-5570-622b-cf56-425b05e2a5b6	GM	GMB	270	Gambia 	Gambija	\N
00040000-5570-622b-3eed-1c2b09a3e4e0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5570-622b-3a7d-585c16eef3c8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5570-622b-7bd9-d2b05dec7709	GH	GHA	288	Ghana 	Gana	\N
00040000-5570-622b-23e3-3e1ab84b7b95	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5570-622b-a67d-37a34285c196	GR	GRC	300	Greece 	Grčija	\N
00040000-5570-622b-1461-68fbc8b9f45c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5570-622b-3745-4117a81f157a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5570-622b-b256-96e638b8de97	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5570-622b-5447-81810364e4e7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5570-622b-0892-cefa8c728d9a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5570-622b-3d5c-3dc9a9189414	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5570-622b-e365-0a688ca484fa	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5570-622b-8fea-9f68cb5cdc00	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5570-622b-8c83-39d3674ff4c1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5570-622b-5daa-b115eb5a1b41	HT	HTI	332	Haiti 	Haiti	\N
00040000-5570-622b-73e9-b10990120b49	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5570-622b-5d3c-4d81605099ad	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5570-622b-c5a9-a6a7376b73c3	HN	HND	340	Honduras 	Honduras	\N
00040000-5570-622b-91bb-9626921bfd43	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5570-622b-fcb7-8c823803377b	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5570-622b-6b23-7efa43e5ad5c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5570-622b-7223-51b809d77f58	IN	IND	356	India 	Indija	\N
00040000-5570-622b-fb10-88d49aa3c4c1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5570-622b-7b11-3373b819ea61	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5570-622b-0d0c-095e0cf67f00	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5570-622b-7a35-6b50759004bc	IE	IRL	372	Ireland 	Irska	\N
00040000-5570-622b-91e9-036042293262	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5570-622b-3c30-84869d3984b9	IL	ISR	376	Israel 	Izrael	\N
00040000-5570-622b-bc00-27382f367d2b	IT	ITA	380	Italy 	Italija	\N
00040000-5570-622b-4486-f92ecd240367	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5570-622b-b736-5fe090fdf730	JP	JPN	392	Japan 	Japonska	\N
00040000-5570-622b-2b63-6a5eb6a77ba2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5570-622b-2e17-be4a825e2146	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5570-622b-c23a-6ab54980420f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5570-622b-5831-ad3814ae33af	KE	KEN	404	Kenya 	Kenija	\N
00040000-5570-622b-0ae9-4cf5fbd40480	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5570-622b-acc3-f0590f0d0862	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5570-622b-46f3-e720fe538f4f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5570-622b-f1be-7ae65ef5b2ee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5570-622b-06a3-817fc17134ce	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5570-622b-108b-871da195c3a6	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5570-622b-48dc-0362b35d30a7	LV	LVA	428	Latvia 	Latvija	\N
00040000-5570-622b-d503-292fbb3a2230	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5570-622b-9f3f-fc55f0e4aa8e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5570-622b-4605-8a41c2a83cfb	LR	LBR	430	Liberia 	Liberija	\N
00040000-5570-622b-f4fa-3e5d70f8c26d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5570-622b-66ad-1497768cf3d6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5570-622b-36b3-94c26c66de3a	LT	LTU	440	Lithuania 	Litva	\N
00040000-5570-622b-15c1-5c94064ae764	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5570-622b-f80b-cff144dcf0e7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5570-622b-3aa1-f6c0cef0f97a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5570-622b-e3fc-398c0fd45fda	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5570-622b-ae00-8d1a90ddb3c9	MW	MWI	454	Malawi 	Malavi	\N
00040000-5570-622b-e613-e03d89f65a06	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5570-622b-ca83-232b7578bbc7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5570-622b-70c4-7065f901d07b	ML	MLI	466	Mali 	Mali	\N
00040000-5570-622b-0261-4dd9113163eb	MT	MLT	470	Malta 	Malta	\N
00040000-5570-622b-ab3a-ddb323c2df78	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5570-622b-ae30-69b6c1a2cf32	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5570-622b-9556-7ed15a761ea4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5570-622b-eca5-d342e7a5c3df	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5570-622b-d9c5-23cab0b3442b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5570-622b-8226-5045a3420db6	MX	MEX	484	Mexico 	Mehika	\N
00040000-5570-622b-41ee-db496d9eae0f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5570-622b-554e-96e731222f10	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5570-622b-2ad8-521839d6d9f7	MC	MCO	492	Monaco 	Monako	\N
00040000-5570-622b-a4e3-5c76fdc0d807	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5570-622b-2010-7240f019f0ae	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5570-622b-2cdc-975ad6e831c5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5570-622b-4993-39d4a347961c	MA	MAR	504	Morocco 	Maroko	\N
00040000-5570-622b-5fe0-6205e1d2f90f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5570-622b-bb07-624affeb4f99	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5570-622b-736e-096c6f2169c3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5570-622b-5f88-f8c4217f8b24	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5570-622b-79f8-80bc4a15a878	NP	NPL	524	Nepal 	Nepal	\N
00040000-5570-622b-9161-f7935d434fb3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5570-622b-fa91-025448d4c210	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5570-622b-f479-340ce3a752c1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5570-622b-7e8f-468aedaab2ee	NE	NER	562	Niger 	Niger 	\N
00040000-5570-622b-be21-8e08882fdd2a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5570-622b-8876-00b05091e7c6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5570-622b-9a53-74d873c1c75f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5570-622b-de14-9774b03f54bd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5570-622b-7625-3750eb6c8945	NO	NOR	578	Norway 	Norveška	\N
00040000-5570-622b-aabb-d9e2ec80910d	OM	OMN	512	Oman 	Oman	\N
00040000-5570-622b-bf8e-3b8b55f32a85	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5570-622b-a5e9-acf1895348dd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5570-622b-6a74-282fe3da9059	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5570-622b-19a4-1c9146ebea5d	PA	PAN	591	Panama 	Panama	\N
00040000-5570-622b-c814-2073d82a1ae6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5570-622b-37e8-45a3d69d76ff	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5570-622b-cfa6-99dd5400ecca	PE	PER	604	Peru 	Peru	\N
00040000-5570-622b-4df0-3b1bfcb3db26	PH	PHL	608	Philippines 	Filipini	\N
00040000-5570-622b-0361-ed8c52072f1a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5570-622b-7f6f-37789114d255	PL	POL	616	Poland 	Poljska	\N
00040000-5570-622b-0fce-89aaab95beea	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5570-622b-8bea-940f37f4ae14	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5570-622b-d1d4-9f830dd9063d	QA	QAT	634	Qatar 	Katar	\N
00040000-5570-622b-cca4-836cd3e1b97e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5570-622b-b65c-2be72db595de	RO	ROU	642	Romania 	Romunija	\N
00040000-5570-622b-1bae-b90b36ba3b71	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5570-622b-33ec-7275fca7b620	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5570-622b-4b99-9e1b0d9ccd74	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5570-622b-c2e5-c9dbca087072	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5570-622b-3115-df590211c9a8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5570-622b-982a-a8adb8400413	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5570-622b-d281-7da1e0b34274	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5570-622b-4d66-781bbae7015a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5570-622b-c62f-7f309f21e02e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5570-622b-27bb-43e799fd495f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5570-622b-b1e5-ea2a1e9a5d63	SM	SMR	674	San Marino 	San Marino	\N
00040000-5570-622b-3258-026a035910f4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5570-622b-9a50-6df91dbc2ff9	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5570-622b-17eb-eb385fec0f16	SN	SEN	686	Senegal 	Senegal	\N
00040000-5570-622b-4067-a86344a5499e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5570-622b-373c-d3ddd7693a9d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5570-622b-20ec-e855444ea5d6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5570-622b-a506-caf87caa9eac	SG	SGP	702	Singapore 	Singapur	\N
00040000-5570-622b-18c5-2fad1903942c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5570-622b-12d7-da76430348d7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5570-622b-a464-3ba6133841ca	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5570-622b-2012-2a9b7ce9601a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5570-622b-8f47-5de81792a383	SO	SOM	706	Somalia 	Somalija	\N
00040000-5570-622b-bc58-6681d263955c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5570-622b-df85-3c5e097a0ca1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5570-622b-cd35-218aa71439d3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5570-622b-a0b1-08e4dd236364	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5570-622b-3624-4ce982b381e7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5570-622b-6ce3-ffd28e1324d6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5570-622b-df9e-557027daf854	SR	SUR	740	Suriname 	Surinam	\N
00040000-5570-622b-870d-9030811f9b59	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5570-622b-6ee5-227654bdf56a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5570-622b-e962-57e2ef0a8cdc	SE	SWE	752	Sweden 	Švedska	\N
00040000-5570-622b-bfb5-aff826cd2f0b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5570-622b-9f87-19f8d19919fc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5570-622b-8b15-e96e2141c232	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5570-622b-2777-21ed32ae19a3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5570-622b-d125-8a77291b0156	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5570-622b-6aae-ffd9b496b310	TH	THA	764	Thailand 	Tajska	\N
00040000-5570-622b-8eee-8ccfa707eead	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5570-622b-212a-ee3c7b891c1f	TG	TGO	768	Togo 	Togo	\N
00040000-5570-622b-e9ff-09b8b89f5dbf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5570-622b-6d5b-305b3163256f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5570-622b-abbc-c683633dbf5b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5570-622b-1e82-a315515ed2ce	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5570-622b-52bf-dbaa2045ebe3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5570-622b-1849-9b72db62e807	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5570-622b-fa95-bdbfc348fc1a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5570-622b-3831-c83b8f6c0023	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5570-622b-eb41-a4a349177f34	UG	UGA	800	Uganda 	Uganda	\N
00040000-5570-622b-0249-817ef673f024	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5570-622b-fe4c-44c44b64e168	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5570-622b-2186-40cd1337a040	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5570-622b-384c-3674ed1a3e8f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5570-622b-bcbd-0596a2dc515a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5570-622b-6be7-0d905775f6e6	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5570-622b-d233-6b499cc08661	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5570-622b-64a3-59d23d967452	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5570-622b-0ec4-e998c130073a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5570-622b-5218-516c7d594b5a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5570-622b-e356-7e231bdb9518	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5570-622b-5f02-5674b8f62990	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5570-622b-39ab-ec11cbb8c511	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5570-622b-d1b4-a6e165af72dd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5570-622b-a910-4269352a7f71	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5570-622b-25ca-9e5ef01d9b50	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5570-622b-91bf-94dd5860d251	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2834 (class 0 OID 6306324)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6306126)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5570-622c-5962-a6cdc96d8857	000e0000-5570-622c-1d53-dd3e622c72ec	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5570-622b-3da4-c36227895794
000d0000-5570-622c-c4c7-84ecd7354d69	000e0000-5570-622c-1d53-dd3e622c72ec	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5570-622b-3da4-c36227895794
000d0000-5570-622c-0aa1-b24b4ecfb96c	000e0000-5570-622c-1d53-dd3e622c72ec	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5570-622b-3817-45323b7d564e
000d0000-5570-622c-f492-b30978fbefab	000e0000-5570-622c-1d53-dd3e622c72ec	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5570-622b-50a3-598528d477f4
000d0000-5570-622c-205b-27d232d21700	000e0000-5570-622c-1d53-dd3e622c72ec	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5570-622b-50a3-598528d477f4
000d0000-5570-622c-95e7-b760ae88950b	000e0000-5570-622c-1d53-dd3e622c72ec	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5570-622b-50a3-598528d477f4
000d0000-5570-622c-2619-40d30ed17cbc	000e0000-5570-622c-1d53-dd3e622c72ec	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5570-622b-3da4-c36227895794
\.


--
-- TOC entry 2798 (class 0 OID 6305946)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6305994)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6305926)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00000000-5570-622c-cef9-4e88cd1324a6	00080000-5570-622c-6ce6-9410a00f0b49	00090000-5570-622c-49b7-e5443fa98cfc	AK		
\.


--
-- TOC entry 2776 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6306043)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6306068)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6305883)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5570-622b-bbc5-31e5fa823126	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5570-622b-a177-0ffaf122fb8e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5570-622b-f6bd-b22ced636d46	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5570-622b-4a11-df07011afc04	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5570-622b-c4a6-362bb9e5f2da	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5570-622b-9737-713b09b32702	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5570-622c-3734-53c39199bf5a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5570-622c-a089-272c2b723180	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5570-622c-49b7-cc439f208518	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5570-622c-31a4-c9dc9cdeafc4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5570-622c-fcc4-bf2f32768cb9	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5570-622c-58d9-baf83d113d11	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5570-622c-d2ea-00626059c7d7	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5570-622c-5b7f-fe6dae36e52a	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5570-622c-a7af-7dca504272b6	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5570-622c-85a5-3d3deb30f563	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2787 (class 0 OID 6305796)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5570-622b-2a17-31b1e3ad1a9e	00000000-5570-622b-c4a6-362bb9e5f2da	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5570-622b-bf55-d32693d1aad8	00000000-5570-622b-c4a6-362bb9e5f2da	00010000-5570-622b-fc2f-22f79fb8ef2a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5570-622c-81cc-052538c3cbbc	00000000-5570-622b-9737-713b09b32702	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2788 (class 0 OID 6305807)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5570-622c-4134-0afdb4abf697	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5570-622c-7e40-4fbc2917814c	00010000-5570-622c-a588-775b3cdbe050	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5570-622c-f2e8-a1947711b551	00010000-5570-622c-1340-aa6bdb1c81f4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5570-622c-3567-5f80aa5d0cd1	00010000-5570-622c-c3cc-1e80237f2601	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5570-622c-c44a-4624be79f97d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5570-622c-3397-53557e460d74	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5570-622c-ba7c-88d70aa52da0	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5570-622c-9c3a-1c7f90f03db2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5570-622c-49b7-e5443fa98cfc	00010000-5570-622c-e9b3-601676c50db9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5570-622c-ff0a-61b8b1f8c9a2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5570-622c-42fe-e5b7d7455fab	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5570-622c-1c93-bec7867449b5	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5570-622c-b40b-85ded3e2cc4a	00010000-5570-622c-ecff-53fa4fc9cd20	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2778 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6305761)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5570-622b-d404-5ef0e615516f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5570-622b-5472-1edaacecd4a0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5570-622b-188c-ce96ab5e038b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5570-622b-8683-a04b670e6854	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5570-622b-8e9a-870aedae65d7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5570-622b-c657-d9a98004ab7f	Abonma-read	Abonma - branje	f
00030000-5570-622b-7fdc-e8b53fac8141	Abonma-write	Abonma - spreminjanje	f
00030000-5570-622b-ceab-532ffab7a54e	Alternacija-read	Alternacija - branje	f
00030000-5570-622b-ef76-dac8193f0c1a	Alternacija-write	Alternacija - spreminjanje	f
00030000-5570-622b-d815-6767a804ca1b	Arhivalija-read	Arhivalija - branje	f
00030000-5570-622b-fae6-0416d5908dcf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5570-622b-283d-a6e1630ed20f	Besedilo-read	Besedilo - branje	f
00030000-5570-622b-ba56-40d8767bccfb	Besedilo-write	Besedilo - spreminjanje	f
00030000-5570-622b-5ada-6e55a3280194	DogodekIzven-read	DogodekIzven - branje	f
00030000-5570-622b-471d-8c2a3dc6f468	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5570-622b-d35a-ea414d156443	Dogodek-read	Dogodek - branje	f
00030000-5570-622b-7f51-8f83fb282d65	Dogodek-write	Dogodek - spreminjanje	f
00030000-5570-622b-7a50-7c4775eed70b	Drzava-read	Drzava - branje	f
00030000-5570-622b-9512-f82664230557	Drzava-write	Drzava - spreminjanje	f
00030000-5570-622b-3200-761dff5ea0ea	Funkcija-read	Funkcija - branje	f
00030000-5570-622b-9064-a75213204390	Funkcija-write	Funkcija - spreminjanje	f
00030000-5570-622b-3c2c-74dfb77cd35a	Gostovanje-read	Gostovanje - branje	f
00030000-5570-622b-f901-79d220928b78	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5570-622b-79fc-c516d815c346	Gostujoca-read	Gostujoca - branje	f
00030000-5570-622b-4686-cc00952748de	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5570-622b-5e9a-ed1675d51bec	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5570-622b-2c57-7d874e62415b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5570-622b-670e-35b117f2b4fc	Kupec-read	Kupec - branje	f
00030000-5570-622b-3d8b-ad6c29c2f0ee	Kupec-write	Kupec - spreminjanje	f
00030000-5570-622b-9db1-299e930d5042	NacinPlacina-read	NacinPlacina - branje	f
00030000-5570-622b-f1d6-bae37bbb48c5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5570-622b-c298-8dff1a8ca6b7	Option-read	Option - branje	f
00030000-5570-622b-e036-809b2e5c40d0	Option-write	Option - spreminjanje	f
00030000-5570-622b-fc19-bd2f8d38b141	OptionValue-read	OptionValue - branje	f
00030000-5570-622b-f813-92005c684c62	OptionValue-write	OptionValue - spreminjanje	f
00030000-5570-622b-4884-a1fd881f3b1c	Oseba-read	Oseba - branje	f
00030000-5570-622b-eb10-a7bdb1e31f48	Oseba-write	Oseba - spreminjanje	f
00030000-5570-622b-5d2b-7db279ae09c8	Permission-read	Permission - branje	f
00030000-5570-622b-4668-d68e4028dafb	Permission-write	Permission - spreminjanje	f
00030000-5570-622b-2273-edb2a488f4f2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5570-622b-e7fe-819fa3d8fd14	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5570-622b-d4dc-c2e23b02649d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5570-622b-5cff-e06edc00f805	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5570-622b-c27b-f0067670323c	Pogodba-read	Pogodba - branje	f
00030000-5570-622b-0546-d855b6e4c539	Pogodba-write	Pogodba - spreminjanje	f
00030000-5570-622b-ce31-37f5b1d7ec5b	Popa-read	Popa - branje	f
00030000-5570-622b-7715-210a99cc0e62	Popa-write	Popa - spreminjanje	f
00030000-5570-622b-dded-cf24eb1446d1	Posta-read	Posta - branje	f
00030000-5570-622b-acbf-0891545d0ece	Posta-write	Posta - spreminjanje	f
00030000-5570-622b-bb64-cacae323ab3a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5570-622b-da94-0f9aeaa6b082	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5570-622b-0503-8bd87a7d0732	PostniNaslov-read	PostniNaslov - branje	f
00030000-5570-622b-d1e2-8c1a68962419	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5570-622b-afd7-6b007907adcb	Predstava-read	Predstava - branje	f
00030000-5570-622b-9f20-a9a0f1e321bd	Predstava-write	Predstava - spreminjanje	f
00030000-5570-622b-6f71-1be6f459a5bc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5570-622b-76e5-ba60d8fda01a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5570-622b-d706-986a703de1bf	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5570-622b-d80e-b90f548bd1fb	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5570-622b-0a75-2f4a9faf6596	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5570-622b-364f-c13579f5918b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5570-622b-feaa-2754aecceef1	Prostor-read	Prostor - branje	f
00030000-5570-622b-3b7e-8deacae61cde	Prostor-write	Prostor - spreminjanje	f
00030000-5570-622b-4c1b-d4e4dc6ac69e	Racun-read	Racun - branje	f
00030000-5570-622b-0e35-c7e78df57f9a	Racun-write	Racun - spreminjanje	f
00030000-5570-622b-3ff0-cb24e59e70f6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5570-622b-1e08-c1a1457e0dce	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5570-622b-284c-0d68cfa09778	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5570-622b-548d-f737cb362e5c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5570-622b-f0f8-1690bf592011	Rekvizit-read	Rekvizit - branje	f
00030000-5570-622b-2ff9-e2293379533a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5570-622b-7bb4-8f6ec15cf6d4	Revizija-read	Revizija - branje	f
00030000-5570-622b-e630-ad4e80dcefbf	Revizija-write	Revizija - spreminjanje	f
00030000-5570-622b-0632-028a12bd34cb	Rezervacija-read	Rezervacija - branje	f
00030000-5570-622b-70dd-3ac82a4c39c8	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5570-622b-f14a-9044376679cd	Role-read	Role - branje	f
00030000-5570-622b-868b-d65e07e45700	Role-write	Role - spreminjanje	f
00030000-5570-622b-96a0-182df30e0251	SedezniRed-read	SedezniRed - branje	f
00030000-5570-622b-e653-d3ff911673cc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5570-622b-38f1-ec5f6416b885	Sedez-read	Sedez - branje	f
00030000-5570-622b-2dfd-bc45af95b22d	Sedez-write	Sedez - spreminjanje	f
00030000-5570-622b-77ac-8b2f641bbc51	Sezona-read	Sezona - branje	f
00030000-5570-622b-1f5f-46161c81d3dc	Sezona-write	Sezona - spreminjanje	f
00030000-5570-622b-9a44-1ef3742eaf3a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5570-622b-81de-fd3ae6f23dcb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5570-622b-e5b0-062d90e9e2d6	Stevilcenje-read	Stevilcenje - branje	f
00030000-5570-622b-42cc-4ba05a180060	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5570-622b-aacc-2ff0fb06110b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5570-622b-8385-a336d8c57c41	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5570-622b-6382-44ebac2bb511	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5570-622b-10b2-2ed30370b5dc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5570-622b-eaa2-22df060f10d8	Telefonska-read	Telefonska - branje	f
00030000-5570-622b-2ca1-1d7da53f2a3b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5570-622b-58cf-8039ae18d500	TerminStoritve-read	TerminStoritve - branje	f
00030000-5570-622b-73ca-8b60e146edb0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5570-622b-c0a3-067e2ce32317	TipFunkcije-read	TipFunkcije - branje	f
00030000-5570-622b-d722-7a766fe50c4d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5570-622b-1f8b-2c47942c8064	Trr-read	Trr - branje	f
00030000-5570-622b-e3b1-e760ff776d6d	Trr-write	Trr - spreminjanje	f
00030000-5570-622b-ea43-515cd59bdc4d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5570-622b-d870-c716ec9681f5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5570-622b-41c3-6d1fae3e7bc4	User-read	User - branje	f
00030000-5570-622b-1e1d-bd1fd2a05aa7	User-write	User - spreminjanje	f
00030000-5570-622b-cc22-9d6a45c84e67	Vaja-read	Vaja - branje	f
00030000-5570-622b-a256-02c5fe371d9b	Vaja-write	Vaja - spreminjanje	f
00030000-5570-622b-561e-0567ef4046da	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5570-622b-5acb-0db2200c11aa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5570-622b-a92a-d72fcb4f1fdf	Zaposlitev-read	Zaposlitev - branje	f
00030000-5570-622b-9f8c-e0afb4257541	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5570-622b-c5bb-a4d785f69ee2	Zasedenost-read	Zasedenost - branje	f
00030000-5570-622b-fe67-730a56f6501a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5570-622b-a896-e1fae5fe22fb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5570-622b-9b91-dc5a2af5f234	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5570-622b-2794-490a2b3a40e3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5570-622b-1e65-06ba9d816093	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2785 (class 0 OID 6305780)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5570-622b-328f-2158c102a125	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-c657-d9a98004ab7f
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-7fdc-e8b53fac8141
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-ceab-532ffab7a54e
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-ef76-dac8193f0c1a
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-d815-6767a804ca1b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-d35a-ea414d156443
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-8683-a04b670e6854
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-7f51-8f83fb282d65
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-9512-f82664230557
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-3200-761dff5ea0ea
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-9064-a75213204390
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-3c2c-74dfb77cd35a
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-f901-79d220928b78
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-79fc-c516d815c346
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-4686-cc00952748de
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-5e9a-ed1675d51bec
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-2c57-7d874e62415b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-c298-8dff1a8ca6b7
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-fc19-bd2f8d38b141
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-4884-a1fd881f3b1c
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-eb10-a7bdb1e31f48
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-ce31-37f5b1d7ec5b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-7715-210a99cc0e62
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-dded-cf24eb1446d1
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-acbf-0891545d0ece
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-0503-8bd87a7d0732
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-d1e2-8c1a68962419
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-afd7-6b007907adcb
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-9f20-a9a0f1e321bd
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-0a75-2f4a9faf6596
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-364f-c13579f5918b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-feaa-2754aecceef1
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-3b7e-8deacae61cde
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-284c-0d68cfa09778
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-548d-f737cb362e5c
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-f0f8-1690bf592011
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-2ff9-e2293379533a
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-77ac-8b2f641bbc51
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-1f5f-46161c81d3dc
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-c0a3-067e2ce32317
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-ea43-515cd59bdc4d
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-d870-c716ec9681f5
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-cc22-9d6a45c84e67
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-a256-02c5fe371d9b
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-c5bb-a4d785f69ee2
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-fe67-730a56f6501a
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-a896-e1fae5fe22fb
00020000-5570-622b-c8b5-b01a39c2705b	00030000-5570-622b-2794-490a2b3a40e3
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-c657-d9a98004ab7f
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-d815-6767a804ca1b
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-d35a-ea414d156443
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-3c2c-74dfb77cd35a
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-79fc-c516d815c346
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-5e9a-ed1675d51bec
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-2c57-7d874e62415b
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-c298-8dff1a8ca6b7
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-fc19-bd2f8d38b141
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-4884-a1fd881f3b1c
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-eb10-a7bdb1e31f48
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-ce31-37f5b1d7ec5b
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-dded-cf24eb1446d1
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-0503-8bd87a7d0732
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-d1e2-8c1a68962419
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-afd7-6b007907adcb
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-feaa-2754aecceef1
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-284c-0d68cfa09778
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-f0f8-1690bf592011
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-77ac-8b2f641bbc51
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-eaa2-22df060f10d8
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-2ca1-1d7da53f2a3b
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-1f8b-2c47942c8064
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-e3b1-e760ff776d6d
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-a92a-d72fcb4f1fdf
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-9f8c-e0afb4257541
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-a896-e1fae5fe22fb
00020000-5570-622b-b8f9-db4b3f62d1bc	00030000-5570-622b-2794-490a2b3a40e3
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-c657-d9a98004ab7f
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-ceab-532ffab7a54e
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-d815-6767a804ca1b
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-fae6-0416d5908dcf
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-283d-a6e1630ed20f
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-5ada-6e55a3280194
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-d35a-ea414d156443
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-3200-761dff5ea0ea
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-3c2c-74dfb77cd35a
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-79fc-c516d815c346
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-5e9a-ed1675d51bec
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-c298-8dff1a8ca6b7
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-fc19-bd2f8d38b141
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-4884-a1fd881f3b1c
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-ce31-37f5b1d7ec5b
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-dded-cf24eb1446d1
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-afd7-6b007907adcb
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-0a75-2f4a9faf6596
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-feaa-2754aecceef1
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-284c-0d68cfa09778
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-f0f8-1690bf592011
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-77ac-8b2f641bbc51
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-c0a3-067e2ce32317
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-cc22-9d6a45c84e67
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-c5bb-a4d785f69ee2
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-a896-e1fae5fe22fb
00020000-5570-622b-70a3-c7348460dcca	00030000-5570-622b-2794-490a2b3a40e3
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-c657-d9a98004ab7f
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-7fdc-e8b53fac8141
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-ef76-dac8193f0c1a
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-d815-6767a804ca1b
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-d35a-ea414d156443
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-3c2c-74dfb77cd35a
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-79fc-c516d815c346
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-c298-8dff1a8ca6b7
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-fc19-bd2f8d38b141
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-ce31-37f5b1d7ec5b
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-dded-cf24eb1446d1
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-afd7-6b007907adcb
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-feaa-2754aecceef1
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-284c-0d68cfa09778
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-f0f8-1690bf592011
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-77ac-8b2f641bbc51
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-c0a3-067e2ce32317
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-a896-e1fae5fe22fb
00020000-5570-622b-b314-06e7c26364c8	00030000-5570-622b-2794-490a2b3a40e3
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-c657-d9a98004ab7f
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-d815-6767a804ca1b
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-d35a-ea414d156443
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-7a50-7c4775eed70b
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-3c2c-74dfb77cd35a
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-79fc-c516d815c346
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-c298-8dff1a8ca6b7
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-fc19-bd2f8d38b141
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-ce31-37f5b1d7ec5b
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-dded-cf24eb1446d1
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-afd7-6b007907adcb
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-feaa-2754aecceef1
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-284c-0d68cfa09778
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-f0f8-1690bf592011
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-77ac-8b2f641bbc51
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-58cf-8039ae18d500
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-188c-ce96ab5e038b
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-c0a3-067e2ce32317
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-a896-e1fae5fe22fb
00020000-5570-622b-4749-d5e278e6704e	00030000-5570-622b-2794-490a2b3a40e3
\.


--
-- TOC entry 2813 (class 0 OID 6306075)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6306106)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6306244)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6305840)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5570-622c-6ce6-9410a00f0b49	00040000-5570-622b-bfac-84730cf13bd7	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-622c-873f-a9c7d2fdb4e1	00040000-5570-622b-bfac-84730cf13bd7	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-622c-1f6b-9d050fbdf7d9	00040000-5570-622b-bfac-84730cf13bd7	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-622c-1b39-fd4dd0af82c9	00040000-5570-622b-bfac-84730cf13bd7	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2792 (class 0 OID 6305875)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5570-622b-c591-ecc82e27a7f6	8341	Adlešiči
00050000-5570-622b-a35b-949eb6aecdbf	5270	Ajdovščina
00050000-5570-622b-d382-9c32fc998a59	6280	Ankaran/Ancarano
00050000-5570-622b-cfbb-8ec8bd76e245	9253	Apače
00050000-5570-622b-c963-404f9b09f1cc	8253	Artiče
00050000-5570-622b-9e2c-a674f1b773a4	4275	Begunje na Gorenjskem
00050000-5570-622b-205f-2a2223f92df9	1382	Begunje pri Cerknici
00050000-5570-622b-2e77-1d5819533bdf	9231	Beltinci
00050000-5570-622b-c0f6-52cd3be9e330	2234	Benedikt
00050000-5570-622b-8078-7a4d01fbba05	2345	Bistrica ob Dravi
00050000-5570-622b-e639-244a2a6ed204	3256	Bistrica ob Sotli
00050000-5570-622b-88ed-616b1d00d4df	8259	Bizeljsko
00050000-5570-622b-125f-8eaa2108c4bc	1223	Blagovica
00050000-5570-622b-276e-821cbf725a33	8283	Blanca
00050000-5570-622b-2d62-5586ea6c8eca	4260	Bled
00050000-5570-622b-394e-55368c853815	4273	Blejska Dobrava
00050000-5570-622b-93b3-957e18eada12	9265	Bodonci
00050000-5570-622b-acab-625d75e7d6e3	9222	Bogojina
00050000-5570-622b-acf3-8aef23ff4054	4263	Bohinjska Bela
00050000-5570-622b-bab5-9922b0411391	4264	Bohinjska Bistrica
00050000-5570-622b-a7eb-7f82d0378101	4265	Bohinjsko jezero
00050000-5570-622b-e553-77e081673767	1353	Borovnica
00050000-5570-622b-ab75-0308d41fd6a9	8294	Boštanj
00050000-5570-622b-a7ad-9585b80f81fe	5230	Bovec
00050000-5570-622b-f894-08470a4d0f0b	5295	Branik
00050000-5570-622b-8c9c-f9aa417dc540	3314	Braslovče
00050000-5570-622b-0f18-7ade011b7f34	5223	Breginj
00050000-5570-622b-3edb-7299d79c1c91	8280	Brestanica
00050000-5570-622b-34ba-c1abdf62f760	2354	Bresternica
00050000-5570-622b-1525-87b105f21b61	4243	Brezje
00050000-5570-622b-a8f9-f9b0468ae7af	1351	Brezovica pri Ljubljani
00050000-5570-622b-84bb-22dd844a28d6	8250	Brežice
00050000-5570-622b-8ff8-c7d6538e5379	4210	Brnik - Aerodrom
00050000-5570-622b-f156-e3001adae395	8321	Brusnice
00050000-5570-622b-8626-f808956ba340	3255	Buče
00050000-5570-622b-8e04-027bb4e7c784	8276	Bučka 
00050000-5570-622b-6bb4-b0a8783406df	9261	Cankova
00050000-5570-622b-d8f2-e8eeb768a009	3000	Celje 
00050000-5570-622b-0018-49bdca659cbc	3001	Celje - poštni predali
00050000-5570-622b-16b4-3f2f9d3b387d	4207	Cerklje na Gorenjskem
00050000-5570-622b-1d4a-aa770247cb19	8263	Cerklje ob Krki
00050000-5570-622b-0446-193512293199	1380	Cerknica
00050000-5570-622b-826a-048b9d96c2c2	5282	Cerkno
00050000-5570-622b-018b-cb2d5fefb9f8	2236	Cerkvenjak
00050000-5570-622b-d697-659cfa1b7252	2215	Ceršak
00050000-5570-622b-7d57-b8f66e360ebe	2326	Cirkovce
00050000-5570-622b-4e5a-fa0bf6d33b5c	2282	Cirkulane
00050000-5570-622b-e2c2-b2626d925786	5273	Col
00050000-5570-622b-cb1d-3e4e641c32b8	8251	Čatež ob Savi
00050000-5570-622b-dc46-65298cff2247	1413	Čemšenik
00050000-5570-622b-706c-a6523b4718ba	5253	Čepovan
00050000-5570-622b-7718-d8351ba1f9c8	9232	Črenšovci
00050000-5570-622b-990e-d09dd0f5eca3	2393	Črna na Koroškem
00050000-5570-622b-d86a-bdb2daf54ec0	6275	Črni Kal
00050000-5570-622b-6b8a-026ee3720a2e	5274	Črni Vrh nad Idrijo
00050000-5570-622b-f185-f18834d54849	5262	Črniče
00050000-5570-622b-a518-fce8798a6622	8340	Črnomelj
00050000-5570-622b-75f8-9ccba881e260	6271	Dekani
00050000-5570-622b-54fa-d8e08c313536	5210	Deskle
00050000-5570-622b-9974-99e653db3131	2253	Destrnik
00050000-5570-622b-2949-72fbefc5c2b6	6215	Divača
00050000-5570-622b-e5f6-8d83c2e71df3	1233	Dob
00050000-5570-622b-4980-0a71a4e4beae	3224	Dobje pri Planini
00050000-5570-622b-cf28-74050eb04657	8257	Dobova
00050000-5570-622b-03c1-35a3ec0bb5a4	1423	Dobovec
00050000-5570-622b-409a-c1d0383f66ad	5263	Dobravlje
00050000-5570-622b-cbb1-85deacc2d070	3204	Dobrna
00050000-5570-622b-d9af-0a0031d3a6a4	8211	Dobrnič
00050000-5570-622b-203c-4cbbd8dcb276	1356	Dobrova
00050000-5570-622b-c975-28d56fa89f4d	9223	Dobrovnik/Dobronak 
00050000-5570-622b-c9c3-51eee797f80f	5212	Dobrovo v Brdih
00050000-5570-622b-7af2-ce344c012b8d	1431	Dol pri Hrastniku
00050000-5570-622b-4291-ef5ec925e7f9	1262	Dol pri Ljubljani
00050000-5570-622b-47cf-88c4e017e4ba	1273	Dole pri Litiji
00050000-5570-622b-fcf0-ada392b7f96a	1331	Dolenja vas
00050000-5570-622b-669d-d0492d726cdf	8350	Dolenjske Toplice
00050000-5570-622b-53d8-284c670ed05e	1230	Domžale
00050000-5570-622b-c995-8b4bbb2c279f	2252	Dornava
00050000-5570-622b-1a69-bcf3dce99ae0	5294	Dornberk
00050000-5570-622b-0838-7ab17afdd35b	1319	Draga
00050000-5570-622b-f557-7eec914c7a9f	8343	Dragatuš
00050000-5570-622b-e257-8f1f5931bf00	3222	Dramlje
00050000-5570-622b-a1cc-9fbc9a67cdbd	2370	Dravograd
00050000-5570-622b-324c-a38163999cd3	4203	Duplje
00050000-5570-622b-3511-b3ccacd839dd	6221	Dutovlje
00050000-5570-622b-be64-cc0fd94e25a1	8361	Dvor
00050000-5570-622b-05d4-0ec72bd4075c	2343	Fala
00050000-5570-622b-fa8d-b2d9a2ced6c4	9208	Fokovci
00050000-5570-622b-6f49-0a4f3725f0c5	2313	Fram
00050000-5570-622b-6160-f66c41eedb94	3213	Frankolovo
00050000-5570-622b-88f0-6a0ca2b5ff97	1274	Gabrovka
00050000-5570-622b-4e03-1adc3ad26da0	8254	Globoko
00050000-5570-622b-2911-a85b509f938c	5275	Godovič
00050000-5570-622b-b9fa-8679db42418c	4204	Golnik
00050000-5570-622b-c500-d747580340d9	3303	Gomilsko
00050000-5570-622b-5a62-be0e1ca3e417	4224	Gorenja vas
00050000-5570-622b-bb63-e080226deda8	3263	Gorica pri Slivnici
00050000-5570-622b-b062-26f0fb732a96	2272	Gorišnica
00050000-5570-622b-0d61-e89e45a13b8e	9250	Gornja Radgona
00050000-5570-622b-d041-3f62a68cab15	3342	Gornji Grad
00050000-5570-622b-4013-6356e875500f	4282	Gozd Martuljek
00050000-5570-622b-6274-f5148cab817a	6272	Gračišče
00050000-5570-622b-84f6-7a7bdfa8e228	9264	Grad
00050000-5570-622b-2bd1-94eb2206f167	8332	Gradac
00050000-5570-622b-84b3-73b9d616f1a7	1384	Grahovo
00050000-5570-622b-68e9-1a4c774cfbee	5242	Grahovo ob Bači
00050000-5570-622b-b627-ddb688b28dc3	5251	Grgar
00050000-5570-622b-d288-024930eba802	3302	Griže
00050000-5570-622b-34fe-a32d05e50c9e	3231	Grobelno
00050000-5570-622b-a980-21173050c3c4	1290	Grosuplje
00050000-5570-622b-87da-6ebc658670e2	2288	Hajdina
00050000-5570-622b-556d-2b6bbdee4fb1	8362	Hinje
00050000-5570-622b-c14f-7471835e5f3e	2311	Hoče
00050000-5570-622b-d871-1e8d646371d1	9205	Hodoš/Hodos
00050000-5570-622b-a7fc-592d78797e6f	1354	Horjul
00050000-5570-622b-d24a-74885f09c583	1372	Hotedršica
00050000-5570-622b-68b3-f554eef35e55	1430	Hrastnik
00050000-5570-622b-6c5c-d199a47cc1b4	6225	Hruševje
00050000-5570-622b-375b-639207767889	4276	Hrušica
00050000-5570-622b-07eb-be822ac17d83	5280	Idrija
00050000-5570-622b-5ca9-2d764b9db564	1292	Ig
00050000-5570-622b-d05c-277aaf770a8a	6250	Ilirska Bistrica
00050000-5570-622b-1610-efca9961e253	6251	Ilirska Bistrica-Trnovo
00050000-5570-622b-9699-c73de1f26946	1295	Ivančna Gorica
00050000-5570-622b-b7e3-a05db8fc3188	2259	Ivanjkovci
00050000-5570-622b-10f5-0d11be4c636a	1411	Izlake
00050000-5570-622b-9478-ee4cb621b182	6310	Izola/Isola
00050000-5570-622b-6a13-117dd658a57b	2222	Jakobski Dol
00050000-5570-622b-4239-f93ef8922ab4	2221	Jarenina
00050000-5570-622b-a8ad-866a1a66e9fc	6254	Jelšane
00050000-5570-622b-cc22-0a95704f17e2	4270	Jesenice
00050000-5570-622b-a784-f4150e39597a	8261	Jesenice na Dolenjskem
00050000-5570-622b-5c68-5bf76d3f92e0	3273	Jurklošter
00050000-5570-622b-d027-e08d59b89263	2223	Jurovski Dol
00050000-5570-622b-cb9a-2cd99726de6e	2256	Juršinci
00050000-5570-622b-a620-31bab1df480d	5214	Kal nad Kanalom
00050000-5570-622b-03ec-4a635421373c	3233	Kalobje
00050000-5570-622b-df0e-92408047a862	4246	Kamna Gorica
00050000-5570-622b-847d-4092589adc00	2351	Kamnica
00050000-5570-622b-20c7-764c52f8108f	1241	Kamnik
00050000-5570-622b-3a10-2c047b2bfbc1	5213	Kanal
00050000-5570-622b-cfb4-99728e06aa9f	8258	Kapele
00050000-5570-622b-f16a-f4e8105583b9	2362	Kapla
00050000-5570-622b-770e-3cb9535ef7fa	2325	Kidričevo
00050000-5570-622b-afab-d4510c76160d	1412	Kisovec
00050000-5570-622b-a9f6-b47d3ab4973b	6253	Knežak
00050000-5570-622b-4022-da9903a32dec	5222	Kobarid
00050000-5570-622b-5db7-9dc457fa5708	9227	Kobilje
00050000-5570-622b-e12a-9d48433d38d5	1330	Kočevje
00050000-5570-622b-31bf-7e7d534be7e3	1338	Kočevska Reka
00050000-5570-622b-3311-1b4680777ce2	2276	Kog
00050000-5570-622b-8e44-be8b297e248a	5211	Kojsko
00050000-5570-622b-b3c9-a35e670f9ea6	6223	Komen
00050000-5570-622b-b215-4eee164e061d	1218	Komenda
00050000-5570-622b-6c6b-b85b82044692	6000	Koper/Capodistria 
00050000-5570-622b-d01c-702b1cfe5fb6	6001	Koper/Capodistria - poštni predali
00050000-5570-622b-7ac9-c3cc211cbd04	8282	Koprivnica
00050000-5570-622b-eaa1-6d1c2479ae62	5296	Kostanjevica na Krasu
00050000-5570-622b-fb5f-bf799266cf18	8311	Kostanjevica na Krki
00050000-5570-622b-799e-add0aed4f25c	1336	Kostel
00050000-5570-622b-31db-a5f31002f139	6256	Košana
00050000-5570-622b-3e39-a243aa0c29f4	2394	Kotlje
00050000-5570-622b-31d8-817911622bf8	6240	Kozina
00050000-5570-622b-5867-1dde03887b00	3260	Kozje
00050000-5570-622b-72e4-130f85c97caf	4000	Kranj 
00050000-5570-622b-6e98-96ff9986897c	4001	Kranj - poštni predali
00050000-5570-622b-21de-ad9627c9bc5e	4280	Kranjska Gora
00050000-5570-622b-2302-1843ccf08dae	1281	Kresnice
00050000-5570-622b-0e66-e77ee5a33038	4294	Križe
00050000-5570-622b-d1b2-0713203ca905	9206	Križevci
00050000-5570-622b-7bff-51534605aef0	9242	Križevci pri Ljutomeru
00050000-5570-622b-9c10-56b20aaaea2d	1301	Krka
00050000-5570-622b-4703-714374a9f94c	8296	Krmelj
00050000-5570-622b-4668-1b1d4e100442	4245	Kropa
00050000-5570-622b-8b5a-470dadc47b15	8262	Krška vas
00050000-5570-622b-915f-ebe07f9a07e2	8270	Krško
00050000-5570-622b-6f29-f8833254aacb	9263	Kuzma
00050000-5570-622b-4cdf-44acc9007d66	2318	Laporje
00050000-5570-622b-7350-1e4482cd1af3	3270	Laško
00050000-5570-622b-69d8-02c5e88c2108	1219	Laze v Tuhinju
00050000-5570-622b-aba6-b73271b68021	2230	Lenart v Slovenskih goricah
00050000-5570-622b-91b7-f0cf633d6ae4	9220	Lendava/Lendva
00050000-5570-622b-bc28-2dddaff170ac	4248	Lesce
00050000-5570-622b-a25f-403ba7d6bdae	3261	Lesično
00050000-5570-622b-52e3-625daf803ea8	8273	Leskovec pri Krškem
00050000-5570-622b-bdb4-e39b78325893	2372	Libeliče
00050000-5570-622b-2d63-023875566fb5	2341	Limbuš
00050000-5570-622b-195c-bd7174a5cb61	1270	Litija
00050000-5570-622b-e8d0-cbda78d59f5f	3202	Ljubečna
00050000-5570-622b-a0f8-e54b767059fa	1000	Ljubljana 
00050000-5570-622b-3391-753ce06ea7f9	1001	Ljubljana - poštni predali
00050000-5570-622b-0a46-d06f3f673f53	1231	Ljubljana - Črnuče
00050000-5570-622b-9d2d-64d144f963ad	1261	Ljubljana - Dobrunje
00050000-5570-622b-b950-90e70adbc47f	1260	Ljubljana - Polje
00050000-5570-622b-e577-d87a8c8c32de	1210	Ljubljana - Šentvid
00050000-5570-622b-17ce-939252b2fd13	1211	Ljubljana - Šmartno
00050000-5570-622b-733c-411d0dc9fd25	3333	Ljubno ob Savinji
00050000-5570-622b-b1f4-94c69a39c5bd	9240	Ljutomer
00050000-5570-622b-00ee-5040ba866c8c	3215	Loče
00050000-5570-622b-158f-ef3d5f996599	5231	Log pod Mangartom
00050000-5570-622b-b4e8-ca57d47bc4d2	1358	Log pri Brezovici
00050000-5570-622b-f6be-d2d219a3b71e	1370	Logatec
00050000-5570-622b-b4d3-4b151b3401e3	1371	Logatec
00050000-5570-622b-ae8b-3babc5d80e14	1434	Loka pri Zidanem Mostu
00050000-5570-622b-4a86-b62195c8b2e0	3223	Loka pri Žusmu
00050000-5570-622b-bdfd-3a5de00995a2	6219	Lokev
00050000-5570-622b-76d4-f07d6e4e322d	1318	Loški Potok
00050000-5570-622b-12b0-69f9f1b524ee	2324	Lovrenc na Dravskem polju
00050000-5570-622b-b244-4243d316c380	2344	Lovrenc na Pohorju
00050000-5570-622b-93be-f70fec104e32	3334	Luče
00050000-5570-622b-cd9e-a65a8a1ff9dd	1225	Lukovica
00050000-5570-622b-6bdf-084d89bc4451	9202	Mačkovci
00050000-5570-622b-6f82-e7067e251356	2322	Majšperk
00050000-5570-622b-fdd5-22385a1665b8	2321	Makole
00050000-5570-622b-55a7-57fd266a21a9	9243	Mala Nedelja
00050000-5570-622b-d703-d2898574754d	2229	Malečnik
00050000-5570-622b-3818-e5cab400aad3	6273	Marezige
00050000-5570-622b-79fb-811a774b8918	2000	Maribor 
00050000-5570-622b-977d-9b29ab2856ef	2001	Maribor - poštni predali
00050000-5570-622b-7e22-80d8343899ab	2206	Marjeta na Dravskem polju
00050000-5570-622b-22be-4c44203279f0	2281	Markovci
00050000-5570-622b-a006-0b12968fb3dd	9221	Martjanci
00050000-5570-622b-1b37-df87bfb89182	6242	Materija
00050000-5570-622b-6b48-e35b5ac254b2	4211	Mavčiče
00050000-5570-622b-4328-063a47de74d8	1215	Medvode
00050000-5570-622b-dcd6-44bfacd05336	1234	Mengeš
00050000-5570-622b-6984-534430600caf	8330	Metlika
00050000-5570-622b-1147-633e0fbb9d81	2392	Mežica
00050000-5570-622b-49ea-065caed275ed	2204	Miklavž na Dravskem polju
00050000-5570-622b-7745-43c11d7ec1a2	2275	Miklavž pri Ormožu
00050000-5570-622b-1c76-4050e6c830df	5291	Miren
00050000-5570-622b-3275-4c68e1808786	8233	Mirna
00050000-5570-622b-ff51-a562216ed311	8216	Mirna Peč
00050000-5570-622b-84da-78d78f38b136	2382	Mislinja
00050000-5570-622b-d0d5-c8a75b7c24bf	4281	Mojstrana
00050000-5570-622b-d330-3b1111725d99	8230	Mokronog
00050000-5570-622b-c974-3f492e13e267	1251	Moravče
00050000-5570-622b-10a0-650555ebeae9	9226	Moravske Toplice
00050000-5570-622b-42a3-9ead5d66c988	5216	Most na Soči
00050000-5570-622b-a4fb-a7c79764e263	1221	Motnik
00050000-5570-622b-5a00-d2437ad15e77	3330	Mozirje
00050000-5570-622b-f8f3-da0cd4523a7d	9000	Murska Sobota 
00050000-5570-622b-33f0-8de548721905	9001	Murska Sobota - poštni predali
00050000-5570-622b-48a1-e765df7de0b8	2366	Muta
00050000-5570-622b-8f2f-bfb904adbe68	4202	Naklo
00050000-5570-622b-9091-f5165f25d527	3331	Nazarje
00050000-5570-622b-57f7-d56c74e795ad	1357	Notranje Gorice
00050000-5570-622b-d43c-28334840970e	3203	Nova Cerkev
00050000-5570-622b-2517-9bac64dac2d0	5000	Nova Gorica 
00050000-5570-622b-425e-ea6b5a8a2793	5001	Nova Gorica - poštni predali
00050000-5570-622b-059e-92d0cb7e5eec	1385	Nova vas
00050000-5570-622b-74da-c3872846e219	8000	Novo mesto
00050000-5570-622b-1b5d-79edf16adfb1	8001	Novo mesto - poštni predali
00050000-5570-622b-8302-e44e389712f2	6243	Obrov
00050000-5570-622b-d8ad-027201d40491	9233	Odranci
00050000-5570-622b-7f7f-58b22b4fc133	2317	Oplotnica
00050000-5570-622b-b02c-271292018f8a	2312	Orehova vas
00050000-5570-622b-5b56-d15077e98868	2270	Ormož
00050000-5570-622b-8c57-0837cdb1497f	1316	Ortnek
00050000-5570-622b-6bf3-3769e85821dc	1337	Osilnica
00050000-5570-622b-bdcb-ec0e452822d2	8222	Otočec
00050000-5570-622b-fe53-07e3a5446a04	2361	Ožbalt
00050000-5570-622b-e504-d4835d9c7901	2231	Pernica
00050000-5570-622b-3551-9b3f4df08065	2211	Pesnica pri Mariboru
00050000-5570-622b-5edb-a6dcc42e57d6	9203	Petrovci
00050000-5570-622b-8df8-716da6c6cf63	3301	Petrovče
00050000-5570-622b-78df-9ef0b944b10d	6330	Piran/Pirano
00050000-5570-622b-7699-8a9d2fcebbf0	8255	Pišece
00050000-5570-622b-7cfc-a1dddd082eb2	6257	Pivka
00050000-5570-622b-e38e-d86785e6153b	6232	Planina
00050000-5570-622b-539f-084187b3595a	3225	Planina pri Sevnici
00050000-5570-622b-2b03-81a1fff471ed	6276	Pobegi
00050000-5570-622b-43c0-ec88c08dae86	8312	Podbočje
00050000-5570-622b-2b34-aae4b265fd09	5243	Podbrdo
00050000-5570-622b-978f-bd902fa0e93b	3254	Podčetrtek
00050000-5570-622b-22a6-b206a7bd3fb3	2273	Podgorci
00050000-5570-622b-f018-d1e243587a77	6216	Podgorje
00050000-5570-622b-1dd9-d6f20e1b20d4	2381	Podgorje pri Slovenj Gradcu
00050000-5570-622b-37fc-26056435e1c5	6244	Podgrad
00050000-5570-622b-d65e-761f53e4ccfb	1414	Podkum
00050000-5570-622b-df00-185b7869b5a2	2286	Podlehnik
00050000-5570-622b-8542-ffca67b2e4e1	5272	Podnanos
00050000-5570-622b-f5e8-fc020d8c3e0e	4244	Podnart
00050000-5570-622b-e153-d6b51a269ab3	3241	Podplat
00050000-5570-622b-c557-1d0f1e4783e1	3257	Podsreda
00050000-5570-622b-6554-8cd7b68a0200	2363	Podvelka
00050000-5570-622b-39dd-001621103476	2208	Pohorje
00050000-5570-622b-11bf-017186d467c4	2257	Polenšak
00050000-5570-622b-b783-fc84b46801cf	1355	Polhov Gradec
00050000-5570-622b-394f-7e2b2a46f558	4223	Poljane nad Škofjo Loko
00050000-5570-622b-fa48-18ddfb4b60e3	2319	Poljčane
00050000-5570-622b-c8a0-7fc5f106774e	1272	Polšnik
00050000-5570-622b-06eb-c7c8638b84eb	3313	Polzela
00050000-5570-622b-dd9d-40e7f47bb7ec	3232	Ponikva
00050000-5570-622b-9b7f-75c972604e5e	6320	Portorož/Portorose
00050000-5570-622b-f8f2-f48162f072df	6230	Postojna
00050000-5570-622b-ae5c-552fb085e5d5	2331	Pragersko
00050000-5570-622b-3eeb-3cb1eb48a937	3312	Prebold
00050000-5570-622b-a127-5e8074afa903	4205	Preddvor
00050000-5570-622b-cf3b-d75b5e079473	6255	Prem
00050000-5570-622b-2cc9-740ef7b757be	1352	Preserje
00050000-5570-622b-f698-ce95d4eec630	6258	Prestranek
00050000-5570-622b-9ae9-94f9d921bf4c	2391	Prevalje
00050000-5570-622b-fcdc-1075335c4c8b	3262	Prevorje
00050000-5570-622b-7c96-17dfa98be947	1276	Primskovo 
00050000-5570-622b-4f71-047131f5fbb6	3253	Pristava pri Mestinju
00050000-5570-622b-5775-627805a074c9	9207	Prosenjakovci/Partosfalva
00050000-5570-622b-89c7-328cc2268742	5297	Prvačina
00050000-5570-622b-5096-eba249278353	2250	Ptuj
00050000-5570-622b-21ca-1fd6a9d73ab7	2323	Ptujska Gora
00050000-5570-622b-ba07-001211b05462	9201	Puconci
00050000-5570-622b-b76d-837a7adf6c81	2327	Rače
00050000-5570-622b-7105-2d3ef39b085a	1433	Radeče
00050000-5570-622b-dde5-284fe7aabb9a	9252	Radenci
00050000-5570-622b-6af0-deefc7d39bac	2360	Radlje ob Dravi
00050000-5570-622b-68d3-1a1a45d49ab9	1235	Radomlje
00050000-5570-622b-ad9a-abc048a8d838	4240	Radovljica
00050000-5570-622b-285f-e61a0c721314	8274	Raka
00050000-5570-622b-2171-9d036987804d	1381	Rakek
00050000-5570-622b-f5ec-6c21507db03d	4283	Rateče - Planica
00050000-5570-622b-562b-d4310b6f41bb	2390	Ravne na Koroškem
00050000-5570-622b-bee2-4cc9096e149a	9246	Razkrižje
00050000-5570-622b-dd1a-16c5fb8741dc	3332	Rečica ob Savinji
00050000-5570-622b-fabf-dcb128f40f06	5292	Renče
00050000-5570-622b-25d6-05e622f5d338	1310	Ribnica
00050000-5570-622b-85bf-9ae9c7e24e75	2364	Ribnica na Pohorju
00050000-5570-622b-55ad-88c635972e00	3272	Rimske Toplice
00050000-5570-622b-7764-68f51c915752	1314	Rob
00050000-5570-622b-376e-1723c45026b8	5215	Ročinj
00050000-5570-622b-a93e-b7a840bb948a	3250	Rogaška Slatina
00050000-5570-622b-57be-ee54a2f1c631	9262	Rogašovci
00050000-5570-622b-3ac6-930775e982ad	3252	Rogatec
00050000-5570-622b-41bb-ad578b551ff1	1373	Rovte
00050000-5570-622b-1e04-eb733af7531f	2342	Ruše
00050000-5570-622b-0a48-b684d49daad7	1282	Sava
00050000-5570-622b-4c20-4966655a2fc8	6333	Sečovlje/Sicciole
00050000-5570-622b-6e1d-f3ec83540c3f	4227	Selca
00050000-5570-622b-07d0-9a09830ced54	2352	Selnica ob Dravi
00050000-5570-622b-e864-1ffc6de59f5a	8333	Semič
00050000-5570-622b-f8b7-073e1e7d2dbd	8281	Senovo
00050000-5570-622b-e4e4-cd12e44970f5	6224	Senožeče
00050000-5570-622b-ba91-ba6ecd565af2	8290	Sevnica
00050000-5570-622b-0ddb-290fd0208802	6210	Sežana
00050000-5570-622b-4460-44fc95659a46	2214	Sladki Vrh
00050000-5570-622b-4bd5-8aeb13c543e8	5283	Slap ob Idrijci
00050000-5570-622b-29bc-d5db878b5552	2380	Slovenj Gradec
00050000-5570-622b-fab2-80a8dda66c9b	2310	Slovenska Bistrica
00050000-5570-622b-9c67-e21e16436876	3210	Slovenske Konjice
00050000-5570-622b-0a49-27bc7dce6ee0	1216	Smlednik
00050000-5570-622b-9a36-db4e983c7f43	5232	Soča
00050000-5570-622b-b956-dffc2b74cc66	1317	Sodražica
00050000-5570-622b-f102-e34677ea8c9b	3335	Solčava
00050000-5570-622b-321f-a35a5aa035a1	5250	Solkan
00050000-5570-622b-9d38-a59a975add5b	4229	Sorica
00050000-5570-622b-4a31-a6237628e829	4225	Sovodenj
00050000-5570-622b-1a86-6193bd09dff6	5281	Spodnja Idrija
00050000-5570-622b-3738-59587b97782c	2241	Spodnji Duplek
00050000-5570-622b-c750-5984e599813c	9245	Spodnji Ivanjci
00050000-5570-622b-7b6b-a46f4edae1ae	2277	Središče ob Dravi
00050000-5570-622b-c8dc-9bd702f1f379	4267	Srednja vas v Bohinju
00050000-5570-622b-843a-669f93154119	8256	Sromlje 
00050000-5570-622b-f0fe-98a4e54f9a78	5224	Srpenica
00050000-5570-622b-a91f-fcaab72e69ec	1242	Stahovica
00050000-5570-622b-ff69-6997a8e2a82d	1332	Stara Cerkev
00050000-5570-622b-062e-c87175145053	8342	Stari trg ob Kolpi
00050000-5570-622b-9ee0-223afb631ae1	1386	Stari trg pri Ložu
00050000-5570-622b-ae2f-12aad27ff88d	2205	Starše
00050000-5570-622b-a550-46767d3d6621	2289	Stoperce
00050000-5570-622b-30ad-9dd7cac32ed7	8322	Stopiče
00050000-5570-622b-2247-f93db0676770	3206	Stranice
00050000-5570-622b-4e95-78d8b40f1d0f	8351	Straža
00050000-5570-622b-2149-058c5d685118	1313	Struge
00050000-5570-622b-ffc0-0e798c26feb8	8293	Studenec
00050000-5570-622b-b662-829b21fa6b89	8331	Suhor
00050000-5570-622b-a5f3-5f7cad5ec019	2233	Sv. Ana v Slovenskih goricah
00050000-5570-622b-d2ec-cb0b6cd4f57a	2235	Sv. Trojica v Slovenskih goricah
00050000-5570-622b-5219-befe4fcf6b12	2353	Sveti Duh na Ostrem Vrhu
00050000-5570-622b-a695-bc689b769aa1	9244	Sveti Jurij ob Ščavnici
00050000-5570-622b-6f47-30d5a93b42eb	3264	Sveti Štefan
00050000-5570-622b-b29c-b7671f699680	2258	Sveti Tomaž
00050000-5570-622b-c0db-819c2b6b263f	9204	Šalovci
00050000-5570-622b-5429-499b478fcfe9	5261	Šempas
00050000-5570-622b-bad4-86f5c5ba2050	5290	Šempeter pri Gorici
00050000-5570-622b-0002-0c995172262e	3311	Šempeter v Savinjski dolini
00050000-5570-622b-307f-ec6636d3f60b	4208	Šenčur
00050000-5570-622b-7d42-1f4a4c476389	2212	Šentilj v Slovenskih goricah
00050000-5570-622b-bc10-4141ce6e31da	8297	Šentjanž
00050000-5570-622b-7018-06e644883456	2373	Šentjanž pri Dravogradu
00050000-5570-622b-7fd8-a321a2e7bd1f	8310	Šentjernej
00050000-5570-622b-5426-2b03a55ad0b1	3230	Šentjur
00050000-5570-622b-703a-7a77dd93e5c5	3271	Šentrupert
00050000-5570-622b-6c01-335fb4c6dcc8	8232	Šentrupert
00050000-5570-622b-3e29-6a215c96765e	1296	Šentvid pri Stični
00050000-5570-622b-19f3-9d2ee746fd1b	8275	Škocjan
00050000-5570-622b-686a-f36898e35c10	6281	Škofije
00050000-5570-622b-e3c9-81485b8b45ac	4220	Škofja Loka
00050000-5570-622b-6ed1-e083e5c22139	3211	Škofja vas
00050000-5570-622b-38e6-1dc00ae20c4e	1291	Škofljica
00050000-5570-622b-934b-b761c3c57b85	6274	Šmarje
00050000-5570-622b-d5f3-adb95633e413	1293	Šmarje - Sap
00050000-5570-622b-ddf1-a74ff1cd710d	3240	Šmarje pri Jelšah
00050000-5570-622b-e3d8-af183ed7c00d	8220	Šmarješke Toplice
00050000-5570-622b-5bce-b7da8f6fdd20	2315	Šmartno na Pohorju
00050000-5570-622b-9db1-eaf966aca3d2	3341	Šmartno ob Dreti
00050000-5570-622b-5883-73c6528d1a82	3327	Šmartno ob Paki
00050000-5570-622b-0bd8-09f1d9d40a5e	1275	Šmartno pri Litiji
00050000-5570-622b-53cd-d587b7c70c47	2383	Šmartno pri Slovenj Gradcu
00050000-5570-622b-0f23-e0f00ae5ba87	3201	Šmartno v Rožni dolini
00050000-5570-622b-0ca1-b451a711ae6c	3325	Šoštanj
00050000-5570-622b-ed5e-d8749404d0f6	6222	Štanjel
00050000-5570-622b-3522-946f8da8341e	3220	Štore
00050000-5570-622b-6e5d-7d0536231026	3304	Tabor
00050000-5570-622b-2056-c4b883b2b0e9	3221	Teharje
00050000-5570-622b-d455-71d70e41e2d2	9251	Tišina
00050000-5570-622b-1eee-4df337605b3f	5220	Tolmin
00050000-5570-622b-219a-a08380b9738b	3326	Topolšica
00050000-5570-622b-e9ac-68342c431fe0	2371	Trbonje
00050000-5570-622b-3d7b-ecdfa3f538c1	1420	Trbovlje
00050000-5570-622b-3117-15168fb670dd	8231	Trebelno 
00050000-5570-622b-a28a-5c4d340d4727	8210	Trebnje
00050000-5570-622b-ac34-f2407d11ba29	5252	Trnovo pri Gorici
00050000-5570-622b-2e4f-f0a4cbacf9b4	2254	Trnovska vas
00050000-5570-622b-1c5a-0cf653ef22f9	1222	Trojane
00050000-5570-622b-a5b3-599048087f7d	1236	Trzin
00050000-5570-622b-4c0e-10c8f977e7ff	4290	Tržič
00050000-5570-622b-d5fd-7c78d6decb13	8295	Tržišče
00050000-5570-622b-79d6-c6b2519c636b	1311	Turjak
00050000-5570-622b-9305-15292de943ce	9224	Turnišče
00050000-5570-622b-fdd6-d888896e64e4	8323	Uršna sela
00050000-5570-622b-4ed9-5979037c1cde	1252	Vače
00050000-5570-622b-b9af-71b4132d6edb	3320	Velenje 
00050000-5570-622b-d9e1-ded0439f5460	3322	Velenje - poštni predali
00050000-5570-622b-4e48-8756640a4fb6	8212	Velika Loka
00050000-5570-622b-b939-1b63bb3aa7cb	2274	Velika Nedelja
00050000-5570-622b-073c-01aa62d16e4b	9225	Velika Polana
00050000-5570-622b-34e1-776094376b8e	1315	Velike Lašče
00050000-5570-622b-16e8-b6c75004b95d	8213	Veliki Gaber
00050000-5570-622b-b55c-74ef20bbbc23	9241	Veržej
00050000-5570-622b-ddd8-b7c717267866	1312	Videm - Dobrepolje
00050000-5570-622b-1e3d-70508f3a39d0	2284	Videm pri Ptuju
00050000-5570-622b-1895-e1a8aa21b6cf	8344	Vinica
00050000-5570-622b-fd70-a9d729b8ac9f	5271	Vipava
00050000-5570-622b-9343-437af4709de2	4212	Visoko
00050000-5570-622b-686e-e38bcbc36e53	1294	Višnja Gora
00050000-5570-622b-f322-a5b953705b63	3205	Vitanje
00050000-5570-622b-3163-bffcce45849e	2255	Vitomarci
00050000-5570-622b-e957-80851420cf4c	1217	Vodice
00050000-5570-622b-8f41-3650141baa37	3212	Vojnik\t
00050000-5570-622b-2b87-9ea49d8c4ecf	5293	Volčja Draga
00050000-5570-622b-8450-30c3bd9813c8	2232	Voličina
00050000-5570-622b-feed-3b502e98c3c8	3305	Vransko
00050000-5570-622b-7d75-b4ead3e8fcae	6217	Vremski Britof
00050000-5570-622b-84e1-6e2a240f3357	1360	Vrhnika
00050000-5570-622b-3ff6-c75320142be4	2365	Vuhred
00050000-5570-622b-6efe-07366e25cfff	2367	Vuzenica
00050000-5570-622b-62e8-f8ae4192d397	8292	Zabukovje 
00050000-5570-622b-e140-296e4ecede1b	1410	Zagorje ob Savi
00050000-5570-622b-ffc9-df0de7a3eea8	1303	Zagradec
00050000-5570-622b-ac91-ca88142f7883	2283	Zavrč
00050000-5570-622b-0d71-2fccec88b7a6	8272	Zdole 
00050000-5570-622b-3fac-537b01a041c3	4201	Zgornja Besnica
00050000-5570-622b-bfff-70f2fe1e88cc	2242	Zgornja Korena
00050000-5570-622b-6356-0109085c940f	2201	Zgornja Kungota
00050000-5570-622b-3fcb-1ff9b0b0147a	2316	Zgornja Ložnica
00050000-5570-622b-dc26-6ce4a6bbca1f	2314	Zgornja Polskava
00050000-5570-622b-5040-b70a2767e629	2213	Zgornja Velka
00050000-5570-622b-ffcc-4ebc8bd17769	4247	Zgornje Gorje
00050000-5570-622b-ac69-9b3550168e1f	4206	Zgornje Jezersko
00050000-5570-622b-43b8-9b55478c9407	2285	Zgornji Leskovec
00050000-5570-622b-8281-865f5f540d8c	1432	Zidani Most
00050000-5570-622b-183d-f410e4c54349	3214	Zreče
00050000-5570-622b-20ec-96c45681e7f6	4209	Žabnica
00050000-5570-622b-d4c2-9dc5d49bdd2c	3310	Žalec
00050000-5570-622b-9348-d723da3e6fca	4228	Železniki
00050000-5570-622b-c6bd-7eb44885ef28	2287	Žetale
00050000-5570-622b-addf-1da9e49fa2dd	4226	Žiri
00050000-5570-622b-252e-dbd05166da19	4274	Žirovnica
00050000-5570-622b-035b-417fefc8d274	8360	Žužemberk
\.


--
-- TOC entry 2809 (class 0 OID 6306049)
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
-- TOC entry 2791 (class 0 OID 6305860)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6305938)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6306061)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6306181)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6306236)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5570-622c-5575-6f052c92af85	00080000-5570-622c-1f6b-9d050fbdf7d9	0987	A
00190000-5570-622c-99c8-de8ce4862ddb	00080000-5570-622c-873f-a9c7d2fdb4e1	0989	A
\.


--
-- TOC entry 2835 (class 0 OID 6306350)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6306378)
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
-- TOC entry 2836 (class 0 OID 6306359)
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
-- TOC entry 2815 (class 0 OID 6306090)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5570-622c-5a86-f49fbf42029e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5570-622c-11f0-296dcd0fc4ee	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5570-622c-5df1-547af67a2c7f	0003	Kazinska	t	84	Kazinska dvorana
00220000-5570-622c-117c-f46b353d0172	0004	Mali oder	t	24	Mali oder 
00220000-5570-622c-5e58-236f66fb595e	0005	Komorni oder	t	15	Komorni oder
00220000-5570-622c-e9d5-38a13529bbee	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5570-622c-ad88-55297483bf6b	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2807 (class 0 OID 6306034)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6306024)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6306225)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6306158)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6305732)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5570-622b-fc2f-22f79fb8ef2a	00010000-5570-622b-8d1a-57a459c151eb	2015-06-04 16:35:25	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROkQNe0SqW4iWRhA27LsykBvIUZczrKam";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2816 (class 0 OID 6306100)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6305770)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5570-622b-171e-03586a18cc89	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5570-622b-328f-2158c102a125	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5570-622b-f33b-aeb0a76d2f4e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5570-622b-3f91-bbffac0fe1a4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5570-622b-c8b5-b01a39c2705b	planer	Planer dogodkov v koledarju	t
00020000-5570-622b-b8f9-db4b3f62d1bc	kadrovska	Kadrovska služba	t
00020000-5570-622b-70a3-c7348460dcca	arhivar	Ažuriranje arhivalij	t
00020000-5570-622b-b314-06e7c26364c8	igralec	Igralec	t
00020000-5570-622b-4749-d5e278e6704e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2782 (class 0 OID 6305754)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5570-622b-fc2f-22f79fb8ef2a	00020000-5570-622b-f33b-aeb0a76d2f4e
00010000-5570-622b-8d1a-57a459c151eb	00020000-5570-622b-f33b-aeb0a76d2f4e
\.


--
-- TOC entry 2818 (class 0 OID 6306114)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6306055)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6306005)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6306397)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5570-622b-13c2-b163d143e39a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5570-622b-52c0-99e1cb7ef325	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5570-622b-d827-78280ee9872c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5570-622b-dfeb-5cb39dd96480	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5570-622b-2138-f8f795b5a40a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2840 (class 0 OID 6306389)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5570-622b-859e-a022be28e50a	00000000-5570-622b-dfeb-5cb39dd96480	popa
00000000-5570-622b-9202-4faf86ac228a	00000000-5570-622b-dfeb-5cb39dd96480	oseba
00000000-5570-622b-8612-8fb27b40062b	00000000-5570-622b-52c0-99e1cb7ef325	prostor
00000000-5570-622b-a5e4-27472622e79a	00000000-5570-622b-dfeb-5cb39dd96480	besedilo
00000000-5570-622b-c780-4a7d3e87a1a6	00000000-5570-622b-dfeb-5cb39dd96480	uprizoritev
00000000-5570-622b-81db-481b3092e1b8	00000000-5570-622b-dfeb-5cb39dd96480	funkcija
00000000-5570-622b-36dd-503b79d6f9eb	00000000-5570-622b-dfeb-5cb39dd96480	tipfunkcije
00000000-5570-622b-11fa-c7a6258a1c41	00000000-5570-622b-dfeb-5cb39dd96480	alternacija
00000000-5570-622b-94d6-682ac9638d3e	00000000-5570-622b-13c2-b163d143e39a	pogodba
00000000-5570-622b-5464-21b5eb843c9a	00000000-5570-622b-dfeb-5cb39dd96480	zaposlitev
\.


--
-- TOC entry 2839 (class 0 OID 6306384)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6306168)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6305832)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6306011)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5570-622c-73a4-61ef5cb7bcdf	00180000-5570-622c-5eba-a5fb9984d4f3	000c0000-5570-622c-a245-46fa10f9757c	00090000-5570-622c-49b7-e5443fa98cfc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-622c-285e-1bf4fc1b36b2	00180000-5570-622c-5eba-a5fb9984d4f3	000c0000-5570-622c-883a-880449916e50	00090000-5570-622c-ff0a-61b8b1f8c9a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-622c-9ee3-e2bb6616e6d4	00180000-5570-622c-5eba-a5fb9984d4f3	000c0000-5570-622c-af60-84bb7f66a0a6	00090000-5570-622c-f2e8-a1947711b551	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-622c-18a0-72cff9e53616	00180000-5570-622c-5eba-a5fb9984d4f3	000c0000-5570-622c-9989-4b4552ab2573	00090000-5570-622c-7e40-4fbc2917814c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-622c-0ab7-c8a9d75ff596	00180000-5570-622c-5eba-a5fb9984d4f3	000c0000-5570-622c-cbb6-f6bb1afeb589	00090000-5570-622c-1c93-bec7867449b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-622c-3beb-58dc22a145ef	00180000-5570-622c-f6ae-809c06feb4b4	\N	00090000-5570-622c-1c93-bec7867449b5	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2826 (class 0 OID 6306214)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5570-622b-3da4-c36227895794	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5570-622b-0e80-88b632895f16	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5570-622b-fdc4-1b912d8f6e04	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5570-622b-3817-45323b7d564e	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5570-622b-6916-66aee7be27c7	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5570-622b-5c6f-6d7fd9fe0305	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5570-622b-c74f-9047dd410aca	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5570-622b-5527-9bd4d4a48ee6	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5570-622b-92e4-337f17f8f122	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5570-622b-4242-3f3bbccaeb98	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5570-622b-8501-fdcd37c42235	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5570-622b-9fc7-22973ce88903	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5570-622b-127d-64730af1a29b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5570-622b-0d73-3762c57b78e1	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5570-622b-0b36-4235a0a4accd	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5570-622b-50a3-598528d477f4	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2837 (class 0 OID 6306367)
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
-- TOC entry 2794 (class 0 OID 6305895)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6305741)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5570-622b-8d1a-57a459c151eb	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROxMwZl.4VrWXJdIF9MC5qvwjwK1vLmkq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5570-622c-1340-aa6bdb1c81f4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5570-622c-a588-775b3cdbe050	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5570-622c-e9b3-601676c50db9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5570-622c-ecff-53fa4fc9cd20	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5570-622c-c3cc-1e80237f2601	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5570-622c-512e-aa6e6da4a3a1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5570-622b-fc2f-22f79fb8ef2a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6306271)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5570-622c-845d-1d052e7aa58d	00160000-5570-622c-959b-03e74fde01ea	00150000-5570-622b-c33b-ffee8bab3485	00140000-5570-622b-ce30-f11a5e0f66a7	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5570-622c-5e58-236f66fb595e
000e0000-5570-622c-1d53-dd3e622c72ec	00160000-5570-622c-1f70-b9f5d1f9011a	00150000-5570-622b-bbcc-bab444ae1880	00140000-5570-622b-cd3c-72f93c6035d8	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5570-622c-e9d5-38a13529bbee
\.


--
-- TOC entry 2799 (class 0 OID 6305957)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5570-622c-2a4c-e2e1a5252f1a	000e0000-5570-622c-1d53-dd3e622c72ec	1	
00200000-5570-622c-72ad-895200fdbcbc	000e0000-5570-622c-1d53-dd3e622c72ec	2	
\.


--
-- TOC entry 2814 (class 0 OID 6306082)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6306151)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6305989)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6306261)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5570-622b-ce30-f11a5e0f66a7	01	Drama	drama (SURS 01)
00140000-5570-622b-0941-c320823f976d	02	Opera	opera (SURS 02)
00140000-5570-622b-806f-e4164d67d86e	03	Balet	balet (SURS 03)
00140000-5570-622b-ca1c-3ee989ab3edf	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5570-622b-bb90-a19ea843fcea	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5570-622b-cd3c-72f93c6035d8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5570-622b-18c0-af9a1109b59d	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2820 (class 0 OID 6306141)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5570-622b-95a2-9d7962c49b68	01	Opera	opera
00150000-5570-622b-1906-4ec03849aa21	02	Opereta	opereta
00150000-5570-622b-b5a0-1640e82ddf2a	03	Balet	balet
00150000-5570-622b-f074-14fdb9ac0d18	04	Plesne prireditve	plesne prireditve
00150000-5570-622b-1f4d-3acd64aa214b	05	Lutkovno gledališče	lutkovno gledališče
00150000-5570-622b-1cf3-e025c3aa957b	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5570-622b-ef4b-d101674009f8	07	Biografska drama	biografska drama
00150000-5570-622b-c33b-ffee8bab3485	08	Komedija	komedija
00150000-5570-622b-1309-44f5f685ab5b	09	Črna komedija	črna komedija
00150000-5570-622b-3444-127f0f551a24	10	E-igra	E-igra
00150000-5570-622b-bbcc-bab444ae1880	11	Kriminalka	kriminalka
00150000-5570-622b-3cda-120d19f2256c	12	Musical	musical
\.


--
-- TOC entry 2372 (class 2606 OID 6305795)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6306317)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 6306307)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6306213)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6305979)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6306004)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6305921)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6306346)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6306137)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6305955)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 6305998)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 6305935)
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
-- TOC entry 2464 (class 2606 OID 6306047)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6306074)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6305893)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 6305804)
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
-- TOC entry 2379 (class 2606 OID 6305828)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6305784)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2363 (class 2606 OID 6305769)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6306080)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6306113)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6306256)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6305857)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6305881)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6306053)
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
-- TOC entry 2394 (class 2606 OID 6305871)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6305942)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6306065)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6306193)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6306241)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6306357)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6306382)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6306364)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 6306097)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6306038)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6306029)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6306235)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6306165)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6305740)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6306104)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 6305758)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2365 (class 2606 OID 6305778)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6306122)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6306060)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6306010)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6306406)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6306394)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6306388)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6306178)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 6305837)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6306020)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6306224)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6306377)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6305906)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6305753)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6306287)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6305964)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6306088)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6306156)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6305993)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6306269)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 6306149)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 1259 OID 6305986)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2512 (class 1259 OID 6306179)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2513 (class 1259 OID 6306180)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 6305859)
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
-- TOC entry 2477 (class 1259 OID 6306081)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2471 (class 1259 OID 6306067)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2472 (class 1259 OID 6306066)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2423 (class 1259 OID 6305965)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6306138)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2500 (class 1259 OID 6306140)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2501 (class 1259 OID 6306139)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2411 (class 1259 OID 6305937)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 6305936)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6306258)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 6306259)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 6306260)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2539 (class 1259 OID 6306292)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2540 (class 1259 OID 6306289)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2541 (class 1259 OID 6306291)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2542 (class 1259 OID 6306290)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2401 (class 1259 OID 6305908)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6305907)
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
-- TOC entry 2377 (class 1259 OID 6305831)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 6306105)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2441 (class 1259 OID 6305999)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2367 (class 1259 OID 6305785)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2368 (class 1259 OID 6305786)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2492 (class 1259 OID 6306125)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2493 (class 1259 OID 6306124)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 6306123)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2415 (class 1259 OID 6305943)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 6305945)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2417 (class 1259 OID 6305944)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2577 (class 1259 OID 6306396)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2451 (class 1259 OID 6306033)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2452 (class 1259 OID 6306031)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2453 (class 1259 OID 6306030)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2454 (class 1259 OID 6306032)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2358 (class 1259 OID 6305759)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2359 (class 1259 OID 6305760)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 6306089)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2466 (class 1259 OID 6306054)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2508 (class 1259 OID 6306166)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2509 (class 1259 OID 6306167)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6306347)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6306349)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6306348)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2390 (class 1259 OID 6305873)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 6305872)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2392 (class 1259 OID 6305874)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2572 (class 1259 OID 6306383)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2516 (class 1259 OID 6306194)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2517 (class 1259 OID 6306195)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2552 (class 1259 OID 6306321)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2553 (class 1259 OID 6306320)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2554 (class 1259 OID 6306323)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2555 (class 1259 OID 6306319)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2556 (class 1259 OID 6306322)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2505 (class 1259 OID 6306157)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 6306042)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2458 (class 1259 OID 6306041)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2459 (class 1259 OID 6306039)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2460 (class 1259 OID 6306040)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2548 (class 1259 OID 6306309)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 6306308)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 6306358)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2422 (class 1259 OID 6305956)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 6305806)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2374 (class 1259 OID 6305805)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2382 (class 1259 OID 6305838)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6305839)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 6306023)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 6306022)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2448 (class 1259 OID 6306021)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 6306366)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2567 (class 1259 OID 6306365)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2429 (class 1259 OID 6305988)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2430 (class 1259 OID 6305984)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2431 (class 1259 OID 6305981)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2432 (class 1259 OID 6305982)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2433 (class 1259 OID 6305980)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2434 (class 1259 OID 6305985)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2435 (class 1259 OID 6305983)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2389 (class 1259 OID 6305858)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6305922)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2408 (class 1259 OID 6305924)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2409 (class 1259 OID 6305923)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2410 (class 1259 OID 6305925)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2465 (class 1259 OID 6306048)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2535 (class 1259 OID 6306257)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6306288)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6305829)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2381 (class 1259 OID 6305830)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 6306150)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 6306407)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6305894)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 6306395)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2485 (class 1259 OID 6306099)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2486 (class 1259 OID 6306098)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 6306318)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6305882)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6306270)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6306242)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 6306243)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2366 (class 1259 OID 6305779)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2436 (class 1259 OID 6305987)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2609 (class 2606 OID 6306549)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2612 (class 2606 OID 6306534)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2611 (class 2606 OID 6306539)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2607 (class 2606 OID 6306559)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2613 (class 2606 OID 6306529)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2608 (class 2606 OID 6306554)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2610 (class 2606 OID 6306544)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2643 (class 2606 OID 6306704)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6306709)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6306464)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2630 (class 2606 OID 6306644)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2628 (class 2606 OID 6306639)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2629 (class 2606 OID 6306634)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2606 (class 2606 OID 6306524)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6306674)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6306684)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2637 (class 2606 OID 6306679)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2600 (class 2606 OID 6306499)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2601 (class 2606 OID 6306494)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6306624)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 6306729)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6306734)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6306739)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2650 (class 2606 OID 6306759)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2653 (class 2606 OID 6306744)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 6306754)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2652 (class 2606 OID 6306749)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2598 (class 2606 OID 6306489)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6306484)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2590 (class 2606 OID 6306449)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2591 (class 2606 OID 6306444)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2632 (class 2606 OID 6306654)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2614 (class 2606 OID 6306564)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2587 (class 2606 OID 6306424)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2586 (class 2606 OID 6306429)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2633 (class 2606 OID 6306669)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2634 (class 2606 OID 6306664)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2635 (class 2606 OID 6306659)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2604 (class 2606 OID 6306504)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6306514)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2603 (class 2606 OID 6306509)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 6306834)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2618 (class 2606 OID 6306599)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2620 (class 2606 OID 6306589)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2621 (class 2606 OID 6306584)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2619 (class 2606 OID 6306594)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2585 (class 2606 OID 6306414)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2584 (class 2606 OID 6306419)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2631 (class 2606 OID 6306649)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2627 (class 2606 OID 6306629)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2641 (class 2606 OID 6306694)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2640 (class 2606 OID 6306699)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6306799)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6306809)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6306804)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2596 (class 2606 OID 6306474)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6306469)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2595 (class 2606 OID 6306479)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6306829)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2645 (class 2606 OID 6306714)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 6306719)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2658 (class 2606 OID 6306784)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 6306779)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2656 (class 2606 OID 6306794)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2660 (class 2606 OID 6306774)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2657 (class 2606 OID 6306789)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2639 (class 2606 OID 6306689)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2622 (class 2606 OID 6306619)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2623 (class 2606 OID 6306614)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2625 (class 2606 OID 6306604)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2624 (class 2606 OID 6306609)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 6306769)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6306764)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6306814)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6306519)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2646 (class 2606 OID 6306724)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6306439)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2589 (class 2606 OID 6306434)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2593 (class 2606 OID 6306454)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2592 (class 2606 OID 6306459)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2615 (class 2606 OID 6306579)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6306574)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2617 (class 2606 OID 6306569)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6306824)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 6306819)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-04 16:35:25 CEST

--
-- PostgreSQL database dump complete
--

