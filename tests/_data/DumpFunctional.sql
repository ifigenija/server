--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-15 11:54:08 CEST

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
-- TOC entry 180 (class 1259 OID 7189526)
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
-- TOC entry 227 (class 1259 OID 7190048)
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
-- TOC entry 226 (class 1259 OID 7190031)
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
-- TOC entry 219 (class 1259 OID 7189935)
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
-- TOC entry 194 (class 1259 OID 7189705)
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
-- TOC entry 197 (class 1259 OID 7189739)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7189648)
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
-- TOC entry 228 (class 1259 OID 7190062)
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
-- TOC entry 213 (class 1259 OID 7189865)
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
-- TOC entry 192 (class 1259 OID 7189685)
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
-- TOC entry 196 (class 1259 OID 7189733)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7189665)
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
-- TOC entry 202 (class 1259 OID 7189782)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7189807)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7189622)
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
-- TOC entry 181 (class 1259 OID 7189535)
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
-- TOC entry 182 (class 1259 OID 7189546)
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
-- TOC entry 177 (class 1259 OID 7189500)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7189519)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7189814)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7189845)
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
-- TOC entry 223 (class 1259 OID 7189981)
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
-- TOC entry 184 (class 1259 OID 7189579)
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
-- TOC entry 186 (class 1259 OID 7189614)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7189788)
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
-- TOC entry 185 (class 1259 OID 7189599)
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
-- TOC entry 191 (class 1259 OID 7189677)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7189800)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7189920)
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
-- TOC entry 222 (class 1259 OID 7189973)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7190088)
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
-- TOC entry 233 (class 1259 OID 7190151)
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
-- TOC entry 230 (class 1259 OID 7190101)
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
-- TOC entry 231 (class 1259 OID 7190120)
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
-- TOC entry 209 (class 1259 OID 7189829)
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
-- TOC entry 201 (class 1259 OID 7189773)
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
-- TOC entry 200 (class 1259 OID 7189763)
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
-- TOC entry 221 (class 1259 OID 7189962)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7189897)
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
-- TOC entry 174 (class 1259 OID 7189471)
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
-- TOC entry 173 (class 1259 OID 7189469)
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
-- TOC entry 210 (class 1259 OID 7189839)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7189509)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7189493)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7189853)
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
-- TOC entry 204 (class 1259 OID 7189794)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7189744)
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
-- TOC entry 236 (class 1259 OID 7190184)
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
-- TOC entry 235 (class 1259 OID 7190176)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7190171)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7189907)
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
-- TOC entry 183 (class 1259 OID 7189571)
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
-- TOC entry 199 (class 1259 OID 7189750)
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
-- TOC entry 220 (class 1259 OID 7189951)
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
-- TOC entry 232 (class 1259 OID 7190140)
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
-- TOC entry 188 (class 1259 OID 7189634)
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
-- TOC entry 175 (class 1259 OID 7189480)
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
-- TOC entry 225 (class 1259 OID 7190008)
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
-- TOC entry 193 (class 1259 OID 7189696)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7189821)
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
-- TOC entry 215 (class 1259 OID 7189890)
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
-- TOC entry 195 (class 1259 OID 7189728)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7189998)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7189880)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7189474)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7189526)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7190048)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557e-a0bf-c325-763c887e3de7	000d0000-557e-a0bf-6326-bc92a15ba304	\N	00090000-557e-a0bf-1069-d90a1b94875d	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-a0bf-0949-3e8410c6ff9c	000d0000-557e-a0bf-7a39-bca6d52f0ce4	\N	00090000-557e-a0bf-0553-2834936476f1	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-a0bf-b002-35b8ba8cc348	000d0000-557e-a0bf-ac29-ad2d2146c366	\N	00090000-557e-a0bf-2faf-715f40615345	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-a0bf-0ad7-468896cde4bd	000d0000-557e-a0bf-61d3-adf99b14b927	\N	00090000-557e-a0bf-6e22-3223f7f8d054	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-a0bf-5a05-b25498ad4e0e	000d0000-557e-a0bf-16e0-70778948f134	\N	00090000-557e-a0bf-3902-cf2895f55088	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-a0bf-7291-40b395ad4d26	000d0000-557e-a0bf-f902-c401b3e0eb98	\N	00090000-557e-a0bf-0553-2834936476f1	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7190031)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7189935)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557e-a0be-ac42-33128dc59527	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557e-a0be-6679-2c8b3db27f34	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557e-a0be-4183-2719b12e29b2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7189705)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557e-a0bf-29d9-fd152d7920eb	\N	\N	00200000-557e-a0bf-d59a-d0c08667b13e	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557e-a0bf-96b6-9f9d1e2f0258	\N	\N	00200000-557e-a0bf-4cf3-7fdb400a2baf	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557e-a0bf-5088-517e197ff259	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557e-a0bf-3fce-c56eea25d902	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557e-a0bf-a91a-7bfe49ed1c66	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7189739)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7189648)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557e-a0bd-59f6-36bf4517aa98	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557e-a0bd-1ae7-63baa0a5e3cb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557e-a0bd-42d7-1a58272b1802	AL	ALB	008	Albania 	Albanija	\N
00040000-557e-a0bd-c6bd-8135384cf7c6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557e-a0bd-1eca-c6faa9fb04b8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557e-a0bd-0ca3-de1c2153216b	AD	AND	020	Andorra 	Andora	\N
00040000-557e-a0bd-5515-1c1f37b7b605	AO	AGO	024	Angola 	Angola	\N
00040000-557e-a0bd-9958-c212300a982b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557e-a0bd-bb38-d1293423672b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557e-a0bd-3a4c-34fdf82aa20b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557e-a0bd-0a9d-675861e62025	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557e-a0bd-f226-3594c8f17dc8	AM	ARM	051	Armenia 	Armenija	\N
00040000-557e-a0bd-be57-ad7249ce04f3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557e-a0bd-906b-dc2039bce979	AU	AUS	036	Australia 	Avstralija	\N
00040000-557e-a0bd-7883-f0d128de62d6	AT	AUT	040	Austria 	Avstrija	\N
00040000-557e-a0bd-bbba-39412cb2dca1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557e-a0bd-5356-46ae92e58bef	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557e-a0bd-2f28-235e5b01ef52	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557e-a0bd-0b01-97207739e7cf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557e-a0bd-2c6b-68e879eb9fda	BB	BRB	052	Barbados 	Barbados	\N
00040000-557e-a0bd-fb1d-e23f7b8cd27f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557e-a0bd-e547-61f57c29d693	BE	BEL	056	Belgium 	Belgija	\N
00040000-557e-a0bd-eae2-305954c1d5fc	BZ	BLZ	084	Belize 	Belize	\N
00040000-557e-a0bd-7102-6064a85fa719	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557e-a0bd-0728-46768da85512	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557e-a0bd-ced7-0437b47d4120	BT	BTN	064	Bhutan 	Butan	\N
00040000-557e-a0bd-4213-165827c23bbc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557e-a0bd-95bb-a6e5f604c9c8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557e-a0bd-6f2f-2f362f9dda17	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557e-a0bd-e48c-5b5fe5650b95	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557e-a0bd-9738-db91af089b5b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557e-a0bd-8d33-1a2712bd4d8b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557e-a0bd-7b6a-75920990d4d3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557e-a0bd-1839-fd5ef090fe69	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557e-a0bd-d800-bd26c09e1b04	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557e-a0bd-381f-6d9f7510a1d6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557e-a0bd-cd26-e2f275cd8a17	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557e-a0bd-b5dc-064917831a0e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557e-a0bd-0f07-6341e9b9bc6c	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557e-a0bd-ffa5-e3ec79087a5d	CA	CAN	124	Canada 	Kanada	\N
00040000-557e-a0bd-83bc-71b762ccec99	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557e-a0bd-40ef-20ab1f973ee1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557e-a0bd-5fbc-20c058164937	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557e-a0bd-4e5f-f488dfc131c1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557e-a0bd-50e7-64675ecd2382	CL	CHL	152	Chile 	Čile	\N
00040000-557e-a0bd-6e49-985846d3d182	CN	CHN	156	China 	Kitajska	\N
00040000-557e-a0bd-a042-890195e3b6a9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557e-a0bd-d6ef-92a7ee59e6ee	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557e-a0bd-fae7-a4aa71a7e167	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557e-a0bd-47a3-eeec01a929fc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557e-a0bd-4504-952c9e961d42	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557e-a0bd-7dda-9f8fb0dd62a7	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557e-a0bd-2b71-575e11aa741d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557e-a0bd-c76c-1927df5f3ae8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557e-a0bd-befd-0a5f5fefa9ff	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557e-a0bd-7fbe-94362353e81a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557e-a0bd-0dde-feacaef8e97b	CU	CUB	192	Cuba 	Kuba	\N
00040000-557e-a0bd-5b4f-31470b26003f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557e-a0bd-0faf-43cc3c1e631c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557e-a0bd-1bef-5f75bc1586e3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557e-a0bd-87ba-43e4daaa57a4	DK	DNK	208	Denmark 	Danska	\N
00040000-557e-a0bd-9ed4-c1a08b0cf626	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557e-a0bd-754f-9217091686ac	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557e-a0bd-35da-f81c58de30e2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557e-a0bd-7582-8905df1b5037	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557e-a0bd-da15-e1465ae380f9	EG	EGY	818	Egypt 	Egipt	\N
00040000-557e-a0bd-1323-6e032310c60b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557e-a0bd-3398-c8b9728fc849	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557e-a0bd-9fd3-bf2b51a29918	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557e-a0bd-7b46-fd272fa76193	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557e-a0bd-78fd-251e9ae508cb	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557e-a0bd-f41b-50edbbb462de	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557e-a0bd-f24b-ab8d2798c132	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557e-a0bd-eed5-b13196e71097	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557e-a0bd-23ca-57b112c82f8b	FI	FIN	246	Finland 	Finska	\N
00040000-557e-a0bd-43c4-2a89e81a83b5	FR	FRA	250	France 	Francija	\N
00040000-557e-a0bd-a206-6a3cb13f0a11	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557e-a0bd-1fc0-059ea273ba5d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557e-a0bd-5de6-18d13d557cc2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557e-a0bd-17b2-80a7682c4dce	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557e-a0bd-c9e7-03a1bc92fa1a	GA	GAB	266	Gabon 	Gabon	\N
00040000-557e-a0bd-8dab-9e173d53da36	GM	GMB	270	Gambia 	Gambija	\N
00040000-557e-a0bd-9cbb-e139bab8a490	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557e-a0bd-4a1a-eb580056d307	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557e-a0bd-026a-1864cfc3054f	GH	GHA	288	Ghana 	Gana	\N
00040000-557e-a0bd-b559-53fc9fcfc199	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557e-a0bd-0636-1ddabc4fd2c1	GR	GRC	300	Greece 	Grčija	\N
00040000-557e-a0bd-ecc7-51dfa1070c13	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557e-a0bd-7689-39f98b0b5e97	GD	GRD	308	Grenada 	Grenada	\N
00040000-557e-a0bd-f414-1ac830e3fa2f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557e-a0bd-6d27-0aba36555564	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557e-a0bd-916d-f4818011eb87	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557e-a0bd-f4c4-101e7473dd39	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557e-a0bd-141b-b08cb85573f8	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557e-a0bd-30fa-1678dd33ea26	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557e-a0bd-cbc6-fd8050f19616	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557e-a0bd-e14d-8eba5d63cac6	HT	HTI	332	Haiti 	Haiti	\N
00040000-557e-a0bd-bb58-dfc5289b9c85	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557e-a0bd-b145-c39b815dc698	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557e-a0bd-c1a7-cb51469a8c80	HN	HND	340	Honduras 	Honduras	\N
00040000-557e-a0bd-311d-a45da473c217	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557e-a0bd-fdb0-6cd4a3a5997a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557e-a0bd-8d36-b0da07aa20ce	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557e-a0bd-ca3e-887f0e283548	IN	IND	356	India 	Indija	\N
00040000-557e-a0bd-5751-68e3c5ef0fe2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557e-a0bd-a589-5f890b950118	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557e-a0bd-c40f-5b91b9522327	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557e-a0bd-a0d9-708d4d72f171	IE	IRL	372	Ireland 	Irska	\N
00040000-557e-a0bd-9882-30fbcdf01e49	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557e-a0bd-e682-4bddd7fd06e6	IL	ISR	376	Israel 	Izrael	\N
00040000-557e-a0bd-30f1-666466aee18f	IT	ITA	380	Italy 	Italija	\N
00040000-557e-a0bd-9a0a-034a1606e873	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557e-a0bd-e1b0-ccb3c05ac363	JP	JPN	392	Japan 	Japonska	\N
00040000-557e-a0bd-e058-ae7b8d800cef	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557e-a0bd-0feb-2e4c4c1e8f92	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557e-a0bd-f985-c6c7a8b68e89	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557e-a0bd-5fc6-10bac0cde475	KE	KEN	404	Kenya 	Kenija	\N
00040000-557e-a0bd-ab1d-0597b4aa0154	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557e-a0bd-e8cb-0fa37c6dbe82	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557e-a0bd-a192-8f670368c836	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557e-a0bd-0f06-73fc04b09c5d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557e-a0bd-96ed-916102ed6853	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557e-a0bd-aa43-1d607aac404b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557e-a0bd-635b-dbd87f389c13	LV	LVA	428	Latvia 	Latvija	\N
00040000-557e-a0bd-417a-a3232aadf885	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557e-a0bd-2a5a-c41cd4ec9ba5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557e-a0bd-6bc4-84e6218b5609	LR	LBR	430	Liberia 	Liberija	\N
00040000-557e-a0bd-16cf-0380a6feacc5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557e-a0bd-cadb-fe1c4da7388d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557e-a0bd-7a43-95306e8eb223	LT	LTU	440	Lithuania 	Litva	\N
00040000-557e-a0bd-4216-301e2b8cfa5a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557e-a0bd-84ab-f0359d5e492d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557e-a0bd-bc20-b8a88b1f2e52	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557e-a0bd-0030-1602e335eab7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557e-a0bd-cf40-42f6b29b6efd	MW	MWI	454	Malawi 	Malavi	\N
00040000-557e-a0bd-25bf-9da197edaf39	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557e-a0bd-8ff5-c146f1e50252	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557e-a0bd-c4b7-b6b77c1f1d67	ML	MLI	466	Mali 	Mali	\N
00040000-557e-a0bd-9c1d-a830f3099a55	MT	MLT	470	Malta 	Malta	\N
00040000-557e-a0bd-9807-1419d1bec689	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557e-a0bd-151e-aec2c6c82831	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557e-a0bd-0d2d-4185997333c9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557e-a0bd-23c3-0235075883db	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557e-a0bd-c906-1298c2a026c6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557e-a0bd-24f0-f8817ff8dcb3	MX	MEX	484	Mexico 	Mehika	\N
00040000-557e-a0bd-e443-aeef30a83f3e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557e-a0bd-16ed-5da7caa1daa3	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557e-a0bd-edd8-d7fbf9f9548e	MC	MCO	492	Monaco 	Monako	\N
00040000-557e-a0bd-c242-cf89df34d750	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557e-a0bd-e691-f8e1a0e4d2a9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557e-a0bd-d6d2-68423e18d6f3	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557e-a0bd-341e-96399f3bf9a3	MA	MAR	504	Morocco 	Maroko	\N
00040000-557e-a0bd-e0cf-8ac45ccf619a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557e-a0bd-6a2c-db5c2a0eb8d8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557e-a0bd-af5a-74320f168ac6	NA	NAM	516	Namibia 	Namibija	\N
00040000-557e-a0bd-dc88-82ceb85d26d6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557e-a0bd-40f8-d0ddaec9054e	NP	NPL	524	Nepal 	Nepal	\N
00040000-557e-a0bd-824a-43d7f4488c97	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557e-a0bd-14be-daee1a98a784	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557e-a0bd-aeb7-8097356738d7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557e-a0bd-ae76-e829b1d1ae02	NE	NER	562	Niger 	Niger 	\N
00040000-557e-a0bd-2f52-e44dce476f1d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557e-a0bd-d61f-a060ae7695c7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557e-a0bd-2835-21b2567b2bf2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557e-a0bd-940d-a91bbbffe698	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557e-a0bd-6f61-64b70f17d118	NO	NOR	578	Norway 	Norveška	\N
00040000-557e-a0bd-9545-9f4b8bfe2670	OM	OMN	512	Oman 	Oman	\N
00040000-557e-a0bd-8adf-f7bc73d5e001	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557e-a0bd-1b51-7f542562775f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557e-a0bd-2f98-0682a1b644c5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557e-a0bd-2ca4-e5d2d83b77c8	PA	PAN	591	Panama 	Panama	\N
00040000-557e-a0bd-8539-fc0e0e3ce7cc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557e-a0bd-1d25-7458cde37274	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557e-a0bd-978c-85650d82d05d	PE	PER	604	Peru 	Peru	\N
00040000-557e-a0bd-f219-cc1330c9a1f0	PH	PHL	608	Philippines 	Filipini	\N
00040000-557e-a0bd-f78e-ff77d986aa2e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557e-a0bd-9c72-b370e8d6622c	PL	POL	616	Poland 	Poljska	\N
00040000-557e-a0bd-a43a-eee9ed64c85f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557e-a0bd-c7ed-5a3f8cf1e6ed	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557e-a0bd-2eb5-021469e9c70d	QA	QAT	634	Qatar 	Katar	\N
00040000-557e-a0bd-dae0-173563bedc52	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557e-a0bd-2235-4c6aace55523	RO	ROU	642	Romania 	Romunija	\N
00040000-557e-a0bd-cc83-aef741a66611	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557e-a0bd-a98a-7e05f1a0d347	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557e-a0bd-8fde-bb59538c392e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557e-a0bd-8eaf-763903e3146b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557e-a0bd-9845-101db00fdd17	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557e-a0bd-a378-4c1e6e05bf9c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557e-a0bd-ab8f-ef9457f335a1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557e-a0bd-ea6e-404c127567d9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557e-a0bd-32b0-543b8f07f503	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557e-a0bd-6105-9c93e12f329a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557e-a0bd-4946-2de402589b45	SM	SMR	674	San Marino 	San Marino	\N
00040000-557e-a0bd-8322-78c55d89c41b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557e-a0bd-4e4a-c16f36094a43	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557e-a0bd-d55d-b5e7adc2e05b	SN	SEN	686	Senegal 	Senegal	\N
00040000-557e-a0bd-68cb-43cb140e97ae	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557e-a0bd-edcd-1f617b0cac4e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557e-a0bd-1171-95273f9e801d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557e-a0bd-c4ee-b1670fcfe3c4	SG	SGP	702	Singapore 	Singapur	\N
00040000-557e-a0bd-9c4d-0a5bb61ce6ce	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557e-a0bd-836f-26abaa1ee903	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557e-a0bd-a284-c51c63d348e9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557e-a0bd-004a-7fcae893ca15	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557e-a0bd-9dbb-f942a7389495	SO	SOM	706	Somalia 	Somalija	\N
00040000-557e-a0bd-b30b-a2bfe6861a9c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557e-a0bd-911f-7dbad76ee43e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557e-a0bd-025a-f28e4de306b3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557e-a0bd-8204-db7024ceca82	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557e-a0bd-339a-a61e0652359c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557e-a0bd-302e-8c4cb0cb2d62	SD	SDN	729	Sudan 	Sudan	\N
00040000-557e-a0bd-d96b-1c460084fd24	SR	SUR	740	Suriname 	Surinam	\N
00040000-557e-a0bd-4733-be9d81957a67	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557e-a0bd-175b-5d818e7a7377	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557e-a0bd-c91c-92a66867b292	SE	SWE	752	Sweden 	Švedska	\N
00040000-557e-a0bd-51fb-1f38fbe27ba2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557e-a0bd-d8aa-497fab2a2c91	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557e-a0bd-f12d-5e7cf76f4eff	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557e-a0bd-dbe6-727cbcbee633	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557e-a0bd-98f1-2b011a53d1ff	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557e-a0bd-e650-deb4854f949f	TH	THA	764	Thailand 	Tajska	\N
00040000-557e-a0bd-2287-f2e9c5e96fe0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557e-a0bd-8be9-8dcfd74eb098	TG	TGO	768	Togo 	Togo	\N
00040000-557e-a0bd-def5-caeff5e07897	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557e-a0bd-92be-62332ef50086	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557e-a0bd-6577-186704181f8c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557e-a0bd-cdb1-7950e1b4ddb3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557e-a0bd-34f4-d0537d96f43c	TR	TUR	792	Turkey 	Turčija	\N
00040000-557e-a0bd-d170-9c29529fc041	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557e-a0bd-6383-a7f8a9af5c0d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557e-a0bd-0202-d8a534bcef35	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557e-a0bd-4b28-6e5d0f784f60	UG	UGA	800	Uganda 	Uganda	\N
00040000-557e-a0bd-2170-dc40c7e901e8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557e-a0bd-2e5c-21efb89168a2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557e-a0bd-e48d-5b3e0ffac0cb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557e-a0bd-1464-b638bf77bdd6	US	USA	840	United States 	Združene države Amerike	\N
00040000-557e-a0bd-7a42-e85f5d64b076	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557e-a0bd-2eb3-d2d3505979f1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557e-a0bd-301e-7c1e4112a828	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557e-a0bd-d24e-fbb87d0f380c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557e-a0bd-a61d-305520788f88	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557e-a0bd-6835-16218c7f5d1c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557e-a0bd-15af-99f57c0cf59b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557e-a0bd-538f-a3c4f1942ecd	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557e-a0bd-7727-5540fd3c137a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557e-a0bd-48e8-b45b208223d8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557e-a0bd-e8b8-7f0c5fd37830	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557e-a0bd-aa6c-1074eff89dc8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557e-a0bd-9028-44fc93580b5e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7190062)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7189865)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557e-a0bf-7d82-40815c64966d	000e0000-557e-a0bf-b1de-634cc89570d1	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557e-a0bd-e70e-e36aa7d040ea
000d0000-557e-a0bf-6326-bc92a15ba304	000e0000-557e-a0bf-b1de-634cc89570d1	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557e-a0bd-e70e-e36aa7d040ea
000d0000-557e-a0bf-7a39-bca6d52f0ce4	000e0000-557e-a0bf-b1de-634cc89570d1	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557e-a0bd-e169-30c8fabf742f
000d0000-557e-a0bf-ac29-ad2d2146c366	000e0000-557e-a0bf-b1de-634cc89570d1	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557e-a0bd-06a9-20196a103a17
000d0000-557e-a0bf-61d3-adf99b14b927	000e0000-557e-a0bf-b1de-634cc89570d1	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557e-a0bd-06a9-20196a103a17
000d0000-557e-a0bf-16e0-70778948f134	000e0000-557e-a0bf-b1de-634cc89570d1	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557e-a0bd-06a9-20196a103a17
000d0000-557e-a0bf-f902-c401b3e0eb98	000e0000-557e-a0bf-b1de-634cc89570d1	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557e-a0bd-e70e-e36aa7d040ea
\.


--
-- TOC entry 2839 (class 0 OID 7189685)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7189733)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7189665)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557e-a0bf-af2d-f6daa23e8f38	00080000-557e-a0bf-752c-3830ff4d4ecb	00090000-557e-a0bf-1069-d90a1b94875d	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7189782)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7189807)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7189622)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557e-a0be-de66-05f195bf350f	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557e-a0be-ef7b-ddbf89d8698c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557e-a0be-eebe-64cf9dc3368c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557e-a0be-e1c6-e24ce7137c2a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557e-a0be-2bec-8ebbdfb89b56	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557e-a0be-db9a-61a8e6d712cb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557e-a0be-74bc-00ca5aee79d0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557e-a0be-994e-12e3e6a40887	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557e-a0be-8d29-8d0c31301fc6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557e-a0be-1535-83c1e84d5ad3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557e-a0be-a31c-5831ed0b2abb	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557e-a0be-f670-f3ff103c71e6	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557e-a0be-a6bc-d04f96e89a79	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557e-a0be-5db0-55743b1ece8d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557e-a0be-7388-e9bf65aff824	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557e-a0be-821f-4cc764446753	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7189535)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557e-a0be-b8a1-f97ff9119ae7	00000000-557e-a0be-2bec-8ebbdfb89b56	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557e-a0be-b124-3a4336952a96	00000000-557e-a0be-2bec-8ebbdfb89b56	00010000-557e-a0be-d5b9-9617a08a0f80	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557e-a0be-82cc-080126712ee8	00000000-557e-a0be-db9a-61a8e6d712cb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7189546)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557e-a0bf-976d-9fcb39980ce7	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557e-a0bf-6e22-3223f7f8d054	00010000-557e-a0bf-81d2-87b63a2e2793	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557e-a0bf-2faf-715f40615345	00010000-557e-a0be-c55d-f017195513d5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557e-a0bf-e13b-71a001ddf50b	00010000-557e-a0bf-e94f-4bdcb003e226	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557e-a0bf-caf5-ee85b0fba406	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557e-a0bf-18e1-8e54a5295cc0	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557e-a0bf-2e24-d6841c29f7f8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557e-a0bf-8ccf-629df5ef4bad	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557e-a0bf-1069-d90a1b94875d	00010000-557e-a0bf-d1a3-6d2fde3c098e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557e-a0bf-0553-2834936476f1	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557e-a0bf-f501-46fea179256f	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557e-a0bf-3902-cf2895f55088	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557e-a0bf-e983-ad6eb687eb12	00010000-557e-a0bf-c21b-66c341b9489e	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7189500)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557e-a0bd-81fa-3ecf901d2c93	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557e-a0bd-d188-335133ffcf84	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557e-a0bd-91c4-c7f30a129ae8	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557e-a0bd-f75f-7d2d39d68bc2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557e-a0bd-f040-7fcfe2b7434f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557e-a0bd-d759-f20fd304adea	Abonma-read	Abonma - branje	f
00030000-557e-a0bd-7dd0-63b7b4e4465f	Abonma-write	Abonma - spreminjanje	f
00030000-557e-a0bd-9441-76894ae2956b	Alternacija-read	Alternacija - branje	f
00030000-557e-a0bd-4898-277a2d768a4d	Alternacija-write	Alternacija - spreminjanje	f
00030000-557e-a0bd-96b8-ae8c7beff4cb	Arhivalija-read	Arhivalija - branje	f
00030000-557e-a0bd-f429-f4af8b195ac1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557e-a0bd-2d6c-4943ba6d978f	Besedilo-read	Besedilo - branje	f
00030000-557e-a0bd-bf9a-0c4bfae2f329	Besedilo-write	Besedilo - spreminjanje	f
00030000-557e-a0bd-3b14-7a723ed19207	DogodekIzven-read	DogodekIzven - branje	f
00030000-557e-a0bd-4273-9f531f2b545e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557e-a0bd-c957-b654c9755e1b	Dogodek-read	Dogodek - branje	f
00030000-557e-a0bd-1c05-2c86d4eda030	Dogodek-write	Dogodek - spreminjanje	f
00030000-557e-a0bd-0402-571dfe58ea7b	Drzava-read	Drzava - branje	f
00030000-557e-a0bd-9d14-d76815c9c9d5	Drzava-write	Drzava - spreminjanje	f
00030000-557e-a0bd-f395-6e8bef25239b	Funkcija-read	Funkcija - branje	f
00030000-557e-a0bd-ba3a-7fb700f880b4	Funkcija-write	Funkcija - spreminjanje	f
00030000-557e-a0bd-ac0a-3332893e106c	Gostovanje-read	Gostovanje - branje	f
00030000-557e-a0bd-023c-616f67e99e8d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557e-a0bd-ee47-835f98e43a96	Gostujoca-read	Gostujoca - branje	f
00030000-557e-a0bd-be91-8e6277b9bf77	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557e-a0bd-d663-e232a6a5db0b	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557e-a0bd-7f3a-1a98519637b0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557e-a0bd-46b2-c16d19a489b5	Kupec-read	Kupec - branje	f
00030000-557e-a0bd-8b95-e98116822628	Kupec-write	Kupec - spreminjanje	f
00030000-557e-a0bd-d2c2-a22a459f3724	NacinPlacina-read	NacinPlacina - branje	f
00030000-557e-a0bd-ab44-c2254ff6b766	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557e-a0bd-debf-afd0d4c01264	Option-read	Option - branje	f
00030000-557e-a0bd-0829-f8374238e613	Option-write	Option - spreminjanje	f
00030000-557e-a0bd-5c5f-ae53ba77bd32	OptionValue-read	OptionValue - branje	f
00030000-557e-a0bd-e34e-f2f6894d3c1f	OptionValue-write	OptionValue - spreminjanje	f
00030000-557e-a0bd-1425-c24d8c2c8e9f	Oseba-read	Oseba - branje	f
00030000-557e-a0bd-1e18-fffa1e483360	Oseba-write	Oseba - spreminjanje	f
00030000-557e-a0bd-efc9-720b5d5fa278	Permission-read	Permission - branje	f
00030000-557e-a0bd-9f2e-80f3f2bd41f2	Permission-write	Permission - spreminjanje	f
00030000-557e-a0bd-e6f4-6016bfd0f37d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557e-a0bd-d3c2-4ab71198bc85	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557e-a0bd-7537-f309d8f077ba	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557e-a0bd-9342-ccf423724844	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557e-a0bd-268c-f0aea1b94ba0	Pogodba-read	Pogodba - branje	f
00030000-557e-a0bd-43e2-21bac4d8a18d	Pogodba-write	Pogodba - spreminjanje	f
00030000-557e-a0bd-48d3-c1a2914fbaf7	Popa-read	Popa - branje	f
00030000-557e-a0bd-5d95-85a03f68d39e	Popa-write	Popa - spreminjanje	f
00030000-557e-a0bd-6274-4b3d7a643342	Posta-read	Posta - branje	f
00030000-557e-a0bd-6968-03394ac7919e	Posta-write	Posta - spreminjanje	f
00030000-557e-a0bd-1495-102dcee16b5d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557e-a0bd-6df4-1fd23f6187e7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557e-a0bd-23ee-3c01cc71ea7e	PostniNaslov-read	PostniNaslov - branje	f
00030000-557e-a0bd-e45b-aab7ab486787	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557e-a0bd-f8ed-f4d79ad460cf	Predstava-read	Predstava - branje	f
00030000-557e-a0bd-6a6b-8bdd71f9ca4d	Predstava-write	Predstava - spreminjanje	f
00030000-557e-a0bd-4157-c6d17500cff3	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557e-a0bd-2388-9fd893af0ba1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557e-a0bd-e1e6-3599d7a77e69	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557e-a0bd-a704-f3d339cb3e4e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557e-a0bd-0283-81294e014f5e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557e-a0bd-fb28-33bc79b7be2f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557e-a0bd-5502-f0232b74acc8	ProgramDela-read	ProgramDela - branje	f
00030000-557e-a0bd-f9ec-07b38b4a2058	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557e-a0bd-c938-ba93d9b7cd0e	ProgramFestival-read	ProgramFestival - branje	f
00030000-557e-a0bd-6b7f-fe845ea96cfd	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557e-a0bd-6561-a7ea7d78966e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557e-a0bd-ba4e-e1887b13b655	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557e-a0bd-47af-00be35803f08	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557e-a0bd-8259-bca1644c186d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557e-a0bd-ac72-87e4af7b7492	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557e-a0bd-8131-3d92d4ec7fdd	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557e-a0bd-3ea4-9bd24dd341b5	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557e-a0bd-e462-834b0162f9ed	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557e-a0bd-a96a-fad46995c226	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557e-a0bd-1a4a-fad5d5dcdf97	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557e-a0bd-3027-fe0f939a3f24	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557e-a0bd-3775-2a17e28ea231	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557e-a0bd-2f9f-ca366b74bc71	ProgramRazno-read	ProgramRazno - branje	f
00030000-557e-a0bd-65d7-639be546fffc	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557e-a0bd-7b88-dce3fb7cb4b3	Prostor-read	Prostor - branje	f
00030000-557e-a0bd-6e45-df543777f401	Prostor-write	Prostor - spreminjanje	f
00030000-557e-a0bd-b0c4-56bbdb86cd09	Racun-read	Racun - branje	f
00030000-557e-a0bd-bb68-3c9f6488ac5e	Racun-write	Racun - spreminjanje	f
00030000-557e-a0bd-0b4c-95de55d69505	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557e-a0bd-a7f6-839ce7e578cb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557e-a0bd-3084-a8caafe77b28	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557e-a0bd-e17d-1dbe94f68299	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557e-a0bd-c991-43b9a972d9ae	Rekvizit-read	Rekvizit - branje	f
00030000-557e-a0bd-50d4-0445b15173f3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557e-a0bd-c492-c8acca8c55c6	Revizija-read	Revizija - branje	f
00030000-557e-a0bd-0b7d-7797f0f1cea4	Revizija-write	Revizija - spreminjanje	f
00030000-557e-a0bd-46ca-63c75fbadec7	Rezervacija-read	Rezervacija - branje	f
00030000-557e-a0bd-0793-925b8e6c94b5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557e-a0bd-aab4-62e5a5ea341b	Role-read	Role - branje	f
00030000-557e-a0bd-3cac-2c4fb4f9142f	Role-write	Role - spreminjanje	f
00030000-557e-a0bd-e82c-da71d0775d80	SedezniRed-read	SedezniRed - branje	f
00030000-557e-a0bd-b31c-f9da073d3eb6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557e-a0bd-48df-e10bae684a2f	Sedez-read	Sedez - branje	f
00030000-557e-a0bd-d2f9-d1cfbe9633b5	Sedez-write	Sedez - spreminjanje	f
00030000-557e-a0bd-fd42-2873e61d117c	Sezona-read	Sezona - branje	f
00030000-557e-a0bd-383a-6f5b5ca170bd	Sezona-write	Sezona - spreminjanje	f
00030000-557e-a0bd-0db7-95c304dfe081	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557e-a0bd-19d7-861ce69780bb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557e-a0bd-bc52-af7987a07a81	Stevilcenje-read	Stevilcenje - branje	f
00030000-557e-a0bd-28c6-5242690e8df2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557e-a0bd-a318-9ea880625ba9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557e-a0bd-b4ec-81b8a68e2354	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557e-a0bd-60d8-02869250fa7c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557e-a0bd-aceb-0c839c83a342	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557e-a0bd-6dbc-295beaa46e0e	Telefonska-read	Telefonska - branje	f
00030000-557e-a0bd-bac4-a425e358793a	Telefonska-write	Telefonska - spreminjanje	f
00030000-557e-a0bd-3a01-32dbcca2c8fe	TerminStoritve-read	TerminStoritve - branje	f
00030000-557e-a0bd-726f-954d60c77d4a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557e-a0be-4e64-41c855a4584c	TipFunkcije-read	TipFunkcije - branje	f
00030000-557e-a0be-def9-7497d25de53f	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557e-a0be-7d4a-981b281f403a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557e-a0be-10ce-bd76bedb0905	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557e-a0be-8931-c7eca6bc711e	Trr-read	Trr - branje	f
00030000-557e-a0be-5eb1-284f8293290a	Trr-write	Trr - spreminjanje	f
00030000-557e-a0be-d4b4-16e053e9040f	Uprizoritev-read	Uprizoritev - branje	f
00030000-557e-a0be-8404-921907e3418d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557e-a0be-01c1-dca900642964	User-read	User - branje	f
00030000-557e-a0be-64dc-b8487f8d4394	User-write	User - spreminjanje	f
00030000-557e-a0be-2ccf-6c5be24ea97b	Vaja-read	Vaja - branje	f
00030000-557e-a0be-adb3-c8b930c6f71d	Vaja-write	Vaja - spreminjanje	f
00030000-557e-a0be-e2d9-0165c0d09b9d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557e-a0be-72ba-ec0922763409	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557e-a0be-6f53-1561cee7182e	Zaposlitev-read	Zaposlitev - branje	f
00030000-557e-a0be-9a8d-c3b9dff87879	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557e-a0be-bf2a-d78bf40efa2d	Zasedenost-read	Zasedenost - branje	f
00030000-557e-a0be-e510-8d29656b4d53	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557e-a0be-6b14-c0a624b074fc	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557e-a0be-85f0-4455850e560d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557e-a0be-e4b9-207389409b92	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557e-a0be-0484-08b998f3a3c8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7189519)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557e-a0be-1205-4a45a7e0f7fd	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-d759-f20fd304adea
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-7dd0-63b7b4e4465f
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-9441-76894ae2956b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-4898-277a2d768a4d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-96b8-ae8c7beff4cb
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-c957-b654c9755e1b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-f75f-7d2d39d68bc2
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-1c05-2c86d4eda030
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-9d14-d76815c9c9d5
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-f395-6e8bef25239b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-ba3a-7fb700f880b4
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-ac0a-3332893e106c
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-023c-616f67e99e8d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-ee47-835f98e43a96
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-be91-8e6277b9bf77
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-d663-e232a6a5db0b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-7f3a-1a98519637b0
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-debf-afd0d4c01264
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-5c5f-ae53ba77bd32
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-1425-c24d8c2c8e9f
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-1e18-fffa1e483360
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-48d3-c1a2914fbaf7
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-5d95-85a03f68d39e
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-6274-4b3d7a643342
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-6968-03394ac7919e
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-23ee-3c01cc71ea7e
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-e45b-aab7ab486787
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-f8ed-f4d79ad460cf
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-6a6b-8bdd71f9ca4d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-0283-81294e014f5e
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-fb28-33bc79b7be2f
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-7b88-dce3fb7cb4b3
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-6e45-df543777f401
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-3084-a8caafe77b28
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-e17d-1dbe94f68299
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-c991-43b9a972d9ae
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-50d4-0445b15173f3
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-fd42-2873e61d117c
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0bd-383a-6f5b5ca170bd
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-4e64-41c855a4584c
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-d4b4-16e053e9040f
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-8404-921907e3418d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-2ccf-6c5be24ea97b
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-adb3-c8b930c6f71d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-bf2a-d78bf40efa2d
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-e510-8d29656b4d53
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-6b14-c0a624b074fc
00020000-557e-a0be-c65e-c2565eff4305	00030000-557e-a0be-e4b9-207389409b92
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-d759-f20fd304adea
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-96b8-ae8c7beff4cb
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-c957-b654c9755e1b
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-ac0a-3332893e106c
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-ee47-835f98e43a96
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-d663-e232a6a5db0b
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-7f3a-1a98519637b0
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-debf-afd0d4c01264
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-5c5f-ae53ba77bd32
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-1425-c24d8c2c8e9f
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-1e18-fffa1e483360
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-48d3-c1a2914fbaf7
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-6274-4b3d7a643342
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-23ee-3c01cc71ea7e
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-e45b-aab7ab486787
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-f8ed-f4d79ad460cf
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-7b88-dce3fb7cb4b3
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-3084-a8caafe77b28
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-c991-43b9a972d9ae
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-fd42-2873e61d117c
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-6dbc-295beaa46e0e
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0bd-bac4-a425e358793a
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-8931-c7eca6bc711e
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-5eb1-284f8293290a
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-6f53-1561cee7182e
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-9a8d-c3b9dff87879
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-6b14-c0a624b074fc
00020000-557e-a0be-dab7-db7bc1dcf2ed	00030000-557e-a0be-e4b9-207389409b92
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-d759-f20fd304adea
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-9441-76894ae2956b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-96b8-ae8c7beff4cb
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-f429-f4af8b195ac1
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-2d6c-4943ba6d978f
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-3b14-7a723ed19207
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-c957-b654c9755e1b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-f395-6e8bef25239b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-ac0a-3332893e106c
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-ee47-835f98e43a96
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-d663-e232a6a5db0b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-debf-afd0d4c01264
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-5c5f-ae53ba77bd32
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-1425-c24d8c2c8e9f
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-48d3-c1a2914fbaf7
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-6274-4b3d7a643342
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-f8ed-f4d79ad460cf
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-0283-81294e014f5e
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-7b88-dce3fb7cb4b3
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-3084-a8caafe77b28
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-c991-43b9a972d9ae
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0bd-fd42-2873e61d117c
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0be-4e64-41c855a4584c
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0be-2ccf-6c5be24ea97b
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0be-bf2a-d78bf40efa2d
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0be-6b14-c0a624b074fc
00020000-557e-a0be-a4a5-662574e6d79c	00030000-557e-a0be-e4b9-207389409b92
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-d759-f20fd304adea
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-7dd0-63b7b4e4465f
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-4898-277a2d768a4d
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-96b8-ae8c7beff4cb
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-c957-b654c9755e1b
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-ac0a-3332893e106c
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-ee47-835f98e43a96
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-debf-afd0d4c01264
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-5c5f-ae53ba77bd32
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-48d3-c1a2914fbaf7
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-6274-4b3d7a643342
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-f8ed-f4d79ad460cf
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-7b88-dce3fb7cb4b3
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-3084-a8caafe77b28
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-c991-43b9a972d9ae
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0bd-fd42-2873e61d117c
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0be-4e64-41c855a4584c
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0be-6b14-c0a624b074fc
00020000-557e-a0be-bbce-2b084e58783b	00030000-557e-a0be-e4b9-207389409b92
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-d759-f20fd304adea
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-96b8-ae8c7beff4cb
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-c957-b654c9755e1b
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-0402-571dfe58ea7b
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-ac0a-3332893e106c
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-ee47-835f98e43a96
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-debf-afd0d4c01264
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-5c5f-ae53ba77bd32
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-48d3-c1a2914fbaf7
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-6274-4b3d7a643342
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-f8ed-f4d79ad460cf
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-7b88-dce3fb7cb4b3
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-3084-a8caafe77b28
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-c991-43b9a972d9ae
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-fd42-2873e61d117c
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-3a01-32dbcca2c8fe
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0bd-91c4-c7f30a129ae8
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0be-4e64-41c855a4584c
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0be-6b14-c0a624b074fc
00020000-557e-a0be-adf1-93462c63f848	00030000-557e-a0be-e4b9-207389409b92
\.


--
-- TOC entry 2854 (class 0 OID 7189814)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7189845)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7189981)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7189579)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557e-a0bf-752c-3830ff4d4ecb	00040000-557e-a0bd-59f6-36bf4517aa98	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-a0bf-56c0-9f7fa9af53e9	00040000-557e-a0bd-59f6-36bf4517aa98	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-a0bf-9bc0-b03d52ce5553	00040000-557e-a0bd-59f6-36bf4517aa98	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-a0bf-8eab-fff55a93d9c4	00040000-557e-a0bd-59f6-36bf4517aa98	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7189614)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557e-a0bd-f175-4978858141a9	8341	Adlešiči
00050000-557e-a0bd-5e67-66801651fe15	5270	Ajdovščina
00050000-557e-a0bd-341b-46004e8ef0a2	6280	Ankaran/Ancarano
00050000-557e-a0bd-a3c2-f6e00ff4933c	9253	Apače
00050000-557e-a0bd-434e-af56338a14f3	8253	Artiče
00050000-557e-a0bd-4146-29540972d968	4275	Begunje na Gorenjskem
00050000-557e-a0bd-623f-39e10d7d24e0	1382	Begunje pri Cerknici
00050000-557e-a0bd-5f08-1cdf56d7a40a	9231	Beltinci
00050000-557e-a0bd-1f47-9455acf7d868	2234	Benedikt
00050000-557e-a0bd-7485-a31d1818def9	2345	Bistrica ob Dravi
00050000-557e-a0bd-7b0e-64126528a310	3256	Bistrica ob Sotli
00050000-557e-a0bd-d40e-2e52b378d3e4	8259	Bizeljsko
00050000-557e-a0bd-2703-554d0296e4be	1223	Blagovica
00050000-557e-a0bd-68da-43abb098de5a	8283	Blanca
00050000-557e-a0bd-73a3-c1cd8d188ac3	4260	Bled
00050000-557e-a0bd-8830-6363aed203aa	4273	Blejska Dobrava
00050000-557e-a0bd-be16-8519952dcd99	9265	Bodonci
00050000-557e-a0bd-3f8c-3f3abc1ec0ac	9222	Bogojina
00050000-557e-a0bd-f55e-9a019dfb4d82	4263	Bohinjska Bela
00050000-557e-a0bd-b8bd-f1e016be592a	4264	Bohinjska Bistrica
00050000-557e-a0bd-82fe-cfb625273954	4265	Bohinjsko jezero
00050000-557e-a0bd-bb32-b0e56f7511e7	1353	Borovnica
00050000-557e-a0bd-d6f4-053b89748e13	8294	Boštanj
00050000-557e-a0bd-2d2a-ab78dfddf59d	5230	Bovec
00050000-557e-a0bd-84cf-8204c84aed77	5295	Branik
00050000-557e-a0bd-abdb-f03849f229d4	3314	Braslovče
00050000-557e-a0bd-c3ae-c3d18c8c5ad0	5223	Breginj
00050000-557e-a0bd-bccb-1ea56a165748	8280	Brestanica
00050000-557e-a0bd-4d70-4669fe26c3da	2354	Bresternica
00050000-557e-a0bd-c3c9-7243af769dcc	4243	Brezje
00050000-557e-a0bd-3f52-52a30e3dc4db	1351	Brezovica pri Ljubljani
00050000-557e-a0bd-356a-c6955bb342e2	8250	Brežice
00050000-557e-a0bd-5940-bac1fe6b0fce	4210	Brnik - Aerodrom
00050000-557e-a0bd-a000-c88c0f0a134c	8321	Brusnice
00050000-557e-a0bd-5cd0-2a9c20aed232	3255	Buče
00050000-557e-a0bd-4e14-87098929bcc3	8276	Bučka 
00050000-557e-a0bd-0bfd-83c2ed89e067	9261	Cankova
00050000-557e-a0bd-9ebf-224571f7a008	3000	Celje 
00050000-557e-a0bd-af0d-1a6f2828b002	3001	Celje - poštni predali
00050000-557e-a0bd-8b7d-25bd8fdf6791	4207	Cerklje na Gorenjskem
00050000-557e-a0bd-ca96-456a71a46808	8263	Cerklje ob Krki
00050000-557e-a0bd-342b-3ec3f7c93f87	1380	Cerknica
00050000-557e-a0bd-6327-ffa283e30c17	5282	Cerkno
00050000-557e-a0bd-1dfe-595d3122d34d	2236	Cerkvenjak
00050000-557e-a0bd-8993-22e83c053bc7	2215	Ceršak
00050000-557e-a0bd-1f05-81cc65999870	2326	Cirkovce
00050000-557e-a0bd-117e-51a40162709e	2282	Cirkulane
00050000-557e-a0bd-fb50-6a4945b40aeb	5273	Col
00050000-557e-a0bd-4449-19abcd25accc	8251	Čatež ob Savi
00050000-557e-a0bd-97db-9f8b6433a8bd	1413	Čemšenik
00050000-557e-a0bd-28d7-4307db8301af	5253	Čepovan
00050000-557e-a0bd-98e7-cd61e4f53fc3	9232	Črenšovci
00050000-557e-a0bd-4c0f-7904e035f9e6	2393	Črna na Koroškem
00050000-557e-a0bd-e198-5d52ff43842d	6275	Črni Kal
00050000-557e-a0bd-eb13-15100bf7c9a9	5274	Črni Vrh nad Idrijo
00050000-557e-a0bd-d889-45aee2fd1ae9	5262	Črniče
00050000-557e-a0bd-269d-495392c63e96	8340	Črnomelj
00050000-557e-a0bd-e2e4-b3a9376487c6	6271	Dekani
00050000-557e-a0bd-ff41-7d275a904e46	5210	Deskle
00050000-557e-a0bd-cf8f-5078b4984a83	2253	Destrnik
00050000-557e-a0bd-0cb8-13ac38755421	6215	Divača
00050000-557e-a0bd-f45f-b1f051eabe7b	1233	Dob
00050000-557e-a0bd-9af3-9635f9118cf1	3224	Dobje pri Planini
00050000-557e-a0bd-1da2-6f2ec29c19e6	8257	Dobova
00050000-557e-a0bd-96e5-1329c428df6c	1423	Dobovec
00050000-557e-a0bd-da73-7c47b6107d7a	5263	Dobravlje
00050000-557e-a0bd-3150-d61e7f0b21e6	3204	Dobrna
00050000-557e-a0bd-3263-411b733ecf94	8211	Dobrnič
00050000-557e-a0bd-7dc4-acfe9b63e8ab	1356	Dobrova
00050000-557e-a0bd-69a3-7967a261f61b	9223	Dobrovnik/Dobronak 
00050000-557e-a0bd-c6f6-16b6b3ef14f2	5212	Dobrovo v Brdih
00050000-557e-a0bd-c380-b67713e53114	1431	Dol pri Hrastniku
00050000-557e-a0bd-84d7-d458ba36387d	1262	Dol pri Ljubljani
00050000-557e-a0bd-f095-40963f362d96	1273	Dole pri Litiji
00050000-557e-a0bd-ff46-a141b962be9e	1331	Dolenja vas
00050000-557e-a0bd-261f-e21598b1a211	8350	Dolenjske Toplice
00050000-557e-a0bd-0bf9-693dce5536d6	1230	Domžale
00050000-557e-a0bd-f057-a7c81a9da71d	2252	Dornava
00050000-557e-a0bd-cda1-2d60b3659e4a	5294	Dornberk
00050000-557e-a0bd-ed86-e60fdd805c10	1319	Draga
00050000-557e-a0bd-5146-e5554a3d014a	8343	Dragatuš
00050000-557e-a0bd-dea8-c014caa4d421	3222	Dramlje
00050000-557e-a0bd-7043-3c7a155fcb68	2370	Dravograd
00050000-557e-a0bd-893a-fdf813b3767e	4203	Duplje
00050000-557e-a0bd-0bad-da620e1bbf8e	6221	Dutovlje
00050000-557e-a0bd-72f8-df44d8505a72	8361	Dvor
00050000-557e-a0bd-c971-70836dda6bfb	2343	Fala
00050000-557e-a0bd-41c2-9eb571b8e3dd	9208	Fokovci
00050000-557e-a0bd-b4dd-3ccfa74f6a02	2313	Fram
00050000-557e-a0bd-545d-f10b5aa6d564	3213	Frankolovo
00050000-557e-a0bd-49fe-b0858b609e22	1274	Gabrovka
00050000-557e-a0bd-16f0-5ab3e8670844	8254	Globoko
00050000-557e-a0bd-9c40-4180a4e1a80a	5275	Godovič
00050000-557e-a0bd-cb1a-9bc14159fcc0	4204	Golnik
00050000-557e-a0bd-deb3-ebf344421af4	3303	Gomilsko
00050000-557e-a0bd-3cc5-b772accb6540	4224	Gorenja vas
00050000-557e-a0bd-8bdf-0cb81fdc0916	3263	Gorica pri Slivnici
00050000-557e-a0bd-441f-302e189a5374	2272	Gorišnica
00050000-557e-a0bd-b3bc-92693fcd9844	9250	Gornja Radgona
00050000-557e-a0bd-120e-8ca3bc11f754	3342	Gornji Grad
00050000-557e-a0bd-a588-bd8d678a0627	4282	Gozd Martuljek
00050000-557e-a0bd-caba-795bfe9d47de	6272	Gračišče
00050000-557e-a0bd-18d8-765930c8afeb	9264	Grad
00050000-557e-a0bd-5a80-126914884c8e	8332	Gradac
00050000-557e-a0bd-05d8-e1065fb1c213	1384	Grahovo
00050000-557e-a0bd-62a4-e7f305c26972	5242	Grahovo ob Bači
00050000-557e-a0bd-e339-8a5d4a1fed41	5251	Grgar
00050000-557e-a0bd-2e1d-5bf86945b966	3302	Griže
00050000-557e-a0bd-daa4-28fa8f0a972a	3231	Grobelno
00050000-557e-a0bd-5d81-b6df0c5be786	1290	Grosuplje
00050000-557e-a0bd-8c28-bc5fac1402e2	2288	Hajdina
00050000-557e-a0bd-67d2-ba25cb62c238	8362	Hinje
00050000-557e-a0bd-fad2-4b764b4489d9	2311	Hoče
00050000-557e-a0bd-7b6a-739cc3d41172	9205	Hodoš/Hodos
00050000-557e-a0bd-beeb-9f0bbcc48a50	1354	Horjul
00050000-557e-a0bd-acad-966985a2a7f0	1372	Hotedršica
00050000-557e-a0bd-04c4-0b73aa8b8a90	1430	Hrastnik
00050000-557e-a0bd-b404-6e01661fe4cb	6225	Hruševje
00050000-557e-a0bd-53d8-5ed6486fa882	4276	Hrušica
00050000-557e-a0bd-e738-d38873c3f67c	5280	Idrija
00050000-557e-a0bd-b7ad-967c30a602cd	1292	Ig
00050000-557e-a0bd-9424-2be7bb7995ba	6250	Ilirska Bistrica
00050000-557e-a0bd-9aa8-231aaac81a5d	6251	Ilirska Bistrica-Trnovo
00050000-557e-a0bd-d43d-f8468890d14b	1295	Ivančna Gorica
00050000-557e-a0bd-2e13-d440b8d15680	2259	Ivanjkovci
00050000-557e-a0bd-20fe-3e3c6a6855ad	1411	Izlake
00050000-557e-a0bd-ec7e-fcefd3e92c5b	6310	Izola/Isola
00050000-557e-a0bd-932e-6bb1f218eb4b	2222	Jakobski Dol
00050000-557e-a0bd-211e-59f6774ac130	2221	Jarenina
00050000-557e-a0bd-721c-b2c288c4ada1	6254	Jelšane
00050000-557e-a0bd-cc79-1f3c0840d029	4270	Jesenice
00050000-557e-a0bd-630d-888a3e4c813d	8261	Jesenice na Dolenjskem
00050000-557e-a0bd-2619-6f29112b786c	3273	Jurklošter
00050000-557e-a0bd-b39d-efddbe69d367	2223	Jurovski Dol
00050000-557e-a0bd-e130-21b129131e57	2256	Juršinci
00050000-557e-a0bd-e623-e18d5ecc0619	5214	Kal nad Kanalom
00050000-557e-a0bd-3c7b-13fea9698019	3233	Kalobje
00050000-557e-a0bd-adef-b1174055ec3b	4246	Kamna Gorica
00050000-557e-a0bd-57b8-4512a10b648b	2351	Kamnica
00050000-557e-a0bd-a2ee-ad5af6ba6f9c	1241	Kamnik
00050000-557e-a0bd-ce71-682209dba1a8	5213	Kanal
00050000-557e-a0bd-c888-31eb2e8e47ce	8258	Kapele
00050000-557e-a0bd-474a-62ef1b2365aa	2362	Kapla
00050000-557e-a0bd-5f4e-a9b0e469d0f9	2325	Kidričevo
00050000-557e-a0bd-bd52-c113a994d112	1412	Kisovec
00050000-557e-a0bd-4337-a7cdbbcc1414	6253	Knežak
00050000-557e-a0bd-02c8-e7d3ac95b809	5222	Kobarid
00050000-557e-a0bd-54fd-f30d7dbc6c5d	9227	Kobilje
00050000-557e-a0bd-66f9-1640da29ca72	1330	Kočevje
00050000-557e-a0bd-4a36-2f9d882166e1	1338	Kočevska Reka
00050000-557e-a0bd-c3ee-7b5b9cece76e	2276	Kog
00050000-557e-a0bd-6919-64ddf728168c	5211	Kojsko
00050000-557e-a0bd-f884-c47d3ddffbd6	6223	Komen
00050000-557e-a0bd-8d51-6436d7944cd7	1218	Komenda
00050000-557e-a0bd-dbb3-f287ba1c64c4	6000	Koper/Capodistria 
00050000-557e-a0bd-e6c1-ba26404cbf66	6001	Koper/Capodistria - poštni predali
00050000-557e-a0bd-a244-d03467efce91	8282	Koprivnica
00050000-557e-a0bd-d975-c7b91dafe517	5296	Kostanjevica na Krasu
00050000-557e-a0bd-db73-3f594e84aaa4	8311	Kostanjevica na Krki
00050000-557e-a0bd-4cdb-40ca25b77ff5	1336	Kostel
00050000-557e-a0bd-df81-f5648ad8c72d	6256	Košana
00050000-557e-a0bd-c97c-3ac415fb1eb7	2394	Kotlje
00050000-557e-a0bd-6e48-64e7bc52a660	6240	Kozina
00050000-557e-a0bd-974b-a56433c016e2	3260	Kozje
00050000-557e-a0bd-17f7-f90f8dacfd68	4000	Kranj 
00050000-557e-a0bd-3382-3311c788e963	4001	Kranj - poštni predali
00050000-557e-a0bd-de9f-69ca7a27d7cd	4280	Kranjska Gora
00050000-557e-a0bd-1b98-56c7c94c6250	1281	Kresnice
00050000-557e-a0bd-02de-c14e46c14d64	4294	Križe
00050000-557e-a0bd-f957-03e744c88968	9206	Križevci
00050000-557e-a0bd-de8c-1f371d53716d	9242	Križevci pri Ljutomeru
00050000-557e-a0bd-1929-a8300a52a444	1301	Krka
00050000-557e-a0bd-fc5a-f26ede86c889	8296	Krmelj
00050000-557e-a0bd-70b7-1f6eecb7fb86	4245	Kropa
00050000-557e-a0bd-e115-d2edaead8a8e	8262	Krška vas
00050000-557e-a0bd-90b3-2f74d6786cd2	8270	Krško
00050000-557e-a0bd-acde-42fe322156ab	9263	Kuzma
00050000-557e-a0bd-4bed-c687d4a5964f	2318	Laporje
00050000-557e-a0bd-b22e-1023a5cbad5d	3270	Laško
00050000-557e-a0bd-d71e-ef168ba844d7	1219	Laze v Tuhinju
00050000-557e-a0bd-347e-a75f25f22977	2230	Lenart v Slovenskih goricah
00050000-557e-a0bd-3162-488e1c0e7d44	9220	Lendava/Lendva
00050000-557e-a0bd-5939-2d7e2b2fe16d	4248	Lesce
00050000-557e-a0bd-2dd5-6448f65642a7	3261	Lesično
00050000-557e-a0bd-4464-7e6a6728910f	8273	Leskovec pri Krškem
00050000-557e-a0bd-b19a-46de3298d2db	2372	Libeliče
00050000-557e-a0bd-a570-5697903a49d7	2341	Limbuš
00050000-557e-a0bd-f4c5-56ad662dd69c	1270	Litija
00050000-557e-a0bd-6b37-05e4efe3e0c3	3202	Ljubečna
00050000-557e-a0bd-0e22-8fa5609a83aa	1000	Ljubljana 
00050000-557e-a0bd-175a-552a326c66b8	1001	Ljubljana - poštni predali
00050000-557e-a0bd-9128-21d73db79f98	1231	Ljubljana - Črnuče
00050000-557e-a0bd-f2be-49c92bc11dcc	1261	Ljubljana - Dobrunje
00050000-557e-a0bd-a401-f84d55f32652	1260	Ljubljana - Polje
00050000-557e-a0bd-9b23-439b08300d98	1210	Ljubljana - Šentvid
00050000-557e-a0bd-c4f0-574ace2c5e70	1211	Ljubljana - Šmartno
00050000-557e-a0bd-2353-c1d0de2b45a2	3333	Ljubno ob Savinji
00050000-557e-a0bd-a985-6759dc604c10	9240	Ljutomer
00050000-557e-a0bd-88ad-12c7880acc8c	3215	Loče
00050000-557e-a0bd-7fb5-4de4b24f8a13	5231	Log pod Mangartom
00050000-557e-a0bd-7657-ee0a7bfa8ae4	1358	Log pri Brezovici
00050000-557e-a0bd-c7b0-7cf14e4367be	1370	Logatec
00050000-557e-a0bd-e65c-33766a6c5bc1	1371	Logatec
00050000-557e-a0bd-9951-7b8be3808a83	1434	Loka pri Zidanem Mostu
00050000-557e-a0bd-7b23-727e25374d7b	3223	Loka pri Žusmu
00050000-557e-a0bd-1421-f5e7ef81845e	6219	Lokev
00050000-557e-a0bd-ad4d-a199460a8f34	1318	Loški Potok
00050000-557e-a0bd-7591-361832f2b3fa	2324	Lovrenc na Dravskem polju
00050000-557e-a0bd-b738-a75445fa0b16	2344	Lovrenc na Pohorju
00050000-557e-a0bd-0f6d-1ef035c7cbb7	3334	Luče
00050000-557e-a0bd-3d52-a3da0ab277d4	1225	Lukovica
00050000-557e-a0bd-4983-7e39d2943076	9202	Mačkovci
00050000-557e-a0bd-6781-37789bb3aa49	2322	Majšperk
00050000-557e-a0bd-3b0a-de8c867b3004	2321	Makole
00050000-557e-a0bd-859b-89536d443929	9243	Mala Nedelja
00050000-557e-a0bd-14cc-2fd58df16108	2229	Malečnik
00050000-557e-a0bd-0436-c64350571e77	6273	Marezige
00050000-557e-a0bd-2f9a-024d59eeab4c	2000	Maribor 
00050000-557e-a0bd-d02f-4ba7639b9b92	2001	Maribor - poštni predali
00050000-557e-a0bd-0ae8-a71a76c9aaad	2206	Marjeta na Dravskem polju
00050000-557e-a0bd-4b0b-24b16b7395c6	2281	Markovci
00050000-557e-a0bd-4f09-518da1dd2083	9221	Martjanci
00050000-557e-a0bd-8713-d1f5498bc6cd	6242	Materija
00050000-557e-a0bd-b68a-334e682a6b08	4211	Mavčiče
00050000-557e-a0bd-9aca-2b1a2c10bb3d	1215	Medvode
00050000-557e-a0bd-2408-52e5d49521f8	1234	Mengeš
00050000-557e-a0bd-3d83-a7f8c9ba1537	8330	Metlika
00050000-557e-a0bd-614c-db15a9957cb5	2392	Mežica
00050000-557e-a0bd-808b-8b5c6981dcdf	2204	Miklavž na Dravskem polju
00050000-557e-a0bd-52a7-63b2480052ae	2275	Miklavž pri Ormožu
00050000-557e-a0bd-6ff7-b3eca59e2d59	5291	Miren
00050000-557e-a0bd-a084-310815811b5f	8233	Mirna
00050000-557e-a0bd-5313-bb222546cc78	8216	Mirna Peč
00050000-557e-a0bd-ad62-40ca0d3b7ab4	2382	Mislinja
00050000-557e-a0bd-089b-ba30b312d28d	4281	Mojstrana
00050000-557e-a0bd-41bc-a5600e3bc022	8230	Mokronog
00050000-557e-a0bd-b438-a531ef3f39bc	1251	Moravče
00050000-557e-a0bd-d16a-3fdd84c778af	9226	Moravske Toplice
00050000-557e-a0bd-0924-545b2c5c4352	5216	Most na Soči
00050000-557e-a0bd-70f8-7eb949b6adbb	1221	Motnik
00050000-557e-a0bd-b825-25c77c413eab	3330	Mozirje
00050000-557e-a0bd-e6cb-dab6e0e09952	9000	Murska Sobota 
00050000-557e-a0bd-acca-f11ca2ccd441	9001	Murska Sobota - poštni predali
00050000-557e-a0bd-ad7a-993d4f7d58d4	2366	Muta
00050000-557e-a0bd-7f97-0566c2ec885d	4202	Naklo
00050000-557e-a0bd-6a7e-33b81a3a5d7c	3331	Nazarje
00050000-557e-a0bd-58ef-3b7945592b24	1357	Notranje Gorice
00050000-557e-a0bd-9312-bd9cd55734f4	3203	Nova Cerkev
00050000-557e-a0bd-ffce-0379a7a990df	5000	Nova Gorica 
00050000-557e-a0bd-be59-c4a6125e5a05	5001	Nova Gorica - poštni predali
00050000-557e-a0bd-e532-a18653609bb2	1385	Nova vas
00050000-557e-a0bd-624a-17e6807269f5	8000	Novo mesto
00050000-557e-a0bd-2933-90b489244d43	8001	Novo mesto - poštni predali
00050000-557e-a0bd-3b1d-0f1ca2724a8a	6243	Obrov
00050000-557e-a0bd-7623-85c20d9e5b3f	9233	Odranci
00050000-557e-a0bd-b3d0-88370b07f954	2317	Oplotnica
00050000-557e-a0bd-76de-246aaab3bfaa	2312	Orehova vas
00050000-557e-a0bd-f241-66156a52e220	2270	Ormož
00050000-557e-a0bd-868f-34b0c48eeb32	1316	Ortnek
00050000-557e-a0bd-bcef-8f56390c73f9	1337	Osilnica
00050000-557e-a0bd-8238-5b6cb27b2d68	8222	Otočec
00050000-557e-a0bd-a85d-2abee16d6df7	2361	Ožbalt
00050000-557e-a0bd-beb8-d42357a3d505	2231	Pernica
00050000-557e-a0bd-d688-4733cfb71515	2211	Pesnica pri Mariboru
00050000-557e-a0bd-2044-85dd436e036e	9203	Petrovci
00050000-557e-a0bd-8d03-a3ca54fbf348	3301	Petrovče
00050000-557e-a0bd-5e56-11647a8124f8	6330	Piran/Pirano
00050000-557e-a0bd-999e-e4ffa014c759	8255	Pišece
00050000-557e-a0bd-a6d6-5002848f5dce	6257	Pivka
00050000-557e-a0bd-dbc8-4136a91de388	6232	Planina
00050000-557e-a0bd-b212-4c3eb470f9e6	3225	Planina pri Sevnici
00050000-557e-a0bd-bda0-791fb66a4dc1	6276	Pobegi
00050000-557e-a0bd-5032-cbdd30a8261b	8312	Podbočje
00050000-557e-a0bd-dfc9-a967dd807f6e	5243	Podbrdo
00050000-557e-a0bd-7404-a91752d14162	3254	Podčetrtek
00050000-557e-a0bd-fd7c-f89d143e2d43	2273	Podgorci
00050000-557e-a0bd-7415-b20e19c88f45	6216	Podgorje
00050000-557e-a0bd-c2d1-aa72092561b9	2381	Podgorje pri Slovenj Gradcu
00050000-557e-a0bd-d263-b08a052a225c	6244	Podgrad
00050000-557e-a0bd-9768-f6074bd70aec	1414	Podkum
00050000-557e-a0bd-8f25-b9d96f644d8a	2286	Podlehnik
00050000-557e-a0bd-7fe8-09208371e2d7	5272	Podnanos
00050000-557e-a0bd-f2b2-c2997379e1a3	4244	Podnart
00050000-557e-a0bd-5e41-17b857b04d79	3241	Podplat
00050000-557e-a0bd-164d-407278e237a8	3257	Podsreda
00050000-557e-a0bd-992f-d93b3d3b7899	2363	Podvelka
00050000-557e-a0bd-dd6d-d43443140a62	2208	Pohorje
00050000-557e-a0bd-9a77-e8e6d8a3aa2b	2257	Polenšak
00050000-557e-a0bd-c5d4-b1f04ebaf4a9	1355	Polhov Gradec
00050000-557e-a0bd-2d85-32d0af8f87ce	4223	Poljane nad Škofjo Loko
00050000-557e-a0bd-aa3f-2735b2f7e68c	2319	Poljčane
00050000-557e-a0bd-3f56-bd8e61c5b363	1272	Polšnik
00050000-557e-a0bd-58f5-1009880de63b	3313	Polzela
00050000-557e-a0bd-7091-8c215ff4b217	3232	Ponikva
00050000-557e-a0bd-d712-0f75762ce3a0	6320	Portorož/Portorose
00050000-557e-a0bd-7b88-b0b4756ad9ba	6230	Postojna
00050000-557e-a0bd-1233-95df3e081fee	2331	Pragersko
00050000-557e-a0bd-87f8-edeee9208d77	3312	Prebold
00050000-557e-a0bd-e03b-15c6c84df884	4205	Preddvor
00050000-557e-a0bd-0ed5-2bbddcda9cd4	6255	Prem
00050000-557e-a0bd-b34d-a870fcc7874c	1352	Preserje
00050000-557e-a0bd-e35f-e2ac296d99da	6258	Prestranek
00050000-557e-a0bd-2c08-f1aef95372bb	2391	Prevalje
00050000-557e-a0bd-604e-8edb7520e1c3	3262	Prevorje
00050000-557e-a0bd-32ca-1464f2c9885f	1276	Primskovo 
00050000-557e-a0bd-a5b9-24bbd2cb85b0	3253	Pristava pri Mestinju
00050000-557e-a0bd-d1d6-cd06e1ff19d4	9207	Prosenjakovci/Partosfalva
00050000-557e-a0bd-6452-89126f6f9f54	5297	Prvačina
00050000-557e-a0bd-8b34-076c9b817268	2250	Ptuj
00050000-557e-a0bd-2a82-3d48fdb71f3e	2323	Ptujska Gora
00050000-557e-a0bd-64af-b4abf2b6aeb5	9201	Puconci
00050000-557e-a0bd-9269-ed6634cee8d6	2327	Rače
00050000-557e-a0bd-aeae-0bafc6cbb8de	1433	Radeče
00050000-557e-a0bd-9180-93929f1dcf0b	9252	Radenci
00050000-557e-a0bd-c87c-bef802ebfd49	2360	Radlje ob Dravi
00050000-557e-a0bd-8395-91f89c4782a5	1235	Radomlje
00050000-557e-a0bd-1ab1-67d3206a0766	4240	Radovljica
00050000-557e-a0bd-fa31-e7fbf24c5c7f	8274	Raka
00050000-557e-a0bd-50bd-425f0005d26a	1381	Rakek
00050000-557e-a0bd-54dc-4a91ffcb0373	4283	Rateče - Planica
00050000-557e-a0bd-6b81-ccb1d78ae1e3	2390	Ravne na Koroškem
00050000-557e-a0bd-071a-fdc7c8f016c8	9246	Razkrižje
00050000-557e-a0bd-4569-8f01fe882013	3332	Rečica ob Savinji
00050000-557e-a0bd-90fb-087a66b2f9e3	5292	Renče
00050000-557e-a0bd-1d94-799637239326	1310	Ribnica
00050000-557e-a0bd-57e6-bc89b7527c2b	2364	Ribnica na Pohorju
00050000-557e-a0bd-b72d-601d7618264f	3272	Rimske Toplice
00050000-557e-a0bd-8a58-5f7ae4cc63c2	1314	Rob
00050000-557e-a0bd-6216-fee8c5711ca3	5215	Ročinj
00050000-557e-a0bd-4299-b5e282427f7a	3250	Rogaška Slatina
00050000-557e-a0bd-54bc-1a3871104756	9262	Rogašovci
00050000-557e-a0bd-6bab-9a08b30d77df	3252	Rogatec
00050000-557e-a0bd-8b10-2410778ccbd2	1373	Rovte
00050000-557e-a0bd-ebe9-eeef34d6521f	2342	Ruše
00050000-557e-a0bd-1301-de1f8a3e7f6e	1282	Sava
00050000-557e-a0bd-d4b7-6b200395c1f0	6333	Sečovlje/Sicciole
00050000-557e-a0bd-a3d8-d961a0d77ec4	4227	Selca
00050000-557e-a0bd-3192-6efe1393c606	2352	Selnica ob Dravi
00050000-557e-a0bd-7f3d-cd1c48c1f360	8333	Semič
00050000-557e-a0bd-46c0-925bbc245a05	8281	Senovo
00050000-557e-a0bd-2618-503d0c5ca63d	6224	Senožeče
00050000-557e-a0bd-d966-d4ebb6becf7e	8290	Sevnica
00050000-557e-a0bd-917c-f81ba57e447b	6210	Sežana
00050000-557e-a0bd-27b5-8388f97ad80b	2214	Sladki Vrh
00050000-557e-a0bd-29bd-3a9902980a71	5283	Slap ob Idrijci
00050000-557e-a0bd-be55-0d111be567e2	2380	Slovenj Gradec
00050000-557e-a0bd-9800-94aaf8cbae52	2310	Slovenska Bistrica
00050000-557e-a0bd-1747-4115f9b33c95	3210	Slovenske Konjice
00050000-557e-a0bd-3a35-923cd2511ea0	1216	Smlednik
00050000-557e-a0bd-c1da-49227503c9a8	5232	Soča
00050000-557e-a0bd-f7ba-6fc2768f8f0d	1317	Sodražica
00050000-557e-a0bd-dcf2-062ed212d2f0	3335	Solčava
00050000-557e-a0bd-e2b5-450a820af678	5250	Solkan
00050000-557e-a0bd-6177-0a4c06e69532	4229	Sorica
00050000-557e-a0bd-5aeb-3e0ec3a7b3ee	4225	Sovodenj
00050000-557e-a0bd-6173-6f5bc55f8d73	5281	Spodnja Idrija
00050000-557e-a0bd-dfa7-e4f0af3efc9f	2241	Spodnji Duplek
00050000-557e-a0bd-725c-400338bacb70	9245	Spodnji Ivanjci
00050000-557e-a0bd-9cb6-63724ec7a685	2277	Središče ob Dravi
00050000-557e-a0bd-02e9-76ae97fc4726	4267	Srednja vas v Bohinju
00050000-557e-a0bd-a097-39131d63e106	8256	Sromlje 
00050000-557e-a0bd-35ed-658cbfd1d737	5224	Srpenica
00050000-557e-a0bd-27e3-117ed4c919f9	1242	Stahovica
00050000-557e-a0bd-8047-a8daefeae235	1332	Stara Cerkev
00050000-557e-a0bd-5478-d27a6d29e894	8342	Stari trg ob Kolpi
00050000-557e-a0bd-a8d1-530a20f1f67a	1386	Stari trg pri Ložu
00050000-557e-a0bd-1652-61fbb5c196e5	2205	Starše
00050000-557e-a0bd-168c-d5b1cf64c64d	2289	Stoperce
00050000-557e-a0bd-d405-11f37289805c	8322	Stopiče
00050000-557e-a0bd-e8b3-ca3d4971c3ba	3206	Stranice
00050000-557e-a0bd-4124-cac3ca1bda4c	8351	Straža
00050000-557e-a0bd-788d-5364e85eae46	1313	Struge
00050000-557e-a0bd-e110-22025ff018a8	8293	Studenec
00050000-557e-a0bd-8396-7f18649570bc	8331	Suhor
00050000-557e-a0bd-cf34-59cf7994eba8	2233	Sv. Ana v Slovenskih goricah
00050000-557e-a0bd-b46c-414d628f5cb1	2235	Sv. Trojica v Slovenskih goricah
00050000-557e-a0bd-df52-a78b7045099a	2353	Sveti Duh na Ostrem Vrhu
00050000-557e-a0bd-b27b-9eb9f84d3dc0	9244	Sveti Jurij ob Ščavnici
00050000-557e-a0bd-a2f4-55b4edb7a286	3264	Sveti Štefan
00050000-557e-a0bd-c9d4-9b7cd5343e88	2258	Sveti Tomaž
00050000-557e-a0bd-3552-0bd371197d1d	9204	Šalovci
00050000-557e-a0bd-9939-fb1c1a8ea899	5261	Šempas
00050000-557e-a0bd-bfee-ee6487de06ea	5290	Šempeter pri Gorici
00050000-557e-a0bd-50cf-c357ea22dc7a	3311	Šempeter v Savinjski dolini
00050000-557e-a0bd-93e2-3f919afd39f4	4208	Šenčur
00050000-557e-a0bd-6413-466511acb3dd	2212	Šentilj v Slovenskih goricah
00050000-557e-a0bd-1824-0e3f9cf3f99f	8297	Šentjanž
00050000-557e-a0bd-105a-c814ccde0f29	2373	Šentjanž pri Dravogradu
00050000-557e-a0bd-03fb-5fc452d88bca	8310	Šentjernej
00050000-557e-a0bd-f5dc-012cbb8bd05f	3230	Šentjur
00050000-557e-a0bd-da5c-1635ed7a45bb	3271	Šentrupert
00050000-557e-a0bd-2c20-79acff94f849	8232	Šentrupert
00050000-557e-a0bd-3c5c-153113e897ca	1296	Šentvid pri Stični
00050000-557e-a0bd-b40c-59c1787bdf41	8275	Škocjan
00050000-557e-a0bd-52d1-3ce008e9106b	6281	Škofije
00050000-557e-a0bd-42bb-3e975c6ec5f9	4220	Škofja Loka
00050000-557e-a0bd-9116-ea633a34de04	3211	Škofja vas
00050000-557e-a0bd-eaa0-92ae1e35a7e6	1291	Škofljica
00050000-557e-a0bd-293a-1b29b71925c6	6274	Šmarje
00050000-557e-a0bd-eda8-b7728b1ffe12	1293	Šmarje - Sap
00050000-557e-a0bd-470c-84427c5e0303	3240	Šmarje pri Jelšah
00050000-557e-a0bd-a4f0-b73f0f0cadf7	8220	Šmarješke Toplice
00050000-557e-a0bd-1cb4-1f74619d1eea	2315	Šmartno na Pohorju
00050000-557e-a0bd-710c-ae3fe891873a	3341	Šmartno ob Dreti
00050000-557e-a0bd-7646-877244ca1f68	3327	Šmartno ob Paki
00050000-557e-a0bd-97e7-a6f86a76ffae	1275	Šmartno pri Litiji
00050000-557e-a0bd-a2dd-70b865414501	2383	Šmartno pri Slovenj Gradcu
00050000-557e-a0bd-427e-b360cd254729	3201	Šmartno v Rožni dolini
00050000-557e-a0bd-4249-e6633b2eb0c6	3325	Šoštanj
00050000-557e-a0bd-210e-6dfff02c2278	6222	Štanjel
00050000-557e-a0bd-6ed9-f6792471e517	3220	Štore
00050000-557e-a0bd-afdd-665356886135	3304	Tabor
00050000-557e-a0bd-1fd3-d98f4e1da4ba	3221	Teharje
00050000-557e-a0bd-a1b9-7b3edad59d4a	9251	Tišina
00050000-557e-a0bd-1504-233b1ecc69d0	5220	Tolmin
00050000-557e-a0bd-03f1-e6aa3a48d339	3326	Topolšica
00050000-557e-a0bd-8910-0e09fe06bbe1	2371	Trbonje
00050000-557e-a0bd-ea17-a0134a25d002	1420	Trbovlje
00050000-557e-a0bd-156c-a849c32dab83	8231	Trebelno 
00050000-557e-a0bd-06d0-59b606f2fbb6	8210	Trebnje
00050000-557e-a0bd-2454-a4aaf01a547d	5252	Trnovo pri Gorici
00050000-557e-a0bd-c5f1-fd4a76c5dc49	2254	Trnovska vas
00050000-557e-a0bd-fe76-0f7dedd9464f	1222	Trojane
00050000-557e-a0bd-36ac-ce125aa70b90	1236	Trzin
00050000-557e-a0bd-cfca-bd1274f6b084	4290	Tržič
00050000-557e-a0bd-5fd9-8d9aeab2ceea	8295	Tržišče
00050000-557e-a0bd-be24-8ddf6eee6758	1311	Turjak
00050000-557e-a0bd-ec3c-9832a6046bf7	9224	Turnišče
00050000-557e-a0bd-64f5-8de037e932eb	8323	Uršna sela
00050000-557e-a0bd-dafc-d55f62636c24	1252	Vače
00050000-557e-a0bd-c189-b630859ede44	3320	Velenje 
00050000-557e-a0bd-773e-95554c9d4394	3322	Velenje - poštni predali
00050000-557e-a0bd-037e-9a98c8421279	8212	Velika Loka
00050000-557e-a0bd-c0e5-2dc08887beee	2274	Velika Nedelja
00050000-557e-a0bd-9771-883652fed026	9225	Velika Polana
00050000-557e-a0bd-87e5-291207780ecf	1315	Velike Lašče
00050000-557e-a0bd-a2cc-829fa7415cec	8213	Veliki Gaber
00050000-557e-a0bd-b122-6cac52f3d8ca	9241	Veržej
00050000-557e-a0bd-8dd2-79c9debfe005	1312	Videm - Dobrepolje
00050000-557e-a0bd-9cf5-a2adff8248c4	2284	Videm pri Ptuju
00050000-557e-a0bd-970b-ef7d4795651b	8344	Vinica
00050000-557e-a0bd-a245-e7b667ba6dc2	5271	Vipava
00050000-557e-a0bd-a8e6-5b2c18b2a830	4212	Visoko
00050000-557e-a0bd-4257-7c33874c3bcc	1294	Višnja Gora
00050000-557e-a0bd-769f-2dbece56f3ad	3205	Vitanje
00050000-557e-a0bd-a824-9c6b3ac1672e	2255	Vitomarci
00050000-557e-a0bd-f65e-dcb7c30df004	1217	Vodice
00050000-557e-a0bd-0d49-388776d9ea11	3212	Vojnik\t
00050000-557e-a0bd-5dc9-2f056cb865c4	5293	Volčja Draga
00050000-557e-a0bd-e8ae-edddfeeec7fa	2232	Voličina
00050000-557e-a0bd-172a-3cbf5f1ec059	3305	Vransko
00050000-557e-a0bd-7d94-08e1960b4f84	6217	Vremski Britof
00050000-557e-a0bd-89c5-60d8cf35b2e9	1360	Vrhnika
00050000-557e-a0bd-35c1-1e0035523af9	2365	Vuhred
00050000-557e-a0bd-3700-e322a4168474	2367	Vuzenica
00050000-557e-a0bd-0cf6-72048f95c0e2	8292	Zabukovje 
00050000-557e-a0bd-e4ec-3074fd0d7533	1410	Zagorje ob Savi
00050000-557e-a0bd-f8a1-87b0a93a1be3	1303	Zagradec
00050000-557e-a0bd-84a7-a4bda54dc116	2283	Zavrč
00050000-557e-a0bd-3d33-a8616248b221	8272	Zdole 
00050000-557e-a0bd-8f87-b5abd91293e3	4201	Zgornja Besnica
00050000-557e-a0bd-6788-663fc78e4ff4	2242	Zgornja Korena
00050000-557e-a0bd-e0fc-f87af3a16284	2201	Zgornja Kungota
00050000-557e-a0bd-25f7-f8e2bc931bca	2316	Zgornja Ložnica
00050000-557e-a0bd-c945-48fdf341823c	2314	Zgornja Polskava
00050000-557e-a0bd-f6fb-5c6948afa55c	2213	Zgornja Velka
00050000-557e-a0bd-3dcb-8a52edd56a9d	4247	Zgornje Gorje
00050000-557e-a0bd-f560-740437e16455	4206	Zgornje Jezersko
00050000-557e-a0bd-e552-3bb3cba32109	2285	Zgornji Leskovec
00050000-557e-a0bd-37f4-4fc013d7e667	1432	Zidani Most
00050000-557e-a0bd-64a4-5e4bb7551cf5	3214	Zreče
00050000-557e-a0bd-4ee9-f96e536e9dd2	4209	Žabnica
00050000-557e-a0bd-b635-78164812bbe5	3310	Žalec
00050000-557e-a0bd-73b1-4d34889b3e49	4228	Železniki
00050000-557e-a0bd-e44f-dea60fb43f89	2287	Žetale
00050000-557e-a0bd-d923-97b6aa7fce97	4226	Žiri
00050000-557e-a0bd-93a9-cccae1765de2	4274	Žirovnica
00050000-557e-a0bd-e158-dd7b9e8319dd	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7189788)
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
-- TOC entry 2832 (class 0 OID 7189599)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7189677)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7189800)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7189920)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7189973)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557e-a0bf-a0e6-0ad580b284e8	00080000-557e-a0bf-9bc0-b03d52ce5553	0987	A
00190000-557e-a0bf-e98f-42a01ea545f5	00080000-557e-a0bf-56c0-9f7fa9af53e9	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7190088)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7190151)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7190101)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7190120)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7189829)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557e-a0bf-dfd3-77e29c954dc5	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557e-a0bf-7502-e8430bbb5703	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557e-a0bf-a4d9-4213f55ff913	0003	Kazinska	t	84	Kazinska dvorana
00220000-557e-a0bf-7775-a3c5d7704d66	0004	Mali oder	t	24	Mali oder 
00220000-557e-a0bf-b9ac-864116d943a8	0005	Komorni oder	t	15	Komorni oder
00220000-557e-a0bf-730b-ef5be5303dcd	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557e-a0bf-457a-d8e8662670c9	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7189773)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7189763)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7189962)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7189897)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7189471)
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
-- TOC entry 2857 (class 0 OID 7189839)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7189509)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557e-a0be-7881-dcfef40daf44	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557e-a0be-1205-4a45a7e0f7fd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557e-a0be-e61f-963731cb1d3c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557e-a0be-1d1c-e78fffc2744a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557e-a0be-c65e-c2565eff4305	planer	Planer dogodkov v koledarju	t
00020000-557e-a0be-dab7-db7bc1dcf2ed	kadrovska	Kadrovska služba	t
00020000-557e-a0be-a4a5-662574e6d79c	arhivar	Ažuriranje arhivalij	t
00020000-557e-a0be-bbce-2b084e58783b	igralec	Igralec	t
00020000-557e-a0be-adf1-93462c63f848	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7189493)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557e-a0be-d5b9-9617a08a0f80	00020000-557e-a0be-e61f-963731cb1d3c
00010000-557e-a0be-fa1c-80e63753f0cd	00020000-557e-a0be-e61f-963731cb1d3c
\.


--
-- TOC entry 2859 (class 0 OID 7189853)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7189794)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7189744)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7190184)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557e-a0bd-b632-d52d2f2e8dbb	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557e-a0bd-b46b-83c97c6f9f5e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557e-a0bd-a12c-b3f8ccc782b9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557e-a0bd-2aa5-9e376759e129	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557e-a0bd-800d-fe9234d58d6e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7190176)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557e-a0bd-a0a8-6c027f3f93bd	00230000-557e-a0bd-2aa5-9e376759e129	popa
00240000-557e-a0bd-00bb-2e84e98630a4	00230000-557e-a0bd-2aa5-9e376759e129	oseba
00240000-557e-a0bd-d526-fae3b55cf2a5	00230000-557e-a0bd-b46b-83c97c6f9f5e	prostor
00240000-557e-a0bd-b59f-e3eaabd63ff7	00230000-557e-a0bd-2aa5-9e376759e129	besedilo
00240000-557e-a0bd-c2e2-3836c4b6112e	00230000-557e-a0bd-2aa5-9e376759e129	uprizoritev
00240000-557e-a0bd-c0ae-399c13123539	00230000-557e-a0bd-2aa5-9e376759e129	funkcija
00240000-557e-a0bd-2612-127b03c89806	00230000-557e-a0bd-2aa5-9e376759e129	tipfunkcije
00240000-557e-a0bd-49d9-589156bb36c9	00230000-557e-a0bd-2aa5-9e376759e129	alternacija
00240000-557e-a0bd-6b42-0bf44eacff6c	00230000-557e-a0bd-b632-d52d2f2e8dbb	pogodba
00240000-557e-a0bd-83a4-ded2dd1b647c	00230000-557e-a0bd-2aa5-9e376759e129	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7190171)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7189907)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7189571)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7189750)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557e-a0bf-1092-5a85b9da761f	00180000-557e-a0bf-29d9-fd152d7920eb	000c0000-557e-a0bf-c325-763c887e3de7	00090000-557e-a0bf-1069-d90a1b94875d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-a0bf-abbb-cd26282d765a	00180000-557e-a0bf-29d9-fd152d7920eb	000c0000-557e-a0bf-0949-3e8410c6ff9c	00090000-557e-a0bf-0553-2834936476f1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-a0bf-4117-08d373d87b12	00180000-557e-a0bf-29d9-fd152d7920eb	000c0000-557e-a0bf-b002-35b8ba8cc348	00090000-557e-a0bf-2faf-715f40615345	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-a0bf-aa40-91c606f0f547	00180000-557e-a0bf-29d9-fd152d7920eb	000c0000-557e-a0bf-0ad7-468896cde4bd	00090000-557e-a0bf-6e22-3223f7f8d054	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-a0bf-ad3c-1b8ac12c07e0	00180000-557e-a0bf-29d9-fd152d7920eb	000c0000-557e-a0bf-5a05-b25498ad4e0e	00090000-557e-a0bf-3902-cf2895f55088	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-a0bf-0079-6654d4c0f9e3	00180000-557e-a0bf-5088-517e197ff259	\N	00090000-557e-a0bf-3902-cf2895f55088	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7189951)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557e-a0bd-e70e-e36aa7d040ea	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557e-a0bd-94e1-6a5b311c58c4	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557e-a0bd-1ffc-b8d834f7c3ec	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557e-a0bd-e169-30c8fabf742f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557e-a0bd-50be-93f2197feb15	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557e-a0bd-5b26-215f7a82f40b	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557e-a0bd-590e-b3f3c86a679d	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557e-a0bd-98b9-bab14b4643d4	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557e-a0bd-aaf3-e5721f8db391	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557e-a0bd-0bc8-857e3c583af8	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557e-a0bd-59b7-b54f1adc1ca1	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557e-a0bd-88df-3fbc1c51d677	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557e-a0bd-16ec-b0ddc68efae7	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557e-a0bd-5acb-79bb828148ec	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557e-a0bd-0ce3-bacdb6994398	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557e-a0bd-06a9-20196a103a17	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7190140)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557e-a0bd-001c-549f79ed52ba	01	Velika predstava	f	1.00	1.00
002b0000-557e-a0bd-d393-1a0f14ec2e93	02	Mala predstava	f	0.50	0.50
002b0000-557e-a0bd-d1d5-ec87317c04a5	03	Mala koprodukcija	t	0.40	1.00
002b0000-557e-a0bd-b33f-9f3ab3b476fb	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557e-a0bd-af36-37715c62377e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7189634)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7189480)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557e-a0be-fa1c-80e63753f0cd	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeY9fHzOGDUhjPsf3CHdRgi7XFrmml5a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557e-a0be-c55d-f017195513d5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557e-a0bf-81d2-87b63a2e2793	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557e-a0bf-d1a3-6d2fde3c098e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557e-a0bf-c21b-66c341b9489e	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557e-a0bf-e94f-4bdcb003e226	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557e-a0bf-85e5-0e7d2604bbf7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557e-a0be-d5b9-9617a08a0f80	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7190008)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557e-a0bf-f007-5a893997773e	00160000-557e-a0be-ac42-33128dc59527	00150000-557e-a0bd-87f3-42e84937d34f	00140000-557e-a0bd-1866-9b565d853b2e	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557e-a0bf-b9ac-864116d943a8
000e0000-557e-a0bf-b1de-634cc89570d1	00160000-557e-a0be-4183-2719b12e29b2	00150000-557e-a0bd-d41d-265194e567a8	00140000-557e-a0bd-3404-78e945e60184	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557e-a0bf-730b-ef5be5303dcd
000e0000-557e-a0bf-d420-6b69d0defa6d	\N	00150000-557e-a0bd-d41d-265194e567a8	00140000-557e-a0bd-3404-78e945e60184	00190000-557e-a0bf-a0e6-0ad580b284e8	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557e-a0bf-b9ac-864116d943a8
000e0000-557e-a0bf-2454-4073a930b08d	\N	00150000-557e-a0bd-d41d-265194e567a8	00140000-557e-a0bd-3404-78e945e60184	00190000-557e-a0bf-a0e6-0ad580b284e8	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557e-a0bf-b9ac-864116d943a8
\.


--
-- TOC entry 2840 (class 0 OID 7189696)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557e-a0bf-d59a-d0c08667b13e	000e0000-557e-a0bf-b1de-634cc89570d1	1	
00200000-557e-a0bf-4cf3-7fdb400a2baf	000e0000-557e-a0bf-b1de-634cc89570d1	2	
\.


--
-- TOC entry 2855 (class 0 OID 7189821)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7189890)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7189728)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7189998)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557e-a0bd-1866-9b565d853b2e	01	Drama	drama (SURS 01)
00140000-557e-a0bd-72c2-d97ea663409b	02	Opera	opera (SURS 02)
00140000-557e-a0bd-c1bb-87a4614f92eb	03	Balet	balet (SURS 03)
00140000-557e-a0bd-4394-7e980bddbf02	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557e-a0bd-410d-c17b48d51425	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557e-a0bd-3404-78e945e60184	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557e-a0bd-2f6c-1fc25c601878	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7189880)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557e-a0bd-49b8-3ef10244e764	01	Opera	opera
00150000-557e-a0bd-81f4-58d9ae81a671	02	Opereta	opereta
00150000-557e-a0bd-f665-e5227270fee5	03	Balet	balet
00150000-557e-a0bd-c84d-502770e3e6f1	04	Plesne prireditve	plesne prireditve
00150000-557e-a0bd-31ed-ef12400917bb	05	Lutkovno gledališče	lutkovno gledališče
00150000-557e-a0bd-8fd1-3ab113125720	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557e-a0bd-2580-696d387e2a3d	07	Biografska drama	biografska drama
00150000-557e-a0bd-87f3-42e84937d34f	08	Komedija	komedija
00150000-557e-a0bd-5be6-76169733d9ca	09	Črna komedija	črna komedija
00150000-557e-a0bd-f478-3ad6e3dc3b21	10	E-igra	E-igra
00150000-557e-a0bd-d41d-265194e567a8	11	Kriminalka	kriminalka
00150000-557e-a0bd-b2c6-ca72a948cbd7	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7189534)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7190055)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7190045)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7189950)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7189718)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7189743)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7189660)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7190084)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7189876)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7189694)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7189737)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7189674)
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
-- TOC entry 2495 (class 2606 OID 7189786)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7189813)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7189632)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7189543)
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
-- TOC entry 2410 (class 2606 OID 7189567)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7189523)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7189508)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7189819)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7189852)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7189993)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7189596)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7189620)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7189792)
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
-- TOC entry 2425 (class 2606 OID 7189610)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7189681)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7189804)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7189932)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7189978)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7190099)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7190169)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7190116)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7190137)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7189836)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7189777)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7189768)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7189972)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7189904)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7189479)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7189843)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7189497)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7189517)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7189861)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7189799)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7189749)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7190193)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7190181)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7190175)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7189917)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7189576)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7189759)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7189961)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7190150)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7189645)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7189492)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7190024)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7189703)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7189827)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7189895)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7189732)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7190006)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7189888)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7189725)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7189918)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7189919)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7189598)
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
-- TOC entry 2508 (class 1259 OID 7189820)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7189806)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7189805)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7189704)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7189877)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7189879)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7189878)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7189676)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7189675)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7189995)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7189996)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7189997)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7190139)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7190138)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7190029)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7190026)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7190030)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7190028)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7190027)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7189647)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7189646)
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
-- TOC entry 2408 (class 1259 OID 7189570)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7189844)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7189738)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7189524)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7189525)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7189864)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7189863)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7189862)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7189682)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7189684)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7189683)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7190183)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7189772)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7189770)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7189769)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7189771)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7189498)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7189499)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7189828)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7189793)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7189905)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7189906)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7190085)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7190086)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7190087)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7189612)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7189611)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7189613)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7190170)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7189933)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7189934)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7190059)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7190061)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7190057)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7190060)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7190058)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7189896)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7189781)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7189780)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7189778)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7189779)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7190047)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7190046)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7190100)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7189695)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7189545)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7189544)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7189577)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7189578)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7189762)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7189761)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7189760)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7190119)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7190117)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7190118)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7189727)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7189723)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7189720)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7189721)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7189719)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7189724)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7189722)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7189597)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7189661)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7189663)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7189662)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7189664)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7189787)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7189994)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7190025)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7189568)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7189569)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7189889)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7190194)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7189633)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7190182)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7189838)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7189837)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7190056)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7189621)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7190007)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7189979)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7189980)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7189518)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7189726)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7190330)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7190315)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7190320)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7190340)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7190310)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7190335)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7190325)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7190485)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7190490)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7190245)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7190425)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7190420)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7190415)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7190305)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7190455)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7190465)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7190460)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7190280)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7190275)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7190405)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7190510)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7190515)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7190520)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7190625)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7190620)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7190540)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7190525)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7190545)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7190535)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7190530)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7190270)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7190265)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7190230)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7190225)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7190435)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7190345)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7190205)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7190210)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7190450)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7190445)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7190440)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7190285)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7190295)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7190290)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7190635)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7190380)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7190370)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7190365)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7190375)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7190195)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7190200)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7190430)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7190410)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7190475)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7190480)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7190585)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7190590)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7190595)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7190255)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7190250)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7190260)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7190630)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7190495)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7190500)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7190570)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7190580)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7190560)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7190575)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7190565)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7190470)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7190400)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7190395)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7190385)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7190390)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7190555)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7190550)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7190600)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7190300)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7190505)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7190220)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7190215)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7190235)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7190240)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7190360)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7190355)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7190350)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7190615)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7190605)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7190610)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-15 11:54:08 CEST

--
-- PostgreSQL database dump complete
--

