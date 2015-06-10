--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 13:00:56 CEST

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
-- TOC entry 180 (class 1259 OID 6855790)
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
-- TOC entry 227 (class 1259 OID 6856312)
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
-- TOC entry 226 (class 1259 OID 6856295)
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
-- TOC entry 219 (class 1259 OID 6856199)
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
-- TOC entry 194 (class 1259 OID 6855969)
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
-- TOC entry 197 (class 1259 OID 6856003)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6855912)
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
-- TOC entry 228 (class 1259 OID 6856326)
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
-- TOC entry 213 (class 1259 OID 6856129)
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
-- TOC entry 192 (class 1259 OID 6855949)
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
-- TOC entry 196 (class 1259 OID 6855997)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6855929)
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
-- TOC entry 202 (class 1259 OID 6856046)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6856071)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6855886)
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
-- TOC entry 181 (class 1259 OID 6855799)
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
-- TOC entry 182 (class 1259 OID 6855810)
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
-- TOC entry 177 (class 1259 OID 6855764)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6855783)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6856078)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6856109)
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
-- TOC entry 223 (class 1259 OID 6856245)
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
-- TOC entry 184 (class 1259 OID 6855843)
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
-- TOC entry 186 (class 1259 OID 6855878)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6856052)
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
-- TOC entry 185 (class 1259 OID 6855863)
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
-- TOC entry 191 (class 1259 OID 6855941)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6856064)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6856184)
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
-- TOC entry 222 (class 1259 OID 6856237)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6856352)
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
-- TOC entry 233 (class 1259 OID 6856403)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 230 (class 1259 OID 6856365)
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
-- TOC entry 231 (class 1259 OID 6856373)
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
-- TOC entry 209 (class 1259 OID 6856093)
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
-- TOC entry 201 (class 1259 OID 6856037)
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
-- TOC entry 200 (class 1259 OID 6856027)
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
-- TOC entry 221 (class 1259 OID 6856226)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6856161)
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
-- TOC entry 174 (class 1259 OID 6855735)
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
-- TOC entry 173 (class 1259 OID 6855733)
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
-- TOC entry 210 (class 1259 OID 6856103)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6855773)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6855757)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6856117)
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
-- TOC entry 204 (class 1259 OID 6856058)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6856008)
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
-- TOC entry 236 (class 1259 OID 6856422)
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
-- TOC entry 235 (class 1259 OID 6856414)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6856409)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6856171)
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
-- TOC entry 183 (class 1259 OID 6855835)
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
-- TOC entry 199 (class 1259 OID 6856014)
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
-- TOC entry 220 (class 1259 OID 6856215)
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
-- TOC entry 232 (class 1259 OID 6856392)
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
-- TOC entry 188 (class 1259 OID 6855898)
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
-- TOC entry 175 (class 1259 OID 6855744)
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
-- TOC entry 225 (class 1259 OID 6856272)
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
-- TOC entry 193 (class 1259 OID 6855960)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6856085)
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
-- TOC entry 215 (class 1259 OID 6856154)
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
-- TOC entry 195 (class 1259 OID 6855992)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6856262)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6856144)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2173 (class 2604 OID 6855738)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2803 (class 0 OID 6855790)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6856312)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5578-18e7-fd26-9045dc39c964	000d0000-5578-18e7-ccee-3b79f75b00cb	\N	00090000-5578-18e7-8363-8236d3a85ef9	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-18e7-2b15-3b085059c965	000d0000-5578-18e7-d488-bc8f457cefa8	\N	00090000-5578-18e7-79bc-f8429d99bd20	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-18e7-aebb-76425629a6ba	000d0000-5578-18e7-ab56-77cd58106bb4	\N	00090000-5578-18e7-8750-fcde93cabc9e	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-18e7-7d85-c2b3f839da36	000d0000-5578-18e7-53a8-092ed8c27689	\N	00090000-5578-18e7-9bc6-27a1644b8f71	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-18e7-2369-2016850cd8c9	000d0000-5578-18e7-a97e-ecba1e33b5c0	\N	00090000-5578-18e7-b5ce-ec31152f1772	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-18e7-7ee6-0341b6ed2a4b	000d0000-5578-18e7-bf8a-16054f559b23	\N	00090000-5578-18e7-79bc-f8429d99bd20	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 6856295)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6856199)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5578-18e7-b71e-86289b9b39fc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5578-18e7-a6a4-3120d56aa7a8	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5578-18e7-33f7-e75ca749618a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2817 (class 0 OID 6855969)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5578-18e7-ed62-7d341d03278a	\N	\N	00200000-5578-18e7-02b9-69b12bf95d4a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5578-18e7-429b-3007bfec0097	\N	\N	00200000-5578-18e7-c62b-bc425e26f82d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5578-18e7-f6b1-fb135e79887d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5578-18e7-6999-bdeae07648e9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5578-18e7-81d9-7835a329f9dc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2820 (class 0 OID 6856003)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6855912)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5578-18e6-d803-f7f69d2f9555	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5578-18e6-c5c0-01b246f808b3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5578-18e6-2634-8a639ffa85f8	AL	ALB	008	Albania 	Albanija	\N
00040000-5578-18e6-cfc0-169cda7a9484	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5578-18e6-f81a-32a7727754e7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5578-18e6-37fa-b603f986e54a	AD	AND	020	Andorra 	Andora	\N
00040000-5578-18e6-006f-6836a70e0596	AO	AGO	024	Angola 	Angola	\N
00040000-5578-18e6-bf88-d5a066e9b469	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5578-18e6-56b9-df637774f448	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5578-18e6-7b50-529129dbae9f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-18e6-9846-7bf23cf8f551	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5578-18e6-7f43-bc37f4442171	AM	ARM	051	Armenia 	Armenija	\N
00040000-5578-18e6-3bed-700dd2e80ef3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5578-18e6-803b-64066cbfaff9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5578-18e6-75aa-185eaf99648d	AT	AUT	040	Austria 	Avstrija	\N
00040000-5578-18e6-4e52-bcccf45c257c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5578-18e6-7aef-7ff72508ec25	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5578-18e6-9f65-69c168e3596c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5578-18e6-b9aa-25cb2fb647c8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5578-18e6-7300-df0111320bff	BB	BRB	052	Barbados 	Barbados	\N
00040000-5578-18e6-c5f7-8bc7d5146f68	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5578-18e6-88be-a86541b2cbb7	BE	BEL	056	Belgium 	Belgija	\N
00040000-5578-18e6-f831-62aa77e4af26	BZ	BLZ	084	Belize 	Belize	\N
00040000-5578-18e6-fb4c-84328c08015a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5578-18e6-d8cd-af2d13f81010	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5578-18e6-49d7-d0c48c788517	BT	BTN	064	Bhutan 	Butan	\N
00040000-5578-18e6-c3ce-3ce9f18df639	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5578-18e6-310c-10bb676f5f39	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5578-18e6-514c-acb1abaaa570	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5578-18e6-b044-9e382e0fcdfc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5578-18e6-7121-2ce340638741	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5578-18e6-f458-627559f9cf74	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5578-18e6-9abb-b42054cd115e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5578-18e6-75b1-3b3300adae1c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5578-18e6-bcf4-823b5e5d2ab6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5578-18e6-77b6-7154dcdd3b46	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5578-18e6-341a-613c2d8e10d4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5578-18e6-b4e5-869b61db6a90	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5578-18e6-de2b-7c087c3e4316	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5578-18e6-bb43-624637b878b3	CA	CAN	124	Canada 	Kanada	\N
00040000-5578-18e6-5e76-0f5fd72ca885	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5578-18e6-fb29-d4d7f6c1fdd0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5578-18e6-1f63-db8ddd818d24	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5578-18e6-5e1c-dd097e493877	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5578-18e6-62d3-c8263d5bc8a1	CL	CHL	152	Chile 	Čile	\N
00040000-5578-18e6-2578-6d528c64b74a	CN	CHN	156	China 	Kitajska	\N
00040000-5578-18e6-3d50-3036a3b8f951	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5578-18e6-fe6b-bd6423d78091	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5578-18e6-55f3-dc55cecd8934	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5578-18e6-abb6-4ee41d4972dc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5578-18e6-b32b-d6e559408884	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5578-18e6-43d8-3ad9fd19d9ee	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5578-18e6-4e1b-d2290bd4b3fe	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5578-18e6-8f27-97a73ef8d446	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5578-18e6-abb1-359f6d87dfa8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5578-18e6-e943-c1a60f480575	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5578-18e6-42a1-6f542e6225ae	CU	CUB	192	Cuba 	Kuba	\N
00040000-5578-18e6-f272-ebaf5f7a39b5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5578-18e6-6fe9-0183e1bcaa37	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5578-18e6-8aa4-b96d1feb9eb6	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5578-18e6-abb6-1cb3e566284f	DK	DNK	208	Denmark 	Danska	\N
00040000-5578-18e6-f287-ede63bcb9112	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5578-18e6-22e4-81986bc4e66b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-18e6-80c0-01f8e786d2f8	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5578-18e6-e7c1-29aa86f3424b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5578-18e6-e271-848be381d245	EG	EGY	818	Egypt 	Egipt	\N
00040000-5578-18e6-d3d5-c4f47ca5c263	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5578-18e6-4edc-682ca95028cf	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5578-18e6-70d0-0cd462521bac	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5578-18e6-0ccb-f2c07c9d3781	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5578-18e6-0cb4-598699de0f06	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5578-18e6-f5a1-497468f5740d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5578-18e6-56be-256e8eaa7d37	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5578-18e6-2545-0f5b63ddfd40	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5578-18e6-1739-556127f4e784	FI	FIN	246	Finland 	Finska	\N
00040000-5578-18e6-648d-df13654478c2	FR	FRA	250	France 	Francija	\N
00040000-5578-18e6-1189-11fa530d97f6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5578-18e6-9f26-29d43d997175	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5578-18e6-e807-8c7b094ea066	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5578-18e6-e601-d9dc6b8f436c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5578-18e6-f22c-70b5b95aec89	GA	GAB	266	Gabon 	Gabon	\N
00040000-5578-18e6-9c3c-84cc37a132a8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5578-18e6-b09c-82a116feef4c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5578-18e6-de89-18d541fc8641	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5578-18e6-a996-d9b92459a543	GH	GHA	288	Ghana 	Gana	\N
00040000-5578-18e6-4225-b89feb5c981d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5578-18e6-64cf-3416a6b431c0	GR	GRC	300	Greece 	Grčija	\N
00040000-5578-18e6-2d54-ffd9329b76e5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5578-18e6-990a-2cf44377741c	GD	GRD	308	Grenada 	Grenada	\N
00040000-5578-18e6-2888-b6b62cf37f5e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5578-18e6-5917-72ae24b5574f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5578-18e6-b2ad-78fb897571f3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5578-18e6-8d03-4fa5a00ae3d7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5578-18e6-b29c-07fbc1b2ddf2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5578-18e6-e1b8-2c9926727815	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5578-18e6-dbdf-0fe448084080	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5578-18e6-f5d9-4bc88b168fcb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5578-18e6-7804-d111b338c555	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5578-18e6-f408-9f741af0da29	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5578-18e6-32f7-a694d5ff6d4f	HN	HND	340	Honduras 	Honduras	\N
00040000-5578-18e6-69a7-c0d059d2f306	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5578-18e6-bbdc-5ee7e168fd49	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5578-18e6-ad3e-92907c07cb85	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5578-18e6-7dcb-70a11b1d02cc	IN	IND	356	India 	Indija	\N
00040000-5578-18e6-e3e8-4fe376ed720d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5578-18e6-1931-6aec81060715	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5578-18e6-1b4a-b61d92c9d8f6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5578-18e6-88ba-71ca2c979572	IE	IRL	372	Ireland 	Irska	\N
00040000-5578-18e6-adc9-53976f66dfbc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5578-18e6-8d29-620703f89d80	IL	ISR	376	Israel 	Izrael	\N
00040000-5578-18e6-8c3f-373dc4ddbe83	IT	ITA	380	Italy 	Italija	\N
00040000-5578-18e6-11da-91ec2c550506	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5578-18e6-39bf-f1a72750c647	JP	JPN	392	Japan 	Japonska	\N
00040000-5578-18e6-51b3-2ca0e81be86c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5578-18e6-e82c-50921a7ab93a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5578-18e6-947e-015a7eef142b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5578-18e6-e21b-9eec86a70ba8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5578-18e6-4d46-fd1de7242b67	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5578-18e6-631d-0c0abf49156c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5578-18e6-eb33-96cf20d17e3f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5578-18e6-bacb-e398db9c8b71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5578-18e6-2353-c12989698beb	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5578-18e6-c82f-5ae213dfd8c2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5578-18e6-acc2-a597f30e10e8	LV	LVA	428	Latvia 	Latvija	\N
00040000-5578-18e6-ac87-eab4b8a319fa	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5578-18e6-34aa-eea4bf5d4cd6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5578-18e6-d9c3-d5c8ed61d432	LR	LBR	430	Liberia 	Liberija	\N
00040000-5578-18e6-15e2-16e82ea13be7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5578-18e6-dcc8-8e152c0278fa	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5578-18e6-e219-18a7b7b23d9e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5578-18e6-a4f5-4a56c11c767b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5578-18e6-8426-5fd14e7facb0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5578-18e6-53e5-deb164eebbc8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5578-18e6-7092-dede09f3257c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5578-18e6-f252-57e3584fd5b0	MW	MWI	454	Malawi 	Malavi	\N
00040000-5578-18e6-0918-a824a7d445b7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5578-18e6-14c2-8441f228d15f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5578-18e6-4f4b-2714727a9a7a	ML	MLI	466	Mali 	Mali	\N
00040000-5578-18e6-5798-dc3e831533dc	MT	MLT	470	Malta 	Malta	\N
00040000-5578-18e6-1db8-3c882981c706	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5578-18e6-2c50-05125c7424c5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5578-18e6-28ad-3139011a588e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5578-18e6-a007-176b4f234732	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5578-18e6-4215-e33f200aaed1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5578-18e6-dcb5-4717516a6d93	MX	MEX	484	Mexico 	Mehika	\N
00040000-5578-18e6-4e39-83014d7396d6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5578-18e6-2b10-d1000f726c12	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5578-18e6-d9b8-ec2a86e43634	MC	MCO	492	Monaco 	Monako	\N
00040000-5578-18e6-e270-6b84d5369e79	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5578-18e6-71b0-9a7e4d3f3d4b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5578-18e6-12fc-b298bee5a601	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5578-18e6-5a25-732abe1ff405	MA	MAR	504	Morocco 	Maroko	\N
00040000-5578-18e6-f781-9d2f0b146ad8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5578-18e6-8b4c-87c28c43f68d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5578-18e6-0a25-dd4c9849c63c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5578-18e6-6b1b-2bc7ff0884fa	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5578-18e6-950a-c07abde8d3f3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5578-18e6-c145-715eb54d900d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5578-18e6-2742-9f2bab23520b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5578-18e6-ab5d-8e8be0385982	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5578-18e6-d5fa-d5ccec54d624	NE	NER	562	Niger 	Niger 	\N
00040000-5578-18e6-4c21-922f4cc9d07e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5578-18e6-9395-ca49c22811a4	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5578-18e6-70b6-a9c6bbc5e0cb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5578-18e6-0373-fb1beebdd282	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5578-18e6-0f27-579a6d913677	NO	NOR	578	Norway 	Norveška	\N
00040000-5578-18e6-076f-8244038243e1	OM	OMN	512	Oman 	Oman	\N
00040000-5578-18e6-b76c-140ef7bb72eb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5578-18e6-fded-9d6c1c543446	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5578-18e6-d4fa-0608c111c386	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5578-18e6-2f96-4d63c952310b	PA	PAN	591	Panama 	Panama	\N
00040000-5578-18e6-2433-06e021ab0515	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5578-18e6-0b54-e200796d8611	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5578-18e6-a303-6ceed7d4c057	PE	PER	604	Peru 	Peru	\N
00040000-5578-18e6-6d23-9e1d837e0676	PH	PHL	608	Philippines 	Filipini	\N
00040000-5578-18e6-a22d-f2d31d6a9f25	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5578-18e6-898e-f94f7f1e38e9	PL	POL	616	Poland 	Poljska	\N
00040000-5578-18e6-a0a7-ec17acea8b96	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5578-18e6-105a-c6bc4783eac6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5578-18e6-f231-9b144ac0a7d4	QA	QAT	634	Qatar 	Katar	\N
00040000-5578-18e6-086b-d56d0ef2c31d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5578-18e6-616a-78821b2bd667	RO	ROU	642	Romania 	Romunija	\N
00040000-5578-18e6-5075-63a65ff6b1a5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5578-18e6-219a-a759d38627b9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5578-18e6-8fbd-61f23e55f809	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5578-18e6-0983-73af64b0eba4	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5578-18e6-45d9-6e10fe0a22f8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5578-18e6-cf40-50a8416df780	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5578-18e6-d1d9-848323fa1ec5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5578-18e6-e337-484c4e319ef4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5578-18e6-8c8d-2e2d6d1f2d81	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5578-18e6-4dfb-511fdab6bc16	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5578-18e6-349e-92e94f5621d8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5578-18e6-1a8f-eab41261732a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5578-18e6-5ffd-f2b9eb4c6085	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5578-18e6-c8b3-bed8e1b064a1	SN	SEN	686	Senegal 	Senegal	\N
00040000-5578-18e6-7229-162ecf4167c3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5578-18e6-4c5e-bb9f49f8781f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5578-18e6-8614-b3cace7fec53	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5578-18e6-6bcf-95ae279429d3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5578-18e6-9cba-009b952da9ac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5578-18e6-89b9-f74f3014c69e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5578-18e6-98d5-b8839d247759	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5578-18e6-56ee-5632d59298d8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5578-18e6-acb0-61f275317eb3	SO	SOM	706	Somalia 	Somalija	\N
00040000-5578-18e6-870e-f1263d0e3044	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5578-18e6-c830-70578d2bf13c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5578-18e6-d58e-b480aaa3bff1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5578-18e6-e97c-658127044e23	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5578-18e6-6ca9-b4fa2fb82843	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5578-18e6-92a2-9c7c633578bc	SD	SDN	729	Sudan 	Sudan	\N
00040000-5578-18e6-6786-2bbf65afe5a4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5578-18e6-a453-4ff7f2339178	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5578-18e6-0316-e24dcd526925	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5578-18e6-e9cd-41aee5212077	SE	SWE	752	Sweden 	Švedska	\N
00040000-5578-18e6-41be-be9c5103f952	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5578-18e6-7dfa-2c8c9fb4cf62	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5578-18e6-1c83-cfaae6b79e3b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5578-18e6-c43c-7b9393fed00d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5578-18e6-7415-f8195e4645b7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5578-18e6-7a1c-d7452fe829e9	TH	THA	764	Thailand 	Tajska	\N
00040000-5578-18e6-167b-10fccc7b5ce6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5578-18e6-495c-b130fe5ebac7	TG	TGO	768	Togo 	Togo	\N
00040000-5578-18e6-ba1b-0a96df0437f1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5578-18e6-93c4-908786787115	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5578-18e6-00cd-e600193bd165	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5578-18e6-b67b-053da6e07002	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5578-18e6-9382-e8062830197a	TR	TUR	792	Turkey 	Turčija	\N
00040000-5578-18e6-0293-d94de94e66b7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5578-18e6-3a0d-ebceeefd1a51	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-18e6-c331-d32af2816e11	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5578-18e6-4dba-2d0ff9aaa89e	UG	UGA	800	Uganda 	Uganda	\N
00040000-5578-18e6-5443-9ed25bbdeafb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5578-18e6-2b62-64e6b391cc98	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5578-18e6-8aeb-65df1b43d593	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5578-18e6-9090-f89b2a7667ba	US	USA	840	United States 	Združene države Amerike	\N
00040000-5578-18e6-f1fd-12bb9c9e6a41	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5578-18e6-67cb-4e71e39a8409	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5578-18e6-e12a-ce5decc64d29	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5578-18e6-f9de-65941e545f51	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5578-18e6-996d-5e64b1db896c	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5578-18e6-a38f-1cb44fba7c30	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5578-18e6-1074-0cd8867eb362	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-18e6-4b71-5ffad359a168	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5578-18e6-19b0-6dab39182c19	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5578-18e6-9860-8b29c6e827dc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5578-18e6-424e-fe62614ed877	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5578-18e6-d696-a3dac1358ae5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5578-18e6-ab56-274e4b9b7724	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2851 (class 0 OID 6856326)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6856129)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5578-18e7-cb7b-7ad3e6ac57e5	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5578-18e6-affd-f024ab5ade79
000d0000-5578-18e7-ccee-3b79f75b00cb	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-18e6-affd-f024ab5ade79
000d0000-5578-18e7-d488-bc8f457cefa8	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5578-18e6-6141-f910e09ae683
000d0000-5578-18e7-ab56-77cd58106bb4	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5578-18e6-a6fa-ac84d6e789bc
000d0000-5578-18e7-53a8-092ed8c27689	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5578-18e6-a6fa-ac84d6e789bc
000d0000-5578-18e7-a97e-ecba1e33b5c0	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5578-18e6-a6fa-ac84d6e789bc
000d0000-5578-18e7-bf8a-16054f559b23	000e0000-5578-18e7-ac70-8b79f72f9d2f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-18e6-affd-f024ab5ade79
\.


--
-- TOC entry 2815 (class 0 OID 6855949)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6855997)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6855929)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5578-18e7-e0b2-99aa02abbcec	00080000-5578-18e7-5b94-36e120103d10	00090000-5578-18e7-8363-8236d3a85ef9	AK		
\.


--
-- TOC entry 2793 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6856046)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6856071)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6855886)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5578-18e6-2e6e-21cde7d2da10	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5578-18e6-7d92-a3f07597a23d	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5578-18e6-67c2-eff575311d82	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5578-18e6-c146-4a714a433e22	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5578-18e6-c8f4-0664b44c7695	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5578-18e6-1aa1-da916f0569dd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5578-18e6-1def-ab059e26490d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5578-18e6-18d8-6fc94c7913bc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5578-18e6-0477-8a59ad5e54d6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5578-18e6-d5f2-a16dd4aa530d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5578-18e6-5da8-9fdb0025d7bb	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5578-18e6-31ca-982922a27878	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5578-18e6-ad14-c845d4651eab	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-18e6-ba42-96f44aa7707b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-18e6-6058-ad8aeeef787e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5578-18e6-2fa6-8557cadf4654	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2804 (class 0 OID 6855799)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5578-18e6-b120-c413f3252a70	00000000-5578-18e6-c8f4-0664b44c7695	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5578-18e6-43d8-791b495c38e0	00000000-5578-18e6-c8f4-0664b44c7695	00010000-5578-18e6-494e-26b72f2c1fb9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5578-18e6-e03d-2ec8e39982c6	00000000-5578-18e6-1aa1-da916f0569dd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2805 (class 0 OID 6855810)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5578-18e7-337b-7524f0504588	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5578-18e7-9bc6-27a1644b8f71	00010000-5578-18e7-da23-dd139e3b2be6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5578-18e7-8750-fcde93cabc9e	00010000-5578-18e7-26fd-727e07fe8195	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5578-18e7-7ff1-fa635a1c4876	00010000-5578-18e7-747f-0d9b3f92384c	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5578-18e7-ecd8-39f42f76d656	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5578-18e7-65e3-1891241ebad5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5578-18e7-6433-989b033aa8fa	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5578-18e7-bd67-03f3728e4236	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5578-18e7-8363-8236d3a85ef9	00010000-5578-18e7-abae-5aeb6b688b67	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5578-18e7-79bc-f8429d99bd20	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5578-18e7-6ea9-296e2095b9f6	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5578-18e7-b5ce-ec31152f1772	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5578-18e7-01f9-91a619c580f9	00010000-5578-18e7-940b-6b8f8c1e2023	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2795 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6855764)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5578-18e6-91da-0bb239b1d8cc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5578-18e6-6d86-50518a8c7c92	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5578-18e6-68ab-cce7120cc49b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5578-18e6-87ad-1f8a76e81381	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5578-18e6-2ba0-fced217b7480	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5578-18e6-646f-24a9d8fade6a	Abonma-read	Abonma - branje	f
00030000-5578-18e6-3595-9e769d80b62e	Abonma-write	Abonma - spreminjanje	f
00030000-5578-18e6-68ee-270f1f65c65e	Alternacija-read	Alternacija - branje	f
00030000-5578-18e6-8760-706c76e86160	Alternacija-write	Alternacija - spreminjanje	f
00030000-5578-18e6-528d-13cee1b5c48c	Arhivalija-read	Arhivalija - branje	f
00030000-5578-18e6-512c-38ba0ac17740	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5578-18e6-6c6e-de951c9c53df	Besedilo-read	Besedilo - branje	f
00030000-5578-18e6-4b86-7c0a2161663c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5578-18e6-5ee0-1195d2750889	DogodekIzven-read	DogodekIzven - branje	f
00030000-5578-18e6-4767-7cc272634bcf	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5578-18e6-3702-921f1e49e41d	Dogodek-read	Dogodek - branje	f
00030000-5578-18e6-9fc3-6b6aee0916b8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5578-18e6-a029-be0b1583e250	Drzava-read	Drzava - branje	f
00030000-5578-18e6-e486-dfb0f1929e8f	Drzava-write	Drzava - spreminjanje	f
00030000-5578-18e6-12bd-2cba0258b8b9	Funkcija-read	Funkcija - branje	f
00030000-5578-18e6-3ef9-0f0552d837a8	Funkcija-write	Funkcija - spreminjanje	f
00030000-5578-18e6-78f4-2032392b8ed7	Gostovanje-read	Gostovanje - branje	f
00030000-5578-18e6-6b3a-cd14f29f4a14	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5578-18e6-6a0d-81bc057a12f9	Gostujoca-read	Gostujoca - branje	f
00030000-5578-18e6-4915-529eedda14b3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5578-18e6-8cac-ae5fe79703a8	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5578-18e6-e8ff-bb469146c51e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5578-18e6-ee16-03c5cc53904f	Kupec-read	Kupec - branje	f
00030000-5578-18e6-8a13-c2f6362a9c94	Kupec-write	Kupec - spreminjanje	f
00030000-5578-18e6-3b6a-6563de5fa1ef	NacinPlacina-read	NacinPlacina - branje	f
00030000-5578-18e6-b883-f700c21e04dd	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5578-18e6-9190-d6848fd2703b	Option-read	Option - branje	f
00030000-5578-18e6-6efd-93566fc9aa61	Option-write	Option - spreminjanje	f
00030000-5578-18e6-51d3-49bdc2bd63c3	OptionValue-read	OptionValue - branje	f
00030000-5578-18e6-8e33-ec7747b4827f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5578-18e6-7d6b-86817887bd10	Oseba-read	Oseba - branje	f
00030000-5578-18e6-448e-2ba32ba23d46	Oseba-write	Oseba - spreminjanje	f
00030000-5578-18e6-c8c1-8b5fb080e2f5	Permission-read	Permission - branje	f
00030000-5578-18e6-e96a-be8fbfd2e154	Permission-write	Permission - spreminjanje	f
00030000-5578-18e6-40c6-91f2396a6143	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5578-18e6-a75e-c69a2e09260e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5578-18e6-6cc0-d191be8be06a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5578-18e6-1c8e-0083f3edbfae	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5578-18e6-0109-1ef72e821eff	Pogodba-read	Pogodba - branje	f
00030000-5578-18e6-49ae-b07185e11611	Pogodba-write	Pogodba - spreminjanje	f
00030000-5578-18e6-1a09-d54beee2c75c	Popa-read	Popa - branje	f
00030000-5578-18e6-a8ef-145e594a9771	Popa-write	Popa - spreminjanje	f
00030000-5578-18e6-0506-a95d205876a9	Posta-read	Posta - branje	f
00030000-5578-18e6-db98-493f47b233c1	Posta-write	Posta - spreminjanje	f
00030000-5578-18e6-21f0-33584963c1e8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5578-18e6-aaf7-8d18f549513b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5578-18e6-9dfc-35ee0570915c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5578-18e6-85d0-19defa1d58b9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5578-18e6-aacc-50d6a909e18a	Predstava-read	Predstava - branje	f
00030000-5578-18e6-dec4-76da9257691c	Predstava-write	Predstava - spreminjanje	f
00030000-5578-18e6-0f98-63a8b286c508	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5578-18e6-ba55-a848da297414	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5578-18e6-9f93-0a94a3c14a42	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5578-18e6-2890-1bed2b0395ce	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5578-18e6-f274-9849ae39cdeb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5578-18e6-d5b5-8eb56cdc9521	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5578-18e6-7eb6-077c93586181	ProgramDela-read	ProgramDela - branje	f
00030000-5578-18e6-9789-c5ba3ba8331c	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5578-18e6-432e-7060505cd957	ProgramFestival-read	ProgramFestival - branje	f
00030000-5578-18e6-be84-56494d4f8a83	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5578-18e6-20e5-0272f4ce1e79	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5578-18e6-f434-469f83d90cd1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5578-18e6-5d54-88afc94a4cf0	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5578-18e6-c186-992c8a951d77	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5578-18e6-f163-c6cd4861bdf4	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5578-18e6-9dfc-b31aa2024e0d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5578-18e6-1b19-f5e3733ba604	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5578-18e6-9b77-9d048b57cfe3	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5578-18e6-95fa-c18931a36f71	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5578-18e6-a8e9-674942fe9377	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5578-18e6-6f0e-b970fd53c4bf	Prostor-read	Prostor - branje	f
00030000-5578-18e6-617e-cc07d427974d	Prostor-write	Prostor - spreminjanje	f
00030000-5578-18e6-2429-ed72cbc59e01	Racun-read	Racun - branje	f
00030000-5578-18e6-7017-f3ce6fd2a459	Racun-write	Racun - spreminjanje	f
00030000-5578-18e6-509f-34894b8f5577	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5578-18e6-55b7-c4494ea18ebc	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5578-18e6-af6e-cba66f998c41	Readme-read	Readme - branje	f
00030000-5578-18e6-d869-3c12fe6262eb	Readme-write	Readme - spreminjanje	f
00030000-5578-18e6-bee9-51106ba52982	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5578-18e6-9137-392de8451a46	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5578-18e6-4af3-e0ee528ea47e	Rekvizit-read	Rekvizit - branje	f
00030000-5578-18e6-044e-4fa064a82c3a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5578-18e6-9a95-66d7999ad38c	Revizija-read	Revizija - branje	f
00030000-5578-18e6-4e40-094dc30bcdc6	Revizija-write	Revizija - spreminjanje	f
00030000-5578-18e6-3ad2-ee9ceae77fb5	Rezervacija-read	Rezervacija - branje	f
00030000-5578-18e6-937b-27c487f5f8bb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5578-18e6-8396-341159071b0b	Role-read	Role - branje	f
00030000-5578-18e6-6b46-f028c486218b	Role-write	Role - spreminjanje	f
00030000-5578-18e6-b277-c79d7584cd9e	SedezniRed-read	SedezniRed - branje	f
00030000-5578-18e6-3cd8-76cbfdca503c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5578-18e6-dd50-27429337099a	Sedez-read	Sedez - branje	f
00030000-5578-18e6-71fa-57f53e4f0262	Sedez-write	Sedez - spreminjanje	f
00030000-5578-18e6-6183-49a16c5ca178	Sezona-read	Sezona - branje	f
00030000-5578-18e6-fb44-38854f5e0743	Sezona-write	Sezona - spreminjanje	f
00030000-5578-18e6-5950-1d6a8bfe2462	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5578-18e6-b887-b9f089c1aa5c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5578-18e6-c909-7c252ec096b1	Stevilcenje-read	Stevilcenje - branje	f
00030000-5578-18e6-d12f-871cb44170ce	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5578-18e6-a6bd-3283511a47da	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5578-18e6-649b-5988461eeac6	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5578-18e6-7c46-63f62c95aef6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5578-18e6-b69a-e5d4636d1f3b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5578-18e6-304b-c8f79653f29b	Telefonska-read	Telefonska - branje	f
00030000-5578-18e6-ebea-8d88f9cf5cf1	Telefonska-write	Telefonska - spreminjanje	f
00030000-5578-18e6-5a82-4beed082cfd6	TerminStoritve-read	TerminStoritve - branje	f
00030000-5578-18e6-37bb-5ce25b9c8aeb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5578-18e6-4a58-fa169023dec7	TipFunkcije-read	TipFunkcije - branje	f
00030000-5578-18e6-dda1-94acd09fda5e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5578-18e6-0565-7d33c67d851f	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5578-18e6-eaaa-5217d71f3b27	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5578-18e6-351c-2ce8c29de758	Trr-read	Trr - branje	f
00030000-5578-18e6-6256-44750ccc44c6	Trr-write	Trr - spreminjanje	f
00030000-5578-18e6-78c2-03a9c629b67e	Uprizoritev-read	Uprizoritev - branje	f
00030000-5578-18e6-4ae8-920e99fbff24	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5578-18e6-288d-1abcacb061b4	User-read	User - branje	f
00030000-5578-18e6-4865-fd0c1ebc8786	User-write	User - spreminjanje	f
00030000-5578-18e6-84c1-1d5438922656	Vaja-read	Vaja - branje	f
00030000-5578-18e6-99f7-38d5ef2e4e32	Vaja-write	Vaja - spreminjanje	f
00030000-5578-18e6-b1c2-d4b48d0362b5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5578-18e6-24a2-d1edee5adbb5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5578-18e6-2474-1f5fb5b748ce	Zaposlitev-read	Zaposlitev - branje	f
00030000-5578-18e6-8458-cd27a5eca464	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5578-18e6-2d46-cdce95d1c6ff	Zasedenost-read	Zasedenost - branje	f
00030000-5578-18e6-b4fa-f791fb3b5211	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5578-18e6-7bb9-645d01fbb329	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5578-18e6-f3c9-5e777778c737	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5578-18e6-b09f-d9c1a4078775	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5578-18e6-5a19-522c2acb1a12	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2802 (class 0 OID 6855783)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5578-18e6-39d2-6fef2a1f98b0	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-646f-24a9d8fade6a
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-3595-9e769d80b62e
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-68ee-270f1f65c65e
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-8760-706c76e86160
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-528d-13cee1b5c48c
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-3702-921f1e49e41d
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-87ad-1f8a76e81381
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-9fc3-6b6aee0916b8
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-e486-dfb0f1929e8f
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-12bd-2cba0258b8b9
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-3ef9-0f0552d837a8
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-78f4-2032392b8ed7
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-6b3a-cd14f29f4a14
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-6a0d-81bc057a12f9
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-4915-529eedda14b3
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-8cac-ae5fe79703a8
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-e8ff-bb469146c51e
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-9190-d6848fd2703b
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-51d3-49bdc2bd63c3
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-7d6b-86817887bd10
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-448e-2ba32ba23d46
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-1a09-d54beee2c75c
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-a8ef-145e594a9771
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-0506-a95d205876a9
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-db98-493f47b233c1
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-9dfc-35ee0570915c
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-85d0-19defa1d58b9
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-aacc-50d6a909e18a
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-dec4-76da9257691c
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-f274-9849ae39cdeb
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-d5b5-8eb56cdc9521
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-6f0e-b970fd53c4bf
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-617e-cc07d427974d
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-bee9-51106ba52982
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-9137-392de8451a46
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-4af3-e0ee528ea47e
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-044e-4fa064a82c3a
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-6183-49a16c5ca178
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-fb44-38854f5e0743
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-4a58-fa169023dec7
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-78c2-03a9c629b67e
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-4ae8-920e99fbff24
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-84c1-1d5438922656
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-99f7-38d5ef2e4e32
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-2d46-cdce95d1c6ff
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-b4fa-f791fb3b5211
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-7bb9-645d01fbb329
00020000-5578-18e6-2f91-589bd9244c08	00030000-5578-18e6-b09f-d9c1a4078775
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-646f-24a9d8fade6a
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-528d-13cee1b5c48c
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-3702-921f1e49e41d
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-78f4-2032392b8ed7
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-6a0d-81bc057a12f9
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-8cac-ae5fe79703a8
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-e8ff-bb469146c51e
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-9190-d6848fd2703b
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-51d3-49bdc2bd63c3
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-7d6b-86817887bd10
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-448e-2ba32ba23d46
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-1a09-d54beee2c75c
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-0506-a95d205876a9
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-9dfc-35ee0570915c
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-85d0-19defa1d58b9
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-aacc-50d6a909e18a
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-6f0e-b970fd53c4bf
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-bee9-51106ba52982
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-4af3-e0ee528ea47e
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-6183-49a16c5ca178
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-304b-c8f79653f29b
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-ebea-8d88f9cf5cf1
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-351c-2ce8c29de758
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-6256-44750ccc44c6
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-2474-1f5fb5b748ce
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-8458-cd27a5eca464
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-7bb9-645d01fbb329
00020000-5578-18e6-c8c3-058b8fa94383	00030000-5578-18e6-b09f-d9c1a4078775
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-646f-24a9d8fade6a
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-68ee-270f1f65c65e
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-528d-13cee1b5c48c
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-512c-38ba0ac17740
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-6c6e-de951c9c53df
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-5ee0-1195d2750889
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-3702-921f1e49e41d
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-12bd-2cba0258b8b9
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-78f4-2032392b8ed7
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-6a0d-81bc057a12f9
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-8cac-ae5fe79703a8
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-9190-d6848fd2703b
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-51d3-49bdc2bd63c3
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-7d6b-86817887bd10
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-1a09-d54beee2c75c
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-0506-a95d205876a9
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-aacc-50d6a909e18a
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-f274-9849ae39cdeb
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-6f0e-b970fd53c4bf
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-bee9-51106ba52982
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-4af3-e0ee528ea47e
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-6183-49a16c5ca178
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-4a58-fa169023dec7
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-84c1-1d5438922656
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-2d46-cdce95d1c6ff
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-7bb9-645d01fbb329
00020000-5578-18e6-2e4d-00c21192d8a4	00030000-5578-18e6-b09f-d9c1a4078775
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-646f-24a9d8fade6a
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-3595-9e769d80b62e
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-8760-706c76e86160
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-528d-13cee1b5c48c
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-3702-921f1e49e41d
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-78f4-2032392b8ed7
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-6a0d-81bc057a12f9
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-9190-d6848fd2703b
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-51d3-49bdc2bd63c3
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-1a09-d54beee2c75c
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-0506-a95d205876a9
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-aacc-50d6a909e18a
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-6f0e-b970fd53c4bf
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-bee9-51106ba52982
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-4af3-e0ee528ea47e
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-6183-49a16c5ca178
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-4a58-fa169023dec7
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-7bb9-645d01fbb329
00020000-5578-18e6-2c1f-29987ae92bb7	00030000-5578-18e6-b09f-d9c1a4078775
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-646f-24a9d8fade6a
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-528d-13cee1b5c48c
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-3702-921f1e49e41d
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-a029-be0b1583e250
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-78f4-2032392b8ed7
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-6a0d-81bc057a12f9
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-9190-d6848fd2703b
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-51d3-49bdc2bd63c3
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-1a09-d54beee2c75c
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-0506-a95d205876a9
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-aacc-50d6a909e18a
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-6f0e-b970fd53c4bf
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-bee9-51106ba52982
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-4af3-e0ee528ea47e
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-6183-49a16c5ca178
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-5a82-4beed082cfd6
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-68ab-cce7120cc49b
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-4a58-fa169023dec7
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-7bb9-645d01fbb329
00020000-5578-18e6-e070-f0660d6909d4	00030000-5578-18e6-b09f-d9c1a4078775
\.


--
-- TOC entry 2830 (class 0 OID 6856078)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6856109)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6856245)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6855843)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5578-18e7-5b94-36e120103d10	00040000-5578-18e6-d803-f7f69d2f9555	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-18e7-ac60-d86646d26c5b	00040000-5578-18e6-d803-f7f69d2f9555	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-18e7-0e07-ebaef4b6a8c0	00040000-5578-18e6-d803-f7f69d2f9555	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-18e7-2aa6-266b31287f60	00040000-5578-18e6-d803-f7f69d2f9555	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2809 (class 0 OID 6855878)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5578-18e5-b29a-747164a637e4	8341	Adlešiči
00050000-5578-18e5-6c22-7015d0cbe4fd	5270	Ajdovščina
00050000-5578-18e5-6b09-bb35a266b569	6280	Ankaran/Ancarano
00050000-5578-18e5-c5c0-fdf5c683cee8	9253	Apače
00050000-5578-18e5-8516-5b562b024207	8253	Artiče
00050000-5578-18e5-98aa-cf8db641d78b	4275	Begunje na Gorenjskem
00050000-5578-18e5-d403-93971b4f15a9	1382	Begunje pri Cerknici
00050000-5578-18e5-813c-b2c16accec02	9231	Beltinci
00050000-5578-18e5-de2c-8a22314b6d75	2234	Benedikt
00050000-5578-18e5-a875-2643fdf59528	2345	Bistrica ob Dravi
00050000-5578-18e5-67da-cba3d06e2add	3256	Bistrica ob Sotli
00050000-5578-18e5-0db9-2815f43d933a	8259	Bizeljsko
00050000-5578-18e5-293b-3b67bdaa6154	1223	Blagovica
00050000-5578-18e5-71f5-164c959e118f	8283	Blanca
00050000-5578-18e5-6572-e3e9a6f5d3eb	4260	Bled
00050000-5578-18e5-8d4e-ffdc8ca09e4e	4273	Blejska Dobrava
00050000-5578-18e5-c641-da78b98f675f	9265	Bodonci
00050000-5578-18e5-b380-6193cb7e7a25	9222	Bogojina
00050000-5578-18e5-d812-b7ce036af1cb	4263	Bohinjska Bela
00050000-5578-18e5-657e-ca08d2a4ba4a	4264	Bohinjska Bistrica
00050000-5578-18e5-e8dd-704d3543bde9	4265	Bohinjsko jezero
00050000-5578-18e5-4fdb-26f47ce34f10	1353	Borovnica
00050000-5578-18e5-18d7-da3dcd9458c6	8294	Boštanj
00050000-5578-18e5-6d4d-ecf85fa89fcd	5230	Bovec
00050000-5578-18e5-dcc7-8bd5bd3cd0a3	5295	Branik
00050000-5578-18e5-c40d-8a36e817018d	3314	Braslovče
00050000-5578-18e5-ff0e-3b5e36582899	5223	Breginj
00050000-5578-18e5-d034-50c2c3a55137	8280	Brestanica
00050000-5578-18e5-4828-13793bc9b623	2354	Bresternica
00050000-5578-18e5-2d31-d09f8aae711e	4243	Brezje
00050000-5578-18e5-292f-af71183bdaae	1351	Brezovica pri Ljubljani
00050000-5578-18e5-5537-1bc906744cdc	8250	Brežice
00050000-5578-18e5-f268-28a8e0fbe4f3	4210	Brnik - Aerodrom
00050000-5578-18e5-c032-d13c22e3a0c4	8321	Brusnice
00050000-5578-18e5-886e-0ab723bfdb18	3255	Buče
00050000-5578-18e5-81ce-d7343cc0d702	8276	Bučka 
00050000-5578-18e5-544d-55b4d13631f5	9261	Cankova
00050000-5578-18e5-1c50-96e8541dd6d1	3000	Celje 
00050000-5578-18e5-bc38-3ae8a19a6daf	3001	Celje - poštni predali
00050000-5578-18e5-00d7-5de74dee6cd5	4207	Cerklje na Gorenjskem
00050000-5578-18e5-097e-a05255684bb9	8263	Cerklje ob Krki
00050000-5578-18e5-8f88-18e923fe0ccf	1380	Cerknica
00050000-5578-18e5-c029-7fa29eb12b33	5282	Cerkno
00050000-5578-18e5-21f7-668326b5fd01	2236	Cerkvenjak
00050000-5578-18e5-5fa8-5e716e313268	2215	Ceršak
00050000-5578-18e5-e71c-71a8bb4fd7d5	2326	Cirkovce
00050000-5578-18e5-1bac-84b8ef017850	2282	Cirkulane
00050000-5578-18e5-d106-95954fec4fac	5273	Col
00050000-5578-18e5-3636-b71327e391d6	8251	Čatež ob Savi
00050000-5578-18e5-43cd-ff1482d06eef	1413	Čemšenik
00050000-5578-18e5-c818-136a647238e7	5253	Čepovan
00050000-5578-18e5-0100-91841c289c71	9232	Črenšovci
00050000-5578-18e5-fcdc-0bab6396e676	2393	Črna na Koroškem
00050000-5578-18e5-5f5f-cbea8cc32756	6275	Črni Kal
00050000-5578-18e5-3a00-e4cff70e7189	5274	Črni Vrh nad Idrijo
00050000-5578-18e5-1fbe-b5b2e630f0d7	5262	Črniče
00050000-5578-18e5-b404-0eec8c659ada	8340	Črnomelj
00050000-5578-18e5-8656-c4b2579ef4a9	6271	Dekani
00050000-5578-18e5-b471-d1ea245b2854	5210	Deskle
00050000-5578-18e5-48da-48a15af5de40	2253	Destrnik
00050000-5578-18e5-f1c0-929e5a36054f	6215	Divača
00050000-5578-18e5-3cda-a9c3b818fc1f	1233	Dob
00050000-5578-18e5-4aab-0a8f1e396dc4	3224	Dobje pri Planini
00050000-5578-18e5-e2bf-c694b28c6de7	8257	Dobova
00050000-5578-18e5-abca-eea084c28861	1423	Dobovec
00050000-5578-18e5-cfc2-fc47cd026a07	5263	Dobravlje
00050000-5578-18e5-1f97-faf2f5d114e2	3204	Dobrna
00050000-5578-18e5-2d01-2842f3d74414	8211	Dobrnič
00050000-5578-18e5-ba04-bc17722c4d4d	1356	Dobrova
00050000-5578-18e5-d7c3-70af26985316	9223	Dobrovnik/Dobronak 
00050000-5578-18e5-b977-572c254f5034	5212	Dobrovo v Brdih
00050000-5578-18e5-617c-8ed5fdaa6d65	1431	Dol pri Hrastniku
00050000-5578-18e5-62ff-631bd3b8b5df	1262	Dol pri Ljubljani
00050000-5578-18e5-5a11-0312f3558cc1	1273	Dole pri Litiji
00050000-5578-18e5-4065-d3ee5cf263e7	1331	Dolenja vas
00050000-5578-18e5-c0e9-13b9ce423a69	8350	Dolenjske Toplice
00050000-5578-18e5-df2d-3458c93e4dd5	1230	Domžale
00050000-5578-18e5-7ce2-26d6b377cea0	2252	Dornava
00050000-5578-18e5-34f9-41e20c1cc1eb	5294	Dornberk
00050000-5578-18e5-7488-055785ed6042	1319	Draga
00050000-5578-18e5-e30e-349dc76279c9	8343	Dragatuš
00050000-5578-18e5-4326-627b326dabed	3222	Dramlje
00050000-5578-18e5-5e7c-fef6a2af20e0	2370	Dravograd
00050000-5578-18e5-ffe6-ef7f8b476fc0	4203	Duplje
00050000-5578-18e5-9e7b-7b6f941f3930	6221	Dutovlje
00050000-5578-18e5-94c5-a47c12dc3364	8361	Dvor
00050000-5578-18e5-6c35-8c10097f8f0b	2343	Fala
00050000-5578-18e5-65a9-35720b4e7e8a	9208	Fokovci
00050000-5578-18e5-4944-153383c4ae03	2313	Fram
00050000-5578-18e5-83a4-63cca6af29d1	3213	Frankolovo
00050000-5578-18e5-99d6-f23df4f1929c	1274	Gabrovka
00050000-5578-18e5-5a71-15c1cbc62ee5	8254	Globoko
00050000-5578-18e5-e6b0-54eec4660c33	5275	Godovič
00050000-5578-18e5-3b80-81cf28c7e5d2	4204	Golnik
00050000-5578-18e5-8790-0bb20ec94500	3303	Gomilsko
00050000-5578-18e5-3492-0742e4236cef	4224	Gorenja vas
00050000-5578-18e5-3e84-285c53539a46	3263	Gorica pri Slivnici
00050000-5578-18e5-92e6-9a8e7490976d	2272	Gorišnica
00050000-5578-18e5-c048-86aad6082e8a	9250	Gornja Radgona
00050000-5578-18e5-98e3-f4402a69ecad	3342	Gornji Grad
00050000-5578-18e5-483d-47d3af49729b	4282	Gozd Martuljek
00050000-5578-18e5-c4da-a14863b7527f	6272	Gračišče
00050000-5578-18e5-020b-278f0255384f	9264	Grad
00050000-5578-18e5-c44a-ff7fcfe6e608	8332	Gradac
00050000-5578-18e5-5700-f5d80f40139d	1384	Grahovo
00050000-5578-18e5-11f2-82b2d92d5928	5242	Grahovo ob Bači
00050000-5578-18e5-6065-6f4582e69fbf	5251	Grgar
00050000-5578-18e5-d5d3-8e597aa40250	3302	Griže
00050000-5578-18e5-6ff3-f6a80a4ae793	3231	Grobelno
00050000-5578-18e5-a196-7b9eb4570bae	1290	Grosuplje
00050000-5578-18e5-e37d-fea29c045949	2288	Hajdina
00050000-5578-18e5-d07b-991ee75b53e5	8362	Hinje
00050000-5578-18e5-08f2-a7e2823946ba	2311	Hoče
00050000-5578-18e5-18af-dcc36560e25d	9205	Hodoš/Hodos
00050000-5578-18e5-08cf-1725b0d535be	1354	Horjul
00050000-5578-18e5-494a-57df6ab2edd1	1372	Hotedršica
00050000-5578-18e5-b3c9-8e2a3a629074	1430	Hrastnik
00050000-5578-18e5-9272-9fb70d0dcf59	6225	Hruševje
00050000-5578-18e5-3bb6-90e375abba33	4276	Hrušica
00050000-5578-18e5-62c5-0ee5f6215a98	5280	Idrija
00050000-5578-18e5-45b4-37b72322d13c	1292	Ig
00050000-5578-18e5-ede6-75a8b5282959	6250	Ilirska Bistrica
00050000-5578-18e5-be91-c390c69dbb8a	6251	Ilirska Bistrica-Trnovo
00050000-5578-18e5-dd0d-a7f1441dbd6b	1295	Ivančna Gorica
00050000-5578-18e5-df7f-98701bfa44f2	2259	Ivanjkovci
00050000-5578-18e5-99e0-57eb83529478	1411	Izlake
00050000-5578-18e5-1b27-9475001a7364	6310	Izola/Isola
00050000-5578-18e5-b862-7b29a256df54	2222	Jakobski Dol
00050000-5578-18e5-50eb-41c163692595	2221	Jarenina
00050000-5578-18e5-977a-9babf8b733d4	6254	Jelšane
00050000-5578-18e5-7a06-4d5d329c22ac	4270	Jesenice
00050000-5578-18e5-f05a-84b32d368103	8261	Jesenice na Dolenjskem
00050000-5578-18e5-5bf8-d71f6f21c9dd	3273	Jurklošter
00050000-5578-18e5-7843-1651d72af5b8	2223	Jurovski Dol
00050000-5578-18e5-029c-0acc3317f483	2256	Juršinci
00050000-5578-18e5-6226-564536d3af3b	5214	Kal nad Kanalom
00050000-5578-18e5-3ddd-3d6d816cfff6	3233	Kalobje
00050000-5578-18e5-9f22-3dc4815f354f	4246	Kamna Gorica
00050000-5578-18e5-ebb4-bd53d0b85350	2351	Kamnica
00050000-5578-18e5-1e2f-654290524c64	1241	Kamnik
00050000-5578-18e5-0ad4-38dab20e363a	5213	Kanal
00050000-5578-18e5-b9bb-d76d78f71576	8258	Kapele
00050000-5578-18e5-b557-1d35d98fe89e	2362	Kapla
00050000-5578-18e5-f980-2e0f961311b1	2325	Kidričevo
00050000-5578-18e5-39f2-8b29f6b9fba9	1412	Kisovec
00050000-5578-18e5-2a91-1ae45a1a7b86	6253	Knežak
00050000-5578-18e5-f076-60d74dba63f1	5222	Kobarid
00050000-5578-18e5-8438-80ac914b0500	9227	Kobilje
00050000-5578-18e5-7324-9dde8825d5ac	1330	Kočevje
00050000-5578-18e5-ad04-1434003de3ff	1338	Kočevska Reka
00050000-5578-18e5-13b6-6f5503858a6c	2276	Kog
00050000-5578-18e5-709b-174cd7330d86	5211	Kojsko
00050000-5578-18e5-5f73-6af7b221802b	6223	Komen
00050000-5578-18e5-5805-0f2e4545592e	1218	Komenda
00050000-5578-18e5-1672-1b084112e25b	6000	Koper/Capodistria 
00050000-5578-18e5-e072-018a2e68cfb3	6001	Koper/Capodistria - poštni predali
00050000-5578-18e5-2803-af45044ebb78	8282	Koprivnica
00050000-5578-18e5-442a-a7c65ba397bb	5296	Kostanjevica na Krasu
00050000-5578-18e5-2417-de0c6281c7e6	8311	Kostanjevica na Krki
00050000-5578-18e5-7a5f-ae44b514202c	1336	Kostel
00050000-5578-18e5-11c4-ac28a0d9c9c0	6256	Košana
00050000-5578-18e5-8dc3-76f21b5a7b1c	2394	Kotlje
00050000-5578-18e5-9587-0f0aa69e2c94	6240	Kozina
00050000-5578-18e5-c340-4f934ef0f663	3260	Kozje
00050000-5578-18e5-0942-7dc3675785f2	4000	Kranj 
00050000-5578-18e5-de96-e0f6812792aa	4001	Kranj - poštni predali
00050000-5578-18e5-a595-2abd907a75c5	4280	Kranjska Gora
00050000-5578-18e5-0242-b14c6692f7be	1281	Kresnice
00050000-5578-18e5-2d3a-8c15e7673362	4294	Križe
00050000-5578-18e5-873f-65b0450a1eb7	9206	Križevci
00050000-5578-18e5-d405-f3cf3ec83ebd	9242	Križevci pri Ljutomeru
00050000-5578-18e5-e7c0-150c10f7067c	1301	Krka
00050000-5578-18e5-c1a4-43a6ca1c6bf3	8296	Krmelj
00050000-5578-18e5-d3a0-cdd3e4d613ce	4245	Kropa
00050000-5578-18e5-0cb7-de3c7bf9c218	8262	Krška vas
00050000-5578-18e5-55d2-a3ec6e655f8b	8270	Krško
00050000-5578-18e5-799d-e545d2884c8f	9263	Kuzma
00050000-5578-18e5-204c-f2062496b9b9	2318	Laporje
00050000-5578-18e5-d7a2-720d1dd3ba33	3270	Laško
00050000-5578-18e5-ea08-bc6f96f81c58	1219	Laze v Tuhinju
00050000-5578-18e5-f279-27b797dae135	2230	Lenart v Slovenskih goricah
00050000-5578-18e5-2841-0a202644c94f	9220	Lendava/Lendva
00050000-5578-18e5-94ed-21ce760df8bd	4248	Lesce
00050000-5578-18e5-f0cd-e870672dba77	3261	Lesično
00050000-5578-18e5-a0cc-825ba9a82e93	8273	Leskovec pri Krškem
00050000-5578-18e5-8ec9-39d8d1c02ccf	2372	Libeliče
00050000-5578-18e5-5723-fc7880715732	2341	Limbuš
00050000-5578-18e5-3ff5-6f732d744bad	1270	Litija
00050000-5578-18e5-042c-86d814db9486	3202	Ljubečna
00050000-5578-18e5-0490-685b8633c225	1000	Ljubljana 
00050000-5578-18e5-9bd1-bf97845739c2	1001	Ljubljana - poštni predali
00050000-5578-18e5-9572-25b010dc9ebf	1231	Ljubljana - Črnuče
00050000-5578-18e5-63c2-a285eee7897a	1261	Ljubljana - Dobrunje
00050000-5578-18e5-0ee0-d456d380ce3d	1260	Ljubljana - Polje
00050000-5578-18e5-5ae7-264e4b4a5362	1210	Ljubljana - Šentvid
00050000-5578-18e5-12ec-d9e9c32afedb	1211	Ljubljana - Šmartno
00050000-5578-18e5-9d16-c333c33872cd	3333	Ljubno ob Savinji
00050000-5578-18e5-b0a4-64c32c575994	9240	Ljutomer
00050000-5578-18e5-30dc-4c64a4546949	3215	Loče
00050000-5578-18e5-f4f1-9ed8e20afb6d	5231	Log pod Mangartom
00050000-5578-18e5-c12c-1fd22cbe36d3	1358	Log pri Brezovici
00050000-5578-18e5-8aa5-d41bd476b327	1370	Logatec
00050000-5578-18e5-139a-d51656bf6029	1371	Logatec
00050000-5578-18e5-4300-1630f9798e6f	1434	Loka pri Zidanem Mostu
00050000-5578-18e5-5baa-184b36b12e70	3223	Loka pri Žusmu
00050000-5578-18e5-7d06-6357f5e9ea3f	6219	Lokev
00050000-5578-18e5-75c1-dad50203e001	1318	Loški Potok
00050000-5578-18e5-266c-0b1937d883ac	2324	Lovrenc na Dravskem polju
00050000-5578-18e5-9b89-c7c142993b75	2344	Lovrenc na Pohorju
00050000-5578-18e5-d031-a44a3ead580a	3334	Luče
00050000-5578-18e5-c2ae-abfac1dcde34	1225	Lukovica
00050000-5578-18e5-15dc-11af59cc38e0	9202	Mačkovci
00050000-5578-18e5-a167-517b94461b15	2322	Majšperk
00050000-5578-18e5-9744-3ab6cf0f6cca	2321	Makole
00050000-5578-18e5-130e-72bfd7a07929	9243	Mala Nedelja
00050000-5578-18e5-6b1e-0c07b2bc11de	2229	Malečnik
00050000-5578-18e5-6662-9d53c7aa1ae5	6273	Marezige
00050000-5578-18e5-2821-0960d8a9361e	2000	Maribor 
00050000-5578-18e5-6af9-7a39ababfc33	2001	Maribor - poštni predali
00050000-5578-18e5-6791-5ffb756dd551	2206	Marjeta na Dravskem polju
00050000-5578-18e5-0349-6b6782b69ab8	2281	Markovci
00050000-5578-18e5-4494-cae8d3b7a6d5	9221	Martjanci
00050000-5578-18e5-86f4-28f366014da5	6242	Materija
00050000-5578-18e5-0b33-575e3cc82a36	4211	Mavčiče
00050000-5578-18e5-c438-d6a0d55c1c9f	1215	Medvode
00050000-5578-18e5-b29e-252cf6569a34	1234	Mengeš
00050000-5578-18e5-fc26-d315979976dc	8330	Metlika
00050000-5578-18e5-d63c-a6084bd80036	2392	Mežica
00050000-5578-18e5-fa3a-fc7bfd18cc82	2204	Miklavž na Dravskem polju
00050000-5578-18e5-4e0c-10197f8c3427	2275	Miklavž pri Ormožu
00050000-5578-18e5-ff19-44e3f18e28fb	5291	Miren
00050000-5578-18e5-e895-b1f6c9414521	8233	Mirna
00050000-5578-18e5-b5e1-ad75782eae64	8216	Mirna Peč
00050000-5578-18e5-1a95-cba8dcc524de	2382	Mislinja
00050000-5578-18e5-5d45-dc22a55e1a4d	4281	Mojstrana
00050000-5578-18e5-68a9-29154bb43e05	8230	Mokronog
00050000-5578-18e5-6538-cc2f98ac1bd7	1251	Moravče
00050000-5578-18e5-e362-8a4a9c1a694c	9226	Moravske Toplice
00050000-5578-18e5-fcab-98812f1c4d13	5216	Most na Soči
00050000-5578-18e5-1fea-c1f5e1e4a0f9	1221	Motnik
00050000-5578-18e5-5c88-73f2c6e97eb9	3330	Mozirje
00050000-5578-18e5-b6a2-84915dfe6dc4	9000	Murska Sobota 
00050000-5578-18e5-0b9f-3b073a4286f9	9001	Murska Sobota - poštni predali
00050000-5578-18e5-c36d-cad75cd19a9f	2366	Muta
00050000-5578-18e5-c3d9-9db362a8fe2f	4202	Naklo
00050000-5578-18e5-ddfb-499df93f2879	3331	Nazarje
00050000-5578-18e5-d336-1a424d3b1075	1357	Notranje Gorice
00050000-5578-18e5-e5d2-29335a194413	3203	Nova Cerkev
00050000-5578-18e5-0745-7b585413d1d1	5000	Nova Gorica 
00050000-5578-18e5-f24e-08861aedba52	5001	Nova Gorica - poštni predali
00050000-5578-18e5-3337-d362a30fcb0a	1385	Nova vas
00050000-5578-18e5-487f-29f21deb3ede	8000	Novo mesto
00050000-5578-18e5-c7f8-f33ae99b4765	8001	Novo mesto - poštni predali
00050000-5578-18e5-0fb1-f63289874e73	6243	Obrov
00050000-5578-18e6-47f4-937477e24427	9233	Odranci
00050000-5578-18e6-96ea-723f33707498	2317	Oplotnica
00050000-5578-18e6-1f64-bcac044589eb	2312	Orehova vas
00050000-5578-18e6-aeac-87555e109b72	2270	Ormož
00050000-5578-18e6-3548-e38a8d3f79bc	1316	Ortnek
00050000-5578-18e6-45bc-0e1e62e469e3	1337	Osilnica
00050000-5578-18e6-8264-26e2a8faa065	8222	Otočec
00050000-5578-18e6-6c98-08a63b496cc3	2361	Ožbalt
00050000-5578-18e6-529a-104a91a11fa3	2231	Pernica
00050000-5578-18e6-ada1-14a1ced00814	2211	Pesnica pri Mariboru
00050000-5578-18e6-076e-be8d3f9b1059	9203	Petrovci
00050000-5578-18e6-607f-d452fe516e35	3301	Petrovče
00050000-5578-18e6-266a-544529de97dc	6330	Piran/Pirano
00050000-5578-18e6-91a0-4ef28a463b95	8255	Pišece
00050000-5578-18e6-0303-9f29a6ae1428	6257	Pivka
00050000-5578-18e6-b05a-fbf3d6710fac	6232	Planina
00050000-5578-18e6-89f0-a326f33554cf	3225	Planina pri Sevnici
00050000-5578-18e6-e368-c063b6bf59cd	6276	Pobegi
00050000-5578-18e6-2bf7-9d586937203e	8312	Podbočje
00050000-5578-18e6-0498-1765af5a7972	5243	Podbrdo
00050000-5578-18e6-32e9-f468a9be3557	3254	Podčetrtek
00050000-5578-18e6-05df-b784e9cf87e3	2273	Podgorci
00050000-5578-18e6-687b-22f4aaf91ba7	6216	Podgorje
00050000-5578-18e6-b8e0-97179b2c6063	2381	Podgorje pri Slovenj Gradcu
00050000-5578-18e6-d693-7530047fd36e	6244	Podgrad
00050000-5578-18e6-cf1e-cfadbe21ec1a	1414	Podkum
00050000-5578-18e6-2d88-f3e09522f6fe	2286	Podlehnik
00050000-5578-18e6-1062-2ac116c2e936	5272	Podnanos
00050000-5578-18e6-f3ce-457d83f7a381	4244	Podnart
00050000-5578-18e6-7eb7-4c43173ccd20	3241	Podplat
00050000-5578-18e6-df3e-c9714b7f7b37	3257	Podsreda
00050000-5578-18e6-1fca-042ba6ac39e4	2363	Podvelka
00050000-5578-18e6-8a11-4f4c2d074c36	2208	Pohorje
00050000-5578-18e6-d729-9f3f6938a48e	2257	Polenšak
00050000-5578-18e6-021b-6639a53253d3	1355	Polhov Gradec
00050000-5578-18e6-7e4d-77714b3c92df	4223	Poljane nad Škofjo Loko
00050000-5578-18e6-c3c2-4390174a6c60	2319	Poljčane
00050000-5578-18e6-baa3-51c104f066f0	1272	Polšnik
00050000-5578-18e6-f8fe-b1cd70ed96d8	3313	Polzela
00050000-5578-18e6-1271-5e08bdee1524	3232	Ponikva
00050000-5578-18e6-7054-e9d6c21482c6	6320	Portorož/Portorose
00050000-5578-18e6-b9f1-42bfddb99633	6230	Postojna
00050000-5578-18e6-d6de-89a920ad63af	2331	Pragersko
00050000-5578-18e6-5f64-35fb936526c8	3312	Prebold
00050000-5578-18e6-efd2-90af6478a754	4205	Preddvor
00050000-5578-18e6-0d8e-818aa53d8741	6255	Prem
00050000-5578-18e6-3fd2-9b2aac49a7fd	1352	Preserje
00050000-5578-18e6-a027-e87708a6cca9	6258	Prestranek
00050000-5578-18e6-7b3b-c65efee70051	2391	Prevalje
00050000-5578-18e6-61be-06973052800a	3262	Prevorje
00050000-5578-18e6-73e4-54bc1d2df960	1276	Primskovo 
00050000-5578-18e6-d03f-ea6ee4360a53	3253	Pristava pri Mestinju
00050000-5578-18e6-2021-b11b7a020cce	9207	Prosenjakovci/Partosfalva
00050000-5578-18e6-aef6-0ed37959c32a	5297	Prvačina
00050000-5578-18e6-7802-551135eca88a	2250	Ptuj
00050000-5578-18e6-8feb-e4b1c2e2bf60	2323	Ptujska Gora
00050000-5578-18e6-3d04-21d8e0cc1a9e	9201	Puconci
00050000-5578-18e6-9c46-d415c5e8e7a6	2327	Rače
00050000-5578-18e6-e64d-0a59f8be3016	1433	Radeče
00050000-5578-18e6-8871-41e2703c7864	9252	Radenci
00050000-5578-18e6-18ca-418af232d5e0	2360	Radlje ob Dravi
00050000-5578-18e6-fba3-5bf277ff8194	1235	Radomlje
00050000-5578-18e6-7b57-c46696a940b6	4240	Radovljica
00050000-5578-18e6-c2f5-afc1a312c7d9	8274	Raka
00050000-5578-18e6-6012-bf19321af0a5	1381	Rakek
00050000-5578-18e6-033d-f6da9f50c896	4283	Rateče - Planica
00050000-5578-18e6-64bb-56bc063aaf8b	2390	Ravne na Koroškem
00050000-5578-18e6-2d1b-dc53006dd7e9	9246	Razkrižje
00050000-5578-18e6-5333-ed654ae2384f	3332	Rečica ob Savinji
00050000-5578-18e6-c40e-9b2108ab78ab	5292	Renče
00050000-5578-18e6-5681-2273a707924e	1310	Ribnica
00050000-5578-18e6-7350-8fa9b4948b11	2364	Ribnica na Pohorju
00050000-5578-18e6-b419-79b6cdb87b81	3272	Rimske Toplice
00050000-5578-18e6-c652-a8a201853b44	1314	Rob
00050000-5578-18e6-23d6-2a9c13f27e7f	5215	Ročinj
00050000-5578-18e6-c1b8-11e92fdb05b7	3250	Rogaška Slatina
00050000-5578-18e6-aa34-5123cb77a698	9262	Rogašovci
00050000-5578-18e6-efe5-0c9ebae04f8e	3252	Rogatec
00050000-5578-18e6-134e-4e6c9d2c9c86	1373	Rovte
00050000-5578-18e6-e948-d698181fbec0	2342	Ruše
00050000-5578-18e6-28a5-d810e646ea56	1282	Sava
00050000-5578-18e6-63d1-fa21de8dc02b	6333	Sečovlje/Sicciole
00050000-5578-18e6-ea68-6778c104e5b1	4227	Selca
00050000-5578-18e6-3242-9ad4ed1dfc69	2352	Selnica ob Dravi
00050000-5578-18e6-fe78-9ce1a880b783	8333	Semič
00050000-5578-18e6-729e-dab73e48df28	8281	Senovo
00050000-5578-18e6-8b3a-86c991e2e5a6	6224	Senožeče
00050000-5578-18e6-4cbf-18b120b0f39f	8290	Sevnica
00050000-5578-18e6-c367-a678f0f7bb6a	6210	Sežana
00050000-5578-18e6-81d7-9628c75e2881	2214	Sladki Vrh
00050000-5578-18e6-d11e-69c331288fc5	5283	Slap ob Idrijci
00050000-5578-18e6-13c9-980b9dd545e5	2380	Slovenj Gradec
00050000-5578-18e6-2a16-0a6826c2f9c4	2310	Slovenska Bistrica
00050000-5578-18e6-1a30-76d2dfa10492	3210	Slovenske Konjice
00050000-5578-18e6-1ea2-7f13205e4647	1216	Smlednik
00050000-5578-18e6-3dbb-9492eef43761	5232	Soča
00050000-5578-18e6-772b-74db9e51b6d5	1317	Sodražica
00050000-5578-18e6-d00e-a26d9655ad3b	3335	Solčava
00050000-5578-18e6-693f-a9f031f03b61	5250	Solkan
00050000-5578-18e6-33da-6d23e47c5ad8	4229	Sorica
00050000-5578-18e6-cf1b-92f9cbedca94	4225	Sovodenj
00050000-5578-18e6-c131-4784708684f8	5281	Spodnja Idrija
00050000-5578-18e6-7f99-c00a31d8d095	2241	Spodnji Duplek
00050000-5578-18e6-df07-bc93fda5400b	9245	Spodnji Ivanjci
00050000-5578-18e6-82fe-6ef2185b6d3b	2277	Središče ob Dravi
00050000-5578-18e6-0df4-c4a3f369c83e	4267	Srednja vas v Bohinju
00050000-5578-18e6-aa66-0c64192b96ff	8256	Sromlje 
00050000-5578-18e6-481f-fddaf0a90bf1	5224	Srpenica
00050000-5578-18e6-71a4-566c49fe82b5	1242	Stahovica
00050000-5578-18e6-69ee-f2c0ccd9d3ed	1332	Stara Cerkev
00050000-5578-18e6-45d7-cd7fb990bf1c	8342	Stari trg ob Kolpi
00050000-5578-18e6-cca1-2ea54831950a	1386	Stari trg pri Ložu
00050000-5578-18e6-ac0b-d01a9e5e1ed8	2205	Starše
00050000-5578-18e6-9bf1-03bb46674aa1	2289	Stoperce
00050000-5578-18e6-64a7-7a5676486158	8322	Stopiče
00050000-5578-18e6-ab8f-33c9e6e88b4a	3206	Stranice
00050000-5578-18e6-315c-5fb0a2b8d944	8351	Straža
00050000-5578-18e6-d78e-6c7c45ffabbd	1313	Struge
00050000-5578-18e6-4e78-24e4e1442c02	8293	Studenec
00050000-5578-18e6-3b04-3bbefa35bfb5	8331	Suhor
00050000-5578-18e6-88b8-9070149721d7	2233	Sv. Ana v Slovenskih goricah
00050000-5578-18e6-7d16-f1ee0b36d947	2235	Sv. Trojica v Slovenskih goricah
00050000-5578-18e6-cf7d-0279047f3acf	2353	Sveti Duh na Ostrem Vrhu
00050000-5578-18e6-824d-135e82c1e4a0	9244	Sveti Jurij ob Ščavnici
00050000-5578-18e6-97d7-07146728376b	3264	Sveti Štefan
00050000-5578-18e6-69a3-6e5153dc0e40	2258	Sveti Tomaž
00050000-5578-18e6-445b-913cb7a47b20	9204	Šalovci
00050000-5578-18e6-2e34-d6e6cb2a8657	5261	Šempas
00050000-5578-18e6-b19d-e5824b54ba90	5290	Šempeter pri Gorici
00050000-5578-18e6-dab5-6b998d616fc3	3311	Šempeter v Savinjski dolini
00050000-5578-18e6-4948-35bd0cff5a36	4208	Šenčur
00050000-5578-18e6-b1a1-9d84140a70aa	2212	Šentilj v Slovenskih goricah
00050000-5578-18e6-e950-c8792090dc5a	8297	Šentjanž
00050000-5578-18e6-c5aa-76905872f9ab	2373	Šentjanž pri Dravogradu
00050000-5578-18e6-6ad6-41d688958010	8310	Šentjernej
00050000-5578-18e6-6f33-b0689c675844	3230	Šentjur
00050000-5578-18e6-27ca-51915b39717e	3271	Šentrupert
00050000-5578-18e6-384d-99227831ae73	8232	Šentrupert
00050000-5578-18e6-ae40-6395a4c0836f	1296	Šentvid pri Stični
00050000-5578-18e6-791b-fe2bb47a409a	8275	Škocjan
00050000-5578-18e6-5d4d-9a3470bee7a4	6281	Škofije
00050000-5578-18e6-fa92-3c2eec7fa609	4220	Škofja Loka
00050000-5578-18e6-7e8a-5ceea6e70a38	3211	Škofja vas
00050000-5578-18e6-fa63-ca1cdbcfff16	1291	Škofljica
00050000-5578-18e6-5567-481f012a2011	6274	Šmarje
00050000-5578-18e6-a46e-afbc00457a0c	1293	Šmarje - Sap
00050000-5578-18e6-309e-60723d389e24	3240	Šmarje pri Jelšah
00050000-5578-18e6-003f-c2b0009d4cdf	8220	Šmarješke Toplice
00050000-5578-18e6-0cdf-1b665bc295ff	2315	Šmartno na Pohorju
00050000-5578-18e6-00c0-55a2d414ec6b	3341	Šmartno ob Dreti
00050000-5578-18e6-3bd7-86dbbab6f048	3327	Šmartno ob Paki
00050000-5578-18e6-cc18-966f97254143	1275	Šmartno pri Litiji
00050000-5578-18e6-1cf8-fb82e20dc5be	2383	Šmartno pri Slovenj Gradcu
00050000-5578-18e6-d645-eb4811401880	3201	Šmartno v Rožni dolini
00050000-5578-18e6-aee2-a85595033512	3325	Šoštanj
00050000-5578-18e6-f69e-54f9d611567f	6222	Štanjel
00050000-5578-18e6-bcf5-ec2f3717954a	3220	Štore
00050000-5578-18e6-9092-f4b47c191a5c	3304	Tabor
00050000-5578-18e6-7912-6e5478c3a1fe	3221	Teharje
00050000-5578-18e6-cdb9-94a41d314b18	9251	Tišina
00050000-5578-18e6-c159-50e6f5aa7e26	5220	Tolmin
00050000-5578-18e6-1ba0-d1c500212b9a	3326	Topolšica
00050000-5578-18e6-ddeb-de62f4373846	2371	Trbonje
00050000-5578-18e6-cae9-9bbe34b39081	1420	Trbovlje
00050000-5578-18e6-abe6-969ea7f7957d	8231	Trebelno 
00050000-5578-18e6-1c3f-1029a7f71e57	8210	Trebnje
00050000-5578-18e6-10d3-ae511800dea8	5252	Trnovo pri Gorici
00050000-5578-18e6-eaa1-834134eb2a15	2254	Trnovska vas
00050000-5578-18e6-bc56-7e6328e7b15f	1222	Trojane
00050000-5578-18e6-0735-0b888947272f	1236	Trzin
00050000-5578-18e6-2429-3f99f0b5a948	4290	Tržič
00050000-5578-18e6-b3fe-9ba11bdec893	8295	Tržišče
00050000-5578-18e6-9845-b5a907cfb85a	1311	Turjak
00050000-5578-18e6-487e-be96697dbdb5	9224	Turnišče
00050000-5578-18e6-dd98-238930b59c72	8323	Uršna sela
00050000-5578-18e6-6841-be25237b5e1a	1252	Vače
00050000-5578-18e6-76b6-9c1439551773	3320	Velenje 
00050000-5578-18e6-f956-09cbfd62e0f8	3322	Velenje - poštni predali
00050000-5578-18e6-681e-4df15b756bdf	8212	Velika Loka
00050000-5578-18e6-ffcb-bee04ede7c24	2274	Velika Nedelja
00050000-5578-18e6-11f6-02c66b5486fb	9225	Velika Polana
00050000-5578-18e6-d14c-803df39768ca	1315	Velike Lašče
00050000-5578-18e6-1314-4c64c54ba3dd	8213	Veliki Gaber
00050000-5578-18e6-2f04-017c4c7e2355	9241	Veržej
00050000-5578-18e6-52ee-9e6a340bb8d1	1312	Videm - Dobrepolje
00050000-5578-18e6-3e92-36c3b0b77a7d	2284	Videm pri Ptuju
00050000-5578-18e6-8a28-ac152757cf09	8344	Vinica
00050000-5578-18e6-a9c1-ec9a97cba6cd	5271	Vipava
00050000-5578-18e6-166d-0fcb07eae2e8	4212	Visoko
00050000-5578-18e6-a865-f318f5239c1d	1294	Višnja Gora
00050000-5578-18e6-0c82-c986a95e39b5	3205	Vitanje
00050000-5578-18e6-dbc8-aff744e38b4e	2255	Vitomarci
00050000-5578-18e6-a81d-ee906e129573	1217	Vodice
00050000-5578-18e6-b2f4-297f662b00b4	3212	Vojnik\t
00050000-5578-18e6-2b7d-ed819030b0cc	5293	Volčja Draga
00050000-5578-18e6-a4f6-703789116127	2232	Voličina
00050000-5578-18e6-53ac-077aa106959c	3305	Vransko
00050000-5578-18e6-b768-1d4162857f18	6217	Vremski Britof
00050000-5578-18e6-7e7b-b612302ab1cf	1360	Vrhnika
00050000-5578-18e6-3a56-df4df0d4c3c5	2365	Vuhred
00050000-5578-18e6-224b-f537a21f8073	2367	Vuzenica
00050000-5578-18e6-51b3-48644e0b1a62	8292	Zabukovje 
00050000-5578-18e6-5282-4dbd4665a5a1	1410	Zagorje ob Savi
00050000-5578-18e6-7fa5-ceb7f1ad2e5d	1303	Zagradec
00050000-5578-18e6-e581-6ebd3e131885	2283	Zavrč
00050000-5578-18e6-e12f-714a14550d4e	8272	Zdole 
00050000-5578-18e6-81a5-34967a8acca7	4201	Zgornja Besnica
00050000-5578-18e6-5f68-568f9da713b4	2242	Zgornja Korena
00050000-5578-18e6-092c-e54a24ff1d60	2201	Zgornja Kungota
00050000-5578-18e6-ae9c-6a7e0bb31af4	2316	Zgornja Ložnica
00050000-5578-18e6-92fd-0d646cb26043	2314	Zgornja Polskava
00050000-5578-18e6-b598-1b1bc64c6934	2213	Zgornja Velka
00050000-5578-18e6-0278-cd9639f61458	4247	Zgornje Gorje
00050000-5578-18e6-7d96-a46c80938784	4206	Zgornje Jezersko
00050000-5578-18e6-6317-865053b6190d	2285	Zgornji Leskovec
00050000-5578-18e6-63a3-0fcb34b5e9f8	1432	Zidani Most
00050000-5578-18e6-45e3-09636a36e7d4	3214	Zreče
00050000-5578-18e6-f126-11d50e8f7011	4209	Žabnica
00050000-5578-18e6-417f-8345562984d6	3310	Žalec
00050000-5578-18e6-4663-c69a2fcba312	4228	Železniki
00050000-5578-18e6-1182-bf92a70265e6	2287	Žetale
00050000-5578-18e6-5f52-b0bd7006e1ba	4226	Žiri
00050000-5578-18e6-092a-384d5f0eb758	4274	Žirovnica
00050000-5578-18e6-9684-fd5e693d00b5	8360	Žužemberk
\.


--
-- TOC entry 2826 (class 0 OID 6856052)
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
-- TOC entry 2808 (class 0 OID 6855863)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6855941)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6856064)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6856184)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6856237)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5578-18e7-2b20-1ea1d0a3b897	00080000-5578-18e7-0e07-ebaef4b6a8c0	0987	A
00190000-5578-18e7-8c6d-3a37e72dddf6	00080000-5578-18e7-ac60-d86646d26c5b	0989	A
\.


--
-- TOC entry 2852 (class 0 OID 6856352)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6856403)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6856365)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6856373)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6856093)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5578-18e7-043b-ea4cb4e16541	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5578-18e7-a737-ec40eac7dd68	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5578-18e7-fca1-c92f6554bdee	0003	Kazinska	t	84	Kazinska dvorana
00220000-5578-18e7-2ebf-b3712ba28900	0004	Mali oder	t	24	Mali oder 
00220000-5578-18e7-30ba-f55a2e70bd74	0005	Komorni oder	t	15	Komorni oder
00220000-5578-18e7-8f0f-be025fc51132	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5578-18e7-c9aa-8a8a65bd8f29	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2824 (class 0 OID 6856037)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6856027)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6856226)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6856161)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6855735)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5578-18e6-494e-26b72f2c1fb9	00010000-5578-18e6-c7d9-48ed5d96f2aa	2015-06-10 13:00:56	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROc./ZjJ7p7K/fq5dKijU8ytCccXLjzRe";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2833 (class 0 OID 6856103)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6855773)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5578-18e6-58ab-e04886107b2f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5578-18e6-39d2-6fef2a1f98b0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5578-18e6-16b0-cb69823dd6a4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5578-18e6-052c-fc428ac16f0e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5578-18e6-2f91-589bd9244c08	planer	Planer dogodkov v koledarju	t
00020000-5578-18e6-c8c3-058b8fa94383	kadrovska	Kadrovska služba	t
00020000-5578-18e6-2e4d-00c21192d8a4	arhivar	Ažuriranje arhivalij	t
00020000-5578-18e6-2c1f-29987ae92bb7	igralec	Igralec	t
00020000-5578-18e6-e070-f0660d6909d4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2799 (class 0 OID 6855757)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5578-18e6-494e-26b72f2c1fb9	00020000-5578-18e6-16b0-cb69823dd6a4
00010000-5578-18e6-c7d9-48ed5d96f2aa	00020000-5578-18e6-16b0-cb69823dd6a4
\.


--
-- TOC entry 2835 (class 0 OID 6856117)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6856058)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6856008)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 6856422)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5578-18e6-1341-2acf338c0f15	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5578-18e6-36f7-d1eb1d97d4ef	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5578-18e6-bd74-10e09acf3b67	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5578-18e6-d228-cbb5484181b1	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5578-18e6-e8fa-78dd21a9b82e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2858 (class 0 OID 6856414)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5578-18e6-fd79-12a2194465b5	00230000-5578-18e6-d228-cbb5484181b1	popa
00240000-5578-18e6-8f15-67201ba2dc6b	00230000-5578-18e6-d228-cbb5484181b1	oseba
00240000-5578-18e6-98bf-bf05dbaf2642	00230000-5578-18e6-36f7-d1eb1d97d4ef	prostor
00240000-5578-18e6-2dc6-a5ebed5641f8	00230000-5578-18e6-d228-cbb5484181b1	besedilo
00240000-5578-18e6-9484-0ff2e95e2958	00230000-5578-18e6-d228-cbb5484181b1	uprizoritev
00240000-5578-18e6-351f-a1d3efa9ef2e	00230000-5578-18e6-d228-cbb5484181b1	funkcija
00240000-5578-18e6-524d-6f8f6d4f5f44	00230000-5578-18e6-d228-cbb5484181b1	tipfunkcije
00240000-5578-18e6-b033-8a9d4bc5455d	00230000-5578-18e6-d228-cbb5484181b1	alternacija
00240000-5578-18e6-cf2a-202a6017ff37	00230000-5578-18e6-1341-2acf338c0f15	pogodba
00240000-5578-18e6-4d9e-f75bce932e4e	00230000-5578-18e6-d228-cbb5484181b1	zaposlitev
\.


--
-- TOC entry 2857 (class 0 OID 6856409)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6856171)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6855835)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6856014)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5578-18e7-f661-4b5bf07fce76	00180000-5578-18e7-ed62-7d341d03278a	000c0000-5578-18e7-fd26-9045dc39c964	00090000-5578-18e7-8363-8236d3a85ef9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-18e7-a7af-cfc07fe3d062	00180000-5578-18e7-ed62-7d341d03278a	000c0000-5578-18e7-2b15-3b085059c965	00090000-5578-18e7-79bc-f8429d99bd20	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-18e7-2d0d-58ef73647495	00180000-5578-18e7-ed62-7d341d03278a	000c0000-5578-18e7-aebb-76425629a6ba	00090000-5578-18e7-8750-fcde93cabc9e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-18e7-b2c6-3d121a178913	00180000-5578-18e7-ed62-7d341d03278a	000c0000-5578-18e7-7d85-c2b3f839da36	00090000-5578-18e7-9bc6-27a1644b8f71	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-18e7-399b-2975f54f9981	00180000-5578-18e7-ed62-7d341d03278a	000c0000-5578-18e7-2369-2016850cd8c9	00090000-5578-18e7-b5ce-ec31152f1772	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-18e7-0b46-53fc8536d5ba	00180000-5578-18e7-f6b1-fb135e79887d	\N	00090000-5578-18e7-b5ce-ec31152f1772	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2843 (class 0 OID 6856215)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5578-18e6-affd-f024ab5ade79	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5578-18e6-c5f1-87136c91d177	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5578-18e6-a032-0c96c7f4c283	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5578-18e6-6141-f910e09ae683	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5578-18e6-72bd-834d63678c93	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5578-18e6-7a42-fc797b98f9be	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5578-18e6-f52a-203824a795c0	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5578-18e6-c4a0-f18bf9df3b87	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5578-18e6-d174-1e237fed5f50	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5578-18e6-9865-93363b0d851a	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5578-18e6-e58d-cb503cc9c7ea	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5578-18e6-9668-d6c51875477d	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5578-18e6-2fe0-66ee549a60c3	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5578-18e6-892d-0078cfc611e3	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5578-18e6-7ec7-f20ebabdd17c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5578-18e6-a6fa-ac84d6e789bc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2855 (class 0 OID 6856392)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5578-18e6-2231-29323411912e	01	Velika predstava	f	1.00	1.00
002b0000-5578-18e6-dbdf-c2611505832c	02	Mala predstava	f	0.50	0.50
002b0000-5578-18e6-f182-3c078d5cc85c	03	Mala koprodukcija	t	0.40	1.00
002b0000-5578-18e6-23c1-b15a063ee81d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5578-18e6-2f6d-199bb658cc2f	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2811 (class 0 OID 6855898)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6855744)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5578-18e6-c7d9-48ed5d96f2aa	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROP64lsBWyXr7U0C9aVCRylavduJ3Y20y	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5578-18e7-26fd-727e07fe8195	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5578-18e7-da23-dd139e3b2be6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5578-18e7-abae-5aeb6b688b67	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5578-18e7-940b-6b8f8c1e2023	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5578-18e7-747f-0d9b3f92384c	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5578-18e7-64e0-960409ec67b6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5578-18e6-494e-26b72f2c1fb9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2848 (class 0 OID 6856272)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5578-18e7-b103-6ffa9bf9ebb3	00160000-5578-18e7-b71e-86289b9b39fc	00150000-5578-18e6-6dd6-258d84a92c32	00140000-5578-18e6-9eac-ed33cdcc7a99	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5578-18e7-30ba-f55a2e70bd74
000e0000-5578-18e7-ac70-8b79f72f9d2f	00160000-5578-18e7-33f7-e75ca749618a	00150000-5578-18e6-f1f4-48ac7be0f6d3	00140000-5578-18e6-916a-8123aa002dbb	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5578-18e7-8f0f-be025fc51132
000e0000-5578-18e7-f974-33e778a3d20e	\N	00150000-5578-18e6-f1f4-48ac7be0f6d3	00140000-5578-18e6-916a-8123aa002dbb	00190000-5578-18e7-2b20-1ea1d0a3b897	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5578-18e7-30ba-f55a2e70bd74
000e0000-5578-18e7-fb6f-15f5bdd0ebba	\N	00150000-5578-18e6-f1f4-48ac7be0f6d3	00140000-5578-18e6-916a-8123aa002dbb	00190000-5578-18e7-2b20-1ea1d0a3b897	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5578-18e7-30ba-f55a2e70bd74
\.


--
-- TOC entry 2816 (class 0 OID 6855960)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5578-18e7-02b9-69b12bf95d4a	000e0000-5578-18e7-ac70-8b79f72f9d2f	1	
00200000-5578-18e7-c62b-bc425e26f82d	000e0000-5578-18e7-ac70-8b79f72f9d2f	2	
\.


--
-- TOC entry 2831 (class 0 OID 6856085)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6856154)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6855992)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6856262)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5578-18e6-9eac-ed33cdcc7a99	01	Drama	drama (SURS 01)
00140000-5578-18e6-8115-e32b8364fb1f	02	Opera	opera (SURS 02)
00140000-5578-18e6-a329-aa8d8c53a128	03	Balet	balet (SURS 03)
00140000-5578-18e6-e0e3-2fec8af0750b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5578-18e6-5749-e6c996c45607	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5578-18e6-916a-8123aa002dbb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5578-18e6-f391-801904a0a1e6	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2837 (class 0 OID 6856144)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5578-18e6-a30e-1792d3749728	01	Opera	opera
00150000-5578-18e6-884b-5a0292a7a5fc	02	Opereta	opereta
00150000-5578-18e6-7675-1a0018539603	03	Balet	balet
00150000-5578-18e6-6f78-e69aeb55bda6	04	Plesne prireditve	plesne prireditve
00150000-5578-18e6-b796-5ada1c3ca4a4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5578-18e6-75af-2d443c05da17	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5578-18e6-8b41-526c21c1bf9c	07	Biografska drama	biografska drama
00150000-5578-18e6-6dd6-258d84a92c32	08	Komedija	komedija
00150000-5578-18e6-284a-06596012a593	09	Črna komedija	črna komedija
00150000-5578-18e6-4d8b-320325932f1d	10	E-igra	E-igra
00150000-5578-18e6-f1f4-48ac7be0f6d3	11	Kriminalka	kriminalka
00150000-5578-18e6-3ee6-d20714a7e1cd	12	Musical	musical
\.


--
-- TOC entry 2383 (class 2606 OID 6855798)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6856319)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6856309)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6856214)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6855982)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6856007)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6855924)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6856348)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6856140)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6855958)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 6856001)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6855938)
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
-- TOC entry 2475 (class 2606 OID 6856050)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6856077)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 6855896)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 6855807)
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
-- TOC entry 2390 (class 2606 OID 6855831)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 6855787)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2374 (class 2606 OID 6855772)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6856083)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6856116)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6856257)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6855860)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6855884)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6856056)
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
-- TOC entry 2405 (class 2606 OID 6855874)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6855945)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6856068)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6856196)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6856242)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6856363)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6856407)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6856370)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 6856390)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6856100)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6856041)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 6856032)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6856236)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6856168)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 6855743)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 6856107)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 6855761)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2376 (class 2606 OID 6855781)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6856125)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6856063)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6856013)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6856431)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 6856419)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6856413)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6856181)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6855840)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6856023)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6856225)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 6856402)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 6855909)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6855756)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6856288)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6855967)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6856091)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6856159)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 6855996)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6856270)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6856152)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 1259 OID 6855989)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2523 (class 1259 OID 6856182)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2524 (class 1259 OID 6856183)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6855862)
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
-- TOC entry 2488 (class 1259 OID 6856084)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2482 (class 1259 OID 6856070)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2483 (class 1259 OID 6856069)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 6855968)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2510 (class 1259 OID 6856141)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6856143)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2512 (class 1259 OID 6856142)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2422 (class 1259 OID 6855940)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2423 (class 1259 OID 6855939)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2541 (class 1259 OID 6856259)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2542 (class 1259 OID 6856260)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2543 (class 1259 OID 6856261)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2582 (class 1259 OID 6856391)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2550 (class 1259 OID 6856293)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2551 (class 1259 OID 6856290)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2552 (class 1259 OID 6856294)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2553 (class 1259 OID 6856292)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2554 (class 1259 OID 6856291)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2412 (class 1259 OID 6855911)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2413 (class 1259 OID 6855910)
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
-- TOC entry 2388 (class 1259 OID 6855834)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2498 (class 1259 OID 6856108)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2452 (class 1259 OID 6856002)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2378 (class 1259 OID 6855788)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2379 (class 1259 OID 6855789)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2503 (class 1259 OID 6856128)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2504 (class 1259 OID 6856127)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2505 (class 1259 OID 6856126)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2426 (class 1259 OID 6855946)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2427 (class 1259 OID 6855948)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2428 (class 1259 OID 6855947)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2592 (class 1259 OID 6856421)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2462 (class 1259 OID 6856036)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2463 (class 1259 OID 6856034)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2464 (class 1259 OID 6856033)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2465 (class 1259 OID 6856035)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2369 (class 1259 OID 6855762)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2370 (class 1259 OID 6855763)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 6856092)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2477 (class 1259 OID 6856057)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2519 (class 1259 OID 6856169)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2520 (class 1259 OID 6856170)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2572 (class 1259 OID 6856349)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 6856350)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2574 (class 1259 OID 6856351)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2401 (class 1259 OID 6855876)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6855875)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2403 (class 1259 OID 6855877)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2587 (class 1259 OID 6856408)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2527 (class 1259 OID 6856197)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2528 (class 1259 OID 6856198)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2564 (class 1259 OID 6856323)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2565 (class 1259 OID 6856325)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2566 (class 1259 OID 6856321)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2567 (class 1259 OID 6856324)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2568 (class 1259 OID 6856322)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2516 (class 1259 OID 6856160)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2468 (class 1259 OID 6856045)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2469 (class 1259 OID 6856044)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2470 (class 1259 OID 6856042)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2471 (class 1259 OID 6856043)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2352 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2560 (class 1259 OID 6856311)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6856310)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2575 (class 1259 OID 6856364)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2433 (class 1259 OID 6855959)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 6855809)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2385 (class 1259 OID 6855808)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2393 (class 1259 OID 6855841)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6855842)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2457 (class 1259 OID 6856026)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2458 (class 1259 OID 6856025)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2459 (class 1259 OID 6856024)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2578 (class 1259 OID 6856372)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2579 (class 1259 OID 6856371)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2440 (class 1259 OID 6855991)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2441 (class 1259 OID 6855987)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2442 (class 1259 OID 6855984)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2443 (class 1259 OID 6855985)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2444 (class 1259 OID 6855983)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2445 (class 1259 OID 6855988)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2446 (class 1259 OID 6855986)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2400 (class 1259 OID 6855861)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 6855925)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2419 (class 1259 OID 6855927)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2420 (class 1259 OID 6855926)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2421 (class 1259 OID 6855928)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2476 (class 1259 OID 6856051)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2546 (class 1259 OID 6856258)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6856289)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2391 (class 1259 OID 6855832)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6855833)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2513 (class 1259 OID 6856153)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 6856432)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6855897)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2595 (class 1259 OID 6856420)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2496 (class 1259 OID 6856102)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2497 (class 1259 OID 6856101)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 6856320)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2355 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2408 (class 1259 OID 6855885)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6856271)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2539 (class 1259 OID 6856243)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2540 (class 1259 OID 6856244)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 6855782)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2447 (class 1259 OID 6855990)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2624 (class 2606 OID 6856568)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2627 (class 2606 OID 6856553)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2626 (class 2606 OID 6856558)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2622 (class 2606 OID 6856578)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2628 (class 2606 OID 6856548)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2623 (class 2606 OID 6856573)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2625 (class 2606 OID 6856563)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6856723)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2657 (class 2606 OID 6856728)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2609 (class 2606 OID 6856483)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2645 (class 2606 OID 6856663)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2643 (class 2606 OID 6856658)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2644 (class 2606 OID 6856653)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2621 (class 2606 OID 6856543)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6856693)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6856703)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2652 (class 2606 OID 6856698)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6856518)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6856513)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2641 (class 2606 OID 6856643)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6856748)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 6856753)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 6856758)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2683 (class 2606 OID 6856853)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2666 (class 2606 OID 6856778)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2669 (class 2606 OID 6856763)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2665 (class 2606 OID 6856783)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2667 (class 2606 OID 6856773)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2668 (class 2606 OID 6856768)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2613 (class 2606 OID 6856508)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6856503)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6856468)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2606 (class 2606 OID 6856463)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2647 (class 2606 OID 6856673)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2629 (class 2606 OID 6856583)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6856443)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2601 (class 2606 OID 6856448)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2648 (class 2606 OID 6856688)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2649 (class 2606 OID 6856683)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2650 (class 2606 OID 6856678)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2619 (class 2606 OID 6856523)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2617 (class 2606 OID 6856533)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2618 (class 2606 OID 6856528)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2685 (class 2606 OID 6856863)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2633 (class 2606 OID 6856618)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2635 (class 2606 OID 6856608)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2636 (class 2606 OID 6856603)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2634 (class 2606 OID 6856613)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2600 (class 2606 OID 6856433)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2599 (class 2606 OID 6856438)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2646 (class 2606 OID 6856668)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2642 (class 2606 OID 6856648)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2656 (class 2606 OID 6856713)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2655 (class 2606 OID 6856718)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 6856823)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 6856828)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2677 (class 2606 OID 6856833)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2611 (class 2606 OID 6856493)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6856488)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2610 (class 2606 OID 6856498)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2684 (class 2606 OID 6856858)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2660 (class 2606 OID 6856733)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2659 (class 2606 OID 6856738)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2674 (class 2606 OID 6856808)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2672 (class 2606 OID 6856818)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2676 (class 2606 OID 6856798)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2673 (class 2606 OID 6856813)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2675 (class 2606 OID 6856803)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2654 (class 2606 OID 6856708)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6856638)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2638 (class 2606 OID 6856633)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2640 (class 2606 OID 6856623)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2639 (class 2606 OID 6856628)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2670 (class 2606 OID 6856793)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 6856788)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2680 (class 2606 OID 6856838)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2620 (class 2606 OID 6856538)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2661 (class 2606 OID 6856743)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2603 (class 2606 OID 6856458)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2604 (class 2606 OID 6856453)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2608 (class 2606 OID 6856473)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2607 (class 2606 OID 6856478)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 6856598)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2631 (class 2606 OID 6856593)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2632 (class 2606 OID 6856588)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2681 (class 2606 OID 6856848)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2682 (class 2606 OID 6856843)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 13:00:56 CEST

--
-- PostgreSQL database dump complete
--

