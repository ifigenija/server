--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-16 10:31:30 CEST

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
-- TOC entry 180 (class 1259 OID 7373587)
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
-- TOC entry 227 (class 1259 OID 7374109)
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
-- TOC entry 226 (class 1259 OID 7374092)
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
-- TOC entry 219 (class 1259 OID 7373996)
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
-- TOC entry 194 (class 1259 OID 7373766)
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
-- TOC entry 197 (class 1259 OID 7373800)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7373709)
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
-- TOC entry 228 (class 1259 OID 7374123)
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
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 7373926)
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
-- TOC entry 192 (class 1259 OID 7373746)
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
-- TOC entry 196 (class 1259 OID 7373794)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7373726)
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
-- TOC entry 202 (class 1259 OID 7373843)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7373868)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7373683)
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
-- TOC entry 181 (class 1259 OID 7373596)
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
-- TOC entry 182 (class 1259 OID 7373607)
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
-- TOC entry 177 (class 1259 OID 7373561)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7373580)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7373875)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7373906)
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
-- TOC entry 223 (class 1259 OID 7374042)
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
-- TOC entry 184 (class 1259 OID 7373640)
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
-- TOC entry 186 (class 1259 OID 7373675)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7373849)
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
-- TOC entry 185 (class 1259 OID 7373660)
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
-- TOC entry 191 (class 1259 OID 7373738)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7373861)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7373981)
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
-- TOC entry 222 (class 1259 OID 7374034)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7374149)
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
-- TOC entry 233 (class 1259 OID 7374212)
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
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 230 (class 1259 OID 7374162)
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
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 231 (class 1259 OID 7374181)
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
    viridminlok numeric(15,2) DEFAULT 0::numeric NOT NULL,
    sort integer
);


--
-- TOC entry 209 (class 1259 OID 7373890)
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
-- TOC entry 201 (class 1259 OID 7373834)
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
-- TOC entry 200 (class 1259 OID 7373824)
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
-- TOC entry 221 (class 1259 OID 7374023)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7373958)
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
-- TOC entry 174 (class 1259 OID 7373532)
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
-- TOC entry 173 (class 1259 OID 7373530)
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
-- TOC entry 210 (class 1259 OID 7373900)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7373570)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7373554)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7373914)
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
-- TOC entry 204 (class 1259 OID 7373855)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7373805)
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
-- TOC entry 236 (class 1259 OID 7374245)
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
-- TOC entry 235 (class 1259 OID 7374237)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7374232)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7373968)
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
-- TOC entry 183 (class 1259 OID 7373632)
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
-- TOC entry 199 (class 1259 OID 7373811)
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
-- TOC entry 220 (class 1259 OID 7374012)
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
-- TOC entry 232 (class 1259 OID 7374201)
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
-- TOC entry 188 (class 1259 OID 7373695)
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
-- TOC entry 175 (class 1259 OID 7373541)
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
-- TOC entry 225 (class 1259 OID 7374069)
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
-- TOC entry 193 (class 1259 OID 7373757)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7373882)
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
-- TOC entry 215 (class 1259 OID 7373951)
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
-- TOC entry 195 (class 1259 OID 7373789)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7374059)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7373941)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7373535)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7373587)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7374109)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557f-dee1-66de-483e73f59a14	000d0000-557f-dee1-309b-14be4125585d	\N	00090000-557f-dee1-e737-300bbd6cfc3a	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557f-dee1-7fcc-72f7acc85d4a	000d0000-557f-dee1-8645-80c2a70bacef	\N	00090000-557f-dee1-2657-0d695966a495	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557f-dee1-184e-bb3bbe02fc6e	000d0000-557f-dee1-b1f5-1a8b90564d62	\N	00090000-557f-dee1-b3ea-c186d9e7a5cc	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557f-dee1-b581-522ba529e7a7	000d0000-557f-dee1-62c1-b201a2695f83	\N	00090000-557f-dee1-1148-9954c6faf47e	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557f-dee1-3666-e54b409aae87	000d0000-557f-dee1-ed5a-e5f1a4c60c50	\N	00090000-557f-dee1-7522-1c0e5baf9282	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557f-dee1-755c-c58ee45eae6f	000d0000-557f-dee1-abd3-acfb43ccc495	\N	00090000-557f-dee1-2657-0d695966a495	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7374092)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7373996)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557f-dee1-bf6f-b5ce8773c257	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557f-dee1-5f67-3163911330f8	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557f-dee1-e7f3-fb674702182e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7373766)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557f-dee1-6467-5133508957f8	\N	\N	00200000-557f-dee1-516e-3ecbce003549	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557f-dee1-44ef-36a85caf99f0	\N	\N	00200000-557f-dee1-4449-9b62a9be4925	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557f-dee1-9afc-cb38df519a1f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557f-dee1-aee1-4e0788107acd	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557f-dee1-3b02-77b53bb60e54	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7373800)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7373709)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557f-dee0-62c3-31a67aee85ff	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557f-dee0-6412-2e62e44ff586	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557f-dee0-e92b-21a461d1bc3a	AL	ALB	008	Albania 	Albanija	\N
00040000-557f-dee0-3b50-347de722d3b4	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557f-dee0-1d31-5d8767a62ed3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557f-dee0-e3b3-d0885d887ae2	AD	AND	020	Andorra 	Andora	\N
00040000-557f-dee0-0e0e-53e00ad3a362	AO	AGO	024	Angola 	Angola	\N
00040000-557f-dee0-e3e8-21fee5287b63	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557f-dee0-9dbe-6cfc5fa31091	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557f-dee0-3026-2f6fd2f7afb8	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557f-dee0-f765-9756dcf0f42d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557f-dee0-2369-426a0ab5a621	AM	ARM	051	Armenia 	Armenija	\N
00040000-557f-dee0-4055-83406d114be5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557f-dee0-0e9b-6a63d8a8ef38	AU	AUS	036	Australia 	Avstralija	\N
00040000-557f-dee0-b6f0-ba1940c016ed	AT	AUT	040	Austria 	Avstrija	\N
00040000-557f-dee0-6bbb-bec96167e9a5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557f-dee0-feb9-50affbb084a9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557f-dee0-be38-88dee6a89db3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557f-dee0-dbaf-a2fda1b3e00c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557f-dee0-7416-7668ceace728	BB	BRB	052	Barbados 	Barbados	\N
00040000-557f-dee0-716f-f7348ebd7335	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557f-dee0-90dd-bccd955fc19f	BE	BEL	056	Belgium 	Belgija	\N
00040000-557f-dee0-8be6-22e68a4690e2	BZ	BLZ	084	Belize 	Belize	\N
00040000-557f-dee0-c52c-7467690aa255	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557f-dee0-8e15-83a8d15435e9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557f-dee0-0e68-5c978a35c149	BT	BTN	064	Bhutan 	Butan	\N
00040000-557f-dee0-3d49-ff8fb3e28056	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557f-dee0-94b0-1580ff4fc7c7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557f-dee0-7198-e1b1af14eb3a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557f-dee0-514e-9174b90b3929	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557f-dee0-dedd-09f1d40ba40a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557f-dee0-752d-962aa692db75	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557f-dee0-3eda-7d9372336b54	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557f-dee0-3809-f5b2bb068ea8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557f-dee0-6e1b-5b35c7716efb	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557f-dee0-431b-24eabab8e22c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557f-dee0-f199-cc3d2dfe2d1d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557f-dee0-7826-1f8fe3626639	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557f-dee0-f9dc-2f5897f2f47a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557f-dee0-a0f3-33502dfcdc8a	CA	CAN	124	Canada 	Kanada	\N
00040000-557f-dee0-4eb8-230bc143da93	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557f-dee0-0ccd-e29c5fbd981e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557f-dee0-8216-204d387836e4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557f-dee0-7ba1-e819e1256fe9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557f-dee0-5dd1-86b14431567e	CL	CHL	152	Chile 	Čile	\N
00040000-557f-dee0-23de-1d1fba5ee62d	CN	CHN	156	China 	Kitajska	\N
00040000-557f-dee0-4c46-fa8f0b550d1e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557f-dee0-b304-bfd93bb878ce	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557f-dee0-49f1-8ca76f0f15d7	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557f-dee0-7202-b94adca27551	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557f-dee0-2495-be306730968c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557f-dee0-1dae-8a9a6081ab06	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557f-dee0-1b9f-167de7e872e8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557f-dee0-6fee-76f6f458615e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557f-dee0-b0e2-3a4a461f4a05	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557f-dee0-823c-60e3785c2978	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557f-dee0-0831-69ca266b4d00	CU	CUB	192	Cuba 	Kuba	\N
00040000-557f-dee0-fb9c-939c46171aa4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557f-dee0-f20d-76322f9e3fea	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557f-dee0-9c09-2931b7ed3c7e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557f-dee0-798b-6196284ba99f	DK	DNK	208	Denmark 	Danska	\N
00040000-557f-dee0-0aba-760dac56256e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557f-dee0-ba6e-634db7365d1d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557f-dee0-aa43-f83fe3590608	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557f-dee0-685f-a83f5bc7a30d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557f-dee0-95a8-68aa20621ce0	EG	EGY	818	Egypt 	Egipt	\N
00040000-557f-dee0-a150-ac7bec730336	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557f-dee0-e8ad-2c14bae9f31a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557f-dee0-3c40-9362383e7870	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557f-dee0-b28a-511ea43b3a57	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557f-dee0-ea1a-b873275aaf96	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557f-dee0-9c05-352cd6eea33e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557f-dee0-aae1-5775373c89ef	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557f-dee0-c617-11c596378eae	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557f-dee0-03a4-f5d50d95f9f7	FI	FIN	246	Finland 	Finska	\N
00040000-557f-dee0-25c3-395fb5383ded	FR	FRA	250	France 	Francija	\N
00040000-557f-dee0-f097-f614eee285ab	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557f-dee0-e5ba-7e795e20c935	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557f-dee0-3a83-f88d09563e6f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557f-dee0-43ee-ff5cd7fde980	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557f-dee0-d777-c14c07b472b1	GA	GAB	266	Gabon 	Gabon	\N
00040000-557f-dee0-7517-7f2f469441af	GM	GMB	270	Gambia 	Gambija	\N
00040000-557f-dee0-d5b8-5b6921930ce0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557f-dee0-2862-0e1cbb55f7eb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557f-dee0-2555-b668302146d7	GH	GHA	288	Ghana 	Gana	\N
00040000-557f-dee0-3f30-5c6ea4a8dfb4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557f-dee0-a434-a160a45aa990	GR	GRC	300	Greece 	Grčija	\N
00040000-557f-dee0-6bb3-ca5bc5c5a59c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557f-dee0-c46e-7b75fce92a06	GD	GRD	308	Grenada 	Grenada	\N
00040000-557f-dee0-fcbb-6151e44e938a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557f-dee0-5f25-e398221eaa0a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557f-dee0-316a-d0fed45b655a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557f-dee0-4415-5075855e265a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557f-dee0-66da-df90e7db90d6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557f-dee0-d486-1361d869c2e8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557f-dee0-e63f-314e943ac855	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557f-dee0-af32-2e3ab1de5404	HT	HTI	332	Haiti 	Haiti	\N
00040000-557f-dee0-419d-74633b6f75a6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557f-dee0-901a-127f4203f9ae	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557f-dee0-d3b5-588f8e0a927b	HN	HND	340	Honduras 	Honduras	\N
00040000-557f-dee0-b472-97e8173e8fed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557f-dee0-3aca-3b65dbb7dfb7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557f-dee0-8799-b1ff6f738e8b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557f-dee0-d261-31c92f6a6ef6	IN	IND	356	India 	Indija	\N
00040000-557f-dee0-2b0c-bcdfe62a9192	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557f-dee0-908a-7c28c11f3cf6	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557f-dee0-6e63-2bb4079e9268	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557f-dee0-9ea1-0e6cba77c553	IE	IRL	372	Ireland 	Irska	\N
00040000-557f-dee0-7643-9177cf5e1d45	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557f-dee0-0b77-ebae511bdffb	IL	ISR	376	Israel 	Izrael	\N
00040000-557f-dee0-976d-ee584a67a2be	IT	ITA	380	Italy 	Italija	\N
00040000-557f-dee0-3e2d-d136f5536f82	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557f-dee0-98ca-3cc04351f790	JP	JPN	392	Japan 	Japonska	\N
00040000-557f-dee0-0151-b6b08c6d3142	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557f-dee0-30dd-67440c5f8c41	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557f-dee0-826c-a354d5c154ab	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557f-dee0-31a2-b0d20db9af64	KE	KEN	404	Kenya 	Kenija	\N
00040000-557f-dee0-d123-52ba9249165a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557f-dee0-3ad8-570d8985fe0f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557f-dee0-b7e7-c6323b4d56e3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557f-dee0-7e39-e71e0f8f177f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557f-dee0-be89-932bb94a78c9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557f-dee0-4ef3-c4dd070d9178	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557f-dee0-bfdd-42f9fe840fdf	LV	LVA	428	Latvia 	Latvija	\N
00040000-557f-dee0-6af4-589480c014c6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557f-dee0-8290-660cb86d9d7f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557f-dee0-7d34-7e01c1a45a8a	LR	LBR	430	Liberia 	Liberija	\N
00040000-557f-dee0-9875-42b5de6d1631	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557f-dee0-40d1-43e81c3a1fd4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557f-dee0-4024-b13995cce345	LT	LTU	440	Lithuania 	Litva	\N
00040000-557f-dee0-bec6-67fa4e61e400	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557f-dee0-99fb-0d8a41a02482	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557f-dee0-3019-fd245051f6bf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557f-dee0-f0bf-c11accd2921b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557f-dee0-7719-e6914e3731bb	MW	MWI	454	Malawi 	Malavi	\N
00040000-557f-dee0-2a5e-649637b1f6fc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557f-dee0-43d8-386a768ecbfd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557f-dee0-5f14-9c9a5b422401	ML	MLI	466	Mali 	Mali	\N
00040000-557f-dee0-de8a-b5e397144cb0	MT	MLT	470	Malta 	Malta	\N
00040000-557f-dee0-b872-cababd173e06	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557f-dee0-8da3-23e5516b5c9b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557f-dee0-a046-574cc654daf0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557f-dee0-3d21-eec8bf09c424	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557f-dee0-f5ca-c1883d0ca077	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557f-dee0-268e-0b9529e9fa1e	MX	MEX	484	Mexico 	Mehika	\N
00040000-557f-dee0-a5ed-07abcebf4f13	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557f-dee0-e1b8-0b4677116103	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557f-dee0-3c6d-5f81f33ce530	MC	MCO	492	Monaco 	Monako	\N
00040000-557f-dee0-68e4-a408ddc67d85	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557f-dee0-f7cb-84a5f81a055c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557f-dee0-fc75-5510fdc45e8d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557f-dee0-aba7-62a35d144a4d	MA	MAR	504	Morocco 	Maroko	\N
00040000-557f-dee0-3db4-7eeaf3942fc4	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557f-dee0-4464-66bdbd3c0753	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557f-dee0-178f-3011eb435e0e	NA	NAM	516	Namibia 	Namibija	\N
00040000-557f-dee0-6052-d5999b486a99	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557f-dee0-2994-08e0fc801192	NP	NPL	524	Nepal 	Nepal	\N
00040000-557f-dee0-daf1-55f11828babe	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557f-dee0-c4a8-38ce81d42edf	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557f-dee0-81da-49c50fc71e16	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557f-dee0-4acb-4e623ed2d0aa	NE	NER	562	Niger 	Niger 	\N
00040000-557f-dee0-c89d-3f5e409cd197	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557f-dee0-3580-f2b90a489b48	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557f-dee0-beb6-46869b35a4c5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557f-dee0-15e8-ee528f4a4745	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557f-dee0-5c17-c7080597f47e	NO	NOR	578	Norway 	Norveška	\N
00040000-557f-dee0-76d6-5e3b219dec45	OM	OMN	512	Oman 	Oman	\N
00040000-557f-dee0-c39e-c3374634b92a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557f-dee0-aae7-75995c12c539	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557f-dee0-8f63-9ac4380f61fb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557f-dee0-1d60-44e35e0125b4	PA	PAN	591	Panama 	Panama	\N
00040000-557f-dee0-2cb4-af51c50d0b89	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557f-dee0-5388-114874c2e501	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557f-dee0-236f-16bb79fc2663	PE	PER	604	Peru 	Peru	\N
00040000-557f-dee0-3685-9257308b8442	PH	PHL	608	Philippines 	Filipini	\N
00040000-557f-dee0-bf9e-17a3997265af	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557f-dee0-bbc2-1bb131a08125	PL	POL	616	Poland 	Poljska	\N
00040000-557f-dee0-5ecb-1c1c25980022	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557f-dee0-9cea-d92bd6b29c2e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557f-dee0-1c80-a5a595faa121	QA	QAT	634	Qatar 	Katar	\N
00040000-557f-dee0-e763-50ac6a97faa4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557f-dee0-2a29-439933595019	RO	ROU	642	Romania 	Romunija	\N
00040000-557f-dee0-1f5e-45c656ebd25d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557f-dee0-8b3e-78e1d809880b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557f-dee0-6f37-203adcc159ef	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557f-dee0-4831-47d5c483303d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557f-dee0-2da7-27cf7926e082	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557f-dee0-3af1-ff48617be79d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557f-dee0-7c04-3d30865f4ec2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557f-dee0-8c58-b206aa7fbac6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557f-dee0-2653-f3ea027091a9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557f-dee0-fe6e-6d3c92cfe5ed	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557f-dee0-c917-14b68289f9fb	SM	SMR	674	San Marino 	San Marino	\N
00040000-557f-dee0-c342-b381d30cf139	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557f-dee0-711d-74dc48cf5fdb	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557f-dee0-2c99-ca86ed601e7d	SN	SEN	686	Senegal 	Senegal	\N
00040000-557f-dee0-4fc4-b1b188799cee	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557f-dee0-f54b-a656896e1b6a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557f-dee0-a6b4-442fc867ecd9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557f-dee0-3978-da4d395b063b	SG	SGP	702	Singapore 	Singapur	\N
00040000-557f-dee0-c64b-b9c9c59e568b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557f-dee0-4d0d-ba9bfc71dacf	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557f-dee0-68ea-2c9eb5d0c00f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557f-dee0-9e9d-9ffb5f862be6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557f-dee0-d794-64a4bdaf5fe3	SO	SOM	706	Somalia 	Somalija	\N
00040000-557f-dee0-2b3c-4e3bbf2897ac	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557f-dee0-c7e8-69e0b2a0b679	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557f-dee0-0e89-6a135a8b91d9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557f-dee0-085d-6087508225e7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557f-dee0-bb5e-c6e9152759d9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557f-dee0-c420-2960a15101b0	SD	SDN	729	Sudan 	Sudan	\N
00040000-557f-dee0-c12f-126f3cbbd6ff	SR	SUR	740	Suriname 	Surinam	\N
00040000-557f-dee0-e7e4-5e1ac69fce01	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557f-dee0-5a20-1caab70a1df3	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557f-dee0-7e96-01952e7abd5f	SE	SWE	752	Sweden 	Švedska	\N
00040000-557f-dee0-f506-8fadc926b9fb	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557f-dee0-398a-76903776e144	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557f-dee0-279f-46d487de900a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557f-dee0-39cf-f8bb7c6eda6d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557f-dee0-6692-fdf08bcfcadf	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557f-dee0-5acc-78f39dacc7ac	TH	THA	764	Thailand 	Tajska	\N
00040000-557f-dee0-a066-ac9835f62563	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557f-dee0-f26c-eaff1fa6f78c	TG	TGO	768	Togo 	Togo	\N
00040000-557f-dee0-f277-3568974fa19b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557f-dee0-4d09-d1c9c915f952	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557f-dee0-e7dc-c7a8ba45e169	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557f-dee0-2d6d-9ede42a667f0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557f-dee0-2423-5b3953d52f87	TR	TUR	792	Turkey 	Turčija	\N
00040000-557f-dee0-74be-48bc08ff27d4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557f-dee0-e0f6-8de872b4ea30	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557f-dee0-ae72-45d249bd6002	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557f-dee0-8a72-f42a54186512	UG	UGA	800	Uganda 	Uganda	\N
00040000-557f-dee0-8e87-4b42273476a7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557f-dee0-6906-c12f812f677e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557f-dee0-2190-a0652a288c9d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557f-dee0-1843-18e90586bc5c	US	USA	840	United States 	Združene države Amerike	\N
00040000-557f-dee0-c5ec-f390126f00fa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557f-dee0-c24d-47b93dd0bf26	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557f-dee0-9f3a-c3ac237fb1dd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557f-dee0-c9bb-4f1071992bab	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557f-dee0-f58d-f429304fedae	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557f-dee0-628b-46e295561546	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557f-dee0-a35d-aa68e143f9e9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557f-dee0-e2d1-8a27be23b4e6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557f-dee0-109e-3266436bd4e8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557f-dee0-2472-29e8a68daac9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557f-dee0-f730-e13f2bd6762d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557f-dee0-c3c0-64c94f0f505a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557f-dee0-65fb-e0d2db13b02a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7374123)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7373926)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557f-dee1-3d25-6e999a90696b	000e0000-557f-dee1-814a-e24791d2cf59	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557f-dedf-3fc9-7d311c1a1db3
000d0000-557f-dee1-309b-14be4125585d	000e0000-557f-dee1-814a-e24791d2cf59	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557f-dedf-3fc9-7d311c1a1db3
000d0000-557f-dee1-8645-80c2a70bacef	000e0000-557f-dee1-814a-e24791d2cf59	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557f-dedf-4672-e9e057d39808
000d0000-557f-dee1-b1f5-1a8b90564d62	000e0000-557f-dee1-814a-e24791d2cf59	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557f-dedf-fa71-da3ee927755a
000d0000-557f-dee1-62c1-b201a2695f83	000e0000-557f-dee1-814a-e24791d2cf59	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557f-dedf-fa71-da3ee927755a
000d0000-557f-dee1-ed5a-e5f1a4c60c50	000e0000-557f-dee1-814a-e24791d2cf59	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557f-dedf-fa71-da3ee927755a
000d0000-557f-dee1-abd3-acfb43ccc495	000e0000-557f-dee1-814a-e24791d2cf59	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557f-dedf-3fc9-7d311c1a1db3
\.


--
-- TOC entry 2839 (class 0 OID 7373746)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7373794)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7373726)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557f-dee1-1a2a-2a30ef34a696	00080000-557f-dee1-6e58-4c3e0640e798	00090000-557f-dee1-e737-300bbd6cfc3a	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7373843)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7373868)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7373683)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557f-dee0-3097-23dc49630cfb	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557f-dee0-9df0-064a35e65a32	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557f-dee0-60fa-b644df5be56c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557f-dee0-5cad-a8d239196fb7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557f-dee0-7ae4-190dd5756bd1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557f-dee0-42b7-d5bd357040f7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557f-dee0-a227-f118398a4981	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557f-dee0-56e8-9501a1bb0882	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557f-dee0-3c1c-8e316a5eea50	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557f-dee0-6d3f-8d6ff7383071	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557f-dee0-d2a5-18df3b59bd08	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557f-dee0-1e5d-274405ef9a3c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557f-dee0-5397-bc8e4d9ca4f7	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557f-dee0-5ff4-c3cef2bde271	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557f-dee0-1d49-568c96377985	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557f-dee0-7f32-663e7182828c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7373596)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557f-dee0-f55e-934fdf95ddd3	00000000-557f-dee0-7ae4-190dd5756bd1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557f-dee0-173c-d0ae660ef472	00000000-557f-dee0-7ae4-190dd5756bd1	00010000-557f-dee0-51fd-0f49eba6ebb7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557f-dee0-010c-6cd0ec2938b8	00000000-557f-dee0-42b7-d5bd357040f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7373607)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557f-dee1-8e27-fa0d4ad62a59	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557f-dee1-1148-9954c6faf47e	00010000-557f-dee1-3e77-2425839214be	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557f-dee1-b3ea-c186d9e7a5cc	00010000-557f-dee1-e178-ac6b36f55e3d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557f-dee1-307b-5078cbc8d091	00010000-557f-dee1-eaa4-c7ecc0cd9fc9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557f-dee1-d781-490340ee87ba	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557f-dee1-4c42-252995573785	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557f-dee1-2ee9-3b7f340d591e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557f-dee1-ecdb-b3135b43ebf5	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557f-dee1-e737-300bbd6cfc3a	00010000-557f-dee1-73f2-e6899fb4d9e6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557f-dee1-2657-0d695966a495	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557f-dee1-7ba3-52b52dbee49a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557f-dee1-7522-1c0e5baf9282	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557f-dee1-5f2a-5797a75d77c2	00010000-557f-dee1-2d97-71b11614b8e7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7373561)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557f-dee0-af95-b8cb5e2e423c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557f-dee0-854a-c9f35b7de086	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557f-dee0-ac21-8a72ff96fd98	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557f-dee0-4c60-91eb979f2de0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557f-dee0-a852-c54cf477a4fe	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557f-dee0-646e-9ed62877874c	Abonma-read	Abonma - branje	f
00030000-557f-dee0-4000-74c880a6a0bc	Abonma-write	Abonma - spreminjanje	f
00030000-557f-dee0-573c-fd8c071c1e56	Alternacija-read	Alternacija - branje	f
00030000-557f-dee0-3867-abf5612857e0	Alternacija-write	Alternacija - spreminjanje	f
00030000-557f-dee0-5a9e-a24647be05c1	Arhivalija-read	Arhivalija - branje	f
00030000-557f-dee0-87fe-9a4d822491a3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557f-dee0-1b07-aaaf4c810112	Besedilo-read	Besedilo - branje	f
00030000-557f-dee0-2007-bc6dfec69e78	Besedilo-write	Besedilo - spreminjanje	f
00030000-557f-dee0-3ad3-f13961569ae4	DogodekIzven-read	DogodekIzven - branje	f
00030000-557f-dee0-5acf-e88a44539da5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557f-dee0-8f52-b80127210cf5	Dogodek-read	Dogodek - branje	f
00030000-557f-dee0-c869-27a5739032ab	Dogodek-write	Dogodek - spreminjanje	f
00030000-557f-dee0-034c-3f036f48e965	Drzava-read	Drzava - branje	f
00030000-557f-dee0-7639-2337e0f32739	Drzava-write	Drzava - spreminjanje	f
00030000-557f-dee0-e75d-d6f63429602c	Funkcija-read	Funkcija - branje	f
00030000-557f-dee0-fa20-cfadae9e463d	Funkcija-write	Funkcija - spreminjanje	f
00030000-557f-dee0-8107-4c0055ca0476	Gostovanje-read	Gostovanje - branje	f
00030000-557f-dee0-4934-306019dcd5cb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557f-dee0-8205-f473f431562a	Gostujoca-read	Gostujoca - branje	f
00030000-557f-dee0-c10c-35694b7f8dbe	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557f-dee0-4d70-0fb987cbba7a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557f-dee0-4258-f2ad9adcfc36	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557f-dee0-fa17-63082409af6f	Kupec-read	Kupec - branje	f
00030000-557f-dee0-56c6-d166427914ba	Kupec-write	Kupec - spreminjanje	f
00030000-557f-dee0-cd4b-336868d890a9	NacinPlacina-read	NacinPlacina - branje	f
00030000-557f-dee0-32af-041a340b8de0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557f-dee0-28fa-15eeee48b0f9	Option-read	Option - branje	f
00030000-557f-dee0-4b5e-d5a4a26c1bc7	Option-write	Option - spreminjanje	f
00030000-557f-dee0-1548-f5c25de28e30	OptionValue-read	OptionValue - branje	f
00030000-557f-dee0-ec20-de2048b89e6c	OptionValue-write	OptionValue - spreminjanje	f
00030000-557f-dee0-8a63-12ce892dd537	Oseba-read	Oseba - branje	f
00030000-557f-dee0-aa3d-aae2f425c74a	Oseba-write	Oseba - spreminjanje	f
00030000-557f-dee0-7a1f-08aeea3deb97	Permission-read	Permission - branje	f
00030000-557f-dee0-df71-0805a54244d9	Permission-write	Permission - spreminjanje	f
00030000-557f-dee0-b5be-1e66b03f9f56	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557f-dee0-83f2-625fd72d71da	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557f-dee0-199a-4ab0c922180d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557f-dee0-e178-4592bd5e59fe	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557f-dee0-2c3b-2129f54b2307	Pogodba-read	Pogodba - branje	f
00030000-557f-dee0-6dc6-9590f59bbd25	Pogodba-write	Pogodba - spreminjanje	f
00030000-557f-dee0-f61b-2e7267ba1b0a	Popa-read	Popa - branje	f
00030000-557f-dee0-2ff5-f4ff3d1f0071	Popa-write	Popa - spreminjanje	f
00030000-557f-dee0-3e5b-150f190b6255	Posta-read	Posta - branje	f
00030000-557f-dee0-44b8-13decc529aff	Posta-write	Posta - spreminjanje	f
00030000-557f-dee0-8811-30c8de6a0c3d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557f-dee0-8fa6-83c5280476dd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557f-dee0-524b-a2b1af137607	PostniNaslov-read	PostniNaslov - branje	f
00030000-557f-dee0-7d33-244cd2b4bb0d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557f-dee0-d589-7b35978caeae	Predstava-read	Predstava - branje	f
00030000-557f-dee0-af40-7696b88aad37	Predstava-write	Predstava - spreminjanje	f
00030000-557f-dee0-ab40-d3919cb09263	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557f-dee0-f551-c2f8c6a63d97	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557f-dee0-e5e5-b5be1e03282b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557f-dee0-ea7b-5fa409894226	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557f-dee0-25ab-e50810d768bc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557f-dee0-7137-57899bf5168e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557f-dee0-1fc7-1359619f5366	ProgramDela-read	ProgramDela - branje	f
00030000-557f-dee0-0299-546bda380a66	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557f-dee0-748d-d34be9a25cf7	ProgramFestival-read	ProgramFestival - branje	f
00030000-557f-dee0-5e4d-68b4d47e2646	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557f-dee0-a8b6-6d44bcf04455	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557f-dee0-98ed-baed11b8f6c6	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557f-dee0-4628-65ba48e82109	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557f-dee0-8b2c-bbd16aaf2f79	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557f-dee0-4651-a3a2c2b0d5f2	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557f-dee0-172a-8867420582a4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557f-dee0-92e5-5dab3a10f092	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557f-dee0-a2fe-f0a981782e59	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557f-dee0-8480-c1bed4b70bda	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557f-dee0-2408-61d64c1fd27d	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557f-dee0-5c3d-457917aab41b	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557f-dee0-b167-d348b5d26e0d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557f-dee0-b519-8610a56c4223	ProgramRazno-read	ProgramRazno - branje	f
00030000-557f-dee0-1dea-b4111a4f8c8b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557f-dee0-9e6f-2857c336d378	Prostor-read	Prostor - branje	f
00030000-557f-dee0-8f3b-070c323ed3a2	Prostor-write	Prostor - spreminjanje	f
00030000-557f-dee0-3bb7-857ff7c185cc	Racun-read	Racun - branje	f
00030000-557f-dee0-647c-463dff12d45f	Racun-write	Racun - spreminjanje	f
00030000-557f-dee0-c5f1-01c202b7f9e9	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557f-dee0-5884-3d7ab8e25d07	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557f-dee0-98a1-2f9b5c7b2352	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557f-dee0-aa59-42103a99e6e9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557f-dee0-24d3-313a2d40a388	Rekvizit-read	Rekvizit - branje	f
00030000-557f-dee0-bc5f-f570ea930054	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557f-dee0-277b-d994e27f928b	Revizija-read	Revizija - branje	f
00030000-557f-dee0-efb2-c283f42ecd46	Revizija-write	Revizija - spreminjanje	f
00030000-557f-dee0-4fc0-cf56af9001c9	Rezervacija-read	Rezervacija - branje	f
00030000-557f-dee0-be7c-4b5fa45a49bf	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557f-dee0-9743-36c644442599	Role-read	Role - branje	f
00030000-557f-dee0-2dbd-1ab80fc232a2	Role-write	Role - spreminjanje	f
00030000-557f-dee0-2b44-f6d8a6b3eb61	SedezniRed-read	SedezniRed - branje	f
00030000-557f-dee0-9df9-92157fd1d79b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557f-dee0-f59e-447cc1b6579c	Sedez-read	Sedez - branje	f
00030000-557f-dee0-37d2-6ebff383a182	Sedez-write	Sedez - spreminjanje	f
00030000-557f-dee0-4cf7-7becf50658ab	Sezona-read	Sezona - branje	f
00030000-557f-dee0-cf85-c53bde4c08d4	Sezona-write	Sezona - spreminjanje	f
00030000-557f-dee0-7f35-af19dcae991f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557f-dee0-2945-f2b518bc1432	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557f-dee0-5d0d-13f3cf9841ff	Stevilcenje-read	Stevilcenje - branje	f
00030000-557f-dee0-4153-8d278b7ff696	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557f-dee0-8474-ced6b0b6594c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557f-dee0-db77-52b5f1d48867	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557f-dee0-68d2-6f617c932fc2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557f-dee0-208c-d8c6384d6cec	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557f-dee0-3a59-006fd89e6027	Telefonska-read	Telefonska - branje	f
00030000-557f-dee0-b618-d6ec775e879a	Telefonska-write	Telefonska - spreminjanje	f
00030000-557f-dee0-85b4-55ef9d47d373	TerminStoritve-read	TerminStoritve - branje	f
00030000-557f-dee0-e86e-0a33e20389d6	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557f-dee0-4fe6-7bf6ee7ca7d0	TipFunkcije-read	TipFunkcije - branje	f
00030000-557f-dee0-adf6-61ec956764ac	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557f-dee0-cf68-7233ac9967b7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557f-dee0-72d5-a7f2d9db7014	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557f-dee0-f7d0-d809c5ec8cec	Trr-read	Trr - branje	f
00030000-557f-dee0-3402-093122aa6aa2	Trr-write	Trr - spreminjanje	f
00030000-557f-dee0-30fe-8f7b653e614f	Uprizoritev-read	Uprizoritev - branje	f
00030000-557f-dee0-c32f-b1f0a0a91fd1	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557f-dee0-9ab3-d530d1be5f00	User-read	User - branje	f
00030000-557f-dee0-e3b7-9982859a71f2	User-write	User - spreminjanje	f
00030000-557f-dee0-2dfe-26bfdba0812d	Vaja-read	Vaja - branje	f
00030000-557f-dee0-901c-b2f1cdda193b	Vaja-write	Vaja - spreminjanje	f
00030000-557f-dee0-1a3e-3f2677d171a4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557f-dee0-73af-312923beee1b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557f-dee0-f09e-65ea9baa168d	Zaposlitev-read	Zaposlitev - branje	f
00030000-557f-dee0-46e7-3ceb2a29bb14	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557f-dee0-4695-908571cb2793	Zasedenost-read	Zasedenost - branje	f
00030000-557f-dee0-a9d8-d1f587bb0ec8	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557f-dee0-af93-5a3a78584511	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557f-dee0-fade-a6ae96c338b6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557f-dee0-de0d-e8a023b64958	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557f-dee0-5896-6d1a29cadc8b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7373580)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557f-dee0-32c3-ca3ba5af4369	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-646e-9ed62877874c
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4000-74c880a6a0bc
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-573c-fd8c071c1e56
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-3867-abf5612857e0
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-5a9e-a24647be05c1
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-8f52-b80127210cf5
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4c60-91eb979f2de0
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-c869-27a5739032ab
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-7639-2337e0f32739
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-e75d-d6f63429602c
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-fa20-cfadae9e463d
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-8107-4c0055ca0476
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4934-306019dcd5cb
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-8205-f473f431562a
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-c10c-35694b7f8dbe
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4d70-0fb987cbba7a
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4258-f2ad9adcfc36
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-28fa-15eeee48b0f9
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-1548-f5c25de28e30
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-8a63-12ce892dd537
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-aa3d-aae2f425c74a
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-f61b-2e7267ba1b0a
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-2ff5-f4ff3d1f0071
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-3e5b-150f190b6255
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-44b8-13decc529aff
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-524b-a2b1af137607
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-7d33-244cd2b4bb0d
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-d589-7b35978caeae
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-af40-7696b88aad37
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-25ab-e50810d768bc
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-7137-57899bf5168e
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-9e6f-2857c336d378
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-8f3b-070c323ed3a2
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-98a1-2f9b5c7b2352
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-aa59-42103a99e6e9
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-24d3-313a2d40a388
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-bc5f-f570ea930054
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4cf7-7becf50658ab
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-cf85-c53bde4c08d4
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4fe6-7bf6ee7ca7d0
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-30fe-8f7b653e614f
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-c32f-b1f0a0a91fd1
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-2dfe-26bfdba0812d
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-901c-b2f1cdda193b
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-4695-908571cb2793
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-a9d8-d1f587bb0ec8
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-af93-5a3a78584511
00020000-557f-dee0-5e40-fc7ce1856472	00030000-557f-dee0-de0d-e8a023b64958
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-646e-9ed62877874c
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-5a9e-a24647be05c1
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-8f52-b80127210cf5
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-8107-4c0055ca0476
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-8205-f473f431562a
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-4d70-0fb987cbba7a
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-4258-f2ad9adcfc36
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-28fa-15eeee48b0f9
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-1548-f5c25de28e30
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-8a63-12ce892dd537
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-aa3d-aae2f425c74a
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-f61b-2e7267ba1b0a
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-3e5b-150f190b6255
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-524b-a2b1af137607
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-7d33-244cd2b4bb0d
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-d589-7b35978caeae
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-9e6f-2857c336d378
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-98a1-2f9b5c7b2352
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-24d3-313a2d40a388
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-4cf7-7becf50658ab
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-3a59-006fd89e6027
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-b618-d6ec775e879a
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-f7d0-d809c5ec8cec
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-3402-093122aa6aa2
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-f09e-65ea9baa168d
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-46e7-3ceb2a29bb14
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-af93-5a3a78584511
00020000-557f-dee0-1f71-be84a4216055	00030000-557f-dee0-de0d-e8a023b64958
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-646e-9ed62877874c
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-573c-fd8c071c1e56
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-5a9e-a24647be05c1
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-87fe-9a4d822491a3
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-1b07-aaaf4c810112
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-3ad3-f13961569ae4
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-8f52-b80127210cf5
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-e75d-d6f63429602c
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-8107-4c0055ca0476
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-8205-f473f431562a
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-4d70-0fb987cbba7a
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-28fa-15eeee48b0f9
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-1548-f5c25de28e30
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-8a63-12ce892dd537
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-f61b-2e7267ba1b0a
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-3e5b-150f190b6255
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-d589-7b35978caeae
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-25ab-e50810d768bc
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-9e6f-2857c336d378
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-98a1-2f9b5c7b2352
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-24d3-313a2d40a388
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-4cf7-7becf50658ab
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-4fe6-7bf6ee7ca7d0
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-2dfe-26bfdba0812d
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-4695-908571cb2793
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-af93-5a3a78584511
00020000-557f-dee0-fbb3-a998a2c65486	00030000-557f-dee0-de0d-e8a023b64958
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-646e-9ed62877874c
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-4000-74c880a6a0bc
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-3867-abf5612857e0
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-5a9e-a24647be05c1
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-8f52-b80127210cf5
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-8107-4c0055ca0476
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-8205-f473f431562a
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-28fa-15eeee48b0f9
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-1548-f5c25de28e30
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-f61b-2e7267ba1b0a
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-3e5b-150f190b6255
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-d589-7b35978caeae
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-9e6f-2857c336d378
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-98a1-2f9b5c7b2352
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-24d3-313a2d40a388
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-4cf7-7becf50658ab
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-4fe6-7bf6ee7ca7d0
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-af93-5a3a78584511
00020000-557f-dee0-65dd-a89c79b76fc8	00030000-557f-dee0-de0d-e8a023b64958
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-646e-9ed62877874c
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-5a9e-a24647be05c1
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-8f52-b80127210cf5
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-034c-3f036f48e965
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-8107-4c0055ca0476
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-8205-f473f431562a
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-28fa-15eeee48b0f9
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-1548-f5c25de28e30
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-f61b-2e7267ba1b0a
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-3e5b-150f190b6255
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-d589-7b35978caeae
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-9e6f-2857c336d378
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-98a1-2f9b5c7b2352
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-24d3-313a2d40a388
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-4cf7-7becf50658ab
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-85b4-55ef9d47d373
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-ac21-8a72ff96fd98
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-4fe6-7bf6ee7ca7d0
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-af93-5a3a78584511
00020000-557f-dee0-7b79-6a710a91eb05	00030000-557f-dee0-de0d-e8a023b64958
\.


--
-- TOC entry 2854 (class 0 OID 7373875)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7373906)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7374042)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7373640)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557f-dee1-6e58-4c3e0640e798	00040000-557f-dee0-62c3-31a67aee85ff	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557f-dee1-9493-0db97b44d08e	00040000-557f-dee0-62c3-31a67aee85ff	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557f-dee1-5168-95d59ec86338	00040000-557f-dee0-62c3-31a67aee85ff	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557f-dee1-7a8f-cf05cec11da7	00040000-557f-dee0-62c3-31a67aee85ff	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7373675)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557f-dedf-fb0d-bbade6440c17	8341	Adlešiči
00050000-557f-dedf-0d2f-5c6708db48fb	5270	Ajdovščina
00050000-557f-dedf-b5fe-283b16673e62	6280	Ankaran/Ancarano
00050000-557f-dedf-78ab-9067b6d653da	9253	Apače
00050000-557f-dedf-da9a-4e9dc784802a	8253	Artiče
00050000-557f-dedf-a6eb-5d21c45b0b23	4275	Begunje na Gorenjskem
00050000-557f-dedf-865b-2122cf970479	1382	Begunje pri Cerknici
00050000-557f-dedf-baf5-57927936bac4	9231	Beltinci
00050000-557f-dedf-4347-8159845ef99e	2234	Benedikt
00050000-557f-dedf-c6b3-7c8494e4e82f	2345	Bistrica ob Dravi
00050000-557f-dedf-71e3-fd7157a9f4c3	3256	Bistrica ob Sotli
00050000-557f-dedf-ee1f-6d11345ea1d6	8259	Bizeljsko
00050000-557f-dedf-2be1-595477ad558a	1223	Blagovica
00050000-557f-dedf-5374-7983050e353f	8283	Blanca
00050000-557f-dedf-66e6-6a7499d061c9	4260	Bled
00050000-557f-dedf-197a-df169ca66834	4273	Blejska Dobrava
00050000-557f-dedf-6645-7ed6fc0b0adb	9265	Bodonci
00050000-557f-dedf-66a9-d9311715be5b	9222	Bogojina
00050000-557f-dedf-77dc-5541dae673a3	4263	Bohinjska Bela
00050000-557f-dedf-75e9-1f5551d79db2	4264	Bohinjska Bistrica
00050000-557f-dedf-caeb-de83a7381bd5	4265	Bohinjsko jezero
00050000-557f-dedf-081f-8af54744307d	1353	Borovnica
00050000-557f-dedf-7980-31a236185b13	8294	Boštanj
00050000-557f-dedf-6a1a-b954b371630b	5230	Bovec
00050000-557f-dedf-b42b-70c8542f8450	5295	Branik
00050000-557f-dedf-1e67-3881f51e455a	3314	Braslovče
00050000-557f-dedf-26cc-e39722c33444	5223	Breginj
00050000-557f-dedf-64d0-c4376e8f8dcc	8280	Brestanica
00050000-557f-dedf-443d-80071c8be2ae	2354	Bresternica
00050000-557f-dedf-7c23-85ae4facad04	4243	Brezje
00050000-557f-dedf-7d49-b6ef5c6593de	1351	Brezovica pri Ljubljani
00050000-557f-dedf-4aea-a5638cd7b47e	8250	Brežice
00050000-557f-dedf-416a-66b2fdccef87	4210	Brnik - Aerodrom
00050000-557f-dedf-2ec2-88b0d7d1a34d	8321	Brusnice
00050000-557f-dedf-5ec5-6ca67b831d1d	3255	Buče
00050000-557f-dedf-3f2d-0675006d49a1	8276	Bučka 
00050000-557f-dedf-5db6-1eecd2ace49f	9261	Cankova
00050000-557f-dedf-bc4b-fad76bf41483	3000	Celje 
00050000-557f-dedf-782a-bacb3dd5154d	3001	Celje - poštni predali
00050000-557f-dedf-4465-fffada8a753d	4207	Cerklje na Gorenjskem
00050000-557f-dedf-3d73-e9c57cfd0116	8263	Cerklje ob Krki
00050000-557f-dedf-4a14-566311e1a5c7	1380	Cerknica
00050000-557f-dedf-5b28-e76e655228d0	5282	Cerkno
00050000-557f-dedf-7fc4-e816045f2f19	2236	Cerkvenjak
00050000-557f-dedf-73a8-2c72b45f8833	2215	Ceršak
00050000-557f-dedf-60a1-b413ccc074b7	2326	Cirkovce
00050000-557f-dedf-668e-9224aceed0fa	2282	Cirkulane
00050000-557f-dedf-eebf-3ae7f2c9e4b4	5273	Col
00050000-557f-dedf-011b-e2749dfd2d61	8251	Čatež ob Savi
00050000-557f-dedf-548d-912bff30da49	1413	Čemšenik
00050000-557f-dedf-f758-9f459b8e2677	5253	Čepovan
00050000-557f-dedf-c6ea-dcae764e1b40	9232	Črenšovci
00050000-557f-dedf-122a-be51c71a53a8	2393	Črna na Koroškem
00050000-557f-dedf-90d7-651c4fbfcd21	6275	Črni Kal
00050000-557f-dedf-6ca8-d9657d5dad71	5274	Črni Vrh nad Idrijo
00050000-557f-dedf-79bb-8ec6bc1689f4	5262	Črniče
00050000-557f-dedf-7539-6ce5bde312f4	8340	Črnomelj
00050000-557f-dedf-cde0-ae91508a2f90	6271	Dekani
00050000-557f-dedf-b6c0-40f428b4e5e1	5210	Deskle
00050000-557f-dedf-7b81-4ea50821bd1a	2253	Destrnik
00050000-557f-dedf-f2e1-c865657cf8f2	6215	Divača
00050000-557f-dedf-1a0e-c491ec74298e	1233	Dob
00050000-557f-dedf-ae8a-d5c53cb6c83b	3224	Dobje pri Planini
00050000-557f-dedf-4026-6850b4a90318	8257	Dobova
00050000-557f-dedf-9429-4cc1a33f7ca2	1423	Dobovec
00050000-557f-dedf-7369-6476a59a0d42	5263	Dobravlje
00050000-557f-dedf-ae3a-aa7aa5dc8587	3204	Dobrna
00050000-557f-dedf-b9f6-2e0d2ff6d2a2	8211	Dobrnič
00050000-557f-dedf-9907-5198f1fb8403	1356	Dobrova
00050000-557f-dedf-cd53-29caefa82b2d	9223	Dobrovnik/Dobronak 
00050000-557f-dedf-9ae9-d56dc477d8ae	5212	Dobrovo v Brdih
00050000-557f-dedf-612f-87e267836fc2	1431	Dol pri Hrastniku
00050000-557f-dedf-061e-d29272804d50	1262	Dol pri Ljubljani
00050000-557f-dedf-01be-adb81f392e05	1273	Dole pri Litiji
00050000-557f-dedf-92ec-a3246e1d3d00	1331	Dolenja vas
00050000-557f-dedf-dddc-82f07729c606	8350	Dolenjske Toplice
00050000-557f-dedf-ecda-0feb0b6d17b5	1230	Domžale
00050000-557f-dedf-134c-172a4e62decf	2252	Dornava
00050000-557f-dedf-5871-296b3d5a3afc	5294	Dornberk
00050000-557f-dedf-363a-3bde57384300	1319	Draga
00050000-557f-dedf-a1d1-de18cc9e7056	8343	Dragatuš
00050000-557f-dedf-17a3-778099aa95da	3222	Dramlje
00050000-557f-dedf-dbee-198d9a90fe9a	2370	Dravograd
00050000-557f-dedf-6c11-70a26720f0a6	4203	Duplje
00050000-557f-dedf-02b6-3f5aa56523a8	6221	Dutovlje
00050000-557f-dedf-7559-73316b95aa3d	8361	Dvor
00050000-557f-dedf-b6a0-c6c307c1bd27	2343	Fala
00050000-557f-dedf-9cb5-4dfb22086a45	9208	Fokovci
00050000-557f-dedf-eedc-ed4a0e388db3	2313	Fram
00050000-557f-dedf-2da2-b2a80332be2e	3213	Frankolovo
00050000-557f-dedf-dd80-01559af3da2e	1274	Gabrovka
00050000-557f-dedf-5f35-3566046236e1	8254	Globoko
00050000-557f-dedf-b2de-013f7bb166ea	5275	Godovič
00050000-557f-dedf-0d0a-b5e577d2d380	4204	Golnik
00050000-557f-dedf-2706-aa5e8d9180dc	3303	Gomilsko
00050000-557f-dedf-8161-e68a90ec8cc7	4224	Gorenja vas
00050000-557f-dedf-3da1-95fef83e72a2	3263	Gorica pri Slivnici
00050000-557f-dedf-d66f-c22eb52a96ff	2272	Gorišnica
00050000-557f-dedf-1b11-124579b5b8ac	9250	Gornja Radgona
00050000-557f-dedf-3d00-e8eaec8f5638	3342	Gornji Grad
00050000-557f-dedf-a442-dc7620f7a354	4282	Gozd Martuljek
00050000-557f-dedf-5907-c9ae3c9ecf83	6272	Gračišče
00050000-557f-dedf-e5ee-df5adba2ef8e	9264	Grad
00050000-557f-dedf-5339-0647471331a0	8332	Gradac
00050000-557f-dedf-d8b6-aa888bb44894	1384	Grahovo
00050000-557f-dedf-0a59-8e16ea5b05d8	5242	Grahovo ob Bači
00050000-557f-dedf-0ead-098512576dff	5251	Grgar
00050000-557f-dedf-1856-5a95e227c949	3302	Griže
00050000-557f-dedf-d4d9-0e246294f20d	3231	Grobelno
00050000-557f-dedf-f6bd-fa61c24a756d	1290	Grosuplje
00050000-557f-dedf-fbfa-c88160b25563	2288	Hajdina
00050000-557f-dedf-5e31-82884f663641	8362	Hinje
00050000-557f-dedf-207a-e696bdc86772	2311	Hoče
00050000-557f-dedf-d516-c43be6d6cd26	9205	Hodoš/Hodos
00050000-557f-dedf-9724-15e5b0e06973	1354	Horjul
00050000-557f-dedf-3609-49fcd8ba428b	1372	Hotedršica
00050000-557f-dedf-3102-0a0e9893d260	1430	Hrastnik
00050000-557f-dedf-0f09-3ff62244d646	6225	Hruševje
00050000-557f-dedf-0d0b-04144a231d1e	4276	Hrušica
00050000-557f-dedf-96b3-7ca5fd8e65b6	5280	Idrija
00050000-557f-dedf-3d78-f42c13144e5c	1292	Ig
00050000-557f-dedf-5cce-df59da0a6f53	6250	Ilirska Bistrica
00050000-557f-dedf-968e-f4f08f1835dc	6251	Ilirska Bistrica-Trnovo
00050000-557f-dedf-e2e9-9e8185ed2a2a	1295	Ivančna Gorica
00050000-557f-dedf-8ce5-e6ba7e70ce4f	2259	Ivanjkovci
00050000-557f-dedf-4dee-b267ad4eb7e3	1411	Izlake
00050000-557f-dedf-0612-a7cc2a30f34e	6310	Izola/Isola
00050000-557f-dedf-bec2-c14db9184ae7	2222	Jakobski Dol
00050000-557f-dedf-a9ca-5ac8f4a02b57	2221	Jarenina
00050000-557f-dedf-639e-a10bf903e2dd	6254	Jelšane
00050000-557f-dedf-c4bc-7591c8404440	4270	Jesenice
00050000-557f-dedf-c22a-1c6e66def3f7	8261	Jesenice na Dolenjskem
00050000-557f-dedf-5385-ad307dfaaf2b	3273	Jurklošter
00050000-557f-dedf-b738-69f9d3edfab4	2223	Jurovski Dol
00050000-557f-dedf-8dd3-b4343199ca6d	2256	Juršinci
00050000-557f-dedf-e9fb-eb76d77ea56c	5214	Kal nad Kanalom
00050000-557f-dedf-3726-53eb22b6875a	3233	Kalobje
00050000-557f-dedf-cf16-c59746a98ea9	4246	Kamna Gorica
00050000-557f-dedf-611b-acd9741ece1c	2351	Kamnica
00050000-557f-dedf-9284-19ab05d4460b	1241	Kamnik
00050000-557f-dedf-af06-0c2f162e638b	5213	Kanal
00050000-557f-dedf-cf1c-047d9c2bc2dd	8258	Kapele
00050000-557f-dedf-b8a4-1bed9a0f6ced	2362	Kapla
00050000-557f-dedf-5625-7acdeae61564	2325	Kidričevo
00050000-557f-dedf-ea46-3e5dc1e98e64	1412	Kisovec
00050000-557f-dedf-b297-7fdcc6a9a139	6253	Knežak
00050000-557f-dedf-a120-876857c8f4a9	5222	Kobarid
00050000-557f-dedf-b45a-3a23858dc19d	9227	Kobilje
00050000-557f-dedf-e6f4-b354bd686421	1330	Kočevje
00050000-557f-dedf-be8e-ab291dcfcfc4	1338	Kočevska Reka
00050000-557f-dedf-1141-38a329f2a34d	2276	Kog
00050000-557f-dedf-d454-6d754d528a3a	5211	Kojsko
00050000-557f-dedf-fb68-e6cc2539cf6d	6223	Komen
00050000-557f-dedf-cea2-9216577f1c84	1218	Komenda
00050000-557f-dedf-2412-c015801d3e38	6000	Koper/Capodistria 
00050000-557f-dedf-e6ee-e895c9e38dbf	6001	Koper/Capodistria - poštni predali
00050000-557f-dedf-96fb-984ec0a469a2	8282	Koprivnica
00050000-557f-dedf-160a-bfdf3a380f69	5296	Kostanjevica na Krasu
00050000-557f-dedf-12ae-295cc83b8bf0	8311	Kostanjevica na Krki
00050000-557f-dedf-0edb-6f838103ccdc	1336	Kostel
00050000-557f-dedf-b849-d28aec9633d7	6256	Košana
00050000-557f-dedf-700f-d839d387acc0	2394	Kotlje
00050000-557f-dedf-36f4-4782f9d001c3	6240	Kozina
00050000-557f-dedf-0fe5-f3de4edb6ba6	3260	Kozje
00050000-557f-dedf-4ba1-0f2cd5a1c010	4000	Kranj 
00050000-557f-dedf-36ce-a25abad525f4	4001	Kranj - poštni predali
00050000-557f-dedf-19d6-a97ca6fbb09d	4280	Kranjska Gora
00050000-557f-dedf-8d94-617ef63e3656	1281	Kresnice
00050000-557f-dedf-4da2-f066f30803be	4294	Križe
00050000-557f-dedf-35a6-119060eab1bc	9206	Križevci
00050000-557f-dedf-5c54-f876cc86d9f3	9242	Križevci pri Ljutomeru
00050000-557f-dedf-bce7-452efaeaeefb	1301	Krka
00050000-557f-dedf-7dff-60999f4199d7	8296	Krmelj
00050000-557f-dedf-710c-55475dccd29e	4245	Kropa
00050000-557f-dedf-8b69-447fe84bc611	8262	Krška vas
00050000-557f-dedf-be15-91a3e51018b9	8270	Krško
00050000-557f-dedf-ecac-22c8c156f098	9263	Kuzma
00050000-557f-dedf-c7f0-5183857e306e	2318	Laporje
00050000-557f-dedf-77f4-23a760d83298	3270	Laško
00050000-557f-dedf-c80c-3e3dac31e486	1219	Laze v Tuhinju
00050000-557f-dedf-7ecf-4a869679d379	2230	Lenart v Slovenskih goricah
00050000-557f-dedf-9242-93edd2aedc0f	9220	Lendava/Lendva
00050000-557f-dedf-ecec-2295e6e280f1	4248	Lesce
00050000-557f-dedf-9d36-6882603d9202	3261	Lesično
00050000-557f-dedf-a901-b6f06b2957f1	8273	Leskovec pri Krškem
00050000-557f-dedf-bef0-dbf2e1b085a0	2372	Libeliče
00050000-557f-dedf-2da5-0daf09f1cf4a	2341	Limbuš
00050000-557f-dedf-9cf3-390d19b60cfe	1270	Litija
00050000-557f-dedf-9f60-b2b6ae07a12e	3202	Ljubečna
00050000-557f-dedf-0c68-da939651ddd5	1000	Ljubljana 
00050000-557f-dedf-130a-774d735c3e0f	1001	Ljubljana - poštni predali
00050000-557f-dedf-802f-d08251b2c987	1231	Ljubljana - Črnuče
00050000-557f-dedf-d890-98bb459b1544	1261	Ljubljana - Dobrunje
00050000-557f-dedf-b751-fd4b21cf2bbc	1260	Ljubljana - Polje
00050000-557f-dedf-ac61-cc1a964b728e	1210	Ljubljana - Šentvid
00050000-557f-dedf-0e41-9457b2569238	1211	Ljubljana - Šmartno
00050000-557f-dedf-4d9e-a20f51b0fbf2	3333	Ljubno ob Savinji
00050000-557f-dedf-d833-ae3adce56e32	9240	Ljutomer
00050000-557f-dedf-b3b7-1b067f8a1b55	3215	Loče
00050000-557f-dedf-3336-86a83a7818cc	5231	Log pod Mangartom
00050000-557f-dedf-417d-e9d4dddc241e	1358	Log pri Brezovici
00050000-557f-dedf-323b-50b509cb30b0	1370	Logatec
00050000-557f-dedf-92a2-7f9da91a0e5e	1371	Logatec
00050000-557f-dedf-5952-618a3da1734f	1434	Loka pri Zidanem Mostu
00050000-557f-dedf-c4e6-3ec7b5c1cfeb	3223	Loka pri Žusmu
00050000-557f-dedf-0d18-6136352d7423	6219	Lokev
00050000-557f-dedf-ef9b-32622d6d02f5	1318	Loški Potok
00050000-557f-dedf-8bbe-946fec29bd45	2324	Lovrenc na Dravskem polju
00050000-557f-dedf-939e-20f9ab31c63b	2344	Lovrenc na Pohorju
00050000-557f-dedf-8333-884a6a5a5f9d	3334	Luče
00050000-557f-dedf-be0c-60187ee02692	1225	Lukovica
00050000-557f-dedf-4857-41c376e8e10a	9202	Mačkovci
00050000-557f-dedf-061c-f3021f97ef58	2322	Majšperk
00050000-557f-dedf-66a5-78d235f283d8	2321	Makole
00050000-557f-dedf-e632-7263af7736a8	9243	Mala Nedelja
00050000-557f-dedf-a085-00531bbda4d1	2229	Malečnik
00050000-557f-dedf-89a6-60c4bb6280e0	6273	Marezige
00050000-557f-dedf-9f57-d9109aad93d4	2000	Maribor 
00050000-557f-dedf-1eea-8d4d717c7fe3	2001	Maribor - poštni predali
00050000-557f-dedf-1937-f497a0b06c97	2206	Marjeta na Dravskem polju
00050000-557f-dedf-ef32-f143f73a91b9	2281	Markovci
00050000-557f-dedf-44de-2c9f299d7828	9221	Martjanci
00050000-557f-dedf-e44b-d7aaedd9523b	6242	Materija
00050000-557f-dedf-3792-3b746053bccf	4211	Mavčiče
00050000-557f-dedf-42ab-d727a9c144e6	1215	Medvode
00050000-557f-dedf-ef5f-db1856f89ef4	1234	Mengeš
00050000-557f-dedf-44e7-b4e061094efd	8330	Metlika
00050000-557f-dedf-575f-6bb825488341	2392	Mežica
00050000-557f-dedf-4a81-22bcf2911cc1	2204	Miklavž na Dravskem polju
00050000-557f-dedf-8661-924135a649e0	2275	Miklavž pri Ormožu
00050000-557f-dedf-64cc-cd2dc5b03b28	5291	Miren
00050000-557f-dedf-c7e0-8e4d54db6667	8233	Mirna
00050000-557f-dedf-7e4d-c3d2beece418	8216	Mirna Peč
00050000-557f-dedf-35ee-676a8e6d8371	2382	Mislinja
00050000-557f-dedf-70af-cd3eae25139d	4281	Mojstrana
00050000-557f-dedf-7412-3f338d652cba	8230	Mokronog
00050000-557f-dedf-0623-41a185bba9eb	1251	Moravče
00050000-557f-dedf-9a55-99114b867b6e	9226	Moravske Toplice
00050000-557f-dedf-6ae7-14dbf5e259f2	5216	Most na Soči
00050000-557f-dedf-fe98-d37bb5b0ff43	1221	Motnik
00050000-557f-dedf-4368-009043c7ee2d	3330	Mozirje
00050000-557f-dedf-5e43-bcd36d1c1310	9000	Murska Sobota 
00050000-557f-dedf-f736-c0c9f88f11c6	9001	Murska Sobota - poštni predali
00050000-557f-dedf-5e58-f52e15f4724b	2366	Muta
00050000-557f-dedf-4817-e6321d6a5501	4202	Naklo
00050000-557f-dedf-1838-89c5afb84957	3331	Nazarje
00050000-557f-dedf-7d0e-b69af5d5502a	1357	Notranje Gorice
00050000-557f-dedf-b3e9-d34fb58ae2a0	3203	Nova Cerkev
00050000-557f-dedf-37d7-92eefdef9e02	5000	Nova Gorica 
00050000-557f-dedf-80ab-84ec5db19b94	5001	Nova Gorica - poštni predali
00050000-557f-dedf-eb0f-3f24ff89ee6d	1385	Nova vas
00050000-557f-dedf-dd86-d7aee9041e8f	8000	Novo mesto
00050000-557f-dedf-9682-3f0c8a206101	8001	Novo mesto - poštni predali
00050000-557f-dedf-0a26-626b32bb69da	6243	Obrov
00050000-557f-dedf-ddbe-f457f26b73ca	9233	Odranci
00050000-557f-dedf-2660-7981bd4c31ec	2317	Oplotnica
00050000-557f-dedf-64f7-a376b2560188	2312	Orehova vas
00050000-557f-dedf-f6b4-5aed39e3df53	2270	Ormož
00050000-557f-dedf-8a99-6109c0028540	1316	Ortnek
00050000-557f-dedf-9293-0529aeab570d	1337	Osilnica
00050000-557f-dedf-1a8b-66f925352d4e	8222	Otočec
00050000-557f-dedf-36c9-3224f3649fa2	2361	Ožbalt
00050000-557f-dedf-1a1f-6ba2b83ceba7	2231	Pernica
00050000-557f-dedf-de41-43768275bfdc	2211	Pesnica pri Mariboru
00050000-557f-dedf-e169-45d27f44677a	9203	Petrovci
00050000-557f-dedf-6093-5b63e0672bc9	3301	Petrovče
00050000-557f-dedf-14d7-1c4d83e44704	6330	Piran/Pirano
00050000-557f-dedf-0c0a-9bc8f63eb006	8255	Pišece
00050000-557f-dedf-c20a-8c3989c6e13e	6257	Pivka
00050000-557f-dedf-dd06-b8c6ee7a2ea4	6232	Planina
00050000-557f-dedf-27b4-3a0809275afe	3225	Planina pri Sevnici
00050000-557f-dedf-9158-010533d065d5	6276	Pobegi
00050000-557f-dedf-44cc-ed645c405b7d	8312	Podbočje
00050000-557f-dedf-213d-8b37e6143448	5243	Podbrdo
00050000-557f-dedf-df3a-78f635a84e10	3254	Podčetrtek
00050000-557f-dedf-8bf6-9930496cceb1	2273	Podgorci
00050000-557f-dedf-d6dd-71cfd4cb296d	6216	Podgorje
00050000-557f-dedf-d187-2717fd7f6838	2381	Podgorje pri Slovenj Gradcu
00050000-557f-dedf-902b-62c7c6f1c82d	6244	Podgrad
00050000-557f-dedf-b7a1-15baa2223563	1414	Podkum
00050000-557f-dedf-db37-2dd6ce80d8e2	2286	Podlehnik
00050000-557f-dedf-c399-d3596c013bec	5272	Podnanos
00050000-557f-dedf-4a28-1a82775a0a1f	4244	Podnart
00050000-557f-dedf-ce73-669ac4fd6bd4	3241	Podplat
00050000-557f-dedf-a87b-85c8323e7950	3257	Podsreda
00050000-557f-dedf-44cb-d3bb782f13c3	2363	Podvelka
00050000-557f-dedf-21f1-288a05cb4458	2208	Pohorje
00050000-557f-dedf-7c6b-3ada0dfab5e9	2257	Polenšak
00050000-557f-dedf-9109-644404656ab6	1355	Polhov Gradec
00050000-557f-dedf-885c-514f57d80cc1	4223	Poljane nad Škofjo Loko
00050000-557f-dedf-5a01-8279bb93d48f	2319	Poljčane
00050000-557f-dedf-a3fa-16319684e468	1272	Polšnik
00050000-557f-dedf-94db-6a0a30ddaa03	3313	Polzela
00050000-557f-dedf-421d-8969439a4f12	3232	Ponikva
00050000-557f-dedf-641a-66ac03da6a01	6320	Portorož/Portorose
00050000-557f-dedf-1615-03741a978d26	6230	Postojna
00050000-557f-dedf-92ef-1c87c2960c66	2331	Pragersko
00050000-557f-dedf-cbba-2cfc367074b9	3312	Prebold
00050000-557f-dedf-117f-f02824a96fec	4205	Preddvor
00050000-557f-dedf-90fb-54bbfa8f9eaa	6255	Prem
00050000-557f-dedf-df9c-c7c4cc90faa4	1352	Preserje
00050000-557f-dedf-2a72-f052240b64a5	6258	Prestranek
00050000-557f-dedf-310d-f8b36a12367f	2391	Prevalje
00050000-557f-dedf-4648-ee8834faf485	3262	Prevorje
00050000-557f-dedf-2de9-68fd4c40d399	1276	Primskovo 
00050000-557f-dedf-b0f5-487ff4adea80	3253	Pristava pri Mestinju
00050000-557f-dedf-fca3-9698951c3d31	9207	Prosenjakovci/Partosfalva
00050000-557f-dedf-3e2b-7957477701c2	5297	Prvačina
00050000-557f-dedf-c5f9-d05017a6d587	2250	Ptuj
00050000-557f-dedf-d8cc-e822afaadf73	2323	Ptujska Gora
00050000-557f-dedf-d7fc-b83e65901e9b	9201	Puconci
00050000-557f-dedf-0a7d-5149791686ab	2327	Rače
00050000-557f-dedf-6ed4-ff794f4f44a9	1433	Radeče
00050000-557f-dedf-3165-36fb4c1a547e	9252	Radenci
00050000-557f-dedf-7e79-a38634a46c40	2360	Radlje ob Dravi
00050000-557f-dedf-668d-229e2a7c420c	1235	Radomlje
00050000-557f-dedf-820f-2a528f24db1e	4240	Radovljica
00050000-557f-dedf-5a60-3161f0207cb9	8274	Raka
00050000-557f-dedf-185a-25fd1c0284f4	1381	Rakek
00050000-557f-dedf-79a1-aba925efe89e	4283	Rateče - Planica
00050000-557f-dedf-e980-7bbc04cd455b	2390	Ravne na Koroškem
00050000-557f-dedf-109a-08d2cb31b247	9246	Razkrižje
00050000-557f-dedf-54ef-448156627247	3332	Rečica ob Savinji
00050000-557f-dedf-e752-f69971a0e6f5	5292	Renče
00050000-557f-dedf-ba35-161d1d1aa9a3	1310	Ribnica
00050000-557f-dedf-7a9a-3d65c3ab547c	2364	Ribnica na Pohorju
00050000-557f-dedf-4566-043ad0add70f	3272	Rimske Toplice
00050000-557f-dedf-d17a-43262bbc0d0e	1314	Rob
00050000-557f-dedf-4b0b-bd33bb481ea2	5215	Ročinj
00050000-557f-dedf-a7c0-c7e20c37d2e5	3250	Rogaška Slatina
00050000-557f-dedf-dd8c-f3748b2bbe9b	9262	Rogašovci
00050000-557f-dedf-a2d4-d712ffc71233	3252	Rogatec
00050000-557f-dedf-1629-2f8eac969fab	1373	Rovte
00050000-557f-dedf-201d-cba82fc51c4e	2342	Ruše
00050000-557f-dedf-ecd1-433108569b64	1282	Sava
00050000-557f-dedf-0c87-70a1333d1b06	6333	Sečovlje/Sicciole
00050000-557f-dedf-2991-e1d54fadf3d6	4227	Selca
00050000-557f-dedf-77c9-3ee4a0d3e199	2352	Selnica ob Dravi
00050000-557f-dedf-918b-11354e0920a8	8333	Semič
00050000-557f-dedf-3ede-8e57dc57f5e9	8281	Senovo
00050000-557f-dedf-5d17-80522cb61bfa	6224	Senožeče
00050000-557f-dedf-0f35-635a697011a8	8290	Sevnica
00050000-557f-dedf-f8aa-4a0b5af8871e	6210	Sežana
00050000-557f-dedf-1bd7-b2e336241f38	2214	Sladki Vrh
00050000-557f-dedf-bfff-2240a6bac843	5283	Slap ob Idrijci
00050000-557f-dedf-8b4e-65bd60114022	2380	Slovenj Gradec
00050000-557f-dedf-ea3b-0ce316366e32	2310	Slovenska Bistrica
00050000-557f-dedf-e734-2ec940c188b4	3210	Slovenske Konjice
00050000-557f-dedf-6861-10471404dbaa	1216	Smlednik
00050000-557f-dedf-64eb-50ce11bbfb81	5232	Soča
00050000-557f-dedf-8ab8-211df68d4571	1317	Sodražica
00050000-557f-dedf-78ee-530a868437e2	3335	Solčava
00050000-557f-dedf-49a6-856ffd377dee	5250	Solkan
00050000-557f-dedf-8656-072a0fb2aa56	4229	Sorica
00050000-557f-dedf-23f9-3b7cdf703e80	4225	Sovodenj
00050000-557f-dedf-c069-4225c4ae13f3	5281	Spodnja Idrija
00050000-557f-dedf-8c3c-45e6c272190a	2241	Spodnji Duplek
00050000-557f-dedf-a5fc-843231d31b02	9245	Spodnji Ivanjci
00050000-557f-dedf-e877-804717baf747	2277	Središče ob Dravi
00050000-557f-dedf-38a0-4ecc3ba9c1c0	4267	Srednja vas v Bohinju
00050000-557f-dedf-e732-ba692eb65f11	8256	Sromlje 
00050000-557f-dedf-2960-a02c4cf63919	5224	Srpenica
00050000-557f-dedf-45ff-cfd0c3a06b14	1242	Stahovica
00050000-557f-dedf-1eec-a44390795c7f	1332	Stara Cerkev
00050000-557f-dedf-f592-01df6fea78a5	8342	Stari trg ob Kolpi
00050000-557f-dedf-ff8d-cca19dc1db62	1386	Stari trg pri Ložu
00050000-557f-dedf-8b18-05549dd6a5c1	2205	Starše
00050000-557f-dedf-7ab0-032100f4718d	2289	Stoperce
00050000-557f-dedf-415a-95e993c876e6	8322	Stopiče
00050000-557f-dedf-61f5-e496b1c808a2	3206	Stranice
00050000-557f-dedf-7425-fbc40d78279d	8351	Straža
00050000-557f-dedf-8d44-68c2f88540e0	1313	Struge
00050000-557f-dedf-2719-42fc4de68148	8293	Studenec
00050000-557f-dedf-fab9-2840e8df9759	8331	Suhor
00050000-557f-dedf-a48d-435447a5075f	2233	Sv. Ana v Slovenskih goricah
00050000-557f-dedf-34b4-2a047a1efd81	2235	Sv. Trojica v Slovenskih goricah
00050000-557f-dedf-57fb-29b5999c3857	2353	Sveti Duh na Ostrem Vrhu
00050000-557f-dedf-8526-23e9e27b989c	9244	Sveti Jurij ob Ščavnici
00050000-557f-dedf-0edd-47741d3dca58	3264	Sveti Štefan
00050000-557f-dedf-7454-e65c3c4542fa	2258	Sveti Tomaž
00050000-557f-dedf-12fe-1f71ea4e687b	9204	Šalovci
00050000-557f-dedf-0ad3-30f4393cb7a4	5261	Šempas
00050000-557f-dedf-de41-5f6e081d2d42	5290	Šempeter pri Gorici
00050000-557f-dedf-a8a9-9f91221fc15e	3311	Šempeter v Savinjski dolini
00050000-557f-dedf-7221-058ab98a3d4d	4208	Šenčur
00050000-557f-dedf-a73b-9409a6470bd7	2212	Šentilj v Slovenskih goricah
00050000-557f-dedf-5281-d3b2d3912c54	8297	Šentjanž
00050000-557f-dedf-2bf0-8b72ffadc500	2373	Šentjanž pri Dravogradu
00050000-557f-dedf-00e8-c2af1d3856ef	8310	Šentjernej
00050000-557f-dedf-25f7-9f7b9e805d89	3230	Šentjur
00050000-557f-dedf-7889-ec92afe9e12b	3271	Šentrupert
00050000-557f-dedf-734b-0dba71586b50	8232	Šentrupert
00050000-557f-dedf-7e46-d16a2df6b2aa	1296	Šentvid pri Stični
00050000-557f-dedf-db5e-dad0d340e025	8275	Škocjan
00050000-557f-dedf-a968-4783993d3a14	6281	Škofije
00050000-557f-dedf-6997-bd97abede6eb	4220	Škofja Loka
00050000-557f-dedf-5b58-8c20dda3483b	3211	Škofja vas
00050000-557f-dedf-6c9b-4909d9e81b54	1291	Škofljica
00050000-557f-dedf-b11a-95d4d3a6c410	6274	Šmarje
00050000-557f-dedf-aa50-02de8f5af6c5	1293	Šmarje - Sap
00050000-557f-dedf-7ef1-009eeb5f64d7	3240	Šmarje pri Jelšah
00050000-557f-dedf-8d1a-00ff8188b548	8220	Šmarješke Toplice
00050000-557f-dedf-be1b-edbec999c39f	2315	Šmartno na Pohorju
00050000-557f-dedf-d63b-20008a5d8e65	3341	Šmartno ob Dreti
00050000-557f-dedf-8e6c-98ad7537e362	3327	Šmartno ob Paki
00050000-557f-dedf-6619-a169a26eaa14	1275	Šmartno pri Litiji
00050000-557f-dedf-cbc6-aae095f5d0e7	2383	Šmartno pri Slovenj Gradcu
00050000-557f-dedf-ede5-1c1b46c0fb16	3201	Šmartno v Rožni dolini
00050000-557f-dedf-42ea-9e117d61d63c	3325	Šoštanj
00050000-557f-dedf-2ea7-8fe5b2679900	6222	Štanjel
00050000-557f-dedf-7cd1-770afb2ea05b	3220	Štore
00050000-557f-dedf-3c99-186f04eb5262	3304	Tabor
00050000-557f-dedf-53b9-eb90ebeee9eb	3221	Teharje
00050000-557f-dedf-40e8-1015277fceb1	9251	Tišina
00050000-557f-dedf-fa78-4edd23a3aac2	5220	Tolmin
00050000-557f-dedf-fd37-433e9241eb69	3326	Topolšica
00050000-557f-dedf-56e9-eae1314a5c81	2371	Trbonje
00050000-557f-dedf-8834-170779e6f647	1420	Trbovlje
00050000-557f-dedf-efab-b6234f671e35	8231	Trebelno 
00050000-557f-dedf-b843-cb4b28a21ca2	8210	Trebnje
00050000-557f-dedf-1dfe-d6f92935e151	5252	Trnovo pri Gorici
00050000-557f-dedf-c6f3-ae2410098dae	2254	Trnovska vas
00050000-557f-dedf-ac45-c08517f5b730	1222	Trojane
00050000-557f-dedf-d6f3-15d27c9983f6	1236	Trzin
00050000-557f-dedf-1780-30d5afb3ea74	4290	Tržič
00050000-557f-dedf-a07c-8f5b1fdee9be	8295	Tržišče
00050000-557f-dedf-8f7d-d13efc6bafc9	1311	Turjak
00050000-557f-dedf-4b3e-81d7b6b487c0	9224	Turnišče
00050000-557f-dedf-1645-6e8b442401a6	8323	Uršna sela
00050000-557f-dedf-8b01-a08e710a85c6	1252	Vače
00050000-557f-dedf-4dce-9a72bb68ce8c	3320	Velenje 
00050000-557f-dedf-f9cd-d8833798fbf6	3322	Velenje - poštni predali
00050000-557f-dedf-1d84-c9ef58e3a455	8212	Velika Loka
00050000-557f-dedf-2508-0474fa8ced83	2274	Velika Nedelja
00050000-557f-dedf-c890-2dd00c134f35	9225	Velika Polana
00050000-557f-dedf-378a-67b49d3938e0	1315	Velike Lašče
00050000-557f-dedf-f691-b3285156cb34	8213	Veliki Gaber
00050000-557f-dedf-3942-8cd089faf06d	9241	Veržej
00050000-557f-dedf-831c-5361f7348a40	1312	Videm - Dobrepolje
00050000-557f-dedf-743f-34d55aeb5de2	2284	Videm pri Ptuju
00050000-557f-dedf-4f0d-bc80cc5e53bc	8344	Vinica
00050000-557f-dedf-19cd-a78a2119feee	5271	Vipava
00050000-557f-dedf-a8e9-ef440bdda24b	4212	Visoko
00050000-557f-dedf-7a0a-6ea46986cd37	1294	Višnja Gora
00050000-557f-dedf-2e98-d84e9ad86f79	3205	Vitanje
00050000-557f-dedf-684a-cc1f9e163e72	2255	Vitomarci
00050000-557f-dedf-7840-329803cefef6	1217	Vodice
00050000-557f-dedf-8215-e4c4d79142fa	3212	Vojnik\t
00050000-557f-dedf-3f01-b0fbd753bcd6	5293	Volčja Draga
00050000-557f-dedf-f79f-53f47f84cb31	2232	Voličina
00050000-557f-dedf-4dbf-405f22614437	3305	Vransko
00050000-557f-dedf-3c88-245815715296	6217	Vremski Britof
00050000-557f-dedf-1f62-daa6f3a76466	1360	Vrhnika
00050000-557f-dedf-aa1b-0107090fac25	2365	Vuhred
00050000-557f-dedf-b203-efaddab7ea74	2367	Vuzenica
00050000-557f-dedf-20df-6e9b0203ee9f	8292	Zabukovje 
00050000-557f-dedf-f108-bcee21381aa5	1410	Zagorje ob Savi
00050000-557f-dedf-0425-72f7fc4c362f	1303	Zagradec
00050000-557f-dedf-9c2c-2301418ae1af	2283	Zavrč
00050000-557f-dedf-a591-276abe245d97	8272	Zdole 
00050000-557f-dedf-a7af-4d84de39254f	4201	Zgornja Besnica
00050000-557f-dedf-ae3b-1a1de67537b2	2242	Zgornja Korena
00050000-557f-dedf-fe20-304e88d814d4	2201	Zgornja Kungota
00050000-557f-dedf-23d5-7c27b65bfa53	2316	Zgornja Ložnica
00050000-557f-dedf-a7d4-5fe65a2b39b0	2314	Zgornja Polskava
00050000-557f-dedf-f2ea-e4036b7c5890	2213	Zgornja Velka
00050000-557f-dedf-31cf-b569c78bdfa0	4247	Zgornje Gorje
00050000-557f-dedf-676e-5188a11e0b3d	4206	Zgornje Jezersko
00050000-557f-dedf-a0a1-aebc4344e6b8	2285	Zgornji Leskovec
00050000-557f-dedf-34f2-8b06cb341f01	1432	Zidani Most
00050000-557f-dedf-3a2d-ac085d89b2c3	3214	Zreče
00050000-557f-dedf-749c-343cf4150adf	4209	Žabnica
00050000-557f-dedf-7c73-47d554618fa1	3310	Žalec
00050000-557f-dedf-d2d4-9170ae98741f	4228	Železniki
00050000-557f-dedf-cea4-6bd3c866992c	2287	Žetale
00050000-557f-dedf-a102-bf46f8e312aa	4226	Žiri
00050000-557f-dedf-fcb8-21c3f0ed47da	4274	Žirovnica
00050000-557f-dedf-13c1-a17bd67e178b	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7373849)
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
-- TOC entry 2832 (class 0 OID 7373660)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7373738)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7373861)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7373981)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7374034)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557f-dee1-5a4c-7e68b4ea7594	00080000-557f-dee1-5168-95d59ec86338	0987	A
00190000-557f-dee1-4fe9-0d6e50bd9c60	00080000-557f-dee1-9493-0db97b44d08e	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7374149)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7374212)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7374162)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7374181)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7373890)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557f-dee1-d173-fde365abb49a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557f-dee1-bb3c-f59056b9c95f	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557f-dee1-0c9e-bb90f5967b58	0003	Kazinska	t	84	Kazinska dvorana
00220000-557f-dee1-3cd5-056033c17a2b	0004	Mali oder	t	24	Mali oder 
00220000-557f-dee1-b19e-524d59dae442	0005	Komorni oder	t	15	Komorni oder
00220000-557f-dee1-6160-b6c05295ef4c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557f-dee1-e3ec-7cc4605dfe03	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7373834)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7373824)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7374023)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7373958)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7373532)
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
-- TOC entry 2857 (class 0 OID 7373900)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7373570)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557f-dee0-f5d7-d8ae11819f9e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557f-dee0-32c3-ca3ba5af4369	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557f-dee0-68c6-51ffab0257d2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557f-dee0-77f6-fde28e4ecb8c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557f-dee0-5e40-fc7ce1856472	planer	Planer dogodkov v koledarju	t
00020000-557f-dee0-1f71-be84a4216055	kadrovska	Kadrovska služba	t
00020000-557f-dee0-fbb3-a998a2c65486	arhivar	Ažuriranje arhivalij	t
00020000-557f-dee0-65dd-a89c79b76fc8	igralec	Igralec	t
00020000-557f-dee0-7b79-6a710a91eb05	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7373554)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557f-dee0-51fd-0f49eba6ebb7	00020000-557f-dee0-68c6-51ffab0257d2
00010000-557f-dee0-85c2-4f3290deca68	00020000-557f-dee0-68c6-51ffab0257d2
\.


--
-- TOC entry 2859 (class 0 OID 7373914)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7373855)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7373805)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7374245)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557f-dedf-2b55-26cc58430c58	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557f-dedf-9706-708900ff30d4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557f-dedf-7a1c-e1b6b8ff3db4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557f-dedf-69a4-5f21cdf4bff8	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557f-dedf-69e5-a909ad19203b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7374237)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557f-dedf-4e8e-9d2634d8dfac	00230000-557f-dedf-69a4-5f21cdf4bff8	popa
00240000-557f-dedf-4b0e-a2210d14f029	00230000-557f-dedf-69a4-5f21cdf4bff8	oseba
00240000-557f-dedf-b6af-cf5550b55c5a	00230000-557f-dedf-9706-708900ff30d4	prostor
00240000-557f-dedf-439e-7b45ef0ee4a9	00230000-557f-dedf-69a4-5f21cdf4bff8	besedilo
00240000-557f-dee0-f586-bc5c2631ac7b	00230000-557f-dedf-69a4-5f21cdf4bff8	uprizoritev
00240000-557f-dee0-1ea7-e06bade72f89	00230000-557f-dedf-69a4-5f21cdf4bff8	funkcija
00240000-557f-dee0-895a-7c5521576a0a	00230000-557f-dedf-69a4-5f21cdf4bff8	tipfunkcije
00240000-557f-dee0-dc80-a1aaea7463b7	00230000-557f-dedf-69a4-5f21cdf4bff8	alternacija
00240000-557f-dee0-590b-b0642ba9016d	00230000-557f-dedf-2b55-26cc58430c58	pogodba
00240000-557f-dee0-81f0-c9fb49fb3c88	00230000-557f-dedf-69a4-5f21cdf4bff8	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7374232)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7373968)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7373632)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7373811)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557f-dee1-4c8f-d27c947818ad	00180000-557f-dee1-6467-5133508957f8	000c0000-557f-dee1-66de-483e73f59a14	00090000-557f-dee1-e737-300bbd6cfc3a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557f-dee1-d686-41995d499794	00180000-557f-dee1-6467-5133508957f8	000c0000-557f-dee1-7fcc-72f7acc85d4a	00090000-557f-dee1-2657-0d695966a495	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557f-dee1-8eca-3c59dc1b58d6	00180000-557f-dee1-6467-5133508957f8	000c0000-557f-dee1-184e-bb3bbe02fc6e	00090000-557f-dee1-b3ea-c186d9e7a5cc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557f-dee1-fb06-de2015583ae5	00180000-557f-dee1-6467-5133508957f8	000c0000-557f-dee1-b581-522ba529e7a7	00090000-557f-dee1-1148-9954c6faf47e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557f-dee1-fece-c37f888187cd	00180000-557f-dee1-6467-5133508957f8	000c0000-557f-dee1-3666-e54b409aae87	00090000-557f-dee1-7522-1c0e5baf9282	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557f-dee1-3d72-a569bd5613d5	00180000-557f-dee1-9afc-cb38df519a1f	\N	00090000-557f-dee1-7522-1c0e5baf9282	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7374012)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557f-dedf-3fc9-7d311c1a1db3	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557f-dedf-169c-063b1568ec14	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557f-dedf-45cf-6aae33b0272b	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557f-dedf-4672-e9e057d39808	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557f-dedf-7680-32ca8b33cc53	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557f-dedf-c20e-1fccb5eb8761	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557f-dedf-7aa1-272b2c39e75a	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557f-dedf-0a07-4906ec2e6c10	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557f-dedf-e8c5-d67987393f3e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557f-dedf-cbc7-a954c0f6c130	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557f-dedf-e4e0-2c0d50c8b700	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557f-dedf-f837-e6dade9f8bf2	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557f-dedf-47da-c0ce0c4674bf	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557f-dedf-83e2-2cae0d7df751	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557f-dedf-dbc4-54dcae22e92d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557f-dedf-fa71-da3ee927755a	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7374201)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557f-dedf-0da5-fc411dd207f4	01	Velika predstava	f	1.00	1.00
002b0000-557f-dedf-6367-3d2cad06b984	02	Mala predstava	f	0.50	0.50
002b0000-557f-dedf-064c-18bf6aa682d2	03	Mala koprodukcija	t	0.40	1.00
002b0000-557f-dedf-4075-74953e5935f3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557f-dedf-1af9-778fb521095e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7373695)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7373541)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557f-dee0-85c2-4f3290deca68	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROnCc8beYLOc/7fOd1wZ7PG1EQVoh3uFi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557f-dee1-e178-ac6b36f55e3d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557f-dee1-3e77-2425839214be	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557f-dee1-73f2-e6899fb4d9e6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557f-dee1-2d97-71b11614b8e7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557f-dee1-eaa4-c7ecc0cd9fc9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557f-dee1-c2d1-b00df10f9bd6	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557f-dee1-ffb5-4d14d88100ad	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-557f-dee1-2b30-a6d213ae332c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-557f-dee0-51fd-0f49eba6ebb7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7374069)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557f-dee1-6a4f-5573dbadd88b	00160000-557f-dee1-bf6f-b5ce8773c257	00150000-557f-dedf-02d8-b9708a4cd6b3	00140000-557f-dee0-e7a3-d64ef96c7a8b	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557f-dee1-b19e-524d59dae442
000e0000-557f-dee1-814a-e24791d2cf59	00160000-557f-dee1-e7f3-fb674702182e	00150000-557f-dedf-2bf5-05a106ff4e6c	00140000-557f-dee0-6cf7-b154ac5712d7	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557f-dee1-6160-b6c05295ef4c
000e0000-557f-dee1-47d6-ffe163f9bc80	\N	00150000-557f-dedf-2bf5-05a106ff4e6c	00140000-557f-dee0-6cf7-b154ac5712d7	00190000-557f-dee1-5a4c-7e68b4ea7594	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557f-dee1-b19e-524d59dae442
000e0000-557f-dee1-69dd-1789c3bb5e2a	\N	00150000-557f-dedf-2bf5-05a106ff4e6c	00140000-557f-dee0-6cf7-b154ac5712d7	00190000-557f-dee1-5a4c-7e68b4ea7594	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557f-dee1-b19e-524d59dae442
\.


--
-- TOC entry 2840 (class 0 OID 7373757)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557f-dee1-516e-3ecbce003549	000e0000-557f-dee1-814a-e24791d2cf59	1	
00200000-557f-dee1-4449-9b62a9be4925	000e0000-557f-dee1-814a-e24791d2cf59	2	
\.


--
-- TOC entry 2855 (class 0 OID 7373882)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7373951)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7373789)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7374059)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557f-dee0-e7a3-d64ef96c7a8b	01	Drama	drama (SURS 01)
00140000-557f-dee0-4d20-64fa8bfd2399	02	Opera	opera (SURS 02)
00140000-557f-dee0-f5d7-a473c10b979e	03	Balet	balet (SURS 03)
00140000-557f-dee0-80ef-a9eb7e914799	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557f-dee0-6d03-f4c6130c58e5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557f-dee0-6cf7-b154ac5712d7	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557f-dee0-230f-73cec98be3ef	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7373941)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557f-dedf-6855-0fd140524c3d	01	Opera	opera
00150000-557f-dedf-420e-53c84db58891	02	Opereta	opereta
00150000-557f-dedf-5842-6301973cef3c	03	Balet	balet
00150000-557f-dedf-6108-3b870eea47f3	04	Plesne prireditve	plesne prireditve
00150000-557f-dedf-80e9-3067f89c58cb	05	Lutkovno gledališče	lutkovno gledališče
00150000-557f-dedf-bc01-50a115d3c566	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557f-dedf-3c5e-180d45ab949b	07	Biografska drama	biografska drama
00150000-557f-dedf-02d8-b9708a4cd6b3	08	Komedija	komedija
00150000-557f-dedf-9cf1-ba34c1f97496	09	Črna komedija	črna komedija
00150000-557f-dedf-3988-e33549cc5abe	10	E-igra	E-igra
00150000-557f-dedf-2bf5-05a106ff4e6c	11	Kriminalka	kriminalka
00150000-557f-dedf-d00b-9e184ef6e279	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7373595)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7374116)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7374106)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7374011)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7373779)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7373804)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7373721)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7374145)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7373937)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7373755)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7373798)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7373735)
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
-- TOC entry 2495 (class 2606 OID 7373847)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7373874)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7373693)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7373604)
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
-- TOC entry 2410 (class 2606 OID 7373628)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7373584)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7373569)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7373880)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7373913)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7374054)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7373657)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7373681)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7373853)
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
-- TOC entry 2425 (class 2606 OID 7373671)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7373742)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7373865)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7373993)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7374039)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7374160)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7374230)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7374177)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7374198)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7373897)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7373838)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7373829)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7374033)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7373965)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7373540)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7373904)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7373558)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7373578)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7373922)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7373860)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7373810)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7374254)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7374242)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7374236)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7373978)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7373637)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7373820)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7374022)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7374211)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7373706)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7373553)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7374085)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7373764)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7373888)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7373956)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7373793)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7374067)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7373949)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7373786)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7373979)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7373980)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7373659)
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
-- TOC entry 2508 (class 1259 OID 7373881)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7373867)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7373866)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7373765)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7373938)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7373940)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7373939)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7373737)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7373736)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7374056)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7374057)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7374058)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7374200)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7374199)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7374090)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7374087)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7374091)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7374089)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7374088)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7373708)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7373707)
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
-- TOC entry 2408 (class 1259 OID 7373631)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7373905)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7373799)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7373585)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7373586)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7373925)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7373924)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7373923)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7373743)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7373745)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7373744)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7374244)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7373833)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7373831)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7373830)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7373832)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7373559)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7373560)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7373889)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7373854)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7373966)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7373967)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7374146)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7374147)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7374148)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7373673)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7373672)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7373674)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7374231)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7373994)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7373995)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7374120)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7374122)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7374118)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7374121)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7374119)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7373957)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7373842)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7373841)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7373839)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7373840)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7374108)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7374107)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7374161)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7373756)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7373606)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7373605)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7373638)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7373639)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7373823)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7373822)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7373821)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7374180)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7374178)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7374179)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7373788)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7373784)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7373781)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7373782)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7373780)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7373785)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7373783)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7373658)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7373722)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7373724)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7373723)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7373725)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7373848)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7374055)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7374086)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7373629)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7373630)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7373950)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7374255)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7373694)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7374243)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7373899)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7373898)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7374117)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7373682)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7374068)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7374040)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7374041)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7373579)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7373787)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7374391)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7374376)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7374381)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7374401)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7374371)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7374396)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7374386)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7374546)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7374551)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7374306)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7374486)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7374481)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7374476)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7374366)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7374516)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7374526)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7374521)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7374341)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7374336)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7374466)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7374571)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7374576)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7374581)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7374686)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7374681)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7374601)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7374586)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7374606)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7374596)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7374591)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7374331)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7374326)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7374291)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7374286)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7374496)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7374406)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7374266)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7374271)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7374511)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7374506)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7374501)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7374346)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7374356)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7374351)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7374696)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7374441)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7374431)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7374426)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7374436)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7374256)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7374261)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7374491)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7374471)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7374536)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7374541)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7374646)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7374651)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7374656)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7374316)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7374311)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7374321)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7374691)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7374556)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7374561)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7374631)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7374641)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7374621)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7374636)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7374626)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7374531)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7374461)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7374456)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7374446)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7374451)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7374616)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7374611)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7374661)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7374361)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7374566)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7374281)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7374276)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7374296)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7374301)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7374421)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7374416)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7374411)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7374676)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7374666)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7374671)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-16 10:31:30 CEST

--
-- PostgreSQL database dump complete
--

