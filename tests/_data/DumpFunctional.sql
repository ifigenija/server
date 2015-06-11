--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-11 10:46:51 CEST

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
-- TOC entry 180 (class 1259 OID 6948836)
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
-- TOC entry 227 (class 1259 OID 6949358)
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
-- TOC entry 226 (class 1259 OID 6949341)
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
-- TOC entry 219 (class 1259 OID 6949245)
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
-- TOC entry 194 (class 1259 OID 6949015)
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
-- TOC entry 197 (class 1259 OID 6949049)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6948958)
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
-- TOC entry 228 (class 1259 OID 6949372)
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
-- TOC entry 213 (class 1259 OID 6949175)
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
-- TOC entry 192 (class 1259 OID 6948995)
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
-- TOC entry 196 (class 1259 OID 6949043)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6948975)
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
-- TOC entry 202 (class 1259 OID 6949092)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6949117)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6948932)
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
-- TOC entry 181 (class 1259 OID 6948845)
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
-- TOC entry 182 (class 1259 OID 6948856)
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
-- TOC entry 177 (class 1259 OID 6948810)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6948829)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6949124)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6949155)
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
-- TOC entry 223 (class 1259 OID 6949291)
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
-- TOC entry 184 (class 1259 OID 6948889)
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
-- TOC entry 186 (class 1259 OID 6948924)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6949098)
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
-- TOC entry 185 (class 1259 OID 6948909)
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
-- TOC entry 191 (class 1259 OID 6948987)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6949110)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6949230)
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
-- TOC entry 222 (class 1259 OID 6949283)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6949398)
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
-- TOC entry 233 (class 1259 OID 6949461)
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
-- TOC entry 230 (class 1259 OID 6949411)
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
-- TOC entry 231 (class 1259 OID 6949430)
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
-- TOC entry 209 (class 1259 OID 6949139)
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
-- TOC entry 201 (class 1259 OID 6949083)
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
-- TOC entry 200 (class 1259 OID 6949073)
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
-- TOC entry 221 (class 1259 OID 6949272)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6949207)
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
-- TOC entry 174 (class 1259 OID 6948781)
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
-- TOC entry 173 (class 1259 OID 6948779)
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
-- TOC entry 210 (class 1259 OID 6949149)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6948819)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6948803)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6949163)
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
-- TOC entry 204 (class 1259 OID 6949104)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6949054)
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
-- TOC entry 236 (class 1259 OID 6949494)
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
-- TOC entry 235 (class 1259 OID 6949486)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6949481)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6949217)
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
-- TOC entry 183 (class 1259 OID 6948881)
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
-- TOC entry 199 (class 1259 OID 6949060)
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
-- TOC entry 220 (class 1259 OID 6949261)
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
-- TOC entry 232 (class 1259 OID 6949450)
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
-- TOC entry 188 (class 1259 OID 6948944)
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
-- TOC entry 175 (class 1259 OID 6948790)
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
-- TOC entry 225 (class 1259 OID 6949318)
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
-- TOC entry 193 (class 1259 OID 6949006)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6949131)
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
-- TOC entry 215 (class 1259 OID 6949200)
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
-- TOC entry 195 (class 1259 OID 6949038)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6949308)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6949190)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 6948784)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 6948836)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 6949358)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5579-4afb-ce4d-9d5db9208d7f	000d0000-5579-4afb-93a1-1f56c04fb7ec	\N	00090000-5579-4afb-89fb-c04e48b65314	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4afb-bc29-6e1a3f14a956	000d0000-5579-4afb-86ae-c71886534450	\N	00090000-5579-4afb-250c-9b544704fc9e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4afb-d732-ed25df5d9996	000d0000-5579-4afb-c2df-06a38d78d9d1	\N	00090000-5579-4afb-873b-069c42653ece	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4afb-5b91-ff65d7a6850e	000d0000-5579-4afb-1111-16164dce1058	\N	00090000-5579-4afb-dbb4-34cf88d1b9e3	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4afb-2609-2470bf4b53df	000d0000-5579-4afb-0ee3-359d34afde08	\N	00090000-5579-4afb-e31d-3630d0db1080	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4afb-ebe9-d36ed4e99831	000d0000-5579-4afb-c5f7-66894e6c8e8c	\N	00090000-5579-4afb-250c-9b544704fc9e	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 6949341)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6949245)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5579-4afa-03ac-0e7dc10e12f5	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5579-4afa-215a-a21eb602735f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5579-4afa-6782-13d3be9a0439	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 6949015)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5579-4afb-010c-cd3c11d72d74	\N	\N	00200000-5579-4afb-17a3-ca5cf421e9c6	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5579-4afb-1e6a-63d768ca4836	\N	\N	00200000-5579-4afb-8161-9d99360f1e8d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5579-4afb-f386-fbefb2e2806d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5579-4afb-234f-04e6d290d640	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5579-4afb-6bdb-7695f0e44685	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 6949049)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6948958)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5579-4af9-c075-b538eee27af8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5579-4af9-f9c5-d9e76276dc62	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5579-4af9-5a43-1591093de96b	AL	ALB	008	Albania 	Albanija	\N
00040000-5579-4af9-5334-78c17137a754	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5579-4af9-2494-4daac02e2a83	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5579-4af9-82bc-cf00418fbd2a	AD	AND	020	Andorra 	Andora	\N
00040000-5579-4af9-87bc-c34e48ea2d49	AO	AGO	024	Angola 	Angola	\N
00040000-5579-4af9-8c52-d819a6fb61ae	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5579-4af9-8d96-3701fc6ed780	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5579-4af9-d65b-6f1cf87620ea	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-4af9-6ff0-05a3c58b8496	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5579-4af9-8100-8eeb92d6a9bb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5579-4af9-f9a2-2a983e05b11a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5579-4af9-4720-510ab3364691	AU	AUS	036	Australia 	Avstralija	\N
00040000-5579-4af9-f6c8-6d8ae9879626	AT	AUT	040	Austria 	Avstrija	\N
00040000-5579-4af9-cef0-a14b1dde73bd	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5579-4af9-1b14-0fe425eaa9c5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5579-4af9-a171-ae61dd6e5f13	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5579-4af9-6f80-d1fec5a2869d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5579-4af9-3187-8de419a7aa18	BB	BRB	052	Barbados 	Barbados	\N
00040000-5579-4af9-95c4-e9e179a6d7ed	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5579-4af9-3e20-1713f8f2cb0f	BE	BEL	056	Belgium 	Belgija	\N
00040000-5579-4af9-9f93-144ae9fbbab6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5579-4af9-c653-74f680cb7cee	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5579-4af9-4a62-aa7f598084aa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5579-4af9-9e25-958cc44cc2cb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5579-4af9-4382-dbcacfaeb196	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5579-4af9-b157-515ef71b5fa8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5579-4af9-b2c2-da5e6836b170	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5579-4af9-ad85-091ccb1b0992	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5579-4af9-27f8-ef4bd5e68fd4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5579-4af9-0d1a-f8c685f9cd8d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5579-4af9-e610-3f7b1b13915d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5579-4af9-3f29-0cc2d90a9fbb	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5579-4af9-e93a-0a8eb187a3e8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5579-4af9-1d51-9c716afce516	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5579-4af9-0993-ec2e1ed9fe95	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5579-4af9-831a-f0d5afc6bc50	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5579-4af9-b2ea-b9ab3ae2400a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5579-4af9-6c4f-0533777f9be7	CA	CAN	124	Canada 	Kanada	\N
00040000-5579-4af9-e4f2-e38753898f1a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5579-4af9-f1cb-75fc92ff5e18	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5579-4af9-a362-28ff35c730fe	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5579-4af9-4e51-38ad3733ae64	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5579-4af9-722a-254c358b4d35	CL	CHL	152	Chile 	Čile	\N
00040000-5579-4af9-85a2-51d04947ac3a	CN	CHN	156	China 	Kitajska	\N
00040000-5579-4af9-4e41-78724f97c267	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5579-4af9-cfbb-1aa5b31f47bf	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5579-4af9-40ea-da1b152d3a9a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5579-4af9-b374-3bf75eb3db38	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5579-4af9-db35-3f6e44ea3c59	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5579-4af9-9f0b-98dd51bbc86e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5579-4af9-62f4-3ba76bd51aaf	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5579-4af9-fe29-b9e73cfbd7e4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5579-4af9-7001-f6c023f7ca86	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5579-4af9-36d9-c94a173a5619	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5579-4af9-b77f-54806fb9b031	CU	CUB	192	Cuba 	Kuba	\N
00040000-5579-4af9-035b-ad58c166411d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5579-4af9-6d0b-8af9faf167dd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5579-4af9-b07c-f308d976a738	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5579-4af9-a2d3-b80edb19897a	DK	DNK	208	Denmark 	Danska	\N
00040000-5579-4af9-5589-7d7b9c0e5401	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5579-4af9-0187-41a93edf312f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-4af9-4a96-fa099375a206	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5579-4af9-41ed-c40a119e6612	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5579-4af9-12ee-e0d544dc7751	EG	EGY	818	Egypt 	Egipt	\N
00040000-5579-4af9-017f-22acc4a1e2b3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5579-4af9-6418-10b90fa60d66	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5579-4af9-7ee4-1391d0993b0c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5579-4af9-6362-3ea9435dbc25	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5579-4af9-64a0-1a9a82a069c8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5579-4af9-1542-5be5a9a61fd6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5579-4af9-97ca-93056bc4ce4c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5579-4af9-acd7-35ca74eee5c5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5579-4af9-b006-00f5953f9ef3	FI	FIN	246	Finland 	Finska	\N
00040000-5579-4af9-d114-f122fe22f55f	FR	FRA	250	France 	Francija	\N
00040000-5579-4af9-ae3d-493e4255b641	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5579-4af9-a757-4d2ffc4231ea	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5579-4af9-cc24-db6949b273a1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5579-4af9-cd51-b6700d595e3b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5579-4af9-9529-332defbfa897	GA	GAB	266	Gabon 	Gabon	\N
00040000-5579-4af9-f43b-7ba23a8e328d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5579-4af9-7c67-96b66348ca5d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5579-4af9-c70e-9c612b5f8d02	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5579-4af9-29c4-0e4430ef9ff0	GH	GHA	288	Ghana 	Gana	\N
00040000-5579-4af9-9176-8782c3a432fb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5579-4af9-eeb3-628fcef751c9	GR	GRC	300	Greece 	Grčija	\N
00040000-5579-4af9-12a0-0577f59a3026	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5579-4af9-f52e-1d68a645677e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5579-4af9-e58e-c4476750c700	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5579-4af9-10d2-8c34d025d8b3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5579-4af9-d693-a977cee3430d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5579-4af9-f61b-fc3fe6dd8aa1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5579-4af9-1d4a-a9cf15709e65	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5579-4af9-f5a8-6e105aff2520	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5579-4af9-3fdd-45d982e51e9a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5579-4af9-f90a-5551bf2c9d9f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5579-4af9-812e-da7573790dff	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5579-4af9-98b9-6c2faa81108e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5579-4af9-d93c-2c1bad34c962	HN	HND	340	Honduras 	Honduras	\N
00040000-5579-4af9-d9f4-4f41c1a0dd23	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5579-4af9-4534-9d4c540f53f1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5579-4af9-842f-5becde02e004	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5579-4af9-c70e-ec4990e4140d	IN	IND	356	India 	Indija	\N
00040000-5579-4af9-287f-29909779c359	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5579-4af9-1930-dbdeb72787a0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5579-4af9-5887-328949632df6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5579-4af9-d0b9-f455c5312921	IE	IRL	372	Ireland 	Irska	\N
00040000-5579-4af9-df14-3f4c95d40142	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5579-4af9-7aa0-09f1cd4cfe02	IL	ISR	376	Israel 	Izrael	\N
00040000-5579-4af9-a383-1023fabd8e7b	IT	ITA	380	Italy 	Italija	\N
00040000-5579-4af9-ac5d-cc67f4c0a3a3	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5579-4af9-967f-1f2939157f6f	JP	JPN	392	Japan 	Japonska	\N
00040000-5579-4af9-785c-23a148fb85f3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5579-4af9-c7ff-8bf010fa0d00	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5579-4af9-d08f-916c1c942d29	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5579-4af9-d03a-69107e293af1	KE	KEN	404	Kenya 	Kenija	\N
00040000-5579-4af9-fba8-402623535280	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5579-4af9-ff7e-c4abf3014d2f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5579-4af9-a49d-d9fac71cfd92	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5579-4af9-42ff-2e74a4866612	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5579-4af9-5e43-88524943a481	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5579-4af9-b828-d266ada335c9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5579-4af9-292f-6f9baaefaf49	LV	LVA	428	Latvia 	Latvija	\N
00040000-5579-4af9-7eb8-a7024f3b22dc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5579-4af9-ac27-426c23512328	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5579-4af9-1f82-a2541e4bf8f1	LR	LBR	430	Liberia 	Liberija	\N
00040000-5579-4af9-8314-48d9ca89d748	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5579-4af9-7f17-eba44f2c6442	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5579-4af9-f5ed-4909d087d002	LT	LTU	440	Lithuania 	Litva	\N
00040000-5579-4af9-f5d6-55c798e1a84c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5579-4af9-37ee-3689552e083c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5579-4af9-af4b-a90671f7b225	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5579-4af9-8740-139d83778d2f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5579-4af9-01a3-79c946e06fb6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5579-4af9-281f-7b315484d452	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5579-4af9-3800-7b4871c00afa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5579-4af9-cdbb-72ba45b5cbd4	ML	MLI	466	Mali 	Mali	\N
00040000-5579-4af9-408e-72360adcc33b	MT	MLT	470	Malta 	Malta	\N
00040000-5579-4af9-6b59-6aad250976be	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5579-4af9-bbbe-f0fe1a973236	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5579-4af9-f42c-2773380295d6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5579-4af9-6d3f-b256dee9d307	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5579-4af9-40f2-4a1fbe63ed8d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5579-4af9-f7b2-bce394f5492d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5579-4af9-26ed-755a79d5722c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5579-4af9-e36c-3e12594a89e8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5579-4af9-e497-d322ce643668	MC	MCO	492	Monaco 	Monako	\N
00040000-5579-4af9-491f-b4b27a2c73a8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5579-4af9-f6c5-e0545d12ce8a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5579-4af9-ec78-6c83c81f85ff	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5579-4af9-ee8a-922fc775a3a3	MA	MAR	504	Morocco 	Maroko	\N
00040000-5579-4af9-0214-020f2fd307cc	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5579-4af9-356a-b7a73ede2180	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5579-4af9-3a7d-d9182fe17f65	NA	NAM	516	Namibia 	Namibija	\N
00040000-5579-4af9-9b75-2e64ca1a77cf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5579-4af9-8bb5-91de609dc0c1	NP	NPL	524	Nepal 	Nepal	\N
00040000-5579-4af9-5858-a2508275ca8c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5579-4af9-ad37-3780e93f071d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5579-4af9-24e8-53623e7cff16	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5579-4af9-6e80-0a89f12ddbe9	NE	NER	562	Niger 	Niger 	\N
00040000-5579-4af9-6274-87d2492a54c7	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5579-4af9-a0de-6e9889865919	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5579-4af9-9ef7-9115fcb43244	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5579-4af9-63d9-0490556c914d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5579-4af9-3941-2121acb2d918	NO	NOR	578	Norway 	Norveška	\N
00040000-5579-4af9-ab3d-4455da046d2b	OM	OMN	512	Oman 	Oman	\N
00040000-5579-4af9-852c-636fa95ef732	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5579-4af9-2e7c-7570a541be16	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5579-4af9-7112-b65a235f0836	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5579-4af9-6f73-b925c0e43190	PA	PAN	591	Panama 	Panama	\N
00040000-5579-4af9-79c7-e15b6d7129f2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5579-4af9-1a51-8f30b33613dc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5579-4af9-a61b-ccb82bda636c	PE	PER	604	Peru 	Peru	\N
00040000-5579-4af9-deb6-10653f1561a4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5579-4af9-f435-a4b1f748ba05	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5579-4af9-4716-e8e87d735bc3	PL	POL	616	Poland 	Poljska	\N
00040000-5579-4af9-fb8f-a4160def261a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5579-4af9-785d-8f4cb2cdd9a8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5579-4af9-c8ec-74b355d0bbe2	QA	QAT	634	Qatar 	Katar	\N
00040000-5579-4af9-6c56-4a57446ee1d4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5579-4af9-b319-c7357a07c3fe	RO	ROU	642	Romania 	Romunija	\N
00040000-5579-4af9-2053-d43e8b7942aa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5579-4af9-2e66-d43d20f11eba	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5579-4af9-a52b-c0f5f921a301	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5579-4af9-46c7-1b1dc69cad80	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5579-4af9-9421-8a6c5eec8f7a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5579-4af9-be09-821080b64717	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5579-4af9-50ae-914f415ea72c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5579-4af9-2d1b-dbc164f7c8c5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5579-4af9-2172-7d8a9a9232d0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5579-4af9-d810-bd5428cfb3ea	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5579-4af9-f610-ba9f896055cd	SM	SMR	674	San Marino 	San Marino	\N
00040000-5579-4af9-952d-cfbef23976f8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5579-4af9-c1e2-a11fb1559d0f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5579-4af9-1195-e43b79f25b19	SN	SEN	686	Senegal 	Senegal	\N
00040000-5579-4af9-57f6-c975356d0e5c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5579-4af9-0346-da9be307e788	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5579-4af9-5fb7-08bfd89cf7da	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5579-4af9-5ad3-1bf5da7f08a6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5579-4af9-8532-396d9d406399	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5579-4af9-cbe8-a05b984f41c3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5579-4af9-0ea2-fa835d52cf8a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5579-4af9-0af2-52e8defd659d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5579-4af9-8d51-0035aaf3da3f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5579-4af9-a5f4-0b386c5e2fef	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5579-4af9-1286-b36f6eb9a8a7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5579-4af9-d410-0d8d557b72da	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5579-4af9-fd0a-d0fb820b0998	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5579-4af9-63ce-be9223aaf57e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5579-4af9-862f-21827df058f5	SD	SDN	729	Sudan 	Sudan	\N
00040000-5579-4af9-c780-b8b57b187999	SR	SUR	740	Suriname 	Surinam	\N
00040000-5579-4af9-7613-8a61415feee2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5579-4af9-f82b-de0a7a1d2260	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5579-4af9-df97-a9848b6b4b46	SE	SWE	752	Sweden 	Švedska	\N
00040000-5579-4af9-8b18-0cab6d379b1b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5579-4af9-4444-a5ec19d5d101	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5579-4af9-7dac-0948a53de273	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5579-4af9-5c0f-5ecc2f01c229	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5579-4af9-e8b8-53e95f39149c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5579-4af9-8a87-3472129246b4	TH	THA	764	Thailand 	Tajska	\N
00040000-5579-4af9-e876-6f44b3171645	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5579-4af9-f640-c3f4d1ba861a	TG	TGO	768	Togo 	Togo	\N
00040000-5579-4af9-be5d-5b2e09a6d9ad	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5579-4af9-0587-5dc416ef67d9	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5579-4af9-f6c5-92f4b35e8414	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5579-4af9-72d3-e37f31ee2fe6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5579-4af9-22d2-b18be0d96579	TR	TUR	792	Turkey 	Turčija	\N
00040000-5579-4af9-840b-d316c55e81b4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5579-4af9-0d52-6c31d911c4e6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-4af9-7c4d-36f48d2148e9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5579-4af9-53c8-e9814bf43034	UG	UGA	800	Uganda 	Uganda	\N
00040000-5579-4af9-a37b-bc03b55f06f3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5579-4af9-759d-79f23fbdae2f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5579-4af9-0537-2512a7e54e43	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5579-4af9-db0b-af248b8d056b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5579-4af9-41ad-492941c90d65	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5579-4af9-4b3f-e6d9be71102e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5579-4af9-3e24-0831000ff707	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5579-4af9-566a-5fa2db8bee5b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5579-4af9-d5cf-0444449e05c4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5579-4af9-0e02-c49f0a30ccda	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5579-4af9-e600-f13ee3036e5e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-4af9-ca45-ab90bccb7033	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5579-4af9-f628-108d4a9d3447	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5579-4af9-9ed4-c5b35ef5e335	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5579-4af9-1b86-25478ba4933c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5579-4af9-f8f0-cff9adfb1ff9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5579-4af9-5caa-36eedca0902e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 6949372)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 6949175)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5579-4afb-e50d-b77949139407	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5579-4af9-4897-dcf191ab2693
000d0000-5579-4afb-93a1-1f56c04fb7ec	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-4af9-4897-dcf191ab2693
000d0000-5579-4afb-86ae-c71886534450	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5579-4af9-a40d-3e8f5831e995
000d0000-5579-4afb-c2df-06a38d78d9d1	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5579-4af9-a894-53afd7f903e1
000d0000-5579-4afb-1111-16164dce1058	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5579-4af9-a894-53afd7f903e1
000d0000-5579-4afb-0ee3-359d34afde08	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5579-4af9-a894-53afd7f903e1
000d0000-5579-4afb-c5f7-66894e6c8e8c	000e0000-5579-4afb-b5bb-38109d52b3d0	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-4af9-4897-dcf191ab2693
\.


--
-- TOC entry 2839 (class 0 OID 6948995)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6949043)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6948975)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5579-4afb-23dc-8bd2557ffd4f	00080000-5579-4afa-e54e-b4883fe8f0c4	00090000-5579-4afb-89fb-c04e48b65314	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6949092)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6949117)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6948932)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5579-4afa-cb9b-a5e6d34801f6	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5579-4afa-5a7e-10bfa7612442	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5579-4afa-31d8-d06042f6aa80	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5579-4afa-e72c-d437946931ac	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5579-4afa-9a44-2a337e88f755	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5579-4afa-26c7-88dcfe586d4c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5579-4afa-7913-390a3da7d8bd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5579-4afa-ec34-be0d295614fa	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5579-4afa-ebdb-75454ff8e3ba	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5579-4afa-334b-1b6d4980c106	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5579-4afa-62ac-17e264a44d0e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5579-4afa-0ec6-a9038975de23	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5579-4afa-1941-083caf8829f9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-4afa-7743-b6c001bf82fa	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-4afa-d565-39e25099cddc	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5579-4afa-d06a-73ad0013e827	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 6948845)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5579-4afa-ff90-62a1c09cbf43	00000000-5579-4afa-9a44-2a337e88f755	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5579-4afa-6ec2-d9cd00f62de0	00000000-5579-4afa-9a44-2a337e88f755	00010000-5579-4afa-1b3f-284ffa22aeba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5579-4afa-3632-ea08301c94d2	00000000-5579-4afa-26c7-88dcfe586d4c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 6948856)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5579-4afb-2d70-6ecd3bbf828b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5579-4afb-dbb4-34cf88d1b9e3	00010000-5579-4afa-3e6f-8ae3be0c39b2	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5579-4afb-873b-069c42653ece	00010000-5579-4afa-b4c8-894300ebbed4	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5579-4afb-a816-5a5b70dc4ea0	00010000-5579-4afa-1925-21e6564173e5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5579-4afb-0fb0-028ceac21e3f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5579-4afb-a8a0-810f6faca675	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5579-4afb-b391-208651ce3af4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5579-4afb-c474-903180c19c6a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5579-4afb-89fb-c04e48b65314	00010000-5579-4afa-d560-d9c5c4d2b4f4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5579-4afb-250c-9b544704fc9e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5579-4afb-a61c-3aad0307cc8f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5579-4afb-e31d-3630d0db1080	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5579-4afb-9033-1913256c3ae6	00010000-5579-4afa-92ab-6dbf2d43cbe3	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6948810)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5579-4af9-28d3-199c54bcb2c4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5579-4af9-d7e7-2527d9ed4436	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5579-4af9-ba89-a5aa3d6e0f78	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5579-4af9-addd-210296e6f308	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5579-4af9-19ce-958d0b169f5b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5579-4af9-b95c-e3eec50dc408	Abonma-read	Abonma - branje	f
00030000-5579-4af9-b9ef-83584a210425	Abonma-write	Abonma - spreminjanje	f
00030000-5579-4af9-7859-e0a9c1c72bfd	Alternacija-read	Alternacija - branje	f
00030000-5579-4af9-8e32-f1f9960878fb	Alternacija-write	Alternacija - spreminjanje	f
00030000-5579-4af9-72c9-2f39a31849d7	Arhivalija-read	Arhivalija - branje	f
00030000-5579-4af9-1717-305a81bdb48d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5579-4af9-2e0b-242798c2b2e9	Besedilo-read	Besedilo - branje	f
00030000-5579-4af9-e198-bc98b5ebcb52	Besedilo-write	Besedilo - spreminjanje	f
00030000-5579-4af9-74e9-0ec732da2320	DogodekIzven-read	DogodekIzven - branje	f
00030000-5579-4af9-e5e7-06303e11e5de	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5579-4af9-fc8f-4321576c7cda	Dogodek-read	Dogodek - branje	f
00030000-5579-4af9-6d7c-12e4d4f34494	Dogodek-write	Dogodek - spreminjanje	f
00030000-5579-4af9-5fee-2ca066747d3d	Drzava-read	Drzava - branje	f
00030000-5579-4af9-e08f-48603049372d	Drzava-write	Drzava - spreminjanje	f
00030000-5579-4af9-702d-828cc9eef64a	Funkcija-read	Funkcija - branje	f
00030000-5579-4af9-cfc2-e7c1aa4cc48a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5579-4af9-423d-5211baa0043d	Gostovanje-read	Gostovanje - branje	f
00030000-5579-4af9-f592-8e9d1cc0f2a5	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5579-4af9-63a6-942270a76e5f	Gostujoca-read	Gostujoca - branje	f
00030000-5579-4af9-caf3-cca78f2cbaa3	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5579-4af9-25e9-c93422db9116	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5579-4af9-3b53-e4999b816345	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5579-4af9-73a7-f40435ffbfb3	Kupec-read	Kupec - branje	f
00030000-5579-4af9-8026-607803986b97	Kupec-write	Kupec - spreminjanje	f
00030000-5579-4af9-ed75-43511851f21e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5579-4af9-fee7-76505b04e525	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5579-4af9-90c7-08ae4ea995b8	Option-read	Option - branje	f
00030000-5579-4af9-3618-84c8ec147f5c	Option-write	Option - spreminjanje	f
00030000-5579-4af9-9775-d964560d08be	OptionValue-read	OptionValue - branje	f
00030000-5579-4af9-34be-83d8365e57a7	OptionValue-write	OptionValue - spreminjanje	f
00030000-5579-4af9-ebef-01da2b67ca67	Oseba-read	Oseba - branje	f
00030000-5579-4af9-eb93-455cdcdb1f50	Oseba-write	Oseba - spreminjanje	f
00030000-5579-4af9-702e-4650d3fe75a2	Permission-read	Permission - branje	f
00030000-5579-4af9-8818-38000b67b05a	Permission-write	Permission - spreminjanje	f
00030000-5579-4af9-fc2b-25665eb9e499	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5579-4af9-1088-90bf80dd02d0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5579-4af9-2955-181196499a51	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5579-4af9-5e05-f500e9f50c74	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5579-4af9-d528-2325d12dfe37	Pogodba-read	Pogodba - branje	f
00030000-5579-4af9-8658-f1d4f14d27b2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5579-4af9-0bfd-f9a1bc93e522	Popa-read	Popa - branje	f
00030000-5579-4af9-b1be-75bce177d3ec	Popa-write	Popa - spreminjanje	f
00030000-5579-4af9-531d-3bb7d6fc66fd	Posta-read	Posta - branje	f
00030000-5579-4af9-c98a-34ac39bd3c93	Posta-write	Posta - spreminjanje	f
00030000-5579-4af9-6ae7-955136c9db7c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5579-4af9-cae4-98a97c74360d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5579-4af9-e1cf-a5172ea44c53	PostniNaslov-read	PostniNaslov - branje	f
00030000-5579-4af9-5988-41d09b2d87be	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5579-4af9-2e83-3095eb2e7930	Predstava-read	Predstava - branje	f
00030000-5579-4af9-b2a0-e0725431f0e7	Predstava-write	Predstava - spreminjanje	f
00030000-5579-4af9-5bfb-329a02573f4f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5579-4af9-0e13-e7cbd0cb83f6	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5579-4af9-b09f-6a7f64dfbd73	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5579-4af9-8ab6-4dae2b65fa0b	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5579-4af9-b4cf-27bc5cac5b2e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5579-4af9-54d4-361f336db603	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5579-4af9-3f7a-363dc74067d1	ProgramDela-read	ProgramDela - branje	f
00030000-5579-4af9-dd1a-689872ed9b40	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5579-4af9-bccc-c8b12f80b40c	ProgramFestival-read	ProgramFestival - branje	f
00030000-5579-4af9-15b5-88828d6646dd	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5579-4af9-9419-4603e3d744a5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5579-4af9-b99e-3c68995bb2d9	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5579-4af9-2a78-7cb82d9089b2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5579-4af9-f87f-a74873273c8e	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5579-4af9-c58c-6078aee85c1c	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5579-4af9-6dcf-076b574905db	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5579-4af9-4d07-6479b17bb9da	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5579-4af9-cab1-07e8ea34e882	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5579-4af9-be5e-61e07c1198d1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5579-4af9-38d0-2975731d7556	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5579-4af9-7900-bca0726c210a	Prostor-read	Prostor - branje	f
00030000-5579-4af9-c53a-bf95a44994ce	Prostor-write	Prostor - spreminjanje	f
00030000-5579-4af9-b8d0-be647ec69f9f	Racun-read	Racun - branje	f
00030000-5579-4af9-3184-d110136be619	Racun-write	Racun - spreminjanje	f
00030000-5579-4af9-9bfc-085328414069	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5579-4af9-872f-90e25396abfe	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5579-4af9-6bbf-63a4d3aa7353	Readme-read	Readme - branje	f
00030000-5579-4af9-e693-616a09c1b203	Readme-write	Readme - spreminjanje	f
00030000-5579-4af9-2246-cc17b33f8bf3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5579-4af9-805e-76f42b46f887	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5579-4af9-e486-51805e99852c	Rekvizit-read	Rekvizit - branje	f
00030000-5579-4af9-7318-7aa6646d8347	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5579-4af9-40f5-ac0903a17ea4	Revizija-read	Revizija - branje	f
00030000-5579-4af9-f4b8-f35b60ca71d0	Revizija-write	Revizija - spreminjanje	f
00030000-5579-4af9-2f71-1b98a1b9feec	Rezervacija-read	Rezervacija - branje	f
00030000-5579-4af9-f812-aaa0ab179b8c	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5579-4af9-1b82-bf7d0e19add8	Role-read	Role - branje	f
00030000-5579-4af9-af09-9c86cbe9dada	Role-write	Role - spreminjanje	f
00030000-5579-4af9-794f-50fdcab26cae	SedezniRed-read	SedezniRed - branje	f
00030000-5579-4af9-b4ca-e89b5e5a54ac	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5579-4af9-457d-19604a090f09	Sedez-read	Sedez - branje	f
00030000-5579-4af9-d101-d8c33d992575	Sedez-write	Sedez - spreminjanje	f
00030000-5579-4af9-b12c-ccb9cd25242b	Sezona-read	Sezona - branje	f
00030000-5579-4af9-c493-7eb7ed6dc3a4	Sezona-write	Sezona - spreminjanje	f
00030000-5579-4af9-483a-fb7673517062	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5579-4af9-8c30-619dad2b2bdb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5579-4af9-739f-e3756611b90c	Stevilcenje-read	Stevilcenje - branje	f
00030000-5579-4af9-fea8-bbf09e5900f7	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5579-4af9-5bfa-e994a9ab908d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5579-4af9-c0fc-0a1b22dabda5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5579-4af9-585a-deaf4d254e92	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5579-4af9-6077-f17c16934d95	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5579-4af9-2176-4a5d8aa65bf5	Telefonska-read	Telefonska - branje	f
00030000-5579-4af9-711c-f0c2fcd4821e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5579-4af9-1b18-3e5599db99a9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5579-4af9-e61a-2aa042367c33	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5579-4af9-b13e-5cd6f0925734	TipFunkcije-read	TipFunkcije - branje	f
00030000-5579-4af9-785f-b529c7373354	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5579-4af9-641c-aba4a5613fd9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5579-4afa-5bc7-bb51d45f9291	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5579-4afa-17a9-ace504270bae	Trr-read	Trr - branje	f
00030000-5579-4afa-d2e2-983bff01d556	Trr-write	Trr - spreminjanje	f
00030000-5579-4afa-e47d-9c5bc9d87b55	Uprizoritev-read	Uprizoritev - branje	f
00030000-5579-4afa-80a6-908152192b1a	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5579-4afa-b84c-5f2445d59025	User-read	User - branje	f
00030000-5579-4afa-dce0-6a36523d30c0	User-write	User - spreminjanje	f
00030000-5579-4afa-8b83-24d35948162f	Vaja-read	Vaja - branje	f
00030000-5579-4afa-37c4-fc889630c7b8	Vaja-write	Vaja - spreminjanje	f
00030000-5579-4afa-dac2-887c751961e3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5579-4afa-8c4d-ecb49f87920b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5579-4afa-31c2-bea74867fd0c	Zaposlitev-read	Zaposlitev - branje	f
00030000-5579-4afa-6a51-ddcba3cdb479	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5579-4afa-d6b8-fdafe3ad2f3a	Zasedenost-read	Zasedenost - branje	f
00030000-5579-4afa-e83d-762ac8cf505c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5579-4afa-5365-4e67dcac15ca	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5579-4afa-d399-e438aa3f62df	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5579-4afa-af66-e791cfa5f7a5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5579-4afa-ec70-0492f802f7e9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 6948829)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5579-4afa-cd55-efbf73db92d8	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b95c-e3eec50dc408
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b9ef-83584a210425
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-7859-e0a9c1c72bfd
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-8e32-f1f9960878fb
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-72c9-2f39a31849d7
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-fc8f-4321576c7cda
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-addd-210296e6f308
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-6d7c-12e4d4f34494
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-e08f-48603049372d
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-702d-828cc9eef64a
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-cfc2-e7c1aa4cc48a
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-423d-5211baa0043d
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-f592-8e9d1cc0f2a5
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-63a6-942270a76e5f
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-caf3-cca78f2cbaa3
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-25e9-c93422db9116
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-3b53-e4999b816345
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-90c7-08ae4ea995b8
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-9775-d964560d08be
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-ebef-01da2b67ca67
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-eb93-455cdcdb1f50
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-0bfd-f9a1bc93e522
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b1be-75bce177d3ec
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-531d-3bb7d6fc66fd
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-c98a-34ac39bd3c93
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-e1cf-a5172ea44c53
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-5988-41d09b2d87be
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-2e83-3095eb2e7930
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b2a0-e0725431f0e7
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b4cf-27bc5cac5b2e
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-54d4-361f336db603
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-7900-bca0726c210a
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-c53a-bf95a44994ce
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-2246-cc17b33f8bf3
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-805e-76f42b46f887
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-e486-51805e99852c
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-7318-7aa6646d8347
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b12c-ccb9cd25242b
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-c493-7eb7ed6dc3a4
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4af9-b13e-5cd6f0925734
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-e47d-9c5bc9d87b55
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-80a6-908152192b1a
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-8b83-24d35948162f
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-37c4-fc889630c7b8
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-d6b8-fdafe3ad2f3a
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-e83d-762ac8cf505c
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-5365-4e67dcac15ca
00020000-5579-4afa-6543-ba3703cf5d11	00030000-5579-4afa-af66-e791cfa5f7a5
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-b95c-e3eec50dc408
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-72c9-2f39a31849d7
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-fc8f-4321576c7cda
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-423d-5211baa0043d
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-63a6-942270a76e5f
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-25e9-c93422db9116
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-3b53-e4999b816345
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-90c7-08ae4ea995b8
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-9775-d964560d08be
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-ebef-01da2b67ca67
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-eb93-455cdcdb1f50
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-0bfd-f9a1bc93e522
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-531d-3bb7d6fc66fd
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-e1cf-a5172ea44c53
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-5988-41d09b2d87be
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-2e83-3095eb2e7930
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-7900-bca0726c210a
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-2246-cc17b33f8bf3
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-e486-51805e99852c
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-b12c-ccb9cd25242b
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-2176-4a5d8aa65bf5
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4af9-711c-f0c2fcd4821e
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-17a9-ace504270bae
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-d2e2-983bff01d556
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-31c2-bea74867fd0c
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-6a51-ddcba3cdb479
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-5365-4e67dcac15ca
00020000-5579-4afa-bb9a-24c7131182cd	00030000-5579-4afa-af66-e791cfa5f7a5
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-b95c-e3eec50dc408
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-7859-e0a9c1c72bfd
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-72c9-2f39a31849d7
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-1717-305a81bdb48d
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-2e0b-242798c2b2e9
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-74e9-0ec732da2320
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-fc8f-4321576c7cda
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-702d-828cc9eef64a
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-423d-5211baa0043d
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-63a6-942270a76e5f
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-25e9-c93422db9116
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-90c7-08ae4ea995b8
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-9775-d964560d08be
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-ebef-01da2b67ca67
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-0bfd-f9a1bc93e522
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-531d-3bb7d6fc66fd
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-2e83-3095eb2e7930
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-b4cf-27bc5cac5b2e
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-7900-bca0726c210a
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-2246-cc17b33f8bf3
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-e486-51805e99852c
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-b12c-ccb9cd25242b
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4af9-b13e-5cd6f0925734
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4afa-8b83-24d35948162f
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4afa-d6b8-fdafe3ad2f3a
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4afa-5365-4e67dcac15ca
00020000-5579-4afa-6616-7ab5272ec218	00030000-5579-4afa-af66-e791cfa5f7a5
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-b95c-e3eec50dc408
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-b9ef-83584a210425
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-8e32-f1f9960878fb
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-72c9-2f39a31849d7
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-fc8f-4321576c7cda
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-423d-5211baa0043d
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-63a6-942270a76e5f
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-90c7-08ae4ea995b8
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-9775-d964560d08be
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-0bfd-f9a1bc93e522
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-531d-3bb7d6fc66fd
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-2e83-3095eb2e7930
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-7900-bca0726c210a
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-2246-cc17b33f8bf3
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-e486-51805e99852c
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-b12c-ccb9cd25242b
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4af9-b13e-5cd6f0925734
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4afa-5365-4e67dcac15ca
00020000-5579-4afa-7d03-4c02a26ca3fa	00030000-5579-4afa-af66-e791cfa5f7a5
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-b95c-e3eec50dc408
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-72c9-2f39a31849d7
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-fc8f-4321576c7cda
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-5fee-2ca066747d3d
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-423d-5211baa0043d
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-63a6-942270a76e5f
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-90c7-08ae4ea995b8
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-9775-d964560d08be
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-0bfd-f9a1bc93e522
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-531d-3bb7d6fc66fd
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-2e83-3095eb2e7930
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-7900-bca0726c210a
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-2246-cc17b33f8bf3
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-e486-51805e99852c
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-b12c-ccb9cd25242b
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-1b18-3e5599db99a9
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-ba89-a5aa3d6e0f78
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4af9-b13e-5cd6f0925734
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4afa-5365-4e67dcac15ca
00020000-5579-4afa-54fd-6efda5efe4cc	00030000-5579-4afa-af66-e791cfa5f7a5
\.


--
-- TOC entry 2854 (class 0 OID 6949124)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6949155)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 6949291)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6948889)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5579-4afa-e54e-b4883fe8f0c4	00040000-5579-4af9-c075-b538eee27af8	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4afa-70bf-18927cb70d47	00040000-5579-4af9-c075-b538eee27af8	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4afb-3a5c-710c94a3d417	00040000-5579-4af9-c075-b538eee27af8	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4afb-278b-8c402ffab5a9	00040000-5579-4af9-c075-b538eee27af8	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 6948924)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5579-4af9-0205-d763a9819259	8341	Adlešiči
00050000-5579-4af9-26b3-57097eba14a4	5270	Ajdovščina
00050000-5579-4af9-dcfa-144271c868ef	6280	Ankaran/Ancarano
00050000-5579-4af9-f473-a8d07e9d22ca	9253	Apače
00050000-5579-4af9-0aa9-8481c928c255	8253	Artiče
00050000-5579-4af9-ed8e-e42c9ec58ed7	4275	Begunje na Gorenjskem
00050000-5579-4af9-094b-a119da93269c	1382	Begunje pri Cerknici
00050000-5579-4af9-5464-c63499b1d466	9231	Beltinci
00050000-5579-4af9-c8e8-c77f32c9e234	2234	Benedikt
00050000-5579-4af9-09a1-d01d671f6edf	2345	Bistrica ob Dravi
00050000-5579-4af9-eeb1-63426f5eafd8	3256	Bistrica ob Sotli
00050000-5579-4af9-5ce4-4748e7337d6f	8259	Bizeljsko
00050000-5579-4af9-f97d-f17d06a1895b	1223	Blagovica
00050000-5579-4af9-fa16-d8bbd3d31726	8283	Blanca
00050000-5579-4af9-d5a2-48591461e304	4260	Bled
00050000-5579-4af9-e566-d978c551fea6	4273	Blejska Dobrava
00050000-5579-4af9-a97f-6f2c25693fc8	9265	Bodonci
00050000-5579-4af9-b542-f6fd8630a34d	9222	Bogojina
00050000-5579-4af9-d799-70a9702652cf	4263	Bohinjska Bela
00050000-5579-4af9-341c-7eb5d5849ef4	4264	Bohinjska Bistrica
00050000-5579-4af9-6080-cf907c211878	4265	Bohinjsko jezero
00050000-5579-4af9-e95e-27219aa26ebf	1353	Borovnica
00050000-5579-4af9-dafc-b624ca726be0	8294	Boštanj
00050000-5579-4af9-2729-a17388752c84	5230	Bovec
00050000-5579-4af9-5274-0e712242b167	5295	Branik
00050000-5579-4af9-a64c-39a496b47f0a	3314	Braslovče
00050000-5579-4af9-5ace-290a12c4888c	5223	Breginj
00050000-5579-4af9-2c55-86d39d5629f6	8280	Brestanica
00050000-5579-4af9-054e-854da146fe55	2354	Bresternica
00050000-5579-4af9-1d11-ad029f1c7a40	4243	Brezje
00050000-5579-4af9-4122-cc5b65bc49d1	1351	Brezovica pri Ljubljani
00050000-5579-4af9-4f18-65c971319dc3	8250	Brežice
00050000-5579-4af9-7443-1cbb63364723	4210	Brnik - Aerodrom
00050000-5579-4af9-86fe-1d2b4d5e97e2	8321	Brusnice
00050000-5579-4af9-7413-5756c7ce13d1	3255	Buče
00050000-5579-4af9-05dc-822a81ed44af	8276	Bučka 
00050000-5579-4af9-b862-d5ad03c63115	9261	Cankova
00050000-5579-4af9-97a1-b5f75966fa8c	3000	Celje 
00050000-5579-4af9-410d-58211a57b66e	3001	Celje - poštni predali
00050000-5579-4af9-f131-fd686d791b32	4207	Cerklje na Gorenjskem
00050000-5579-4af9-2837-987a0c95816b	8263	Cerklje ob Krki
00050000-5579-4af9-c310-2146d8ea2443	1380	Cerknica
00050000-5579-4af9-6bc1-674568fa6d4b	5282	Cerkno
00050000-5579-4af9-45ee-a106bc6fb940	2236	Cerkvenjak
00050000-5579-4af9-81f9-b6c4c04cc20b	2215	Ceršak
00050000-5579-4af9-95dc-f871be7e1756	2326	Cirkovce
00050000-5579-4af9-557a-7aac67a6990e	2282	Cirkulane
00050000-5579-4af9-5ff3-0a20102bef7e	5273	Col
00050000-5579-4af9-3825-088b59642de8	8251	Čatež ob Savi
00050000-5579-4af9-c2cc-4b573192bb72	1413	Čemšenik
00050000-5579-4af9-07a7-6521e3677000	5253	Čepovan
00050000-5579-4af9-5d6e-d7db6a46bfd3	9232	Črenšovci
00050000-5579-4af9-aaac-df7b5fb181b8	2393	Črna na Koroškem
00050000-5579-4af9-4eac-692c189b0d47	6275	Črni Kal
00050000-5579-4af9-f162-86902f36225e	5274	Črni Vrh nad Idrijo
00050000-5579-4af9-7431-3a2792d104c4	5262	Črniče
00050000-5579-4af9-6ab0-450504794a13	8340	Črnomelj
00050000-5579-4af9-80b6-283639caccf0	6271	Dekani
00050000-5579-4af9-5652-1710f327976a	5210	Deskle
00050000-5579-4af9-f1fd-5098bf9d6274	2253	Destrnik
00050000-5579-4af9-1bdc-c23c9cf2ca56	6215	Divača
00050000-5579-4af9-490f-02e6ba695ed2	1233	Dob
00050000-5579-4af9-c6b1-2c774e5d8762	3224	Dobje pri Planini
00050000-5579-4af9-02f1-15fe9eb28724	8257	Dobova
00050000-5579-4af9-7751-0bd3836469e1	1423	Dobovec
00050000-5579-4af9-56c8-d216c6adf567	5263	Dobravlje
00050000-5579-4af9-1614-d519e7e9fa13	3204	Dobrna
00050000-5579-4af9-0c2f-29d63b13a9f5	8211	Dobrnič
00050000-5579-4af9-4910-8a14602e598c	1356	Dobrova
00050000-5579-4af9-e646-f72829b2f013	9223	Dobrovnik/Dobronak 
00050000-5579-4af9-29a4-3bafca9608f5	5212	Dobrovo v Brdih
00050000-5579-4af9-8e74-778d55305a07	1431	Dol pri Hrastniku
00050000-5579-4af9-6329-1039aa8f9a63	1262	Dol pri Ljubljani
00050000-5579-4af9-859e-da9260d9a90b	1273	Dole pri Litiji
00050000-5579-4af9-c494-83525ac2ecd5	1331	Dolenja vas
00050000-5579-4af9-6f2b-681df3e8b062	8350	Dolenjske Toplice
00050000-5579-4af9-5f72-6ea098f94d9d	1230	Domžale
00050000-5579-4af9-7c89-ca5f4542d60d	2252	Dornava
00050000-5579-4af9-e60d-8a8a8133ee41	5294	Dornberk
00050000-5579-4af9-aba3-4e8db966eea9	1319	Draga
00050000-5579-4af9-4772-c91c3afc1329	8343	Dragatuš
00050000-5579-4af9-d317-cbd13ff46c98	3222	Dramlje
00050000-5579-4af9-683c-586feb7fd9c9	2370	Dravograd
00050000-5579-4af9-21d2-c71687730e6e	4203	Duplje
00050000-5579-4af9-01e2-6c6c092891c6	6221	Dutovlje
00050000-5579-4af9-d996-9c8128d3f132	8361	Dvor
00050000-5579-4af9-fbe0-f194cfea8549	2343	Fala
00050000-5579-4af9-e5a3-db5502ca9017	9208	Fokovci
00050000-5579-4af9-a368-48bc74f6cab1	2313	Fram
00050000-5579-4af9-56f0-d48c13e5df8f	3213	Frankolovo
00050000-5579-4af9-12e7-4b6853f12c28	1274	Gabrovka
00050000-5579-4af9-abe8-b61c909599db	8254	Globoko
00050000-5579-4af9-e25e-0cfe387a22b7	5275	Godovič
00050000-5579-4af9-73bc-5b0064028261	4204	Golnik
00050000-5579-4af9-5ddb-a5d7f33fd10c	3303	Gomilsko
00050000-5579-4af9-2d5e-9d50f8b6e474	4224	Gorenja vas
00050000-5579-4af9-cf26-a93d6e11574d	3263	Gorica pri Slivnici
00050000-5579-4af9-4575-d524d25491e9	2272	Gorišnica
00050000-5579-4af9-6711-7f8a75c55f55	9250	Gornja Radgona
00050000-5579-4af9-87c6-51ebc2452f5a	3342	Gornji Grad
00050000-5579-4af9-7cbd-b3b59148d7d2	4282	Gozd Martuljek
00050000-5579-4af9-33e6-c45205d41b00	6272	Gračišče
00050000-5579-4af9-9b10-2d2664cf2384	9264	Grad
00050000-5579-4af9-ba17-b3a676b1fd6a	8332	Gradac
00050000-5579-4af9-a544-ed3153e3bb70	1384	Grahovo
00050000-5579-4af9-0ca7-2e0ca0c99f47	5242	Grahovo ob Bači
00050000-5579-4af9-d94f-859bd49c6f6f	5251	Grgar
00050000-5579-4af9-b7bd-07c2d7d24285	3302	Griže
00050000-5579-4af9-03ba-cdc57754981d	3231	Grobelno
00050000-5579-4af9-2096-2c8cedcdd385	1290	Grosuplje
00050000-5579-4af9-ca31-f86257bb0639	2288	Hajdina
00050000-5579-4af9-a620-d7a3f00019b2	8362	Hinje
00050000-5579-4af9-fd90-681269065ec7	2311	Hoče
00050000-5579-4af9-5d62-54fb804c41c6	9205	Hodoš/Hodos
00050000-5579-4af9-6c57-74c4148c718f	1354	Horjul
00050000-5579-4af9-f156-bdd160570471	1372	Hotedršica
00050000-5579-4af9-da94-64d20df894eb	1430	Hrastnik
00050000-5579-4af9-9ccd-20e3ddea9d86	6225	Hruševje
00050000-5579-4af9-174e-5a03d5f8362b	4276	Hrušica
00050000-5579-4af9-5271-59c6c1ff3891	5280	Idrija
00050000-5579-4af9-ff55-8cbabca66216	1292	Ig
00050000-5579-4af9-30ec-9444aafab3e4	6250	Ilirska Bistrica
00050000-5579-4af9-6166-e87cf5d9f78a	6251	Ilirska Bistrica-Trnovo
00050000-5579-4af9-c281-dece6d22add2	1295	Ivančna Gorica
00050000-5579-4af9-d8fe-cbb55642f5ab	2259	Ivanjkovci
00050000-5579-4af9-c49b-a8752494f8ac	1411	Izlake
00050000-5579-4af9-375f-a768951c3ff1	6310	Izola/Isola
00050000-5579-4af9-8408-dddb9b0e5211	2222	Jakobski Dol
00050000-5579-4af9-7963-27cb74909e86	2221	Jarenina
00050000-5579-4af9-7bb4-aa1134a1dda3	6254	Jelšane
00050000-5579-4af9-537d-e1f7dc52bb48	4270	Jesenice
00050000-5579-4af9-24b3-986652202305	8261	Jesenice na Dolenjskem
00050000-5579-4af9-1708-665c018e5499	3273	Jurklošter
00050000-5579-4af9-306c-24702bc65e84	2223	Jurovski Dol
00050000-5579-4af9-3dab-74fa56077ec6	2256	Juršinci
00050000-5579-4af9-f032-030b41774984	5214	Kal nad Kanalom
00050000-5579-4af9-0239-b4fd2b5f3bf4	3233	Kalobje
00050000-5579-4af9-a070-26d0ddf36d4f	4246	Kamna Gorica
00050000-5579-4af9-3bbf-13ace702f505	2351	Kamnica
00050000-5579-4af9-84ec-97ef9f2b84d4	1241	Kamnik
00050000-5579-4af9-d386-99f845abc988	5213	Kanal
00050000-5579-4af9-b103-011e9dd8fd47	8258	Kapele
00050000-5579-4af9-9ced-bce818bb6530	2362	Kapla
00050000-5579-4af9-be57-dcad8d9a695f	2325	Kidričevo
00050000-5579-4af9-e244-2aad6d99758b	1412	Kisovec
00050000-5579-4af9-d92e-6bc77ac86f67	6253	Knežak
00050000-5579-4af9-9b9a-6e6717daebb8	5222	Kobarid
00050000-5579-4af9-8552-4616ac3526c9	9227	Kobilje
00050000-5579-4af9-e2a1-c4b34fd5b018	1330	Kočevje
00050000-5579-4af9-7334-ef67abbb1cf6	1338	Kočevska Reka
00050000-5579-4af9-68f6-998077a3c466	2276	Kog
00050000-5579-4af9-dd98-515fd8d933f2	5211	Kojsko
00050000-5579-4af9-44e2-2fb53a6b68aa	6223	Komen
00050000-5579-4af9-e61d-b7e11398a74b	1218	Komenda
00050000-5579-4af9-3e38-d5a000501de2	6000	Koper/Capodistria 
00050000-5579-4af9-750e-d5e3b20d52e7	6001	Koper/Capodistria - poštni predali
00050000-5579-4af9-f87d-3eca9aec379f	8282	Koprivnica
00050000-5579-4af9-9495-54aa56f376ad	5296	Kostanjevica na Krasu
00050000-5579-4af9-ed9f-935d00e3a723	8311	Kostanjevica na Krki
00050000-5579-4af9-86dd-63a1005e0554	1336	Kostel
00050000-5579-4af9-c78a-cb092fba13b1	6256	Košana
00050000-5579-4af9-a256-f76d11dae291	2394	Kotlje
00050000-5579-4af9-0718-91cbff8f4d2a	6240	Kozina
00050000-5579-4af9-8899-8abaea040681	3260	Kozje
00050000-5579-4af9-21fa-2c457719c763	4000	Kranj 
00050000-5579-4af9-836e-46d03a4ca059	4001	Kranj - poštni predali
00050000-5579-4af9-0ee9-57053a20cd87	4280	Kranjska Gora
00050000-5579-4af9-e549-6227d38bbe3a	1281	Kresnice
00050000-5579-4af9-f14e-936dcab6d3c0	4294	Križe
00050000-5579-4af9-2323-ac0619b8e498	9206	Križevci
00050000-5579-4af9-4d47-674543cff7f8	9242	Križevci pri Ljutomeru
00050000-5579-4af9-6f81-828e783c6ba5	1301	Krka
00050000-5579-4af9-e17f-6d660f3634eb	8296	Krmelj
00050000-5579-4af9-62f7-df48e522a4cd	4245	Kropa
00050000-5579-4af9-db52-da82f50d354c	8262	Krška vas
00050000-5579-4af9-ccd4-c9415821f42b	8270	Krško
00050000-5579-4af9-902d-526848f90d83	9263	Kuzma
00050000-5579-4af9-24c6-d78a1b99e712	2318	Laporje
00050000-5579-4af9-1a13-d0765adc4959	3270	Laško
00050000-5579-4af9-8a71-1da748c51490	1219	Laze v Tuhinju
00050000-5579-4af9-0432-0b728a05d68c	2230	Lenart v Slovenskih goricah
00050000-5579-4af9-817f-fb3961dad4c5	9220	Lendava/Lendva
00050000-5579-4af9-aae1-cb3b0d8800d2	4248	Lesce
00050000-5579-4af9-7c15-a7a17676cb80	3261	Lesično
00050000-5579-4af9-4402-84fc215f39ec	8273	Leskovec pri Krškem
00050000-5579-4af9-ba90-e784c0b84741	2372	Libeliče
00050000-5579-4af9-b5b4-4bc1e71b6e87	2341	Limbuš
00050000-5579-4af9-7297-e5055ef4614e	1270	Litija
00050000-5579-4af9-7175-23fff24d4fea	3202	Ljubečna
00050000-5579-4af9-9bf9-7d74e5bb4529	1000	Ljubljana 
00050000-5579-4af9-de7e-9fa0a34c5fb8	1001	Ljubljana - poštni predali
00050000-5579-4af9-4e0b-91df49a8bc06	1231	Ljubljana - Črnuče
00050000-5579-4af9-6f95-2c5c453925e9	1261	Ljubljana - Dobrunje
00050000-5579-4af9-b424-456649febc5c	1260	Ljubljana - Polje
00050000-5579-4af9-20d6-953185919c53	1210	Ljubljana - Šentvid
00050000-5579-4af9-85d4-57b85d53d728	1211	Ljubljana - Šmartno
00050000-5579-4af9-5535-6962a41b2bb1	3333	Ljubno ob Savinji
00050000-5579-4af9-6ac5-4cf970710ff3	9240	Ljutomer
00050000-5579-4af9-4b9a-083aee53d1d6	3215	Loče
00050000-5579-4af9-833d-96667256bf53	5231	Log pod Mangartom
00050000-5579-4af9-3b59-1a85dd380485	1358	Log pri Brezovici
00050000-5579-4af9-857b-f2533cb63ed8	1370	Logatec
00050000-5579-4af9-f6f7-af29b6ff4291	1371	Logatec
00050000-5579-4af9-f0b6-1811325e39d7	1434	Loka pri Zidanem Mostu
00050000-5579-4af9-9d13-dd1e0519ed79	3223	Loka pri Žusmu
00050000-5579-4af9-1ad6-b9292a3f6047	6219	Lokev
00050000-5579-4af9-c2d0-12a0a258c6df	1318	Loški Potok
00050000-5579-4af9-e5e5-571d0a9a9dd5	2324	Lovrenc na Dravskem polju
00050000-5579-4af9-2ac9-b1780cf50ba1	2344	Lovrenc na Pohorju
00050000-5579-4af9-84dd-50389c6f94ba	3334	Luče
00050000-5579-4af9-dc4b-a7285d8d0389	1225	Lukovica
00050000-5579-4af9-9c3f-c63321f9a05e	9202	Mačkovci
00050000-5579-4af9-8e9a-b4447d0efd2b	2322	Majšperk
00050000-5579-4af9-b17e-66063719d513	2321	Makole
00050000-5579-4af9-bfdd-6ea8c7d9020e	9243	Mala Nedelja
00050000-5579-4af9-68c4-34d73a6a6191	2229	Malečnik
00050000-5579-4af9-a49c-60551e69cd48	6273	Marezige
00050000-5579-4af9-51aa-a91b6bd00146	2000	Maribor 
00050000-5579-4af9-cc5f-200221a55c3d	2001	Maribor - poštni predali
00050000-5579-4af9-da6c-11f3873fce65	2206	Marjeta na Dravskem polju
00050000-5579-4af9-9762-cc2802a64d18	2281	Markovci
00050000-5579-4af9-9bff-f8520fac82c3	9221	Martjanci
00050000-5579-4af9-ccd6-ae425b3a9103	6242	Materija
00050000-5579-4af9-535e-849671bc290b	4211	Mavčiče
00050000-5579-4af9-b2ca-7da2aa45d81e	1215	Medvode
00050000-5579-4af9-d4c2-b63ff34fd7fa	1234	Mengeš
00050000-5579-4af9-7b6b-b25bcb4893b1	8330	Metlika
00050000-5579-4af9-13f1-2666346e89df	2392	Mežica
00050000-5579-4af9-3c31-8437b29ffcef	2204	Miklavž na Dravskem polju
00050000-5579-4af9-0f34-a839bfd4d32d	2275	Miklavž pri Ormožu
00050000-5579-4af9-7c30-c113553058b7	5291	Miren
00050000-5579-4af9-fc97-b895fdf8ad3a	8233	Mirna
00050000-5579-4af9-5ea0-3e672591bdf6	8216	Mirna Peč
00050000-5579-4af9-e029-c624b804b173	2382	Mislinja
00050000-5579-4af9-de58-3748e6295425	4281	Mojstrana
00050000-5579-4af9-73ff-544ebcf69782	8230	Mokronog
00050000-5579-4af9-8bb1-c8a7391bbcdd	1251	Moravče
00050000-5579-4af9-bf9b-de3ee6ba372b	9226	Moravske Toplice
00050000-5579-4af9-7892-3ad437c912da	5216	Most na Soči
00050000-5579-4af9-1abe-9226ed57908b	1221	Motnik
00050000-5579-4af9-ad44-e545607a03d7	3330	Mozirje
00050000-5579-4af9-e9f2-d64a8d258ad2	9000	Murska Sobota 
00050000-5579-4af9-5204-029eb6591827	9001	Murska Sobota - poštni predali
00050000-5579-4af9-46ba-f71019cd473e	2366	Muta
00050000-5579-4af9-1635-700e398feedf	4202	Naklo
00050000-5579-4af9-3238-56523e6c858b	3331	Nazarje
00050000-5579-4af9-8770-268a4119346b	1357	Notranje Gorice
00050000-5579-4af9-0adf-412e85421c87	3203	Nova Cerkev
00050000-5579-4af9-b86d-1b85f3447fb8	5000	Nova Gorica 
00050000-5579-4af9-701d-6fc10e6344de	5001	Nova Gorica - poštni predali
00050000-5579-4af9-40ec-aaaca4ab4a06	1385	Nova vas
00050000-5579-4af9-0787-d708308e4a16	8000	Novo mesto
00050000-5579-4af9-e34c-b03cfd86730a	8001	Novo mesto - poštni predali
00050000-5579-4af9-2d6d-a0738292c723	6243	Obrov
00050000-5579-4af9-6af3-12a71721ef1e	9233	Odranci
00050000-5579-4af9-5bc7-5d005b66ccba	2317	Oplotnica
00050000-5579-4af9-baa4-1a5e73e5faae	2312	Orehova vas
00050000-5579-4af9-0e4b-e0c9a3b739b9	2270	Ormož
00050000-5579-4af9-3369-c2590f8d54d1	1316	Ortnek
00050000-5579-4af9-208e-011897d78fca	1337	Osilnica
00050000-5579-4af9-30ae-2ac4206bb71e	8222	Otočec
00050000-5579-4af9-1125-a634655e9693	2361	Ožbalt
00050000-5579-4af9-c128-651e15e46a9b	2231	Pernica
00050000-5579-4af9-f373-8bd121796256	2211	Pesnica pri Mariboru
00050000-5579-4af9-d5b1-484c10b6cddd	9203	Petrovci
00050000-5579-4af9-f537-e825dab70ba7	3301	Petrovče
00050000-5579-4af9-185e-93c424f95c55	6330	Piran/Pirano
00050000-5579-4af9-9cdf-ecb59698bdef	8255	Pišece
00050000-5579-4af9-02af-a4757a561677	6257	Pivka
00050000-5579-4af9-41c8-4706a0fc3122	6232	Planina
00050000-5579-4af9-591c-4500e2d6217b	3225	Planina pri Sevnici
00050000-5579-4af9-1f6e-b8519ff805cb	6276	Pobegi
00050000-5579-4af9-65cc-a4636ce0c7b6	8312	Podbočje
00050000-5579-4af9-5c81-0d5a7060e50a	5243	Podbrdo
00050000-5579-4af9-592c-5a193c91e52b	3254	Podčetrtek
00050000-5579-4af9-0e20-25be6f853a78	2273	Podgorci
00050000-5579-4af9-c0e8-7b869ae3b67f	6216	Podgorje
00050000-5579-4af9-e65c-f72b77329339	2381	Podgorje pri Slovenj Gradcu
00050000-5579-4af9-47dc-c962ee9f09aa	6244	Podgrad
00050000-5579-4af9-8907-3344278d6eff	1414	Podkum
00050000-5579-4af9-ba5f-96c74b86eaed	2286	Podlehnik
00050000-5579-4af9-61cd-7774407ac541	5272	Podnanos
00050000-5579-4af9-cc69-140c079ebf05	4244	Podnart
00050000-5579-4af9-4014-6c1f9f5cb47b	3241	Podplat
00050000-5579-4af9-fe7a-2a683e7b7073	3257	Podsreda
00050000-5579-4af9-f8b6-fb22c3098a1a	2363	Podvelka
00050000-5579-4af9-2de3-4c4a2b265ec6	2208	Pohorje
00050000-5579-4af9-1f10-a773090eaf25	2257	Polenšak
00050000-5579-4af9-742e-e6ed62f8804b	1355	Polhov Gradec
00050000-5579-4af9-f16d-d61434765ee5	4223	Poljane nad Škofjo Loko
00050000-5579-4af9-f87c-c0399c7f4aee	2319	Poljčane
00050000-5579-4af9-1e87-f9d00bf7a4c4	1272	Polšnik
00050000-5579-4af9-2e94-69e0ff95a8ba	3313	Polzela
00050000-5579-4af9-19d9-fd3b170aa284	3232	Ponikva
00050000-5579-4af9-c69f-a72fe9102f2c	6320	Portorož/Portorose
00050000-5579-4af9-2ea2-0f0bf141357d	6230	Postojna
00050000-5579-4af9-54af-fc2c5a8a6db4	2331	Pragersko
00050000-5579-4af9-fbe7-a450587aa87e	3312	Prebold
00050000-5579-4af9-d268-c321331dd7d2	4205	Preddvor
00050000-5579-4af9-3577-c8e5b1314b7c	6255	Prem
00050000-5579-4af9-daf6-3bae97d15f10	1352	Preserje
00050000-5579-4af9-1dc3-b0c0b6fccc37	6258	Prestranek
00050000-5579-4af9-d985-373f4d3fae20	2391	Prevalje
00050000-5579-4af9-cd5e-3f1a5294aa86	3262	Prevorje
00050000-5579-4af9-adbc-8f65c1f2ee0a	1276	Primskovo 
00050000-5579-4af9-3321-1d333a3ea995	3253	Pristava pri Mestinju
00050000-5579-4af9-16f5-1a01628cdcca	9207	Prosenjakovci/Partosfalva
00050000-5579-4af9-6d7b-1c15cf755b25	5297	Prvačina
00050000-5579-4af9-4ad3-409e68afd74e	2250	Ptuj
00050000-5579-4af9-f3f9-f075dfd4814c	2323	Ptujska Gora
00050000-5579-4af9-67f8-cb192c9b1b15	9201	Puconci
00050000-5579-4af9-1e26-22b0836e3445	2327	Rače
00050000-5579-4af9-e5ff-47d3c42cda9b	1433	Radeče
00050000-5579-4af9-2240-1c3f0184c8ed	9252	Radenci
00050000-5579-4af9-982e-d3fe8403b89a	2360	Radlje ob Dravi
00050000-5579-4af9-3719-494df71efd8c	1235	Radomlje
00050000-5579-4af9-6ba1-f497391c1960	4240	Radovljica
00050000-5579-4af9-da6f-aefd6146ad4d	8274	Raka
00050000-5579-4af9-d110-2b63f427ba03	1381	Rakek
00050000-5579-4af9-a3e0-d935eae2d64e	4283	Rateče - Planica
00050000-5579-4af9-e62f-73c91562ea49	2390	Ravne na Koroškem
00050000-5579-4af9-d965-a59d78b80067	9246	Razkrižje
00050000-5579-4af9-e236-f4a8f4564c03	3332	Rečica ob Savinji
00050000-5579-4af9-568c-e2e8218a7799	5292	Renče
00050000-5579-4af9-efe6-e5ed0c296fc5	1310	Ribnica
00050000-5579-4af9-6b01-16d18bf470c8	2364	Ribnica na Pohorju
00050000-5579-4af9-54db-df9e195e4eb0	3272	Rimske Toplice
00050000-5579-4af9-64d0-20c2f672b14b	1314	Rob
00050000-5579-4af9-75e0-d7b0c46c1d39	5215	Ročinj
00050000-5579-4af9-1d66-600d8ace1704	3250	Rogaška Slatina
00050000-5579-4af9-285c-0e024b0a8770	9262	Rogašovci
00050000-5579-4af9-2c59-00cf027ec504	3252	Rogatec
00050000-5579-4af9-a57e-b91976af8f36	1373	Rovte
00050000-5579-4af9-c0b8-1db03b7958f9	2342	Ruše
00050000-5579-4af9-b7a9-63f5ba6d21d3	1282	Sava
00050000-5579-4af9-48a3-9615f02e0a6a	6333	Sečovlje/Sicciole
00050000-5579-4af9-2f00-de8693c7e4ef	4227	Selca
00050000-5579-4af9-06f6-adbbf6c9797a	2352	Selnica ob Dravi
00050000-5579-4af9-8b0e-6c14b806b8e6	8333	Semič
00050000-5579-4af9-6766-c6cae9242ae4	8281	Senovo
00050000-5579-4af9-df1e-f3896f437575	6224	Senožeče
00050000-5579-4af9-25af-28e713afa9ea	8290	Sevnica
00050000-5579-4af9-a063-ca26d1e508cd	6210	Sežana
00050000-5579-4af9-2ce4-89d39a680d6d	2214	Sladki Vrh
00050000-5579-4af9-c221-3d7504ab4b1f	5283	Slap ob Idrijci
00050000-5579-4af9-d7a4-606c2c523639	2380	Slovenj Gradec
00050000-5579-4af9-6ae1-7d918ebca5c0	2310	Slovenska Bistrica
00050000-5579-4af9-4b48-947f0d4da819	3210	Slovenske Konjice
00050000-5579-4af9-aa39-cd8234909f41	1216	Smlednik
00050000-5579-4af9-baf0-fea2ed772f21	5232	Soča
00050000-5579-4af9-5b3d-dbe528602ac0	1317	Sodražica
00050000-5579-4af9-ae5c-40418fae65cd	3335	Solčava
00050000-5579-4af9-6ebd-ee4353a1651e	5250	Solkan
00050000-5579-4af9-8cd8-39444d94d514	4229	Sorica
00050000-5579-4af9-f167-0812adf9a7f8	4225	Sovodenj
00050000-5579-4af9-8241-a1906e570c90	5281	Spodnja Idrija
00050000-5579-4af9-68a5-8a44fca2de3e	2241	Spodnji Duplek
00050000-5579-4af9-8b5a-cb2b9d6d3b8e	9245	Spodnji Ivanjci
00050000-5579-4af9-1e93-e7849f0e041c	2277	Središče ob Dravi
00050000-5579-4af9-271b-a8e0a8313c54	4267	Srednja vas v Bohinju
00050000-5579-4af9-f71d-e6ba8b5caeb2	8256	Sromlje 
00050000-5579-4af9-8a05-1d1461750d3d	5224	Srpenica
00050000-5579-4af9-8f68-c23bee099cc6	1242	Stahovica
00050000-5579-4af9-fb71-06097a8dafc1	1332	Stara Cerkev
00050000-5579-4af9-4bbe-629bef50f0d6	8342	Stari trg ob Kolpi
00050000-5579-4af9-8565-8e9a42dbeb21	1386	Stari trg pri Ložu
00050000-5579-4af9-5a77-2da5ee97e994	2205	Starše
00050000-5579-4af9-9ec2-bef56e6bf727	2289	Stoperce
00050000-5579-4af9-1141-e97f60fb3c93	8322	Stopiče
00050000-5579-4af9-74a3-ac391e0d2af8	3206	Stranice
00050000-5579-4af9-15d3-21d345c4c9bc	8351	Straža
00050000-5579-4af9-085e-49ce3bbed0bf	1313	Struge
00050000-5579-4af9-18c1-f53a91c2db6c	8293	Studenec
00050000-5579-4af9-9e3e-e823ef3a0fdc	8331	Suhor
00050000-5579-4af9-a647-ffcaa878f518	2233	Sv. Ana v Slovenskih goricah
00050000-5579-4af9-5bc9-7c00c5f6a75c	2235	Sv. Trojica v Slovenskih goricah
00050000-5579-4af9-8601-aba92bc96ddf	2353	Sveti Duh na Ostrem Vrhu
00050000-5579-4af9-ab86-82cdeb6e0791	9244	Sveti Jurij ob Ščavnici
00050000-5579-4af9-6544-2f2123164e16	3264	Sveti Štefan
00050000-5579-4af9-3de6-e1810e34128c	2258	Sveti Tomaž
00050000-5579-4af9-85ae-944bb7d7d591	9204	Šalovci
00050000-5579-4af9-ea95-58942e20eefb	5261	Šempas
00050000-5579-4af9-48b7-82d947cb1a4d	5290	Šempeter pri Gorici
00050000-5579-4af9-7b63-ccb72f618d54	3311	Šempeter v Savinjski dolini
00050000-5579-4af9-07a9-01d9c190ae78	4208	Šenčur
00050000-5579-4af9-09a3-fbe8eafa7e99	2212	Šentilj v Slovenskih goricah
00050000-5579-4af9-7413-576c1183f3b7	8297	Šentjanž
00050000-5579-4af9-e9a8-ba818fe01f4f	2373	Šentjanž pri Dravogradu
00050000-5579-4af9-4023-dd58cc7218c0	8310	Šentjernej
00050000-5579-4af9-5bac-fd947533ca2d	3230	Šentjur
00050000-5579-4af9-3e69-2931d5871dfa	3271	Šentrupert
00050000-5579-4af9-8df5-c6eddcefdb0e	8232	Šentrupert
00050000-5579-4af9-61b9-ba2124349b5d	1296	Šentvid pri Stični
00050000-5579-4af9-24b0-49c69a41bf1f	8275	Škocjan
00050000-5579-4af9-dfd8-22b8ff41ff44	6281	Škofije
00050000-5579-4af9-649c-a83003371b6d	4220	Škofja Loka
00050000-5579-4af9-de0b-01dc831dae34	3211	Škofja vas
00050000-5579-4af9-9c2d-78f97e09a606	1291	Škofljica
00050000-5579-4af9-9db6-48a5c5b421b8	6274	Šmarje
00050000-5579-4af9-7af1-ec107ed08376	1293	Šmarje - Sap
00050000-5579-4af9-560d-44394c15c4be	3240	Šmarje pri Jelšah
00050000-5579-4af9-00be-e07a04acbcbb	8220	Šmarješke Toplice
00050000-5579-4af9-f05b-5e494de00bd9	2315	Šmartno na Pohorju
00050000-5579-4af9-4457-0da512570aa1	3341	Šmartno ob Dreti
00050000-5579-4af9-5434-a0ed00834bfc	3327	Šmartno ob Paki
00050000-5579-4af9-faeb-424c4a5f9ebe	1275	Šmartno pri Litiji
00050000-5579-4af9-6670-e40a733f0df3	2383	Šmartno pri Slovenj Gradcu
00050000-5579-4af9-b5d7-f4dfeb69537b	3201	Šmartno v Rožni dolini
00050000-5579-4af9-7be5-d45aba88653b	3325	Šoštanj
00050000-5579-4af9-65ef-d455e452085e	6222	Štanjel
00050000-5579-4af9-4a5e-cc73b5325675	3220	Štore
00050000-5579-4af9-ec10-3c2ec71c31d0	3304	Tabor
00050000-5579-4af9-aa6c-c79f4ad5965f	3221	Teharje
00050000-5579-4af9-faa2-bf98aa1b98f1	9251	Tišina
00050000-5579-4af9-b082-029102ca5370	5220	Tolmin
00050000-5579-4af9-04a9-8350e165f91e	3326	Topolšica
00050000-5579-4af9-4dd7-8977f9b025d5	2371	Trbonje
00050000-5579-4af9-d0e4-3aa66fb8abc4	1420	Trbovlje
00050000-5579-4af9-a337-eeb6d7144abf	8231	Trebelno 
00050000-5579-4af9-ef12-120985d626fe	8210	Trebnje
00050000-5579-4af9-d07d-6f28886ac578	5252	Trnovo pri Gorici
00050000-5579-4af9-07b4-c6501ad1b1a0	2254	Trnovska vas
00050000-5579-4af9-3809-870eb9f10c68	1222	Trojane
00050000-5579-4af9-2b49-49f5ca1b7a2d	1236	Trzin
00050000-5579-4af9-b37b-e4294292d923	4290	Tržič
00050000-5579-4af9-3648-6d557f772efe	8295	Tržišče
00050000-5579-4af9-206c-c49a97382ec7	1311	Turjak
00050000-5579-4af9-a337-9454fbc17a3f	9224	Turnišče
00050000-5579-4af9-9c36-a858fd2422e2	8323	Uršna sela
00050000-5579-4af9-7794-0cc8e7d3637b	1252	Vače
00050000-5579-4af9-f938-fc3e65d3040b	3320	Velenje 
00050000-5579-4af9-487d-6368397e9311	3322	Velenje - poštni predali
00050000-5579-4af9-8de6-b1a2f33d4101	8212	Velika Loka
00050000-5579-4af9-44a9-de8423dadd48	2274	Velika Nedelja
00050000-5579-4af9-729e-99b9a65614ff	9225	Velika Polana
00050000-5579-4af9-2a6a-7a2553d310a3	1315	Velike Lašče
00050000-5579-4af9-b907-0f9523e4a19b	8213	Veliki Gaber
00050000-5579-4af9-4a69-3f12d346d69e	9241	Veržej
00050000-5579-4af9-5092-0b97580895d6	1312	Videm - Dobrepolje
00050000-5579-4af9-7dd6-378c7c3ef846	2284	Videm pri Ptuju
00050000-5579-4af9-9bca-c020e818888e	8344	Vinica
00050000-5579-4af9-2833-cb1f17a505c0	5271	Vipava
00050000-5579-4af9-a871-141e25456c51	4212	Visoko
00050000-5579-4af9-d88e-cfa4b81844e4	1294	Višnja Gora
00050000-5579-4af9-fba5-b9441d8af3da	3205	Vitanje
00050000-5579-4af9-fdf9-c40c460b25bb	2255	Vitomarci
00050000-5579-4af9-2442-d5999f1cc1a1	1217	Vodice
00050000-5579-4af9-676c-f421a64087cf	3212	Vojnik\t
00050000-5579-4af9-ea15-bedcd2c0a027	5293	Volčja Draga
00050000-5579-4af9-37c3-654e1300c538	2232	Voličina
00050000-5579-4af9-4f64-abe1b5518eff	3305	Vransko
00050000-5579-4af9-b684-94a1dda27d32	6217	Vremski Britof
00050000-5579-4af9-beaa-21760f0b4782	1360	Vrhnika
00050000-5579-4af9-635c-faff9c9ca53f	2365	Vuhred
00050000-5579-4af9-15df-ef76771eaca8	2367	Vuzenica
00050000-5579-4af9-3465-7187c3d17a94	8292	Zabukovje 
00050000-5579-4af9-a3ff-6bf10651f256	1410	Zagorje ob Savi
00050000-5579-4af9-1c30-0c7126a68dae	1303	Zagradec
00050000-5579-4af9-940a-fb4644430c7f	2283	Zavrč
00050000-5579-4af9-f59e-1d5a00270488	8272	Zdole 
00050000-5579-4af9-a08f-3f09b8f2720d	4201	Zgornja Besnica
00050000-5579-4af9-91ea-9832b6b408c1	2242	Zgornja Korena
00050000-5579-4af9-6567-f84f91a8323b	2201	Zgornja Kungota
00050000-5579-4af9-15ea-63860424bafb	2316	Zgornja Ložnica
00050000-5579-4af9-236c-d3214a68fa4e	2314	Zgornja Polskava
00050000-5579-4af9-f49a-ae8c46da035e	2213	Zgornja Velka
00050000-5579-4af9-ff76-3acaab01e6f0	4247	Zgornje Gorje
00050000-5579-4af9-4059-4b83c6d2ed4a	4206	Zgornje Jezersko
00050000-5579-4af9-e781-8eb114abd2b8	2285	Zgornji Leskovec
00050000-5579-4af9-0d57-ce0ff14430d9	1432	Zidani Most
00050000-5579-4af9-4a48-3f699d13497d	3214	Zreče
00050000-5579-4af9-a4f0-f5bff4461cb3	4209	Žabnica
00050000-5579-4af9-6d55-03f7bc3f22cc	3310	Žalec
00050000-5579-4af9-7041-667b1fe868c2	4228	Železniki
00050000-5579-4af9-9eee-25eb65fdb9bf	2287	Žetale
00050000-5579-4af9-c182-b06669f5f83d	4226	Žiri
00050000-5579-4af9-0850-7ea9940dff50	4274	Žirovnica
00050000-5579-4af9-8dfd-83872f93e988	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 6949098)
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
-- TOC entry 2832 (class 0 OID 6948909)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6948987)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6949110)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 6949230)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 6949283)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5579-4afb-d962-6021c0d66900	00080000-5579-4afb-3a5c-710c94a3d417	0987	A
00190000-5579-4afb-5f09-1242865eca07	00080000-5579-4afa-70bf-18927cb70d47	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 6949398)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 6949461)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 6949411)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 6949430)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6949139)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5579-4afa-9c9d-0f88d70f176f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5579-4afa-b0ca-094577e32d69	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5579-4afa-8c6d-d8f95011df89	0003	Kazinska	t	84	Kazinska dvorana
00220000-5579-4afa-f29b-060e56f8b497	0004	Mali oder	t	24	Mali oder 
00220000-5579-4afa-ac39-bd4362a432b5	0005	Komorni oder	t	15	Komorni oder
00220000-5579-4afa-caba-4c772f08da55	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5579-4afa-ec18-e9543c363e02	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 6949083)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6949073)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6949272)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 6949207)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6948781)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5579-4afa-1b3f-284ffa22aeba	00010000-5579-4afa-0da3-e97a018d6770	2015-06-11 10:46:51	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROUU9uEdf7Y741YEBS.cJFDzzZ.AUOmDu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2857 (class 0 OID 6949149)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6948819)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5579-4afa-55d3-c1bbd946c4e7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5579-4afa-cd55-efbf73db92d8	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5579-4afa-291a-b5b4d95b027d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5579-4afa-970f-569d7053f74b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5579-4afa-6543-ba3703cf5d11	planer	Planer dogodkov v koledarju	t
00020000-5579-4afa-bb9a-24c7131182cd	kadrovska	Kadrovska služba	t
00020000-5579-4afa-6616-7ab5272ec218	arhivar	Ažuriranje arhivalij	t
00020000-5579-4afa-7d03-4c02a26ca3fa	igralec	Igralec	t
00020000-5579-4afa-54fd-6efda5efe4cc	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 6948803)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5579-4afa-1b3f-284ffa22aeba	00020000-5579-4afa-291a-b5b4d95b027d
00010000-5579-4afa-0da3-e97a018d6770	00020000-5579-4afa-291a-b5b4d95b027d
\.


--
-- TOC entry 2859 (class 0 OID 6949163)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6949104)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6949054)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 6949494)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5579-4af9-4d76-9416cf2db017	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5579-4af9-a828-f1944e15a339	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5579-4af9-537e-ea1308416eb9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5579-4af9-2a82-6654466797d9	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5579-4af9-9c4b-3e2a1f8b03fb	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 6949486)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5579-4af9-3ca4-292d5d645e51	00230000-5579-4af9-2a82-6654466797d9	popa
00240000-5579-4af9-1461-e7e7ab0f5406	00230000-5579-4af9-2a82-6654466797d9	oseba
00240000-5579-4af9-c2f6-585c0742d224	00230000-5579-4af9-a828-f1944e15a339	prostor
00240000-5579-4af9-d602-f20fdb79259a	00230000-5579-4af9-2a82-6654466797d9	besedilo
00240000-5579-4af9-8d82-0ed34c2c0fa7	00230000-5579-4af9-2a82-6654466797d9	uprizoritev
00240000-5579-4af9-c438-f888f9e73a31	00230000-5579-4af9-2a82-6654466797d9	funkcija
00240000-5579-4af9-c212-229686414b07	00230000-5579-4af9-2a82-6654466797d9	tipfunkcije
00240000-5579-4af9-381e-28e50006759f	00230000-5579-4af9-2a82-6654466797d9	alternacija
00240000-5579-4af9-2f3e-fdbe684205ab	00230000-5579-4af9-4d76-9416cf2db017	pogodba
00240000-5579-4af9-9685-a19c84a00283	00230000-5579-4af9-2a82-6654466797d9	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 6949481)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 6949217)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6948881)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6949060)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5579-4afb-c5f7-96d4e1ef82b9	00180000-5579-4afb-010c-cd3c11d72d74	000c0000-5579-4afb-ce4d-9d5db9208d7f	00090000-5579-4afb-89fb-c04e48b65314	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4afb-c005-155c95b3697c	00180000-5579-4afb-010c-cd3c11d72d74	000c0000-5579-4afb-bc29-6e1a3f14a956	00090000-5579-4afb-250c-9b544704fc9e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4afb-5393-1f12363cfc99	00180000-5579-4afb-010c-cd3c11d72d74	000c0000-5579-4afb-d732-ed25df5d9996	00090000-5579-4afb-873b-069c42653ece	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4afb-ec53-51b84fbf79fb	00180000-5579-4afb-010c-cd3c11d72d74	000c0000-5579-4afb-5b91-ff65d7a6850e	00090000-5579-4afb-dbb4-34cf88d1b9e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4afb-e055-922ee51eb28f	00180000-5579-4afb-010c-cd3c11d72d74	000c0000-5579-4afb-2609-2470bf4b53df	00090000-5579-4afb-e31d-3630d0db1080	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4afb-c43f-fd4066fbd2ba	00180000-5579-4afb-f386-fbefb2e2806d	\N	00090000-5579-4afb-e31d-3630d0db1080	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 6949261)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5579-4af9-4897-dcf191ab2693	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5579-4af9-5359-832c3c9eb0b7	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5579-4af9-57fd-1b3fb55741f5	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5579-4af9-a40d-3e8f5831e995	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5579-4af9-8e96-3674c700b80c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5579-4af9-6072-2659369caf13	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5579-4af9-7c95-bf68f3010dd8	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5579-4af9-a866-7ccef2b16080	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5579-4af9-d67a-37e3b2a8bb66	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5579-4af9-ac15-b23edb843f18	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5579-4af9-e675-a6cce124de6f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5579-4af9-1eaa-51ead2337fc1	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5579-4af9-d57d-17c0fb531b7f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5579-4af9-5bfe-12239249e933	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5579-4af9-ae92-2c8dbfa9059c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5579-4af9-a894-53afd7f903e1	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 6949450)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5579-4af9-319e-6bb09e411fd4	01	Velika predstava	f	1.00	1.00
002b0000-5579-4af9-9de7-6d0b19177670	02	Mala predstava	f	0.50	0.50
002b0000-5579-4af9-6942-8023580e2e02	03	Mala koprodukcija	t	0.40	1.00
002b0000-5579-4af9-7699-12ae98e1b32d	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5579-4af9-d297-5acd9ce935f1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 6948944)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6948790)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5579-4afa-0da3-e97a018d6770	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZu/dSsWyVw1rBIFRBIIpYoD81e.1fHi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5579-4afa-b4c8-894300ebbed4	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5579-4afa-3e6f-8ae3be0c39b2	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5579-4afa-d560-d9c5c4d2b4f4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5579-4afa-92ab-6dbf2d43cbe3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5579-4afa-1925-21e6564173e5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5579-4afa-1cc0-e1fe9592401d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5579-4afa-1b3f-284ffa22aeba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 6949318)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5579-4afb-9ed0-bb72a6753fad	00160000-5579-4afa-03ac-0e7dc10e12f5	00150000-5579-4af9-af8d-202455764090	00140000-5579-4af9-654f-75112cba8a82	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5579-4afa-ac39-bd4362a432b5
000e0000-5579-4afb-b5bb-38109d52b3d0	00160000-5579-4afa-6782-13d3be9a0439	00150000-5579-4af9-6c5b-151061634d64	00140000-5579-4af9-228c-4139c771bd13	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5579-4afa-caba-4c772f08da55
000e0000-5579-4afb-e2f1-f00efebf25d6	\N	00150000-5579-4af9-6c5b-151061634d64	00140000-5579-4af9-228c-4139c771bd13	00190000-5579-4afb-d962-6021c0d66900	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5579-4afa-ac39-bd4362a432b5
000e0000-5579-4afb-4a92-956236982b87	\N	00150000-5579-4af9-6c5b-151061634d64	00140000-5579-4af9-228c-4139c771bd13	00190000-5579-4afb-d962-6021c0d66900	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5579-4afa-ac39-bd4362a432b5
\.


--
-- TOC entry 2840 (class 0 OID 6949006)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5579-4afb-17a3-ca5cf421e9c6	000e0000-5579-4afb-b5bb-38109d52b3d0	1	
00200000-5579-4afb-8161-9d99360f1e8d	000e0000-5579-4afb-b5bb-38109d52b3d0	2	
\.


--
-- TOC entry 2855 (class 0 OID 6949131)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6949200)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6949038)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 6949308)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5579-4af9-654f-75112cba8a82	01	Drama	drama (SURS 01)
00140000-5579-4af9-e4d3-3f071909c509	02	Opera	opera (SURS 02)
00140000-5579-4af9-6dfb-0e20ee1f824b	03	Balet	balet (SURS 03)
00140000-5579-4af9-f86c-15e0ff1309e7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5579-4af9-44fa-480ab97aa45f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5579-4af9-228c-4139c771bd13	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5579-4af9-9779-b9375ed913f4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 6949190)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5579-4af9-3234-f5d562fd521b	01	Opera	opera
00150000-5579-4af9-cfe0-2e5f5a209e0d	02	Opereta	opereta
00150000-5579-4af9-7764-4e7b128a9075	03	Balet	balet
00150000-5579-4af9-d2fb-19655ebec778	04	Plesne prireditve	plesne prireditve
00150000-5579-4af9-b33e-abe9c4dc89bd	05	Lutkovno gledališče	lutkovno gledališče
00150000-5579-4af9-0e33-a2d403e14e79	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5579-4af9-2483-a4f7cb030e4d	07	Biografska drama	biografska drama
00150000-5579-4af9-af8d-202455764090	08	Komedija	komedija
00150000-5579-4af9-37bc-cd928cb58cc3	09	Črna komedija	črna komedija
00150000-5579-4af9-a08e-66306af0eae6	10	E-igra	E-igra
00150000-5579-4af9-6c5b-151061634d64	11	Kriminalka	kriminalka
00150000-5579-4af9-c276-e93681c54f86	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 6948844)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6949365)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6949355)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6949260)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6949028)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6949053)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6948970)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6949394)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6949186)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6949004)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6949047)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6948984)
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
-- TOC entry 2495 (class 2606 OID 6949096)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6949123)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6948942)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6948853)
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
-- TOC entry 2410 (class 2606 OID 6948877)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6948833)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 6948818)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6949129)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6949162)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6949303)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6948906)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6948930)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6949102)
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
-- TOC entry 2425 (class 2606 OID 6948920)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6948991)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6949114)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6949242)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6949288)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6949409)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 6949479)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 6949426)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 6949447)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6949146)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6949087)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6949078)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 6949282)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6949214)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6948789)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6949153)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6948807)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 6948827)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6949171)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6949109)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6949059)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 6949503)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 6949491)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 6949485)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6949227)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 6948886)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6949069)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6949271)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 6949460)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6948955)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6948802)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6949334)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6949013)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6949137)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6949205)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6949042)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6949316)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6949198)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 6949035)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 6949228)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 6949229)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 6948908)
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
-- TOC entry 2508 (class 1259 OID 6949130)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 6949116)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 6949115)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 6949014)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 6949187)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 6949189)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 6949188)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6948986)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6948985)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 6949305)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 6949306)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 6949307)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 6949449)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 6949448)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 6949339)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 6949336)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 6949340)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 6949338)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 6949337)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 6948957)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 6948956)
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
-- TOC entry 2408 (class 1259 OID 6948880)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 6949154)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 6949048)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 6948834)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 6948835)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 6949174)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 6949173)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 6949172)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 6948992)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 6948994)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 6948993)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 6949493)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 6949082)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 6949080)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 6949079)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 6949081)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 6948808)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 6948809)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 6949138)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 6949103)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 6949215)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 6949216)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 6949395)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 6949396)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 6949397)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6948922)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 6948921)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 6948923)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 6949480)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 6949243)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6949244)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 6949369)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 6949371)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 6949367)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 6949370)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 6949368)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 6949206)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 6949091)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 6949090)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 6949088)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 6949089)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 6949357)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 6949356)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 6949410)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 6949005)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 6948855)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 6948854)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 6948887)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6948888)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 6949072)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 6949071)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 6949070)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 6949429)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 6949427)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 6949428)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 6949037)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 6949033)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 6949030)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 6949031)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 6949029)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 6949034)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 6949032)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 6948907)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 6948971)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 6948973)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 6948972)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 6948974)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 6949097)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 6949304)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6949335)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6948878)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 6948879)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 6949199)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 6949504)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6948943)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 6949492)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 6949148)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 6949147)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 6949366)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 6948931)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6949317)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6949289)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 6949290)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6948828)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 6949036)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2648 (class 2606 OID 6949640)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2645 (class 2606 OID 6949625)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2646 (class 2606 OID 6949630)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2650 (class 2606 OID 6949650)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2644 (class 2606 OID 6949620)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 6949645)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 6949635)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 6949795)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 6949800)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 6949555)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6949735)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 6949730)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6949725)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 6949615)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 6949765)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 6949775)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 6949770)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2638 (class 2606 OID 6949590)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6949585)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 6949715)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 6949820)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 6949825)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 6949830)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2707 (class 2606 OID 6949935)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 6949930)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 6949850)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2687 (class 2606 OID 6949835)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 6949855)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 6949845)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2688 (class 2606 OID 6949840)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2636 (class 2606 OID 6949580)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2635 (class 2606 OID 6949575)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2628 (class 2606 OID 6949540)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2627 (class 2606 OID 6949535)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 6949745)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 6949655)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2623 (class 2606 OID 6949515)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2624 (class 2606 OID 6949520)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2672 (class 2606 OID 6949760)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 6949755)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2670 (class 2606 OID 6949750)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2639 (class 2606 OID 6949595)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2641 (class 2606 OID 6949605)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 6949600)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 6949945)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2658 (class 2606 OID 6949690)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2656 (class 2606 OID 6949680)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2655 (class 2606 OID 6949675)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2657 (class 2606 OID 6949685)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2621 (class 2606 OID 6949505)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6949510)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 6949740)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 6949720)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2677 (class 2606 OID 6949785)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2678 (class 2606 OID 6949790)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 6949895)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 6949900)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2701 (class 2606 OID 6949905)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 6949565)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2632 (class 2606 OID 6949560)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2634 (class 2606 OID 6949570)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 6949940)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2681 (class 2606 OID 6949805)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2682 (class 2606 OID 6949810)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 6949880)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 6949890)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2694 (class 2606 OID 6949870)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2697 (class 2606 OID 6949885)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2695 (class 2606 OID 6949875)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 6949780)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 6949710)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2661 (class 2606 OID 6949705)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2659 (class 2606 OID 6949695)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2660 (class 2606 OID 6949700)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2693 (class 2606 OID 6949865)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2692 (class 2606 OID 6949860)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 6949910)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 6949610)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 6949815)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6949530)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 6949525)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2629 (class 2606 OID 6949545)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2630 (class 2606 OID 6949550)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 6949670)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6949665)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2652 (class 2606 OID 6949660)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2705 (class 2606 OID 6949925)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2703 (class 2606 OID 6949915)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 6949920)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-11 10:46:52 CEST

--
-- PostgreSQL database dump complete
--

