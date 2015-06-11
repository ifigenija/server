--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-11 09:55:43 CEST

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
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6896315)
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
-- TOC entry 227 (class 1259 OID 6896837)
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
-- TOC entry 226 (class 1259 OID 6896820)
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
-- TOC entry 219 (class 1259 OID 6896724)
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
-- TOC entry 194 (class 1259 OID 6896494)
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
-- TOC entry 197 (class 1259 OID 6896528)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6896437)
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
-- TOC entry 228 (class 1259 OID 6896851)
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
-- TOC entry 213 (class 1259 OID 6896654)
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
-- TOC entry 192 (class 1259 OID 6896474)
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
-- TOC entry 196 (class 1259 OID 6896522)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6896454)
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
-- TOC entry 202 (class 1259 OID 6896571)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6896596)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6896411)
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
-- TOC entry 181 (class 1259 OID 6896324)
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
-- TOC entry 182 (class 1259 OID 6896335)
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
-- TOC entry 177 (class 1259 OID 6896289)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6896308)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6896603)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6896634)
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
-- TOC entry 223 (class 1259 OID 6896770)
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
-- TOC entry 184 (class 1259 OID 6896368)
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
-- TOC entry 186 (class 1259 OID 6896403)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6896577)
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
-- TOC entry 185 (class 1259 OID 6896388)
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
-- TOC entry 191 (class 1259 OID 6896466)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6896589)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6896709)
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
-- TOC entry 222 (class 1259 OID 6896762)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6896877)
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
-- TOC entry 233 (class 1259 OID 6896939)
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
-- TOC entry 230 (class 1259 OID 6896890)
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
-- TOC entry 231 (class 1259 OID 6896909)
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
-- TOC entry 209 (class 1259 OID 6896618)
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
-- TOC entry 201 (class 1259 OID 6896562)
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
-- TOC entry 200 (class 1259 OID 6896552)
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
-- TOC entry 221 (class 1259 OID 6896751)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6896686)
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
-- TOC entry 174 (class 1259 OID 6896260)
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
-- TOC entry 173 (class 1259 OID 6896258)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2889 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6896628)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6896298)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6896282)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6896642)
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
-- TOC entry 204 (class 1259 OID 6896583)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6896533)
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
-- TOC entry 236 (class 1259 OID 6896972)
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
-- TOC entry 235 (class 1259 OID 6896964)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6896959)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6896696)
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
-- TOC entry 183 (class 1259 OID 6896360)
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
-- TOC entry 199 (class 1259 OID 6896539)
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
-- TOC entry 220 (class 1259 OID 6896740)
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
-- TOC entry 232 (class 1259 OID 6896928)
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
-- TOC entry 188 (class 1259 OID 6896423)
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
-- TOC entry 175 (class 1259 OID 6896269)
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
-- TOC entry 225 (class 1259 OID 6896797)
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
-- TOC entry 193 (class 1259 OID 6896485)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6896610)
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
-- TOC entry 215 (class 1259 OID 6896679)
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
-- TOC entry 195 (class 1259 OID 6896517)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6896787)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6896669)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 6896263)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2825 (class 0 OID 6896315)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 6896837)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5579-3efe-2d3b-cc881a933857	000d0000-5579-3efe-026c-6083d9226b02	\N	00090000-5579-3efe-bea9-d86a986261ab	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-3efe-0232-760343e56854	000d0000-5579-3efe-ed57-fde0c71be09d	\N	00090000-5579-3efe-d3ad-cb7ed54331b5	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-3efe-82ba-2b26137f67cd	000d0000-5579-3efe-5e43-c984b30f8603	\N	00090000-5579-3efe-4d2b-0b635b9823d7	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-3efe-43da-21c4d190eed9	000d0000-5579-3efe-9ac2-1bb46373d432	\N	00090000-5579-3efe-ce4f-cc379c122579	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-3efe-9803-2daa79b328cf	000d0000-5579-3efe-a20e-e4ab2b7fa012	\N	00090000-5579-3efe-9c39-da3a94d5e81c	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-3efe-526e-726594571f65	000d0000-5579-3efe-c1ce-ce5064169177	\N	00090000-5579-3efe-d3ad-cb7ed54331b5	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2871 (class 0 OID 6896820)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 6896724)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5579-3efe-9f0c-42ed0dd7b21f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5579-3efe-34a2-d41153732c87	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5579-3efe-ee4f-1cd5a59ec734	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2839 (class 0 OID 6896494)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5579-3efe-da7b-a8b7ebcfdd68	\N	\N	00200000-5579-3efe-d652-8355835004e9	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5579-3efe-c75e-d4c0bd28ef9a	\N	\N	00200000-5579-3efe-d06e-4ba10badd077	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5579-3efe-e9a8-d827d6e7d7ab	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5579-3efe-5230-d91c5973fc7a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5579-3efe-114a-317d437547c2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2842 (class 0 OID 6896528)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6896437)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5579-3efc-4774-1a5b2006f8bf	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5579-3efc-3715-6be383e14734	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5579-3efc-b192-4d4cf053eee9	AL	ALB	008	Albania 	Albanija	\N
00040000-5579-3efc-9af9-ff2bd1aa4c1c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5579-3efc-2dc2-2acf435f0e21	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5579-3efc-1363-51a9e4192db3	AD	AND	020	Andorra 	Andora	\N
00040000-5579-3efc-2e91-c6ee1912a559	AO	AGO	024	Angola 	Angola	\N
00040000-5579-3efc-3c5e-8b1335c50368	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5579-3efc-882f-b64a49fe5195	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5579-3efc-ca0b-328a0b46be32	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-3efc-c9f4-344c26cfca97	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5579-3efc-96fe-f87262198a96	AM	ARM	051	Armenia 	Armenija	\N
00040000-5579-3efc-6d28-b656a6010dd1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5579-3efc-2c65-554edbc8d17c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5579-3efc-a150-be0e104917a6	AT	AUT	040	Austria 	Avstrija	\N
00040000-5579-3efc-c23f-a9210fad29ec	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5579-3efc-06dd-004eed2c3714	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5579-3efc-d707-ec7617129854	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5579-3efc-8ed4-b809babb4173	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5579-3efc-c80b-e3ed5f44c869	BB	BRB	052	Barbados 	Barbados	\N
00040000-5579-3efc-de37-39cf89b22995	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5579-3efc-20f8-b434770c3a44	BE	BEL	056	Belgium 	Belgija	\N
00040000-5579-3efc-fff1-bbbcb243738a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5579-3efc-5d21-88d2e8d352cd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5579-3efc-f6db-80544c0bfdcc	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5579-3efc-c453-859e88b5495c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5579-3efc-dc60-e65cd3919e33	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5579-3efc-aa5a-6c7b57b9c644	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5579-3efc-2bee-46a882d8cffe	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5579-3efc-e6f9-2d53209d9f48	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5579-3efc-5093-1ab2d9c7e93a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5579-3efc-6350-f907455ff861	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5579-3efc-7843-5dca571a3625	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5579-3efc-ae83-f370ffa44394	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5579-3efc-192d-6f5bb6cca838	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5579-3efc-7b81-d76bcf39672e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5579-3efc-7d2d-b7e9ef578fca	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5579-3efc-a29e-25f3e0ef3373	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5579-3efc-ac3a-69fab04ef623	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5579-3efc-9dfb-b4ecc4d96be1	CA	CAN	124	Canada 	Kanada	\N
00040000-5579-3efc-c430-2d4f85f6d0fd	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5579-3efc-c724-98d2b32a4ba6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5579-3efc-e0d1-27812ef6b9cb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5579-3efc-a60e-eca9c684285f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5579-3efc-af00-e717f7a2aca4	CL	CHL	152	Chile 	Čile	\N
00040000-5579-3efc-c5d4-98dcbb383eb3	CN	CHN	156	China 	Kitajska	\N
00040000-5579-3efc-10a9-d924a5e262d6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5579-3efc-9e9d-33cbd44bf640	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5579-3efc-3b54-cc8a16185ca8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5579-3efc-0735-41494dc00cdc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5579-3efc-bf4e-4ccabdc831e5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5579-3efc-11a2-3584910ff06e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5579-3efc-8d1b-fc16a7570180	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5579-3efc-421c-565bacd90524	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5579-3efc-3f51-5c9ed4924d8b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5579-3efc-4756-ff36c7b93326	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5579-3efc-3934-7ff8a4d2506f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5579-3efc-1e2f-28a43a0882ed	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5579-3efc-8f11-ff100dbdc721	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5579-3efc-c5a1-6ccc1468b60a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5579-3efc-d21e-be0bb651f4c9	DK	DNK	208	Denmark 	Danska	\N
00040000-5579-3efc-14e0-2db820f23adf	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5579-3efc-c68c-99ee8f36a441	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-3efc-7223-be7b218ecf02	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5579-3efc-5493-23d8030397ca	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5579-3efc-f97b-2d6ff8e835e2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5579-3efc-fb62-3ee7e2e8c01d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5579-3efc-b807-50ce0cc2d875	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5579-3efc-672e-4797b22dff74	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5579-3efc-a0b8-94b99c8b9052	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5579-3efc-9705-97ea6c2f8cf4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5579-3efc-22b7-fed9e484b76b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5579-3efc-1dfb-4b6c7eea4ebe	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5579-3efc-3edf-2bd40f12f424	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5579-3efc-9ff6-3b3bb2f6dd90	FI	FIN	246	Finland 	Finska	\N
00040000-5579-3efc-ea84-8468679dc5da	FR	FRA	250	France 	Francija	\N
00040000-5579-3efc-cdef-c5b3d74ee6b1	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5579-3efc-e00e-612ca5feba99	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5579-3efc-d955-1f6a01e88e58	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5579-3efc-a556-1c82c98fc914	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5579-3efc-375f-5272a0c14cf0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5579-3efc-a311-f2489634d5f8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5579-3efc-20a0-977289c43749	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5579-3efc-f272-2ff931f6520d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5579-3efc-739d-500633286e4a	GH	GHA	288	Ghana 	Gana	\N
00040000-5579-3efc-66af-f1edfbd9bd2e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5579-3efc-2cf4-63db97b59540	GR	GRC	300	Greece 	Grčija	\N
00040000-5579-3efc-b1ca-2e0ac137a07f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5579-3efc-c0f8-bf38fef0067f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5579-3efc-f7ac-952f678c90ee	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5579-3efc-1648-d14c73aace62	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5579-3efc-db6c-94435ccc1c6a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5579-3efc-c9ba-f1d2536941da	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5579-3efc-ee6b-e490e8fee999	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5579-3efc-6f37-c82dbbb5f10c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5579-3efc-e381-e8232fa70ca3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5579-3efc-80ea-c381e40de4be	HT	HTI	332	Haiti 	Haiti	\N
00040000-5579-3efc-2039-37a046953168	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5579-3efc-169e-6a15ee458942	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5579-3efc-5c7c-cf7e5029d89e	HN	HND	340	Honduras 	Honduras	\N
00040000-5579-3efc-aa80-3504fb3f2b2a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5579-3efc-29cb-60f443b63f2e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5579-3efc-3a50-4a3dc4e1acc2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5579-3efc-a8c2-fa90aaa8dc38	IN	IND	356	India 	Indija	\N
00040000-5579-3efc-2ca9-276634aa9612	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5579-3efc-fded-ebcdcbcbfcc9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5579-3efc-81af-a7be3b6c6ab1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5579-3efc-d882-99c86058dadd	IE	IRL	372	Ireland 	Irska	\N
00040000-5579-3efc-6855-4f399aa5e3c4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5579-3efc-f858-cd14a49cf6fe	IL	ISR	376	Israel 	Izrael	\N
00040000-5579-3efc-72f8-d75b3f723125	IT	ITA	380	Italy 	Italija	\N
00040000-5579-3efc-9601-d67bbfc6184d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5579-3efc-b47e-896eea8ab59e	JP	JPN	392	Japan 	Japonska	\N
00040000-5579-3efc-8b31-a0ad021ef1a2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5579-3efc-e139-31cdc56560c3	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5579-3efc-f5fe-3f02f2b0e07b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5579-3efc-6455-152699e28d73	KE	KEN	404	Kenya 	Kenija	\N
00040000-5579-3efc-e938-d3e14b03c94d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5579-3efc-2ad9-49415dcc487e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5579-3efc-b9cf-79bfb635dde5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5579-3efc-2d08-ec93888cc83a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5579-3efc-28b1-97ef8b84ff38	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5579-3efc-0c37-67a2b339d988	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5579-3efc-2821-69f3905122cb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5579-3efc-6ba8-0140d49ff62d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5579-3efc-8baa-1fdec6f4349a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5579-3efc-ebef-7a53760fb2cb	LR	LBR	430	Liberia 	Liberija	\N
00040000-5579-3efc-0bdf-d9ae043a0eff	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5579-3efc-2c35-87b89d44c448	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5579-3efc-acb9-9486ae8dfcd1	LT	LTU	440	Lithuania 	Litva	\N
00040000-5579-3efc-44dc-cb93800bb2e9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5579-3efc-2417-b3b0b6f01593	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5579-3efc-5798-298610057e63	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5579-3efc-75b0-ce6d2b969b2f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5579-3efc-93a0-6edfaf3d644a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5579-3efc-edf7-73f769d33b99	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5579-3efc-d4e3-9a2a8dd89a22	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5579-3efc-5aed-6f18a2914325	ML	MLI	466	Mali 	Mali	\N
00040000-5579-3efc-2c88-17cdca7597a0	MT	MLT	470	Malta 	Malta	\N
00040000-5579-3efc-97c0-c33634787e77	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5579-3efc-cb81-7f0d3db3f60a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5579-3efc-c308-3e958a71395c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5579-3efc-61d3-812c8405bba1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5579-3efc-be5f-d15b460bdebb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5579-3efc-12b1-e6420df614aa	MX	MEX	484	Mexico 	Mehika	\N
00040000-5579-3efc-940d-0dc3182e38af	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5579-3efc-cdf2-ac35dd38fa29	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5579-3efc-375e-48d8a904ebff	MC	MCO	492	Monaco 	Monako	\N
00040000-5579-3efc-6cae-69ba86a87d51	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5579-3efc-a488-888630b8c7d8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5579-3efc-2efb-9e4a2850b19b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5579-3efc-3a72-ae70e3967f95	MA	MAR	504	Morocco 	Maroko	\N
00040000-5579-3efc-c8ef-52b33b210a79	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5579-3efc-d102-7a36a5f6eafd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5579-3efc-8058-6d797f0335ba	NA	NAM	516	Namibia 	Namibija	\N
00040000-5579-3efc-78c4-4c03a62b560f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5579-3efc-942b-b8e12c6ed378	NP	NPL	524	Nepal 	Nepal	\N
00040000-5579-3efc-a5d6-e9383297a1dc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5579-3efc-f7c8-29bd3a83bd5b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5579-3efc-bc99-0a8f1b21f4dd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5579-3efc-1019-5d61c658f044	NE	NER	562	Niger 	Niger 	\N
00040000-5579-3efc-6247-0f2c655f07a4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5579-3efc-acd3-ef4d9fc22ef5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5579-3efc-59cc-9d2f7abd6103	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5579-3efc-e79e-0d4a84c9702c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5579-3efc-1852-c0c053cdc83f	NO	NOR	578	Norway 	Norveška	\N
00040000-5579-3efc-0f9e-37b502d6c233	OM	OMN	512	Oman 	Oman	\N
00040000-5579-3efc-2200-c7b42bb1f49c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5579-3efc-1dc7-7e80d430d876	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5579-3efc-e1eb-d58b13f0764d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5579-3efc-12e7-9e93718cb32a	PA	PAN	591	Panama 	Panama	\N
00040000-5579-3efc-9308-82f6e8890480	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5579-3efc-c1c9-015d5948159a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5579-3efc-623e-a31397099349	PE	PER	604	Peru 	Peru	\N
00040000-5579-3efc-8866-cd91c9d42ed5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5579-3efc-944a-d2b1cebd9463	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5579-3efc-3623-d1a191317566	PL	POL	616	Poland 	Poljska	\N
00040000-5579-3efc-348a-dc1613c90144	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5579-3efc-86ec-e1e1808daad2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5579-3efc-0d6b-635254183477	QA	QAT	634	Qatar 	Katar	\N
00040000-5579-3efc-a1fe-ffcbc982f3fd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5579-3efc-3c9a-1792cd5b7d34	RO	ROU	642	Romania 	Romunija	\N
00040000-5579-3efc-4294-95ebb5989033	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5579-3efc-d159-e3c4ec80ed78	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5579-3efc-3ee1-625293a79a7b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5579-3efc-44b8-29b841bd330b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5579-3efc-b322-816961cd85eb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5579-3efc-ec13-c2ed97094610	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5579-3efc-65e9-68814d768ef1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5579-3efc-058c-628af2b280d4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5579-3efc-01a1-482f6791afae	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5579-3efc-a77f-ac0214108218	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5579-3efc-c1a0-2008a4813220	SM	SMR	674	San Marino 	San Marino	\N
00040000-5579-3efc-4fc9-5b8fcc88bbb1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5579-3efc-3739-d1e332ddc69c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5579-3efc-2582-93581455bd84	SN	SEN	686	Senegal 	Senegal	\N
00040000-5579-3efc-0f20-d59e4dba52ba	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5579-3efc-a5d0-f70608505ada	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5579-3efc-dbbd-cd843abff9f2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5579-3efc-2756-33f849d0ac69	SG	SGP	702	Singapore 	Singapur	\N
00040000-5579-3efc-ebd5-65fd65bef8df	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5579-3efc-0a88-bd58907ce309	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5579-3efc-09a9-452c401f075f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5579-3efc-cbea-b641f5fb38ea	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5579-3efc-b5da-ef9ee424eaca	SO	SOM	706	Somalia 	Somalija	\N
00040000-5579-3efc-fb80-6cf8cef46073	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5579-3efc-2871-937013155640	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5579-3efc-6672-c33f195ce08a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5579-3efc-22db-4e871db5c496	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5579-3efc-13f2-cc7c5fdc57ed	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5579-3efc-6f6b-f35d4362ad40	SD	SDN	729	Sudan 	Sudan	\N
00040000-5579-3efc-131d-1cd9a5ab251b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5579-3efc-ac46-408a41aec7a6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5579-3efc-50c6-3e92a7ccfa1a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5579-3efc-8c68-bc4b13aa709a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5579-3efc-845b-baebfd0ecee8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5579-3efc-4578-67809819584a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5579-3efc-d0f3-e0a24f968a92	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5579-3efc-e75d-cda07b4cd579	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5579-3efc-bb01-0fcc8fb5b8b5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5579-3efc-54a0-3da9cf79208f	TH	THA	764	Thailand 	Tajska	\N
00040000-5579-3efc-06b8-9f53fffeb1d7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5579-3efc-6cab-23b182f3cb96	TG	TGO	768	Togo 	Togo	\N
00040000-5579-3efc-5dd0-ddbc330846a5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5579-3efc-8015-ed0369a74f82	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5579-3efc-5989-79c3ef1dfbce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5579-3efc-8ec2-6c3ac478a22b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5579-3efc-cd7b-214c00cc9603	TR	TUR	792	Turkey 	Turčija	\N
00040000-5579-3efc-7f5d-3de32ac5195d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5579-3efc-6112-446d8d52827f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-3efc-f4e6-c32ebb2927f5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5579-3efc-5143-ad2648f10780	UG	UGA	800	Uganda 	Uganda	\N
00040000-5579-3efc-7808-f1507703053c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5579-3efc-2e62-163020e33f74	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5579-3efc-6d48-61ea355218d2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5579-3efc-d8f6-792458a756f4	US	USA	840	United States 	Združene države Amerike	\N
00040000-5579-3efc-ba23-fb097b2a8661	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5579-3efc-6a6a-b866e94ed8ec	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5579-3efc-77cf-9c519bd394fb	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5579-3efc-b7bb-41e5e9797083	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5579-3efc-59d6-fc2ebc954fbe	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5579-3efc-1cc3-3c14f60699cd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5579-3efc-f1b0-6f30af4f698e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-3efc-161b-c163ab6b165c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5579-3efc-29b9-ba45440d8d6f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5579-3efc-8080-368eaf3d224d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5579-3efc-eda5-f5aafba17105	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5579-3efc-be8f-3c95027b046e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5579-3efc-a9e3-7d1ebbed836e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2873 (class 0 OID 6896851)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6896654)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5579-3efe-0a01-6137ee3dd002	000e0000-5579-3efe-95d6-e207ede1c987	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5579-3efc-60a1-c08b0f7f02ec
000d0000-5579-3efe-026c-6083d9226b02	000e0000-5579-3efe-95d6-e207ede1c987	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-3efc-60a1-c08b0f7f02ec
000d0000-5579-3efe-ed57-fde0c71be09d	000e0000-5579-3efe-95d6-e207ede1c987	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5579-3efc-4e8f-b60747321198
000d0000-5579-3efe-5e43-c984b30f8603	000e0000-5579-3efe-95d6-e207ede1c987	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5579-3efc-55c5-1e81ac49dc6d
000d0000-5579-3efe-9ac2-1bb46373d432	000e0000-5579-3efe-95d6-e207ede1c987	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5579-3efc-55c5-1e81ac49dc6d
000d0000-5579-3efe-a20e-e4ab2b7fa012	000e0000-5579-3efe-95d6-e207ede1c987	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5579-3efc-55c5-1e81ac49dc6d
000d0000-5579-3efe-c1ce-ce5064169177	000e0000-5579-3efe-95d6-e207ede1c987	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-3efc-60a1-c08b0f7f02ec
\.


--
-- TOC entry 2837 (class 0 OID 6896474)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6896522)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 6896454)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5579-3efe-5690-8a1bda040e86	00080000-5579-3efe-0656-6ec85d4f1c25	00090000-5579-3efe-bea9-d86a986261ab	AK		
\.


--
-- TOC entry 2815 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6896571)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6896596)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6896411)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5579-3efd-abfd-5aa02d267ba9	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5579-3efd-3b47-a3e866bbe57b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5579-3efd-6ee2-f1e5defc3a49	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5579-3efd-e0d8-553e5604fb08	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5579-3efd-8ed9-a6cc7dea7e98	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5579-3efd-88f1-f8489f4b80f0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5579-3efd-efb3-8c0f1e8dcf0d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5579-3efd-f19d-c9967451e7c1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5579-3efd-6ae9-b5d2a2817a48	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5579-3efd-a692-ab755380d095	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5579-3efd-7531-7e44f9f70151	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5579-3efd-2539-e4d8ac4b60f4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5579-3efd-7eae-76496e356824	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-3efd-e004-37b5d597f104	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-3efd-6aae-8d7ff43c048b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5579-3efd-8728-1b79e30a0f56	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2826 (class 0 OID 6896324)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5579-3efd-74d5-715a86170d0f	00000000-5579-3efd-8ed9-a6cc7dea7e98	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5579-3efd-bae0-8e1d5e4f645d	00000000-5579-3efd-8ed9-a6cc7dea7e98	00010000-5579-3efd-7923-f47bbc1cefe9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5579-3efd-6143-c20cb0bb7c23	00000000-5579-3efd-88f1-f8489f4b80f0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2827 (class 0 OID 6896335)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5579-3efe-3eef-d1b80e0fc9c9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5579-3efe-ce4f-cc379c122579	00010000-5579-3efe-07c1-6941c938a29a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5579-3efe-4d2b-0b635b9823d7	00010000-5579-3efe-10d7-6e169c1f1701	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5579-3efe-cb1b-3c458d9aa7b3	00010000-5579-3efe-9e2b-9c51ae6350da	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5579-3efe-b518-02d8aa971cfa	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5579-3efe-214b-1b25b31f6ae6	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5579-3efe-e650-ab2e5a5356d9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5579-3efe-08d4-dfc6f69a8c43	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5579-3efe-bea9-d86a986261ab	00010000-5579-3efe-bf75-564e02c8b183	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5579-3efe-d3ad-cb7ed54331b5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5579-3efe-a540-6b170b0baf8b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5579-3efe-9c39-da3a94d5e81c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5579-3efe-8ea2-0715fb0f2042	00010000-5579-3efe-0225-b113c54874a0	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2817 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6896289)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5579-3efc-78d3-df68a3385518	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5579-3efc-d6ef-13f7843e6c55	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5579-3efc-1680-25686f244ac4	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5579-3efc-e55e-f27b3df0609c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5579-3efc-ce07-2502c1691a43	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5579-3efc-e462-c81154e53f43	Abonma-read	Abonma - branje	f
00030000-5579-3efc-4dab-443e11c66e64	Abonma-write	Abonma - spreminjanje	f
00030000-5579-3efc-dd5a-b026a890016f	Alternacija-read	Alternacija - branje	f
00030000-5579-3efc-4692-a8c9ebb4d00f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5579-3efc-b57c-3bc931f96596	Arhivalija-read	Arhivalija - branje	f
00030000-5579-3efc-01df-e2a739219d0a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5579-3efc-b20c-271a2289e584	Besedilo-read	Besedilo - branje	f
00030000-5579-3efc-9c29-21da823c6f4d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5579-3efc-1c38-01e33ec0267a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5579-3efc-d531-cec967bbb75f	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5579-3efc-b810-87d49bf6fe77	Dogodek-read	Dogodek - branje	f
00030000-5579-3efc-9666-08a47690e2c3	Dogodek-write	Dogodek - spreminjanje	f
00030000-5579-3efc-5679-1e67b33de03b	Drzava-read	Drzava - branje	f
00030000-5579-3efc-0968-1e571ea936ef	Drzava-write	Drzava - spreminjanje	f
00030000-5579-3efd-c67d-5df6ce9e39ae	Funkcija-read	Funkcija - branje	f
00030000-5579-3efd-7418-06a88a6e9edd	Funkcija-write	Funkcija - spreminjanje	f
00030000-5579-3efd-fe13-099b8cdc1554	Gostovanje-read	Gostovanje - branje	f
00030000-5579-3efd-5955-e08ae63309b3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5579-3efd-207c-4acb2d877c96	Gostujoca-read	Gostujoca - branje	f
00030000-5579-3efd-110e-1a8f21a0c988	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5579-3efd-8179-036f8e183bda	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5579-3efd-a357-80b7e10c1d7e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5579-3efd-5699-dc476b84f16b	Kupec-read	Kupec - branje	f
00030000-5579-3efd-5320-940c2f5c3e8c	Kupec-write	Kupec - spreminjanje	f
00030000-5579-3efd-533e-360db20a48a6	NacinPlacina-read	NacinPlacina - branje	f
00030000-5579-3efd-793c-e8349ab7fc92	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5579-3efd-8aba-de9ff932f70a	Option-read	Option - branje	f
00030000-5579-3efd-a282-a170d2c65969	Option-write	Option - spreminjanje	f
00030000-5579-3efd-12fe-03826ab202a4	OptionValue-read	OptionValue - branje	f
00030000-5579-3efd-a4d0-3c1adb7eb468	OptionValue-write	OptionValue - spreminjanje	f
00030000-5579-3efd-e953-409e2d65b36b	Oseba-read	Oseba - branje	f
00030000-5579-3efd-4c00-27cdb4c1d81c	Oseba-write	Oseba - spreminjanje	f
00030000-5579-3efd-f970-b198cb8126b8	Permission-read	Permission - branje	f
00030000-5579-3efd-dee5-7f6a34b0108e	Permission-write	Permission - spreminjanje	f
00030000-5579-3efd-99a6-245747a90570	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5579-3efd-807b-e3e5e7dd81ad	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5579-3efd-5eb4-601f6c5ed3c8	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5579-3efd-3a4d-131e8224d412	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5579-3efd-9538-bc9e5b313c2d	Pogodba-read	Pogodba - branje	f
00030000-5579-3efd-d149-d7f96e763a7f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5579-3efd-ccd3-442c9433bc83	Popa-read	Popa - branje	f
00030000-5579-3efd-21a9-14e79b2a7f28	Popa-write	Popa - spreminjanje	f
00030000-5579-3efd-6dc7-80e0757565a8	Posta-read	Posta - branje	f
00030000-5579-3efd-dd37-4e87b21e179f	Posta-write	Posta - spreminjanje	f
00030000-5579-3efd-705f-99ede2b1025e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5579-3efd-0a80-9c9f859b6560	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5579-3efd-1781-d8f6bf638619	PostniNaslov-read	PostniNaslov - branje	f
00030000-5579-3efd-2f26-6cd23174a4c0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5579-3efd-0d2d-7640b8537983	Predstava-read	Predstava - branje	f
00030000-5579-3efd-effa-d83d0a654e51	Predstava-write	Predstava - spreminjanje	f
00030000-5579-3efd-492f-d6c25fe2b418	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5579-3efd-ced4-5426a88d759d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5579-3efd-0882-a9b842a16c34	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5579-3efd-4635-234bf0e8b6f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5579-3efd-316e-0fdca7d37ee0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5579-3efd-631e-a5bf7ce36eb3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5579-3efd-efaa-1b7ac07dfec3	ProgramDela-read	ProgramDela - branje	f
00030000-5579-3efd-99de-b9cf86e4e0b5	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5579-3efd-8670-67539c33270b	ProgramFestival-read	ProgramFestival - branje	f
00030000-5579-3efd-8ebc-855078237e62	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5579-3efd-948d-7aaaf751135d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5579-3efd-be47-5d7b414c71dc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5579-3efd-e332-ba6bb7535b34	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5579-3efd-c0ab-d4ac3007ba57	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5579-3efd-0ebb-08dca0eacf16	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5579-3efd-5c41-3113e641be9f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5579-3efd-a598-59dab86af185	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5579-3efd-ca31-fb66237d5143	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5579-3efd-5ee9-d2530158b23a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5579-3efd-6ae2-04ec6991768d	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5579-3efd-ac42-e3b403e381aa	Prostor-read	Prostor - branje	f
00030000-5579-3efd-572d-e457678cf820	Prostor-write	Prostor - spreminjanje	f
00030000-5579-3efd-4303-ad17285e8c4f	Racun-read	Racun - branje	f
00030000-5579-3efd-92ad-29ea2599a887	Racun-write	Racun - spreminjanje	f
00030000-5579-3efd-5410-5d9faf22642b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5579-3efd-88ea-6fea327845fd	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5579-3efd-aac2-061a7d6e4032	Readme-read	Readme - branje	f
00030000-5579-3efd-f9d5-110d68a116eb	Readme-write	Readme - spreminjanje	f
00030000-5579-3efd-b86a-e7eea9711d39	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5579-3efd-7942-1846d197836b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5579-3efd-59c5-7c0f69248747	Rekvizit-read	Rekvizit - branje	f
00030000-5579-3efd-dd2b-fa8e53c74a83	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5579-3efd-e55b-f0bfd9b4d8f2	Revizija-read	Revizija - branje	f
00030000-5579-3efd-cc96-b320157b62c9	Revizija-write	Revizija - spreminjanje	f
00030000-5579-3efd-d8ea-e0784780468e	Rezervacija-read	Rezervacija - branje	f
00030000-5579-3efd-e441-1f0b746e94c0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5579-3efd-de6a-b5a5496cbf25	Role-read	Role - branje	f
00030000-5579-3efd-ce0b-b9f464062b29	Role-write	Role - spreminjanje	f
00030000-5579-3efd-6a27-19a61045167f	SedezniRed-read	SedezniRed - branje	f
00030000-5579-3efd-0268-9cf4027fc22b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5579-3efd-1c6b-bf3592b21780	Sedez-read	Sedez - branje	f
00030000-5579-3efd-80bd-e2af386566af	Sedez-write	Sedez - spreminjanje	f
00030000-5579-3efd-5b07-82e5004cb8e5	Sezona-read	Sezona - branje	f
00030000-5579-3efd-9c75-296a53ccf9a6	Sezona-write	Sezona - spreminjanje	f
00030000-5579-3efd-bcb1-3e5e1438fc98	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5579-3efd-4224-9fd036e38f7c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5579-3efd-2b31-5e8e7d2e4ffc	Stevilcenje-read	Stevilcenje - branje	f
00030000-5579-3efd-1bc3-6a369f1889c0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5579-3efd-334e-49e2384a9817	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5579-3efd-83de-b5e8f19247ac	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5579-3efd-417b-8b689b902dcf	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5579-3efd-69f2-34a7aaddad27	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5579-3efd-646f-2586cb6e1000	Telefonska-read	Telefonska - branje	f
00030000-5579-3efd-2b16-f93816c18b07	Telefonska-write	Telefonska - spreminjanje	f
00030000-5579-3efd-26f4-3ad924ef87d8	TerminStoritve-read	TerminStoritve - branje	f
00030000-5579-3efd-1c7a-34f754e107a1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5579-3efd-e618-6c5991771a78	TipFunkcije-read	TipFunkcije - branje	f
00030000-5579-3efd-7d24-a742afb7dff7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5579-3efd-7125-080f368c1408	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5579-3efd-4ca2-36cd8ffdb2e4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5579-3efd-5a71-472d5ab276c6	Trr-read	Trr - branje	f
00030000-5579-3efd-3185-5b62e5e2347d	Trr-write	Trr - spreminjanje	f
00030000-5579-3efd-81e8-16d1467fb3f1	Uprizoritev-read	Uprizoritev - branje	f
00030000-5579-3efd-ebb4-5d3f42112711	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5579-3efd-3474-9bc9f73710a1	User-read	User - branje	f
00030000-5579-3efd-eb48-5c2bddbe85f5	User-write	User - spreminjanje	f
00030000-5579-3efd-f9d0-1183bfe65bf3	Vaja-read	Vaja - branje	f
00030000-5579-3efd-d935-0d495ca504a5	Vaja-write	Vaja - spreminjanje	f
00030000-5579-3efd-d2ab-048d4aae5ecc	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5579-3efd-c128-76ab01e9f299	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5579-3efd-5227-b88fb28e80e4	Zaposlitev-read	Zaposlitev - branje	f
00030000-5579-3efd-2447-9e08fbfa83db	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5579-3efd-d9a1-0eab24aa60a5	Zasedenost-read	Zasedenost - branje	f
00030000-5579-3efd-f62a-662fd112f2a5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5579-3efd-9d44-d4646c4b28cb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5579-3efd-7b2f-a425336715de	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5579-3efd-bc18-178fab1a1e39	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5579-3efd-2e4d-220a04d2abd1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2824 (class 0 OID 6896308)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5579-3efd-7f71-3d0b88933404	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-e462-c81154e53f43
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-4dab-443e11c66e64
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-dd5a-b026a890016f
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-4692-a8c9ebb4d00f
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-b57c-3bc931f96596
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-b810-87d49bf6fe77
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-e55e-f27b3df0609c
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-9666-08a47690e2c3
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efc-0968-1e571ea936ef
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-c67d-5df6ce9e39ae
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-7418-06a88a6e9edd
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-fe13-099b8cdc1554
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-5955-e08ae63309b3
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-207c-4acb2d877c96
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-110e-1a8f21a0c988
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-8179-036f8e183bda
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-a357-80b7e10c1d7e
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-8aba-de9ff932f70a
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-12fe-03826ab202a4
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-e953-409e2d65b36b
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-4c00-27cdb4c1d81c
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-ccd3-442c9433bc83
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-21a9-14e79b2a7f28
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-6dc7-80e0757565a8
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-dd37-4e87b21e179f
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-1781-d8f6bf638619
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-2f26-6cd23174a4c0
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-0d2d-7640b8537983
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-effa-d83d0a654e51
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-316e-0fdca7d37ee0
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-631e-a5bf7ce36eb3
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-ac42-e3b403e381aa
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-572d-e457678cf820
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-b86a-e7eea9711d39
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-7942-1846d197836b
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-59c5-7c0f69248747
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-dd2b-fa8e53c74a83
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-5b07-82e5004cb8e5
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-9c75-296a53ccf9a6
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-e618-6c5991771a78
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-81e8-16d1467fb3f1
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-ebb4-5d3f42112711
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-f9d0-1183bfe65bf3
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-d935-0d495ca504a5
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-d9a1-0eab24aa60a5
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-f62a-662fd112f2a5
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-9d44-d4646c4b28cb
00020000-5579-3efd-e8f4-c76aaf61b49f	00030000-5579-3efd-bc18-178fab1a1e39
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efc-e462-c81154e53f43
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efc-b57c-3bc931f96596
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efc-b810-87d49bf6fe77
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-fe13-099b8cdc1554
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-207c-4acb2d877c96
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-8179-036f8e183bda
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-a357-80b7e10c1d7e
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-8aba-de9ff932f70a
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-12fe-03826ab202a4
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-e953-409e2d65b36b
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-4c00-27cdb4c1d81c
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-ccd3-442c9433bc83
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-6dc7-80e0757565a8
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-1781-d8f6bf638619
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-2f26-6cd23174a4c0
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-0d2d-7640b8537983
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-ac42-e3b403e381aa
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-b86a-e7eea9711d39
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-59c5-7c0f69248747
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-5b07-82e5004cb8e5
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-646f-2586cb6e1000
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-2b16-f93816c18b07
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-5a71-472d5ab276c6
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-3185-5b62e5e2347d
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-5227-b88fb28e80e4
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-2447-9e08fbfa83db
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-9d44-d4646c4b28cb
00020000-5579-3efd-7f6b-5ae8c192806a	00030000-5579-3efd-bc18-178fab1a1e39
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-e462-c81154e53f43
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-dd5a-b026a890016f
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-b57c-3bc931f96596
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-01df-e2a739219d0a
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-b20c-271a2289e584
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-1c38-01e33ec0267a
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-b810-87d49bf6fe77
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-c67d-5df6ce9e39ae
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-fe13-099b8cdc1554
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-207c-4acb2d877c96
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-8179-036f8e183bda
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-8aba-de9ff932f70a
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-12fe-03826ab202a4
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-e953-409e2d65b36b
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-ccd3-442c9433bc83
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-6dc7-80e0757565a8
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-0d2d-7640b8537983
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-316e-0fdca7d37ee0
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-ac42-e3b403e381aa
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-b86a-e7eea9711d39
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-59c5-7c0f69248747
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-5b07-82e5004cb8e5
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-e618-6c5991771a78
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-f9d0-1183bfe65bf3
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-d9a1-0eab24aa60a5
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-9d44-d4646c4b28cb
00020000-5579-3efd-9f91-d84a80f62696	00030000-5579-3efd-bc18-178fab1a1e39
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-e462-c81154e53f43
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-4dab-443e11c66e64
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-4692-a8c9ebb4d00f
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-b57c-3bc931f96596
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-b810-87d49bf6fe77
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-fe13-099b8cdc1554
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-207c-4acb2d877c96
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-8aba-de9ff932f70a
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-12fe-03826ab202a4
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-ccd3-442c9433bc83
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-6dc7-80e0757565a8
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-0d2d-7640b8537983
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-ac42-e3b403e381aa
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-b86a-e7eea9711d39
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-59c5-7c0f69248747
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-5b07-82e5004cb8e5
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-e618-6c5991771a78
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-9d44-d4646c4b28cb
00020000-5579-3efd-60aa-f622a0c10e4d	00030000-5579-3efd-bc18-178fab1a1e39
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efc-e462-c81154e53f43
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efc-b57c-3bc931f96596
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efc-b810-87d49bf6fe77
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efc-5679-1e67b33de03b
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-fe13-099b8cdc1554
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-207c-4acb2d877c96
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-8aba-de9ff932f70a
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-12fe-03826ab202a4
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-ccd3-442c9433bc83
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-6dc7-80e0757565a8
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-0d2d-7640b8537983
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-ac42-e3b403e381aa
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-b86a-e7eea9711d39
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-59c5-7c0f69248747
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-5b07-82e5004cb8e5
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-26f4-3ad924ef87d8
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efc-1680-25686f244ac4
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-e618-6c5991771a78
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-9d44-d4646c4b28cb
00020000-5579-3efd-780e-9229ee4e11c6	00030000-5579-3efd-bc18-178fab1a1e39
\.


--
-- TOC entry 2852 (class 0 OID 6896603)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6896634)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6896770)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6896368)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5579-3efe-0656-6ec85d4f1c25	00040000-5579-3efc-4774-1a5b2006f8bf	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-3efe-1349-20952f0fbdc3	00040000-5579-3efc-4774-1a5b2006f8bf	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-3efe-05a4-f69f43bf96e1	00040000-5579-3efc-4774-1a5b2006f8bf	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-3efe-d227-3807e9d981f7	00040000-5579-3efc-4774-1a5b2006f8bf	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2831 (class 0 OID 6896403)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5579-3efc-f056-ad21bcd55e92	8341	Adlešiči
00050000-5579-3efc-2d34-fda74ebb7319	5270	Ajdovščina
00050000-5579-3efc-d9d1-97d77eccfbe2	6280	Ankaran/Ancarano
00050000-5579-3efc-d8d4-6010b6312139	9253	Apače
00050000-5579-3efc-f4ae-f82fcac38361	8253	Artiče
00050000-5579-3efc-5b39-b2013c7dcfac	4275	Begunje na Gorenjskem
00050000-5579-3efc-8766-645c964cb8c6	1382	Begunje pri Cerknici
00050000-5579-3efc-1e4e-5e9f3258e7c7	9231	Beltinci
00050000-5579-3efc-eb97-f793f410ff24	2234	Benedikt
00050000-5579-3efc-a25c-29ad9f4a126f	2345	Bistrica ob Dravi
00050000-5579-3efc-0d72-1eee3c481770	3256	Bistrica ob Sotli
00050000-5579-3efc-4024-5f15405c60a5	8259	Bizeljsko
00050000-5579-3efc-03b3-e66bec3f3b94	1223	Blagovica
00050000-5579-3efc-3314-abf9a38f410c	8283	Blanca
00050000-5579-3efc-f090-8e9d0832e283	4260	Bled
00050000-5579-3efc-ea1e-a8e20175d5f9	4273	Blejska Dobrava
00050000-5579-3efc-0b59-bf062547592e	9265	Bodonci
00050000-5579-3efc-6a4a-2fc629ebdcd0	9222	Bogojina
00050000-5579-3efc-7e34-afaeea0acfd0	4263	Bohinjska Bela
00050000-5579-3efc-83d8-f424b2507c57	4264	Bohinjska Bistrica
00050000-5579-3efc-0795-9b9ef6d3dbc5	4265	Bohinjsko jezero
00050000-5579-3efc-5dd1-8a2de8304ae0	1353	Borovnica
00050000-5579-3efc-91bc-fd8302827d08	8294	Boštanj
00050000-5579-3efc-0b58-8842fc7d1051	5230	Bovec
00050000-5579-3efc-2df0-2319e08a46a0	5295	Branik
00050000-5579-3efc-e37d-de8ee72ffaf8	3314	Braslovče
00050000-5579-3efc-2a95-001dd95cacf8	5223	Breginj
00050000-5579-3efc-dbfd-64836b64e7b3	8280	Brestanica
00050000-5579-3efc-69e7-3a1c8bd5038c	2354	Bresternica
00050000-5579-3efc-d147-e7c71f5773a4	4243	Brezje
00050000-5579-3efc-df70-2f04ea87091a	1351	Brezovica pri Ljubljani
00050000-5579-3efc-4e8f-d90c329bd4af	8250	Brežice
00050000-5579-3efc-62af-c1347c1f1655	4210	Brnik - Aerodrom
00050000-5579-3efc-af1b-6ec0e514ccd2	8321	Brusnice
00050000-5579-3efc-5088-e1c3ef39661c	3255	Buče
00050000-5579-3efc-ea44-57146cfd010a	8276	Bučka 
00050000-5579-3efc-237a-f53c22869101	9261	Cankova
00050000-5579-3efc-230c-e3007b8b2e48	3000	Celje 
00050000-5579-3efc-d8eb-59b8f6c735b3	3001	Celje - poštni predali
00050000-5579-3efc-5541-a27e14314b94	4207	Cerklje na Gorenjskem
00050000-5579-3efc-9258-44e0e46b06f8	8263	Cerklje ob Krki
00050000-5579-3efc-e953-64d6cfee6382	1380	Cerknica
00050000-5579-3efc-5cbc-920562a17a51	5282	Cerkno
00050000-5579-3efc-c166-21bc427e7d3d	2236	Cerkvenjak
00050000-5579-3efc-6259-565db72c0cd4	2215	Ceršak
00050000-5579-3efc-00a5-b77b1a2523d0	2326	Cirkovce
00050000-5579-3efc-1f15-736386774bdc	2282	Cirkulane
00050000-5579-3efc-ce2d-2ec8d87bf4f3	5273	Col
00050000-5579-3efc-4c0f-399a93c15cfa	8251	Čatež ob Savi
00050000-5579-3efc-97b1-b6f2d1b15277	1413	Čemšenik
00050000-5579-3efc-a2b0-4b1c162594f2	5253	Čepovan
00050000-5579-3efc-b20f-1fd80f74ed94	9232	Črenšovci
00050000-5579-3efc-7aa5-c2d30a92bd29	2393	Črna na Koroškem
00050000-5579-3efc-7245-b303bcae8576	6275	Črni Kal
00050000-5579-3efc-3a22-953448aa1f32	5274	Črni Vrh nad Idrijo
00050000-5579-3efc-3e44-794972951404	5262	Črniče
00050000-5579-3efc-fad0-5e52b25865fb	8340	Črnomelj
00050000-5579-3efc-3075-b2ae04b38069	6271	Dekani
00050000-5579-3efc-7171-51dc1e40f503	5210	Deskle
00050000-5579-3efc-8cfc-6dd9ea59e6c9	2253	Destrnik
00050000-5579-3efc-00b6-162f5826e5d9	6215	Divača
00050000-5579-3efc-af0b-1b3f8f76210f	1233	Dob
00050000-5579-3efc-0b0d-33fda6704b42	3224	Dobje pri Planini
00050000-5579-3efc-4293-c34693c49448	8257	Dobova
00050000-5579-3efc-222d-3c57713ab9c2	1423	Dobovec
00050000-5579-3efc-5bf1-3f5f14493a44	5263	Dobravlje
00050000-5579-3efc-8df7-7e5ab273408d	3204	Dobrna
00050000-5579-3efc-b454-91392711d678	8211	Dobrnič
00050000-5579-3efc-e73f-be68ffc4d52f	1356	Dobrova
00050000-5579-3efc-ec74-bf5f259ee173	9223	Dobrovnik/Dobronak 
00050000-5579-3efc-fc13-60df47453e14	5212	Dobrovo v Brdih
00050000-5579-3efc-9c1d-7ccbf1265c4f	1431	Dol pri Hrastniku
00050000-5579-3efc-c995-f4371f35fac5	1262	Dol pri Ljubljani
00050000-5579-3efc-5b81-8bcd0b113764	1273	Dole pri Litiji
00050000-5579-3efc-0b47-32549b49e079	1331	Dolenja vas
00050000-5579-3efc-2a1c-69783eb0a12e	8350	Dolenjske Toplice
00050000-5579-3efc-a29e-e2a667dd31d1	1230	Domžale
00050000-5579-3efc-17d8-7f536b328e87	2252	Dornava
00050000-5579-3efc-3f58-6216c20145b5	5294	Dornberk
00050000-5579-3efc-bee1-752fbfcf96ad	1319	Draga
00050000-5579-3efc-2207-b911e97482eb	8343	Dragatuš
00050000-5579-3efc-2e89-f992531b83f8	3222	Dramlje
00050000-5579-3efc-fe33-2e4c2b40d1cb	2370	Dravograd
00050000-5579-3efc-bd2e-a793834c1bba	4203	Duplje
00050000-5579-3efc-398d-8cba2d736481	6221	Dutovlje
00050000-5579-3efc-c750-46c644b829d4	8361	Dvor
00050000-5579-3efc-3de8-31e055d2b273	2343	Fala
00050000-5579-3efc-3bee-41b92a175f6a	9208	Fokovci
00050000-5579-3efc-fa62-50c318d4e88b	2313	Fram
00050000-5579-3efc-4d51-c6099f695bf5	3213	Frankolovo
00050000-5579-3efc-3b91-1f5a37ccc129	1274	Gabrovka
00050000-5579-3efc-1674-cb7677972d9a	8254	Globoko
00050000-5579-3efc-bb65-552ca46f44b6	5275	Godovič
00050000-5579-3efc-ca9a-7eab7159af98	4204	Golnik
00050000-5579-3efc-f4c6-b723940c89cd	3303	Gomilsko
00050000-5579-3efc-e821-33164a081008	4224	Gorenja vas
00050000-5579-3efc-cb25-1c40dab67f3e	3263	Gorica pri Slivnici
00050000-5579-3efc-ee94-4bf0011dbf2c	2272	Gorišnica
00050000-5579-3efc-82d6-87c40ea478cd	9250	Gornja Radgona
00050000-5579-3efc-c741-0a9325dfde2f	3342	Gornji Grad
00050000-5579-3efc-e0f7-e32ba79a11ec	4282	Gozd Martuljek
00050000-5579-3efc-addc-9f8ec7e20465	6272	Gračišče
00050000-5579-3efc-f388-ccef89d59709	9264	Grad
00050000-5579-3efc-a936-be9d89680928	8332	Gradac
00050000-5579-3efc-00f3-6ac08a48cc05	1384	Grahovo
00050000-5579-3efc-ea49-ae0c1ae9acc5	5242	Grahovo ob Bači
00050000-5579-3efc-0096-f4edeffb291c	5251	Grgar
00050000-5579-3efc-c467-f6599519ca17	3302	Griže
00050000-5579-3efc-2d6e-7abed20a821d	3231	Grobelno
00050000-5579-3efc-982b-bbdb941c490d	1290	Grosuplje
00050000-5579-3efc-5c3c-59d56f1cc5d5	2288	Hajdina
00050000-5579-3efc-5d8d-ef15a8cc4b4f	8362	Hinje
00050000-5579-3efc-87ff-bfda88d77f6d	2311	Hoče
00050000-5579-3efc-3731-7cbffc27c433	9205	Hodoš/Hodos
00050000-5579-3efc-49fe-79e0b9e3817c	1354	Horjul
00050000-5579-3efc-587a-226ebf7d9e13	1372	Hotedršica
00050000-5579-3efc-aa1e-34e4e9d24abd	1430	Hrastnik
00050000-5579-3efc-d1a0-4d92f3ff8593	6225	Hruševje
00050000-5579-3efc-52fa-e8197d573a2e	4276	Hrušica
00050000-5579-3efc-bfe8-b78019994dd2	5280	Idrija
00050000-5579-3efc-c5b7-0f93b1099232	1292	Ig
00050000-5579-3efc-cd5f-f8f58134342b	6250	Ilirska Bistrica
00050000-5579-3efc-322c-8a97341e5782	6251	Ilirska Bistrica-Trnovo
00050000-5579-3efc-30cd-31a9d97b16fd	1295	Ivančna Gorica
00050000-5579-3efc-3e75-4eee0816cf81	2259	Ivanjkovci
00050000-5579-3efc-fc65-e4ce599c2564	1411	Izlake
00050000-5579-3efc-e427-ce12370c5013	6310	Izola/Isola
00050000-5579-3efc-a17a-383caa07f1a4	2222	Jakobski Dol
00050000-5579-3efc-7280-51fe26f1e061	2221	Jarenina
00050000-5579-3efc-e97d-3b667dd64c80	6254	Jelšane
00050000-5579-3efc-aa53-99e00c20424c	4270	Jesenice
00050000-5579-3efc-e4a9-e50a800388bc	8261	Jesenice na Dolenjskem
00050000-5579-3efc-cdba-055d897fed9f	3273	Jurklošter
00050000-5579-3efc-180d-e0d7112c3435	2223	Jurovski Dol
00050000-5579-3efc-1c5b-623cf256ff49	2256	Juršinci
00050000-5579-3efc-cb01-53622a5d0d88	5214	Kal nad Kanalom
00050000-5579-3efc-2880-21071f23b918	3233	Kalobje
00050000-5579-3efc-9773-4e08d7c1ca6e	4246	Kamna Gorica
00050000-5579-3efc-3a43-0dd6b0db3caf	2351	Kamnica
00050000-5579-3efc-2eb1-c77ec30b498c	1241	Kamnik
00050000-5579-3efc-750f-f73a09b02e7f	5213	Kanal
00050000-5579-3efc-285b-cd0cf496c9a0	8258	Kapele
00050000-5579-3efc-dbc2-73a3ca65784e	2362	Kapla
00050000-5579-3efc-2190-5cf827167d3f	2325	Kidričevo
00050000-5579-3efc-e88e-46b7ac3de8f4	1412	Kisovec
00050000-5579-3efc-23a0-0089765758f4	6253	Knežak
00050000-5579-3efc-0561-e38eb49d9e41	5222	Kobarid
00050000-5579-3efc-ff5f-3d3e58168d0f	9227	Kobilje
00050000-5579-3efc-3065-1906d238c69e	1330	Kočevje
00050000-5579-3efc-dc2a-4f3a268329a8	1338	Kočevska Reka
00050000-5579-3efc-4c5b-4dd229a0c02e	2276	Kog
00050000-5579-3efc-7194-feb9385a6591	5211	Kojsko
00050000-5579-3efc-78ae-ec410eca954f	6223	Komen
00050000-5579-3efc-842f-233747e19625	1218	Komenda
00050000-5579-3efc-0b53-1d2296c44543	6000	Koper/Capodistria 
00050000-5579-3efc-e14d-25337686ee80	6001	Koper/Capodistria - poštni predali
00050000-5579-3efc-994f-0bc353715570	8282	Koprivnica
00050000-5579-3efc-a0ff-f225622cb8b7	5296	Kostanjevica na Krasu
00050000-5579-3efc-d428-c12d26b61fd3	8311	Kostanjevica na Krki
00050000-5579-3efc-2712-362d8f7b2ced	1336	Kostel
00050000-5579-3efc-6829-619adbb722c8	6256	Košana
00050000-5579-3efc-98fe-cde3fc74fb97	2394	Kotlje
00050000-5579-3efc-b78c-3f352bd31452	6240	Kozina
00050000-5579-3efc-b715-9e8be5592527	3260	Kozje
00050000-5579-3efc-4807-fe6e8e268784	4000	Kranj 
00050000-5579-3efc-0d2b-ec45e27688f6	4001	Kranj - poštni predali
00050000-5579-3efc-881d-dbac200dcec8	4280	Kranjska Gora
00050000-5579-3efc-54a2-1cec0320b54d	1281	Kresnice
00050000-5579-3efc-f3be-bb16a00d3a6f	4294	Križe
00050000-5579-3efc-3f55-ce7380f50488	9206	Križevci
00050000-5579-3efc-1f70-856a9a09f2ea	9242	Križevci pri Ljutomeru
00050000-5579-3efc-8bd0-517edf96bfa5	1301	Krka
00050000-5579-3efc-589e-811db9b1aee6	8296	Krmelj
00050000-5579-3efc-5ef8-8439324bf871	4245	Kropa
00050000-5579-3efc-17e5-823182b1f59e	8262	Krška vas
00050000-5579-3efc-8be7-c79cdf129a8e	8270	Krško
00050000-5579-3efc-6f7c-f5967ae8e906	9263	Kuzma
00050000-5579-3efc-78cf-260a6612dfde	2318	Laporje
00050000-5579-3efc-b5ce-82f03e5c8796	3270	Laško
00050000-5579-3efc-9fb0-3048e4a3282b	1219	Laze v Tuhinju
00050000-5579-3efc-2da9-afc2f50447f7	2230	Lenart v Slovenskih goricah
00050000-5579-3efc-6c59-62272443c757	9220	Lendava/Lendva
00050000-5579-3efc-ad96-fcdb3fa78564	4248	Lesce
00050000-5579-3efc-f458-9a3b805e1658	3261	Lesično
00050000-5579-3efc-6ad4-d146f55f9d62	8273	Leskovec pri Krškem
00050000-5579-3efc-0cf6-bd115864b8dc	2372	Libeliče
00050000-5579-3efc-0fa9-57159b71cc9d	2341	Limbuš
00050000-5579-3efc-85f6-881424f3d93a	1270	Litija
00050000-5579-3efc-8012-515a2d08f38b	3202	Ljubečna
00050000-5579-3efc-6ae9-b30cd0c256ad	1000	Ljubljana 
00050000-5579-3efc-2619-3ebee02931bd	1001	Ljubljana - poštni predali
00050000-5579-3efc-6a2d-e1ca62c1c25b	1231	Ljubljana - Črnuče
00050000-5579-3efc-9764-709c92ba79d5	1261	Ljubljana - Dobrunje
00050000-5579-3efc-504f-fe74532fa9c5	1260	Ljubljana - Polje
00050000-5579-3efc-7ff9-f047ed89a1bc	1210	Ljubljana - Šentvid
00050000-5579-3efc-0c4d-2a3c89756f30	1211	Ljubljana - Šmartno
00050000-5579-3efc-7796-c9215665b36b	3333	Ljubno ob Savinji
00050000-5579-3efc-dc03-e06417581a46	9240	Ljutomer
00050000-5579-3efc-a381-bd9b99a84a81	3215	Loče
00050000-5579-3efc-3bf9-a41cefdfeff4	5231	Log pod Mangartom
00050000-5579-3efc-ebc8-cc21391302b3	1358	Log pri Brezovici
00050000-5579-3efc-4374-e91e0a3ae9cb	1370	Logatec
00050000-5579-3efc-a9fc-2f6cab94bfc4	1371	Logatec
00050000-5579-3efc-8dfa-1ae1d981b7c0	1434	Loka pri Zidanem Mostu
00050000-5579-3efc-e5ff-03b5e0305d39	3223	Loka pri Žusmu
00050000-5579-3efc-165a-da2f72f491ca	6219	Lokev
00050000-5579-3efc-6117-1c06c25aa758	1318	Loški Potok
00050000-5579-3efc-9573-101564a13b4f	2324	Lovrenc na Dravskem polju
00050000-5579-3efc-252d-2da553841170	2344	Lovrenc na Pohorju
00050000-5579-3efc-a2c2-ca7f4a4cd4f1	3334	Luče
00050000-5579-3efc-c484-571573f95c21	1225	Lukovica
00050000-5579-3efc-e150-b2f23c817b57	9202	Mačkovci
00050000-5579-3efc-244c-f182474eb151	2322	Majšperk
00050000-5579-3efc-f4e9-e362fa32a064	2321	Makole
00050000-5579-3efc-5172-a5a9498b4423	9243	Mala Nedelja
00050000-5579-3efc-eac7-d24d88b8cc26	2229	Malečnik
00050000-5579-3efc-5d3c-cdeff817311e	6273	Marezige
00050000-5579-3efc-0e03-460d443cf9ae	2000	Maribor 
00050000-5579-3efc-8b81-c9ab73bd006e	2001	Maribor - poštni predali
00050000-5579-3efc-8a5a-0bb6dd34fd7b	2206	Marjeta na Dravskem polju
00050000-5579-3efc-4629-4759f6b6f8e3	2281	Markovci
00050000-5579-3efc-b4bd-0790ae05e1b4	9221	Martjanci
00050000-5579-3efc-9f12-50077192659c	6242	Materija
00050000-5579-3efc-0be9-3ee35b6ca78f	4211	Mavčiče
00050000-5579-3efc-5a2c-1abd0ec5f3ab	1215	Medvode
00050000-5579-3efc-5c1f-5208f046df76	1234	Mengeš
00050000-5579-3efc-39a5-25f1cdb35939	8330	Metlika
00050000-5579-3efc-e486-2df4039f16ec	2392	Mežica
00050000-5579-3efc-8432-e099cf328a3e	2204	Miklavž na Dravskem polju
00050000-5579-3efc-8074-29c0bbb2b5d2	2275	Miklavž pri Ormožu
00050000-5579-3efc-8abf-46525736cd1a	5291	Miren
00050000-5579-3efc-fc2d-15e91e660281	8233	Mirna
00050000-5579-3efc-62cb-f39803d3243f	8216	Mirna Peč
00050000-5579-3efc-c8c8-d5908c9a8eae	2382	Mislinja
00050000-5579-3efc-4a99-f288f8d60c81	4281	Mojstrana
00050000-5579-3efc-a332-0590496ce6b7	8230	Mokronog
00050000-5579-3efc-a958-4d6913a16395	1251	Moravče
00050000-5579-3efc-af5d-12fae8fb69c8	9226	Moravske Toplice
00050000-5579-3efc-ea03-3fb3ce71b055	5216	Most na Soči
00050000-5579-3efc-f3d1-ec5fb4753ac3	1221	Motnik
00050000-5579-3efc-629d-abeb089162a9	3330	Mozirje
00050000-5579-3efc-3993-ceaa64acf44b	9000	Murska Sobota 
00050000-5579-3efc-50d6-8cdf45058def	9001	Murska Sobota - poštni predali
00050000-5579-3efc-1e3c-4e5c3071041c	2366	Muta
00050000-5579-3efc-0cae-69dde0344268	4202	Naklo
00050000-5579-3efc-be40-0fa018e490e3	3331	Nazarje
00050000-5579-3efc-133b-6eea608bdf32	1357	Notranje Gorice
00050000-5579-3efc-e05c-ca90ee6800fa	3203	Nova Cerkev
00050000-5579-3efc-9f5e-3278fbe6d235	5000	Nova Gorica 
00050000-5579-3efc-c9d0-c149f75863e8	5001	Nova Gorica - poštni predali
00050000-5579-3efc-443f-9be6fac2b893	1385	Nova vas
00050000-5579-3efc-cfd4-16098956a3cb	8000	Novo mesto
00050000-5579-3efc-5e4e-580292899b69	8001	Novo mesto - poštni predali
00050000-5579-3efc-7386-f1c4e8ebab8a	6243	Obrov
00050000-5579-3efc-6f28-d4a135eccf91	9233	Odranci
00050000-5579-3efc-92f2-b82c60aebdd6	2317	Oplotnica
00050000-5579-3efc-8eb4-879c72537b75	2312	Orehova vas
00050000-5579-3efc-ccc3-b3f5bca59d44	2270	Ormož
00050000-5579-3efc-1635-3bd6b47c5c3a	1316	Ortnek
00050000-5579-3efc-401f-4333cf9c3ef3	1337	Osilnica
00050000-5579-3efc-a39b-719bac0da4db	8222	Otočec
00050000-5579-3efc-3b21-ed299637e892	2361	Ožbalt
00050000-5579-3efc-b17a-1ef1e5967286	2231	Pernica
00050000-5579-3efc-4c9c-26525fb9e8c4	2211	Pesnica pri Mariboru
00050000-5579-3efc-f66c-eb3df58801ed	9203	Petrovci
00050000-5579-3efc-b088-94d935dd956f	3301	Petrovče
00050000-5579-3efc-0266-689fad84d22a	6330	Piran/Pirano
00050000-5579-3efc-b464-898be12254d6	8255	Pišece
00050000-5579-3efc-1a40-dcab8ec03b2f	6257	Pivka
00050000-5579-3efc-1c75-1842b17dd023	6232	Planina
00050000-5579-3efc-b695-3c38187246e5	3225	Planina pri Sevnici
00050000-5579-3efc-07db-23ed8777126c	6276	Pobegi
00050000-5579-3efc-177a-f09e92e76f75	8312	Podbočje
00050000-5579-3efc-6e76-0a115bca7ce6	5243	Podbrdo
00050000-5579-3efc-dc56-a7d38634d5d0	3254	Podčetrtek
00050000-5579-3efc-5a6b-37d376fd2b15	2273	Podgorci
00050000-5579-3efc-63e1-165c6d03b6de	6216	Podgorje
00050000-5579-3efc-2c94-037d730cc2bd	2381	Podgorje pri Slovenj Gradcu
00050000-5579-3efc-c33f-c859c021627c	6244	Podgrad
00050000-5579-3efc-00f4-a789e6827002	1414	Podkum
00050000-5579-3efc-8ff9-3e5038cd68b3	2286	Podlehnik
00050000-5579-3efc-99bf-5f9890c1ec97	5272	Podnanos
00050000-5579-3efc-aa81-d65eb8e0ae10	4244	Podnart
00050000-5579-3efc-bed9-9dcff5e04410	3241	Podplat
00050000-5579-3efc-d9cf-61e7c1025c68	3257	Podsreda
00050000-5579-3efc-fe58-ab1387b74586	2363	Podvelka
00050000-5579-3efc-531f-b1d4d47a3456	2208	Pohorje
00050000-5579-3efc-f604-eb12049b0033	2257	Polenšak
00050000-5579-3efc-924f-f19ce1196113	1355	Polhov Gradec
00050000-5579-3efc-968a-4436275aef7a	4223	Poljane nad Škofjo Loko
00050000-5579-3efc-44b6-d3a83a269bb4	2319	Poljčane
00050000-5579-3efc-cdda-520836402418	1272	Polšnik
00050000-5579-3efc-8282-4fbbe3a06f2b	3313	Polzela
00050000-5579-3efc-62bc-9ff286dd8fcd	3232	Ponikva
00050000-5579-3efc-f01e-b0d22fedb49d	6320	Portorož/Portorose
00050000-5579-3efc-8aa1-f96e2f942e71	6230	Postojna
00050000-5579-3efc-299c-17ccb03ad948	2331	Pragersko
00050000-5579-3efc-a128-25452b39f6bb	3312	Prebold
00050000-5579-3efc-b69f-341dcccd890a	4205	Preddvor
00050000-5579-3efc-bbbe-9438b0550d38	6255	Prem
00050000-5579-3efc-0615-41e643f99678	1352	Preserje
00050000-5579-3efc-5165-df50eca66e48	6258	Prestranek
00050000-5579-3efc-3c69-3b12bfa3d7b7	2391	Prevalje
00050000-5579-3efc-0cec-50d941003722	3262	Prevorje
00050000-5579-3efc-34fb-39afdf2c7d4e	1276	Primskovo 
00050000-5579-3efc-919b-234e3a55daaf	3253	Pristava pri Mestinju
00050000-5579-3efc-e354-102cfed1f5cd	9207	Prosenjakovci/Partosfalva
00050000-5579-3efc-61a1-973c9d96af52	5297	Prvačina
00050000-5579-3efc-d960-74cbfbf7fb29	2250	Ptuj
00050000-5579-3efc-f5c6-b4fa209ccc53	2323	Ptujska Gora
00050000-5579-3efc-26c2-17098edebde1	9201	Puconci
00050000-5579-3efc-9d0a-c132c554cde5	2327	Rače
00050000-5579-3efc-2d9c-529627de4877	1433	Radeče
00050000-5579-3efc-b42e-329183fca27c	9252	Radenci
00050000-5579-3efc-c84c-46865f8ccc4b	2360	Radlje ob Dravi
00050000-5579-3efc-0f28-822e5338d7e1	1235	Radomlje
00050000-5579-3efc-5f96-04fcf854b5ed	4240	Radovljica
00050000-5579-3efc-f36e-31e215bc278c	8274	Raka
00050000-5579-3efc-1d8f-b2136d41a41c	1381	Rakek
00050000-5579-3efc-dd50-71fde9d7cc50	4283	Rateče - Planica
00050000-5579-3efc-8c1f-cc7256cd5831	2390	Ravne na Koroškem
00050000-5579-3efc-4d97-b4108d3e3036	9246	Razkrižje
00050000-5579-3efc-3b87-529343e17660	3332	Rečica ob Savinji
00050000-5579-3efc-3dc6-499216e0d7c6	5292	Renče
00050000-5579-3efc-c7e4-e462c52f0cfc	1310	Ribnica
00050000-5579-3efc-6244-0a9cac299e7c	2364	Ribnica na Pohorju
00050000-5579-3efc-b839-976898662d61	3272	Rimske Toplice
00050000-5579-3efc-cd36-268c217426dd	1314	Rob
00050000-5579-3efc-1cd7-f7695369c41c	5215	Ročinj
00050000-5579-3efc-6394-8c893678e24a	3250	Rogaška Slatina
00050000-5579-3efc-6617-245b0e4b8619	9262	Rogašovci
00050000-5579-3efc-eed6-db9769ea85d3	3252	Rogatec
00050000-5579-3efc-d567-e22165c3c3af	1373	Rovte
00050000-5579-3efc-155b-53468d13caf9	2342	Ruše
00050000-5579-3efc-fb00-4dd113523a43	1282	Sava
00050000-5579-3efc-3d10-8773b3fcade4	6333	Sečovlje/Sicciole
00050000-5579-3efc-4cfc-46f22e1e7116	4227	Selca
00050000-5579-3efc-d5c2-22b0be16a50c	2352	Selnica ob Dravi
00050000-5579-3efc-2846-435a138de902	8333	Semič
00050000-5579-3efc-8dc0-23d21ffaea74	8281	Senovo
00050000-5579-3efc-f91c-a2030a77cc0e	6224	Senožeče
00050000-5579-3efc-3e6a-494f5317ba3a	8290	Sevnica
00050000-5579-3efc-a1f1-57a8dfed1b21	6210	Sežana
00050000-5579-3efc-5daa-fa81a170788a	2214	Sladki Vrh
00050000-5579-3efc-cbfc-41028eb7ddcf	5283	Slap ob Idrijci
00050000-5579-3efc-636c-d4e8e9531a77	2380	Slovenj Gradec
00050000-5579-3efc-dbb3-370c8d5ac6ba	2310	Slovenska Bistrica
00050000-5579-3efc-653a-fb6605dd2be0	3210	Slovenske Konjice
00050000-5579-3efc-9e2e-90f3e1285549	1216	Smlednik
00050000-5579-3efc-01e3-2d5283c600d0	5232	Soča
00050000-5579-3efc-dd26-f32e41c33f31	1317	Sodražica
00050000-5579-3efc-2a16-15b4db454284	3335	Solčava
00050000-5579-3efc-22f4-7c23481823bb	5250	Solkan
00050000-5579-3efc-5b86-c16ce576103e	4229	Sorica
00050000-5579-3efc-6fe2-f6b8272d7d53	4225	Sovodenj
00050000-5579-3efc-9169-e4de9442326f	5281	Spodnja Idrija
00050000-5579-3efc-bc2c-edc5cb52d2f0	2241	Spodnji Duplek
00050000-5579-3efc-1e05-2fdb711a06fa	9245	Spodnji Ivanjci
00050000-5579-3efc-875b-45042d248a3a	2277	Središče ob Dravi
00050000-5579-3efc-7258-29c174f9414c	4267	Srednja vas v Bohinju
00050000-5579-3efc-9e16-60cb32bba431	8256	Sromlje 
00050000-5579-3efc-f1dd-ea4e3f6c44f1	5224	Srpenica
00050000-5579-3efc-dfa6-1d248497c162	1242	Stahovica
00050000-5579-3efc-7571-71dd2ad52ecb	1332	Stara Cerkev
00050000-5579-3efc-6531-539a1aedb6b3	8342	Stari trg ob Kolpi
00050000-5579-3efc-fca3-dcd6edd73f2b	1386	Stari trg pri Ložu
00050000-5579-3efc-4e12-dd01b09e30b6	2205	Starše
00050000-5579-3efc-75e5-d03b4d3094c2	2289	Stoperce
00050000-5579-3efc-c372-e8cf8bf5a933	8322	Stopiče
00050000-5579-3efc-ef5d-d0c19eaf2f29	3206	Stranice
00050000-5579-3efc-9e09-f11d003d7523	8351	Straža
00050000-5579-3efc-bbd2-f7af0daf6584	1313	Struge
00050000-5579-3efc-95d9-b05f79ba9ea8	8293	Studenec
00050000-5579-3efc-aadf-843fc4529649	8331	Suhor
00050000-5579-3efc-be7e-d236d7b4343d	2233	Sv. Ana v Slovenskih goricah
00050000-5579-3efc-4b23-430a5342c1d0	2235	Sv. Trojica v Slovenskih goricah
00050000-5579-3efc-185b-dea7c74ec2e6	2353	Sveti Duh na Ostrem Vrhu
00050000-5579-3efc-dc14-7a3d804c20f3	9244	Sveti Jurij ob Ščavnici
00050000-5579-3efc-ebce-b3e3e77e9aec	3264	Sveti Štefan
00050000-5579-3efc-4b34-92c0cb452804	2258	Sveti Tomaž
00050000-5579-3efc-4d99-0c558412b78c	9204	Šalovci
00050000-5579-3efc-6ca1-8adcffb75023	5261	Šempas
00050000-5579-3efc-6ca0-06611e966142	5290	Šempeter pri Gorici
00050000-5579-3efc-2e74-395aa1fec2ba	3311	Šempeter v Savinjski dolini
00050000-5579-3efc-1c77-41399b237468	4208	Šenčur
00050000-5579-3efc-fdcc-a82c0fa36b1c	2212	Šentilj v Slovenskih goricah
00050000-5579-3efc-95ef-1791c03718c5	8297	Šentjanž
00050000-5579-3efc-9a7e-9b9f60fc3ab2	2373	Šentjanž pri Dravogradu
00050000-5579-3efc-d4eb-44c7c052ad3e	8310	Šentjernej
00050000-5579-3efc-18b4-35a341569085	3230	Šentjur
00050000-5579-3efc-4197-839926f20f13	3271	Šentrupert
00050000-5579-3efc-28e5-c8aeb4e114b1	8232	Šentrupert
00050000-5579-3efc-2074-3dc133e52c8b	1296	Šentvid pri Stični
00050000-5579-3efc-b4ed-404240b83d47	8275	Škocjan
00050000-5579-3efc-a60f-54c2e7b120d0	6281	Škofije
00050000-5579-3efc-2103-350b0b949943	4220	Škofja Loka
00050000-5579-3efc-9aff-0379a0e339a4	3211	Škofja vas
00050000-5579-3efc-4c9b-314944424e69	1291	Škofljica
00050000-5579-3efc-f002-5eb8c4b33e3c	6274	Šmarje
00050000-5579-3efc-68dd-6c5357ac0964	1293	Šmarje - Sap
00050000-5579-3efc-0bcc-e8d1495a3f3e	3240	Šmarje pri Jelšah
00050000-5579-3efc-9ec2-9babb032d037	8220	Šmarješke Toplice
00050000-5579-3efc-13ce-ef63b1e878c8	2315	Šmartno na Pohorju
00050000-5579-3efc-4ad5-e6d6fb35c2e0	3341	Šmartno ob Dreti
00050000-5579-3efc-98df-8fdc100f2d8f	3327	Šmartno ob Paki
00050000-5579-3efc-efcc-9bba9c6074b5	1275	Šmartno pri Litiji
00050000-5579-3efc-aff7-5535bcbf9752	2383	Šmartno pri Slovenj Gradcu
00050000-5579-3efc-fd42-24f3bf6c0b64	3201	Šmartno v Rožni dolini
00050000-5579-3efc-1823-4a9940cc125a	3325	Šoštanj
00050000-5579-3efc-5003-a0bd6b5eb72d	6222	Štanjel
00050000-5579-3efc-bbcf-ccd1bed17f39	3220	Štore
00050000-5579-3efc-9650-07d84fff0ffc	3304	Tabor
00050000-5579-3efc-bcd5-8ba0a80fa2da	3221	Teharje
00050000-5579-3efc-c491-9b3fa743c3a6	9251	Tišina
00050000-5579-3efc-aa04-bdc97c0939ab	5220	Tolmin
00050000-5579-3efc-0a0e-d1350a8bf92a	3326	Topolšica
00050000-5579-3efc-f695-47f4b0e363eb	2371	Trbonje
00050000-5579-3efc-1447-ad27cc6a32e1	1420	Trbovlje
00050000-5579-3efc-3227-e93beacd7b4b	8231	Trebelno 
00050000-5579-3efc-c40e-c2d2defddfc9	8210	Trebnje
00050000-5579-3efc-1e7f-65a85426e3a8	5252	Trnovo pri Gorici
00050000-5579-3efc-84c0-4976ea2f0e75	2254	Trnovska vas
00050000-5579-3efc-81f9-db28ecbde95b	1222	Trojane
00050000-5579-3efc-a185-ddf02dbd0554	1236	Trzin
00050000-5579-3efc-ee77-7854ee33a6e2	4290	Tržič
00050000-5579-3efc-054f-37f21efa2304	8295	Tržišče
00050000-5579-3efc-df93-8c19344975a8	1311	Turjak
00050000-5579-3efc-38bb-0842c5a5f47e	9224	Turnišče
00050000-5579-3efc-7a78-6fa2659cb386	8323	Uršna sela
00050000-5579-3efc-01ef-e1848f720bb9	1252	Vače
00050000-5579-3efc-c2f7-f6df3d422a89	3320	Velenje 
00050000-5579-3efc-63fe-0a35079cb437	3322	Velenje - poštni predali
00050000-5579-3efc-fcb3-7e0c0a7caebc	8212	Velika Loka
00050000-5579-3efc-8161-2d2db53495a7	2274	Velika Nedelja
00050000-5579-3efc-bb6b-120d89ae3f1f	9225	Velika Polana
00050000-5579-3efc-aa33-a73a185d84b0	1315	Velike Lašče
00050000-5579-3efc-48de-310d2f375f0d	8213	Veliki Gaber
00050000-5579-3efc-d0eb-74351ec2cbb6	9241	Veržej
00050000-5579-3efc-37d8-b95028ca6f0b	1312	Videm - Dobrepolje
00050000-5579-3efc-e18e-2e48db0ade5b	2284	Videm pri Ptuju
00050000-5579-3efc-bf5f-187f08e3bc8a	8344	Vinica
00050000-5579-3efc-bc5e-239ce0fbf660	5271	Vipava
00050000-5579-3efc-d9f5-d19d4bd197c4	4212	Visoko
00050000-5579-3efc-41fe-7fbe83f1133e	1294	Višnja Gora
00050000-5579-3efc-5986-38569d7c019f	3205	Vitanje
00050000-5579-3efc-d96d-39bdc972029e	2255	Vitomarci
00050000-5579-3efc-d3f4-9dc0084d0300	1217	Vodice
00050000-5579-3efc-8595-f4e551238735	3212	Vojnik\t
00050000-5579-3efc-877d-024b48368635	5293	Volčja Draga
00050000-5579-3efc-aa46-34f66c621820	2232	Voličina
00050000-5579-3efc-53d0-524343d10a65	3305	Vransko
00050000-5579-3efc-08b7-ea9b66077d79	6217	Vremski Britof
00050000-5579-3efc-fd9d-897b2b946176	1360	Vrhnika
00050000-5579-3efc-a949-862e9959c31e	2365	Vuhred
00050000-5579-3efc-b2ac-7401c70ca5b2	2367	Vuzenica
00050000-5579-3efc-cb12-825489fc8e5d	8292	Zabukovje 
00050000-5579-3efc-ac3c-c46020498137	1410	Zagorje ob Savi
00050000-5579-3efc-854a-29295c183a2a	1303	Zagradec
00050000-5579-3efc-dd8f-d0d05e2eef8b	2283	Zavrč
00050000-5579-3efc-d1c2-b60c7e8c2f39	8272	Zdole 
00050000-5579-3efc-25a2-29a2b9a05773	4201	Zgornja Besnica
00050000-5579-3efc-0a55-7e3e2372725c	2242	Zgornja Korena
00050000-5579-3efc-8865-e8b9190d1e0c	2201	Zgornja Kungota
00050000-5579-3efc-93f7-a4c193865678	2316	Zgornja Ložnica
00050000-5579-3efc-1a11-68d0e34c4665	2314	Zgornja Polskava
00050000-5579-3efc-8052-0cd6f9e81a66	2213	Zgornja Velka
00050000-5579-3efc-2f9a-5350540374d1	4247	Zgornje Gorje
00050000-5579-3efc-774a-20edb35efc6d	4206	Zgornje Jezersko
00050000-5579-3efc-714b-54a1743858f1	2285	Zgornji Leskovec
00050000-5579-3efc-2f61-a21f33760ae5	1432	Zidani Most
00050000-5579-3efc-661d-6d2b824b8a41	3214	Zreče
00050000-5579-3efc-19cb-b8f735456319	4209	Žabnica
00050000-5579-3efc-51d2-905b82fbdd63	3310	Žalec
00050000-5579-3efc-ba1c-d844cf257410	4228	Železniki
00050000-5579-3efc-f549-c77663ae0e05	2287	Žetale
00050000-5579-3efc-49ff-2fd7063114eb	4226	Žiri
00050000-5579-3efc-3bc3-f2e124f60cff	4274	Žirovnica
00050000-5579-3efc-d865-84b48717477a	8360	Žužemberk
\.


--
-- TOC entry 2848 (class 0 OID 6896577)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6896388)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6896466)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 6896589)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 6896709)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 6896762)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5579-3efe-6dac-bf30c7e1f182	00080000-5579-3efe-05a4-f69f43bf96e1	0987	A
00190000-5579-3efe-62ba-f28edbf0a729	00080000-5579-3efe-1349-20952f0fbdc3	0989	A
\.


--
-- TOC entry 2874 (class 0 OID 6896877)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 6896939)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 6896890)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 6896909)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, soorganizator, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 6896618)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5579-3efe-e803-6d39850fd5fd	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5579-3efe-0176-54461ae54030	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5579-3efe-277d-20bfbc8be1b0	0003	Kazinska	t	84	Kazinska dvorana
00220000-5579-3efe-4c33-9715b9892750	0004	Mali oder	t	24	Mali oder 
00220000-5579-3efe-e75f-3929ae2c82fe	0005	Komorni oder	t	15	Komorni oder
00220000-5579-3efe-006d-7680fe2ef131	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5579-3efe-3f01-4f739a69a6b8	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2846 (class 0 OID 6896562)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6896552)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6896751)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 6896686)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6896260)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5579-3efd-7923-f47bbc1cefe9	00010000-5579-3efd-c1e6-cda99eed3120	2015-06-11 09:55:43	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROMTyEsEff8u9mY6Efc34Umpa4V0HS9ke";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2890 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2855 (class 0 OID 6896628)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6896298)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5579-3efd-9634-0f61c725f88e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5579-3efd-7f71-3d0b88933404	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5579-3efd-8ac3-66b3245a811e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5579-3efd-ac2a-a888fbec58f7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5579-3efd-e8f4-c76aaf61b49f	planer	Planer dogodkov v koledarju	t
00020000-5579-3efd-7f6b-5ae8c192806a	kadrovska	Kadrovska služba	t
00020000-5579-3efd-9f91-d84a80f62696	arhivar	Ažuriranje arhivalij	t
00020000-5579-3efd-60aa-f622a0c10e4d	igralec	Igralec	t
00020000-5579-3efd-780e-9229ee4e11c6	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2821 (class 0 OID 6896282)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5579-3efd-7923-f47bbc1cefe9	00020000-5579-3efd-8ac3-66b3245a811e
00010000-5579-3efd-c1e6-cda99eed3120	00020000-5579-3efd-8ac3-66b3245a811e
\.


--
-- TOC entry 2857 (class 0 OID 6896642)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6896583)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6896533)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 6896972)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5579-3efc-28c5-1d31ad0df486	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5579-3efc-4447-d0aae7ec7fe2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5579-3efc-408f-b4ac77e78e4f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5579-3efc-ef81-5b4c265209a3	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5579-3efc-7c46-eaf92baf7ce4	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2880 (class 0 OID 6896964)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5579-3efc-2537-82dcc856dd4a	00230000-5579-3efc-ef81-5b4c265209a3	popa
00240000-5579-3efc-8115-bd91d80d34ea	00230000-5579-3efc-ef81-5b4c265209a3	oseba
00240000-5579-3efc-9d5f-dfd72d08687f	00230000-5579-3efc-4447-d0aae7ec7fe2	prostor
00240000-5579-3efc-da5a-db57fd0c3583	00230000-5579-3efc-ef81-5b4c265209a3	besedilo
00240000-5579-3efc-d9f1-f6f089105b68	00230000-5579-3efc-ef81-5b4c265209a3	uprizoritev
00240000-5579-3efc-20b6-5b4e56fd5763	00230000-5579-3efc-ef81-5b4c265209a3	funkcija
00240000-5579-3efc-f4d7-2ea6fdef7bba	00230000-5579-3efc-ef81-5b4c265209a3	tipfunkcije
00240000-5579-3efc-351b-a315b9d6109f	00230000-5579-3efc-ef81-5b4c265209a3	alternacija
00240000-5579-3efc-8441-63d1f1246d5e	00230000-5579-3efc-28c5-1d31ad0df486	pogodba
00240000-5579-3efc-203b-6feb9ff2f95d	00230000-5579-3efc-ef81-5b4c265209a3	zaposlitev
\.


--
-- TOC entry 2879 (class 0 OID 6896959)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6896696)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6896360)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 6896539)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5579-3efe-6fcc-1abc957f75c4	00180000-5579-3efe-da7b-a8b7ebcfdd68	000c0000-5579-3efe-2d3b-cc881a933857	00090000-5579-3efe-bea9-d86a986261ab	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-3efe-23a9-57740a96e560	00180000-5579-3efe-da7b-a8b7ebcfdd68	000c0000-5579-3efe-0232-760343e56854	00090000-5579-3efe-d3ad-cb7ed54331b5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-3efe-a375-eb100197aa48	00180000-5579-3efe-da7b-a8b7ebcfdd68	000c0000-5579-3efe-82ba-2b26137f67cd	00090000-5579-3efe-4d2b-0b635b9823d7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-3efe-21bf-3ff0466a64d2	00180000-5579-3efe-da7b-a8b7ebcfdd68	000c0000-5579-3efe-43da-21c4d190eed9	00090000-5579-3efe-ce4f-cc379c122579	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-3efe-c485-e205c7c27226	00180000-5579-3efe-da7b-a8b7ebcfdd68	000c0000-5579-3efe-9803-2daa79b328cf	00090000-5579-3efe-9c39-da3a94d5e81c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-3efe-37a1-ecd575895620	00180000-5579-3efe-e9a8-d827d6e7d7ab	\N	00090000-5579-3efe-9c39-da3a94d5e81c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2865 (class 0 OID 6896740)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5579-3efc-60a1-c08b0f7f02ec	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5579-3efc-4e09-efd65b9ff5ff	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5579-3efc-0411-744e483e2ee0	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5579-3efc-4e8f-b60747321198	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5579-3efc-b6c8-436532699940	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5579-3efc-d6ac-f6240f4ac2d4	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5579-3efc-880d-6c1af90aa3b4	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5579-3efc-964d-f8c6d2b756d3	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5579-3efc-fb79-53c3cee00f96	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5579-3efc-5139-0be3573d9b14	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5579-3efc-0d3f-d50ed7abf4cb	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5579-3efc-f1f6-be74838406db	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5579-3efc-9e2c-2604b69f100a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5579-3efc-9fe8-8dd33d5179af	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5579-3efc-8cf7-d2ffe39626e0	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5579-3efc-55c5-1e81ac49dc6d	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2877 (class 0 OID 6896928)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5579-3efc-c8ad-924ac64067d4	01	Velika predstava	f	1.00	1.00
002b0000-5579-3efc-3570-4f56f5248d6f	02	Mala predstava	f	0.50	0.50
002b0000-5579-3efc-a0aa-e8892ec16ee2	03	Mala koprodukcija	t	0.40	1.00
002b0000-5579-3efc-7db7-121c4012e15c	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5579-3efc-6b1b-f6e8ac5a087d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2833 (class 0 OID 6896423)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6896269)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5579-3efd-c1e6-cda99eed3120	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuOOrSBlpyyARkQ4PHrwNJfbyNUfWs3.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5579-3efe-10d7-6e169c1f1701	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5579-3efe-07c1-6941c938a29a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5579-3efe-bf75-564e02c8b183	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5579-3efe-0225-b113c54874a0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5579-3efe-9e2b-9c51ae6350da	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5579-3efe-3595-ec4d2fabc847	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5579-3efd-7923-f47bbc1cefe9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2870 (class 0 OID 6896797)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5579-3efe-6f1e-62601ce11b3c	00160000-5579-3efe-9f0c-42ed0dd7b21f	00150000-5579-3efc-bd19-aac23d877fce	00140000-5579-3efc-d718-1fafb14f6b93	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5579-3efe-e75f-3929ae2c82fe
000e0000-5579-3efe-95d6-e207ede1c987	00160000-5579-3efe-ee4f-1cd5a59ec734	00150000-5579-3efc-db37-b54511aa7e47	00140000-5579-3efc-d370-2d033a3d3645	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5579-3efe-006d-7680fe2ef131
000e0000-5579-3efe-e408-e4250b80c71b	\N	00150000-5579-3efc-db37-b54511aa7e47	00140000-5579-3efc-d370-2d033a3d3645	00190000-5579-3efe-6dac-bf30c7e1f182	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5579-3efe-e75f-3929ae2c82fe
000e0000-5579-3efe-4aa5-a9616812cc32	\N	00150000-5579-3efc-db37-b54511aa7e47	00140000-5579-3efc-d370-2d033a3d3645	00190000-5579-3efe-6dac-bf30c7e1f182	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5579-3efe-e75f-3929ae2c82fe
\.


--
-- TOC entry 2838 (class 0 OID 6896485)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5579-3efe-d652-8355835004e9	000e0000-5579-3efe-95d6-e207ede1c987	1	
00200000-5579-3efe-d06e-4ba10badd077	000e0000-5579-3efe-95d6-e207ede1c987	2	
\.


--
-- TOC entry 2853 (class 0 OID 6896610)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 6896679)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6896517)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 6896787)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5579-3efc-d718-1fafb14f6b93	01	Drama	drama (SURS 01)
00140000-5579-3efc-f68b-af9eb3581476	02	Opera	opera (SURS 02)
00140000-5579-3efc-3bf0-e082caae55d8	03	Balet	balet (SURS 03)
00140000-5579-3efc-f455-3702333b3d06	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5579-3efc-2d06-56c297e8df6c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5579-3efc-d370-2d033a3d3645	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5579-3efc-dd70-f6ee80dceaaf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2859 (class 0 OID 6896669)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5579-3efc-bc71-0923a8046e35	01	Opera	opera
00150000-5579-3efc-4c3f-ebd159698209	02	Opereta	opereta
00150000-5579-3efc-e7ac-b5c9af076e41	03	Balet	balet
00150000-5579-3efc-5a3c-39f374fdec6d	04	Plesne prireditve	plesne prireditve
00150000-5579-3efc-2725-9be86c30b81b	05	Lutkovno gledališče	lutkovno gledališče
00150000-5579-3efc-f8cc-189df4bafcc0	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5579-3efc-65cc-47d4fed60f11	07	Biografska drama	biografska drama
00150000-5579-3efc-bd19-aac23d877fce	08	Komedija	komedija
00150000-5579-3efc-b345-b581e7cba53f	09	Črna komedija	črna komedija
00150000-5579-3efc-bbee-c9d18019bad0	10	E-igra	E-igra
00150000-5579-3efc-db37-b54511aa7e47	11	Kriminalka	kriminalka
00150000-5579-3efc-079d-f07d3d434b6d	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 6896323)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6896844)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6896834)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6896739)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6896507)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6896532)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6896449)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6896873)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6896665)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6896483)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6896526)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6896463)
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
-- TOC entry 2495 (class 2606 OID 6896575)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6896602)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6896421)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6896332)
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
-- TOC entry 2410 (class 2606 OID 6896356)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6896312)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 6896297)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6896608)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6896641)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6896782)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6896385)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6896409)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6896581)
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
-- TOC entry 2425 (class 2606 OID 6896399)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6896470)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6896593)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6896721)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6896767)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6896888)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 6896957)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 6896905)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 6896926)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6896625)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6896566)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6896557)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 6896761)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6896693)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6896268)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6896632)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6896286)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 6896306)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6896650)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6896588)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6896538)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 6896981)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 6896969)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 6896963)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6896706)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 6896365)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6896548)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6896750)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 6896938)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6896434)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6896281)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6896813)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6896492)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6896616)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6896684)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6896521)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6896795)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6896677)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 6896514)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 6896707)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 6896708)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 6896387)
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
-- TOC entry 2508 (class 1259 OID 6896609)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 6896595)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 6896594)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 6896493)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 6896666)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 6896668)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 6896667)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6896465)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6896464)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 6896784)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 6896785)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 6896786)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 6896927)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 6896818)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 6896815)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 6896819)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 6896817)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 6896816)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 6896436)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 6896435)
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
-- TOC entry 2408 (class 1259 OID 6896359)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 6896633)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 6896527)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 6896313)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 6896314)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 6896653)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 6896652)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 6896651)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 6896471)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 6896473)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 6896472)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2613 (class 1259 OID 6896971)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 6896561)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 6896559)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 6896558)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 6896560)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 6896287)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 6896288)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 6896617)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 6896582)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 6896694)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 6896695)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 6896874)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 6896875)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 6896876)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6896401)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 6896400)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 6896402)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2608 (class 1259 OID 6896958)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 6896722)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6896723)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 6896848)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 6896850)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 6896846)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 6896849)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 6896847)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 6896685)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 6896570)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 6896569)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 6896567)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 6896568)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 6896836)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 6896835)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 6896889)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 6896484)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 6896334)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 6896333)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 6896366)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6896367)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 6896551)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 6896550)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 6896549)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 6896908)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 6896906)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 6896907)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 6896516)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 6896512)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 6896509)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 6896510)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 6896508)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 6896513)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 6896511)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 6896386)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 6896450)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 6896452)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 6896451)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 6896453)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 6896576)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 6896783)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6896814)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6896357)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 6896358)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 6896678)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2619 (class 1259 OID 6896982)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6896422)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 6896970)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 6896627)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 6896626)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 6896845)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 6896410)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6896796)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6896768)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 6896769)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6896307)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 6896515)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2645 (class 2606 OID 6897118)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2648 (class 2606 OID 6897103)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2647 (class 2606 OID 6897108)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2643 (class 2606 OID 6897128)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2649 (class 2606 OID 6897098)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2644 (class 2606 OID 6897123)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2646 (class 2606 OID 6897113)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 6897273)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 6897278)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 6897033)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2666 (class 2606 OID 6897213)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2664 (class 2606 OID 6897208)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6897203)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2642 (class 2606 OID 6897093)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2674 (class 2606 OID 6897243)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2672 (class 2606 OID 6897253)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2673 (class 2606 OID 6897248)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2636 (class 2606 OID 6897068)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2637 (class 2606 OID 6897063)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2662 (class 2606 OID 6897193)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2685 (class 2606 OID 6897298)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2684 (class 2606 OID 6897303)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2683 (class 2606 OID 6897308)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2705 (class 2606 OID 6897408)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2687 (class 2606 OID 6897328)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2690 (class 2606 OID 6897313)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2686 (class 2606 OID 6897333)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2688 (class 2606 OID 6897323)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2689 (class 2606 OID 6897318)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2634 (class 2606 OID 6897058)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2635 (class 2606 OID 6897053)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6897018)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2627 (class 2606 OID 6897013)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2668 (class 2606 OID 6897223)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 6897133)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2623 (class 2606 OID 6896993)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2622 (class 2606 OID 6896998)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2669 (class 2606 OID 6897238)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2670 (class 2606 OID 6897233)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2671 (class 2606 OID 6897228)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2640 (class 2606 OID 6897073)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6897083)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2639 (class 2606 OID 6897078)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2707 (class 2606 OID 6897418)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2654 (class 2606 OID 6897168)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2656 (class 2606 OID 6897158)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2657 (class 2606 OID 6897153)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2655 (class 2606 OID 6897163)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2621 (class 2606 OID 6896983)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2620 (class 2606 OID 6896988)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2667 (class 2606 OID 6897218)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2663 (class 2606 OID 6897198)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2677 (class 2606 OID 6897263)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2676 (class 2606 OID 6897268)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 6897373)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 6897378)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2698 (class 2606 OID 6897383)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2632 (class 2606 OID 6897043)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 6897038)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 6897048)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2706 (class 2606 OID 6897413)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2681 (class 2606 OID 6897283)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 6897288)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2695 (class 2606 OID 6897358)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2693 (class 2606 OID 6897368)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2697 (class 2606 OID 6897348)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2694 (class 2606 OID 6897363)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2696 (class 2606 OID 6897353)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2675 (class 2606 OID 6897258)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 6897188)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2659 (class 2606 OID 6897183)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2661 (class 2606 OID 6897173)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2660 (class 2606 OID 6897178)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2691 (class 2606 OID 6897343)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2692 (class 2606 OID 6897338)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2701 (class 2606 OID 6897388)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2641 (class 2606 OID 6897088)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2682 (class 2606 OID 6897293)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2624 (class 2606 OID 6897008)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 6897003)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2629 (class 2606 OID 6897023)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2628 (class 2606 OID 6897028)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2651 (class 2606 OID 6897148)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2652 (class 2606 OID 6897143)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2653 (class 2606 OID 6897138)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 6897403)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2704 (class 2606 OID 6897393)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 6897398)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-11 09:55:43 CEST

--
-- PostgreSQL database dump complete
--

