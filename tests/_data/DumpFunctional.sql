--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-12 11:23:38 CEST

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
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 7009234)
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
-- TOC entry 227 (class 1259 OID 7009757)
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
-- TOC entry 226 (class 1259 OID 7009740)
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
-- TOC entry 219 (class 1259 OID 7009644)
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
-- TOC entry 194 (class 1259 OID 7009414)
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
-- TOC entry 197 (class 1259 OID 7009448)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7009356)
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
-- TOC entry 228 (class 1259 OID 7009771)
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
-- TOC entry 213 (class 1259 OID 7009574)
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
-- TOC entry 192 (class 1259 OID 7009393)
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
-- TOC entry 196 (class 1259 OID 7009442)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7009373)
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
-- TOC entry 202 (class 1259 OID 7009491)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7009516)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7009330)
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
-- TOC entry 181 (class 1259 OID 7009243)
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
-- TOC entry 182 (class 1259 OID 7009254)
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
-- TOC entry 177 (class 1259 OID 7009208)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7009227)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7009523)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7009554)
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
-- TOC entry 223 (class 1259 OID 7009690)
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
-- TOC entry 184 (class 1259 OID 7009287)
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
-- TOC entry 186 (class 1259 OID 7009322)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7009497)
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
-- TOC entry 185 (class 1259 OID 7009307)
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
-- TOC entry 191 (class 1259 OID 7009385)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7009509)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7009629)
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
-- TOC entry 222 (class 1259 OID 7009682)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7009797)
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
-- TOC entry 233 (class 1259 OID 7009860)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id uuid NOT NULL,
    program_dela_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    zvrst character varying(255) NOT NULL,
    stpredstav integer,
    stpredavanj integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    opredelitevdrugidogodki text,
    stprodukcij integer,
    stobisk integer,
    caspriprave character varying(255) NOT NULL,
    casizvedbe character varying(255) NOT NULL,
    prizorisca character varying(255) DEFAULT NULL::character varying,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji character varying(255) DEFAULT NULL::character varying,
    sttujihselektorjev integer,
    stzaposlenih integer,
    sthonorarnih integer,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opredelitevdrugiviri text,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 230 (class 1259 OID 7009810)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
    krajgostovanja character varying(255) NOT NULL,
    ustanova character varying(255) NOT NULL,
    datumgostovanja date,
    stponovitev integer DEFAULT 0 NOT NULL,
    stgledalcev integer DEFAULT 0 NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    transportnistroski numeric(15,2) NOT NULL,
    stroskiavtorzun numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(15,2) DEFAULT 0::numeric NOT NULL,
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 7009829)
-- Name: programrazno; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programrazno (
    id uuid NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    nazivsklopa character varying(255) NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stpe integer DEFAULT 0 NOT NULL,
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
-- TOC entry 209 (class 1259 OID 7009538)
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
-- TOC entry 201 (class 1259 OID 7009482)
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
-- TOC entry 200 (class 1259 OID 7009472)
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
-- TOC entry 221 (class 1259 OID 7009671)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7009606)
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
-- TOC entry 174 (class 1259 OID 7009179)
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
-- TOC entry 173 (class 1259 OID 7009177)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2891 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 7009548)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7009217)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7009201)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7009562)
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
-- TOC entry 204 (class 1259 OID 7009503)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7009453)
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
-- TOC entry 236 (class 1259 OID 7009893)
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
-- TOC entry 235 (class 1259 OID 7009885)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7009880)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7009616)
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
-- TOC entry 183 (class 1259 OID 7009279)
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
-- TOC entry 199 (class 1259 OID 7009459)
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
-- TOC entry 220 (class 1259 OID 7009660)
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
-- TOC entry 232 (class 1259 OID 7009849)
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
-- TOC entry 188 (class 1259 OID 7009342)
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
-- TOC entry 175 (class 1259 OID 7009188)
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
-- TOC entry 225 (class 1259 OID 7009717)
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
-- TOC entry 193 (class 1259 OID 7009405)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7009530)
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
-- TOC entry 215 (class 1259 OID 7009599)
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
-- TOC entry 195 (class 1259 OID 7009437)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7009707)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7009589)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7009182)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7009234)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7009757)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557a-a519-fd02-90875f5a1f1e	000d0000-557a-a519-efb2-9d8670d57e3f	\N	00090000-557a-a519-a9bb-e8f37847fcf3	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-a519-dd11-310cc4eb2282	000d0000-557a-a519-6280-9e2fd10d9219	\N	00090000-557a-a519-846e-ab41872fe3bd	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-a519-5049-5d15ec20f2cd	000d0000-557a-a519-d8d4-38d80f40c4a7	\N	00090000-557a-a519-b24d-daf97d0afc06	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-a519-4032-f1928652a332	000d0000-557a-a519-9399-5b293072c436	\N	00090000-557a-a519-ad17-ec4e2423e87d	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-a519-9d3d-c9afbc0b33c6	000d0000-557a-a519-3b3f-d5a5736fa4ae	\N	00090000-557a-a519-5397-6b392ac6805f	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-a519-e511-234ca332b544	000d0000-557a-a519-c22d-f99568a05f0b	\N	00090000-557a-a519-846e-ab41872fe3bd	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7009740)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7009644)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557a-a519-ea4f-5dfb86715454	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557a-a519-4619-13e2a525ae62	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557a-a519-17b9-cfd7309761c1	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7009414)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557a-a519-edfa-62dcc626e726	\N	\N	00200000-557a-a519-277f-d879d2ab1eb1	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557a-a519-70ae-299418034f1f	\N	\N	00200000-557a-a519-c01f-d705ea4ebef7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557a-a519-83c1-dd538c1831f0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557a-a519-55ec-41369b2832dd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557a-a519-34ac-823797eef04c	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7009448)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7009356)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557a-a518-aa6e-2785311bcb1b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557a-a518-767d-f3b50f9b27e7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557a-a518-0831-0f886d90b600	AL	ALB	008	Albania 	Albanija	\N
00040000-557a-a518-312a-053dca950337	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557a-a518-bba4-51cf3f347681	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557a-a518-f2a2-c6af6b33b569	AD	AND	020	Andorra 	Andora	\N
00040000-557a-a518-73d7-29eb1c0fcb84	AO	AGO	024	Angola 	Angola	\N
00040000-557a-a518-6316-c7a5e2b718c5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557a-a518-6327-86377de43fd7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557a-a518-5a18-4340d63c0cde	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-a518-db05-378527bfa37f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557a-a518-4790-3a3a98ba3d97	AM	ARM	051	Armenia 	Armenija	\N
00040000-557a-a518-e555-f3a98173d93f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557a-a518-8be8-a749cfef5e71	AU	AUS	036	Australia 	Avstralija	\N
00040000-557a-a518-8112-4e728b49c89b	AT	AUT	040	Austria 	Avstrija	\N
00040000-557a-a518-c675-19e90b10a53f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557a-a518-5f6c-846df54352b5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557a-a518-7636-a561340328fc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557a-a518-2fbc-2ddd75910303	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557a-a518-c078-0e79b47f2c2a	BB	BRB	052	Barbados 	Barbados	\N
00040000-557a-a518-b13e-c1524d0ca303	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557a-a518-6439-0afaa8036f1d	BE	BEL	056	Belgium 	Belgija	\N
00040000-557a-a518-b531-87fb183ce4c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-557a-a518-5c21-9b4d089f7c53	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557a-a518-31ca-19d66683b84c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557a-a518-01a8-a9418f9500af	BT	BTN	064	Bhutan 	Butan	\N
00040000-557a-a518-ea51-d907687b1fb0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557a-a518-f019-58f67781df01	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557a-a518-6a7b-dcf3f2c96440	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557a-a518-9cc1-8f174099f5e2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557a-a518-109c-09c55ae517d7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557a-a518-063d-b2a9b059e88e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557a-a518-9195-a0bc6362f8ba	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557a-a518-74ad-cb716f91c1be	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557a-a518-2795-b0259bd929aa	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557a-a518-235e-1036448b370d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557a-a518-eb3a-64b09eb90c63	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557a-a518-9300-91061b0a552c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557a-a518-052e-b2665d8ec3a1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557a-a518-23e7-4b74be648f78	CA	CAN	124	Canada 	Kanada	\N
00040000-557a-a518-0349-bbce9bdf3662	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557a-a518-9428-6aa2be78a6de	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557a-a518-405a-7e20ab762f28	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557a-a518-ead4-415472175563	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557a-a518-6dd7-7c9f5a948009	CL	CHL	152	Chile 	Čile	\N
00040000-557a-a518-8a73-b8654802b213	CN	CHN	156	China 	Kitajska	\N
00040000-557a-a518-0f1d-169641686ae0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557a-a518-f4c7-99f7b8a0c8ef	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557a-a518-a392-355e37fa7441	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557a-a518-86bf-a844be4f89d5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557a-a518-2c47-e95ee1f4bee9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557a-a518-188e-b6a76b357d10	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557a-a518-f29f-f368ee2f8c7f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557a-a518-d0d4-18cd5703bb0a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557a-a518-af7a-bc2490cab69c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557a-a518-907a-f8c47fb085ab	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557a-a518-5e67-72411b3e4acb	CU	CUB	192	Cuba 	Kuba	\N
00040000-557a-a518-9582-4abac3518dd7	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557a-a518-dbbc-ca20d93d3386	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557a-a518-356b-c7c988fde34f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557a-a518-021e-484126272a23	DK	DNK	208	Denmark 	Danska	\N
00040000-557a-a518-42f8-d766bc72cfce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557a-a518-42a7-2b46a218a717	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-a518-d713-9e091200111a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557a-a518-c2ff-5dcdd61d7657	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557a-a518-6f76-d3c04d9d09a7	EG	EGY	818	Egypt 	Egipt	\N
00040000-557a-a518-35f8-a28d531da3c4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557a-a518-a665-958da8fae500	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557a-a518-943f-0e44080ba10e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557a-a518-eda9-4e89476fb3b9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557a-a518-2d6e-388a5b276522	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557a-a518-f47e-8be4a50593e1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557a-a518-142f-3e3349e0aa95	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557a-a518-4a12-b0597f25d01a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557a-a518-e0ae-7f6172cdb018	FI	FIN	246	Finland 	Finska	\N
00040000-557a-a518-5e0b-e4ef811c91e5	FR	FRA	250	France 	Francija	\N
00040000-557a-a518-96cf-9e11b2e1dafe	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557a-a518-d478-1f6a023aa585	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557a-a518-af4d-62dcb996df5a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557a-a518-f660-457569f520ea	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557a-a518-6e01-c39780489782	GA	GAB	266	Gabon 	Gabon	\N
00040000-557a-a518-290f-d9ce7b4b5a50	GM	GMB	270	Gambia 	Gambija	\N
00040000-557a-a518-3c9d-a8c43363a3b8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557a-a518-03eb-b0ce1e40ff92	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557a-a518-9c88-1978414891b5	GH	GHA	288	Ghana 	Gana	\N
00040000-557a-a518-2a44-3368f0cda324	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557a-a518-2fd8-9957e0bb65a6	GR	GRC	300	Greece 	Grčija	\N
00040000-557a-a518-8731-8c1f1cacc0b9	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557a-a518-e089-5cb7defdb88a	GD	GRD	308	Grenada 	Grenada	\N
00040000-557a-a518-dd49-f6cc3c6f602a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557a-a518-bd4a-685af7b13b19	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557a-a518-57a3-35cdd6c63e74	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557a-a518-9954-4771dcd607f5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557a-a518-85fa-2738f474e2ec	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557a-a518-f9e1-ffa020b438b5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557a-a518-5a49-73b4a3a916de	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557a-a518-e25a-025b98cbc0cd	HT	HTI	332	Haiti 	Haiti	\N
00040000-557a-a518-38b0-66f85dc6d18b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557a-a518-2933-f7c24d268878	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557a-a518-d522-529da8a22a19	HN	HND	340	Honduras 	Honduras	\N
00040000-557a-a518-2684-4895b428f39e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557a-a518-d527-082d6d195ce9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557a-a518-538d-66795d804a52	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557a-a518-eacd-042558cdaa96	IN	IND	356	India 	Indija	\N
00040000-557a-a518-33d5-4d328ee5fe64	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557a-a518-7eeb-2a524c7c39e7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557a-a518-b0eb-f69fe314c226	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557a-a518-704c-b291ec386546	IE	IRL	372	Ireland 	Irska	\N
00040000-557a-a518-3d8b-de239a254789	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557a-a518-14e5-f6b44d93b116	IL	ISR	376	Israel 	Izrael	\N
00040000-557a-a518-ab1d-8c3e6c9228c0	IT	ITA	380	Italy 	Italija	\N
00040000-557a-a518-8a38-28258851519a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557a-a518-72a0-3e692ebad67d	JP	JPN	392	Japan 	Japonska	\N
00040000-557a-a518-1b5f-a4eaaab0ec15	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557a-a518-8595-9c635d1c6e55	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557a-a518-29b1-a2d4d931302c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557a-a518-ed18-cf6c92a66e43	KE	KEN	404	Kenya 	Kenija	\N
00040000-557a-a518-2c5c-e96fd1f7a7a9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557a-a518-f734-081e8260bb10	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557a-a518-853f-2da21b12c3f5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557a-a518-bc2c-83e78bf5d588	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557a-a518-3771-916af806c489	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557a-a518-5ff3-cc65d782ceaa	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557a-a518-d49f-ca35f1b64f6c	LV	LVA	428	Latvia 	Latvija	\N
00040000-557a-a518-4cfe-3cfaca185436	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557a-a518-9a2f-aaf46e531d7e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557a-a518-064c-feede969047a	LR	LBR	430	Liberia 	Liberija	\N
00040000-557a-a518-ceb7-dea18d537dad	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557a-a518-5b76-6bf8b7d83f4d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557a-a518-6993-7d9cc38d6469	LT	LTU	440	Lithuania 	Litva	\N
00040000-557a-a518-a10a-f902987f2ece	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557a-a518-eec9-608eccb1a7cb	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557a-a518-a9e2-fdc525a1696b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557a-a518-a83c-6c784a2ec9cf	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557a-a518-5cc8-6a988941e314	MW	MWI	454	Malawi 	Malavi	\N
00040000-557a-a518-33d0-45677aacf3ab	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557a-a518-416e-28c3bad22e3f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557a-a518-2d1d-103cfa91af68	ML	MLI	466	Mali 	Mali	\N
00040000-557a-a518-6df8-743765753fd2	MT	MLT	470	Malta 	Malta	\N
00040000-557a-a518-af57-42ae3b979995	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557a-a518-aa61-92c87e11907a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557a-a518-44de-e7fab178fe94	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557a-a518-907b-9a5ff0be0412	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557a-a518-e4a9-6df99a919c1e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557a-a518-3883-272ae35f85e5	MX	MEX	484	Mexico 	Mehika	\N
00040000-557a-a518-c28a-8ec0f5d7acd5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557a-a518-649d-71992860f68c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557a-a518-43e7-7db7c9853576	MC	MCO	492	Monaco 	Monako	\N
00040000-557a-a518-def2-c1998fa2610d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557a-a518-5581-699006ef7c8b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557a-a518-d053-6942e44bc98b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557a-a518-240f-1f31b82bdcc7	MA	MAR	504	Morocco 	Maroko	\N
00040000-557a-a518-1a29-e8f1205856d3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557a-a518-5f14-689b99a92cc2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557a-a518-3dd0-6a65630adcda	NA	NAM	516	Namibia 	Namibija	\N
00040000-557a-a518-2c73-eb61e1698514	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557a-a518-417a-14043084e625	NP	NPL	524	Nepal 	Nepal	\N
00040000-557a-a518-5f00-254f8124fe1e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557a-a518-600a-373c996d16f4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557a-a518-fda2-7ecc5d4f0b70	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557a-a518-01bf-41e859a7bafb	NE	NER	562	Niger 	Niger 	\N
00040000-557a-a518-557b-0d423e2f269f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557a-a518-2a51-a575c2f5b547	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557a-a518-7284-81f7a95fff68	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557a-a518-03d1-347696cde6d4	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557a-a518-b2a8-8913013def26	NO	NOR	578	Norway 	Norveška	\N
00040000-557a-a518-81e6-04a39239ccc2	OM	OMN	512	Oman 	Oman	\N
00040000-557a-a518-35d1-b0aefcd430c0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557a-a518-4c11-7279d79ceb06	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557a-a518-c5c2-b6cc07f31c2f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557a-a518-5c0b-43af5955f792	PA	PAN	591	Panama 	Panama	\N
00040000-557a-a518-7a40-0ea71b181357	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557a-a518-8db2-d11fb583237e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557a-a518-cdfd-3a28eaaaa5ad	PE	PER	604	Peru 	Peru	\N
00040000-557a-a518-67d3-5fb82a3707d5	PH	PHL	608	Philippines 	Filipini	\N
00040000-557a-a518-4634-85d352971ea1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557a-a518-87b8-0da91ea6e6e8	PL	POL	616	Poland 	Poljska	\N
00040000-557a-a518-f672-df7a105b5a51	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557a-a518-99e7-e08543c8eeb6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557a-a518-af55-8c40c9dab0be	QA	QAT	634	Qatar 	Katar	\N
00040000-557a-a518-563d-7ba0495f3613	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557a-a518-3cf3-87052c9ce8ea	RO	ROU	642	Romania 	Romunija	\N
00040000-557a-a518-80a1-327567bbefc4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557a-a518-f2e0-abb90b295f4b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557a-a518-5c1c-69c200baed13	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557a-a518-aac2-65c200c18bc1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557a-a518-ce45-9d601d707530	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557a-a518-1abf-f6c98f3bb3e0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557a-a518-4e91-2841a18b283b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557a-a518-8499-1e0630dee513	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557a-a518-4f9d-ecc96f9ddefa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557a-a518-e7f3-fa49aba569b5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557a-a518-d008-489244365c7b	SM	SMR	674	San Marino 	San Marino	\N
00040000-557a-a518-f506-4df72ae492e2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557a-a518-1ac2-42f2f24e5409	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557a-a518-ae46-e79a626e3bc5	SN	SEN	686	Senegal 	Senegal	\N
00040000-557a-a518-1b31-7e63c1ab9444	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557a-a518-938d-c8f19f9c1d24	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557a-a518-4d44-f613bfd51213	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557a-a518-ceaf-99ea5b083d5d	SG	SGP	702	Singapore 	Singapur	\N
00040000-557a-a518-bde8-17acf5edbd20	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557a-a518-e0c3-a2a3943b4ce8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557a-a518-2182-8f19a3f16adc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557a-a518-86d2-542ded9be191	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557a-a518-98c8-36473b438383	SO	SOM	706	Somalia 	Somalija	\N
00040000-557a-a518-83ad-c7f4951c2540	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557a-a518-dccf-bbea76c7a97b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557a-a518-5891-c6e60b225302	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557a-a518-82ac-f5b0df3b300b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557a-a518-4f5a-c2fb4774ecaa	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557a-a518-b603-83691973ee38	SD	SDN	729	Sudan 	Sudan	\N
00040000-557a-a518-5ba0-bbcd13d3f191	SR	SUR	740	Suriname 	Surinam	\N
00040000-557a-a518-8dfd-00301828efd1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557a-a518-4874-926f0d92a32f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557a-a518-abc7-5dd42ed28231	SE	SWE	752	Sweden 	Švedska	\N
00040000-557a-a518-6a48-5983200485b2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557a-a518-eea4-6dcaec4521a8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557a-a518-f30f-0c6575298263	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557a-a518-633e-6b755216a372	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557a-a518-820a-3cea0297158e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557a-a518-00e6-613973bfcb7e	TH	THA	764	Thailand 	Tajska	\N
00040000-557a-a518-cc61-46587e7496cd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557a-a518-1f98-7f54ff78a09e	TG	TGO	768	Togo 	Togo	\N
00040000-557a-a518-7b15-2fa40cb74b01	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557a-a518-3d6b-3fee2da28459	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557a-a518-99ef-b9b558aa5f40	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557a-a518-4113-04d7321ed6cd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557a-a518-c7b8-db5e8ead56a1	TR	TUR	792	Turkey 	Turčija	\N
00040000-557a-a518-0cfd-fb5dea6b5313	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557a-a518-6575-2c2fdeb11af9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-a518-f3f2-e345dfc86c77	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557a-a518-3d84-6c7a256e924f	UG	UGA	800	Uganda 	Uganda	\N
00040000-557a-a518-8f5c-a79f52505db2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557a-a518-7e7a-400f293156b0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557a-a518-984c-bd12a635feeb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557a-a518-ba7d-1cf17ff17720	US	USA	840	United States 	Združene države Amerike	\N
00040000-557a-a518-955c-fb22e25e5580	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557a-a518-15f0-59b4ac3e3e55	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557a-a518-7552-cc42cec2f185	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557a-a518-e88c-9f9d73b2451f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557a-a518-b415-44d90cbcf339	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557a-a518-a170-6766ec95d709	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557a-a518-2cdb-a8a77524af98	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-a518-8e27-c1f144780a88	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557a-a518-a7a1-5d96c196b623	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557a-a518-47f0-63aa1944e5e1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557a-a518-6a8b-58d394bfb11b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557a-a518-f788-dcedbf3de75e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557a-a518-bda0-20f71003624a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7009771)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7009574)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557a-a519-f8be-8b1e4f4541ae	000e0000-557a-a519-cdf2-55d280d5ade2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557a-a518-85fc-90451f7345e1
000d0000-557a-a519-efb2-9d8670d57e3f	000e0000-557a-a519-cdf2-55d280d5ade2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-a518-85fc-90451f7345e1
000d0000-557a-a519-6280-9e2fd10d9219	000e0000-557a-a519-cdf2-55d280d5ade2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557a-a518-b207-4238e5e9f400
000d0000-557a-a519-d8d4-38d80f40c4a7	000e0000-557a-a519-cdf2-55d280d5ade2	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557a-a518-1389-01d19c8b0c30
000d0000-557a-a519-9399-5b293072c436	000e0000-557a-a519-cdf2-55d280d5ade2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557a-a518-1389-01d19c8b0c30
000d0000-557a-a519-3b3f-d5a5736fa4ae	000e0000-557a-a519-cdf2-55d280d5ade2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557a-a518-1389-01d19c8b0c30
000d0000-557a-a519-c22d-f99568a05f0b	000e0000-557a-a519-cdf2-55d280d5ade2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-a518-85fc-90451f7345e1
\.


--
-- TOC entry 2839 (class 0 OID 7009393)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7009442)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7009373)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557a-a519-40cf-f49db04bf3ab	00080000-557a-a519-8faf-c62d88e2595c	00090000-557a-a519-a9bb-e8f37847fcf3	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7009491)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7009516)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7009330)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557a-a518-3a02-805ddd29aaa4	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557a-a518-8815-f52aaa407a5c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557a-a518-1ce1-d96ac29d6bcf	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557a-a518-60f4-5c0417dc9f7e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557a-a518-7a98-28b1c12a35b9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557a-a518-9791-8dfd33bd13ff	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557a-a518-36b4-2c27c23ac6cb	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557a-a518-8f48-b7635f6f86a1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557a-a518-f5d6-da57f57cc5ea	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557a-a518-8f13-59747db0d9ee	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557a-a518-726a-6fe4b6b4c1f1	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557a-a518-3ff9-b8c450b017d1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557a-a518-120c-dd61aee8fcdf	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-a518-6ca6-ec8fd422b79d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-a518-6465-3ad12f849506	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557a-a518-4bd7-871b56024514	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7009243)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557a-a518-69f2-85cdd829d04f	00000000-557a-a518-7a98-28b1c12a35b9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557a-a518-d286-ef3ccdd88672	00000000-557a-a518-7a98-28b1c12a35b9	00010000-557a-a518-3b79-43edeced246c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557a-a518-058d-a74fd5e36489	00000000-557a-a518-9791-8dfd33bd13ff	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7009254)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557a-a519-e60e-586ac4acbaac	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557a-a519-ad17-ec4e2423e87d	00010000-557a-a519-6b61-1cb824c6e5be	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557a-a519-b24d-daf97d0afc06	00010000-557a-a519-2a62-73a4d9f2bc36	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557a-a519-ab11-cb5613cbf9a5	00010000-557a-a519-1287-233462a1db30	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557a-a519-81fe-0e512883b614	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557a-a519-792b-a68fa246b2ad	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557a-a519-0827-d87f3cdf21d1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557a-a519-b9a5-28b8ea5eec93	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557a-a519-a9bb-e8f37847fcf3	00010000-557a-a519-dbab-c111bd81d1c8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557a-a519-846e-ab41872fe3bd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557a-a519-f4cb-2efe2b196ebb	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557a-a519-5397-6b392ac6805f	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557a-a519-991e-a5d58578d2ae	00010000-557a-a519-ac4d-85a7e491e48f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7009208)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557a-a518-bce6-dfc385dc5556	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557a-a518-c3aa-3758e30e6684	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557a-a518-5484-5f98e4af31fe	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557a-a518-6c1e-9260b96a019e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557a-a518-239a-f5933094be2a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557a-a518-33d2-bf0b7308d1d2	Abonma-read	Abonma - branje	f
00030000-557a-a518-ab7f-fcad812b9185	Abonma-write	Abonma - spreminjanje	f
00030000-557a-a518-03b2-0ce8626d016d	Alternacija-read	Alternacija - branje	f
00030000-557a-a518-9af5-85e8602784bc	Alternacija-write	Alternacija - spreminjanje	f
00030000-557a-a518-a94b-f2e179321241	Arhivalija-read	Arhivalija - branje	f
00030000-557a-a518-de0d-e31dc5902ddc	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557a-a518-7b74-4cc54da4c18d	Besedilo-read	Besedilo - branje	f
00030000-557a-a518-4a80-0fc89d2e3f3e	Besedilo-write	Besedilo - spreminjanje	f
00030000-557a-a518-5239-ed55effc0aec	DogodekIzven-read	DogodekIzven - branje	f
00030000-557a-a518-cc33-0bd57768d7ba	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557a-a518-4daf-ba6905839fb6	Dogodek-read	Dogodek - branje	f
00030000-557a-a518-3ede-4470dbfe91f0	Dogodek-write	Dogodek - spreminjanje	f
00030000-557a-a518-6073-cf33c278cf32	Drzava-read	Drzava - branje	f
00030000-557a-a518-48f1-a431041cdfed	Drzava-write	Drzava - spreminjanje	f
00030000-557a-a518-00b7-94641e389733	Funkcija-read	Funkcija - branje	f
00030000-557a-a518-2dd9-d88cfc2071af	Funkcija-write	Funkcija - spreminjanje	f
00030000-557a-a518-4347-19277b6ef60a	Gostovanje-read	Gostovanje - branje	f
00030000-557a-a518-663b-96d19be45d3c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557a-a518-bc1f-fbfc59287f0f	Gostujoca-read	Gostujoca - branje	f
00030000-557a-a518-70ef-2aaab774c709	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557a-a518-505c-5289fd722493	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557a-a518-cbea-0043f06a671d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557a-a518-0d2b-0ae919a1a9c7	Kupec-read	Kupec - branje	f
00030000-557a-a518-77b5-ebb215966517	Kupec-write	Kupec - spreminjanje	f
00030000-557a-a518-ae9e-303a18243ef2	NacinPlacina-read	NacinPlacina - branje	f
00030000-557a-a518-b4d3-9605b1529f4c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557a-a518-203b-bca3f6c636e4	Option-read	Option - branje	f
00030000-557a-a518-cdd6-06d292d7951f	Option-write	Option - spreminjanje	f
00030000-557a-a518-fa56-6a72ada70eaf	OptionValue-read	OptionValue - branje	f
00030000-557a-a518-b952-22a1766613a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-557a-a518-8f0c-79aae9e1ba4f	Oseba-read	Oseba - branje	f
00030000-557a-a518-7587-1f1a20695339	Oseba-write	Oseba - spreminjanje	f
00030000-557a-a518-7eb5-83a4ec0d5bc5	Permission-read	Permission - branje	f
00030000-557a-a518-7851-79845339b1b6	Permission-write	Permission - spreminjanje	f
00030000-557a-a518-6689-7740b964f15e	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557a-a518-a4d4-26f1fc31c7ee	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557a-a518-bed8-7e0dfb1a1c1a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557a-a518-7e7e-a8a9722954b4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557a-a518-eac5-0f28bd16b742	Pogodba-read	Pogodba - branje	f
00030000-557a-a518-fbfc-1b5417a9a362	Pogodba-write	Pogodba - spreminjanje	f
00030000-557a-a518-db85-ecfc88940757	Popa-read	Popa - branje	f
00030000-557a-a518-c584-e46e3e3cfb6e	Popa-write	Popa - spreminjanje	f
00030000-557a-a518-dca6-188ba757f162	Posta-read	Posta - branje	f
00030000-557a-a518-7cd9-1d7616a8bdde	Posta-write	Posta - spreminjanje	f
00030000-557a-a518-c16f-ea24d8a4987c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557a-a518-b516-9d4f5b73b676	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557a-a518-eccf-e4b842567936	PostniNaslov-read	PostniNaslov - branje	f
00030000-557a-a518-9948-ff99e4ee2d86	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557a-a518-f0af-a3924160157f	Predstava-read	Predstava - branje	f
00030000-557a-a518-7b44-60756038023e	Predstava-write	Predstava - spreminjanje	f
00030000-557a-a518-57f9-d1ca38b04539	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557a-a518-1896-5f8bad09f604	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557a-a518-3626-f44b4821874a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557a-a518-b70a-f5275672a379	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557a-a518-00d2-5a42dde37944	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557a-a518-31cf-2eea126221ad	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557a-a518-4f20-091042b9ed7c	ProgramDela-read	ProgramDela - branje	f
00030000-557a-a518-eb3d-b6c12c960200	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557a-a518-4211-c0756e9ec0ce	ProgramFestival-read	ProgramFestival - branje	f
00030000-557a-a518-c844-b3517f2fc787	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557a-a518-7712-bbf3f3788f3b	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557a-a518-8eef-cce478046b38	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557a-a518-0360-8d028c510e7b	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557a-a518-94df-71686d38a09e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557a-a518-bd2a-d78dc98ddd49	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557a-a518-e4cb-d300a855325f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557a-a518-b57e-2f265b550d15	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557a-a518-d904-f7cd0424caf9	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557a-a518-1900-77157200fa73	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557a-a518-b7b8-1e5aa1564e2b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557a-a518-8fd6-b52f6ca07b16	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557a-a518-70b4-79a8d7a1d902	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557a-a518-cd00-84c09d367eb0	ProgramRazno-read	ProgramRazno - branje	f
00030000-557a-a518-4e57-30f2f45bb465	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557a-a518-1b4a-221163ee46c6	Prostor-read	Prostor - branje	f
00030000-557a-a518-6455-3e5caa999c7f	Prostor-write	Prostor - spreminjanje	f
00030000-557a-a518-9125-960fb623abe3	Racun-read	Racun - branje	f
00030000-557a-a518-fb4d-d6fe6d19964e	Racun-write	Racun - spreminjanje	f
00030000-557a-a518-a7f4-989ffcc45179	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557a-a518-c10d-4151e51e85f1	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557a-a518-bd4f-9ccee98e6d89	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557a-a518-aa59-d0dab6d80ad3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557a-a518-bae2-99d885cb940f	Rekvizit-read	Rekvizit - branje	f
00030000-557a-a518-dcdc-263024c9f494	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557a-a518-ebbb-c75a728eb74f	Revizija-read	Revizija - branje	f
00030000-557a-a518-7ff0-37b66bd8ec42	Revizija-write	Revizija - spreminjanje	f
00030000-557a-a518-2fb9-b299a4b765a1	Rezervacija-read	Rezervacija - branje	f
00030000-557a-a518-e86b-bd4dc5a58ef0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557a-a518-590b-4d62fb844fdf	Role-read	Role - branje	f
00030000-557a-a518-d5b3-ff4a8fa2d355	Role-write	Role - spreminjanje	f
00030000-557a-a518-d721-a173446a6ad4	SedezniRed-read	SedezniRed - branje	f
00030000-557a-a518-7a8b-31eefc6a98d1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557a-a518-f3b0-741c951631a6	Sedez-read	Sedez - branje	f
00030000-557a-a518-aed4-ef5211ccc476	Sedez-write	Sedez - spreminjanje	f
00030000-557a-a518-7e04-3da229933a1b	Sezona-read	Sezona - branje	f
00030000-557a-a518-8704-72cfe7b248da	Sezona-write	Sezona - spreminjanje	f
00030000-557a-a518-896e-7af7248a61e9	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557a-a518-a0f6-e66d5da25160	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557a-a518-5598-46dcd807d6fe	Stevilcenje-read	Stevilcenje - branje	f
00030000-557a-a518-db55-27808279b52a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557a-a518-a735-d40d53415ebb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557a-a518-a059-71cb00bde81f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557a-a518-add0-b81370be3f3b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557a-a518-dbca-e5012c34da78	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557a-a518-8e87-19e37025948e	Telefonska-read	Telefonska - branje	f
00030000-557a-a518-87e8-6781d60e6cc7	Telefonska-write	Telefonska - spreminjanje	f
00030000-557a-a518-e324-418397876f97	TerminStoritve-read	TerminStoritve - branje	f
00030000-557a-a518-bfc9-24f056e6146f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557a-a518-7c03-d1f648c18e57	TipFunkcije-read	TipFunkcije - branje	f
00030000-557a-a518-d8f7-4b70de48dddd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557a-a518-631b-10a88ff3106e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557a-a518-5b70-2b99eecb08ee	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557a-a518-0238-3b7172da57ea	Trr-read	Trr - branje	f
00030000-557a-a518-0642-fba7b035d3ce	Trr-write	Trr - spreminjanje	f
00030000-557a-a518-2768-e398b2e36639	Uprizoritev-read	Uprizoritev - branje	f
00030000-557a-a518-48b4-f3a81d89a459	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557a-a518-2f3d-880d3275728c	User-read	User - branje	f
00030000-557a-a518-30a6-e1c66e635e7e	User-write	User - spreminjanje	f
00030000-557a-a518-9969-b31d1e6fe906	Vaja-read	Vaja - branje	f
00030000-557a-a518-ac97-2b9d03c307aa	Vaja-write	Vaja - spreminjanje	f
00030000-557a-a518-7eb4-541ce59a6c8c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557a-a518-325a-424bdfadb168	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557a-a518-3c73-442f9c8d7cfe	Zaposlitev-read	Zaposlitev - branje	f
00030000-557a-a518-38d1-87705eb837a3	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557a-a518-c83a-ce4eeb4caf82	Zasedenost-read	Zasedenost - branje	f
00030000-557a-a518-1333-41c78a639df4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557a-a518-63d5-70fc380931bb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557a-a518-c6be-4103fcf93a2b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557a-a518-adf2-b8b8827559a3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557a-a518-a70a-748e5f155a1c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7009227)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557a-a518-a12e-c9fe2c85ea29	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-33d2-bf0b7308d1d2
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-ab7f-fcad812b9185
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-03b2-0ce8626d016d
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-9af5-85e8602784bc
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-a94b-f2e179321241
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-4daf-ba6905839fb6
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-6c1e-9260b96a019e
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-3ede-4470dbfe91f0
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-48f1-a431041cdfed
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-00b7-94641e389733
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-2dd9-d88cfc2071af
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-4347-19277b6ef60a
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-663b-96d19be45d3c
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-bc1f-fbfc59287f0f
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-70ef-2aaab774c709
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-505c-5289fd722493
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-cbea-0043f06a671d
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-203b-bca3f6c636e4
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-fa56-6a72ada70eaf
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-8f0c-79aae9e1ba4f
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-7587-1f1a20695339
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-db85-ecfc88940757
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-c584-e46e3e3cfb6e
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-dca6-188ba757f162
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-7cd9-1d7616a8bdde
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-eccf-e4b842567936
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-9948-ff99e4ee2d86
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-f0af-a3924160157f
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-7b44-60756038023e
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-00d2-5a42dde37944
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-31cf-2eea126221ad
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-1b4a-221163ee46c6
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-6455-3e5caa999c7f
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-bd4f-9ccee98e6d89
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-aa59-d0dab6d80ad3
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-bae2-99d885cb940f
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-dcdc-263024c9f494
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-7e04-3da229933a1b
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-8704-72cfe7b248da
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-7c03-d1f648c18e57
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-2768-e398b2e36639
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-48b4-f3a81d89a459
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-9969-b31d1e6fe906
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-ac97-2b9d03c307aa
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-c83a-ce4eeb4caf82
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-1333-41c78a639df4
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-63d5-70fc380931bb
00020000-557a-a518-4b41-035d691a1b2c	00030000-557a-a518-adf2-b8b8827559a3
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-33d2-bf0b7308d1d2
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-a94b-f2e179321241
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-4daf-ba6905839fb6
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-4347-19277b6ef60a
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-bc1f-fbfc59287f0f
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-505c-5289fd722493
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-cbea-0043f06a671d
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-203b-bca3f6c636e4
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-fa56-6a72ada70eaf
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-8f0c-79aae9e1ba4f
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-7587-1f1a20695339
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-db85-ecfc88940757
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-dca6-188ba757f162
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-eccf-e4b842567936
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-9948-ff99e4ee2d86
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-f0af-a3924160157f
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-1b4a-221163ee46c6
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-bd4f-9ccee98e6d89
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-bae2-99d885cb940f
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-7e04-3da229933a1b
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-8e87-19e37025948e
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-87e8-6781d60e6cc7
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-0238-3b7172da57ea
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-0642-fba7b035d3ce
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-3c73-442f9c8d7cfe
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-38d1-87705eb837a3
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-63d5-70fc380931bb
00020000-557a-a518-d051-8d2764add4bd	00030000-557a-a518-adf2-b8b8827559a3
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-33d2-bf0b7308d1d2
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-03b2-0ce8626d016d
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-a94b-f2e179321241
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-de0d-e31dc5902ddc
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-7b74-4cc54da4c18d
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-5239-ed55effc0aec
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-4daf-ba6905839fb6
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-00b7-94641e389733
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-4347-19277b6ef60a
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-bc1f-fbfc59287f0f
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-505c-5289fd722493
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-203b-bca3f6c636e4
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-fa56-6a72ada70eaf
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-8f0c-79aae9e1ba4f
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-db85-ecfc88940757
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-dca6-188ba757f162
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-f0af-a3924160157f
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-00d2-5a42dde37944
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-1b4a-221163ee46c6
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-bd4f-9ccee98e6d89
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-bae2-99d885cb940f
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-7e04-3da229933a1b
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-7c03-d1f648c18e57
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-9969-b31d1e6fe906
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-c83a-ce4eeb4caf82
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-63d5-70fc380931bb
00020000-557a-a518-2521-2341f78aa747	00030000-557a-a518-adf2-b8b8827559a3
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-33d2-bf0b7308d1d2
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-ab7f-fcad812b9185
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-9af5-85e8602784bc
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-a94b-f2e179321241
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-4daf-ba6905839fb6
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-4347-19277b6ef60a
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-bc1f-fbfc59287f0f
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-203b-bca3f6c636e4
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-fa56-6a72ada70eaf
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-db85-ecfc88940757
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-dca6-188ba757f162
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-f0af-a3924160157f
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-1b4a-221163ee46c6
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-bd4f-9ccee98e6d89
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-bae2-99d885cb940f
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-7e04-3da229933a1b
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-7c03-d1f648c18e57
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-63d5-70fc380931bb
00020000-557a-a518-66de-efa28a2d1aeb	00030000-557a-a518-adf2-b8b8827559a3
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-33d2-bf0b7308d1d2
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-a94b-f2e179321241
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-4daf-ba6905839fb6
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-6073-cf33c278cf32
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-4347-19277b6ef60a
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-bc1f-fbfc59287f0f
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-203b-bca3f6c636e4
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-fa56-6a72ada70eaf
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-db85-ecfc88940757
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-dca6-188ba757f162
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-f0af-a3924160157f
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-1b4a-221163ee46c6
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-bd4f-9ccee98e6d89
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-bae2-99d885cb940f
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-7e04-3da229933a1b
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-e324-418397876f97
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-5484-5f98e4af31fe
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-7c03-d1f648c18e57
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-63d5-70fc380931bb
00020000-557a-a518-8342-7ad8f78c3a8c	00030000-557a-a518-adf2-b8b8827559a3
\.


--
-- TOC entry 2854 (class 0 OID 7009523)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7009554)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7009690)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7009287)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557a-a519-8faf-c62d88e2595c	00040000-557a-a518-aa6e-2785311bcb1b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-a519-5fde-25efc8cc8d4c	00040000-557a-a518-aa6e-2785311bcb1b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-a519-b27d-6356542a3b83	00040000-557a-a518-aa6e-2785311bcb1b	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-a519-29f4-1101426c2a1f	00040000-557a-a518-aa6e-2785311bcb1b	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7009322)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557a-a517-e455-e98474f1cd12	8341	Adlešiči
00050000-557a-a517-8882-8f2544f4eeff	5270	Ajdovščina
00050000-557a-a517-5ca6-d1f2b0f8d5bb	6280	Ankaran/Ancarano
00050000-557a-a517-44d4-5178c1b1a0da	9253	Apače
00050000-557a-a517-b715-82906ecb1617	8253	Artiče
00050000-557a-a517-c066-4f851d3032c0	4275	Begunje na Gorenjskem
00050000-557a-a517-1701-856090498a4f	1382	Begunje pri Cerknici
00050000-557a-a517-3ab4-628d3b3bd10f	9231	Beltinci
00050000-557a-a517-48b8-6176e70dfe57	2234	Benedikt
00050000-557a-a517-64fa-6d21ac114123	2345	Bistrica ob Dravi
00050000-557a-a517-1996-38c2d910d7be	3256	Bistrica ob Sotli
00050000-557a-a517-050e-5add6cbb198e	8259	Bizeljsko
00050000-557a-a517-8cc9-3b5a5a97c238	1223	Blagovica
00050000-557a-a517-a22c-de37746504f5	8283	Blanca
00050000-557a-a517-5b1a-1e442227d758	4260	Bled
00050000-557a-a517-aa3b-72fa0b4f52a6	4273	Blejska Dobrava
00050000-557a-a517-aed8-05cee324e159	9265	Bodonci
00050000-557a-a517-c0df-c57d018580cd	9222	Bogojina
00050000-557a-a517-0f4e-62b16f2c925c	4263	Bohinjska Bela
00050000-557a-a517-914c-d1aad2bf6e8d	4264	Bohinjska Bistrica
00050000-557a-a517-88a6-1ac626a20a06	4265	Bohinjsko jezero
00050000-557a-a517-a588-c5dc3333aa6b	1353	Borovnica
00050000-557a-a517-7a1f-1e432aa5e7eb	8294	Boštanj
00050000-557a-a517-6606-4ee298a74cfd	5230	Bovec
00050000-557a-a517-d16b-9a955a4efd30	5295	Branik
00050000-557a-a517-1cf7-cc06fc13e9ae	3314	Braslovče
00050000-557a-a517-a7a7-8958f960874c	5223	Breginj
00050000-557a-a517-9e72-fd7a4ceeb21a	8280	Brestanica
00050000-557a-a517-9f2e-7e1b12d9d85d	2354	Bresternica
00050000-557a-a517-7a89-5514a81255cc	4243	Brezje
00050000-557a-a517-4ab1-8aadf8135575	1351	Brezovica pri Ljubljani
00050000-557a-a517-7047-9613c539b70a	8250	Brežice
00050000-557a-a517-ab9b-175d8a46975d	4210	Brnik - Aerodrom
00050000-557a-a517-661d-dc08c6e7d4f0	8321	Brusnice
00050000-557a-a517-8f7a-0880d044b841	3255	Buče
00050000-557a-a517-65c7-bca358d35f3d	8276	Bučka 
00050000-557a-a517-03a1-10514f7a5b52	9261	Cankova
00050000-557a-a517-8cdd-f7900687be88	3000	Celje 
00050000-557a-a517-2197-e3407ee1e480	3001	Celje - poštni predali
00050000-557a-a517-02a0-462360e3ebaa	4207	Cerklje na Gorenjskem
00050000-557a-a517-51fa-dfdd013057fb	8263	Cerklje ob Krki
00050000-557a-a517-da20-d311c6165d37	1380	Cerknica
00050000-557a-a517-6097-986051e912d1	5282	Cerkno
00050000-557a-a517-be6c-c91a40530c3e	2236	Cerkvenjak
00050000-557a-a517-57f1-b685af72ace6	2215	Ceršak
00050000-557a-a517-fdad-9d9ddf83da2b	2326	Cirkovce
00050000-557a-a517-a098-3681437c60e3	2282	Cirkulane
00050000-557a-a517-972c-62c2f3a16cca	5273	Col
00050000-557a-a517-92dd-1e04f27a1061	8251	Čatež ob Savi
00050000-557a-a517-10a3-7141a07cd032	1413	Čemšenik
00050000-557a-a517-78eb-f132551365c4	5253	Čepovan
00050000-557a-a517-a40a-a3b1df7bd2de	9232	Črenšovci
00050000-557a-a517-c6a7-9c560f9283f3	2393	Črna na Koroškem
00050000-557a-a517-1161-2c3014ea8df4	6275	Črni Kal
00050000-557a-a517-85f0-6f5d1b5b02a6	5274	Črni Vrh nad Idrijo
00050000-557a-a517-52af-d538386b1b2e	5262	Črniče
00050000-557a-a517-c044-e780d5c95fc7	8340	Črnomelj
00050000-557a-a517-9ecc-56a87e804bda	6271	Dekani
00050000-557a-a517-51cc-0edba685be9d	5210	Deskle
00050000-557a-a517-5ef8-8ba0de6a55af	2253	Destrnik
00050000-557a-a517-22e0-d0bca9f01473	6215	Divača
00050000-557a-a517-78dd-387bbc88f718	1233	Dob
00050000-557a-a517-bf29-02c5c9af190d	3224	Dobje pri Planini
00050000-557a-a517-67be-57ba0e66708b	8257	Dobova
00050000-557a-a517-5d25-1b67e7346c68	1423	Dobovec
00050000-557a-a517-b889-a5a2befefb75	5263	Dobravlje
00050000-557a-a517-aab9-005137b0a367	3204	Dobrna
00050000-557a-a517-7abd-3ce07833fe2a	8211	Dobrnič
00050000-557a-a517-c936-6663e5e2c583	1356	Dobrova
00050000-557a-a517-429a-1f3cfdb6127e	9223	Dobrovnik/Dobronak 
00050000-557a-a517-8f0f-6fdc885f9fd8	5212	Dobrovo v Brdih
00050000-557a-a517-8414-733eb461428c	1431	Dol pri Hrastniku
00050000-557a-a517-3da4-ab2c0468e3f8	1262	Dol pri Ljubljani
00050000-557a-a517-9ce0-7c93d553684e	1273	Dole pri Litiji
00050000-557a-a517-e2b8-e98e135db0a1	1331	Dolenja vas
00050000-557a-a517-f7cc-cdf3d1e9c84f	8350	Dolenjske Toplice
00050000-557a-a517-fe6f-72f3011c1411	1230	Domžale
00050000-557a-a517-b91a-f361a151e7dc	2252	Dornava
00050000-557a-a517-9c8e-2df06c3c7c29	5294	Dornberk
00050000-557a-a517-e0da-15d536b2e8b4	1319	Draga
00050000-557a-a517-f8da-46e6e1ae4394	8343	Dragatuš
00050000-557a-a517-47b1-627fcaefb4ba	3222	Dramlje
00050000-557a-a517-6022-c56e26d056d9	2370	Dravograd
00050000-557a-a517-abc4-ad59d5611ae0	4203	Duplje
00050000-557a-a517-0ec6-9715e92f7c36	6221	Dutovlje
00050000-557a-a517-07c4-6fc1ad45eb18	8361	Dvor
00050000-557a-a517-2d4f-ed1673a7e07b	2343	Fala
00050000-557a-a517-567d-91609f8054ff	9208	Fokovci
00050000-557a-a517-493a-84f5cc77ab5d	2313	Fram
00050000-557a-a517-ef9c-cc6ff13180c5	3213	Frankolovo
00050000-557a-a517-7093-cad29e36cbe7	1274	Gabrovka
00050000-557a-a517-3627-b8b248836e2f	8254	Globoko
00050000-557a-a517-fb31-aa71d735f48a	5275	Godovič
00050000-557a-a517-ea72-84aaec799ea7	4204	Golnik
00050000-557a-a517-383c-1c466398261a	3303	Gomilsko
00050000-557a-a517-d909-2309e9e50925	4224	Gorenja vas
00050000-557a-a517-f4ba-d872eab57264	3263	Gorica pri Slivnici
00050000-557a-a517-b689-f3aa0f046069	2272	Gorišnica
00050000-557a-a517-dd26-04a60e421307	9250	Gornja Radgona
00050000-557a-a517-4da0-34af96c08909	3342	Gornji Grad
00050000-557a-a517-ee78-0e904e2ba1a7	4282	Gozd Martuljek
00050000-557a-a517-456f-c53bab4ff63e	6272	Gračišče
00050000-557a-a517-835c-1bf3d45f9137	9264	Grad
00050000-557a-a517-b22b-af24aea6826c	8332	Gradac
00050000-557a-a517-2f11-dbb2b134d8ba	1384	Grahovo
00050000-557a-a517-a7f4-10c447e87101	5242	Grahovo ob Bači
00050000-557a-a517-7e44-5e2a1a01e356	5251	Grgar
00050000-557a-a517-0cc4-3bcaf043ccd4	3302	Griže
00050000-557a-a517-45d1-ded8b6bcf257	3231	Grobelno
00050000-557a-a517-8250-6220b33117d4	1290	Grosuplje
00050000-557a-a517-756a-5aaf8e839b61	2288	Hajdina
00050000-557a-a517-7146-b142d6f3092f	8362	Hinje
00050000-557a-a517-827b-dc03cb6bfc56	2311	Hoče
00050000-557a-a517-1045-f43cedbce890	9205	Hodoš/Hodos
00050000-557a-a517-2771-caba31fe5198	1354	Horjul
00050000-557a-a517-a273-51cb07290571	1372	Hotedršica
00050000-557a-a517-6c72-94bb178c04d5	1430	Hrastnik
00050000-557a-a517-2395-2e779e6e90dc	6225	Hruševje
00050000-557a-a517-9a95-1466e8f6d650	4276	Hrušica
00050000-557a-a517-697a-35850b7c4b38	5280	Idrija
00050000-557a-a517-3f0d-949c85aa69f2	1292	Ig
00050000-557a-a517-a903-16781de7021b	6250	Ilirska Bistrica
00050000-557a-a517-398a-1584dcf88d5e	6251	Ilirska Bistrica-Trnovo
00050000-557a-a517-8fff-a56f7f5833c5	1295	Ivančna Gorica
00050000-557a-a517-7e3c-b2680a987857	2259	Ivanjkovci
00050000-557a-a517-1ad4-919240a25337	1411	Izlake
00050000-557a-a517-4814-7fdfbd73c566	6310	Izola/Isola
00050000-557a-a517-a861-c3d26d22e86c	2222	Jakobski Dol
00050000-557a-a517-4a7c-530b07cd26f4	2221	Jarenina
00050000-557a-a517-98a6-8f545d981662	6254	Jelšane
00050000-557a-a517-4df7-d60cd699e38b	4270	Jesenice
00050000-557a-a517-e4d4-a9a8ccad3952	8261	Jesenice na Dolenjskem
00050000-557a-a517-cf57-d0075758509b	3273	Jurklošter
00050000-557a-a517-ac54-98ba7ee4ce26	2223	Jurovski Dol
00050000-557a-a517-f9e1-4ecafd8e30ec	2256	Juršinci
00050000-557a-a517-bc09-7a3065a69d27	5214	Kal nad Kanalom
00050000-557a-a517-9e62-0421c46b21c4	3233	Kalobje
00050000-557a-a517-8a7d-9661c35c9c46	4246	Kamna Gorica
00050000-557a-a517-1996-d0bdc35a1835	2351	Kamnica
00050000-557a-a517-3821-7e935c48e2af	1241	Kamnik
00050000-557a-a517-2e59-a261c53dfdc1	5213	Kanal
00050000-557a-a517-ecb9-4daab4fc7af8	8258	Kapele
00050000-557a-a517-6e3e-ef398c0bfe19	2362	Kapla
00050000-557a-a517-a740-e3583b8f1851	2325	Kidričevo
00050000-557a-a517-37fe-f6ab3636347a	1412	Kisovec
00050000-557a-a517-8244-1ae29de7a7d4	6253	Knežak
00050000-557a-a517-af2f-5d52673e04e7	5222	Kobarid
00050000-557a-a517-595e-6ab119ce3904	9227	Kobilje
00050000-557a-a517-d09c-b3bf20c6a623	1330	Kočevje
00050000-557a-a517-15c6-614333b9071e	1338	Kočevska Reka
00050000-557a-a517-c4b9-f9daf7b41e96	2276	Kog
00050000-557a-a517-420b-c752263e44f9	5211	Kojsko
00050000-557a-a517-f3db-3d8472624934	6223	Komen
00050000-557a-a517-5167-0046c6779bf6	1218	Komenda
00050000-557a-a517-8f7b-46086d4b7941	6000	Koper/Capodistria 
00050000-557a-a517-498e-568e64d687de	6001	Koper/Capodistria - poštni predali
00050000-557a-a517-17bc-0efb86d32aff	8282	Koprivnica
00050000-557a-a517-0568-2e5f80996302	5296	Kostanjevica na Krasu
00050000-557a-a517-1447-4687be4c3b89	8311	Kostanjevica na Krki
00050000-557a-a517-27cd-15294d24c24b	1336	Kostel
00050000-557a-a517-7eef-6405a7aed28c	6256	Košana
00050000-557a-a517-799b-4f41bad72d51	2394	Kotlje
00050000-557a-a517-0e01-c8c889b0b288	6240	Kozina
00050000-557a-a517-c647-712911646e1b	3260	Kozje
00050000-557a-a517-4b37-56b0e2ded529	4000	Kranj 
00050000-557a-a517-767c-155d75daa67f	4001	Kranj - poštni predali
00050000-557a-a517-1bb0-bb69bc4ab0c5	4280	Kranjska Gora
00050000-557a-a517-9325-bfed9050aca9	1281	Kresnice
00050000-557a-a517-5982-6eefb49f4e7d	4294	Križe
00050000-557a-a517-89e1-34080def3a59	9206	Križevci
00050000-557a-a517-9b5c-fb8efd43d7cb	9242	Križevci pri Ljutomeru
00050000-557a-a517-a136-e3760e3223ea	1301	Krka
00050000-557a-a517-477e-f41cd8541087	8296	Krmelj
00050000-557a-a517-f288-ea683eabb9e3	4245	Kropa
00050000-557a-a517-4eab-563482959242	8262	Krška vas
00050000-557a-a517-1414-97c9281e5130	8270	Krško
00050000-557a-a517-25b7-a7a84c3a89ab	9263	Kuzma
00050000-557a-a517-d856-8e43d6ae1798	2318	Laporje
00050000-557a-a517-18f4-f1715d241557	3270	Laško
00050000-557a-a517-1b2b-f4cb58f687a5	1219	Laze v Tuhinju
00050000-557a-a517-f78f-5069008b0012	2230	Lenart v Slovenskih goricah
00050000-557a-a517-06c3-b5583e7afe25	9220	Lendava/Lendva
00050000-557a-a517-6eff-e9d9fc8b428c	4248	Lesce
00050000-557a-a517-0ba0-c63204ab51c4	3261	Lesično
00050000-557a-a517-7dda-401ae3b69534	8273	Leskovec pri Krškem
00050000-557a-a517-374c-b2cff761893f	2372	Libeliče
00050000-557a-a517-8f2b-0c00955844b3	2341	Limbuš
00050000-557a-a517-7fbd-7b17cc8e05cb	1270	Litija
00050000-557a-a517-b20f-8e02e5f4744f	3202	Ljubečna
00050000-557a-a517-75de-9b13fb73fdd1	1000	Ljubljana 
00050000-557a-a517-8e9b-8fe7c5ec1c4c	1001	Ljubljana - poštni predali
00050000-557a-a517-9991-c0b7996faf92	1231	Ljubljana - Črnuče
00050000-557a-a517-3452-fbad131ad6d9	1261	Ljubljana - Dobrunje
00050000-557a-a517-e69c-ef71ee5c5b67	1260	Ljubljana - Polje
00050000-557a-a517-beee-d5a7be344389	1210	Ljubljana - Šentvid
00050000-557a-a517-f110-404eb2b80c80	1211	Ljubljana - Šmartno
00050000-557a-a517-b66b-33cae2d70891	3333	Ljubno ob Savinji
00050000-557a-a517-0053-372f78050a95	9240	Ljutomer
00050000-557a-a517-d3e3-d711f07ddf65	3215	Loče
00050000-557a-a517-ac50-dd23c34923d8	5231	Log pod Mangartom
00050000-557a-a517-1e6a-c149f2f30b35	1358	Log pri Brezovici
00050000-557a-a517-3178-7710da51a70b	1370	Logatec
00050000-557a-a517-8074-4214ee073323	1371	Logatec
00050000-557a-a517-b48f-8f464915cfbc	1434	Loka pri Zidanem Mostu
00050000-557a-a517-bf33-13421bcac709	3223	Loka pri Žusmu
00050000-557a-a517-0b30-066da68e7fa8	6219	Lokev
00050000-557a-a517-aa59-839f3515afbb	1318	Loški Potok
00050000-557a-a517-3acf-8c03f899255c	2324	Lovrenc na Dravskem polju
00050000-557a-a517-3b96-209383799bb4	2344	Lovrenc na Pohorju
00050000-557a-a517-fd5b-554e575021ec	3334	Luče
00050000-557a-a517-bdb9-fad06ca55e4e	1225	Lukovica
00050000-557a-a517-57a1-14135621bb9d	9202	Mačkovci
00050000-557a-a517-ad19-ab0cc990aa0a	2322	Majšperk
00050000-557a-a517-4a23-65fa7925cca5	2321	Makole
00050000-557a-a517-aba2-cf2a06e99532	9243	Mala Nedelja
00050000-557a-a517-b834-804e493d6b81	2229	Malečnik
00050000-557a-a517-634d-242a83018cea	6273	Marezige
00050000-557a-a517-d722-fc7bc4caa0d3	2000	Maribor 
00050000-557a-a517-0942-69827ec39bf0	2001	Maribor - poštni predali
00050000-557a-a517-4910-1bfd92b7f669	2206	Marjeta na Dravskem polju
00050000-557a-a517-12ad-ab4f6bb5cafc	2281	Markovci
00050000-557a-a517-9717-61b2dc9262e7	9221	Martjanci
00050000-557a-a517-152e-0e7285d0c75a	6242	Materija
00050000-557a-a517-9cbf-9c4561acccd1	4211	Mavčiče
00050000-557a-a517-a6f2-65349b0acb1b	1215	Medvode
00050000-557a-a517-44a4-6db5498657fa	1234	Mengeš
00050000-557a-a517-d32f-55dbb30a2a30	8330	Metlika
00050000-557a-a517-8bcd-a47b814b9d56	2392	Mežica
00050000-557a-a517-98dd-d1d312c70222	2204	Miklavž na Dravskem polju
00050000-557a-a517-549b-290bb31b654e	2275	Miklavž pri Ormožu
00050000-557a-a517-c9b6-be90a1738fa4	5291	Miren
00050000-557a-a517-eff9-bdfdf13d51aa	8233	Mirna
00050000-557a-a517-0fe5-c11bdbebc2fb	8216	Mirna Peč
00050000-557a-a517-db2a-431ca17bd27a	2382	Mislinja
00050000-557a-a517-914d-dc4d234eacf7	4281	Mojstrana
00050000-557a-a517-b2d5-95cb8d5f2088	8230	Mokronog
00050000-557a-a517-b0e4-c5ae478f3633	1251	Moravče
00050000-557a-a517-3bc3-dc0e2de0ab9b	9226	Moravske Toplice
00050000-557a-a517-407f-8ddc6ea1dd29	5216	Most na Soči
00050000-557a-a517-565f-29a5b668c26c	1221	Motnik
00050000-557a-a517-67dd-f289ff830c42	3330	Mozirje
00050000-557a-a517-d2ad-b3611e9e81cf	9000	Murska Sobota 
00050000-557a-a517-e523-b528d344eee7	9001	Murska Sobota - poštni predali
00050000-557a-a517-badf-372d0f646bd8	2366	Muta
00050000-557a-a517-4e05-36f40d18e3ec	4202	Naklo
00050000-557a-a517-d507-4b4338b4eb88	3331	Nazarje
00050000-557a-a517-c53d-227b3078ed4e	1357	Notranje Gorice
00050000-557a-a517-17aa-f3be73e2ec4d	3203	Nova Cerkev
00050000-557a-a517-9f69-606742ef470a	5000	Nova Gorica 
00050000-557a-a517-cb36-da84f9c67586	5001	Nova Gorica - poštni predali
00050000-557a-a517-d9b7-c971741b86b5	1385	Nova vas
00050000-557a-a517-b17f-c0d747587624	8000	Novo mesto
00050000-557a-a517-77c5-80d76163cb29	8001	Novo mesto - poštni predali
00050000-557a-a517-3023-6ef710999608	6243	Obrov
00050000-557a-a517-c9f4-9ba8c678d7b3	9233	Odranci
00050000-557a-a517-7128-003ac13034a1	2317	Oplotnica
00050000-557a-a517-9828-f6122ce2d682	2312	Orehova vas
00050000-557a-a517-ac8f-6e58915f07ec	2270	Ormož
00050000-557a-a517-394b-696df0f7bb83	1316	Ortnek
00050000-557a-a517-1109-274497d6a393	1337	Osilnica
00050000-557a-a517-b598-0bb167e1a8a2	8222	Otočec
00050000-557a-a517-cf0a-9602a3d85a0e	2361	Ožbalt
00050000-557a-a517-7214-b9462bf1222f	2231	Pernica
00050000-557a-a517-24fa-d57b76448b50	2211	Pesnica pri Mariboru
00050000-557a-a517-1e0f-df3d4a4e094c	9203	Petrovci
00050000-557a-a517-78bd-3b61806e6d9b	3301	Petrovče
00050000-557a-a517-148b-20c61ff604b0	6330	Piran/Pirano
00050000-557a-a517-83c5-38dbe62c0560	8255	Pišece
00050000-557a-a517-9d2d-7bae067a4222	6257	Pivka
00050000-557a-a517-0150-e7af575f874d	6232	Planina
00050000-557a-a517-9a3c-feaf7d508fb5	3225	Planina pri Sevnici
00050000-557a-a517-e689-0f140ce687ea	6276	Pobegi
00050000-557a-a517-afa3-5dc5ee9f9418	8312	Podbočje
00050000-557a-a517-8a9c-042eca7adc4d	5243	Podbrdo
00050000-557a-a517-8285-570d6f952082	3254	Podčetrtek
00050000-557a-a517-5a4a-b02646cfd61e	2273	Podgorci
00050000-557a-a517-018d-dada11776806	6216	Podgorje
00050000-557a-a517-44a0-4f877372fbed	2381	Podgorje pri Slovenj Gradcu
00050000-557a-a517-8b28-701491dfd9e3	6244	Podgrad
00050000-557a-a517-56ec-fa4aecd5ffda	1414	Podkum
00050000-557a-a517-0771-76f22ec2a093	2286	Podlehnik
00050000-557a-a517-41cc-22b37ec8f647	5272	Podnanos
00050000-557a-a517-fbee-a1e937d6f526	4244	Podnart
00050000-557a-a517-8ce7-d42de79fb8a4	3241	Podplat
00050000-557a-a517-545b-0a92d33981e7	3257	Podsreda
00050000-557a-a517-a751-f5cd340ebc27	2363	Podvelka
00050000-557a-a517-4573-6000c2296b7d	2208	Pohorje
00050000-557a-a517-2dd5-66febc5c3094	2257	Polenšak
00050000-557a-a517-9e39-b5f09cd885b9	1355	Polhov Gradec
00050000-557a-a517-b321-0d5bd52e2fb0	4223	Poljane nad Škofjo Loko
00050000-557a-a518-34f6-ccdcd9a1a4aa	2319	Poljčane
00050000-557a-a518-faa9-8d4d8ca875dc	1272	Polšnik
00050000-557a-a518-e3a6-11538b44efc6	3313	Polzela
00050000-557a-a518-57d0-59b821384f73	3232	Ponikva
00050000-557a-a518-495c-08dcaf2da20a	6320	Portorož/Portorose
00050000-557a-a518-de14-23d3de8c73c2	6230	Postojna
00050000-557a-a518-f2b7-601b08751fce	2331	Pragersko
00050000-557a-a518-033c-d75251c50e03	3312	Prebold
00050000-557a-a518-51cd-7061913dceb9	4205	Preddvor
00050000-557a-a518-534b-92710f6e0290	6255	Prem
00050000-557a-a518-0daa-225633797f1c	1352	Preserje
00050000-557a-a518-1a54-dadbc2343cd5	6258	Prestranek
00050000-557a-a518-e00a-2a907b609ee3	2391	Prevalje
00050000-557a-a518-9de4-698f446143dd	3262	Prevorje
00050000-557a-a518-2b96-b1425799ccc8	1276	Primskovo 
00050000-557a-a518-4209-fb1744da3960	3253	Pristava pri Mestinju
00050000-557a-a518-bf23-e43b754e2070	9207	Prosenjakovci/Partosfalva
00050000-557a-a518-d2f2-bb7c93f6be7f	5297	Prvačina
00050000-557a-a518-da7b-ef2734b6313b	2250	Ptuj
00050000-557a-a518-f53a-478e578ed164	2323	Ptujska Gora
00050000-557a-a518-6431-d8120cfba239	9201	Puconci
00050000-557a-a518-ae20-d5e1896b6bb4	2327	Rače
00050000-557a-a518-9d1c-7615a3a82c4c	1433	Radeče
00050000-557a-a518-17e0-f044a01b9e98	9252	Radenci
00050000-557a-a518-33e8-49d399886352	2360	Radlje ob Dravi
00050000-557a-a518-cbb6-6e61e32e02fa	1235	Radomlje
00050000-557a-a518-0269-feb2bbd58ec5	4240	Radovljica
00050000-557a-a518-5934-ac646f1691cd	8274	Raka
00050000-557a-a518-9279-e2cb5c8b3214	1381	Rakek
00050000-557a-a518-55d3-425a1c315e1d	4283	Rateče - Planica
00050000-557a-a518-85ac-449ce8dde4ee	2390	Ravne na Koroškem
00050000-557a-a518-9d49-b4da70899606	9246	Razkrižje
00050000-557a-a518-719b-4cd1a6c6a877	3332	Rečica ob Savinji
00050000-557a-a518-dcd1-e0c00878492f	5292	Renče
00050000-557a-a518-a1bd-53589f20fb8e	1310	Ribnica
00050000-557a-a518-d9cf-22e4c14690b8	2364	Ribnica na Pohorju
00050000-557a-a518-f92a-52b3012935c3	3272	Rimske Toplice
00050000-557a-a518-6e43-ce205b550090	1314	Rob
00050000-557a-a518-59ed-3bbe166cf2e3	5215	Ročinj
00050000-557a-a518-98d4-1da4548c0336	3250	Rogaška Slatina
00050000-557a-a518-f9e7-492293a2fdb7	9262	Rogašovci
00050000-557a-a518-2681-d74a1fcfbf2e	3252	Rogatec
00050000-557a-a518-36c0-15e3d65fad3b	1373	Rovte
00050000-557a-a518-a28b-18eeb352f7fd	2342	Ruše
00050000-557a-a518-aa8a-e3dc7344f9e8	1282	Sava
00050000-557a-a518-be7f-50c268fabe70	6333	Sečovlje/Sicciole
00050000-557a-a518-2e0f-7189d81aa39f	4227	Selca
00050000-557a-a518-869a-5c48154bab0d	2352	Selnica ob Dravi
00050000-557a-a518-a10a-6c747db9bc2f	8333	Semič
00050000-557a-a518-f9ed-87a53c947f70	8281	Senovo
00050000-557a-a518-5cb6-79b132e49c6b	6224	Senožeče
00050000-557a-a518-37f0-6e5e02a3a981	8290	Sevnica
00050000-557a-a518-9e46-c3ed7784c846	6210	Sežana
00050000-557a-a518-8474-80fa1d824db0	2214	Sladki Vrh
00050000-557a-a518-b433-38476d4dc72f	5283	Slap ob Idrijci
00050000-557a-a518-70db-e899c0f17b65	2380	Slovenj Gradec
00050000-557a-a518-ed29-44c94bb4f048	2310	Slovenska Bistrica
00050000-557a-a518-db20-7e4c3fd0307c	3210	Slovenske Konjice
00050000-557a-a518-63e3-bb53a495cd65	1216	Smlednik
00050000-557a-a518-def9-a8a676b9182b	5232	Soča
00050000-557a-a518-7ae0-778f90bb1ce4	1317	Sodražica
00050000-557a-a518-a04a-6f2ae35a71a3	3335	Solčava
00050000-557a-a518-2659-db46b6d6ff4b	5250	Solkan
00050000-557a-a518-0b73-32aeb4c64cdf	4229	Sorica
00050000-557a-a518-971c-319350dba445	4225	Sovodenj
00050000-557a-a518-4289-87eed4c3880e	5281	Spodnja Idrija
00050000-557a-a518-dba8-d7e4b2d2ff3c	2241	Spodnji Duplek
00050000-557a-a518-f391-fab186cbf8f3	9245	Spodnji Ivanjci
00050000-557a-a518-e4ad-4116c449e2af	2277	Središče ob Dravi
00050000-557a-a518-b0fc-c70088287174	4267	Srednja vas v Bohinju
00050000-557a-a518-84c8-b656be7d920a	8256	Sromlje 
00050000-557a-a518-d29e-5b2dadf67497	5224	Srpenica
00050000-557a-a518-581d-86bfa31e3784	1242	Stahovica
00050000-557a-a518-f0f3-a5ebd5e69d5b	1332	Stara Cerkev
00050000-557a-a518-a43b-9ae1467d0683	8342	Stari trg ob Kolpi
00050000-557a-a518-dc4b-be51f043d5e5	1386	Stari trg pri Ložu
00050000-557a-a518-d760-437e42454044	2205	Starše
00050000-557a-a518-1f11-71eedfb1891b	2289	Stoperce
00050000-557a-a518-309e-615294ac86bf	8322	Stopiče
00050000-557a-a518-844b-89f252327153	3206	Stranice
00050000-557a-a518-2b34-5aed6bcaa4c3	8351	Straža
00050000-557a-a518-97d3-5eb986ed7f47	1313	Struge
00050000-557a-a518-b328-eca50557c71e	8293	Studenec
00050000-557a-a518-7ebd-646bb1ec076e	8331	Suhor
00050000-557a-a518-6bd9-33d17706aa56	2233	Sv. Ana v Slovenskih goricah
00050000-557a-a518-4b0f-eed75e606295	2235	Sv. Trojica v Slovenskih goricah
00050000-557a-a518-d2f6-4d097521abde	2353	Sveti Duh na Ostrem Vrhu
00050000-557a-a518-37f1-af442d5455c5	9244	Sveti Jurij ob Ščavnici
00050000-557a-a518-2f11-b6c4c79a5d71	3264	Sveti Štefan
00050000-557a-a518-4f0c-05fb8bfa2491	2258	Sveti Tomaž
00050000-557a-a518-a192-0337089edc77	9204	Šalovci
00050000-557a-a518-337b-6a3a6398b28f	5261	Šempas
00050000-557a-a518-38c4-9c9ac3fb8032	5290	Šempeter pri Gorici
00050000-557a-a518-1067-5cdc696b2f1e	3311	Šempeter v Savinjski dolini
00050000-557a-a518-818c-679376a9bd41	4208	Šenčur
00050000-557a-a518-fac1-fbea81a803af	2212	Šentilj v Slovenskih goricah
00050000-557a-a518-33a0-fc1d8797d62f	8297	Šentjanž
00050000-557a-a518-cd3f-f2373b0496b2	2373	Šentjanž pri Dravogradu
00050000-557a-a518-5529-0f7fe026accb	8310	Šentjernej
00050000-557a-a518-49ad-20610ab8503d	3230	Šentjur
00050000-557a-a518-c305-9fb59dca0d4a	3271	Šentrupert
00050000-557a-a518-5f1e-bd7234c8e25d	8232	Šentrupert
00050000-557a-a518-9689-73334e9d37e3	1296	Šentvid pri Stični
00050000-557a-a518-402b-59c1556a2d62	8275	Škocjan
00050000-557a-a518-84c3-7fadd411a7e2	6281	Škofije
00050000-557a-a518-da82-6fd077d3bd7c	4220	Škofja Loka
00050000-557a-a518-3838-7b6c6d29829c	3211	Škofja vas
00050000-557a-a518-2d39-c74106ce98ed	1291	Škofljica
00050000-557a-a518-958d-b4bbbe61bafc	6274	Šmarje
00050000-557a-a518-d60a-6dc1cbc821a8	1293	Šmarje - Sap
00050000-557a-a518-4b94-8457075453b1	3240	Šmarje pri Jelšah
00050000-557a-a518-2bea-60558f05f86a	8220	Šmarješke Toplice
00050000-557a-a518-8fdc-ed8bc96202b5	2315	Šmartno na Pohorju
00050000-557a-a518-a3a1-c4946b9975f7	3341	Šmartno ob Dreti
00050000-557a-a518-d8c1-d7d3c8b9b19f	3327	Šmartno ob Paki
00050000-557a-a518-89b2-853a2aa5e570	1275	Šmartno pri Litiji
00050000-557a-a518-8764-346faeeade66	2383	Šmartno pri Slovenj Gradcu
00050000-557a-a518-dfb6-ad5b8847bc9f	3201	Šmartno v Rožni dolini
00050000-557a-a518-8c75-00d46ca9a4cf	3325	Šoštanj
00050000-557a-a518-4755-6055d3989dc3	6222	Štanjel
00050000-557a-a518-6e95-c6fa407fb9b4	3220	Štore
00050000-557a-a518-2b9d-f82087383f9c	3304	Tabor
00050000-557a-a518-35d5-a6fab1872b80	3221	Teharje
00050000-557a-a518-e645-ec34dfc5105e	9251	Tišina
00050000-557a-a518-80dd-fa7dc8851c46	5220	Tolmin
00050000-557a-a518-17c4-2cb15e60bdf1	3326	Topolšica
00050000-557a-a518-5ab5-f69aa244c5bb	2371	Trbonje
00050000-557a-a518-0e3c-e56a7337258f	1420	Trbovlje
00050000-557a-a518-a536-def5c0afe716	8231	Trebelno 
00050000-557a-a518-616f-292a3d28ed2e	8210	Trebnje
00050000-557a-a518-46d7-f64bd2dfa05a	5252	Trnovo pri Gorici
00050000-557a-a518-05ae-97808497a354	2254	Trnovska vas
00050000-557a-a518-4801-b3f1cdb3223f	1222	Trojane
00050000-557a-a518-c120-32a4a35a5a14	1236	Trzin
00050000-557a-a518-504d-48f510f4d6f9	4290	Tržič
00050000-557a-a518-40c2-bccaaf63c8a0	8295	Tržišče
00050000-557a-a518-f655-7c62c0384d5c	1311	Turjak
00050000-557a-a518-91bd-62e0d176222e	9224	Turnišče
00050000-557a-a518-fb68-69412c059ef0	8323	Uršna sela
00050000-557a-a518-0463-3f42ddb40489	1252	Vače
00050000-557a-a518-bc09-34f1aa6ba70e	3320	Velenje 
00050000-557a-a518-bf19-8f737500c660	3322	Velenje - poštni predali
00050000-557a-a518-df22-c5ec1740753b	8212	Velika Loka
00050000-557a-a518-a954-d00daa69a150	2274	Velika Nedelja
00050000-557a-a518-a7e5-98171ac433ae	9225	Velika Polana
00050000-557a-a518-90d5-ff20fad4e84b	1315	Velike Lašče
00050000-557a-a518-92e4-9a079a39e281	8213	Veliki Gaber
00050000-557a-a518-b89d-3712cfe1eff1	9241	Veržej
00050000-557a-a518-d7ae-c7d03f919930	1312	Videm - Dobrepolje
00050000-557a-a518-af4b-80477ce86bc6	2284	Videm pri Ptuju
00050000-557a-a518-edbd-01bdfc6fa3dd	8344	Vinica
00050000-557a-a518-adb6-eca405bafbb1	5271	Vipava
00050000-557a-a518-dc1c-6c629da2f581	4212	Visoko
00050000-557a-a518-09fb-67cc8fe8ba06	1294	Višnja Gora
00050000-557a-a518-8a16-7283d29952c5	3205	Vitanje
00050000-557a-a518-dcdb-c759669f87c3	2255	Vitomarci
00050000-557a-a518-fbfa-045da5d1f9fc	1217	Vodice
00050000-557a-a518-e465-39636153fb8c	3212	Vojnik\t
00050000-557a-a518-98dc-76a0b7419ef8	5293	Volčja Draga
00050000-557a-a518-3648-73abce46c42f	2232	Voličina
00050000-557a-a518-e2ca-c4b56b5bc5ec	3305	Vransko
00050000-557a-a518-9b78-3974165ec2d5	6217	Vremski Britof
00050000-557a-a518-ddb7-17062fbc868c	1360	Vrhnika
00050000-557a-a518-3ec7-29a69d058e4f	2365	Vuhred
00050000-557a-a518-93a7-d26e881bcf4b	2367	Vuzenica
00050000-557a-a518-ac2b-b7d6cf521634	8292	Zabukovje 
00050000-557a-a518-b238-52008e07f470	1410	Zagorje ob Savi
00050000-557a-a518-a01d-40fdc4ebcf49	1303	Zagradec
00050000-557a-a518-28b7-5e357cad6dca	2283	Zavrč
00050000-557a-a518-6ecd-4449efe13117	8272	Zdole 
00050000-557a-a518-7b86-2a43d417afb2	4201	Zgornja Besnica
00050000-557a-a518-66bb-9aade6e4d377	2242	Zgornja Korena
00050000-557a-a518-4890-e056128de397	2201	Zgornja Kungota
00050000-557a-a518-1f7b-8a4c9b95f9eb	2316	Zgornja Ložnica
00050000-557a-a518-97e4-e412a185d6d3	2314	Zgornja Polskava
00050000-557a-a518-5fa4-240b4dcc52f2	2213	Zgornja Velka
00050000-557a-a518-52ce-e1c12342a893	4247	Zgornje Gorje
00050000-557a-a518-b194-883c82fe7a0b	4206	Zgornje Jezersko
00050000-557a-a518-5232-3592ed794be4	2285	Zgornji Leskovec
00050000-557a-a518-b8d1-668705f2324a	1432	Zidani Most
00050000-557a-a518-89d4-a176250e7221	3214	Zreče
00050000-557a-a518-bc33-08b292d18df5	4209	Žabnica
00050000-557a-a518-4197-6a3a3efcdb92	3310	Žalec
00050000-557a-a518-49fe-e99114af959a	4228	Železniki
00050000-557a-a518-c641-a270bb845f1d	2287	Žetale
00050000-557a-a518-8f58-07a4132ce6fe	4226	Žiri
00050000-557a-a518-f421-6629683c0005	4274	Žirovnica
00050000-557a-a518-129f-c41a6ca0bd1e	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7009497)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 7009307)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7009385)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7009509)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7009629)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7009682)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557a-a519-ccca-961ba276ef41	00080000-557a-a519-b27d-6356542a3b83	0987	A
00190000-557a-a519-ba3d-4de1ee9d5d88	00080000-557a-a519-5fde-25efc8cc8d4c	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7009797)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7009860)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7009810)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7009829)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7009538)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557a-a519-2644-8fee4ae649a0	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557a-a519-0903-75ef722fcf69	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557a-a519-ebbc-b6c546151a87	0003	Kazinska	t	84	Kazinska dvorana
00220000-557a-a519-5281-9c9cc9b12f7e	0004	Mali oder	t	24	Mali oder 
00220000-557a-a519-08d2-6cb9eb0bf599	0005	Komorni oder	t	15	Komorni oder
00220000-557a-a519-45b0-285d07bb8edf	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557a-a519-044b-f33056b2f0a5	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7009482)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7009472)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7009671)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7009606)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7009179)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2857 (class 0 OID 7009548)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7009217)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557a-a518-2ac8-afa60a48b951	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557a-a518-a12e-c9fe2c85ea29	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557a-a518-c3ca-2ff2df7b1bb7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557a-a518-7be8-ad383c8e6265	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557a-a518-4b41-035d691a1b2c	planer	Planer dogodkov v koledarju	t
00020000-557a-a518-d051-8d2764add4bd	kadrovska	Kadrovska služba	t
00020000-557a-a518-2521-2341f78aa747	arhivar	Ažuriranje arhivalij	t
00020000-557a-a518-66de-efa28a2d1aeb	igralec	Igralec	t
00020000-557a-a518-8342-7ad8f78c3a8c	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7009201)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557a-a518-3b79-43edeced246c	00020000-557a-a518-c3ca-2ff2df7b1bb7
00010000-557a-a518-3068-739d6241b15b	00020000-557a-a518-c3ca-2ff2df7b1bb7
\.


--
-- TOC entry 2859 (class 0 OID 7009562)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7009503)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7009453)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7009893)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557a-a518-e5c6-618c264cb536	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557a-a518-a0cc-dcb7a8e8f974	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557a-a518-e75d-a8a36063a15f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557a-a518-4ed6-f87606a6a883	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557a-a518-2370-ae6c2692fca7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7009885)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557a-a518-c576-64d4c8dafd09	00230000-557a-a518-4ed6-f87606a6a883	popa
00240000-557a-a518-d821-de98104f563a	00230000-557a-a518-4ed6-f87606a6a883	oseba
00240000-557a-a518-3a8c-444e67777c8b	00230000-557a-a518-a0cc-dcb7a8e8f974	prostor
00240000-557a-a518-4ad4-220b2550f9a2	00230000-557a-a518-4ed6-f87606a6a883	besedilo
00240000-557a-a518-c258-d035f57e8e11	00230000-557a-a518-4ed6-f87606a6a883	uprizoritev
00240000-557a-a518-e2f6-dbe4e3509954	00230000-557a-a518-4ed6-f87606a6a883	funkcija
00240000-557a-a518-710d-c4a5bdc40dae	00230000-557a-a518-4ed6-f87606a6a883	tipfunkcije
00240000-557a-a518-5b6e-9027d0122244	00230000-557a-a518-4ed6-f87606a6a883	alternacija
00240000-557a-a518-a2d5-d61b05cbcfd8	00230000-557a-a518-e5c6-618c264cb536	pogodba
00240000-557a-a518-2dd7-4d18e34fd01e	00230000-557a-a518-4ed6-f87606a6a883	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7009880)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7009616)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7009279)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7009459)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557a-a519-1527-36c40109411a	00180000-557a-a519-edfa-62dcc626e726	000c0000-557a-a519-fd02-90875f5a1f1e	00090000-557a-a519-a9bb-e8f37847fcf3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-a519-7d48-9dfe0da36f6a	00180000-557a-a519-edfa-62dcc626e726	000c0000-557a-a519-dd11-310cc4eb2282	00090000-557a-a519-846e-ab41872fe3bd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-a519-d377-cd5520ad82a9	00180000-557a-a519-edfa-62dcc626e726	000c0000-557a-a519-5049-5d15ec20f2cd	00090000-557a-a519-b24d-daf97d0afc06	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-a519-60d8-764789b181ca	00180000-557a-a519-edfa-62dcc626e726	000c0000-557a-a519-4032-f1928652a332	00090000-557a-a519-ad17-ec4e2423e87d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-a519-990c-70449aed83ba	00180000-557a-a519-edfa-62dcc626e726	000c0000-557a-a519-9d3d-c9afbc0b33c6	00090000-557a-a519-5397-6b392ac6805f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-a519-fe54-924290809c43	00180000-557a-a519-83c1-dd538c1831f0	\N	00090000-557a-a519-5397-6b392ac6805f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7009660)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557a-a518-85fc-90451f7345e1	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557a-a518-b2a3-49ec06be7372	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557a-a518-554c-0d7acd773e6c	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557a-a518-b207-4238e5e9f400	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557a-a518-d36c-460acd6b80c3	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557a-a518-f00c-46f08cefe094	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557a-a518-ff39-e5c756a01e1f	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557a-a518-e3ae-1fed96fae149	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557a-a518-f832-19516bc6b96e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557a-a518-6ee9-7d277b6d22b5	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557a-a518-ee4e-8bca2272086d	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557a-a518-40d6-848a1c49b3d2	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557a-a518-c904-5842c98f76c8	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557a-a518-ae3d-8e7733b0e71c	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557a-a518-9930-f9d654037335	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557a-a518-1389-01d19c8b0c30	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7009849)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557a-a518-6544-b66e0a24f12a	01	Velika predstava	f	1.00	1.00
002b0000-557a-a518-8c90-e062765fb680	02	Mala predstava	f	0.50	0.50
002b0000-557a-a518-8599-0bda392cbf9c	03	Mala koprodukcija	t	0.40	1.00
002b0000-557a-a518-29c8-71adadd32c13	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557a-a518-83be-4874a1dd7c14	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7009342)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7009188)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557a-a518-3068-739d6241b15b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROsOIdbEgIXjRova3msCYGm6auGvI/yuC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557a-a519-2a62-73a4d9f2bc36	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557a-a519-6b61-1cb824c6e5be	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557a-a519-dbab-c111bd81d1c8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557a-a519-ac4d-85a7e491e48f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557a-a519-1287-233462a1db30	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557a-a519-77cb-37420ae80153	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557a-a518-3b79-43edeced246c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7009717)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557a-a519-000b-baf00f086f2f	00160000-557a-a519-ea4f-5dfb86715454	00150000-557a-a518-8a07-728113890f6e	00140000-557a-a518-302b-8674649dbfb4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557a-a519-08d2-6cb9eb0bf599
000e0000-557a-a519-cdf2-55d280d5ade2	00160000-557a-a519-17b9-cfd7309761c1	00150000-557a-a518-6abe-2146080cf706	00140000-557a-a518-829a-e8ace39bd495	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557a-a519-45b0-285d07bb8edf
000e0000-557a-a519-1202-33fa36274b3e	\N	00150000-557a-a518-6abe-2146080cf706	00140000-557a-a518-829a-e8ace39bd495	00190000-557a-a519-ccca-961ba276ef41	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557a-a519-08d2-6cb9eb0bf599
000e0000-557a-a519-b9fa-5ba38b263865	\N	00150000-557a-a518-6abe-2146080cf706	00140000-557a-a518-829a-e8ace39bd495	00190000-557a-a519-ccca-961ba276ef41	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557a-a519-08d2-6cb9eb0bf599
\.


--
-- TOC entry 2840 (class 0 OID 7009405)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557a-a519-277f-d879d2ab1eb1	000e0000-557a-a519-cdf2-55d280d5ade2	1	
00200000-557a-a519-c01f-d705ea4ebef7	000e0000-557a-a519-cdf2-55d280d5ade2	2	
\.


--
-- TOC entry 2855 (class 0 OID 7009530)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7009599)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7009437)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7009707)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557a-a518-302b-8674649dbfb4	01	Drama	drama (SURS 01)
00140000-557a-a518-24d0-1746b36b5c20	02	Opera	opera (SURS 02)
00140000-557a-a518-f4bb-8138b979cd6a	03	Balet	balet (SURS 03)
00140000-557a-a518-5dea-d313246f3108	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557a-a518-c23c-0134993edb1d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557a-a518-829a-e8ace39bd495	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557a-a518-e6d9-49275abaea95	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7009589)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557a-a518-b9bf-5b40bb859f68	01	Opera	opera
00150000-557a-a518-55ef-857999bfc2ca	02	Opereta	opereta
00150000-557a-a518-31fb-244555ab3d8e	03	Balet	balet
00150000-557a-a518-ec5e-8f26ffcd4dd7	04	Plesne prireditve	plesne prireditve
00150000-557a-a518-38e5-e7d299e27e82	05	Lutkovno gledališče	lutkovno gledališče
00150000-557a-a518-6110-1027ffb6ac98	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557a-a518-bf41-89d2d4c0ad41	07	Biografska drama	biografska drama
00150000-557a-a518-8a07-728113890f6e	08	Komedija	komedija
00150000-557a-a518-73d9-165ca70b9b1a	09	Črna komedija	črna komedija
00150000-557a-a518-139f-226357b9ba3c	10	E-igra	E-igra
00150000-557a-a518-6abe-2146080cf706	11	Kriminalka	kriminalka
00150000-557a-a518-b431-d960f73126a1	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7009242)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7009764)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7009754)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7009659)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7009427)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7009452)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7009368)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7009793)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7009585)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7009403)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7009446)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7009382)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 7009495)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7009522)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7009340)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7009251)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2410 (class 2606 OID 7009275)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7009231)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7009216)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7009528)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7009561)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7009702)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7009304)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7009328)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7009501)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 7009318)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7009389)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7009513)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7009641)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7009687)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7009808)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7009878)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7009825)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7009846)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7009545)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7009486)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7009477)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7009681)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7009613)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7009187)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7009552)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7009205)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7009225)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7009570)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7009508)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7009458)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7009902)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7009890)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7009884)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7009626)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7009284)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7009468)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7009670)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7009859)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7009353)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7009200)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7009733)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7009412)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7009536)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7009604)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7009441)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7009715)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7009597)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7009434)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7009627)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7009628)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7009306)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2376 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2377 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2378 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2508 (class 1259 OID 7009529)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7009515)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7009514)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7009413)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7009586)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7009588)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7009587)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7009384)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7009383)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7009704)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7009705)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7009706)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7009848)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7009847)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7009738)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7009735)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7009739)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7009737)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7009736)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7009355)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7009354)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2381 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2382 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2408 (class 1259 OID 7009278)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7009553)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7009447)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7009232)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7009233)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7009573)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7009572)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7009571)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7009390)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7009392)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7009391)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7009892)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7009481)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7009479)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7009478)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7009480)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7009206)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7009207)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7009537)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7009502)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7009614)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7009615)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7009794)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7009795)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7009796)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7009320)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7009319)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7009321)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7009879)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7009642)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7009643)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7009768)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7009770)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7009766)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7009769)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7009767)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7009605)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7009490)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7009489)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7009487)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7009488)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7009756)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7009755)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7009809)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7009404)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7009253)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7009252)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7009285)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7009286)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7009471)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7009470)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7009469)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7009828)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7009826)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7009827)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7009436)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7009432)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7009429)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7009430)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7009428)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7009433)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7009431)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7009305)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7009369)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7009371)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7009370)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7009372)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7009496)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7009703)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7009734)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7009276)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7009277)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7009598)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7009903)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7009341)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7009891)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7009547)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7009546)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7009765)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7009329)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7009716)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7009688)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7009689)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7009226)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7009435)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7010039)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7010024)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7010029)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7010049)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7010019)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7010044)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7010034)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7010194)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7010199)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7009954)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7010134)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7010129)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7010124)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7010014)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7010164)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7010174)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7010169)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7009989)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7009984)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7010114)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7010219)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7010224)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7010229)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7010334)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7010329)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7010249)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7010234)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7010254)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7010244)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7010239)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7009979)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7009974)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7009939)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7009934)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7010144)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7010054)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7009914)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7009919)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7010159)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7010154)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7010149)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7009994)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7010004)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7009999)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7010344)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7010089)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7010079)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7010074)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7010084)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7009904)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7009909)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7010139)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7010119)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7010184)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7010189)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7010294)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7010299)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7010304)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7009964)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7009959)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7009969)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7010339)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7010204)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7010209)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7010279)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7010289)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7010269)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7010284)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7010274)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7010179)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7010109)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7010104)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7010094)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7010099)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7010264)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7010259)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7010309)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7010009)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7010214)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7009929)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7009924)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7009944)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7009949)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7010069)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7010064)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7010059)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7010324)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7010314)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7010319)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-12 11:23:38 CEST

--
-- PostgreSQL database dump complete
--

