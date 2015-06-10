--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-10 16:15:13 CEST

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
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6869833)
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
-- TOC entry 227 (class 1259 OID 6870355)
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
-- TOC entry 226 (class 1259 OID 6870338)
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
-- TOC entry 219 (class 1259 OID 6870242)
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
-- TOC entry 194 (class 1259 OID 6870012)
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
-- TOC entry 197 (class 1259 OID 6870046)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6869955)
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
-- TOC entry 228 (class 1259 OID 6870369)
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
-- TOC entry 213 (class 1259 OID 6870172)
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
-- TOC entry 192 (class 1259 OID 6869992)
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
-- TOC entry 196 (class 1259 OID 6870040)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6869972)
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
-- TOC entry 202 (class 1259 OID 6870089)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6870114)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6869929)
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
-- TOC entry 181 (class 1259 OID 6869842)
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
-- TOC entry 182 (class 1259 OID 6869853)
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
-- TOC entry 177 (class 1259 OID 6869807)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6869826)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6870121)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6870152)
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
-- TOC entry 223 (class 1259 OID 6870288)
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
-- TOC entry 184 (class 1259 OID 6869886)
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
-- TOC entry 186 (class 1259 OID 6869921)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6870095)
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
-- TOC entry 185 (class 1259 OID 6869906)
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
-- TOC entry 191 (class 1259 OID 6869984)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6870107)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6870227)
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
-- TOC entry 222 (class 1259 OID 6870280)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6870395)
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
-- TOC entry 233 (class 1259 OID 6870446)
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
-- TOC entry 230 (class 1259 OID 6870408)
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
-- TOC entry 231 (class 1259 OID 6870416)
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
-- TOC entry 209 (class 1259 OID 6870136)
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
-- TOC entry 201 (class 1259 OID 6870080)
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
-- TOC entry 200 (class 1259 OID 6870070)
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
-- TOC entry 221 (class 1259 OID 6870269)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6870204)
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
-- TOC entry 174 (class 1259 OID 6869778)
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
-- TOC entry 173 (class 1259 OID 6869776)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6870146)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6869816)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6869800)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6870160)
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
-- TOC entry 204 (class 1259 OID 6870101)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6870051)
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
-- TOC entry 236 (class 1259 OID 6870479)
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
-- TOC entry 235 (class 1259 OID 6870471)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6870466)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6870214)
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
-- TOC entry 183 (class 1259 OID 6869878)
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
-- TOC entry 199 (class 1259 OID 6870057)
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
-- TOC entry 220 (class 1259 OID 6870258)
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
-- TOC entry 232 (class 1259 OID 6870435)
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
-- TOC entry 188 (class 1259 OID 6869941)
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
-- TOC entry 175 (class 1259 OID 6869787)
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
-- TOC entry 225 (class 1259 OID 6870315)
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
-- TOC entry 193 (class 1259 OID 6870003)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6870128)
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
-- TOC entry 215 (class 1259 OID 6870197)
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
-- TOC entry 195 (class 1259 OID 6870035)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6870305)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6870187)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6869781)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2815 (class 0 OID 6869833)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6870355)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5578-4670-cf46-491e55281a84	000d0000-5578-4670-cbc9-61bc8349a388	\N	00090000-5578-4670-7681-36769f98fde3	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-4670-8fed-fa667273f473	000d0000-5578-4670-f6ae-2243d744b9a7	\N	00090000-5578-4670-a144-8597509a7a03	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-4670-578c-01a6a8548db0	000d0000-5578-4670-da8e-04d3aa860ae0	\N	00090000-5578-4670-5c30-2b8d6716154a	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-4670-e42f-4b4909862f3a	000d0000-5578-4670-fba7-0b367bec2e74	\N	00090000-5578-4670-00a7-2a7be6617c1b	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-4671-459d-a00d66599ca4	000d0000-5578-4670-64d8-86be5c585a56	\N	00090000-5578-4670-8f74-a12a8237c80c	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5578-4671-a773-55eb5e69b827	000d0000-5578-4670-79c3-cf3f11e6198f	\N	00090000-5578-4670-a144-8597509a7a03	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2861 (class 0 OID 6870338)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6870242)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5578-4670-dfae-d3a89f02d73b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5578-4670-33cb-f369140b9cbf	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5578-4670-10b8-fadb04effb69	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2829 (class 0 OID 6870012)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5578-4670-6847-abae269ecb68	\N	\N	00200000-5578-4670-ea30-50409db87c0d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5578-4670-5d50-ebcda95ef4b0	\N	\N	00200000-5578-4670-4ac7-54adc8d08a0b	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5578-4670-1693-b8367d406406	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5578-4670-5b67-a2b629a6318f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5578-4670-2a00-21cd38947303	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2832 (class 0 OID 6870046)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6869955)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5578-466f-636f-a52fd69a6b95	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5578-466f-a2ff-31879eb9fd23	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5578-466f-3202-76e636390571	AL	ALB	008	Albania 	Albanija	\N
00040000-5578-466f-9ddb-2f0f2c70e898	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5578-466f-0b60-15c0906be216	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5578-466f-3f0e-da149c59b51d	AD	AND	020	Andorra 	Andora	\N
00040000-5578-466f-6295-2b2033e59b15	AO	AGO	024	Angola 	Angola	\N
00040000-5578-466f-beae-41fc71a794d8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5578-466f-1cd1-95842a19137b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5578-466f-3365-35276ef47385	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-466f-7526-3ba881876bca	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5578-466f-b847-d4fc0012d3c2	AM	ARM	051	Armenia 	Armenija	\N
00040000-5578-466f-96a2-1e27a121736a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5578-466f-2a0f-261999a6f252	AU	AUS	036	Australia 	Avstralija	\N
00040000-5578-466f-e1b4-5ca81f5c85f5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5578-466f-f922-a39ce2bcbb7f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5578-466f-684a-7bebe8683ea4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5578-466f-51e4-1082889e518d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5578-466f-00e3-5c52cd258a8b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5578-466f-6e8e-f4956457fd3a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5578-466f-5e8c-7ba6339aba9d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5578-466f-1f8c-f39cafd2556e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5578-466f-1b32-cee539b6f85a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5578-466f-837a-70c7be448603	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5578-466f-773f-1e140de2d127	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5578-466f-e8e7-e56ce50ef69d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5578-466f-1c17-d382ff162694	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5578-466f-7c1e-4b120483d1a2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5578-466f-65f1-643e4d9c261d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5578-466f-d5c4-06d007168829	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5578-466f-87b5-a84020bdd885	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5578-466f-eb37-0d5972c0bde0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5578-466f-4756-ef3536565c82	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5578-466f-1d49-18f6d881c0b8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5578-466f-26d6-35e49fa8fec3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5578-466f-d615-486f06664cd5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5578-466f-59d1-84ce0ea76a2d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5578-466f-d23c-c45d273c4b11	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5578-466f-0bf7-a05424c9a7c5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5578-466f-dded-0aacd727e94f	CA	CAN	124	Canada 	Kanada	\N
00040000-5578-466f-719d-55d41bb6e30c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5578-466f-5104-4652f53ebc3a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5578-466f-0b26-c03f0a5534ff	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5578-466f-5bba-b3c82c2f62b4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5578-466f-a794-edd4dd591c0e	CL	CHL	152	Chile 	Čile	\N
00040000-5578-466f-2885-f6f58a38253c	CN	CHN	156	China 	Kitajska	\N
00040000-5578-466f-1cc1-a19a4b3fb463	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5578-466f-5bb6-c9af3093963c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5578-466f-5452-4c392b55407d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5578-466f-3b03-ac08cd3e64ba	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5578-466f-9498-9f464f981c7f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5578-466f-4cca-410a58a3250b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5578-466f-5d04-966b9243fd23	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5578-466f-1b7d-c7ccac47975b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5578-466f-4a1e-fae53e684df9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5578-466f-26c7-4f37d294e5d4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5578-466f-0b79-e35a621958e5	CU	CUB	192	Cuba 	Kuba	\N
00040000-5578-466f-f5a8-b1427fe66bb3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5578-466f-4f0a-9983e7c07dc5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5578-466f-f505-1c50719f3218	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5578-466f-26bf-22fafee14a42	DK	DNK	208	Denmark 	Danska	\N
00040000-5578-466f-873a-2aebbcc9196b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5578-466f-5930-88f418d602f0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5578-466f-0bbc-67852d29c2c6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5578-466f-e498-40902a62e924	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5578-466f-113b-0543d18153bc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5578-466f-1cf9-126f6f235379	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5578-466f-9874-0c253c412547	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5578-466f-7d78-dad26e42feec	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5578-466f-efd3-121ee364c29f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5578-466f-6ba4-1a17d5cb8d1d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5578-466f-9be5-b65de8e9c182	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5578-466f-0afa-9675144f2a03	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5578-466f-5444-1ee1f0127459	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5578-466f-43d6-7095c333a7dd	FI	FIN	246	Finland 	Finska	\N
00040000-5578-466f-b3e2-663d50a1e4b9	FR	FRA	250	France 	Francija	\N
00040000-5578-466f-d7a7-0d8cb34bc86f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5578-466f-6cfa-4c528956edfd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5578-466f-0c93-cc88ae319b45	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5578-466f-cdba-9f6ea282d165	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5578-466f-dd75-7ad39a28ce75	GA	GAB	266	Gabon 	Gabon	\N
00040000-5578-466f-f559-ae317d5ee13f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5578-466f-6dc3-faadc3329de6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5578-466f-2615-fe6dd5169e02	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5578-466f-86e3-8d2ca56d90a3	GH	GHA	288	Ghana 	Gana	\N
00040000-5578-466f-44ee-32bc2bc826b9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5578-466f-bc3c-acec521c0c20	GR	GRC	300	Greece 	Grčija	\N
00040000-5578-466f-ca63-549f430774b8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5578-466f-a974-fa4ebe45176e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5578-466f-d188-2f36391a7b3b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5578-466f-8c4d-4755369a10a8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5578-466f-635d-872b27cf06ad	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5578-466f-d0bc-e6570a6f9ba3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5578-466f-3341-68e1c009656a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5578-466f-5a24-3cedeec9dc52	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5578-466f-e561-eed740db820d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5578-466f-1539-b6d06f6f7233	HT	HTI	332	Haiti 	Haiti	\N
00040000-5578-466f-11fc-ad12e685eb6f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5578-466f-0002-090376c5ccc7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5578-466f-ec39-1ae88d2b291a	HN	HND	340	Honduras 	Honduras	\N
00040000-5578-466f-c81f-65f17d774b1b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5578-466f-a315-f3aed7ad0e70	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5578-466f-045a-4f19cee9c320	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5578-466f-2651-587780925939	IN	IND	356	India 	Indija	\N
00040000-5578-466f-1e09-306f76c266df	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5578-466f-a1bd-35a679eb4831	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5578-466f-c67c-50d1312735de	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5578-466f-e252-644a9309a038	IE	IRL	372	Ireland 	Irska	\N
00040000-5578-466f-ce6b-eb52c042f655	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5578-466f-583f-d38d5568ee3f	IL	ISR	376	Israel 	Izrael	\N
00040000-5578-466f-98f1-5ee94fd47845	IT	ITA	380	Italy 	Italija	\N
00040000-5578-466f-af57-29f834ab44b9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5578-466f-8203-78f4a6982305	JP	JPN	392	Japan 	Japonska	\N
00040000-5578-466f-6871-94ae8448abfb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5578-466f-7f13-fa92a39b9e84	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5578-466f-69c2-476d78e954ca	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5578-466f-8e71-8793ab9af64e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5578-466f-467c-992ede204979	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5578-466f-6b48-81cdb40f03f2	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5578-466f-430e-b844da50961c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5578-466f-146f-13f9c955b8f5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5578-466f-372f-cf1eccbee491	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5578-466f-b931-48cc93e82a96	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5578-466f-0073-8e47cd6b2781	LV	LVA	428	Latvia 	Latvija	\N
00040000-5578-466f-b6f0-bb027eeae39e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5578-466f-3de9-99cfe1f523c6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5578-466f-e5d4-66f0921fdac3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5578-466f-33a3-3c49d7192a4b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5578-466f-d668-c60aa12108ec	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5578-466f-5c6f-af75a204a946	LT	LTU	440	Lithuania 	Litva	\N
00040000-5578-466f-76b4-2f745bcebafd	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5578-466f-69aa-b8a2fa0faf1a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5578-466f-1e19-92541d4f99b4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5578-466f-31a2-b7ffb98f67af	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5578-466f-ee6d-bcfe2664fa07	MW	MWI	454	Malawi 	Malavi	\N
00040000-5578-466f-113c-9f25349b8db4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5578-466f-f669-3c90c0f31051	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5578-466f-448b-f5131f49ac5a	ML	MLI	466	Mali 	Mali	\N
00040000-5578-466f-ab3f-111a48f5736b	MT	MLT	470	Malta 	Malta	\N
00040000-5578-466f-650d-51d1fcf1bc46	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5578-466f-bcdf-6123dd68fb49	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5578-466f-49be-01b979784510	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5578-466f-c7d3-b73c85c88fe2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5578-466f-2347-5bcf4a3dc2be	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5578-466f-6640-54c70f3e4065	MX	MEX	484	Mexico 	Mehika	\N
00040000-5578-466f-fdae-d601620b5cfd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5578-466f-f9d0-2a538e161e36	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5578-466f-3e46-a8f1813f8394	MC	MCO	492	Monaco 	Monako	\N
00040000-5578-466f-5984-869276a110e1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5578-466f-9cca-d39ecc0673a0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5578-466f-366b-c2cfea622515	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5578-466f-2c23-6b3034dd06f9	MA	MAR	504	Morocco 	Maroko	\N
00040000-5578-466f-21ab-a36383b5d872	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5578-466f-c864-3a107feb7c83	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5578-466f-01f1-e5d759f1e8b9	NA	NAM	516	Namibia 	Namibija	\N
00040000-5578-466f-cd9d-44d2e2f098bd	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5578-466f-bde2-6e56cf29e25d	NP	NPL	524	Nepal 	Nepal	\N
00040000-5578-466f-bebc-577d7cd889fd	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5578-466f-348b-fd754e43cba3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5578-466f-2d93-36e6f76f89f9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5578-466f-681c-dbdc81ac518d	NE	NER	562	Niger 	Niger 	\N
00040000-5578-466f-dab5-32ec677c6bcc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5578-466f-55f4-f84cdaedee96	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5578-466f-e827-21586deb0e25	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5578-466f-d387-778943e465d6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5578-466f-1bfb-83b643590683	NO	NOR	578	Norway 	Norveška	\N
00040000-5578-466f-b5cd-85608e590d0d	OM	OMN	512	Oman 	Oman	\N
00040000-5578-466f-6053-461bf584ff48	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5578-466f-c947-8c064eb87ac5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5578-466f-4e87-36b9ba7c26f8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5578-466f-3bcd-25bdc9b62213	PA	PAN	591	Panama 	Panama	\N
00040000-5578-466f-c089-b16a28753947	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5578-466f-a3e8-7e79559bc6e5	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5578-466f-6385-821ec3240327	PE	PER	604	Peru 	Peru	\N
00040000-5578-466f-67f2-3170bed70429	PH	PHL	608	Philippines 	Filipini	\N
00040000-5578-466f-db7c-99afb5b1859f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5578-466f-2a04-0e81f760ebeb	PL	POL	616	Poland 	Poljska	\N
00040000-5578-466f-380e-55a92f04dab0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5578-466f-ea95-7626112015f3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5578-466f-ac73-e006a0c9bc5f	QA	QAT	634	Qatar 	Katar	\N
00040000-5578-466f-edea-57e3b585fab5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5578-466f-692e-e9e417d2207f	RO	ROU	642	Romania 	Romunija	\N
00040000-5578-466f-bb36-43a19f7e9f21	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5578-466f-3c88-b6cba2179411	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5578-466f-0826-8e333343fa63	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5578-466f-83a4-f858401c4166	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5578-466f-b3e5-e24aaf8dc6c3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5578-466f-4d80-b7e43ffa545a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5578-466f-9aa8-074d0bb2bb88	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5578-466f-c021-9e9b2f1c591d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5578-466f-5b36-f8da577be5be	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5578-466f-86b3-8be8a16b790a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5578-466f-1c45-eb491cbc4dcc	SM	SMR	674	San Marino 	San Marino	\N
00040000-5578-466f-b45a-0357a0fa6033	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5578-466f-f5ed-da398e8b47b0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5578-466f-710e-40ca10d5247e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5578-466f-0504-a33ef6c4a874	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5578-466f-c35b-890e46e894b8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5578-466f-2f6c-29028237e7eb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5578-466f-89e5-425b5a11e66b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5578-466f-09fb-4f81c5861502	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5578-466f-f015-6582a5567ffe	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5578-466f-08f3-48b88c6f324e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5578-466f-c856-5c5effd98cb3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5578-466f-602c-61bf14994eb5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5578-466f-9079-59b8665f2da8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5578-466f-7d7a-b673ed7915f1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5578-466f-66f3-6f60dc0e0015	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5578-466f-771f-600bfabb0115	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5578-466f-8f9d-d03c9b992970	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5578-466f-5f2d-4a628275387c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5578-466f-45c6-4d487a1aaca4	SR	SUR	740	Suriname 	Surinam	\N
00040000-5578-466f-a6ac-03b574f8d707	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5578-466f-c874-c5f767700775	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5578-466f-92a1-1af3fb7af85e	SE	SWE	752	Sweden 	Švedska	\N
00040000-5578-466f-48f5-6cd4d8cddaf4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5578-466f-0d84-d60a8a090e58	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5578-466f-3251-261721b3b697	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5578-466f-e43e-239ded65c8e1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5578-466f-605a-b6c3b8ccba81	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5578-466f-7c5e-45e525dbd1ac	TH	THA	764	Thailand 	Tajska	\N
00040000-5578-466f-588a-21c4f166a51b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5578-466f-e054-9a9475304f5f	TG	TGO	768	Togo 	Togo	\N
00040000-5578-466f-e1e2-3a97b934ed39	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5578-466f-2c83-1ad32d40a16a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5578-466f-c5d7-08771a823aeb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5578-466f-a0e5-42917fe09afa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5578-466f-0e81-3f3c72580d0e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5578-466f-106f-f7ac6b944ec8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5578-466f-5c7f-02346403d4d7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-466f-a9bf-f333c0ced103	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5578-466f-32f3-ea8e4fbdf32b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5578-466f-c5a4-36fcbd7b0f44	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5578-466f-8708-fe95cf4217a7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5578-466f-6270-927fc4bbf21b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5578-466f-2a98-0559b2be555c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5578-466f-042b-d873f90ce3a8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5578-466f-a4ee-387287a84f42	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5578-466f-b6fd-ef5373dd7632	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5578-466f-9fe8-54c636d640ba	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5578-466f-9d5c-26a3d6ccf9cb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5578-466f-4376-6da396527d2e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5578-466f-8131-c13edfb9927d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5578-466f-e7c3-720dbb657a1a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5578-466f-4d5f-58fdd6d0ae3b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5578-466f-e99c-61e58c8767fd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5578-466f-88ca-e9253fa2fffd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5578-466f-d9c5-061a0a7e49fb	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5578-466f-b472-0440c1138d1a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2863 (class 0 OID 6870369)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 6870172)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5578-4670-68e3-70cabf23d0e9	000e0000-5578-4670-9973-16a7a31fe1ec	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5578-466f-2a31-8c4a3ffb26b6
000d0000-5578-4670-cbc9-61bc8349a388	000e0000-5578-4670-9973-16a7a31fe1ec	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-466f-2a31-8c4a3ffb26b6
000d0000-5578-4670-f6ae-2243d744b9a7	000e0000-5578-4670-9973-16a7a31fe1ec	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5578-466f-5c8f-989586e7ed1d
000d0000-5578-4670-da8e-04d3aa860ae0	000e0000-5578-4670-9973-16a7a31fe1ec	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5578-466f-f452-8fdf672aad2c
000d0000-5578-4670-fba7-0b367bec2e74	000e0000-5578-4670-9973-16a7a31fe1ec	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5578-466f-f452-8fdf672aad2c
000d0000-5578-4670-64d8-86be5c585a56	000e0000-5578-4670-9973-16a7a31fe1ec	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5578-466f-f452-8fdf672aad2c
000d0000-5578-4670-79c3-cf3f11e6198f	000e0000-5578-4670-9973-16a7a31fe1ec	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5578-466f-2a31-8c4a3ffb26b6
\.


--
-- TOC entry 2827 (class 0 OID 6869992)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6870040)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6869972)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5578-4670-3498-1f1d8eee95a5	00080000-5578-4670-147a-e79404768720	00090000-5578-4670-7681-36769f98fde3	AK		
\.


--
-- TOC entry 2805 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6870089)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6870114)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6869929)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5578-4670-dea6-95bbee31dbff	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5578-4670-b170-ef4c15ef7473	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5578-4670-24de-fc0917a0e955	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5578-4670-b1e1-406e8d2897df	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5578-4670-8961-f59a106421de	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5578-4670-5fec-43e1436efd4f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5578-4670-f872-827d8bf5e7d2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5578-4670-bd6e-a3d93a70b765	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5578-4670-3398-7d7018ecdc53	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5578-4670-b3f7-93170cee773c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5578-4670-0831-85a9b7848c5d	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5578-4670-8ea6-cf4c0e56c185	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5578-4670-2a95-f905bab27f10	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-4670-fcb9-d8f56cb377bc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5578-4670-1478-2c050e618301	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5578-4670-8dd6-70b3c2a14390	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2816 (class 0 OID 6869842)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5578-4670-c4a7-e3a931354f45	00000000-5578-4670-8961-f59a106421de	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5578-4670-f340-f04cc9bc1cc9	00000000-5578-4670-8961-f59a106421de	00010000-5578-4670-5759-66d0d7eb8899	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5578-4670-4323-49a86e3f2b0f	00000000-5578-4670-5fec-43e1436efd4f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2817 (class 0 OID 6869853)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5578-4670-12c5-e964648faccb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5578-4670-00a7-2a7be6617c1b	00010000-5578-4670-bda0-a488a5f1d8ea	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5578-4670-5c30-2b8d6716154a	00010000-5578-4670-206c-cdcd76b2b4b2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5578-4670-bc4a-00c288f451f3	00010000-5578-4670-f666-194a0f6a7646	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5578-4670-7b43-f92dd4fe91c9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5578-4670-dc03-5a91e82df5b2	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5578-4670-97d2-0f3ec101b448	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5578-4670-d5f9-fedf39040463	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5578-4670-7681-36769f98fde3	00010000-5578-4670-f8da-ad3ad153887a	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5578-4670-a144-8597509a7a03	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5578-4670-4b0f-2ed38afae330	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5578-4670-8f74-a12a8237c80c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5578-4670-9dc2-799083e3ffd0	00010000-5578-4670-4181-64c5638ca71f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2807 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6869807)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5578-466f-1690-2679a3e224de	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5578-466f-251a-9d42b1da71b1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5578-466f-b480-049a499fa8c2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5578-466f-0639-02f8d7c9b4a7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5578-466f-13a5-7ae33aea809e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5578-466f-1c15-20913da00fe8	Abonma-read	Abonma - branje	f
00030000-5578-466f-f03e-755cf10bfe94	Abonma-write	Abonma - spreminjanje	f
00030000-5578-466f-62e5-6ae22f95acec	Alternacija-read	Alternacija - branje	f
00030000-5578-466f-b469-06551d2f7fa5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5578-466f-1b71-90bb0f88ea09	Arhivalija-read	Arhivalija - branje	f
00030000-5578-466f-0513-eac426b2a8a4	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5578-466f-aa04-c38d2c701a06	Besedilo-read	Besedilo - branje	f
00030000-5578-466f-4f07-5549915c997a	Besedilo-write	Besedilo - spreminjanje	f
00030000-5578-466f-017d-9da8d973d6a5	DogodekIzven-read	DogodekIzven - branje	f
00030000-5578-466f-3ff3-e3c7a22ac49d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5578-466f-71bd-398a27e64a0e	Dogodek-read	Dogodek - branje	f
00030000-5578-466f-cdda-f3ca30d45e8d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5578-466f-a67d-ebb8ccad8178	Drzava-read	Drzava - branje	f
00030000-5578-466f-3bd5-569ce525f74e	Drzava-write	Drzava - spreminjanje	f
00030000-5578-466f-0d54-1fbadbec8d55	Funkcija-read	Funkcija - branje	f
00030000-5578-466f-29b2-d9be7a1149df	Funkcija-write	Funkcija - spreminjanje	f
00030000-5578-466f-9ead-e376fb59549e	Gostovanje-read	Gostovanje - branje	f
00030000-5578-466f-9fb5-f3769e4ef492	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5578-466f-f988-2d9e82c49c90	Gostujoca-read	Gostujoca - branje	f
00030000-5578-466f-ce38-88dc76bf86a0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5578-466f-54b6-d2f8911b2c25	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5578-466f-212f-5ede246994ac	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5578-466f-d0dc-9674b65439a4	Kupec-read	Kupec - branje	f
00030000-5578-466f-43d9-3341180068ab	Kupec-write	Kupec - spreminjanje	f
00030000-5578-466f-b4dd-bcce88798665	NacinPlacina-read	NacinPlacina - branje	f
00030000-5578-466f-cbc9-eccdb98fd5bb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5578-466f-3ea3-d7b490f45ac7	Option-read	Option - branje	f
00030000-5578-466f-b160-6670402f0d64	Option-write	Option - spreminjanje	f
00030000-5578-466f-6d98-ad81851bc9a5	OptionValue-read	OptionValue - branje	f
00030000-5578-466f-88da-942848c0286b	OptionValue-write	OptionValue - spreminjanje	f
00030000-5578-466f-badf-219b88ff76f7	Oseba-read	Oseba - branje	f
00030000-5578-466f-8b53-de3296745fb8	Oseba-write	Oseba - spreminjanje	f
00030000-5578-466f-7240-87e60144b8a8	Permission-read	Permission - branje	f
00030000-5578-466f-e5a1-4e6246700f68	Permission-write	Permission - spreminjanje	f
00030000-5578-466f-aa4a-09a176f0c791	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5578-466f-0404-ab3a9a8fb7b9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5578-466f-1c0c-51735072b96e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5578-466f-0117-dc2a6a387f8a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5578-466f-022f-f5ef7fb8c44c	Pogodba-read	Pogodba - branje	f
00030000-5578-466f-3a74-7d825a307a11	Pogodba-write	Pogodba - spreminjanje	f
00030000-5578-466f-be30-8804fc6f272a	Popa-read	Popa - branje	f
00030000-5578-466f-86cb-63060ac130c2	Popa-write	Popa - spreminjanje	f
00030000-5578-466f-2d6f-865f727411e0	Posta-read	Posta - branje	f
00030000-5578-466f-64d2-637862743776	Posta-write	Posta - spreminjanje	f
00030000-5578-466f-26bd-51e707496183	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5578-466f-006c-5b6f24d3b671	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5578-466f-3197-5ed216a531f7	PostniNaslov-read	PostniNaslov - branje	f
00030000-5578-466f-5fba-39fac90e5136	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5578-466f-d680-47afb5fc740f	Predstava-read	Predstava - branje	f
00030000-5578-466f-077d-37d034d946da	Predstava-write	Predstava - spreminjanje	f
00030000-5578-466f-60f9-eeae4e4a059c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5578-466f-858b-fd2c5546d866	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5578-466f-5f87-f1e09937cc42	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5578-466f-fb60-0447969a682a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5578-466f-205c-36bb488ddfdc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5578-466f-a5e9-f0fbaf252d55	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5578-466f-3e61-02dd60ad1a86	ProgramDela-read	ProgramDela - branje	f
00030000-5578-466f-dda3-5c69ea9f5d3d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5578-466f-2757-f6d1c6e6c60e	ProgramFestival-read	ProgramFestival - branje	f
00030000-5578-466f-5e1f-3d0a14b3383a	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5578-466f-4a0f-0a340c6b60de	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5578-466f-f566-b5db5cbebd1f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5578-466f-c86b-941102399008	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5578-466f-f83b-bda06826ce3a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5578-466f-ce1f-0029ef5e5522	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5578-466f-b4ce-cfca2df00ce6	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5578-466f-3c2a-40f308f0f38a	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5578-466f-b201-17cbb6ebeac4	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5578-466f-e973-776e1d0a20fd	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5578-466f-5db7-d8d454f18fa3	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5578-466f-23af-a272617aab39	Prostor-read	Prostor - branje	f
00030000-5578-466f-2005-795f74b150fe	Prostor-write	Prostor - spreminjanje	f
00030000-5578-466f-4d2c-5ed4f2d6699e	Racun-read	Racun - branje	f
00030000-5578-466f-52ae-59726cafa172	Racun-write	Racun - spreminjanje	f
00030000-5578-466f-d295-5e8b2662de91	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5578-466f-c86c-244c10718044	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5578-466f-769c-10a58d1cc58a	Readme-read	Readme - branje	f
00030000-5578-466f-fff2-358c5032eebb	Readme-write	Readme - spreminjanje	f
00030000-5578-466f-078a-1ab92f25cba7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5578-466f-7e75-6f2ddcf9dab0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5578-466f-de14-c730d357d0db	Rekvizit-read	Rekvizit - branje	f
00030000-5578-466f-df88-30be1543438c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5578-466f-0824-8bd1ee480a81	Revizija-read	Revizija - branje	f
00030000-5578-466f-ed02-e23ac1f4c105	Revizija-write	Revizija - spreminjanje	f
00030000-5578-466f-23a8-41121d591ed4	Rezervacija-read	Rezervacija - branje	f
00030000-5578-466f-7fa9-4924815f11a0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5578-466f-b398-21b7daec4af1	Role-read	Role - branje	f
00030000-5578-466f-f696-86139703a9ed	Role-write	Role - spreminjanje	f
00030000-5578-466f-0d24-347134d18a66	SedezniRed-read	SedezniRed - branje	f
00030000-5578-466f-f84e-bbb5f60e7368	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5578-466f-e35a-178ee80a0b89	Sedez-read	Sedez - branje	f
00030000-5578-466f-cc3a-b8f250badb3d	Sedez-write	Sedez - spreminjanje	f
00030000-5578-466f-0282-47449e35fe17	Sezona-read	Sezona - branje	f
00030000-5578-466f-1a2f-836c30d9d5b6	Sezona-write	Sezona - spreminjanje	f
00030000-5578-466f-4f87-42c4ea7f251d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5578-466f-eff7-81116b763f82	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5578-466f-ce92-1a4211610839	Stevilcenje-read	Stevilcenje - branje	f
00030000-5578-466f-f898-7e74bdd1d763	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5578-466f-8a0a-9e962fad1df0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5578-466f-3918-1eb089d531ae	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5578-466f-3640-e20831b93049	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5578-466f-2362-8469228fe363	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5578-466f-a8b4-26bdf0f61c08	Telefonska-read	Telefonska - branje	f
00030000-5578-466f-3439-b2bad7cb913d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5578-466f-ae06-cdcd7b5ae5eb	TerminStoritve-read	TerminStoritve - branje	f
00030000-5578-466f-d4c8-8e0d4eac7e07	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5578-466f-804a-8cf99a7637c9	TipFunkcije-read	TipFunkcije - branje	f
00030000-5578-466f-cb18-bc2bd6166c7e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5578-466f-c519-4839323cd35d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5578-466f-2005-aff867552078	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5578-466f-8a43-400f53a247b3	Trr-read	Trr - branje	f
00030000-5578-466f-afca-f8050deb1462	Trr-write	Trr - spreminjanje	f
00030000-5578-466f-719c-51e7ce4780ba	Uprizoritev-read	Uprizoritev - branje	f
00030000-5578-466f-faca-58b556ebeb7d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5578-466f-c7a8-849f130c4898	User-read	User - branje	f
00030000-5578-466f-5092-57b606ed313e	User-write	User - spreminjanje	f
00030000-5578-466f-a639-9e7022fca3f7	Vaja-read	Vaja - branje	f
00030000-5578-466f-9bb0-01af129f852b	Vaja-write	Vaja - spreminjanje	f
00030000-5578-466f-77cd-823cf0fd7abb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5578-466f-54c2-90f31ac91f3e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5578-466f-9008-b6ff3531fb24	Zaposlitev-read	Zaposlitev - branje	f
00030000-5578-466f-a81c-3f73a06356b5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5578-466f-4acb-21f216cad445	Zasedenost-read	Zasedenost - branje	f
00030000-5578-466f-e4ee-c55f8f07649c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5578-466f-23fa-ed2cb7e28859	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5578-466f-424b-d78712076910	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5578-466f-e46b-c36d9945355c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5578-466f-d619-058ee6345284	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2814 (class 0 OID 6869826)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5578-4670-c59a-07c472d5533f	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-1c15-20913da00fe8
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-f03e-755cf10bfe94
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-62e5-6ae22f95acec
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-b469-06551d2f7fa5
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-1b71-90bb0f88ea09
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-71bd-398a27e64a0e
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-0639-02f8d7c9b4a7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-cdda-f3ca30d45e8d
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-3bd5-569ce525f74e
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-0d54-1fbadbec8d55
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-29b2-d9be7a1149df
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-9ead-e376fb59549e
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-9fb5-f3769e4ef492
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-f988-2d9e82c49c90
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-ce38-88dc76bf86a0
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-54b6-d2f8911b2c25
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-212f-5ede246994ac
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-3ea3-d7b490f45ac7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-6d98-ad81851bc9a5
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-badf-219b88ff76f7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-8b53-de3296745fb8
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-be30-8804fc6f272a
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-86cb-63060ac130c2
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-2d6f-865f727411e0
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-64d2-637862743776
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-3197-5ed216a531f7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-5fba-39fac90e5136
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-d680-47afb5fc740f
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-077d-37d034d946da
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-205c-36bb488ddfdc
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-a5e9-f0fbaf252d55
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-23af-a272617aab39
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-2005-795f74b150fe
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-078a-1ab92f25cba7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-7e75-6f2ddcf9dab0
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-de14-c730d357d0db
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-df88-30be1543438c
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-0282-47449e35fe17
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-1a2f-836c30d9d5b6
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-804a-8cf99a7637c9
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-719c-51e7ce4780ba
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-faca-58b556ebeb7d
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-a639-9e7022fca3f7
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-9bb0-01af129f852b
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-4acb-21f216cad445
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-e4ee-c55f8f07649c
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-23fa-ed2cb7e28859
00020000-5578-4670-ebf6-8c8760b1741e	00030000-5578-466f-e46b-c36d9945355c
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-1c15-20913da00fe8
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-1b71-90bb0f88ea09
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-71bd-398a27e64a0e
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-9ead-e376fb59549e
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-f988-2d9e82c49c90
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-54b6-d2f8911b2c25
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-212f-5ede246994ac
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-3ea3-d7b490f45ac7
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-6d98-ad81851bc9a5
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-badf-219b88ff76f7
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-8b53-de3296745fb8
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-be30-8804fc6f272a
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-2d6f-865f727411e0
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-3197-5ed216a531f7
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-5fba-39fac90e5136
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-d680-47afb5fc740f
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-23af-a272617aab39
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-078a-1ab92f25cba7
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-de14-c730d357d0db
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-0282-47449e35fe17
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-a8b4-26bdf0f61c08
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-3439-b2bad7cb913d
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-8a43-400f53a247b3
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-afca-f8050deb1462
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-9008-b6ff3531fb24
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-a81c-3f73a06356b5
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-23fa-ed2cb7e28859
00020000-5578-4670-b84c-a90c4821eec8	00030000-5578-466f-e46b-c36d9945355c
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-1c15-20913da00fe8
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-62e5-6ae22f95acec
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-1b71-90bb0f88ea09
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-0513-eac426b2a8a4
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-aa04-c38d2c701a06
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-017d-9da8d973d6a5
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-71bd-398a27e64a0e
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-0d54-1fbadbec8d55
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-9ead-e376fb59549e
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-f988-2d9e82c49c90
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-54b6-d2f8911b2c25
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-3ea3-d7b490f45ac7
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-6d98-ad81851bc9a5
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-badf-219b88ff76f7
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-be30-8804fc6f272a
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-2d6f-865f727411e0
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-d680-47afb5fc740f
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-205c-36bb488ddfdc
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-23af-a272617aab39
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-078a-1ab92f25cba7
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-de14-c730d357d0db
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-0282-47449e35fe17
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-804a-8cf99a7637c9
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-a639-9e7022fca3f7
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-4acb-21f216cad445
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-23fa-ed2cb7e28859
00020000-5578-4670-c322-6c8ab08da683	00030000-5578-466f-e46b-c36d9945355c
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-1c15-20913da00fe8
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-f03e-755cf10bfe94
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-b469-06551d2f7fa5
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-1b71-90bb0f88ea09
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-71bd-398a27e64a0e
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-9ead-e376fb59549e
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-f988-2d9e82c49c90
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-3ea3-d7b490f45ac7
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-6d98-ad81851bc9a5
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-be30-8804fc6f272a
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-2d6f-865f727411e0
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-d680-47afb5fc740f
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-23af-a272617aab39
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-078a-1ab92f25cba7
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-de14-c730d357d0db
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-0282-47449e35fe17
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-804a-8cf99a7637c9
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-23fa-ed2cb7e28859
00020000-5578-4670-a88e-7426d6f328c5	00030000-5578-466f-e46b-c36d9945355c
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-1c15-20913da00fe8
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-1b71-90bb0f88ea09
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-71bd-398a27e64a0e
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-a67d-ebb8ccad8178
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-9ead-e376fb59549e
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-f988-2d9e82c49c90
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-3ea3-d7b490f45ac7
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-6d98-ad81851bc9a5
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-be30-8804fc6f272a
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-2d6f-865f727411e0
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-d680-47afb5fc740f
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-23af-a272617aab39
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-078a-1ab92f25cba7
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-de14-c730d357d0db
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-0282-47449e35fe17
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-ae06-cdcd7b5ae5eb
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-b480-049a499fa8c2
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-804a-8cf99a7637c9
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-23fa-ed2cb7e28859
00020000-5578-4670-1a1d-8927bf0f7863	00030000-5578-466f-e46b-c36d9945355c
\.


--
-- TOC entry 2842 (class 0 OID 6870121)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6870152)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6870288)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6869886)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5578-4670-147a-e79404768720	00040000-5578-466f-636f-a52fd69a6b95	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-4670-8d2c-f8389aa64b77	00040000-5578-466f-636f-a52fd69a6b95	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-4670-c6cf-2e3d7689eec1	00040000-5578-466f-636f-a52fd69a6b95	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5578-4670-0567-6189ebdbb463	00040000-5578-466f-636f-a52fd69a6b95	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2821 (class 0 OID 6869921)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5578-466f-6837-55892ba7167b	8341	Adlešiči
00050000-5578-466f-68e7-9186720d89be	5270	Ajdovščina
00050000-5578-466f-d19b-d4eca3e795f2	6280	Ankaran/Ancarano
00050000-5578-466f-d2c6-75d25916c315	9253	Apače
00050000-5578-466f-9bd5-7ff7d08ba52c	8253	Artiče
00050000-5578-466f-5d0d-82d053bda645	4275	Begunje na Gorenjskem
00050000-5578-466f-3aa4-b2c6af603421	1382	Begunje pri Cerknici
00050000-5578-466f-74e4-847a02ebaa25	9231	Beltinci
00050000-5578-466f-d6f0-04a7a92da72b	2234	Benedikt
00050000-5578-466f-70b6-b800badb3aaa	2345	Bistrica ob Dravi
00050000-5578-466f-b3c7-6397f05704e4	3256	Bistrica ob Sotli
00050000-5578-466f-ee5e-1b553df202b9	8259	Bizeljsko
00050000-5578-466f-00e0-7ff3ebd60167	1223	Blagovica
00050000-5578-466f-a600-e55a1187ad48	8283	Blanca
00050000-5578-466f-adaa-47eeeb77d24a	4260	Bled
00050000-5578-466f-db11-88ce7563ba30	4273	Blejska Dobrava
00050000-5578-466f-c1b6-450ebb2f7c7c	9265	Bodonci
00050000-5578-466f-68ea-995fd1a76729	9222	Bogojina
00050000-5578-466f-06cd-8cbe149ba919	4263	Bohinjska Bela
00050000-5578-466f-54f8-74b846c5490a	4264	Bohinjska Bistrica
00050000-5578-466f-49dd-dc60e2c587bf	4265	Bohinjsko jezero
00050000-5578-466f-06b8-7859c15f25f8	1353	Borovnica
00050000-5578-466f-737b-08ee39ec30f7	8294	Boštanj
00050000-5578-466f-b4f3-8199be7d4340	5230	Bovec
00050000-5578-466f-4015-a653839efc8a	5295	Branik
00050000-5578-466f-56c7-f0e2a63af37f	3314	Braslovče
00050000-5578-466f-c797-8ae548bc8990	5223	Breginj
00050000-5578-466f-6fc5-dfe0f5fd8b15	8280	Brestanica
00050000-5578-466f-8f78-b37a00a96bbe	2354	Bresternica
00050000-5578-466f-98c7-15bd9944b76c	4243	Brezje
00050000-5578-466f-0301-6709a8fe0769	1351	Brezovica pri Ljubljani
00050000-5578-466f-71dd-545b584ea29f	8250	Brežice
00050000-5578-466f-2c41-bfafb8b71d21	4210	Brnik - Aerodrom
00050000-5578-466f-83e7-0e9bfd20f11e	8321	Brusnice
00050000-5578-466f-4cf6-785ef5ed93b9	3255	Buče
00050000-5578-466f-fb7e-9a6820bb01f9	8276	Bučka 
00050000-5578-466f-9824-bfc5a6d4b7e3	9261	Cankova
00050000-5578-466f-7907-55f832701ecb	3000	Celje 
00050000-5578-466f-db89-46aa0ee40ca2	3001	Celje - poštni predali
00050000-5578-466f-fe45-8411930983e4	4207	Cerklje na Gorenjskem
00050000-5578-466f-084e-60d9f866d794	8263	Cerklje ob Krki
00050000-5578-466f-70b3-346ed2b6d1a2	1380	Cerknica
00050000-5578-466f-7b9d-6e1d30b070c1	5282	Cerkno
00050000-5578-466f-519c-aabd2a91114e	2236	Cerkvenjak
00050000-5578-466f-8259-c003b3e72df2	2215	Ceršak
00050000-5578-466f-3cb8-1e3bf4fcbe41	2326	Cirkovce
00050000-5578-466f-99f2-507c6c01f553	2282	Cirkulane
00050000-5578-466f-fd00-009636eef3f6	5273	Col
00050000-5578-466f-82f4-ce5a995d5eda	8251	Čatež ob Savi
00050000-5578-466f-ecd8-fa7a9f0d1438	1413	Čemšenik
00050000-5578-466f-b254-9c412e073301	5253	Čepovan
00050000-5578-466f-e836-c4d8ef62ff8d	9232	Črenšovci
00050000-5578-466f-084e-042f3483f4ac	2393	Črna na Koroškem
00050000-5578-466f-66bf-c076f389b9be	6275	Črni Kal
00050000-5578-466f-f7a5-550df8f72f46	5274	Črni Vrh nad Idrijo
00050000-5578-466f-3fe0-e77764371094	5262	Črniče
00050000-5578-466f-8c86-e38e5c83ec1d	8340	Črnomelj
00050000-5578-466f-eaeb-d16f34d3c3d3	6271	Dekani
00050000-5578-466f-b3aa-d2fc133e302f	5210	Deskle
00050000-5578-466f-ec66-3f9e5aa51a07	2253	Destrnik
00050000-5578-466f-3d20-7d74861385d3	6215	Divača
00050000-5578-466f-48fe-af0082143252	1233	Dob
00050000-5578-466f-b837-6a4a6f83e1ec	3224	Dobje pri Planini
00050000-5578-466f-d49c-1baeabf62cf4	8257	Dobova
00050000-5578-466f-c6c8-95c6be5329a8	1423	Dobovec
00050000-5578-466f-c441-0590d288ffe4	5263	Dobravlje
00050000-5578-466f-515b-f9d4fadd4196	3204	Dobrna
00050000-5578-466f-e539-45ad9bc24d4c	8211	Dobrnič
00050000-5578-466f-5eac-2de9a09ab526	1356	Dobrova
00050000-5578-466f-b183-6e39914f8237	9223	Dobrovnik/Dobronak 
00050000-5578-466f-84dc-2b51cba5e82d	5212	Dobrovo v Brdih
00050000-5578-466f-c78e-cf63d4639ab2	1431	Dol pri Hrastniku
00050000-5578-466f-a596-36bc78b32fdb	1262	Dol pri Ljubljani
00050000-5578-466f-dd0c-dcfd463fd6b6	1273	Dole pri Litiji
00050000-5578-466f-d261-42d682511d7e	1331	Dolenja vas
00050000-5578-466f-2e6b-9255a0c38ea5	8350	Dolenjske Toplice
00050000-5578-466f-66b6-88c52e8bc27a	1230	Domžale
00050000-5578-466f-cb77-b50c48e7d6bf	2252	Dornava
00050000-5578-466f-b928-a632913f9731	5294	Dornberk
00050000-5578-466f-0cce-483a5cf9abd3	1319	Draga
00050000-5578-466f-9f9f-fe197c08d3aa	8343	Dragatuš
00050000-5578-466f-4894-8116614a8018	3222	Dramlje
00050000-5578-466f-c2a4-2a599a40b7e8	2370	Dravograd
00050000-5578-466f-6fb5-2ad79ee9abe1	4203	Duplje
00050000-5578-466f-3d2c-d309438790a5	6221	Dutovlje
00050000-5578-466f-6a39-ac85d82bcef3	8361	Dvor
00050000-5578-466f-9a9e-33c0d11aac0d	2343	Fala
00050000-5578-466f-79c6-956ecaab9fab	9208	Fokovci
00050000-5578-466f-cadf-a6176a03b596	2313	Fram
00050000-5578-466f-9c83-78b7c0cf4de5	3213	Frankolovo
00050000-5578-466f-8d31-414b39a75b0a	1274	Gabrovka
00050000-5578-466f-ad15-3d43a76be203	8254	Globoko
00050000-5578-466f-5ef4-305f3a0cf7ac	5275	Godovič
00050000-5578-466f-06f5-25d62fb5a4b9	4204	Golnik
00050000-5578-466f-593f-21bf5e8ede9b	3303	Gomilsko
00050000-5578-466f-3a90-1a83342399e8	4224	Gorenja vas
00050000-5578-466f-5e22-84c4068cf1bf	3263	Gorica pri Slivnici
00050000-5578-466f-cf84-0fa14672892e	2272	Gorišnica
00050000-5578-466f-b5a8-336afd2df1b1	9250	Gornja Radgona
00050000-5578-466f-dddb-eccc94e46e4c	3342	Gornji Grad
00050000-5578-466f-0bdb-20b43ce9ae9f	4282	Gozd Martuljek
00050000-5578-466f-0634-e0dbf6a48336	6272	Gračišče
00050000-5578-466f-df3d-1088e604d270	9264	Grad
00050000-5578-466f-ff45-dd408a6de6b1	8332	Gradac
00050000-5578-466f-1e30-25ca1a9fb420	1384	Grahovo
00050000-5578-466f-0024-a3a3d114d778	5242	Grahovo ob Bači
00050000-5578-466f-8b89-31fd8afa4314	5251	Grgar
00050000-5578-466f-1506-e0d56e1be818	3302	Griže
00050000-5578-466f-0535-a86b50bc8661	3231	Grobelno
00050000-5578-466f-2775-01f36407e53b	1290	Grosuplje
00050000-5578-466f-1a03-b882db7250e7	2288	Hajdina
00050000-5578-466f-8a3c-1f5583db3455	8362	Hinje
00050000-5578-466f-f9da-06290cb38d4e	2311	Hoče
00050000-5578-466f-6525-60dbba93bd18	9205	Hodoš/Hodos
00050000-5578-466f-6ec9-6183cdf8d463	1354	Horjul
00050000-5578-466f-6e06-82489c65dc31	1372	Hotedršica
00050000-5578-466f-148b-fe6cca435899	1430	Hrastnik
00050000-5578-466f-30a2-fb72b9f7ee22	6225	Hruševje
00050000-5578-466f-e92d-e08e28cdbf00	4276	Hrušica
00050000-5578-466f-9261-cf81656c2704	5280	Idrija
00050000-5578-466f-1bac-c005ceb3ed30	1292	Ig
00050000-5578-466f-c71d-41df19e0cf96	6250	Ilirska Bistrica
00050000-5578-466f-f116-7564b48e0b72	6251	Ilirska Bistrica-Trnovo
00050000-5578-466f-18c7-0440ac9097a5	1295	Ivančna Gorica
00050000-5578-466f-ef46-aa6dd5f83f63	2259	Ivanjkovci
00050000-5578-466f-dfb0-2d3ade3596dd	1411	Izlake
00050000-5578-466f-8b3b-6e41c1c1b324	6310	Izola/Isola
00050000-5578-466f-d7ae-fa04fe6d5703	2222	Jakobski Dol
00050000-5578-466f-d7c3-ec8fccc0c76a	2221	Jarenina
00050000-5578-466f-e2bf-774526837d78	6254	Jelšane
00050000-5578-466f-6563-0ccb1462a2ee	4270	Jesenice
00050000-5578-466f-413a-020cb644b51a	8261	Jesenice na Dolenjskem
00050000-5578-466f-f9c3-ab40620266a6	3273	Jurklošter
00050000-5578-466f-19d1-2089f0c3ad43	2223	Jurovski Dol
00050000-5578-466f-e38e-9ad87b4d28d6	2256	Juršinci
00050000-5578-466f-6bc8-02013d670109	5214	Kal nad Kanalom
00050000-5578-466f-80cf-d66b9b0e43b0	3233	Kalobje
00050000-5578-466f-d412-e3b7f40fdb58	4246	Kamna Gorica
00050000-5578-466f-4078-d07460f3ff66	2351	Kamnica
00050000-5578-466f-bffa-7bc60bcc4952	1241	Kamnik
00050000-5578-466f-48e0-1342af68bcea	5213	Kanal
00050000-5578-466f-5d3f-b92eeed0894e	8258	Kapele
00050000-5578-466f-95b7-1bea154d464e	2362	Kapla
00050000-5578-466f-07fc-4a969ab1c8a4	2325	Kidričevo
00050000-5578-466f-1172-cb95c7d4ff96	1412	Kisovec
00050000-5578-466f-bc51-975ee3c7f933	6253	Knežak
00050000-5578-466f-7374-3b78e662a10d	5222	Kobarid
00050000-5578-466f-83c0-ac25c8ce9a79	9227	Kobilje
00050000-5578-466f-6694-6fcb41797635	1330	Kočevje
00050000-5578-466f-4805-407d9af69468	1338	Kočevska Reka
00050000-5578-466f-b68d-881bf64a480b	2276	Kog
00050000-5578-466f-86ae-d6e4b66ff5fa	5211	Kojsko
00050000-5578-466f-0fbe-2005fe136c19	6223	Komen
00050000-5578-466f-5933-50f6b6bbea3b	1218	Komenda
00050000-5578-466f-e30b-f29e221dabdb	6000	Koper/Capodistria 
00050000-5578-466f-95dd-22f74a5153dc	6001	Koper/Capodistria - poštni predali
00050000-5578-466f-f771-11aa852c609b	8282	Koprivnica
00050000-5578-466f-c1ce-5cf12503288d	5296	Kostanjevica na Krasu
00050000-5578-466f-93f8-0b975590b3b7	8311	Kostanjevica na Krki
00050000-5578-466f-7b0e-6906a4c8c63b	1336	Kostel
00050000-5578-466f-243b-cd53713dfee1	6256	Košana
00050000-5578-466f-b702-63f7e9c15ff3	2394	Kotlje
00050000-5578-466f-1a5e-6b974bfb0f6b	6240	Kozina
00050000-5578-466f-d88c-5017533b0e41	3260	Kozje
00050000-5578-466f-acf7-20c2dd3ab321	4000	Kranj 
00050000-5578-466f-711d-efc20aef95c8	4001	Kranj - poštni predali
00050000-5578-466f-d2ce-09a02c8a44f7	4280	Kranjska Gora
00050000-5578-466f-1505-5cbd0f5a2f5c	1281	Kresnice
00050000-5578-466f-fc7b-fcb92a33c336	4294	Križe
00050000-5578-466f-682e-58604930a542	9206	Križevci
00050000-5578-466f-e895-bfdc89de410f	9242	Križevci pri Ljutomeru
00050000-5578-466f-ada9-7d358d79e3a9	1301	Krka
00050000-5578-466f-f3c0-9c2dcb05b99a	8296	Krmelj
00050000-5578-466f-18e8-e554d02b79c3	4245	Kropa
00050000-5578-466f-b335-04dffbda0c6f	8262	Krška vas
00050000-5578-466f-9978-2df8a1ecb754	8270	Krško
00050000-5578-466f-4cae-42223b77684e	9263	Kuzma
00050000-5578-466f-2ef2-d8c777c19f53	2318	Laporje
00050000-5578-466f-2f1f-b19f4a02ae41	3270	Laško
00050000-5578-466f-726b-91f821680370	1219	Laze v Tuhinju
00050000-5578-466f-0a24-0652a282423a	2230	Lenart v Slovenskih goricah
00050000-5578-466f-a229-200fac9cdf38	9220	Lendava/Lendva
00050000-5578-466f-a486-33cd0cd6c065	4248	Lesce
00050000-5578-466f-4f64-652a66aa499e	3261	Lesično
00050000-5578-466f-bd66-eca291c1ff89	8273	Leskovec pri Krškem
00050000-5578-466f-aff8-2c10cd57fc9b	2372	Libeliče
00050000-5578-466f-9b15-421445eaa397	2341	Limbuš
00050000-5578-466f-b6fe-3647dfd557ef	1270	Litija
00050000-5578-466f-1204-9e665900bf5a	3202	Ljubečna
00050000-5578-466f-2157-add16f4b986c	1000	Ljubljana 
00050000-5578-466f-7759-4ed89b4e4d1b	1001	Ljubljana - poštni predali
00050000-5578-466f-0961-ecb90288152d	1231	Ljubljana - Črnuče
00050000-5578-466f-c66f-c4a3fea699da	1261	Ljubljana - Dobrunje
00050000-5578-466f-b0e0-5680f3e2fd54	1260	Ljubljana - Polje
00050000-5578-466f-45ae-b9306d8c3290	1210	Ljubljana - Šentvid
00050000-5578-466f-4547-4caf75853c80	1211	Ljubljana - Šmartno
00050000-5578-466f-c633-001459f3b744	3333	Ljubno ob Savinji
00050000-5578-466f-b126-6936052955d8	9240	Ljutomer
00050000-5578-466f-efd9-e636e22af380	3215	Loče
00050000-5578-466f-c52d-5a2e36ae4c6a	5231	Log pod Mangartom
00050000-5578-466f-8c4e-d370c5d8c1a0	1358	Log pri Brezovici
00050000-5578-466f-b1d8-b48f934a3338	1370	Logatec
00050000-5578-466f-8109-fc384d8fb5ba	1371	Logatec
00050000-5578-466f-8d67-a45e98be1d74	1434	Loka pri Zidanem Mostu
00050000-5578-466f-94f3-36a45faa0045	3223	Loka pri Žusmu
00050000-5578-466f-df44-e4b113030c0a	6219	Lokev
00050000-5578-466f-d54d-17aa78329d44	1318	Loški Potok
00050000-5578-466f-b1ba-23406c966228	2324	Lovrenc na Dravskem polju
00050000-5578-466f-c967-23099c560c45	2344	Lovrenc na Pohorju
00050000-5578-466f-bc97-a50fb955428f	3334	Luče
00050000-5578-466f-09fa-15867cf6458e	1225	Lukovica
00050000-5578-466f-42f5-c0c8eb281124	9202	Mačkovci
00050000-5578-466f-6f5d-9e3e872cef0a	2322	Majšperk
00050000-5578-466f-bb43-cc197b159c4a	2321	Makole
00050000-5578-466f-d2f1-666c569ba57f	9243	Mala Nedelja
00050000-5578-466f-0d37-01e8b659e1e5	2229	Malečnik
00050000-5578-466f-43b4-fceb80864df9	6273	Marezige
00050000-5578-466f-f051-61e64bef1358	2000	Maribor 
00050000-5578-466f-2f25-155e0e7347c1	2001	Maribor - poštni predali
00050000-5578-466f-b7d0-49fa43c2b452	2206	Marjeta na Dravskem polju
00050000-5578-466f-d4e3-a8961fe410e4	2281	Markovci
00050000-5578-466f-c4cc-eb010c5eadca	9221	Martjanci
00050000-5578-466f-b86b-1c9a6d2a9314	6242	Materija
00050000-5578-466f-9005-3bff11e4f9ce	4211	Mavčiče
00050000-5578-466f-7c14-be3fad80440f	1215	Medvode
00050000-5578-466f-6427-64d78bb3502b	1234	Mengeš
00050000-5578-466f-2b2b-04e9b0adde5c	8330	Metlika
00050000-5578-466f-c4d2-b4ac34161528	2392	Mežica
00050000-5578-466f-2c95-2caf38cfd23f	2204	Miklavž na Dravskem polju
00050000-5578-466f-e92d-4fdf50c8776d	2275	Miklavž pri Ormožu
00050000-5578-466f-ba37-06f4770a51a8	5291	Miren
00050000-5578-466f-a73e-ddf815661eb0	8233	Mirna
00050000-5578-466f-956d-f8b9fa2c9761	8216	Mirna Peč
00050000-5578-466f-1d1a-dbe4875c4ab3	2382	Mislinja
00050000-5578-466f-5ab1-c9ad71afae0e	4281	Mojstrana
00050000-5578-466f-b3e9-ec04233b4ab3	8230	Mokronog
00050000-5578-466f-e796-886907079019	1251	Moravče
00050000-5578-466f-9279-fa3b70156dcc	9226	Moravske Toplice
00050000-5578-466f-d237-4b787c40a545	5216	Most na Soči
00050000-5578-466f-01fc-e2d43b8f2294	1221	Motnik
00050000-5578-466f-ed1d-f17090e62a66	3330	Mozirje
00050000-5578-466f-e66a-c0a45e2ab3e3	9000	Murska Sobota 
00050000-5578-466f-9a57-df662d0542e9	9001	Murska Sobota - poštni predali
00050000-5578-466f-1eef-3aeae70b6927	2366	Muta
00050000-5578-466f-7415-2d9e14d6afc8	4202	Naklo
00050000-5578-466f-ac9d-c5f6497ad376	3331	Nazarje
00050000-5578-466f-318a-590acf588118	1357	Notranje Gorice
00050000-5578-466f-c5de-6e3ac623581a	3203	Nova Cerkev
00050000-5578-466f-55a7-75153a73ca50	5000	Nova Gorica 
00050000-5578-466f-d20a-02803c3b88a8	5001	Nova Gorica - poštni predali
00050000-5578-466f-a805-cd9db4b33bf6	1385	Nova vas
00050000-5578-466f-264f-8a9e878c68cb	8000	Novo mesto
00050000-5578-466f-4a4c-b937cde9e444	8001	Novo mesto - poštni predali
00050000-5578-466f-d002-be6c92074073	6243	Obrov
00050000-5578-466f-6002-7f4508e3acf5	9233	Odranci
00050000-5578-466f-3c83-4963f87c71e9	2317	Oplotnica
00050000-5578-466f-4f3e-6cbbdd19c853	2312	Orehova vas
00050000-5578-466f-de59-5b0a828f2f84	2270	Ormož
00050000-5578-466f-f177-cec94bae172a	1316	Ortnek
00050000-5578-466f-ec72-69d41cbecdc3	1337	Osilnica
00050000-5578-466f-d500-65ec8c5e7e83	8222	Otočec
00050000-5578-466f-d289-1eed1d844e85	2361	Ožbalt
00050000-5578-466f-6d9c-de171f672ede	2231	Pernica
00050000-5578-466f-b26b-18da28577197	2211	Pesnica pri Mariboru
00050000-5578-466f-878c-083497a984e4	9203	Petrovci
00050000-5578-466f-37ed-e9bc255c93ce	3301	Petrovče
00050000-5578-466f-6de6-5228d5aade27	6330	Piran/Pirano
00050000-5578-466f-5662-b95c9d4e59ae	8255	Pišece
00050000-5578-466f-3a6e-6e12ac6168ca	6257	Pivka
00050000-5578-466f-5e8c-3643e0ce1bbd	6232	Planina
00050000-5578-466f-dd46-704637f77c37	3225	Planina pri Sevnici
00050000-5578-466f-239b-6907b3d50651	6276	Pobegi
00050000-5578-466f-8d23-4ebce4f23ca7	8312	Podbočje
00050000-5578-466f-336f-13de8777dd90	5243	Podbrdo
00050000-5578-466f-1a95-ae12186a6f63	3254	Podčetrtek
00050000-5578-466f-0fb0-13cc85297b5d	2273	Podgorci
00050000-5578-466f-3726-f00e99170172	6216	Podgorje
00050000-5578-466f-1f25-4e3a8cf27aa5	2381	Podgorje pri Slovenj Gradcu
00050000-5578-466f-877c-d2c9c793a71b	6244	Podgrad
00050000-5578-466f-c3a5-1bc861c05a1c	1414	Podkum
00050000-5578-466f-983a-e4ff314084ea	2286	Podlehnik
00050000-5578-466f-617b-0c9440d964f1	5272	Podnanos
00050000-5578-466f-e0f7-af00710599f6	4244	Podnart
00050000-5578-466f-fd08-81c2858d1f65	3241	Podplat
00050000-5578-466f-c52e-d6e69a7cab62	3257	Podsreda
00050000-5578-466f-52ca-e9e48e69d036	2363	Podvelka
00050000-5578-466f-0e10-98e932ef8be9	2208	Pohorje
00050000-5578-466f-991f-d992870c593a	2257	Polenšak
00050000-5578-466f-4f70-97e4d3cf4fe8	1355	Polhov Gradec
00050000-5578-466f-6c73-55863be719c2	4223	Poljane nad Škofjo Loko
00050000-5578-466f-cd60-a6503adc2ce8	2319	Poljčane
00050000-5578-466f-e4f1-b54c018c86e4	1272	Polšnik
00050000-5578-466f-0ef1-a4cc0e6c386b	3313	Polzela
00050000-5578-466f-c5c7-a2e8b251644b	3232	Ponikva
00050000-5578-466f-9ced-24dcd6929f1d	6320	Portorož/Portorose
00050000-5578-466f-fc09-47c260be1ad8	6230	Postojna
00050000-5578-466f-011b-8ebd7353369c	2331	Pragersko
00050000-5578-466f-11dc-d7d84f9a9a27	3312	Prebold
00050000-5578-466f-adc4-5e1f24c8d833	4205	Preddvor
00050000-5578-466f-0f81-6ed11751c941	6255	Prem
00050000-5578-466f-63c4-c47658669ab2	1352	Preserje
00050000-5578-466f-c408-5d9dc323bf23	6258	Prestranek
00050000-5578-466f-26fb-64ae96f48d97	2391	Prevalje
00050000-5578-466f-6e4f-f962dd05daf4	3262	Prevorje
00050000-5578-466f-7721-ccd50c1744c5	1276	Primskovo 
00050000-5578-466f-25ef-a9cf4dea4e7d	3253	Pristava pri Mestinju
00050000-5578-466f-75c9-74e8f8daecb1	9207	Prosenjakovci/Partosfalva
00050000-5578-466f-71f9-3c77698e7236	5297	Prvačina
00050000-5578-466f-6d38-61e1b14faa11	2250	Ptuj
00050000-5578-466f-4f67-28441aaa3b39	2323	Ptujska Gora
00050000-5578-466f-1286-0043bfacd6b8	9201	Puconci
00050000-5578-466f-e7ba-3fe9149d3d0c	2327	Rače
00050000-5578-466f-6576-c10d23bf9277	1433	Radeče
00050000-5578-466f-8b8f-d0908b45a192	9252	Radenci
00050000-5578-466f-bdf4-b1caafe2aeeb	2360	Radlje ob Dravi
00050000-5578-466f-29b6-b15bfafb3fa9	1235	Radomlje
00050000-5578-466f-e1bd-82ec39c2867c	4240	Radovljica
00050000-5578-466f-e36f-6a0c8784cdef	8274	Raka
00050000-5578-466f-7a90-073d444408c0	1381	Rakek
00050000-5578-466f-f1c7-b160e586fcb2	4283	Rateče - Planica
00050000-5578-466f-2987-ad1a0a91e459	2390	Ravne na Koroškem
00050000-5578-466f-60b5-1c8d5ed25230	9246	Razkrižje
00050000-5578-466f-31b4-9f288339aa98	3332	Rečica ob Savinji
00050000-5578-466f-f57d-f04cdd7fadca	5292	Renče
00050000-5578-466f-2613-5460185205d3	1310	Ribnica
00050000-5578-466f-753a-186c0278d162	2364	Ribnica na Pohorju
00050000-5578-466f-5234-390c0e25bd3f	3272	Rimske Toplice
00050000-5578-466f-cb22-8add9de99ab2	1314	Rob
00050000-5578-466f-7b79-fe5576db7db7	5215	Ročinj
00050000-5578-466f-e9c9-7d2a1b66a110	3250	Rogaška Slatina
00050000-5578-466f-38bb-0804a8ed4ecc	9262	Rogašovci
00050000-5578-466f-b196-57b80fa9e1bc	3252	Rogatec
00050000-5578-466f-2371-fbdd0dc94d05	1373	Rovte
00050000-5578-466f-eb1f-c26a18adf50b	2342	Ruše
00050000-5578-466f-93ee-11f65417490b	1282	Sava
00050000-5578-466f-794c-351cc5b20c21	6333	Sečovlje/Sicciole
00050000-5578-466f-9ee4-5af9c89e0c6d	4227	Selca
00050000-5578-466f-4011-0fd5036ecdba	2352	Selnica ob Dravi
00050000-5578-466f-aaa3-be37e8cd00f3	8333	Semič
00050000-5578-466f-2d25-f54b49e0c7bb	8281	Senovo
00050000-5578-466f-ec76-e90d50fc9bb8	6224	Senožeče
00050000-5578-466f-e67a-e0340b7c58d5	8290	Sevnica
00050000-5578-466f-300f-5ee0db5b80ae	6210	Sežana
00050000-5578-466f-9c14-c41466d9c4a3	2214	Sladki Vrh
00050000-5578-466f-a530-50ec233cbeb3	5283	Slap ob Idrijci
00050000-5578-466f-78c0-4c04eb3d0b89	2380	Slovenj Gradec
00050000-5578-466f-4426-a143579be433	2310	Slovenska Bistrica
00050000-5578-466f-2f58-86cfd5c2b363	3210	Slovenske Konjice
00050000-5578-466f-d1b3-022b38642ea8	1216	Smlednik
00050000-5578-466f-3c36-468ef75c201d	5232	Soča
00050000-5578-466f-b975-9615cfda13c7	1317	Sodražica
00050000-5578-466f-0ec6-abec5135d9a0	3335	Solčava
00050000-5578-466f-aaf3-18d19e77fbfd	5250	Solkan
00050000-5578-466f-229a-12b0bf275a33	4229	Sorica
00050000-5578-466f-15d0-ebfdc64acc66	4225	Sovodenj
00050000-5578-466f-b0e7-9a92cc7c3b68	5281	Spodnja Idrija
00050000-5578-466f-030b-e889d4c703be	2241	Spodnji Duplek
00050000-5578-466f-b3f9-99b654b2f760	9245	Spodnji Ivanjci
00050000-5578-466f-5a96-97247a616ca2	2277	Središče ob Dravi
00050000-5578-466f-76d9-1bd466ac3491	4267	Srednja vas v Bohinju
00050000-5578-466f-3c1c-6fc1472cb478	8256	Sromlje 
00050000-5578-466f-3262-bdb2c4f11825	5224	Srpenica
00050000-5578-466f-c653-7c0f6acd7c76	1242	Stahovica
00050000-5578-466f-31da-dbbf82b511e4	1332	Stara Cerkev
00050000-5578-466f-10a1-8cc7343fb026	8342	Stari trg ob Kolpi
00050000-5578-466f-f1f8-eeb9c2a0acf1	1386	Stari trg pri Ložu
00050000-5578-466f-06ac-c258461771c7	2205	Starše
00050000-5578-466f-747f-129605ebfe14	2289	Stoperce
00050000-5578-466f-c09f-e0fe59f0c054	8322	Stopiče
00050000-5578-466f-faa6-8e92d948d93f	3206	Stranice
00050000-5578-466f-0b17-a65b021a81ed	8351	Straža
00050000-5578-466f-e0ae-b8a48affa586	1313	Struge
00050000-5578-466f-0c48-c7a06bd00434	8293	Studenec
00050000-5578-466f-aa76-7c7db9859255	8331	Suhor
00050000-5578-466f-4acc-8746f74c56df	2233	Sv. Ana v Slovenskih goricah
00050000-5578-466f-f9bb-6979deb174ef	2235	Sv. Trojica v Slovenskih goricah
00050000-5578-466f-f128-f867810ed48a	2353	Sveti Duh na Ostrem Vrhu
00050000-5578-466f-c72f-dd3909157e2c	9244	Sveti Jurij ob Ščavnici
00050000-5578-466f-5bce-820123394a94	3264	Sveti Štefan
00050000-5578-466f-bc69-076f5f00e80a	2258	Sveti Tomaž
00050000-5578-466f-1b6e-c4e18b0e6251	9204	Šalovci
00050000-5578-466f-3fa6-245807bfc496	5261	Šempas
00050000-5578-466f-c052-ba96ac2322a4	5290	Šempeter pri Gorici
00050000-5578-466f-1363-3768a4ca12f5	3311	Šempeter v Savinjski dolini
00050000-5578-466f-0061-7173f888131f	4208	Šenčur
00050000-5578-466f-53dd-cfed88c4d8f3	2212	Šentilj v Slovenskih goricah
00050000-5578-466f-2d8b-7635eea96119	8297	Šentjanž
00050000-5578-466f-114f-5246df8af977	2373	Šentjanž pri Dravogradu
00050000-5578-466f-0bb5-6a4506a34710	8310	Šentjernej
00050000-5578-466f-87e9-4d509807a29a	3230	Šentjur
00050000-5578-466f-c741-bb2f1b40d00e	3271	Šentrupert
00050000-5578-466f-d162-1062cd8ddde3	8232	Šentrupert
00050000-5578-466f-8144-2511e46097df	1296	Šentvid pri Stični
00050000-5578-466f-b4f1-9a758f7631e4	8275	Škocjan
00050000-5578-466f-3af3-d03b64491e61	6281	Škofije
00050000-5578-466f-3a68-b8188c9f1513	4220	Škofja Loka
00050000-5578-466f-a97a-27e02a118ac3	3211	Škofja vas
00050000-5578-466f-e1ca-70b47e59d378	1291	Škofljica
00050000-5578-466f-9142-2850951697f0	6274	Šmarje
00050000-5578-466f-d9ee-f5f7a7ea79da	1293	Šmarje - Sap
00050000-5578-466f-6696-385483a82558	3240	Šmarje pri Jelšah
00050000-5578-466f-87a8-84e0c66168fb	8220	Šmarješke Toplice
00050000-5578-466f-9de5-3f8ddfe123ff	2315	Šmartno na Pohorju
00050000-5578-466f-ecbe-a955f036f6c7	3341	Šmartno ob Dreti
00050000-5578-466f-1033-0f1ae232ee69	3327	Šmartno ob Paki
00050000-5578-466f-557e-6e85a1060470	1275	Šmartno pri Litiji
00050000-5578-466f-eb07-8111edc49328	2383	Šmartno pri Slovenj Gradcu
00050000-5578-466f-a5c6-70084e6fe929	3201	Šmartno v Rožni dolini
00050000-5578-466f-7caf-e61bd82eb910	3325	Šoštanj
00050000-5578-466f-f2fa-9766c485ea69	6222	Štanjel
00050000-5578-466f-96a9-08bc8ea2ac99	3220	Štore
00050000-5578-466f-ce5b-b1869b2fe23d	3304	Tabor
00050000-5578-466f-fb84-dee3adc61131	3221	Teharje
00050000-5578-466f-9856-da43f68c775d	9251	Tišina
00050000-5578-466f-9b9a-65260d0774e5	5220	Tolmin
00050000-5578-466f-1661-2dbd02f52de1	3326	Topolšica
00050000-5578-466f-1bc5-d494ace662cc	2371	Trbonje
00050000-5578-466f-9631-9ed17e364cca	1420	Trbovlje
00050000-5578-466f-8e31-39fd24c36d90	8231	Trebelno 
00050000-5578-466f-c746-8f280ff20ae8	8210	Trebnje
00050000-5578-466f-b9f0-ed765adf55a9	5252	Trnovo pri Gorici
00050000-5578-466f-a4a1-2c9d5568890e	2254	Trnovska vas
00050000-5578-466f-0e56-216c9d231e2b	1222	Trojane
00050000-5578-466f-29ef-d8020f89534c	1236	Trzin
00050000-5578-466f-caae-239033a30859	4290	Tržič
00050000-5578-466f-a76f-8e5256e4bea7	8295	Tržišče
00050000-5578-466f-8130-2a86cf9928c1	1311	Turjak
00050000-5578-466f-f5d5-d8038e7bab2c	9224	Turnišče
00050000-5578-466f-721c-c29ecdece8b8	8323	Uršna sela
00050000-5578-466f-fcaf-29101e108909	1252	Vače
00050000-5578-466f-332a-17a63eda48e9	3320	Velenje 
00050000-5578-466f-b82c-8e3dee3a5c8d	3322	Velenje - poštni predali
00050000-5578-466f-e643-785a0dde5266	8212	Velika Loka
00050000-5578-466f-d064-c871b912f111	2274	Velika Nedelja
00050000-5578-466f-75fa-6ee114b030d0	9225	Velika Polana
00050000-5578-466f-8dc0-36551c160b74	1315	Velike Lašče
00050000-5578-466f-2d0b-92f9259e1b02	8213	Veliki Gaber
00050000-5578-466f-c9d5-0e488c608b6b	9241	Veržej
00050000-5578-466f-c8d6-9cbae41e86a1	1312	Videm - Dobrepolje
00050000-5578-466f-cb9d-fa70de0d6f13	2284	Videm pri Ptuju
00050000-5578-466f-4b83-9a58fbdbf6fd	8344	Vinica
00050000-5578-466f-18b6-a5d6465a6f91	5271	Vipava
00050000-5578-466f-d117-5e04eb816475	4212	Visoko
00050000-5578-466f-d24e-a8deb5761e57	1294	Višnja Gora
00050000-5578-466f-e6c9-b2839c887e39	3205	Vitanje
00050000-5578-466f-0931-09f82cbabbf7	2255	Vitomarci
00050000-5578-466f-fb34-064f92b613e2	1217	Vodice
00050000-5578-466f-a995-a440c70a3493	3212	Vojnik\t
00050000-5578-466f-b210-180d492a68f6	5293	Volčja Draga
00050000-5578-466f-48d9-77f0796687e5	2232	Voličina
00050000-5578-466f-0869-0a31487bb7f0	3305	Vransko
00050000-5578-466f-3838-8d9a6d24a587	6217	Vremski Britof
00050000-5578-466f-aeba-1b94bf2ed1bd	1360	Vrhnika
00050000-5578-466f-99f8-f15b0cd742d1	2365	Vuhred
00050000-5578-466f-89cf-9fd1cf8dc1f9	2367	Vuzenica
00050000-5578-466f-f064-d4c2a9da939d	8292	Zabukovje 
00050000-5578-466f-79f6-090458c5bb6b	1410	Zagorje ob Savi
00050000-5578-466f-9c76-1c0e20c142d4	1303	Zagradec
00050000-5578-466f-012d-6d452dc46ad5	2283	Zavrč
00050000-5578-466f-360d-557b15b519e6	8272	Zdole 
00050000-5578-466f-4555-0e7c43ca3952	4201	Zgornja Besnica
00050000-5578-466f-3064-8b7f787c3d7e	2242	Zgornja Korena
00050000-5578-466f-5608-e39ebb92d6a5	2201	Zgornja Kungota
00050000-5578-466f-04e0-e8d6614a1707	2316	Zgornja Ložnica
00050000-5578-466f-b135-f659796199c7	2314	Zgornja Polskava
00050000-5578-466f-4ad7-af98a152c5f3	2213	Zgornja Velka
00050000-5578-466f-eec3-7d4968629ffa	4247	Zgornje Gorje
00050000-5578-466f-af01-03c4c5456d72	4206	Zgornje Jezersko
00050000-5578-466f-16e4-404e3d7a0a1b	2285	Zgornji Leskovec
00050000-5578-466f-ef4d-bff4dc118fec	1432	Zidani Most
00050000-5578-466f-626b-506b950ed03a	3214	Zreče
00050000-5578-466f-5b70-9b110cef3cb5	4209	Žabnica
00050000-5578-466f-a72d-1d72948e696a	3310	Žalec
00050000-5578-466f-0477-0c83a00f0c5b	4228	Železniki
00050000-5578-466f-9602-1e4caa580f15	2287	Žetale
00050000-5578-466f-325a-9f85458cc34c	4226	Žiri
00050000-5578-466f-11f9-cd2d71e6de0a	4274	Žirovnica
00050000-5578-466f-12b1-7c1d4eda8eae	8360	Žužemberk
\.


--
-- TOC entry 2838 (class 0 OID 6870095)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6869906)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6869984)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6870107)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6870227)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 6870280)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5578-4670-5b29-71fcc2e5aa29	00080000-5578-4670-c6cf-2e3d7689eec1	0987	A
00190000-5578-4670-54f4-f27ee816b464	00080000-5578-4670-8d2c-f8389aa64b77	0989	A
\.


--
-- TOC entry 2864 (class 0 OID 6870395)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6870446)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 6870408)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6870416)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6870136)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5578-4670-5351-b5a3c60a81d3	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5578-4670-2d8c-b2e8d54135f4	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5578-4670-2173-581eefcc6a68	0003	Kazinska	t	84	Kazinska dvorana
00220000-5578-4670-5449-f6e4f43f76af	0004	Mali oder	t	24	Mali oder 
00220000-5578-4670-bc1e-a09fe7107a7f	0005	Komorni oder	t	15	Komorni oder
00220000-5578-4670-beaa-cc43639b6a4b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5578-4670-c8d6-4f45b75c40cd	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2836 (class 0 OID 6870080)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6870070)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6870269)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6870204)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6869778)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5578-4670-5759-66d0d7eb8899	00010000-5578-4670-f239-6fe3ec3dba13	2015-06-10 16:15:13	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROqguSUwHpULgDOCf0Ta49ThwNU.JB.P6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2845 (class 0 OID 6870146)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6869816)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5578-4670-0070-9b387000aa22	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5578-4670-c59a-07c472d5533f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5578-4670-652f-64ea9a32135c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5578-4670-e529-11a03be6db4c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5578-4670-ebf6-8c8760b1741e	planer	Planer dogodkov v koledarju	t
00020000-5578-4670-b84c-a90c4821eec8	kadrovska	Kadrovska služba	t
00020000-5578-4670-c322-6c8ab08da683	arhivar	Ažuriranje arhivalij	t
00020000-5578-4670-a88e-7426d6f328c5	igralec	Igralec	t
00020000-5578-4670-1a1d-8927bf0f7863	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2811 (class 0 OID 6869800)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5578-4670-5759-66d0d7eb8899	00020000-5578-4670-652f-64ea9a32135c
00010000-5578-4670-f239-6fe3ec3dba13	00020000-5578-4670-652f-64ea9a32135c
\.


--
-- TOC entry 2847 (class 0 OID 6870160)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6870101)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6870051)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 6870479)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5578-466f-c6d5-5c8faf38408f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5578-466f-d574-f82ace3fe08e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5578-466f-122f-780f49cbf6b6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5578-466f-1289-5db4dc94b5b2	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5578-466f-37c1-59df8de2b7a7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2870 (class 0 OID 6870471)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5578-466f-121a-735339903f80	00230000-5578-466f-1289-5db4dc94b5b2	popa
00240000-5578-466f-a338-91cc784c86c7	00230000-5578-466f-1289-5db4dc94b5b2	oseba
00240000-5578-466f-d7e7-4d0f0f52585f	00230000-5578-466f-d574-f82ace3fe08e	prostor
00240000-5578-466f-91fe-7c73b82b6347	00230000-5578-466f-1289-5db4dc94b5b2	besedilo
00240000-5578-466f-4ea1-52c7a9c47c22	00230000-5578-466f-1289-5db4dc94b5b2	uprizoritev
00240000-5578-466f-299b-feefcce15dc1	00230000-5578-466f-1289-5db4dc94b5b2	funkcija
00240000-5578-466f-adb8-eef08824a346	00230000-5578-466f-1289-5db4dc94b5b2	tipfunkcije
00240000-5578-466f-015f-fe6bcfe77f16	00230000-5578-466f-1289-5db4dc94b5b2	alternacija
00240000-5578-466f-6497-9550fe803f75	00230000-5578-466f-c6d5-5c8faf38408f	pogodba
00240000-5578-466f-a286-a7f257314386	00230000-5578-466f-1289-5db4dc94b5b2	zaposlitev
\.


--
-- TOC entry 2869 (class 0 OID 6870466)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6870214)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6869878)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6870057)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5578-4671-d253-78dbde041053	00180000-5578-4670-6847-abae269ecb68	000c0000-5578-4670-cf46-491e55281a84	00090000-5578-4670-7681-36769f98fde3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-4671-ce03-0ee79eb4cbfa	00180000-5578-4670-6847-abae269ecb68	000c0000-5578-4670-8fed-fa667273f473	00090000-5578-4670-a144-8597509a7a03	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-4671-3ea5-65485b2d0e53	00180000-5578-4670-6847-abae269ecb68	000c0000-5578-4670-578c-01a6a8548db0	00090000-5578-4670-5c30-2b8d6716154a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-4671-88e2-d6c06b5ad474	00180000-5578-4670-6847-abae269ecb68	000c0000-5578-4670-e42f-4b4909862f3a	00090000-5578-4670-00a7-2a7be6617c1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-4671-0551-f1dc11661dc5	00180000-5578-4670-6847-abae269ecb68	000c0000-5578-4671-459d-a00d66599ca4	00090000-5578-4670-8f74-a12a8237c80c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5578-4671-f374-3bb3a7ac803e	00180000-5578-4670-1693-b8367d406406	\N	00090000-5578-4670-8f74-a12a8237c80c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2855 (class 0 OID 6870258)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5578-466f-2a31-8c4a3ffb26b6	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5578-466f-b057-a293680d65dc	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5578-466f-2f35-69f589df6f0a	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5578-466f-5c8f-989586e7ed1d	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5578-466f-3bc6-2abaf69d5311	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5578-466f-c05a-3e7bc75bbeae	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5578-466f-6187-6706235e0051	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5578-466f-c0ed-431cd9f515f7	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5578-466f-7dc6-505383450962	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5578-466f-978f-dd5dc1323df4	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5578-466f-4bde-49dfc9329086	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5578-466f-5f07-ef97c1bc766b	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5578-466f-e338-184f61094c4d	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5578-466f-cf56-5ef207873198	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5578-466f-9203-1593e05a7e4b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5578-466f-f452-8fdf672aad2c	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2867 (class 0 OID 6870435)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5578-466f-4ab7-0f02b57effbe	01	Velika predstava	f	1.00	1.00
002b0000-5578-466f-933c-de80ec457c9e	02	Mala predstava	f	0.50	0.50
002b0000-5578-466f-8ff6-1523cc942bef	03	Mala koprodukcija	t	0.40	1.00
002b0000-5578-466f-e0c6-35faca3872d0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5578-466f-0115-95da9dec856c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2823 (class 0 OID 6869941)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6869787)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5578-4670-f239-6fe3ec3dba13	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROd9wx4aqmNa1rodog8Y/rghVepgBx0iO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5578-4670-206c-cdcd76b2b4b2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5578-4670-bda0-a488a5f1d8ea	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5578-4670-f8da-ad3ad153887a	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5578-4670-4181-64c5638ca71f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5578-4670-f666-194a0f6a7646	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5578-4670-c37a-114715fa34bd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5578-4670-5759-66d0d7eb8899	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2860 (class 0 OID 6870315)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5578-4670-d231-aaee6de2f885	00160000-5578-4670-dfae-d3a89f02d73b	00150000-5578-466f-eb7e-fb0087ea82cb	00140000-5578-466f-5ec9-43e5cfd34eab	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5578-4670-bc1e-a09fe7107a7f
000e0000-5578-4670-9973-16a7a31fe1ec	00160000-5578-4670-10b8-fadb04effb69	00150000-5578-466f-0885-0cd10c633100	00140000-5578-466f-f78e-791ca500edc0	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5578-4670-beaa-cc43639b6a4b
000e0000-5578-4670-5012-d89ad701439a	\N	00150000-5578-466f-0885-0cd10c633100	00140000-5578-466f-f78e-791ca500edc0	00190000-5578-4670-5b29-71fcc2e5aa29	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5578-4670-bc1e-a09fe7107a7f
000e0000-5578-4670-a9b1-7af07205334a	\N	00150000-5578-466f-0885-0cd10c633100	00140000-5578-466f-f78e-791ca500edc0	00190000-5578-4670-5b29-71fcc2e5aa29	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5578-4670-bc1e-a09fe7107a7f
\.


--
-- TOC entry 2828 (class 0 OID 6870003)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5578-4670-ea30-50409db87c0d	000e0000-5578-4670-9973-16a7a31fe1ec	1	
00200000-5578-4670-4ac7-54adc8d08a0b	000e0000-5578-4670-9973-16a7a31fe1ec	2	
\.


--
-- TOC entry 2843 (class 0 OID 6870128)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6870197)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6870035)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 6870305)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5578-466f-5ec9-43e5cfd34eab	01	Drama	drama (SURS 01)
00140000-5578-466f-a5b4-52002b5925f3	02	Opera	opera (SURS 02)
00140000-5578-466f-63dc-c0c6421a755c	03	Balet	balet (SURS 03)
00140000-5578-466f-34d0-2a4fda1d8aeb	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5578-466f-2bc6-934d74a3d626	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5578-466f-f78e-791ca500edc0	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5578-466f-61e6-c818e6ad4c1a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2849 (class 0 OID 6870187)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5578-466f-db36-f443519c6b78	01	Opera	opera
00150000-5578-466f-57c7-6c28149e2725	02	Opereta	opereta
00150000-5578-466f-adb9-e8b1383f2439	03	Balet	balet
00150000-5578-466f-c0e6-7d6edb327560	04	Plesne prireditve	plesne prireditve
00150000-5578-466f-3898-d31bb2020ce5	05	Lutkovno gledališče	lutkovno gledališče
00150000-5578-466f-151a-2d6f43b66def	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5578-466f-80da-5aaf683cba3c	07	Biografska drama	biografska drama
00150000-5578-466f-eb7e-fb0087ea82cb	08	Komedija	komedija
00150000-5578-466f-0459-b17d2367df0f	09	Črna komedija	črna komedija
00150000-5578-466f-de7d-31a69b627c90	10	E-igra	E-igra
00150000-5578-466f-0885-0cd10c633100	11	Kriminalka	kriminalka
00150000-5578-466f-c61c-a2476672d2a7	12	Musical	musical
\.


--
-- TOC entry 2395 (class 2606 OID 6869841)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 6870362)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6870352)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 6870257)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6870025)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6870050)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 6869967)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6870391)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6870183)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 6870001)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 6870044)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6869981)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6870093)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6870120)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 6869939)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6869850)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2402 (class 2606 OID 6869874)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 6869830)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2386 (class 2606 OID 6869815)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6870126)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6870159)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6870300)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6869903)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6869927)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6870099)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6869917)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6869988)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 6870111)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6870239)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6870285)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 6870406)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 6870464)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 6870413)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 6870433)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6870143)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 6870084)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6870075)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 6870279)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6870211)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 6869786)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 6870150)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 6869804)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2388 (class 2606 OID 6869824)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6870168)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6870106)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6870056)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 6870488)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 6870476)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 6870470)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6870224)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 6869883)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6870066)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6870268)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 6870445)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6869952)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6869799)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6870331)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6870010)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6870134)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 6870202)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6870039)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6870313)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6870195)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 1259 OID 6870032)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2535 (class 1259 OID 6870225)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2536 (class 1259 OID 6870226)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2409 (class 1259 OID 6869905)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2368 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2369 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2370 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2500 (class 1259 OID 6870127)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 6870113)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2495 (class 1259 OID 6870112)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2446 (class 1259 OID 6870011)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2522 (class 1259 OID 6870184)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2523 (class 1259 OID 6870186)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2524 (class 1259 OID 6870185)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2434 (class 1259 OID 6869983)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2435 (class 1259 OID 6869982)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2553 (class 1259 OID 6870302)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2554 (class 1259 OID 6870303)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2555 (class 1259 OID 6870304)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2594 (class 1259 OID 6870434)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6870336)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2563 (class 1259 OID 6870333)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2564 (class 1259 OID 6870337)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2565 (class 1259 OID 6870335)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2566 (class 1259 OID 6870334)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2424 (class 1259 OID 6869954)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 6869953)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2373 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2374 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2400 (class 1259 OID 6869877)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2510 (class 1259 OID 6870151)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2464 (class 1259 OID 6870045)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2390 (class 1259 OID 6869831)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2391 (class 1259 OID 6869832)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2515 (class 1259 OID 6870171)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2516 (class 1259 OID 6870170)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2517 (class 1259 OID 6870169)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2438 (class 1259 OID 6869989)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 6869991)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2440 (class 1259 OID 6869990)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2604 (class 1259 OID 6870478)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2474 (class 1259 OID 6870079)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2475 (class 1259 OID 6870077)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2476 (class 1259 OID 6870076)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2477 (class 1259 OID 6870078)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2381 (class 1259 OID 6869805)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2382 (class 1259 OID 6869806)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2503 (class 1259 OID 6870135)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2489 (class 1259 OID 6870100)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2531 (class 1259 OID 6870212)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2532 (class 1259 OID 6870213)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2584 (class 1259 OID 6870392)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 6870393)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2586 (class 1259 OID 6870394)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2413 (class 1259 OID 6869919)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6869918)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2415 (class 1259 OID 6869920)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2599 (class 1259 OID 6870465)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2539 (class 1259 OID 6870240)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2540 (class 1259 OID 6870241)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2576 (class 1259 OID 6870366)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 6870368)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2578 (class 1259 OID 6870364)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2579 (class 1259 OID 6870367)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2580 (class 1259 OID 6870365)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2528 (class 1259 OID 6870203)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2480 (class 1259 OID 6870088)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2481 (class 1259 OID 6870087)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2482 (class 1259 OID 6870085)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2483 (class 1259 OID 6870086)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2364 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2572 (class 1259 OID 6870354)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2573 (class 1259 OID 6870353)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2587 (class 1259 OID 6870407)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2445 (class 1259 OID 6870002)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2396 (class 1259 OID 6869852)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6869851)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2405 (class 1259 OID 6869884)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2406 (class 1259 OID 6869885)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 6870069)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 6870068)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2471 (class 1259 OID 6870067)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2590 (class 1259 OID 6870415)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2591 (class 1259 OID 6870414)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2452 (class 1259 OID 6870034)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2453 (class 1259 OID 6870030)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2454 (class 1259 OID 6870027)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2455 (class 1259 OID 6870028)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2456 (class 1259 OID 6870026)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2457 (class 1259 OID 6870031)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2458 (class 1259 OID 6870029)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2412 (class 1259 OID 6869904)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2430 (class 1259 OID 6869968)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6869970)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2432 (class 1259 OID 6869969)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2433 (class 1259 OID 6869971)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2488 (class 1259 OID 6870094)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2558 (class 1259 OID 6870301)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6870332)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2403 (class 1259 OID 6869875)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2404 (class 1259 OID 6869876)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2525 (class 1259 OID 6870196)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 6870489)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 6869940)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2607 (class 1259 OID 6870477)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2508 (class 1259 OID 6870145)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2509 (class 1259 OID 6870144)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 6870363)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2367 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2420 (class 1259 OID 6869928)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6870314)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2551 (class 1259 OID 6870286)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2552 (class 1259 OID 6870287)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 6869825)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2459 (class 1259 OID 6870033)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2636 (class 2606 OID 6870625)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2639 (class 2606 OID 6870610)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2638 (class 2606 OID 6870615)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2634 (class 2606 OID 6870635)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2640 (class 2606 OID 6870605)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2635 (class 2606 OID 6870630)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2637 (class 2606 OID 6870620)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2670 (class 2606 OID 6870780)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2669 (class 2606 OID 6870785)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2621 (class 2606 OID 6870540)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6870720)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2655 (class 2606 OID 6870715)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2656 (class 2606 OID 6870710)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2633 (class 2606 OID 6870600)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2665 (class 2606 OID 6870750)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6870760)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2664 (class 2606 OID 6870755)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2627 (class 2606 OID 6870575)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2628 (class 2606 OID 6870570)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2653 (class 2606 OID 6870700)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2676 (class 2606 OID 6870805)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2675 (class 2606 OID 6870810)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2674 (class 2606 OID 6870815)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2695 (class 2606 OID 6870910)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2678 (class 2606 OID 6870835)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2681 (class 2606 OID 6870820)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2677 (class 2606 OID 6870840)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2679 (class 2606 OID 6870830)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2680 (class 2606 OID 6870825)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2625 (class 2606 OID 6870565)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2626 (class 2606 OID 6870560)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2617 (class 2606 OID 6870525)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2618 (class 2606 OID 6870520)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2659 (class 2606 OID 6870730)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2641 (class 2606 OID 6870640)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2614 (class 2606 OID 6870500)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2613 (class 2606 OID 6870505)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2660 (class 2606 OID 6870745)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2661 (class 2606 OID 6870740)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2662 (class 2606 OID 6870735)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2631 (class 2606 OID 6870580)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2629 (class 2606 OID 6870590)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2630 (class 2606 OID 6870585)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2697 (class 2606 OID 6870920)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2645 (class 2606 OID 6870675)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2647 (class 2606 OID 6870665)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2648 (class 2606 OID 6870660)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2646 (class 2606 OID 6870670)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2612 (class 2606 OID 6870490)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2611 (class 2606 OID 6870495)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2658 (class 2606 OID 6870725)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2654 (class 2606 OID 6870705)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2668 (class 2606 OID 6870770)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2667 (class 2606 OID 6870775)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2691 (class 2606 OID 6870880)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2690 (class 2606 OID 6870885)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2689 (class 2606 OID 6870890)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2623 (class 2606 OID 6870550)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2624 (class 2606 OID 6870545)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2622 (class 2606 OID 6870555)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 6870915)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2672 (class 2606 OID 6870790)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2671 (class 2606 OID 6870795)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2686 (class 2606 OID 6870865)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2684 (class 2606 OID 6870875)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2688 (class 2606 OID 6870855)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2685 (class 2606 OID 6870870)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2687 (class 2606 OID 6870860)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2666 (class 2606 OID 6870765)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 6870695)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2650 (class 2606 OID 6870690)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2652 (class 2606 OID 6870680)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2651 (class 2606 OID 6870685)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2682 (class 2606 OID 6870850)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 6870845)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2692 (class 2606 OID 6870895)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2632 (class 2606 OID 6870595)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2673 (class 2606 OID 6870800)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2615 (class 2606 OID 6870515)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2616 (class 2606 OID 6870510)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2620 (class 2606 OID 6870530)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2619 (class 2606 OID 6870535)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2642 (class 2606 OID 6870655)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2643 (class 2606 OID 6870650)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2644 (class 2606 OID 6870645)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2693 (class 2606 OID 6870905)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2694 (class 2606 OID 6870900)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-10 16:15:13 CEST

--
-- PostgreSQL database dump complete
--

