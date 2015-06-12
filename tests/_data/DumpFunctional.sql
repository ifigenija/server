--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-12 08:20:07 CEST

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
-- TOC entry 180 (class 1259 OID 6973526)
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
-- TOC entry 227 (class 1259 OID 6974048)
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
-- TOC entry 226 (class 1259 OID 6974031)
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
-- TOC entry 219 (class 1259 OID 6973935)
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
-- TOC entry 194 (class 1259 OID 6973705)
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
-- TOC entry 197 (class 1259 OID 6973739)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6973648)
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
-- TOC entry 228 (class 1259 OID 6974062)
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
-- TOC entry 213 (class 1259 OID 6973865)
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
-- TOC entry 192 (class 1259 OID 6973685)
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
-- TOC entry 196 (class 1259 OID 6973733)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6973665)
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
-- TOC entry 202 (class 1259 OID 6973782)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6973807)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6973622)
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
-- TOC entry 181 (class 1259 OID 6973535)
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
-- TOC entry 182 (class 1259 OID 6973546)
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
-- TOC entry 177 (class 1259 OID 6973500)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6973519)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6973814)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6973845)
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
-- TOC entry 223 (class 1259 OID 6973981)
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
-- TOC entry 184 (class 1259 OID 6973579)
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
-- TOC entry 186 (class 1259 OID 6973614)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6973788)
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
-- TOC entry 185 (class 1259 OID 6973599)
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
-- TOC entry 191 (class 1259 OID 6973677)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6973800)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6973920)
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
-- TOC entry 222 (class 1259 OID 6973973)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6974088)
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
-- TOC entry 233 (class 1259 OID 6974151)
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
-- TOC entry 230 (class 1259 OID 6974101)
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
-- TOC entry 231 (class 1259 OID 6974120)
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
-- TOC entry 209 (class 1259 OID 6973829)
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
-- TOC entry 201 (class 1259 OID 6973773)
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
-- TOC entry 200 (class 1259 OID 6973763)
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
-- TOC entry 221 (class 1259 OID 6973962)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6973897)
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
-- TOC entry 174 (class 1259 OID 6973471)
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
-- TOC entry 173 (class 1259 OID 6973469)
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
-- TOC entry 210 (class 1259 OID 6973839)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6973509)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6973493)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6973853)
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
-- TOC entry 204 (class 1259 OID 6973794)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6973744)
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
-- TOC entry 236 (class 1259 OID 6974184)
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
-- TOC entry 235 (class 1259 OID 6974176)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6974171)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6973907)
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
-- TOC entry 183 (class 1259 OID 6973571)
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
-- TOC entry 199 (class 1259 OID 6973750)
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
-- TOC entry 220 (class 1259 OID 6973951)
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
-- TOC entry 232 (class 1259 OID 6974140)
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
-- TOC entry 188 (class 1259 OID 6973634)
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
-- TOC entry 175 (class 1259 OID 6973480)
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
-- TOC entry 225 (class 1259 OID 6974008)
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
-- TOC entry 193 (class 1259 OID 6973696)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6973821)
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
-- TOC entry 215 (class 1259 OID 6973890)
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
-- TOC entry 195 (class 1259 OID 6973728)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6973998)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6973880)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 6973474)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 6973526)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 6974048)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557a-7a16-f0c3-64d7df798d8e	000d0000-557a-7a16-ebdf-f6b97c1f2169	\N	00090000-557a-7a16-0951-bdf412d47089	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-7a16-9757-45494fd86c24	000d0000-557a-7a16-33ac-c86361680ff9	\N	00090000-557a-7a16-0f84-29be9d512352	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-7a16-ec4b-eff00a8a1b61	000d0000-557a-7a16-13df-c4e46a667f43	\N	00090000-557a-7a16-3751-d87aab191410	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-7a16-00ed-d83b2c3e1c73	000d0000-557a-7a16-b245-25c87bb936e6	\N	00090000-557a-7a16-040e-23c224b6eb79	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-7a16-d058-56d43eca7ca0	000d0000-557a-7a16-9ce5-2be217f47b27	\N	00090000-557a-7a16-aa14-fffd24a0534e	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-7a16-be11-abf42fa16227	000d0000-557a-7a16-0341-0a0b091fa1ca	\N	00090000-557a-7a16-0f84-29be9d512352	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 6974031)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6973935)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557a-7a15-8208-8f25a3329132	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557a-7a15-b12a-b34d74b492c9	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557a-7a15-25f9-69e2c8ccefb5	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 6973705)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557a-7a16-70c3-f9c8db4d059b	\N	\N	00200000-557a-7a16-844c-c2d709893792	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557a-7a16-cf36-5965cc180396	\N	\N	00200000-557a-7a16-4555-c7c5c79edefa	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557a-7a16-b2b6-a8a000141a02	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557a-7a16-1bba-e2ae88a510b9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557a-7a16-d9a0-bdfe501ff9cb	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 6973739)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6973648)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557a-7a14-5e8b-2332c20608f4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557a-7a14-cd16-1c1d6964c37f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557a-7a14-69c9-f2bda55cc0a8	AL	ALB	008	Albania 	Albanija	\N
00040000-557a-7a14-a05f-19f6ad6102ea	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557a-7a14-878d-fc186046c881	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557a-7a14-3f3e-3abcc089820d	AD	AND	020	Andorra 	Andora	\N
00040000-557a-7a14-1295-251825e0286e	AO	AGO	024	Angola 	Angola	\N
00040000-557a-7a14-8916-db7ac52c12e4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557a-7a14-96e7-990c86174bee	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557a-7a14-d7db-e3e214bd25da	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-7a14-0f6d-44da67e3c2bd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557a-7a14-e224-883bcba30866	AM	ARM	051	Armenia 	Armenija	\N
00040000-557a-7a14-cddb-ef3c496e5fea	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557a-7a14-4392-db8a52c6900a	AU	AUS	036	Australia 	Avstralija	\N
00040000-557a-7a14-073e-535b6f9aec56	AT	AUT	040	Austria 	Avstrija	\N
00040000-557a-7a14-bb3a-a41dd28367d6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557a-7a14-03a3-35a6bba1f49c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557a-7a14-2c18-5167b54acc93	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557a-7a14-116f-c437cc294727	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557a-7a14-dbfc-7df79e962935	BB	BRB	052	Barbados 	Barbados	\N
00040000-557a-7a14-5454-318347516c67	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557a-7a14-0203-b62bf865bf69	BE	BEL	056	Belgium 	Belgija	\N
00040000-557a-7a14-3e45-484541d906b9	BZ	BLZ	084	Belize 	Belize	\N
00040000-557a-7a14-a8ae-7f19b4c0dd0e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557a-7a14-9629-029e9c656972	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557a-7a14-cd01-cdd3e9340e9d	BT	BTN	064	Bhutan 	Butan	\N
00040000-557a-7a14-4f4d-cb9e718e1857	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557a-7a14-dcec-827f76e8c387	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557a-7a14-3caa-dfc8d4a465bd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557a-7a14-a084-c096ecd6d2a9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557a-7a14-00c2-0839eaf9b86b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557a-7a14-6594-92f91899c014	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557a-7a14-ab58-1cf2ed7a5dea	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557a-7a14-716e-884ed92e3f8e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557a-7a14-04cc-aaaf80ee2d2f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557a-7a14-8571-32937e5e3bb3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557a-7a14-e2a0-bab0c7527b84	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557a-7a14-7039-41b47136c25d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557a-7a14-4c2d-40182067693b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557a-7a14-c8b8-0d4c8e20c5ae	CA	CAN	124	Canada 	Kanada	\N
00040000-557a-7a14-d8a5-3c9137cbdc35	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557a-7a14-9a4d-9fd2f2114adc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557a-7a14-83fb-e5e2c0ff09c8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557a-7a14-2570-c43e030675fb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557a-7a14-16c9-1575ea3314ed	CL	CHL	152	Chile 	Čile	\N
00040000-557a-7a14-1d00-f426bb211634	CN	CHN	156	China 	Kitajska	\N
00040000-557a-7a14-d98a-474511123577	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557a-7a14-3c33-f31d15c77758	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557a-7a14-69a4-8a79155bb4ce	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557a-7a14-7c48-b63e20d61a98	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557a-7a14-cdb2-8a334be5684f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557a-7a14-cdbc-1d1ed4896d1e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557a-7a14-71bc-bcbc2f584235	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557a-7a14-eb62-21d5eed1e15c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557a-7a14-eb12-bffc72abb2ee	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557a-7a14-6feb-63654158cfe1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557a-7a14-56ec-af96f3f334dc	CU	CUB	192	Cuba 	Kuba	\N
00040000-557a-7a14-8151-1af919a0ff82	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557a-7a14-c4a0-d9d3c50ee69d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557a-7a14-bdb0-1478f0d518bf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557a-7a14-75bb-200be2eeee68	DK	DNK	208	Denmark 	Danska	\N
00040000-557a-7a14-06bd-810da3845aca	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557a-7a14-12fb-a091d9fcb66e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-7a14-6e89-31efe516dd2f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557a-7a14-c1f5-8a25d8b91422	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557a-7a14-cbfb-6c80771e8e46	EG	EGY	818	Egypt 	Egipt	\N
00040000-557a-7a14-32f4-83cb71e1c382	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557a-7a14-e3ea-b85ce761c77a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557a-7a14-d557-ce16fa6a504a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557a-7a14-1769-c18e3302f5b7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557a-7a14-f7f4-eab7e07c6af1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557a-7a14-a967-629aee3219ab	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557a-7a14-1ca4-b87ebea1ee1c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557a-7a14-7d03-338e6ac89e3c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557a-7a14-4338-ce6a0434c58b	FI	FIN	246	Finland 	Finska	\N
00040000-557a-7a14-9434-1ba4492fb02e	FR	FRA	250	France 	Francija	\N
00040000-557a-7a14-2e67-556532f91ebd	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557a-7a14-b8ed-3e39a7603641	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557a-7a14-f2cc-d6d023a21924	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557a-7a14-4228-f1e5c756ef8b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557a-7a14-f55c-4c7ee1a7aafd	GA	GAB	266	Gabon 	Gabon	\N
00040000-557a-7a14-764b-42b85dc0d26d	GM	GMB	270	Gambia 	Gambija	\N
00040000-557a-7a14-2cca-fe4365960621	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557a-7a14-ec25-ee6c8c221a5f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557a-7a14-be6b-cdcd34f18fd6	GH	GHA	288	Ghana 	Gana	\N
00040000-557a-7a14-1bc3-7371a3479d47	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557a-7a14-56b2-4e2fdc4d7448	GR	GRC	300	Greece 	Grčija	\N
00040000-557a-7a14-43ea-fb67aff81f3b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557a-7a14-391f-7bd43a275a5a	GD	GRD	308	Grenada 	Grenada	\N
00040000-557a-7a14-2e47-546d33d0ab49	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557a-7a14-7d36-93eb5fa407d2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557a-7a14-ed53-b3bab7bf8c92	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557a-7a14-4a0d-16b47946cd7f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557a-7a14-cc37-6bfe4f3b8a68	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557a-7a14-f703-076b786ffc71	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557a-7a14-c7ab-f4c59655e7c4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557a-7a14-f42d-a2fcdd4d0e27	HT	HTI	332	Haiti 	Haiti	\N
00040000-557a-7a14-dcce-b8cc06b2b880	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557a-7a14-2efc-6fcebc2420a5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557a-7a14-825d-0d592e53219a	HN	HND	340	Honduras 	Honduras	\N
00040000-557a-7a14-c39f-7953dbc96d46	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557a-7a14-d244-41f33f089868	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557a-7a14-33b4-94bfaa4b01c1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557a-7a14-2437-b07c3f7e99b3	IN	IND	356	India 	Indija	\N
00040000-557a-7a14-7252-9ee99164203b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557a-7a14-393e-35c851c57669	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557a-7a14-40b1-5402abecb647	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557a-7a14-17c6-1d8ca3a09672	IE	IRL	372	Ireland 	Irska	\N
00040000-557a-7a14-aa65-66bbed7a42a2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557a-7a14-cb9d-b6fa78633836	IL	ISR	376	Israel 	Izrael	\N
00040000-557a-7a14-e07f-aba8246c60aa	IT	ITA	380	Italy 	Italija	\N
00040000-557a-7a14-9f4e-01c9dd1c5b96	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557a-7a14-694a-ca051c2dee3b	JP	JPN	392	Japan 	Japonska	\N
00040000-557a-7a14-058b-f78594df5b75	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557a-7a14-8213-d571fbbfb4b0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557a-7a14-edea-73f12703be0e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557a-7a14-25dd-c6218db84984	KE	KEN	404	Kenya 	Kenija	\N
00040000-557a-7a14-a01f-ffce2128e421	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557a-7a14-7e1b-77bc77ac514d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557a-7a14-01a5-5e3e4455cb9b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557a-7a14-f84b-8d0da4451e10	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557a-7a14-d619-ade7984d2782	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557a-7a14-0f71-9ef59df7ad27	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557a-7a14-d28a-c9d5c1201fbd	LV	LVA	428	Latvia 	Latvija	\N
00040000-557a-7a14-b589-829da8a7fc85	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557a-7a14-6249-d416bfd47e9a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557a-7a14-e2a2-e5edfdc6c23a	LR	LBR	430	Liberia 	Liberija	\N
00040000-557a-7a14-fcc8-d6abf029b1d8	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557a-7a14-8052-c29b15e1c695	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557a-7a14-0e4d-b452d0fc1722	LT	LTU	440	Lithuania 	Litva	\N
00040000-557a-7a14-bbb0-3694c73da24f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557a-7a14-9a22-0888db869215	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557a-7a14-5c36-f47e5fa72ee5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557a-7a14-9743-de8c59ddcc17	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557a-7a14-f205-1a224f28c37e	MW	MWI	454	Malawi 	Malavi	\N
00040000-557a-7a14-9fb8-ec5524f6b0be	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557a-7a14-7321-f34c343c393a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557a-7a14-3a74-9ab1a1bcb5e6	ML	MLI	466	Mali 	Mali	\N
00040000-557a-7a14-176d-78814668b15a	MT	MLT	470	Malta 	Malta	\N
00040000-557a-7a14-b5c9-d28ddaaa63f2	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557a-7a14-aac5-a33eb42b673b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557a-7a14-1340-f920da351242	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557a-7a14-f5a0-8076408034cf	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557a-7a14-63bc-b028f003ca44	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557a-7a14-3933-11ad6a09db76	MX	MEX	484	Mexico 	Mehika	\N
00040000-557a-7a14-c668-130b53252d44	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557a-7a14-933a-896840fbb113	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557a-7a14-0844-1eb7cefb03df	MC	MCO	492	Monaco 	Monako	\N
00040000-557a-7a14-b7cb-5c732d83e584	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557a-7a14-1ad9-4118d3fb2472	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557a-7a14-0e9f-ab0dba405f20	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557a-7a14-c341-1948089d9a81	MA	MAR	504	Morocco 	Maroko	\N
00040000-557a-7a14-2751-2c8f336b2551	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557a-7a14-69d6-e5bf3872c2a8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557a-7a14-83ca-23d875b78494	NA	NAM	516	Namibia 	Namibija	\N
00040000-557a-7a14-7e48-e6f3f848304b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557a-7a14-9e33-bd45abb1cf96	NP	NPL	524	Nepal 	Nepal	\N
00040000-557a-7a14-fece-744f1b0a7059	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557a-7a14-6ef5-960b3c4bee95	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557a-7a14-92de-0d034cc316eb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557a-7a14-359f-0c81aa433b15	NE	NER	562	Niger 	Niger 	\N
00040000-557a-7a14-f2a0-e53a59459859	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557a-7a14-b5af-9a665ea315d2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557a-7a14-97f9-d73a64d31256	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557a-7a14-1c3b-b3644dca908a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557a-7a14-03ca-9cadf6e624ad	NO	NOR	578	Norway 	Norveška	\N
00040000-557a-7a14-eb66-e625cb8be2b9	OM	OMN	512	Oman 	Oman	\N
00040000-557a-7a14-60b5-9728e0545dee	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557a-7a14-1d69-b36cf619768e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557a-7a14-87ef-6535c9944fb5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557a-7a14-627e-f637c19e5aee	PA	PAN	591	Panama 	Panama	\N
00040000-557a-7a14-b6f5-6e3160e1d06d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557a-7a14-e194-515b28e0c709	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557a-7a14-6d84-536951f8a269	PE	PER	604	Peru 	Peru	\N
00040000-557a-7a14-8425-f18e7df77fbf	PH	PHL	608	Philippines 	Filipini	\N
00040000-557a-7a14-8805-e7b31861a385	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557a-7a14-4bcb-514ea126d4f7	PL	POL	616	Poland 	Poljska	\N
00040000-557a-7a14-a760-712b22351813	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557a-7a14-60b0-d26ba5ed58b6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557a-7a14-15d0-2920600ce17c	QA	QAT	634	Qatar 	Katar	\N
00040000-557a-7a14-db6e-12ddcc3297c9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557a-7a14-cd7a-cf0c49f985da	RO	ROU	642	Romania 	Romunija	\N
00040000-557a-7a14-bac2-774bf632794b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557a-7a14-f934-78f2cc42880b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557a-7a14-f4e1-ec74e38d8eac	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557a-7a14-5456-42ebb4970db0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557a-7a14-3fe1-743b4672fc51	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557a-7a14-0dfc-36af13ffccbd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557a-7a14-3cc1-122d15620ca5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557a-7a14-15b9-b2fa5b1f7bea	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557a-7a14-64c3-fb82ae1489bd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557a-7a14-f941-d17056b5ff72	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557a-7a14-1352-f68ce86c57ee	SM	SMR	674	San Marino 	San Marino	\N
00040000-557a-7a14-0036-4b878b2a815f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557a-7a14-ee5a-791284c4e4f8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557a-7a14-9050-bf5b3d40bc96	SN	SEN	686	Senegal 	Senegal	\N
00040000-557a-7a14-e08c-77a753ae5764	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557a-7a14-4786-7574fa91f531	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557a-7a14-1270-018601e646f7	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557a-7a14-d53f-7a41d8731eef	SG	SGP	702	Singapore 	Singapur	\N
00040000-557a-7a14-efd5-a0b0470f1f8a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557a-7a14-7ca7-1e28b572d279	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557a-7a14-ccac-d4049fadf03c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557a-7a14-6a46-73246766b02a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557a-7a14-f785-2a5add82620f	SO	SOM	706	Somalia 	Somalija	\N
00040000-557a-7a14-914e-d4bfe187851a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557a-7a14-5600-92ac5bad76fe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557a-7a14-813e-fbbae93393d0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557a-7a14-d7d7-643bc0db8aa3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557a-7a14-6d3e-b7d254824bc3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557a-7a14-cacb-4ae74de870aa	SD	SDN	729	Sudan 	Sudan	\N
00040000-557a-7a14-a128-f028d101ab7f	SR	SUR	740	Suriname 	Surinam	\N
00040000-557a-7a14-1ab6-4f505bac3bc0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557a-7a14-3605-f5c0d1bd7d38	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557a-7a14-5f5b-6091b780aa3a	SE	SWE	752	Sweden 	Švedska	\N
00040000-557a-7a14-27f8-d63c558552c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557a-7a14-1ccc-6d8f9e224145	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557a-7a14-5b8b-6925d448e685	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557a-7a14-a9c9-589c0ec05978	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557a-7a14-990d-ee80420f7081	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557a-7a14-7743-f3634335d2a5	TH	THA	764	Thailand 	Tajska	\N
00040000-557a-7a14-cdd0-e8cba92af717	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557a-7a14-a071-49dfe1799c68	TG	TGO	768	Togo 	Togo	\N
00040000-557a-7a14-9585-4326eddc5377	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557a-7a14-2926-b9b0fab4d0e3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557a-7a14-8504-ff8dfc318b54	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557a-7a14-5fe4-e789fea53d7f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557a-7a14-56fc-7c9d4d23eeb3	TR	TUR	792	Turkey 	Turčija	\N
00040000-557a-7a14-2cb8-b19b8f8f3fa4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557a-7a14-84e4-7c3320dafc8c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-7a14-81f4-667c65cb1263	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557a-7a14-b331-ec0087c4c191	UG	UGA	800	Uganda 	Uganda	\N
00040000-557a-7a14-bf37-22380df2ed8c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557a-7a14-5041-a08d2227e0cf	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557a-7a14-34d4-317aeec59bf3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557a-7a14-a521-7041a44b7d74	US	USA	840	United States 	Združene države Amerike	\N
00040000-557a-7a14-174f-ccb559f3b981	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557a-7a14-40ee-2a4c8e6556ad	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557a-7a14-9bb9-7c09fb8dc2a6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557a-7a14-9fd5-3b41af874621	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557a-7a14-8425-76293c520852	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557a-7a14-4d8d-7e586a2a18e0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557a-7a14-2851-7479c3c9d4dc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-7a14-b4cc-ff1fdbcc3658	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557a-7a14-b48c-998f9714147c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557a-7a14-a6f2-3b6e12f1f012	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557a-7a14-4f06-eb4b5da6f7b1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557a-7a14-fc6a-9ad2d96f0be7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557a-7a14-ce55-265c764639cf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 6974062)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 6973865)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557a-7a16-488c-81be3049fb8b	000e0000-557a-7a16-fde3-dce04c60bac2	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557a-7a14-5f0f-063b4ff5a2b2
000d0000-557a-7a16-ebdf-f6b97c1f2169	000e0000-557a-7a16-fde3-dce04c60bac2	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-7a14-5f0f-063b4ff5a2b2
000d0000-557a-7a16-33ac-c86361680ff9	000e0000-557a-7a16-fde3-dce04c60bac2	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557a-7a14-e1b2-97a96357ff33
000d0000-557a-7a16-13df-c4e46a667f43	000e0000-557a-7a16-fde3-dce04c60bac2	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557a-7a14-7a8a-22b064764160
000d0000-557a-7a16-b245-25c87bb936e6	000e0000-557a-7a16-fde3-dce04c60bac2	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557a-7a14-7a8a-22b064764160
000d0000-557a-7a16-9ce5-2be217f47b27	000e0000-557a-7a16-fde3-dce04c60bac2	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557a-7a14-7a8a-22b064764160
000d0000-557a-7a16-0341-0a0b091fa1ca	000e0000-557a-7a16-fde3-dce04c60bac2	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-7a14-5f0f-063b4ff5a2b2
\.


--
-- TOC entry 2839 (class 0 OID 6973685)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6973733)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6973665)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557a-7a16-42c0-b118571f11c1	00080000-557a-7a16-c0f3-c711e2583141	00090000-557a-7a16-0951-bdf412d47089	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6973782)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6973807)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6973622)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557a-7a14-15ca-08404d4367b0	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557a-7a14-e301-5d76ce7df652	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557a-7a14-9c7d-008a34818525	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557a-7a14-983d-aa5a3b00f95e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557a-7a14-70e3-a08e6350ff47	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557a-7a14-145c-352408b50f12	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557a-7a14-7393-feb8d9897318	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557a-7a14-f1e1-717ee978729d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557a-7a14-4433-7a821f41b04f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557a-7a14-ba88-13fb908a4c76	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557a-7a14-e482-596daa4c502e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557a-7a14-9347-c2113e6ed738	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557a-7a14-5ad8-3126bd7e269c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-7a14-4741-9eee9aed680d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-7a14-de40-9a463e62cac9	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557a-7a14-bea0-d385bce4ad7e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 6973535)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557a-7a14-6a79-b1d9dd22ff53	00000000-557a-7a14-70e3-a08e6350ff47	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557a-7a14-408c-137bbaa5b4e1	00000000-557a-7a14-70e3-a08e6350ff47	00010000-557a-7a14-130c-efce3e85dc7c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557a-7a14-4198-6f8195e548ff	00000000-557a-7a14-145c-352408b50f12	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 6973546)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557a-7a16-0b69-9c833bfa7e85	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557a-7a16-040e-23c224b6eb79	00010000-557a-7a15-4751-60fa25c4533f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557a-7a16-3751-d87aab191410	00010000-557a-7a15-4976-54de30a733c1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557a-7a16-f5b8-d6a6da6a094a	00010000-557a-7a15-4a58-34ad6f77ba01	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557a-7a16-ce64-6986f29698b7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557a-7a16-5832-c485db633ffa	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557a-7a16-8d6c-74fd2499dc0a	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557a-7a16-7968-90177609ab5d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557a-7a16-0951-bdf412d47089	00010000-557a-7a15-024a-6cd63ecd7f45	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557a-7a16-0f84-29be9d512352	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557a-7a16-8924-fed579614b5b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557a-7a16-aa14-fffd24a0534e	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557a-7a16-9f81-35bc52c9f001	00010000-557a-7a15-454c-c2389837dff0	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6973500)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557a-7a14-bda7-24696e218292	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557a-7a14-1c88-bfc3654ff20e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557a-7a14-31fb-bc6902a7bffa	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557a-7a14-1722-094caf7d81ff	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557a-7a14-f5f5-f3e5570ab65b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557a-7a14-0d69-7fe740e545e6	Abonma-read	Abonma - branje	f
00030000-557a-7a14-5549-d8faac241878	Abonma-write	Abonma - spreminjanje	f
00030000-557a-7a14-3d58-a549813349bd	Alternacija-read	Alternacija - branje	f
00030000-557a-7a14-8bd4-729fb7dc62cc	Alternacija-write	Alternacija - spreminjanje	f
00030000-557a-7a14-5229-1c89e2239315	Arhivalija-read	Arhivalija - branje	f
00030000-557a-7a14-c1fc-09f011d121e7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557a-7a14-10fc-07909ee64119	Besedilo-read	Besedilo - branje	f
00030000-557a-7a14-7ac5-69ee141c38b9	Besedilo-write	Besedilo - spreminjanje	f
00030000-557a-7a14-2d6b-b0b1d5f9108f	DogodekIzven-read	DogodekIzven - branje	f
00030000-557a-7a14-b0a5-5becc2a1d622	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557a-7a14-5369-c2ad42b3d7f4	Dogodek-read	Dogodek - branje	f
00030000-557a-7a14-e447-a5ac61981634	Dogodek-write	Dogodek - spreminjanje	f
00030000-557a-7a14-6c25-b9c01762189f	Drzava-read	Drzava - branje	f
00030000-557a-7a14-cbf4-9a232634ae83	Drzava-write	Drzava - spreminjanje	f
00030000-557a-7a14-da32-851da601121d	Funkcija-read	Funkcija - branje	f
00030000-557a-7a14-a149-40ec37fd160d	Funkcija-write	Funkcija - spreminjanje	f
00030000-557a-7a14-7dea-9201e5497b17	Gostovanje-read	Gostovanje - branje	f
00030000-557a-7a14-bd03-f44eaaefdc9c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557a-7a14-7548-287b75a2603a	Gostujoca-read	Gostujoca - branje	f
00030000-557a-7a14-d587-a0aab35a46b2	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557a-7a14-659a-a27dc17a8311	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557a-7a14-5fe3-405ca154c7c1	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557a-7a14-4df7-e683eedc3476	Kupec-read	Kupec - branje	f
00030000-557a-7a14-d50f-ced9417a23c1	Kupec-write	Kupec - spreminjanje	f
00030000-557a-7a14-108f-dea6f3d3c43c	NacinPlacina-read	NacinPlacina - branje	f
00030000-557a-7a14-489f-08688f676b65	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557a-7a14-80c5-159d8620c0ef	Option-read	Option - branje	f
00030000-557a-7a14-9dec-e5fe5e850c24	Option-write	Option - spreminjanje	f
00030000-557a-7a14-72fd-468e979650e7	OptionValue-read	OptionValue - branje	f
00030000-557a-7a14-4305-4a2bebbbd111	OptionValue-write	OptionValue - spreminjanje	f
00030000-557a-7a14-4445-e3d30f4d80e0	Oseba-read	Oseba - branje	f
00030000-557a-7a14-3500-4a48eda9cad3	Oseba-write	Oseba - spreminjanje	f
00030000-557a-7a14-c9d4-b39f8a8c8e77	Permission-read	Permission - branje	f
00030000-557a-7a14-5bbe-f7e3f46f1b85	Permission-write	Permission - spreminjanje	f
00030000-557a-7a14-ff93-1ca785a83d35	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557a-7a14-b93c-e6286cd2a356	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557a-7a14-2bd6-dee6e13e883c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557a-7a14-d72e-39af2ba8c108	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557a-7a14-628b-cef42b65e56b	Pogodba-read	Pogodba - branje	f
00030000-557a-7a14-2cd4-7733c335c927	Pogodba-write	Pogodba - spreminjanje	f
00030000-557a-7a14-a020-0b22d68c1994	Popa-read	Popa - branje	f
00030000-557a-7a14-160e-2c6ccca9a91a	Popa-write	Popa - spreminjanje	f
00030000-557a-7a14-dcaf-30b4e8640d69	Posta-read	Posta - branje	f
00030000-557a-7a14-a182-c182c32f3563	Posta-write	Posta - spreminjanje	f
00030000-557a-7a14-f902-c431c027ecc4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557a-7a14-16a7-cfeea3ab04e7	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557a-7a14-c992-64bd883795f3	PostniNaslov-read	PostniNaslov - branje	f
00030000-557a-7a14-6653-0c95e85055be	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557a-7a14-2c09-43ff9e79ecd6	Predstava-read	Predstava - branje	f
00030000-557a-7a14-9c4e-6b6e3591ee08	Predstava-write	Predstava - spreminjanje	f
00030000-557a-7a14-135f-c37d6bc4cd5e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557a-7a14-9f03-54aeaf2d2bae	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557a-7a14-1626-f3383eb02c00	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557a-7a14-c78b-cac0028b00f6	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557a-7a14-97f2-d27562fe5ead	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557a-7a14-1fe4-f0c692da10c1	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557a-7a14-fb84-00a066c820ff	ProgramDela-read	ProgramDela - branje	f
00030000-557a-7a14-fb4c-03a5341a72d3	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557a-7a14-3bfd-bdceb92d9b80	ProgramFestival-read	ProgramFestival - branje	f
00030000-557a-7a14-075d-49a97fe12b3b	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557a-7a14-496c-343d1b194470	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557a-7a14-b767-c15fa2106511	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557a-7a14-424c-949d6c5cda8e	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557a-7a14-a7a7-d0a007024776	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557a-7a14-324e-ec27ca9f9884	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557a-7a14-5149-bfc3ebf259d2	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557a-7a14-f51d-53bf0c89e752	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557a-7a14-c288-d9b973b7f3b9	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557a-7a14-a1e2-417d4ee45f42	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557a-7a14-4d72-877b111b1f16	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557a-7a14-bcec-d261fe9a43c9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557a-7a14-3bb6-00aa39f95d7a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557a-7a14-ef7b-67cad2f718e4	ProgramRazno-read	ProgramRazno - branje	f
00030000-557a-7a14-619c-2137fd3daa92	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557a-7a14-9905-6f0e5c5e4ee2	Prostor-read	Prostor - branje	f
00030000-557a-7a14-cf22-b703892064f1	Prostor-write	Prostor - spreminjanje	f
00030000-557a-7a14-10be-2a3c6cee0606	Racun-read	Racun - branje	f
00030000-557a-7a14-3adb-38691bed6fc0	Racun-write	Racun - spreminjanje	f
00030000-557a-7a14-6b6c-7dcf0e25e1ea	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557a-7a14-afa1-b7bbd477c686	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557a-7a14-9751-8abc97f74dd5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557a-7a14-02a3-bd8701131420	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557a-7a14-a476-fdf580ed9d52	Rekvizit-read	Rekvizit - branje	f
00030000-557a-7a14-6d84-f9809fc7e329	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557a-7a14-6824-f26941c569cf	Revizija-read	Revizija - branje	f
00030000-557a-7a14-d27c-058ee9938565	Revizija-write	Revizija - spreminjanje	f
00030000-557a-7a14-b0d4-e7bd3002ed33	Rezervacija-read	Rezervacija - branje	f
00030000-557a-7a14-9f79-6a70c0a3217e	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557a-7a14-a381-41e91359d834	Role-read	Role - branje	f
00030000-557a-7a14-492b-9c2f28793e82	Role-write	Role - spreminjanje	f
00030000-557a-7a14-f9a5-814321c44ece	SedezniRed-read	SedezniRed - branje	f
00030000-557a-7a14-99d7-7f714e51c3cc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557a-7a14-7efd-0544e0ef9597	Sedez-read	Sedez - branje	f
00030000-557a-7a14-9dae-3470681da0e7	Sedez-write	Sedez - spreminjanje	f
00030000-557a-7a14-c9a1-b239ac8667c7	Sezona-read	Sezona - branje	f
00030000-557a-7a14-b056-05c1bf58ddd1	Sezona-write	Sezona - spreminjanje	f
00030000-557a-7a14-c772-2f7287ac97df	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557a-7a14-fd8a-f8ffd7cc038e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557a-7a14-1240-0046d1e8e512	Stevilcenje-read	Stevilcenje - branje	f
00030000-557a-7a14-356d-13c159b6aeed	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557a-7a14-ba7e-2bdab8381b9d	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557a-7a14-0ae5-6f5c9df0ddaf	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557a-7a14-e39e-8c86838bf796	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557a-7a14-c2e6-a2587f9d855d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557a-7a14-ec85-6abde3e152c4	Telefonska-read	Telefonska - branje	f
00030000-557a-7a14-9844-e60d5b1a21d7	Telefonska-write	Telefonska - spreminjanje	f
00030000-557a-7a14-eb0e-6cbdd1669fc7	TerminStoritve-read	TerminStoritve - branje	f
00030000-557a-7a14-7046-dd8976c5bb8d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557a-7a14-9d17-eb9f749835af	TipFunkcije-read	TipFunkcije - branje	f
00030000-557a-7a14-7de7-e04517a8b74e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557a-7a14-7d8e-4abc1e7d98fa	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557a-7a14-9b06-0e829f0f2fd0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557a-7a14-d6fe-454eb30167f3	Trr-read	Trr - branje	f
00030000-557a-7a14-16e8-4118f4df6c75	Trr-write	Trr - spreminjanje	f
00030000-557a-7a14-cae1-69cb4c7800eb	Uprizoritev-read	Uprizoritev - branje	f
00030000-557a-7a14-c8c9-e80a495c8205	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557a-7a14-4137-e75093727a62	User-read	User - branje	f
00030000-557a-7a14-7681-b5e1adcb8e7b	User-write	User - spreminjanje	f
00030000-557a-7a14-7e8a-b16371dd1a1d	Vaja-read	Vaja - branje	f
00030000-557a-7a14-aa39-699b643f67ca	Vaja-write	Vaja - spreminjanje	f
00030000-557a-7a14-f1f0-35442103266a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557a-7a14-478a-35a60d2ab6f4	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557a-7a14-7c47-0ddd7043eb56	Zaposlitev-read	Zaposlitev - branje	f
00030000-557a-7a14-22b8-ab138c25d446	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557a-7a14-88b2-e8ae56b6a01a	Zasedenost-read	Zasedenost - branje	f
00030000-557a-7a14-458b-071f95d283df	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557a-7a14-ab41-e30ab786edc2	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557a-7a14-9ff5-6ab575b57546	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557a-7a14-e05f-228553f2698a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557a-7a14-2021-d20c51db85d8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 6973519)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557a-7a14-c3a4-dcfd9ab9cd9d	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-0d69-7fe740e545e6
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-5549-d8faac241878
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-3d58-a549813349bd
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-8bd4-729fb7dc62cc
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-5229-1c89e2239315
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-5369-c2ad42b3d7f4
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-1722-094caf7d81ff
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-e447-a5ac61981634
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-cbf4-9a232634ae83
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-da32-851da601121d
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-a149-40ec37fd160d
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-7dea-9201e5497b17
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-bd03-f44eaaefdc9c
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-7548-287b75a2603a
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-d587-a0aab35a46b2
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-659a-a27dc17a8311
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-5fe3-405ca154c7c1
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-80c5-159d8620c0ef
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-72fd-468e979650e7
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-4445-e3d30f4d80e0
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-3500-4a48eda9cad3
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-a020-0b22d68c1994
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-160e-2c6ccca9a91a
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-dcaf-30b4e8640d69
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-a182-c182c32f3563
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-c992-64bd883795f3
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-6653-0c95e85055be
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-2c09-43ff9e79ecd6
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-9c4e-6b6e3591ee08
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-97f2-d27562fe5ead
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-1fe4-f0c692da10c1
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-9905-6f0e5c5e4ee2
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-cf22-b703892064f1
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-9751-8abc97f74dd5
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-02a3-bd8701131420
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-a476-fdf580ed9d52
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-6d84-f9809fc7e329
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-c9a1-b239ac8667c7
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-b056-05c1bf58ddd1
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-9d17-eb9f749835af
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-cae1-69cb4c7800eb
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-c8c9-e80a495c8205
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-7e8a-b16371dd1a1d
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-aa39-699b643f67ca
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-88b2-e8ae56b6a01a
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-458b-071f95d283df
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-ab41-e30ab786edc2
00020000-557a-7a14-e892-086bcd93f499	00030000-557a-7a14-e05f-228553f2698a
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-0d69-7fe740e545e6
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-5229-1c89e2239315
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-5369-c2ad42b3d7f4
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-7dea-9201e5497b17
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-7548-287b75a2603a
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-659a-a27dc17a8311
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-5fe3-405ca154c7c1
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-80c5-159d8620c0ef
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-72fd-468e979650e7
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-4445-e3d30f4d80e0
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-3500-4a48eda9cad3
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-a020-0b22d68c1994
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-dcaf-30b4e8640d69
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-c992-64bd883795f3
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-6653-0c95e85055be
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-2c09-43ff9e79ecd6
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-9905-6f0e5c5e4ee2
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-9751-8abc97f74dd5
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-a476-fdf580ed9d52
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-c9a1-b239ac8667c7
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-ec85-6abde3e152c4
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-9844-e60d5b1a21d7
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-d6fe-454eb30167f3
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-16e8-4118f4df6c75
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-7c47-0ddd7043eb56
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-22b8-ab138c25d446
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-ab41-e30ab786edc2
00020000-557a-7a14-83ea-89b7ef1f1535	00030000-557a-7a14-e05f-228553f2698a
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-0d69-7fe740e545e6
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-3d58-a549813349bd
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-5229-1c89e2239315
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-c1fc-09f011d121e7
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-10fc-07909ee64119
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-2d6b-b0b1d5f9108f
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-5369-c2ad42b3d7f4
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-da32-851da601121d
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-7dea-9201e5497b17
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-7548-287b75a2603a
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-659a-a27dc17a8311
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-80c5-159d8620c0ef
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-72fd-468e979650e7
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-4445-e3d30f4d80e0
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-a020-0b22d68c1994
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-dcaf-30b4e8640d69
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-2c09-43ff9e79ecd6
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-97f2-d27562fe5ead
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-9905-6f0e5c5e4ee2
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-9751-8abc97f74dd5
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-a476-fdf580ed9d52
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-c9a1-b239ac8667c7
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-9d17-eb9f749835af
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-7e8a-b16371dd1a1d
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-88b2-e8ae56b6a01a
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-ab41-e30ab786edc2
00020000-557a-7a14-4e7b-55214313e85a	00030000-557a-7a14-e05f-228553f2698a
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-0d69-7fe740e545e6
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-5549-d8faac241878
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-8bd4-729fb7dc62cc
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-5229-1c89e2239315
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-5369-c2ad42b3d7f4
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-7dea-9201e5497b17
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-7548-287b75a2603a
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-80c5-159d8620c0ef
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-72fd-468e979650e7
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-a020-0b22d68c1994
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-dcaf-30b4e8640d69
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-2c09-43ff9e79ecd6
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-9905-6f0e5c5e4ee2
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-9751-8abc97f74dd5
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-a476-fdf580ed9d52
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-c9a1-b239ac8667c7
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-9d17-eb9f749835af
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-ab41-e30ab786edc2
00020000-557a-7a14-4609-33b50733145d	00030000-557a-7a14-e05f-228553f2698a
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-0d69-7fe740e545e6
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-5229-1c89e2239315
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-5369-c2ad42b3d7f4
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-6c25-b9c01762189f
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-7dea-9201e5497b17
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-7548-287b75a2603a
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-80c5-159d8620c0ef
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-72fd-468e979650e7
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-a020-0b22d68c1994
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-dcaf-30b4e8640d69
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-2c09-43ff9e79ecd6
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-9905-6f0e5c5e4ee2
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-9751-8abc97f74dd5
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-a476-fdf580ed9d52
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-c9a1-b239ac8667c7
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-eb0e-6cbdd1669fc7
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-31fb-bc6902a7bffa
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-9d17-eb9f749835af
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-ab41-e30ab786edc2
00020000-557a-7a14-6672-fe478dc0393f	00030000-557a-7a14-e05f-228553f2698a
\.


--
-- TOC entry 2854 (class 0 OID 6973814)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6973845)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 6973981)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6973579)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557a-7a16-c0f3-c711e2583141	00040000-557a-7a14-5e8b-2332c20608f4	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-7a16-e746-004cd6147293	00040000-557a-7a14-5e8b-2332c20608f4	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-7a16-87f9-629f04b91500	00040000-557a-7a14-5e8b-2332c20608f4	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-7a16-17ae-013a80cbd853	00040000-557a-7a14-5e8b-2332c20608f4	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 6973614)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557a-7a13-3348-28aa2bfc46a4	8341	Adlešiči
00050000-557a-7a13-9429-e155f6d4f726	5270	Ajdovščina
00050000-557a-7a13-e399-6a246041d8f4	6280	Ankaran/Ancarano
00050000-557a-7a13-ede2-ef45bf0f4985	9253	Apače
00050000-557a-7a13-7ac1-27f913f78dbe	8253	Artiče
00050000-557a-7a13-7b40-a2ccc63bc47c	4275	Begunje na Gorenjskem
00050000-557a-7a13-ad72-411df0db5c0e	1382	Begunje pri Cerknici
00050000-557a-7a13-2506-30074e6dfb0e	9231	Beltinci
00050000-557a-7a13-1303-ec5c0fc5cc1d	2234	Benedikt
00050000-557a-7a13-4069-147f792db1f1	2345	Bistrica ob Dravi
00050000-557a-7a13-a513-38c58ba97e61	3256	Bistrica ob Sotli
00050000-557a-7a13-8675-e22c8c044831	8259	Bizeljsko
00050000-557a-7a13-b7a2-8002b8667116	1223	Blagovica
00050000-557a-7a13-cca5-96b5ac2de173	8283	Blanca
00050000-557a-7a13-d237-e21c9d5f78cb	4260	Bled
00050000-557a-7a13-1eaf-a04f0e754582	4273	Blejska Dobrava
00050000-557a-7a13-a6c0-941ff1c43b2f	9265	Bodonci
00050000-557a-7a13-ffe3-943c4f7cd6bf	9222	Bogojina
00050000-557a-7a13-3225-8e6a92430399	4263	Bohinjska Bela
00050000-557a-7a13-d49f-51442aa6b7fa	4264	Bohinjska Bistrica
00050000-557a-7a13-c0f9-ad913485c8ff	4265	Bohinjsko jezero
00050000-557a-7a13-4b30-aeae460c298b	1353	Borovnica
00050000-557a-7a13-294e-abc4025937c3	8294	Boštanj
00050000-557a-7a13-4ae2-ef47c541121a	5230	Bovec
00050000-557a-7a13-0546-0e3b0cd84cdf	5295	Branik
00050000-557a-7a13-5ced-6d4be668337a	3314	Braslovče
00050000-557a-7a13-ca1f-4d43b3897f15	5223	Breginj
00050000-557a-7a13-99e5-f0c0ea2383ad	8280	Brestanica
00050000-557a-7a13-73e7-bde0524fe8ac	2354	Bresternica
00050000-557a-7a13-66c3-88d4ea4fc5ff	4243	Brezje
00050000-557a-7a13-090d-10a7e10a241a	1351	Brezovica pri Ljubljani
00050000-557a-7a13-b2bf-ec178dca4ae1	8250	Brežice
00050000-557a-7a13-30b8-168c377a5565	4210	Brnik - Aerodrom
00050000-557a-7a13-0a0f-e21e04eb6dfe	8321	Brusnice
00050000-557a-7a13-2cfd-49e26395f27b	3255	Buče
00050000-557a-7a13-7865-97c41abf6889	8276	Bučka 
00050000-557a-7a13-e88e-291fc3101a7c	9261	Cankova
00050000-557a-7a13-0426-0a40fd6cc580	3000	Celje 
00050000-557a-7a13-9645-c72cf86dd4fc	3001	Celje - poštni predali
00050000-557a-7a13-ec81-2c765307e083	4207	Cerklje na Gorenjskem
00050000-557a-7a13-14d9-3f002a9f9d2e	8263	Cerklje ob Krki
00050000-557a-7a13-8e23-7b8efe31bc7c	1380	Cerknica
00050000-557a-7a13-704e-91b783c9350b	5282	Cerkno
00050000-557a-7a13-56ee-9b325c6377cd	2236	Cerkvenjak
00050000-557a-7a13-a718-ae4bcbe432a7	2215	Ceršak
00050000-557a-7a13-1979-42361566927b	2326	Cirkovce
00050000-557a-7a13-ff15-3f98e28118a4	2282	Cirkulane
00050000-557a-7a13-7362-f940e9e7ccdc	5273	Col
00050000-557a-7a13-974f-be5046bd4b9f	8251	Čatež ob Savi
00050000-557a-7a13-5eb2-48cbe92927f9	1413	Čemšenik
00050000-557a-7a13-f3ed-32f2df51caf7	5253	Čepovan
00050000-557a-7a13-bdd0-76d8e5b7b431	9232	Črenšovci
00050000-557a-7a13-5193-fabfb2c8b673	2393	Črna na Koroškem
00050000-557a-7a13-5a7d-e6b88fcb050b	6275	Črni Kal
00050000-557a-7a13-3367-91eb52ea0d13	5274	Črni Vrh nad Idrijo
00050000-557a-7a13-18d6-31a23091b32a	5262	Črniče
00050000-557a-7a13-88f7-ddbd06415fda	8340	Črnomelj
00050000-557a-7a13-128f-c70ae7491bc0	6271	Dekani
00050000-557a-7a13-b5fe-7865f960280a	5210	Deskle
00050000-557a-7a13-a7b2-9df794971b94	2253	Destrnik
00050000-557a-7a13-dcea-f9560b1a0cb4	6215	Divača
00050000-557a-7a13-54df-50b009959465	1233	Dob
00050000-557a-7a13-9018-f91a205059cd	3224	Dobje pri Planini
00050000-557a-7a13-679f-6a1d834aa556	8257	Dobova
00050000-557a-7a13-feff-67225e58822c	1423	Dobovec
00050000-557a-7a13-3a0d-46d1c3251cdd	5263	Dobravlje
00050000-557a-7a13-0df0-9b9531fe6b91	3204	Dobrna
00050000-557a-7a13-d687-274f5e655fd5	8211	Dobrnič
00050000-557a-7a13-f001-10812d021dcf	1356	Dobrova
00050000-557a-7a13-950d-59ca5f8f7308	9223	Dobrovnik/Dobronak 
00050000-557a-7a13-69a1-883d754e99c8	5212	Dobrovo v Brdih
00050000-557a-7a13-6cb1-d517f10ed43c	1431	Dol pri Hrastniku
00050000-557a-7a13-f1db-66cd07534f3d	1262	Dol pri Ljubljani
00050000-557a-7a13-84fa-cadab6bc3b0f	1273	Dole pri Litiji
00050000-557a-7a13-2c10-f917a56936f1	1331	Dolenja vas
00050000-557a-7a13-89d4-ab86c1ec35a1	8350	Dolenjske Toplice
00050000-557a-7a13-63b3-2f6fba1e95a4	1230	Domžale
00050000-557a-7a13-8a13-dd143967aeaa	2252	Dornava
00050000-557a-7a13-d171-8a83940af9bd	5294	Dornberk
00050000-557a-7a13-b45b-89f27a23986d	1319	Draga
00050000-557a-7a13-5f11-21d25a77d97d	8343	Dragatuš
00050000-557a-7a13-260f-3cfd7da7ea50	3222	Dramlje
00050000-557a-7a13-60f5-f3d7d91fac20	2370	Dravograd
00050000-557a-7a13-9f83-c050b688fc79	4203	Duplje
00050000-557a-7a13-2266-2015673d9f73	6221	Dutovlje
00050000-557a-7a13-1522-58824c6db53f	8361	Dvor
00050000-557a-7a13-06b0-0b24f9f1f8a6	2343	Fala
00050000-557a-7a13-ba3b-abf0ba7dfff6	9208	Fokovci
00050000-557a-7a13-c803-6d6599b947c9	2313	Fram
00050000-557a-7a13-3cd8-13719f3e2745	3213	Frankolovo
00050000-557a-7a13-cac7-1ab7efe256fe	1274	Gabrovka
00050000-557a-7a13-4b35-1ea55bc1d3dc	8254	Globoko
00050000-557a-7a13-02ba-964b5e9dd890	5275	Godovič
00050000-557a-7a13-c9d5-a7f4660c2fb7	4204	Golnik
00050000-557a-7a13-8283-e4ab8f344d36	3303	Gomilsko
00050000-557a-7a13-9f33-5b51ecdff72a	4224	Gorenja vas
00050000-557a-7a13-87e7-1b993bffd5ba	3263	Gorica pri Slivnici
00050000-557a-7a13-5a48-4b8f87f6fec9	2272	Gorišnica
00050000-557a-7a13-c3f3-8c07f4da579f	9250	Gornja Radgona
00050000-557a-7a13-b57c-650160c4f4c2	3342	Gornji Grad
00050000-557a-7a13-01de-8232f60ad28e	4282	Gozd Martuljek
00050000-557a-7a13-efc4-706fb71a64e0	6272	Gračišče
00050000-557a-7a13-c587-289ff4dd93b8	9264	Grad
00050000-557a-7a13-d019-41805344e678	8332	Gradac
00050000-557a-7a13-de6f-15f947fc95c1	1384	Grahovo
00050000-557a-7a13-1f32-d833d1b63bfe	5242	Grahovo ob Bači
00050000-557a-7a13-5270-10e9ef1cface	5251	Grgar
00050000-557a-7a13-780f-3111880f8bfb	3302	Griže
00050000-557a-7a13-200b-70f798568156	3231	Grobelno
00050000-557a-7a13-4fcc-2dade1b23694	1290	Grosuplje
00050000-557a-7a13-d47c-f4d5b00fa721	2288	Hajdina
00050000-557a-7a13-677a-b86970c7e99e	8362	Hinje
00050000-557a-7a13-0cbb-0a4aaade62ba	2311	Hoče
00050000-557a-7a13-1e0e-733259043cd1	9205	Hodoš/Hodos
00050000-557a-7a13-b9cd-6a4b26458ae7	1354	Horjul
00050000-557a-7a13-2928-9c64a0d52146	1372	Hotedršica
00050000-557a-7a13-7602-5c93010d657c	1430	Hrastnik
00050000-557a-7a13-ac2e-280eac4c114a	6225	Hruševje
00050000-557a-7a13-e50a-b5812a1081a3	4276	Hrušica
00050000-557a-7a13-4d76-16da1277d769	5280	Idrija
00050000-557a-7a13-bf98-6138939743e3	1292	Ig
00050000-557a-7a13-e71c-70aa791ee0a0	6250	Ilirska Bistrica
00050000-557a-7a13-27e3-31edd80ef3d2	6251	Ilirska Bistrica-Trnovo
00050000-557a-7a13-27a9-f171a1da7983	1295	Ivančna Gorica
00050000-557a-7a13-554a-2f0a964515f0	2259	Ivanjkovci
00050000-557a-7a13-e0d4-8ab3060874f1	1411	Izlake
00050000-557a-7a13-24b4-b2cf3aca71f4	6310	Izola/Isola
00050000-557a-7a13-95aa-46b57086f567	2222	Jakobski Dol
00050000-557a-7a13-8833-4d58590e5085	2221	Jarenina
00050000-557a-7a13-4129-391108b867c0	6254	Jelšane
00050000-557a-7a13-dcb7-b777e4a7769f	4270	Jesenice
00050000-557a-7a13-bb3f-bc06a52e5285	8261	Jesenice na Dolenjskem
00050000-557a-7a13-9a51-143b89a1f23d	3273	Jurklošter
00050000-557a-7a13-b9d3-17863af9e3c9	2223	Jurovski Dol
00050000-557a-7a13-4abd-a70f80cc8cf7	2256	Juršinci
00050000-557a-7a13-2977-dcf94b42b91c	5214	Kal nad Kanalom
00050000-557a-7a13-4300-6db1fa8e04ad	3233	Kalobje
00050000-557a-7a13-fe43-5be1b8d9f453	4246	Kamna Gorica
00050000-557a-7a13-2050-a07aa90b4a00	2351	Kamnica
00050000-557a-7a13-ba4a-57dc1cfa886a	1241	Kamnik
00050000-557a-7a13-9605-03f659878263	5213	Kanal
00050000-557a-7a13-625c-c501854bdea3	8258	Kapele
00050000-557a-7a13-e46e-e4b74f378471	2362	Kapla
00050000-557a-7a13-c108-26eebbc4379e	2325	Kidričevo
00050000-557a-7a13-05ad-62beb55f6bd3	1412	Kisovec
00050000-557a-7a13-fb14-ebbf12c6b230	6253	Knežak
00050000-557a-7a13-21df-cbe16fd76a16	5222	Kobarid
00050000-557a-7a13-14c4-b0cc6229a181	9227	Kobilje
00050000-557a-7a13-45c1-3addda760c78	1330	Kočevje
00050000-557a-7a13-aee3-3c7626cee533	1338	Kočevska Reka
00050000-557a-7a13-fc1e-398eb45148b4	2276	Kog
00050000-557a-7a13-0cbc-a5ac1454a431	5211	Kojsko
00050000-557a-7a13-66d4-a690024bd44c	6223	Komen
00050000-557a-7a13-bf07-3d7674541861	1218	Komenda
00050000-557a-7a13-e7f3-b4238b515060	6000	Koper/Capodistria 
00050000-557a-7a13-209d-d8cf72103af9	6001	Koper/Capodistria - poštni predali
00050000-557a-7a13-dca8-92b1dbba003d	8282	Koprivnica
00050000-557a-7a13-d2ff-3a0209ce5cac	5296	Kostanjevica na Krasu
00050000-557a-7a13-6414-cafcdf09dae9	8311	Kostanjevica na Krki
00050000-557a-7a13-d138-be1c7a82b2f6	1336	Kostel
00050000-557a-7a13-5d7d-9bcb692946a6	6256	Košana
00050000-557a-7a13-9e0e-9b2f83d1c11c	2394	Kotlje
00050000-557a-7a13-e7bb-12f58e062e13	6240	Kozina
00050000-557a-7a13-1842-534912f02360	3260	Kozje
00050000-557a-7a13-31d4-8c9620f572c2	4000	Kranj 
00050000-557a-7a13-cd46-126aca5587a7	4001	Kranj - poštni predali
00050000-557a-7a13-942e-b99e93423cf4	4280	Kranjska Gora
00050000-557a-7a13-97d3-0bb80c5d8573	1281	Kresnice
00050000-557a-7a13-16f1-0c4dfcd8197b	4294	Križe
00050000-557a-7a13-5ede-718945a8aacb	9206	Križevci
00050000-557a-7a13-a987-55c8b2379152	9242	Križevci pri Ljutomeru
00050000-557a-7a13-514c-c7c6c03a3c6b	1301	Krka
00050000-557a-7a13-68c6-12acd8bd8d42	8296	Krmelj
00050000-557a-7a13-aacb-c2f1cc2fe507	4245	Kropa
00050000-557a-7a13-d33c-56e0bc34ca86	8262	Krška vas
00050000-557a-7a13-22ce-3d7aebd52795	8270	Krško
00050000-557a-7a13-bd10-03bd3629ba04	9263	Kuzma
00050000-557a-7a13-b1e0-2bfb34045e91	2318	Laporje
00050000-557a-7a13-7933-aa7d039212fe	3270	Laško
00050000-557a-7a13-2671-e0b964420b1c	1219	Laze v Tuhinju
00050000-557a-7a13-916d-68cd10d1003c	2230	Lenart v Slovenskih goricah
00050000-557a-7a13-6255-7fe240d4c3a1	9220	Lendava/Lendva
00050000-557a-7a13-c0d9-a86f318dddb8	4248	Lesce
00050000-557a-7a13-c4b2-fe4c15f2904a	3261	Lesično
00050000-557a-7a13-ad2a-1a7a2b7088d4	8273	Leskovec pri Krškem
00050000-557a-7a13-8543-d5543df43ba6	2372	Libeliče
00050000-557a-7a13-e7fb-d5a485f758d4	2341	Limbuš
00050000-557a-7a13-04b5-513b944af500	1270	Litija
00050000-557a-7a13-842c-6ca0f77fe49f	3202	Ljubečna
00050000-557a-7a13-6e62-a22a164eeded	1000	Ljubljana 
00050000-557a-7a13-e29d-45a9150191d4	1001	Ljubljana - poštni predali
00050000-557a-7a13-3319-ce7e734cb9c4	1231	Ljubljana - Črnuče
00050000-557a-7a13-c4f1-68db3ccf5122	1261	Ljubljana - Dobrunje
00050000-557a-7a13-d0b3-63aed749dc1b	1260	Ljubljana - Polje
00050000-557a-7a13-63f5-a5d0f6e277de	1210	Ljubljana - Šentvid
00050000-557a-7a13-2d42-c75f8619f98f	1211	Ljubljana - Šmartno
00050000-557a-7a13-04de-0811723a9a73	3333	Ljubno ob Savinji
00050000-557a-7a13-6489-d1d146d0b901	9240	Ljutomer
00050000-557a-7a13-426b-2aa8d9b5a2e8	3215	Loče
00050000-557a-7a13-5bcc-ce44c27f17e4	5231	Log pod Mangartom
00050000-557a-7a13-ccef-05141f75330f	1358	Log pri Brezovici
00050000-557a-7a13-c3f6-acbe08ae4ec1	1370	Logatec
00050000-557a-7a13-2175-c9c39691b421	1371	Logatec
00050000-557a-7a13-6ecb-11ed70ced487	1434	Loka pri Zidanem Mostu
00050000-557a-7a13-656f-ab74b0ba468e	3223	Loka pri Žusmu
00050000-557a-7a13-6700-879c3d32c3cb	6219	Lokev
00050000-557a-7a13-896d-76e710aa1b99	1318	Loški Potok
00050000-557a-7a13-93f4-956ae164a76d	2324	Lovrenc na Dravskem polju
00050000-557a-7a13-8323-7215a6d854d8	2344	Lovrenc na Pohorju
00050000-557a-7a13-c6dc-e643d92f9a3d	3334	Luče
00050000-557a-7a13-766b-0caf8973d244	1225	Lukovica
00050000-557a-7a13-66e1-065032fa5c79	9202	Mačkovci
00050000-557a-7a13-9dbb-e68df0456f3e	2322	Majšperk
00050000-557a-7a13-6784-45a1423a3862	2321	Makole
00050000-557a-7a13-228e-dc9e1c80af59	9243	Mala Nedelja
00050000-557a-7a13-bc11-a4cd7713c3cf	2229	Malečnik
00050000-557a-7a13-3394-1ca25cb04320	6273	Marezige
00050000-557a-7a13-0ce3-45c72c00cbf1	2000	Maribor 
00050000-557a-7a13-7e09-ee0bd74b45a6	2001	Maribor - poštni predali
00050000-557a-7a13-8d21-509428e106a2	2206	Marjeta na Dravskem polju
00050000-557a-7a13-854b-593a9e2552a8	2281	Markovci
00050000-557a-7a13-efde-a25a96200e54	9221	Martjanci
00050000-557a-7a13-c1ad-21b1ff0c7259	6242	Materija
00050000-557a-7a13-4ed6-b3e9fb8179d5	4211	Mavčiče
00050000-557a-7a13-3b8b-d0e2dbe63c43	1215	Medvode
00050000-557a-7a13-edf0-69e444612281	1234	Mengeš
00050000-557a-7a13-bb31-59d477839447	8330	Metlika
00050000-557a-7a13-7b1a-b9cb6ff850c1	2392	Mežica
00050000-557a-7a13-5635-b1cbf6782634	2204	Miklavž na Dravskem polju
00050000-557a-7a13-e0bb-b571020b2f83	2275	Miklavž pri Ormožu
00050000-557a-7a13-6f7f-bb7f43fad4e5	5291	Miren
00050000-557a-7a13-dc2c-b1d831971f3d	8233	Mirna
00050000-557a-7a13-fd6e-8012dd1785fa	8216	Mirna Peč
00050000-557a-7a13-06d9-a06cedca2796	2382	Mislinja
00050000-557a-7a13-9ae8-fb35d326f829	4281	Mojstrana
00050000-557a-7a13-8e71-4e7499d404b6	8230	Mokronog
00050000-557a-7a13-e38f-fe274abaf114	1251	Moravče
00050000-557a-7a13-1d9a-8a1c2d347d91	9226	Moravske Toplice
00050000-557a-7a13-c2e7-0d5289e007e3	5216	Most na Soči
00050000-557a-7a13-2a67-d6450067fb88	1221	Motnik
00050000-557a-7a13-4b8f-07084c7e31ae	3330	Mozirje
00050000-557a-7a13-f98d-5adfec59bf6d	9000	Murska Sobota 
00050000-557a-7a13-e543-5a473b1f0b21	9001	Murska Sobota - poštni predali
00050000-557a-7a13-96a0-8145e4ffb843	2366	Muta
00050000-557a-7a13-edd2-04d3b8457b82	4202	Naklo
00050000-557a-7a13-f0a1-8b8fd3882ce5	3331	Nazarje
00050000-557a-7a13-dadc-a09a86c27ec1	1357	Notranje Gorice
00050000-557a-7a13-1e07-64df11c7bd3c	3203	Nova Cerkev
00050000-557a-7a13-b27f-4c0f34fcd78b	5000	Nova Gorica 
00050000-557a-7a13-25a4-dd605829fb8f	5001	Nova Gorica - poštni predali
00050000-557a-7a13-72f1-624b696f6913	1385	Nova vas
00050000-557a-7a13-2f53-0a738ba00263	8000	Novo mesto
00050000-557a-7a13-e3ca-8d81c2d7927b	8001	Novo mesto - poštni predali
00050000-557a-7a13-ef05-ea3e0ac50009	6243	Obrov
00050000-557a-7a13-00be-6dcd4e64fcda	9233	Odranci
00050000-557a-7a13-11e9-0e72b88c2ddb	2317	Oplotnica
00050000-557a-7a13-a7c9-16ec450bc927	2312	Orehova vas
00050000-557a-7a13-c0fe-f3994806e627	2270	Ormož
00050000-557a-7a13-1967-0c550452790d	1316	Ortnek
00050000-557a-7a13-0a3c-0dd941c36dd4	1337	Osilnica
00050000-557a-7a13-41c7-6e48373ba479	8222	Otočec
00050000-557a-7a13-1274-5b3916da34f2	2361	Ožbalt
00050000-557a-7a13-c535-81c9e50ba0d0	2231	Pernica
00050000-557a-7a13-864a-16888063ceb1	2211	Pesnica pri Mariboru
00050000-557a-7a13-d968-7f161d81bb1b	9203	Petrovci
00050000-557a-7a13-1fa1-2e0fdf953465	3301	Petrovče
00050000-557a-7a13-b117-a7be8a4f46bf	6330	Piran/Pirano
00050000-557a-7a13-10c3-d520528270e9	8255	Pišece
00050000-557a-7a13-d584-98090303e3d8	6257	Pivka
00050000-557a-7a13-7c07-07e36c4a3171	6232	Planina
00050000-557a-7a13-9be2-5ca27c1d8fe1	3225	Planina pri Sevnici
00050000-557a-7a13-d963-dfb4fd935078	6276	Pobegi
00050000-557a-7a13-7ae1-bade6c9a9867	8312	Podbočje
00050000-557a-7a13-8dbb-f3ee2880b1c0	5243	Podbrdo
00050000-557a-7a13-1ba8-214d9d4382a8	3254	Podčetrtek
00050000-557a-7a13-4ea1-fedfab6eb50e	2273	Podgorci
00050000-557a-7a13-bd00-1705418d272a	6216	Podgorje
00050000-557a-7a13-2e1c-18cc0873dbe5	2381	Podgorje pri Slovenj Gradcu
00050000-557a-7a13-ef47-1651ea178539	6244	Podgrad
00050000-557a-7a13-1e8c-94ae0652d277	1414	Podkum
00050000-557a-7a13-52ca-aa63a465342e	2286	Podlehnik
00050000-557a-7a13-ccae-f5eb55e3b93b	5272	Podnanos
00050000-557a-7a13-04fc-4628ed541506	4244	Podnart
00050000-557a-7a13-f29e-b2ce6071601c	3241	Podplat
00050000-557a-7a13-f847-14c7343cc6a7	3257	Podsreda
00050000-557a-7a13-188d-2cf9eb35f5dc	2363	Podvelka
00050000-557a-7a13-410a-64d89effaa17	2208	Pohorje
00050000-557a-7a13-9c1b-6f9b1de8e950	2257	Polenšak
00050000-557a-7a13-aa1e-0cbd2d54613f	1355	Polhov Gradec
00050000-557a-7a13-be0f-970f8ff1a17a	4223	Poljane nad Škofjo Loko
00050000-557a-7a13-c965-d57e4b61f0ec	2319	Poljčane
00050000-557a-7a13-b0df-dd9fc8c6c870	1272	Polšnik
00050000-557a-7a13-c410-900618dcc6ed	3313	Polzela
00050000-557a-7a13-dd29-aecae50bda26	3232	Ponikva
00050000-557a-7a13-458d-de5f54f66692	6320	Portorož/Portorose
00050000-557a-7a13-6215-2ea1f7812b62	6230	Postojna
00050000-557a-7a13-02a5-074022f1af42	2331	Pragersko
00050000-557a-7a13-0669-f84d28743c49	3312	Prebold
00050000-557a-7a13-c7fb-89b554125002	4205	Preddvor
00050000-557a-7a13-6922-12f8fa11b939	6255	Prem
00050000-557a-7a13-4bfc-2fd2df4ecac4	1352	Preserje
00050000-557a-7a13-98da-1318fd958ed0	6258	Prestranek
00050000-557a-7a13-d7fb-8beaf98561f1	2391	Prevalje
00050000-557a-7a13-3d04-43b50e73e793	3262	Prevorje
00050000-557a-7a13-4d1e-52374144d015	1276	Primskovo 
00050000-557a-7a13-ab16-6df66d747e77	3253	Pristava pri Mestinju
00050000-557a-7a13-ce15-9efd8ab939cc	9207	Prosenjakovci/Partosfalva
00050000-557a-7a13-1635-1fdff569a03f	5297	Prvačina
00050000-557a-7a13-b36a-4a2a28a0059f	2250	Ptuj
00050000-557a-7a13-1c94-6d70f5fca81a	2323	Ptujska Gora
00050000-557a-7a13-6e5f-68ea49986bd8	9201	Puconci
00050000-557a-7a13-f1d5-6a28eae55561	2327	Rače
00050000-557a-7a13-d338-f3485925e54c	1433	Radeče
00050000-557a-7a13-1bfb-0618df3ca3e5	9252	Radenci
00050000-557a-7a13-8655-affdb1a3bc0b	2360	Radlje ob Dravi
00050000-557a-7a13-768e-4a0a2ebb9857	1235	Radomlje
00050000-557a-7a13-139a-62075e79cd8e	4240	Radovljica
00050000-557a-7a13-0c9e-b0283b247e10	8274	Raka
00050000-557a-7a13-214f-62822ea619ff	1381	Rakek
00050000-557a-7a13-7649-b3999ac87513	4283	Rateče - Planica
00050000-557a-7a13-3bb5-cc3f3828e93e	2390	Ravne na Koroškem
00050000-557a-7a13-ef2f-ebe8da0a9061	9246	Razkrižje
00050000-557a-7a13-ae0f-dc7c5f490251	3332	Rečica ob Savinji
00050000-557a-7a13-335f-5f9ec5f55a0e	5292	Renče
00050000-557a-7a13-b7db-3fa687cc22d1	1310	Ribnica
00050000-557a-7a13-399b-fa06944508eb	2364	Ribnica na Pohorju
00050000-557a-7a13-c3ad-e313b87bcf64	3272	Rimske Toplice
00050000-557a-7a13-99ea-386b61777a1c	1314	Rob
00050000-557a-7a13-4cb3-0c4873d1ec72	5215	Ročinj
00050000-557a-7a13-7aef-f707af708e8b	3250	Rogaška Slatina
00050000-557a-7a13-7f38-23c631fd4a76	9262	Rogašovci
00050000-557a-7a13-d623-343067511f76	3252	Rogatec
00050000-557a-7a13-7a4d-b022b256f2ab	1373	Rovte
00050000-557a-7a13-11f2-2a03b3f3c392	2342	Ruše
00050000-557a-7a13-5157-73dcc2a48200	1282	Sava
00050000-557a-7a13-b68e-11c677092230	6333	Sečovlje/Sicciole
00050000-557a-7a13-10f4-7a4f8df5e4fe	4227	Selca
00050000-557a-7a13-3eda-1b0589ef65ad	2352	Selnica ob Dravi
00050000-557a-7a13-3340-4c982204708a	8333	Semič
00050000-557a-7a13-157b-8e7d5fc46bc1	8281	Senovo
00050000-557a-7a13-ebb0-901a757ef53f	6224	Senožeče
00050000-557a-7a13-7078-e246b8a7cbd2	8290	Sevnica
00050000-557a-7a13-7e9d-41c1c36f0adb	6210	Sežana
00050000-557a-7a13-534e-4656bf0eabf8	2214	Sladki Vrh
00050000-557a-7a13-e0a5-0d92eaabc68e	5283	Slap ob Idrijci
00050000-557a-7a13-09e2-1904c8f4c63f	2380	Slovenj Gradec
00050000-557a-7a13-dfc0-5ed9f8167e1d	2310	Slovenska Bistrica
00050000-557a-7a13-345d-aa57d7a730d6	3210	Slovenske Konjice
00050000-557a-7a13-25a4-cfe3a977bc58	1216	Smlednik
00050000-557a-7a13-e9a9-d86fac1de779	5232	Soča
00050000-557a-7a13-e57f-fdce9135c39a	1317	Sodražica
00050000-557a-7a13-bed8-cf6307a8521f	3335	Solčava
00050000-557a-7a13-a42d-730c8ccdb6fc	5250	Solkan
00050000-557a-7a13-6a6b-13472df67d5b	4229	Sorica
00050000-557a-7a13-9d58-5a4c169326e1	4225	Sovodenj
00050000-557a-7a13-5180-3406a21aac13	5281	Spodnja Idrija
00050000-557a-7a13-3fff-f3cc2f7a23cc	2241	Spodnji Duplek
00050000-557a-7a13-1bee-2a80f178e2a1	9245	Spodnji Ivanjci
00050000-557a-7a13-0324-435843530f54	2277	Središče ob Dravi
00050000-557a-7a13-0d4a-4e63fa7751cd	4267	Srednja vas v Bohinju
00050000-557a-7a13-d3a7-a7f138c930b5	8256	Sromlje 
00050000-557a-7a13-680d-bb43012df64a	5224	Srpenica
00050000-557a-7a13-7771-6f5b51b1e7c1	1242	Stahovica
00050000-557a-7a13-79b5-b686beec6a8c	1332	Stara Cerkev
00050000-557a-7a13-8428-d0f945ef8558	8342	Stari trg ob Kolpi
00050000-557a-7a13-6f44-ca54cf863f8d	1386	Stari trg pri Ložu
00050000-557a-7a13-2b2a-559f60d3dac5	2205	Starše
00050000-557a-7a13-b00c-31f36d8abea0	2289	Stoperce
00050000-557a-7a13-461a-9182f1c3ad77	8322	Stopiče
00050000-557a-7a13-fc18-f0e684d851f9	3206	Stranice
00050000-557a-7a13-87ff-872e18dd2ba4	8351	Straža
00050000-557a-7a13-f038-34e47aafce22	1313	Struge
00050000-557a-7a13-3bae-59818bde95c9	8293	Studenec
00050000-557a-7a13-e837-83ca478f3e15	8331	Suhor
00050000-557a-7a13-c388-22d2b97db929	2233	Sv. Ana v Slovenskih goricah
00050000-557a-7a13-4714-21ac6f933430	2235	Sv. Trojica v Slovenskih goricah
00050000-557a-7a13-97a9-0c246a4fa918	2353	Sveti Duh na Ostrem Vrhu
00050000-557a-7a13-ab7b-8c95de8f6a18	9244	Sveti Jurij ob Ščavnici
00050000-557a-7a13-71c8-a396ff65eed7	3264	Sveti Štefan
00050000-557a-7a13-287f-5a5b922a575a	2258	Sveti Tomaž
00050000-557a-7a13-1e5f-5da28a98d507	9204	Šalovci
00050000-557a-7a13-4fff-931f0882592a	5261	Šempas
00050000-557a-7a13-20fe-e0384306dc1e	5290	Šempeter pri Gorici
00050000-557a-7a13-4223-43f4314ae4c9	3311	Šempeter v Savinjski dolini
00050000-557a-7a13-8915-d9e6d944f5c1	4208	Šenčur
00050000-557a-7a13-2210-fbd2f366abaa	2212	Šentilj v Slovenskih goricah
00050000-557a-7a13-62d9-0a13c387e09c	8297	Šentjanž
00050000-557a-7a13-b2d2-16ff6f3eaca9	2373	Šentjanž pri Dravogradu
00050000-557a-7a13-5d35-0760a8a77e39	8310	Šentjernej
00050000-557a-7a13-385c-68a126db997c	3230	Šentjur
00050000-557a-7a13-1bd6-8f0fa82e031f	3271	Šentrupert
00050000-557a-7a13-0b6f-96595d610122	8232	Šentrupert
00050000-557a-7a13-934d-6d68c6cae75a	1296	Šentvid pri Stični
00050000-557a-7a13-d46f-487c79649dff	8275	Škocjan
00050000-557a-7a13-f2a6-bf6e117d57cd	6281	Škofije
00050000-557a-7a13-5172-8079c0cff074	4220	Škofja Loka
00050000-557a-7a13-3795-19797ec599b1	3211	Škofja vas
00050000-557a-7a13-5198-ef1f7451536b	1291	Škofljica
00050000-557a-7a13-b02f-f27863873902	6274	Šmarje
00050000-557a-7a13-9e81-687fa42d93e6	1293	Šmarje - Sap
00050000-557a-7a13-4bf7-f7a05513c1ab	3240	Šmarje pri Jelšah
00050000-557a-7a13-e98e-23de25e1e783	8220	Šmarješke Toplice
00050000-557a-7a13-55bb-c25e91dc0389	2315	Šmartno na Pohorju
00050000-557a-7a13-2a3a-e2fe1d80cd24	3341	Šmartno ob Dreti
00050000-557a-7a13-733d-aafe463ebd2f	3327	Šmartno ob Paki
00050000-557a-7a13-0b1e-e96627345be7	1275	Šmartno pri Litiji
00050000-557a-7a13-65af-1e3e3f422e41	2383	Šmartno pri Slovenj Gradcu
00050000-557a-7a13-955d-156ad2a6e4ed	3201	Šmartno v Rožni dolini
00050000-557a-7a13-d939-5ee4e6f096fc	3325	Šoštanj
00050000-557a-7a13-59fa-28d40e721d3e	6222	Štanjel
00050000-557a-7a13-e38a-4659d4556f7e	3220	Štore
00050000-557a-7a13-67bd-6444a3f2bcde	3304	Tabor
00050000-557a-7a13-98f5-2cd1eef4d566	3221	Teharje
00050000-557a-7a13-6173-8cc8066abe2b	9251	Tišina
00050000-557a-7a13-05ad-1fe4f54d6e0f	5220	Tolmin
00050000-557a-7a13-f162-12547caac53d	3326	Topolšica
00050000-557a-7a13-6cc7-d510194ec31d	2371	Trbonje
00050000-557a-7a13-1c51-7975732585f7	1420	Trbovlje
00050000-557a-7a13-ab4c-e322fde36475	8231	Trebelno 
00050000-557a-7a13-6ed3-49b372fde84c	8210	Trebnje
00050000-557a-7a13-a8b1-d6b7c84fa2bf	5252	Trnovo pri Gorici
00050000-557a-7a13-5867-dc5445232c97	2254	Trnovska vas
00050000-557a-7a13-1361-3065d7d2f5d3	1222	Trojane
00050000-557a-7a13-991d-fcc7c8ddb270	1236	Trzin
00050000-557a-7a13-6ac8-365081baa8da	4290	Tržič
00050000-557a-7a13-11be-e1f0b93e521d	8295	Tržišče
00050000-557a-7a13-428a-ee9c39cb6259	1311	Turjak
00050000-557a-7a13-5230-2736070ffbd0	9224	Turnišče
00050000-557a-7a13-b50e-7787dcef89da	8323	Uršna sela
00050000-557a-7a13-5596-f3269b916011	1252	Vače
00050000-557a-7a13-f7b1-d9417b1e9834	3320	Velenje 
00050000-557a-7a13-2ca8-d26d925e42d4	3322	Velenje - poštni predali
00050000-557a-7a13-6bc2-bcd9f2de8128	8212	Velika Loka
00050000-557a-7a13-37e7-8743c491bca3	2274	Velika Nedelja
00050000-557a-7a13-ddc6-fb87a8f72c56	9225	Velika Polana
00050000-557a-7a13-b144-3ae9723cca42	1315	Velike Lašče
00050000-557a-7a13-627e-fda68e1efc19	8213	Veliki Gaber
00050000-557a-7a13-e888-ed947abf620b	9241	Veržej
00050000-557a-7a13-ce25-214270035d0e	1312	Videm - Dobrepolje
00050000-557a-7a13-9b06-1e9af2831ee8	2284	Videm pri Ptuju
00050000-557a-7a13-1cff-9631c03e6fbc	8344	Vinica
00050000-557a-7a13-9e83-a90040c5bfdb	5271	Vipava
00050000-557a-7a13-448a-a576d9982b20	4212	Visoko
00050000-557a-7a13-65d1-1decc2ac5a7c	1294	Višnja Gora
00050000-557a-7a13-1391-9f868a2792b6	3205	Vitanje
00050000-557a-7a13-e24a-b4537b0a4a2f	2255	Vitomarci
00050000-557a-7a13-2e47-7a59b0a8f8a8	1217	Vodice
00050000-557a-7a13-8dcd-d32adfe213ad	3212	Vojnik\t
00050000-557a-7a13-c33b-3a9e31b9e681	5293	Volčja Draga
00050000-557a-7a13-8a21-64e705e9d58c	2232	Voličina
00050000-557a-7a13-0471-7d29dcaa6eaf	3305	Vransko
00050000-557a-7a13-192f-0e1837ae66e4	6217	Vremski Britof
00050000-557a-7a13-47a8-eef0fdb037e7	1360	Vrhnika
00050000-557a-7a13-85dd-f8eb209c2ab4	2365	Vuhred
00050000-557a-7a13-e31e-11f9d77f1510	2367	Vuzenica
00050000-557a-7a13-f938-2f870224f01d	8292	Zabukovje 
00050000-557a-7a13-24da-81de4219e363	1410	Zagorje ob Savi
00050000-557a-7a13-945e-843f1b87dc7d	1303	Zagradec
00050000-557a-7a13-ddd3-94bc392b8d34	2283	Zavrč
00050000-557a-7a13-aa27-a0480194233c	8272	Zdole 
00050000-557a-7a13-acb0-18b461621ba7	4201	Zgornja Besnica
00050000-557a-7a13-d90b-54e495dd3d50	2242	Zgornja Korena
00050000-557a-7a13-6dc1-f56df2d32b37	2201	Zgornja Kungota
00050000-557a-7a13-c720-da5877ef708f	2316	Zgornja Ložnica
00050000-557a-7a13-8805-835b6256c56f	2314	Zgornja Polskava
00050000-557a-7a13-dde8-8bcae49a1a63	2213	Zgornja Velka
00050000-557a-7a13-bd47-d88fced70876	4247	Zgornje Gorje
00050000-557a-7a13-b47c-8d803f53a84c	4206	Zgornje Jezersko
00050000-557a-7a13-74db-54601d70b5d4	2285	Zgornji Leskovec
00050000-557a-7a13-efa6-3c5ca6395b75	1432	Zidani Most
00050000-557a-7a13-9542-63e40ba99a7c	3214	Zreče
00050000-557a-7a13-a366-771443ad68c3	4209	Žabnica
00050000-557a-7a13-5db8-212b398f08a5	3310	Žalec
00050000-557a-7a13-c468-1df028e0d2dd	4228	Železniki
00050000-557a-7a13-27fb-120eb2956822	2287	Žetale
00050000-557a-7a13-4104-5cabf1ef2912	4226	Žiri
00050000-557a-7a13-cc32-aba611e0154d	4274	Žirovnica
00050000-557a-7a13-0293-933680a52b1e	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 6973788)
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
-- TOC entry 2832 (class 0 OID 6973599)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6973677)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6973800)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 6973920)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 6973973)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557a-7a16-a7c8-bd30cea0b259	00080000-557a-7a16-87f9-629f04b91500	0987	A
00190000-557a-7a16-cc8e-308417a98478	00080000-557a-7a16-e746-004cd6147293	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 6974088)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 6974151)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 6974101)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 6974120)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6973829)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557a-7a15-0182-c2681b539ac5	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557a-7a15-0161-8b1a6d623c0c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557a-7a15-9112-568b290f677f	0003	Kazinska	t	84	Kazinska dvorana
00220000-557a-7a15-6d1c-17ee4dcb9a63	0004	Mali oder	t	24	Mali oder 
00220000-557a-7a15-15e7-d3632d017ab0	0005	Komorni oder	t	15	Komorni oder
00220000-557a-7a15-71b9-cbdcf591460f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557a-7a15-8e55-07eb39374f84	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 6973773)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6973763)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6973962)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 6973897)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6973471)
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
-- TOC entry 2857 (class 0 OID 6973839)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6973509)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557a-7a14-b0d4-4f22664b4aec	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557a-7a14-c3a4-dcfd9ab9cd9d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557a-7a14-6b1a-305669907f15	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557a-7a14-6942-3dd4132ca233	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557a-7a14-e892-086bcd93f499	planer	Planer dogodkov v koledarju	t
00020000-557a-7a14-83ea-89b7ef1f1535	kadrovska	Kadrovska služba	t
00020000-557a-7a14-4e7b-55214313e85a	arhivar	Ažuriranje arhivalij	t
00020000-557a-7a14-4609-33b50733145d	igralec	Igralec	t
00020000-557a-7a14-6672-fe478dc0393f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 6973493)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557a-7a14-130c-efce3e85dc7c	00020000-557a-7a14-6b1a-305669907f15
00010000-557a-7a14-9b10-46ae7afaa634	00020000-557a-7a14-6b1a-305669907f15
\.


--
-- TOC entry 2859 (class 0 OID 6973853)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6973794)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6973744)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 6974184)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557a-7a14-a8ee-64a8d85ec842	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557a-7a14-bdb2-0a32b0f8e174	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557a-7a14-84ab-57e00be3ce5b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557a-7a14-9f63-225a18f64413	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557a-7a14-db45-8d3519943e9a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 6974176)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557a-7a14-5edd-e50f833086b9	00230000-557a-7a14-9f63-225a18f64413	popa
00240000-557a-7a14-5bb7-4cc49b420a0f	00230000-557a-7a14-9f63-225a18f64413	oseba
00240000-557a-7a14-2ec5-e5512cd2bf08	00230000-557a-7a14-bdb2-0a32b0f8e174	prostor
00240000-557a-7a14-c6ad-4d95e9bfd3f2	00230000-557a-7a14-9f63-225a18f64413	besedilo
00240000-557a-7a14-f9dd-60fb67f03559	00230000-557a-7a14-9f63-225a18f64413	uprizoritev
00240000-557a-7a14-7a56-3b196b432475	00230000-557a-7a14-9f63-225a18f64413	funkcija
00240000-557a-7a14-9ce7-e69c007c0cdd	00230000-557a-7a14-9f63-225a18f64413	tipfunkcije
00240000-557a-7a14-7f21-fdbaa6075ada	00230000-557a-7a14-9f63-225a18f64413	alternacija
00240000-557a-7a14-e3a5-a923218619b4	00230000-557a-7a14-a8ee-64a8d85ec842	pogodba
00240000-557a-7a14-b4b6-41f03153730d	00230000-557a-7a14-9f63-225a18f64413	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 6974171)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 6973907)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6973571)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6973750)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557a-7a16-0ac0-ab3e665eb04c	00180000-557a-7a16-70c3-f9c8db4d059b	000c0000-557a-7a16-f0c3-64d7df798d8e	00090000-557a-7a16-0951-bdf412d47089	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-7a16-178b-f5df11514527	00180000-557a-7a16-70c3-f9c8db4d059b	000c0000-557a-7a16-9757-45494fd86c24	00090000-557a-7a16-0f84-29be9d512352	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-7a16-83dc-2f46199ba013	00180000-557a-7a16-70c3-f9c8db4d059b	000c0000-557a-7a16-ec4b-eff00a8a1b61	00090000-557a-7a16-3751-d87aab191410	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-7a16-a41e-6dc8bc7341de	00180000-557a-7a16-70c3-f9c8db4d059b	000c0000-557a-7a16-00ed-d83b2c3e1c73	00090000-557a-7a16-040e-23c224b6eb79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-7a16-88e1-ca4bf430b6ce	00180000-557a-7a16-70c3-f9c8db4d059b	000c0000-557a-7a16-d058-56d43eca7ca0	00090000-557a-7a16-aa14-fffd24a0534e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-7a16-fd27-11543eb0ca1a	00180000-557a-7a16-b2b6-a8a000141a02	\N	00090000-557a-7a16-aa14-fffd24a0534e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 6973951)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557a-7a14-5f0f-063b4ff5a2b2	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557a-7a14-7fa2-18330957b962	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557a-7a14-a8a7-f419ea29ab2c	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557a-7a14-e1b2-97a96357ff33	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557a-7a14-7f38-948beaad6412	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557a-7a14-e558-d46e11c93425	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557a-7a14-9704-6429e234ceda	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557a-7a14-3551-4b565b830675	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557a-7a14-9c15-61f1ca37dade	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557a-7a14-37e6-7499c7f560ef	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557a-7a14-2b6d-0106ef80dbd5	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557a-7a14-4012-814edc6c6d59	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557a-7a14-d299-20356421f251	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557a-7a14-9f18-8a9363a7c67d	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557a-7a14-9af0-b30a86bae92e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557a-7a14-7a8a-22b064764160	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 6974140)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557a-7a14-c940-4c7e57ba4a48	01	Velika predstava	f	1.00	1.00
002b0000-557a-7a14-df52-85e9ad980026	02	Mala predstava	f	0.50	0.50
002b0000-557a-7a14-3805-45c99dc7a555	03	Mala koprodukcija	t	0.40	1.00
002b0000-557a-7a14-7c91-17d6238d024c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557a-7a14-311b-9e90314847e4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 6973634)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6973480)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557a-7a14-9b10-46ae7afaa634	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROI964tpVNmkg3JLdit3SWPNGBH.2N1IK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557a-7a15-4976-54de30a733c1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557a-7a15-4751-60fa25c4533f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557a-7a15-024a-6cd63ecd7f45	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557a-7a15-454c-c2389837dff0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557a-7a15-4a58-34ad6f77ba01	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557a-7a15-c612-3b68badb90a3	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557a-7a14-130c-efce3e85dc7c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 6974008)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557a-7a16-345b-001567dbe8e3	00160000-557a-7a15-8208-8f25a3329132	00150000-557a-7a14-43f1-36075ec6a517	00140000-557a-7a14-5d56-3334062ec787	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557a-7a15-15e7-d3632d017ab0
000e0000-557a-7a16-fde3-dce04c60bac2	00160000-557a-7a15-25f9-69e2c8ccefb5	00150000-557a-7a14-0cc5-afbbb32b1ba5	00140000-557a-7a14-6ba1-c77c65f784ed	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557a-7a15-71b9-cbdcf591460f
000e0000-557a-7a16-34ac-78fc7987793e	\N	00150000-557a-7a14-0cc5-afbbb32b1ba5	00140000-557a-7a14-6ba1-c77c65f784ed	00190000-557a-7a16-a7c8-bd30cea0b259	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557a-7a15-15e7-d3632d017ab0
000e0000-557a-7a16-ad39-42e2cbbf194c	\N	00150000-557a-7a14-0cc5-afbbb32b1ba5	00140000-557a-7a14-6ba1-c77c65f784ed	00190000-557a-7a16-a7c8-bd30cea0b259	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557a-7a15-15e7-d3632d017ab0
\.


--
-- TOC entry 2840 (class 0 OID 6973696)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557a-7a16-844c-c2d709893792	000e0000-557a-7a16-fde3-dce04c60bac2	1	
00200000-557a-7a16-4555-c7c5c79edefa	000e0000-557a-7a16-fde3-dce04c60bac2	2	
\.


--
-- TOC entry 2855 (class 0 OID 6973821)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6973890)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6973728)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 6973998)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557a-7a14-5d56-3334062ec787	01	Drama	drama (SURS 01)
00140000-557a-7a14-1074-325d3c63296b	02	Opera	opera (SURS 02)
00140000-557a-7a14-baf3-92b1aebb8daf	03	Balet	balet (SURS 03)
00140000-557a-7a14-c97b-3b88622b83ac	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557a-7a14-801d-ff88dc39d0ca	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557a-7a14-6ba1-c77c65f784ed	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557a-7a14-dfcb-94f3b3d3a71c	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 6973880)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557a-7a14-a56c-ddd9f1306dfe	01	Opera	opera
00150000-557a-7a14-fde7-d8e813f55f42	02	Opereta	opereta
00150000-557a-7a14-b97c-9a4e036afcbe	03	Balet	balet
00150000-557a-7a14-8434-085aabf88ada	04	Plesne prireditve	plesne prireditve
00150000-557a-7a14-f334-eb3ed8fc7930	05	Lutkovno gledališče	lutkovno gledališče
00150000-557a-7a14-fce6-f0ea4c9dd5cf	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557a-7a14-7581-e69f2d70100e	07	Biografska drama	biografska drama
00150000-557a-7a14-43f1-36075ec6a517	08	Komedija	komedija
00150000-557a-7a14-5bcf-5a9d901b2aa3	09	Črna komedija	črna komedija
00150000-557a-7a14-f519-433cf518eb88	10	E-igra	E-igra
00150000-557a-7a14-0cc5-afbbb32b1ba5	11	Kriminalka	kriminalka
00150000-557a-7a14-453c-915eb84e6bd2	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 6973534)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6974055)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6974045)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6973950)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6973718)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6973743)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6973660)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6974084)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6973876)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6973694)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6973737)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6973674)
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
-- TOC entry 2495 (class 2606 OID 6973786)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6973813)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6973632)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6973543)
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
-- TOC entry 2410 (class 2606 OID 6973567)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6973523)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 6973508)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6973819)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6973852)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6973993)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6973596)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6973620)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6973792)
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
-- TOC entry 2425 (class 2606 OID 6973610)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6973681)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6973804)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6973932)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6973978)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6974099)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 6974169)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 6974116)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 6974137)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6973836)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6973777)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6973768)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 6973972)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6973904)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6973479)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6973843)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6973497)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 6973517)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6973861)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6973799)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6973749)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 6974193)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 6974181)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 6974175)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6973917)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 6973576)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6973759)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6973961)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 6974150)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6973645)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6973492)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6974024)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6973703)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6973827)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6973895)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6973732)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6974006)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6973888)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 6973725)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 6973918)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 6973919)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 6973598)
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
-- TOC entry 2508 (class 1259 OID 6973820)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 6973806)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 6973805)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 6973704)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 6973877)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 6973879)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 6973878)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6973676)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6973675)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 6973995)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 6973996)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 6973997)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 6974139)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 6974138)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 6974029)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 6974026)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 6974030)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 6974028)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 6974027)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 6973647)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 6973646)
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
-- TOC entry 2408 (class 1259 OID 6973570)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 6973844)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 6973738)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 6973524)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 6973525)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 6973864)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 6973863)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 6973862)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 6973682)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 6973684)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 6973683)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 6974183)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 6973772)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 6973770)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 6973769)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 6973771)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 6973498)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 6973499)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 6973828)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 6973793)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 6973905)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 6973906)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 6974085)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 6974086)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 6974087)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6973612)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 6973611)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 6973613)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 6974170)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 6973933)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6973934)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 6974059)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 6974061)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 6974057)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 6974060)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 6974058)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 6973896)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 6973781)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 6973780)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 6973778)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 6973779)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 6974047)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 6974046)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 6974100)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 6973695)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 6973545)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 6973544)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 6973577)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6973578)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 6973762)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 6973761)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 6973760)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 6974119)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 6974117)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 6974118)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 6973727)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 6973723)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 6973720)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 6973721)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 6973719)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 6973724)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 6973722)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 6973597)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 6973661)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 6973663)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 6973662)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 6973664)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 6973787)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 6973994)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6974025)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6973568)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 6973569)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 6973889)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 6974194)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6973633)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 6974182)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 6973838)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 6973837)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 6974056)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 6973621)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6974007)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6973979)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 6973980)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6973518)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 6973726)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2648 (class 2606 OID 6974330)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2645 (class 2606 OID 6974315)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2646 (class 2606 OID 6974320)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2650 (class 2606 OID 6974340)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2644 (class 2606 OID 6974310)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 6974335)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 6974325)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 6974485)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 6974490)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 6974245)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6974425)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 6974420)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6974415)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 6974305)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 6974455)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 6974465)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 6974460)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2638 (class 2606 OID 6974280)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6974275)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 6974405)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 6974510)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 6974515)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 6974520)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2707 (class 2606 OID 6974625)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2706 (class 2606 OID 6974620)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 6974540)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2687 (class 2606 OID 6974525)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 6974545)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 6974535)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2688 (class 2606 OID 6974530)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2636 (class 2606 OID 6974270)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2635 (class 2606 OID 6974265)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2628 (class 2606 OID 6974230)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2627 (class 2606 OID 6974225)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 6974435)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 6974345)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2623 (class 2606 OID 6974205)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2624 (class 2606 OID 6974210)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2672 (class 2606 OID 6974450)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 6974445)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2670 (class 2606 OID 6974440)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2639 (class 2606 OID 6974285)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2641 (class 2606 OID 6974295)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 6974290)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 6974635)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2658 (class 2606 OID 6974380)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2656 (class 2606 OID 6974370)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2655 (class 2606 OID 6974365)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2657 (class 2606 OID 6974375)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2621 (class 2606 OID 6974195)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6974200)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 6974430)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 6974410)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2677 (class 2606 OID 6974475)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2678 (class 2606 OID 6974480)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 6974585)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 6974590)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2701 (class 2606 OID 6974595)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 6974255)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2632 (class 2606 OID 6974250)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2634 (class 2606 OID 6974260)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 6974630)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2681 (class 2606 OID 6974495)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2682 (class 2606 OID 6974500)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 6974570)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 6974580)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2694 (class 2606 OID 6974560)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2697 (class 2606 OID 6974575)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2695 (class 2606 OID 6974565)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 6974470)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 6974400)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2661 (class 2606 OID 6974395)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2659 (class 2606 OID 6974385)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2660 (class 2606 OID 6974390)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2693 (class 2606 OID 6974555)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2692 (class 2606 OID 6974550)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 6974600)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 6974300)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 6974505)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6974220)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 6974215)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2629 (class 2606 OID 6974235)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2630 (class 2606 OID 6974240)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2654 (class 2606 OID 6974360)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6974355)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2652 (class 2606 OID 6974350)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2705 (class 2606 OID 6974615)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2703 (class 2606 OID 6974605)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 6974610)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-12 08:20:07 CEST

--
-- PostgreSQL database dump complete
--

