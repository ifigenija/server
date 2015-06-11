--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-11 10:54:30 CEST

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
-- TOC entry 180 (class 1259 OID 6956094)
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
-- TOC entry 227 (class 1259 OID 6956616)
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
-- TOC entry 226 (class 1259 OID 6956599)
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
-- TOC entry 219 (class 1259 OID 6956503)
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
-- TOC entry 194 (class 1259 OID 6956273)
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
-- TOC entry 197 (class 1259 OID 6956307)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6956216)
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
-- TOC entry 228 (class 1259 OID 6956630)
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
-- TOC entry 213 (class 1259 OID 6956433)
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
-- TOC entry 192 (class 1259 OID 6956253)
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
-- TOC entry 196 (class 1259 OID 6956301)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6956233)
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
-- TOC entry 202 (class 1259 OID 6956350)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6956375)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6956190)
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
-- TOC entry 181 (class 1259 OID 6956103)
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
-- TOC entry 182 (class 1259 OID 6956114)
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
-- TOC entry 177 (class 1259 OID 6956068)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6956087)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6956382)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6956413)
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
-- TOC entry 223 (class 1259 OID 6956549)
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
-- TOC entry 184 (class 1259 OID 6956147)
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
-- TOC entry 186 (class 1259 OID 6956182)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6956356)
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
-- TOC entry 185 (class 1259 OID 6956167)
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
-- TOC entry 191 (class 1259 OID 6956245)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6956368)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6956488)
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
-- TOC entry 222 (class 1259 OID 6956541)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6956656)
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
-- TOC entry 233 (class 1259 OID 6956719)
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
-- TOC entry 230 (class 1259 OID 6956669)
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
-- TOC entry 231 (class 1259 OID 6956688)
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
-- TOC entry 209 (class 1259 OID 6956397)
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
-- TOC entry 201 (class 1259 OID 6956341)
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
-- TOC entry 200 (class 1259 OID 6956331)
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
-- TOC entry 221 (class 1259 OID 6956530)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6956465)
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
-- TOC entry 174 (class 1259 OID 6956039)
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
-- TOC entry 173 (class 1259 OID 6956037)
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
-- TOC entry 210 (class 1259 OID 6956407)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6956077)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6956061)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6956421)
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
-- TOC entry 204 (class 1259 OID 6956362)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6956312)
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
-- TOC entry 236 (class 1259 OID 6956752)
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
-- TOC entry 235 (class 1259 OID 6956744)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6956739)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6956475)
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
-- TOC entry 183 (class 1259 OID 6956139)
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
-- TOC entry 199 (class 1259 OID 6956318)
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
-- TOC entry 220 (class 1259 OID 6956519)
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
-- TOC entry 232 (class 1259 OID 6956708)
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
-- TOC entry 188 (class 1259 OID 6956202)
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
-- TOC entry 175 (class 1259 OID 6956048)
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
-- TOC entry 225 (class 1259 OID 6956576)
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
-- TOC entry 193 (class 1259 OID 6956264)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6956389)
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
-- TOC entry 215 (class 1259 OID 6956458)
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
-- TOC entry 195 (class 1259 OID 6956296)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6956566)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6956448)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 6956042)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 6956094)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 6956616)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5579-4cc6-612b-53f4ee7f3fb6	000d0000-5579-4cc6-228a-7f807ff33dd5	\N	00090000-5579-4cc6-53ce-3995fb068a54	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4cc6-c88e-b67ea662c728	000d0000-5579-4cc6-8b78-c4eb1ef933c3	\N	00090000-5579-4cc6-1a4f-6a6db4bec18f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4cc6-bf3a-c68687f73b6f	000d0000-5579-4cc6-a62b-c29f55901149	\N	00090000-5579-4cc6-e74d-a54a4f01b93d	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4cc6-a878-3aeda928a0b4	000d0000-5579-4cc6-a020-1132a64d26cd	\N	00090000-5579-4cc6-e4f0-209de3bfeced	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4cc6-62e4-3d7bceff6fc9	000d0000-5579-4cc6-651a-25393cfaf4a7	\N	00090000-5579-4cc6-e632-22a27cadcd91	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-4cc6-7c22-80fa04990485	000d0000-5579-4cc6-eb59-8d0495667ddc	\N	00090000-5579-4cc6-1a4f-6a6db4bec18f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 6956599)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6956503)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5579-4cc6-64a0-e38f8882fb58	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5579-4cc6-6b04-9f19e78822f1	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5579-4cc6-a4a1-bb831d43db43	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 6956273)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5579-4cc6-c43d-89ad5f8c7a36	\N	\N	00200000-5579-4cc6-b838-49a1b4a89e8f	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5579-4cc6-d339-c053e49bdd34	\N	\N	00200000-5579-4cc6-7968-4279a4fb4dc4	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5579-4cc6-cd03-c4b18394b612	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5579-4cc6-5efc-9d94eaca70a3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5579-4cc6-6615-e9138b6e8e49	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 6956307)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6956216)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5579-4cc4-d58c-0c562ad444b6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5579-4cc4-db71-c60419e1a3b1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5579-4cc4-1aa3-d0f0f15cc848	AL	ALB	008	Albania 	Albanija	\N
00040000-5579-4cc4-b5bf-fea633074c8f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5579-4cc4-c2a9-1046f89c2640	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5579-4cc4-02ba-717993e2f52b	AD	AND	020	Andorra 	Andora	\N
00040000-5579-4cc4-fc54-1365d09ad66c	AO	AGO	024	Angola 	Angola	\N
00040000-5579-4cc4-8d84-a2c45859916c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5579-4cc4-c9d8-62e19289380f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5579-4cc4-8e77-13b7fab7b09c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-4cc4-ce63-9f911441fb60	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5579-4cc4-dbc2-9276cac4e150	AM	ARM	051	Armenia 	Armenija	\N
00040000-5579-4cc4-ffd6-55365347140a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5579-4cc4-6747-cb2da56a5d7b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5579-4cc4-7045-fda53c8bae40	AT	AUT	040	Austria 	Avstrija	\N
00040000-5579-4cc4-552e-2d792db72d73	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5579-4cc4-96f9-48a9e4f28d53	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5579-4cc4-8c37-406163336c37	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5579-4cc4-eebf-8325f3098662	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5579-4cc4-82b6-3a18169bf461	BB	BRB	052	Barbados 	Barbados	\N
00040000-5579-4cc4-79d7-f7a2254dff57	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5579-4cc4-e2cc-9009adeacca2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5579-4cc4-5f2a-5f9a2abc48fa	BZ	BLZ	084	Belize 	Belize	\N
00040000-5579-4cc4-c6d4-9295bcbfd647	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5579-4cc4-8a13-bd7ee43fe6a8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5579-4cc4-f421-2e5c87e21070	BT	BTN	064	Bhutan 	Butan	\N
00040000-5579-4cc4-e864-05990b707bf8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5579-4cc4-581a-521da7666852	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5579-4cc4-78f6-85ae7744c251	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5579-4cc4-9ba0-e2da82450963	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5579-4cc4-8089-571862e9a2e2	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5579-4cc4-2e0e-bc78466fae18	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5579-4cc4-293b-0b55d04b8438	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5579-4cc4-aac4-cd810d97958b	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5579-4cc4-0f74-e38c8cf5fcaa	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5579-4cc4-7a57-034af826dd72	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5579-4cc4-eca3-4a545ea18060	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5579-4cc4-dd3c-0dd1b300ca5c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5579-4cc4-f3b9-2167c246edb7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5579-4cc4-1689-824aceec3cd9	CA	CAN	124	Canada 	Kanada	\N
00040000-5579-4cc4-ea08-3be010da4e34	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5579-4cc4-e189-720dbc233461	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5579-4cc4-881e-62aad92a6c87	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5579-4cc4-cda0-427da1e48b0a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5579-4cc4-822f-e7c26ad02b77	CL	CHL	152	Chile 	Čile	\N
00040000-5579-4cc4-2b50-d31fa7e0d8a6	CN	CHN	156	China 	Kitajska	\N
00040000-5579-4cc4-c167-7c39a2902b38	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5579-4cc4-ced2-f873918499cc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5579-4cc4-4326-db644dd24d61	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5579-4cc4-3767-afade68b0a7d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5579-4cc4-ba80-bad6d180d9e5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5579-4cc4-d30f-d7da83310e3c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5579-4cc4-a956-f75c696eab91	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5579-4cc4-dd8c-b72e4beec544	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5579-4cc4-4c3b-1bb60aec16c8	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5579-4cc4-2528-a8eb76681f76	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5579-4cc4-b49e-515d041fbd19	CU	CUB	192	Cuba 	Kuba	\N
00040000-5579-4cc4-8e62-93eaa086a121	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5579-4cc4-32f9-8bc835349b03	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5579-4cc4-2115-820ad7e75bce	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5579-4cc4-0fbc-f2132dcd6bb5	DK	DNK	208	Denmark 	Danska	\N
00040000-5579-4cc4-0f53-03086c8c0f8c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5579-4cc4-d28f-7369bda1136f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-4cc4-1b7a-c642dbb98d80	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5579-4cc4-1ea4-7fc6f9bfa810	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5579-4cc4-ed5a-914b055afa9f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5579-4cc4-7456-8b12a1b97ca1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5579-4cc4-7e4d-560c14cfee59	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5579-4cc4-bcc1-32ce085d96bd	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5579-4cc4-571e-c2f533f58176	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5579-4cc4-9306-c56e9b4c36e6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5579-4cc4-c585-656b06a1f6e5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5579-4cc4-0afa-ea7ab4141b44	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5579-4cc4-29ca-e1ac580a40e7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5579-4cc4-97ac-4f2abe6ccebb	FI	FIN	246	Finland 	Finska	\N
00040000-5579-4cc4-eeea-249311c36eda	FR	FRA	250	France 	Francija	\N
00040000-5579-4cc4-484f-824c77dbbac5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5579-4cc4-1e2c-0519ec591a18	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5579-4cc4-b273-09619aef9f4e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5579-4cc4-4e8d-52110fde5a05	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5579-4cc4-e154-aa2f81cf8a5a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5579-4cc4-6bd3-2e0c62d6b939	GM	GMB	270	Gambia 	Gambija	\N
00040000-5579-4cc4-801a-2690feec5503	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5579-4cc4-cc83-095ac0a3cc8e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5579-4cc4-6260-c92f82133cda	GH	GHA	288	Ghana 	Gana	\N
00040000-5579-4cc4-50b5-97144be53237	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5579-4cc4-bda9-125ec815ed5c	GR	GRC	300	Greece 	Grčija	\N
00040000-5579-4cc4-f52b-4a3571ee96a1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5579-4cc4-3eff-39f56302ed4f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5579-4cc4-5c49-4569681d7342	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5579-4cc4-ee28-71f1ca9c4dca	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5579-4cc4-8e28-72e2281eba3e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5579-4cc4-e85b-ec14c8ba6976	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5579-4cc4-e4e2-52372fb6064e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5579-4cc4-a850-93af1fff0950	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5579-4cc4-b271-0e3c94ba212e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5579-4cc4-3b4b-fd0346d6bcdb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5579-4cc4-b894-2b670c3ae7c3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5579-4cc4-c906-2eac83194c51	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5579-4cc4-7707-078a756b4890	HN	HND	340	Honduras 	Honduras	\N
00040000-5579-4cc4-72e6-a2aa6d3d7770	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5579-4cc4-6501-8355bc74340d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5579-4cc4-1aec-0533dda8a1e7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5579-4cc4-3e2d-5a77ab8e79ca	IN	IND	356	India 	Indija	\N
00040000-5579-4cc4-0282-bfe37ebfeca6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5579-4cc4-c083-88afb0f677ea	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5579-4cc4-58ae-a3ef37873776	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5579-4cc4-1e68-6cb91072f1e5	IE	IRL	372	Ireland 	Irska	\N
00040000-5579-4cc4-0994-e77851d4f797	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5579-4cc4-3dde-d7f11497c3b3	IL	ISR	376	Israel 	Izrael	\N
00040000-5579-4cc4-1687-aa853e65378e	IT	ITA	380	Italy 	Italija	\N
00040000-5579-4cc4-b48b-e53baad94fc5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5579-4cc4-5bed-cbdb36e935bf	JP	JPN	392	Japan 	Japonska	\N
00040000-5579-4cc4-d88c-5a69b6ba3a51	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5579-4cc4-a819-bd7dad611571	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5579-4cc4-7360-7601ee010bf7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5579-4cc4-c30e-f5a14882f0aa	KE	KEN	404	Kenya 	Kenija	\N
00040000-5579-4cc4-f491-a3aa654b397a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5579-4cc4-98dd-490e6e0583d1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5579-4cc4-02ee-7921cbcbcfd0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5579-4cc4-f118-78388f33c2e2	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5579-4cc4-1798-dd82c2aa50f5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5579-4cc4-c7f5-c05e5fe40a79	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5579-4cc4-557f-5132b59ac4aa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5579-4cc4-2cd1-46c1d524e45a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5579-4cc4-3528-8574b1f681f6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5579-4cc4-3116-ae0037ef335d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5579-4cc4-d835-4d435f7b3f8e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5579-4cc4-c97f-2f5887bd6f28	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5579-4cc4-5e85-30cef6da4852	LT	LTU	440	Lithuania 	Litva	\N
00040000-5579-4cc4-278b-dd6a1d5ab19e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5579-4cc4-5711-e10ffdbb61b3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5579-4cc4-7c1a-8d436bf9f1e9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5579-4cc4-3474-10b20c413161	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5579-4cc4-9183-0da42a385c9b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5579-4cc4-6152-59f561208f0a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5579-4cc4-11a1-34a57071ee1e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5579-4cc4-4936-93b343e01078	ML	MLI	466	Mali 	Mali	\N
00040000-5579-4cc4-41b6-fa26eaff60ec	MT	MLT	470	Malta 	Malta	\N
00040000-5579-4cc4-da0c-f2e24209a97b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5579-4cc4-915b-c3cc7586cb6b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5579-4cc4-1474-333d1c4e16d4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5579-4cc4-2310-4c14208e20a6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5579-4cc4-8a55-f69b98daf0ca	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5579-4cc4-c441-190fa5eb7a22	MX	MEX	484	Mexico 	Mehika	\N
00040000-5579-4cc4-763a-be3a4bdb2e55	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5579-4cc4-7a8e-026c27a69c8f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5579-4cc4-f554-744a4b17bc48	MC	MCO	492	Monaco 	Monako	\N
00040000-5579-4cc4-b008-816760030218	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5579-4cc4-c73f-9035a4d2d93c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5579-4cc4-373f-e79ef1061b5c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5579-4cc4-c7e8-98d86dbf91d7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5579-4cc4-a31f-fea9d7a1e67f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5579-4cc4-3ae2-294f0a5af6a9	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5579-4cc4-1797-38bb38b2c535	NA	NAM	516	Namibia 	Namibija	\N
00040000-5579-4cc4-21fa-5bdbee37e2e3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5579-4cc4-8498-4556ee5c9993	NP	NPL	524	Nepal 	Nepal	\N
00040000-5579-4cc4-fadb-d5c57a17b592	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5579-4cc4-3ca1-981b9db6a25f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5579-4cc4-b3f4-a3fdb8d9bbab	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5579-4cc4-a465-1dce7d42a325	NE	NER	562	Niger 	Niger 	\N
00040000-5579-4cc4-884e-815145c19583	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5579-4cc4-da06-e921351eecae	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5579-4cc4-8b26-1ab99b6dee84	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5579-4cc4-3c63-193f2d9856dc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5579-4cc4-cc98-2ced12cd5095	NO	NOR	578	Norway 	Norveška	\N
00040000-5579-4cc4-8873-745e1d681087	OM	OMN	512	Oman 	Oman	\N
00040000-5579-4cc4-1ec7-ee33ccebc88d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5579-4cc4-b40a-8448dd48e6e6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5579-4cc4-d08d-b026056c7501	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5579-4cc4-f301-cde0d3d70273	PA	PAN	591	Panama 	Panama	\N
00040000-5579-4cc4-ddb5-b7ae9286b01f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5579-4cc4-5936-617f97a771a3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5579-4cc4-860b-66a2d0fc2fc9	PE	PER	604	Peru 	Peru	\N
00040000-5579-4cc4-bb68-1da70172b5fb	PH	PHL	608	Philippines 	Filipini	\N
00040000-5579-4cc4-d7e1-dada802edfcb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5579-4cc4-2d6e-c3514637fb66	PL	POL	616	Poland 	Poljska	\N
00040000-5579-4cc4-d490-b9a2bef1acd8	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5579-4cc4-f367-539ea8e82a1a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5579-4cc4-37d5-1b3fde611f59	QA	QAT	634	Qatar 	Katar	\N
00040000-5579-4cc4-efdb-a7806092a14b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5579-4cc4-badc-fa9aaff58fef	RO	ROU	642	Romania 	Romunija	\N
00040000-5579-4cc4-22d0-d7b7d05ee033	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5579-4cc4-bfec-fcbcc60e067c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5579-4cc4-aa16-b4f4a941931d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5579-4cc4-a994-d9fa637c316d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5579-4cc4-3011-429d558738c1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5579-4cc4-dc95-38057a85683d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5579-4cc4-5cf6-5b18b0aebd82	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5579-4cc4-7213-93006edb90d2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5579-4cc4-459e-18c711404f2e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5579-4cc4-0235-d79583161449	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5579-4cc4-7443-86c7302d4fed	SM	SMR	674	San Marino 	San Marino	\N
00040000-5579-4cc4-6827-236656cee218	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5579-4cc4-450a-1e5604dbbea6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5579-4cc4-d999-237a31a15bd4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5579-4cc4-d126-e6af51e66d4d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5579-4cc4-44ec-7fc3436f6a23	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5579-4cc4-568d-0262a05e80a2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5579-4cc4-1464-2f39fb0cf9a5	SG	SGP	702	Singapore 	Singapur	\N
00040000-5579-4cc4-672a-1037716f9c6b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5579-4cc4-8e2d-92de403901e7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5579-4cc4-0245-fc6149eb5733	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5579-4cc4-2796-d9e0e2ea3d5f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5579-4cc4-b23b-192d94704302	SO	SOM	706	Somalia 	Somalija	\N
00040000-5579-4cc4-94d8-286593967d13	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5579-4cc4-d25c-af24c24d63d5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5579-4cc4-0c99-21ac3b37585c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5579-4cc4-cbbf-f8a00e651d2b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5579-4cc4-58d3-619da493d0b9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5579-4cc4-7440-e3bba8fe081f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5579-4cc4-92c2-23385aafc00a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5579-4cc4-c27a-c25c9f5615a7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5579-4cc4-3a9e-f285f8602f6f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5579-4cc4-1344-bd9e7c0f6f8c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5579-4cc4-b77c-46ac0bbf6287	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5579-4cc4-94f6-02a902322bf0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5579-4cc4-ca1f-c997fa2b3b10	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5579-4cc4-ba41-738133838d45	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5579-4cc4-9842-59c6f0a29c07	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5579-4cc4-4307-82129e0a8fbf	TH	THA	764	Thailand 	Tajska	\N
00040000-5579-4cc4-73a1-87f4104fc609	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5579-4cc4-b30b-fd687908d124	TG	TGO	768	Togo 	Togo	\N
00040000-5579-4cc4-027f-e6cf464614c8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5579-4cc4-bd43-d8700cc0062b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5579-4cc4-1f8b-491738ed10ce	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5579-4cc4-81bb-5ae279bf4624	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5579-4cc4-0631-04a254ebe07b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5579-4cc4-7542-3ba015df61ea	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5579-4cc4-4b3d-81378f0650ac	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-4cc4-f53b-cda3e1fc0258	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5579-4cc4-ebec-8031c01cc5e1	UG	UGA	800	Uganda 	Uganda	\N
00040000-5579-4cc4-72a9-4c19b1383c0a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5579-4cc4-c8a3-f7bed689429c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5579-4cc4-cc70-7ba0d749c10e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5579-4cc4-6988-91b956a7e297	US	USA	840	United States 	Združene države Amerike	\N
00040000-5579-4cc4-f17a-15992372ad5e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5579-4cc4-c01a-620bed0a21cd	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5579-4cc4-7e7a-b1a158dbcbf2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5579-4cc5-9c55-838adf2fa434	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5579-4cc5-10c9-2ddfcac0a17d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5579-4cc5-3876-d91778063173	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5579-4cc5-7d29-5c17b31fd0d0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-4cc5-229f-61945c47132b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5579-4cc5-e586-7c83fb117db4	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5579-4cc5-3060-f6ac8d1a569a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5579-4cc5-33da-bf83f6b2ad2b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5579-4cc5-c730-df707a831112	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5579-4cc5-cace-c2f32f341235	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 6956630)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 6956433)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5579-4cc6-6736-b30979bcdd7e	000e0000-5579-4cc6-d0ca-247377e1c015	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5579-4cc4-f495-43a88c48679c
000d0000-5579-4cc6-228a-7f807ff33dd5	000e0000-5579-4cc6-d0ca-247377e1c015	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-4cc4-f495-43a88c48679c
000d0000-5579-4cc6-8b78-c4eb1ef933c3	000e0000-5579-4cc6-d0ca-247377e1c015	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5579-4cc4-30d5-df180cc6ab53
000d0000-5579-4cc6-a62b-c29f55901149	000e0000-5579-4cc6-d0ca-247377e1c015	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5579-4cc4-f564-4642241f6207
000d0000-5579-4cc6-a020-1132a64d26cd	000e0000-5579-4cc6-d0ca-247377e1c015	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5579-4cc4-f564-4642241f6207
000d0000-5579-4cc6-651a-25393cfaf4a7	000e0000-5579-4cc6-d0ca-247377e1c015	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5579-4cc4-f564-4642241f6207
000d0000-5579-4cc6-eb59-8d0495667ddc	000e0000-5579-4cc6-d0ca-247377e1c015	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-4cc4-f495-43a88c48679c
\.


--
-- TOC entry 2839 (class 0 OID 6956253)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6956301)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6956233)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5579-4cc6-2648-ddb30a2b5044	00080000-5579-4cc6-4601-5522aad15cf9	00090000-5579-4cc6-53ce-3995fb068a54	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6956350)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6956375)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6956190)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5579-4cc5-b60b-4ee7ea18efc3	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5579-4cc5-e3d4-74f6b5018824	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5579-4cc5-e724-42828ff1ffcf	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5579-4cc5-8018-20728fa51153	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5579-4cc5-b4b4-766e7aa225c8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5579-4cc5-9b45-330eb98c2742	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5579-4cc5-90a8-fd037383b6f6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5579-4cc5-4902-7be5b5f2a1a5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5579-4cc5-8a78-4e7716aea28e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5579-4cc5-07fb-2983551667e2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5579-4cc5-3e0e-28e803bbf37a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5579-4cc5-6745-3d8e8e94dbd0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5579-4cc5-1feb-e110fb91eb0d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-4cc5-9054-bdfd730a4b0c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-4cc5-aa57-28defe6122d4	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5579-4cc5-204a-9a43d609f617	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 6956103)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5579-4cc5-0367-654750f45f0c	00000000-5579-4cc5-b4b4-766e7aa225c8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5579-4cc5-9c53-71726efd9cf2	00000000-5579-4cc5-b4b4-766e7aa225c8	00010000-5579-4cc5-f81d-9fde843a8e53	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5579-4cc5-5604-0d751730e924	00000000-5579-4cc5-9b45-330eb98c2742	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 6956114)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5579-4cc6-4a89-b39451781569	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5579-4cc6-e4f0-209de3bfeced	00010000-5579-4cc6-9938-dafb205f9098	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5579-4cc6-e74d-a54a4f01b93d	00010000-5579-4cc6-d8cd-4fd19560ccd7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5579-4cc6-01e2-ab0577eabca0	00010000-5579-4cc6-4c48-eafd1e1700a7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5579-4cc6-a6d6-5a6a10531705	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5579-4cc6-895d-45489f428262	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5579-4cc6-947c-a7cddeca9cfe	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5579-4cc6-d4e6-b6b104acd74d	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5579-4cc6-53ce-3995fb068a54	00010000-5579-4cc6-aa3c-c5ce2fdfdd7f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5579-4cc6-1a4f-6a6db4bec18f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5579-4cc6-64c4-38b79eb1d7ea	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5579-4cc6-e632-22a27cadcd91	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5579-4cc6-58a8-4d031258aae7	00010000-5579-4cc6-5aaa-0f2e3a0afbab	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6956068)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5579-4cc5-53ab-fb85a3ea6f17	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5579-4cc5-1c29-66531845b2d1	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5579-4cc5-86e0-83883754b30d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5579-4cc5-8994-5c48a410b015	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5579-4cc5-42de-8132cd17f37e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5579-4cc5-906c-cdc91cd6a16c	Abonma-read	Abonma - branje	f
00030000-5579-4cc5-4607-3a3915bd31ff	Abonma-write	Abonma - spreminjanje	f
00030000-5579-4cc5-fd81-f11e96887262	Alternacija-read	Alternacija - branje	f
00030000-5579-4cc5-2752-9af40b831c8c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5579-4cc5-d530-8a4ee2d38762	Arhivalija-read	Arhivalija - branje	f
00030000-5579-4cc5-d9e2-a530b23f5502	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5579-4cc5-2319-21d0fa6caf07	Besedilo-read	Besedilo - branje	f
00030000-5579-4cc5-26ed-8eb7d06dbd41	Besedilo-write	Besedilo - spreminjanje	f
00030000-5579-4cc5-7c1f-aa8719eaafb1	DogodekIzven-read	DogodekIzven - branje	f
00030000-5579-4cc5-7999-6e8e29b4ca46	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5579-4cc5-21d5-5c5136254c57	Dogodek-read	Dogodek - branje	f
00030000-5579-4cc5-6edf-6f2d40405366	Dogodek-write	Dogodek - spreminjanje	f
00030000-5579-4cc5-d234-ca08a7d4ba83	Drzava-read	Drzava - branje	f
00030000-5579-4cc5-18cb-77090184aafe	Drzava-write	Drzava - spreminjanje	f
00030000-5579-4cc5-a806-cd6e32cd64c1	Funkcija-read	Funkcija - branje	f
00030000-5579-4cc5-b387-b5be86e09189	Funkcija-write	Funkcija - spreminjanje	f
00030000-5579-4cc5-abb2-6a89f1fced87	Gostovanje-read	Gostovanje - branje	f
00030000-5579-4cc5-778c-e61e49c41355	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5579-4cc5-48fc-78b4266bcdd2	Gostujoca-read	Gostujoca - branje	f
00030000-5579-4cc5-2d63-a5bc7151c59a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5579-4cc5-4013-08af38125340	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5579-4cc5-ab87-953abae102e4	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5579-4cc5-6847-5615a97cee3f	Kupec-read	Kupec - branje	f
00030000-5579-4cc5-7631-35c4a32363af	Kupec-write	Kupec - spreminjanje	f
00030000-5579-4cc5-3c5e-5536d338594e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5579-4cc5-668c-3d4842dca96e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5579-4cc5-736b-ec0d4070877e	Option-read	Option - branje	f
00030000-5579-4cc5-6111-0f6a660da591	Option-write	Option - spreminjanje	f
00030000-5579-4cc5-4d53-8f62a69e874b	OptionValue-read	OptionValue - branje	f
00030000-5579-4cc5-2b3e-90591900a67a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5579-4cc5-d325-bd3c44d7fcda	Oseba-read	Oseba - branje	f
00030000-5579-4cc5-7a18-bd76425d5a95	Oseba-write	Oseba - spreminjanje	f
00030000-5579-4cc5-8df1-1cf12bd3cc6f	Permission-read	Permission - branje	f
00030000-5579-4cc5-5911-1198bf9f8302	Permission-write	Permission - spreminjanje	f
00030000-5579-4cc5-efc1-8581d7bb5eb2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5579-4cc5-8578-bc15c296fe75	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5579-4cc5-6b35-8bf0aecf9919	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5579-4cc5-2597-2642af22343a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5579-4cc5-8fb4-4819bbc38a51	Pogodba-read	Pogodba - branje	f
00030000-5579-4cc5-f4ac-4322228bcd95	Pogodba-write	Pogodba - spreminjanje	f
00030000-5579-4cc5-2f87-da853b0c2746	Popa-read	Popa - branje	f
00030000-5579-4cc5-6188-3146cca6085b	Popa-write	Popa - spreminjanje	f
00030000-5579-4cc5-e67b-5211e39615a5	Posta-read	Posta - branje	f
00030000-5579-4cc5-1c14-fabcb5df46e3	Posta-write	Posta - spreminjanje	f
00030000-5579-4cc5-2da1-9ae78c2067b4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5579-4cc5-8c03-bc5e4fd2aa5d	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5579-4cc5-286d-a994f172299d	PostniNaslov-read	PostniNaslov - branje	f
00030000-5579-4cc5-b89d-fd13586ef98f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5579-4cc5-2afc-13b9d5f79899	Predstava-read	Predstava - branje	f
00030000-5579-4cc5-dff4-6a226266d16f	Predstava-write	Predstava - spreminjanje	f
00030000-5579-4cc5-a33f-c0291839152d	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5579-4cc5-362f-bd3ec05b787d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5579-4cc5-3dc9-89ceceeb6cd9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5579-4cc5-6267-d32be570c92f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5579-4cc5-1e25-1cd424556922	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5579-4cc5-8330-4c69010ca91f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5579-4cc5-fce9-69a46084fd00	ProgramDela-read	ProgramDela - branje	f
00030000-5579-4cc5-2a67-b2f48b39d6cc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5579-4cc5-c3cc-6b7a4e5431a5	ProgramFestival-read	ProgramFestival - branje	f
00030000-5579-4cc5-6dad-a9f8428a6613	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5579-4cc5-5256-ada8da74ddb0	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5579-4cc5-7a1f-9d1297857d66	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5579-4cc5-300c-dfb4ab03dc7f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5579-4cc5-9ff7-91fb72c82332	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5579-4cc5-b2f2-b1acb218b3a5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5579-4cc5-c0da-72e65faa75c1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5579-4cc5-2b9d-23add588f9b9	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5579-4cc5-8baf-4ce6402376de	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5579-4cc5-b906-12e4b9353ca0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5579-4cc5-2e07-bbd7ff0b2033	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5579-4cc5-e243-5762873357f0	Prostor-read	Prostor - branje	f
00030000-5579-4cc5-fff2-1b3c10689ab6	Prostor-write	Prostor - spreminjanje	f
00030000-5579-4cc5-cbaf-1b27cc1a39cf	Racun-read	Racun - branje	f
00030000-5579-4cc5-a06e-8adc69bc91c4	Racun-write	Racun - spreminjanje	f
00030000-5579-4cc5-9c7f-619e32522cdb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5579-4cc5-9d2c-fc27b56f15ec	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5579-4cc5-d348-20aa1dd4c63a	Readme-read	Readme - branje	f
00030000-5579-4cc5-8677-9597fc5d0bc7	Readme-write	Readme - spreminjanje	f
00030000-5579-4cc5-bf64-314b54eab8ef	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5579-4cc5-627f-54b906042825	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5579-4cc5-8fb7-28527bd27c06	Rekvizit-read	Rekvizit - branje	f
00030000-5579-4cc5-153f-87cc1f9dc103	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5579-4cc5-4a34-1bad5d3e98e9	Revizija-read	Revizija - branje	f
00030000-5579-4cc5-fc31-6222db180e3a	Revizija-write	Revizija - spreminjanje	f
00030000-5579-4cc5-b4bc-9f0c0595bd7a	Rezervacija-read	Rezervacija - branje	f
00030000-5579-4cc5-14c8-32d0e9f58f85	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5579-4cc5-d2bd-b2ecf25a0fa3	Role-read	Role - branje	f
00030000-5579-4cc5-3065-c334bb56d33c	Role-write	Role - spreminjanje	f
00030000-5579-4cc5-25a8-c5ba4b021109	SedezniRed-read	SedezniRed - branje	f
00030000-5579-4cc5-e614-b73bf3006294	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5579-4cc5-da0b-83948a5e3339	Sedez-read	Sedez - branje	f
00030000-5579-4cc5-0d8d-1322e72e15d1	Sedez-write	Sedez - spreminjanje	f
00030000-5579-4cc5-575e-60ce0b1644f6	Sezona-read	Sezona - branje	f
00030000-5579-4cc5-45db-dae6815cbc83	Sezona-write	Sezona - spreminjanje	f
00030000-5579-4cc5-734a-374bd3b30948	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5579-4cc5-f752-fa254dbb0042	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5579-4cc5-a5b0-75d058acf360	Stevilcenje-read	Stevilcenje - branje	f
00030000-5579-4cc5-81ff-355adc8485d1	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5579-4cc5-af39-39118dcd3675	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5579-4cc5-7dfa-c95eef16a88c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5579-4cc5-788f-88d42069516e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5579-4cc5-a682-fda75f2a5aa5	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5579-4cc5-cc39-6166942e15be	Telefonska-read	Telefonska - branje	f
00030000-5579-4cc5-6a7f-cc189fb29cdd	Telefonska-write	Telefonska - spreminjanje	f
00030000-5579-4cc5-0c66-d7f20c9c273f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5579-4cc5-ecbc-8beb3075c2db	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5579-4cc5-f84a-2e664303886f	TipFunkcije-read	TipFunkcije - branje	f
00030000-5579-4cc5-cdf3-763be766caf3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5579-4cc5-1ff3-1095ad114b01	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5579-4cc5-13c5-27272406af93	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5579-4cc5-3bd2-70a67edacce4	Trr-read	Trr - branje	f
00030000-5579-4cc5-5fe0-b067b607f0fc	Trr-write	Trr - spreminjanje	f
00030000-5579-4cc5-f571-06d52dfed6ee	Uprizoritev-read	Uprizoritev - branje	f
00030000-5579-4cc5-6471-bd8636de9598	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5579-4cc5-a44e-1050254b7226	User-read	User - branje	f
00030000-5579-4cc5-0e14-4b335d9780b2	User-write	User - spreminjanje	f
00030000-5579-4cc5-8796-99d7ee7faa9b	Vaja-read	Vaja - branje	f
00030000-5579-4cc5-c2f3-c1fe83949831	Vaja-write	Vaja - spreminjanje	f
00030000-5579-4cc5-d629-0fe6b1536639	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5579-4cc5-4d5c-d0eaf712aeb0	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5579-4cc5-fb9a-e650dbf35ff0	Zaposlitev-read	Zaposlitev - branje	f
00030000-5579-4cc5-ad3c-e1b17fff0cd4	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5579-4cc5-7348-449714552e41	Zasedenost-read	Zasedenost - branje	f
00030000-5579-4cc5-085f-ed3276a13b95	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5579-4cc5-ca05-e80e41950f6c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5579-4cc5-0935-af2248f89128	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5579-4cc5-323d-89c0bc4d8976	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5579-4cc5-f093-146caa005673	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 6956087)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5579-4cc5-a620-04b19525b021	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-906c-cdc91cd6a16c
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-4607-3a3915bd31ff
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-fd81-f11e96887262
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-2752-9af40b831c8c
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-d530-8a4ee2d38762
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-21d5-5c5136254c57
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-8994-5c48a410b015
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-6edf-6f2d40405366
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-18cb-77090184aafe
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-a806-cd6e32cd64c1
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-b387-b5be86e09189
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-abb2-6a89f1fced87
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-778c-e61e49c41355
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-48fc-78b4266bcdd2
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-2d63-a5bc7151c59a
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-4013-08af38125340
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-ab87-953abae102e4
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-736b-ec0d4070877e
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-4d53-8f62a69e874b
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-d325-bd3c44d7fcda
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-7a18-bd76425d5a95
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-2f87-da853b0c2746
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-6188-3146cca6085b
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-e67b-5211e39615a5
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-1c14-fabcb5df46e3
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-286d-a994f172299d
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-b89d-fd13586ef98f
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-2afc-13b9d5f79899
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-dff4-6a226266d16f
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-1e25-1cd424556922
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-8330-4c69010ca91f
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-e243-5762873357f0
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-fff2-1b3c10689ab6
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-bf64-314b54eab8ef
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-627f-54b906042825
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-8fb7-28527bd27c06
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-153f-87cc1f9dc103
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-575e-60ce0b1644f6
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-45db-dae6815cbc83
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-f84a-2e664303886f
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-f571-06d52dfed6ee
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-6471-bd8636de9598
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-8796-99d7ee7faa9b
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-c2f3-c1fe83949831
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-7348-449714552e41
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-085f-ed3276a13b95
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-ca05-e80e41950f6c
00020000-5579-4cc5-d3be-6629fbd064c6	00030000-5579-4cc5-323d-89c0bc4d8976
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-906c-cdc91cd6a16c
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-d530-8a4ee2d38762
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-21d5-5c5136254c57
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-abb2-6a89f1fced87
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-48fc-78b4266bcdd2
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-4013-08af38125340
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-ab87-953abae102e4
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-736b-ec0d4070877e
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-4d53-8f62a69e874b
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-d325-bd3c44d7fcda
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-7a18-bd76425d5a95
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-2f87-da853b0c2746
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-e67b-5211e39615a5
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-286d-a994f172299d
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-b89d-fd13586ef98f
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-2afc-13b9d5f79899
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-e243-5762873357f0
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-bf64-314b54eab8ef
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-8fb7-28527bd27c06
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-575e-60ce0b1644f6
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-cc39-6166942e15be
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-6a7f-cc189fb29cdd
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-3bd2-70a67edacce4
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-5fe0-b067b607f0fc
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-fb9a-e650dbf35ff0
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-ad3c-e1b17fff0cd4
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-ca05-e80e41950f6c
00020000-5579-4cc5-6158-fa7b0d872d46	00030000-5579-4cc5-323d-89c0bc4d8976
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-906c-cdc91cd6a16c
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-fd81-f11e96887262
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-d530-8a4ee2d38762
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-d9e2-a530b23f5502
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-2319-21d0fa6caf07
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-7c1f-aa8719eaafb1
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-21d5-5c5136254c57
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-a806-cd6e32cd64c1
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-abb2-6a89f1fced87
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-48fc-78b4266bcdd2
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-4013-08af38125340
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-736b-ec0d4070877e
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-4d53-8f62a69e874b
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-d325-bd3c44d7fcda
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-2f87-da853b0c2746
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-e67b-5211e39615a5
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-2afc-13b9d5f79899
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-1e25-1cd424556922
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-e243-5762873357f0
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-bf64-314b54eab8ef
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-8fb7-28527bd27c06
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-575e-60ce0b1644f6
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-f84a-2e664303886f
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-8796-99d7ee7faa9b
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-7348-449714552e41
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-ca05-e80e41950f6c
00020000-5579-4cc5-4fa1-ff25a6a1635d	00030000-5579-4cc5-323d-89c0bc4d8976
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-906c-cdc91cd6a16c
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-4607-3a3915bd31ff
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-2752-9af40b831c8c
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-d530-8a4ee2d38762
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-21d5-5c5136254c57
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-abb2-6a89f1fced87
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-48fc-78b4266bcdd2
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-736b-ec0d4070877e
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-4d53-8f62a69e874b
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-2f87-da853b0c2746
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-e67b-5211e39615a5
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-2afc-13b9d5f79899
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-e243-5762873357f0
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-bf64-314b54eab8ef
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-8fb7-28527bd27c06
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-575e-60ce0b1644f6
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-f84a-2e664303886f
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-ca05-e80e41950f6c
00020000-5579-4cc5-e119-8f50a37ad434	00030000-5579-4cc5-323d-89c0bc4d8976
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-906c-cdc91cd6a16c
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-d530-8a4ee2d38762
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-21d5-5c5136254c57
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-d234-ca08a7d4ba83
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-abb2-6a89f1fced87
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-48fc-78b4266bcdd2
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-736b-ec0d4070877e
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-4d53-8f62a69e874b
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-2f87-da853b0c2746
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-e67b-5211e39615a5
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-2afc-13b9d5f79899
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-e243-5762873357f0
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-bf64-314b54eab8ef
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-8fb7-28527bd27c06
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-575e-60ce0b1644f6
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-0c66-d7f20c9c273f
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-86e0-83883754b30d
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-f84a-2e664303886f
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-ca05-e80e41950f6c
00020000-5579-4cc5-4741-b0ccb2a94752	00030000-5579-4cc5-323d-89c0bc4d8976
\.


--
-- TOC entry 2854 (class 0 OID 6956382)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6956413)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 6956549)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6956147)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5579-4cc6-4601-5522aad15cf9	00040000-5579-4cc4-d58c-0c562ad444b6	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4cc6-23e6-8947642b4b0f	00040000-5579-4cc4-d58c-0c562ad444b6	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4cc6-bcbb-1d55fcc99b1b	00040000-5579-4cc4-d58c-0c562ad444b6	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-4cc6-cc9c-85ef8ce415a2	00040000-5579-4cc4-d58c-0c562ad444b6	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 6956182)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5579-4cc4-3b9f-4b101437bb03	8341	Adlešiči
00050000-5579-4cc4-0b6d-58fa93347205	5270	Ajdovščina
00050000-5579-4cc4-5f75-38bc80150110	6280	Ankaran/Ancarano
00050000-5579-4cc4-3e10-06ab37ecea5c	9253	Apače
00050000-5579-4cc4-7959-fc77cc892bc8	8253	Artiče
00050000-5579-4cc4-105e-46e4224867b1	4275	Begunje na Gorenjskem
00050000-5579-4cc4-25d6-9c06d312e3ee	1382	Begunje pri Cerknici
00050000-5579-4cc4-56f1-67fb23fe4c2e	9231	Beltinci
00050000-5579-4cc4-0a9e-721b8c49db37	2234	Benedikt
00050000-5579-4cc4-315b-14328c62755f	2345	Bistrica ob Dravi
00050000-5579-4cc4-96ac-409fcef14ef6	3256	Bistrica ob Sotli
00050000-5579-4cc4-e3ae-77f26acac023	8259	Bizeljsko
00050000-5579-4cc4-1043-6c2f0a41be04	1223	Blagovica
00050000-5579-4cc4-9781-f09d9e2a866d	8283	Blanca
00050000-5579-4cc4-7314-cedae4bb2e57	4260	Bled
00050000-5579-4cc4-1036-2e329771fff6	4273	Blejska Dobrava
00050000-5579-4cc4-fcd6-c50c9bf40c5a	9265	Bodonci
00050000-5579-4cc4-7584-221b88233ded	9222	Bogojina
00050000-5579-4cc4-aebd-ef924258c0d8	4263	Bohinjska Bela
00050000-5579-4cc4-5564-d3e51a958a23	4264	Bohinjska Bistrica
00050000-5579-4cc4-c2c2-b9a979c43939	4265	Bohinjsko jezero
00050000-5579-4cc4-c02f-246bf4ae035a	1353	Borovnica
00050000-5579-4cc4-f1ce-483a78f4ea0d	8294	Boštanj
00050000-5579-4cc4-7f15-04833ca95ddb	5230	Bovec
00050000-5579-4cc4-e21b-3c46ea3b2ffb	5295	Branik
00050000-5579-4cc4-1e06-bb5394db8a30	3314	Braslovče
00050000-5579-4cc4-9e1c-d6d2811f2a4b	5223	Breginj
00050000-5579-4cc4-b05d-2ff65fbda273	8280	Brestanica
00050000-5579-4cc4-e5f9-5f8a03725c8f	2354	Bresternica
00050000-5579-4cc4-de27-75df7964551a	4243	Brezje
00050000-5579-4cc4-ee1b-28e779ad783b	1351	Brezovica pri Ljubljani
00050000-5579-4cc4-1bc5-6aafb11c91a3	8250	Brežice
00050000-5579-4cc4-4b07-bcffd0054f92	4210	Brnik - Aerodrom
00050000-5579-4cc4-873c-95c5d25f4fd7	8321	Brusnice
00050000-5579-4cc4-762c-c6ad9a766cff	3255	Buče
00050000-5579-4cc4-a207-7515fdef551d	8276	Bučka 
00050000-5579-4cc4-751f-63be9a9c0188	9261	Cankova
00050000-5579-4cc4-f6b2-cd4bfb91328a	3000	Celje 
00050000-5579-4cc4-20e6-c3ee78d2af53	3001	Celje - poštni predali
00050000-5579-4cc4-fd09-813c29b5ff4a	4207	Cerklje na Gorenjskem
00050000-5579-4cc4-5b3e-0ac40e53821e	8263	Cerklje ob Krki
00050000-5579-4cc4-ec25-d244f96aa5c8	1380	Cerknica
00050000-5579-4cc4-f28d-fe00a7627721	5282	Cerkno
00050000-5579-4cc4-1b59-d967360eb335	2236	Cerkvenjak
00050000-5579-4cc4-470a-ab471717f818	2215	Ceršak
00050000-5579-4cc4-2d41-06aa73156d22	2326	Cirkovce
00050000-5579-4cc4-8e47-9df2b6563d54	2282	Cirkulane
00050000-5579-4cc4-9798-6ed9726a2cdd	5273	Col
00050000-5579-4cc4-d419-55f122e19da8	8251	Čatež ob Savi
00050000-5579-4cc4-d86f-65f1d08a02da	1413	Čemšenik
00050000-5579-4cc4-474b-bb25eb1e8bb3	5253	Čepovan
00050000-5579-4cc4-ff74-0cc97e9073b3	9232	Črenšovci
00050000-5579-4cc4-23b5-069cf18b191d	2393	Črna na Koroškem
00050000-5579-4cc4-801a-5dfba352fd44	6275	Črni Kal
00050000-5579-4cc4-95eb-f66a752bcbf2	5274	Črni Vrh nad Idrijo
00050000-5579-4cc4-3af5-13005850ad0d	5262	Črniče
00050000-5579-4cc4-963d-a32b0ea6c692	8340	Črnomelj
00050000-5579-4cc4-1708-190b6276a6b1	6271	Dekani
00050000-5579-4cc4-8a28-154e238fa031	5210	Deskle
00050000-5579-4cc4-2768-3d07856223f4	2253	Destrnik
00050000-5579-4cc4-af1e-f0af00a547c5	6215	Divača
00050000-5579-4cc4-0a38-eeafe92bb68d	1233	Dob
00050000-5579-4cc4-1bb6-d59c19907ad3	3224	Dobje pri Planini
00050000-5579-4cc4-63b4-db9e3a27016a	8257	Dobova
00050000-5579-4cc4-26a9-ecbe9c019828	1423	Dobovec
00050000-5579-4cc4-fc98-5341ef33c1ff	5263	Dobravlje
00050000-5579-4cc4-c433-2794854337a7	3204	Dobrna
00050000-5579-4cc4-83b9-11f5ce3d60a8	8211	Dobrnič
00050000-5579-4cc4-0332-913febcd5022	1356	Dobrova
00050000-5579-4cc4-ff42-90ef051e02e7	9223	Dobrovnik/Dobronak 
00050000-5579-4cc4-3a43-6aaaac5462d6	5212	Dobrovo v Brdih
00050000-5579-4cc4-d07f-234c5feeb3d1	1431	Dol pri Hrastniku
00050000-5579-4cc4-2c2e-5ec9820a8acf	1262	Dol pri Ljubljani
00050000-5579-4cc4-c990-b364a4155f93	1273	Dole pri Litiji
00050000-5579-4cc4-6d08-6522efafea20	1331	Dolenja vas
00050000-5579-4cc4-ac95-48778306a43a	8350	Dolenjske Toplice
00050000-5579-4cc4-8b59-75887a3e0838	1230	Domžale
00050000-5579-4cc4-8dca-9e20b8d4db82	2252	Dornava
00050000-5579-4cc4-2df3-a0a216f66b25	5294	Dornberk
00050000-5579-4cc4-9d6b-b89c0752d5cd	1319	Draga
00050000-5579-4cc4-41f1-46d1d73bb690	8343	Dragatuš
00050000-5579-4cc4-b155-523cee2c760a	3222	Dramlje
00050000-5579-4cc4-8e65-507aec04f186	2370	Dravograd
00050000-5579-4cc4-0454-80809d0f67a7	4203	Duplje
00050000-5579-4cc4-88ba-bf3350bddd06	6221	Dutovlje
00050000-5579-4cc4-a77b-ccd50572c7c9	8361	Dvor
00050000-5579-4cc4-ea3d-a0dbd33a21f8	2343	Fala
00050000-5579-4cc4-83a7-c9f28f79a531	9208	Fokovci
00050000-5579-4cc4-7f6f-2db722192567	2313	Fram
00050000-5579-4cc4-177b-5af63443580e	3213	Frankolovo
00050000-5579-4cc4-e593-0219899e22df	1274	Gabrovka
00050000-5579-4cc4-4ee0-1023b57e0d1e	8254	Globoko
00050000-5579-4cc4-8029-1e8df3bd85bb	5275	Godovič
00050000-5579-4cc4-1f28-07fcc2945dd4	4204	Golnik
00050000-5579-4cc4-4f52-1caed1a530fc	3303	Gomilsko
00050000-5579-4cc4-9c15-953be24e58ee	4224	Gorenja vas
00050000-5579-4cc4-8b67-f5f055aba3a2	3263	Gorica pri Slivnici
00050000-5579-4cc4-2551-c6302c62b3c4	2272	Gorišnica
00050000-5579-4cc4-f342-bf0cfeac7c39	9250	Gornja Radgona
00050000-5579-4cc4-c739-b1ef775fdfa3	3342	Gornji Grad
00050000-5579-4cc4-f34b-fcda6a655dd6	4282	Gozd Martuljek
00050000-5579-4cc4-5c1b-70f8d80a5763	6272	Gračišče
00050000-5579-4cc4-8078-eaefea689e54	9264	Grad
00050000-5579-4cc4-cd74-44c4572d3b89	8332	Gradac
00050000-5579-4cc4-84bb-73e9b7d266bb	1384	Grahovo
00050000-5579-4cc4-4a98-0c9a68de165a	5242	Grahovo ob Bači
00050000-5579-4cc4-4b47-1e985c6f0457	5251	Grgar
00050000-5579-4cc4-a94d-3d8cbd44b6cf	3302	Griže
00050000-5579-4cc4-413a-b297d6966d05	3231	Grobelno
00050000-5579-4cc4-557e-26e53fc643a7	1290	Grosuplje
00050000-5579-4cc4-52b3-2320db4ada95	2288	Hajdina
00050000-5579-4cc4-2d21-11eef639c9c9	8362	Hinje
00050000-5579-4cc4-d556-2ac28edd877a	2311	Hoče
00050000-5579-4cc4-12b0-34e100dc6b1e	9205	Hodoš/Hodos
00050000-5579-4cc4-3f05-b174bd180ea5	1354	Horjul
00050000-5579-4cc4-fa92-4b7db16dbc95	1372	Hotedršica
00050000-5579-4cc4-5fa5-557fe8241db2	1430	Hrastnik
00050000-5579-4cc4-5338-0fe1360b7344	6225	Hruševje
00050000-5579-4cc4-aa7e-f2f719756076	4276	Hrušica
00050000-5579-4cc4-48e2-b12bbf010ab0	5280	Idrija
00050000-5579-4cc4-d141-e740dde2c160	1292	Ig
00050000-5579-4cc4-4830-25d3fd3f6a41	6250	Ilirska Bistrica
00050000-5579-4cc4-ed1d-46deb0ff6673	6251	Ilirska Bistrica-Trnovo
00050000-5579-4cc4-7d37-eabd9a07c1f0	1295	Ivančna Gorica
00050000-5579-4cc4-396e-5808830f9735	2259	Ivanjkovci
00050000-5579-4cc4-3141-2ada40edd7b6	1411	Izlake
00050000-5579-4cc4-3b36-3d29d7f1bd46	6310	Izola/Isola
00050000-5579-4cc4-7935-0566c56ae308	2222	Jakobski Dol
00050000-5579-4cc4-8fd7-90308cb18c12	2221	Jarenina
00050000-5579-4cc4-6a58-f9f4e797f5b2	6254	Jelšane
00050000-5579-4cc4-aa44-ec815c407af7	4270	Jesenice
00050000-5579-4cc4-f983-b57e275246b4	8261	Jesenice na Dolenjskem
00050000-5579-4cc4-0b6d-44c1b163ab03	3273	Jurklošter
00050000-5579-4cc4-147b-163ba0af3493	2223	Jurovski Dol
00050000-5579-4cc4-0911-5fb389b88a0e	2256	Juršinci
00050000-5579-4cc4-16cb-d2a9e2fccb75	5214	Kal nad Kanalom
00050000-5579-4cc4-cafb-1b9f63944ea7	3233	Kalobje
00050000-5579-4cc4-d5fe-f400662ab6f7	4246	Kamna Gorica
00050000-5579-4cc4-b21b-144e17465c40	2351	Kamnica
00050000-5579-4cc4-e9b2-85e652f35ed5	1241	Kamnik
00050000-5579-4cc4-ac8e-c82daae0cf7b	5213	Kanal
00050000-5579-4cc4-75ef-a7b73c2a2e14	8258	Kapele
00050000-5579-4cc4-374a-5858ff55ca22	2362	Kapla
00050000-5579-4cc4-3612-58c89bff6793	2325	Kidričevo
00050000-5579-4cc4-168c-e249ef28e4b5	1412	Kisovec
00050000-5579-4cc4-72e2-a1504651df26	6253	Knežak
00050000-5579-4cc4-eacd-f7a71a55f25e	5222	Kobarid
00050000-5579-4cc4-3d5a-ed51da42a3a2	9227	Kobilje
00050000-5579-4cc4-0952-41a55c4f2988	1330	Kočevje
00050000-5579-4cc4-5e49-7b980d2e2ecb	1338	Kočevska Reka
00050000-5579-4cc4-d5e7-85a7d209338b	2276	Kog
00050000-5579-4cc4-dd8e-befb923c6d20	5211	Kojsko
00050000-5579-4cc4-d0d4-718a389e49af	6223	Komen
00050000-5579-4cc4-e0a3-95fee7e02c6a	1218	Komenda
00050000-5579-4cc4-4b27-b8c64450ef8d	6000	Koper/Capodistria 
00050000-5579-4cc4-8e30-5393d505e391	6001	Koper/Capodistria - poštni predali
00050000-5579-4cc4-b6fc-6784699c30fe	8282	Koprivnica
00050000-5579-4cc4-0497-3cd75022e4ba	5296	Kostanjevica na Krasu
00050000-5579-4cc4-72db-9a56caf7a1df	8311	Kostanjevica na Krki
00050000-5579-4cc4-f14c-6c7fce5059d3	1336	Kostel
00050000-5579-4cc4-aeb8-a882aa1bf64b	6256	Košana
00050000-5579-4cc4-06ee-b15ad011a333	2394	Kotlje
00050000-5579-4cc4-8077-ba2e36862d2a	6240	Kozina
00050000-5579-4cc4-9837-a59306c814f7	3260	Kozje
00050000-5579-4cc4-5772-b518eb30b397	4000	Kranj 
00050000-5579-4cc4-685f-1007ccab8338	4001	Kranj - poštni predali
00050000-5579-4cc4-a98b-75db74d797b4	4280	Kranjska Gora
00050000-5579-4cc4-30e7-eafb7738c9b5	1281	Kresnice
00050000-5579-4cc4-6752-c354fca54c7f	4294	Križe
00050000-5579-4cc4-be23-0d1646832a50	9206	Križevci
00050000-5579-4cc4-93dd-c40b518bf45c	9242	Križevci pri Ljutomeru
00050000-5579-4cc4-1d65-78aa3804b2a0	1301	Krka
00050000-5579-4cc4-d7bf-38e2925fc625	8296	Krmelj
00050000-5579-4cc4-e1b1-41d6a3e0a03a	4245	Kropa
00050000-5579-4cc4-db99-cbe6bc6cd420	8262	Krška vas
00050000-5579-4cc4-fde6-cc59326dbb5c	8270	Krško
00050000-5579-4cc4-c521-54c36cd9d130	9263	Kuzma
00050000-5579-4cc4-ea2c-3a52f417ae5b	2318	Laporje
00050000-5579-4cc4-8c88-db45b430829a	3270	Laško
00050000-5579-4cc4-7810-a2d66199fd3f	1219	Laze v Tuhinju
00050000-5579-4cc4-9e4a-65e54ae3310f	2230	Lenart v Slovenskih goricah
00050000-5579-4cc4-3207-e4c34261245b	9220	Lendava/Lendva
00050000-5579-4cc4-0300-914b6ed90b2d	4248	Lesce
00050000-5579-4cc4-eba7-a41b55e4033a	3261	Lesično
00050000-5579-4cc4-7af4-0c69f284768d	8273	Leskovec pri Krškem
00050000-5579-4cc4-bb74-ac57f9fe33ad	2372	Libeliče
00050000-5579-4cc4-1709-d573d1249568	2341	Limbuš
00050000-5579-4cc4-53ff-034ccfa74a68	1270	Litija
00050000-5579-4cc4-f234-f6226848876d	3202	Ljubečna
00050000-5579-4cc4-d825-ae5187112791	1000	Ljubljana 
00050000-5579-4cc4-de62-50b47cbc60e8	1001	Ljubljana - poštni predali
00050000-5579-4cc4-9622-9361a68af1fa	1231	Ljubljana - Črnuče
00050000-5579-4cc4-5a25-104f549ae267	1261	Ljubljana - Dobrunje
00050000-5579-4cc4-332f-d2f2e76fcb4f	1260	Ljubljana - Polje
00050000-5579-4cc4-b837-0518eeaa10ee	1210	Ljubljana - Šentvid
00050000-5579-4cc4-1e84-c737569a656e	1211	Ljubljana - Šmartno
00050000-5579-4cc4-2c3d-6d6e5036d4e6	3333	Ljubno ob Savinji
00050000-5579-4cc4-1ac7-6df8490792c0	9240	Ljutomer
00050000-5579-4cc4-ad87-a3c1e0a4c6aa	3215	Loče
00050000-5579-4cc4-e297-4b8dad3a21ff	5231	Log pod Mangartom
00050000-5579-4cc4-a248-dac2b5112f15	1358	Log pri Brezovici
00050000-5579-4cc4-5285-530b68433675	1370	Logatec
00050000-5579-4cc4-e855-2668765daca7	1371	Logatec
00050000-5579-4cc4-5581-8768dc988e13	1434	Loka pri Zidanem Mostu
00050000-5579-4cc4-8466-7ad364e69bad	3223	Loka pri Žusmu
00050000-5579-4cc4-1b29-8f8b044511f2	6219	Lokev
00050000-5579-4cc4-d4cb-4336d1d00a74	1318	Loški Potok
00050000-5579-4cc4-f790-6856582f12b7	2324	Lovrenc na Dravskem polju
00050000-5579-4cc4-d004-285f026bdbc0	2344	Lovrenc na Pohorju
00050000-5579-4cc4-1991-81a697e04f55	3334	Luče
00050000-5579-4cc4-79e4-820648e30677	1225	Lukovica
00050000-5579-4cc4-6a37-6fea38aecc9d	9202	Mačkovci
00050000-5579-4cc4-9b4a-9211b26daa31	2322	Majšperk
00050000-5579-4cc4-9f6c-dc76dfc563b8	2321	Makole
00050000-5579-4cc4-7c57-416b6bd6e703	9243	Mala Nedelja
00050000-5579-4cc4-d8bd-39a28a9abc2c	2229	Malečnik
00050000-5579-4cc4-3a02-c79b3e62e922	6273	Marezige
00050000-5579-4cc4-f973-4524be15ed71	2000	Maribor 
00050000-5579-4cc4-4f67-93e5eb910b72	2001	Maribor - poštni predali
00050000-5579-4cc4-cbea-6a1d64509b40	2206	Marjeta na Dravskem polju
00050000-5579-4cc4-008f-e712ba58a29f	2281	Markovci
00050000-5579-4cc4-a46d-ac8170fcbe7e	9221	Martjanci
00050000-5579-4cc4-7d9f-49650643c3f9	6242	Materija
00050000-5579-4cc4-bac8-c0fc11100958	4211	Mavčiče
00050000-5579-4cc4-2bb8-e91fee4e5f68	1215	Medvode
00050000-5579-4cc4-37c8-7d3f2508f8a7	1234	Mengeš
00050000-5579-4cc4-1429-b39c804f89fa	8330	Metlika
00050000-5579-4cc4-5079-66ceb2a59b08	2392	Mežica
00050000-5579-4cc4-b5d7-a1df9310c5e3	2204	Miklavž na Dravskem polju
00050000-5579-4cc4-fe93-647466e4d7c9	2275	Miklavž pri Ormožu
00050000-5579-4cc4-4155-277c1692f2f6	5291	Miren
00050000-5579-4cc4-474e-bcdb21453a7f	8233	Mirna
00050000-5579-4cc4-1963-c45cc268bdf1	8216	Mirna Peč
00050000-5579-4cc4-771d-ef1f01e64bf0	2382	Mislinja
00050000-5579-4cc4-2f7e-8f343d84e675	4281	Mojstrana
00050000-5579-4cc4-b37c-f9601c297f0c	8230	Mokronog
00050000-5579-4cc4-c920-d4b645512e5f	1251	Moravče
00050000-5579-4cc4-c9a8-44dc40b75306	9226	Moravske Toplice
00050000-5579-4cc4-0776-acba420cf940	5216	Most na Soči
00050000-5579-4cc4-8c39-ec8209cc283c	1221	Motnik
00050000-5579-4cc4-5f29-bddea9c98ba9	3330	Mozirje
00050000-5579-4cc4-e7cd-5ad8a1d63f17	9000	Murska Sobota 
00050000-5579-4cc4-2f42-244700346896	9001	Murska Sobota - poštni predali
00050000-5579-4cc4-2198-d3575f56b67d	2366	Muta
00050000-5579-4cc4-2e5c-61cd5050868c	4202	Naklo
00050000-5579-4cc4-3da8-13f06e7d3769	3331	Nazarje
00050000-5579-4cc4-9b09-39c4935b9506	1357	Notranje Gorice
00050000-5579-4cc4-9a23-ad649b9012d3	3203	Nova Cerkev
00050000-5579-4cc4-fe49-7f6446e2c93e	5000	Nova Gorica 
00050000-5579-4cc4-56fa-3acfad2ed6de	5001	Nova Gorica - poštni predali
00050000-5579-4cc4-0ea9-07c0b2a403e8	1385	Nova vas
00050000-5579-4cc4-8a9f-08a5df59310a	8000	Novo mesto
00050000-5579-4cc4-a92e-8926acf81a88	8001	Novo mesto - poštni predali
00050000-5579-4cc4-cbb0-d25e8a1a4d18	6243	Obrov
00050000-5579-4cc4-99e2-96e5510c82d6	9233	Odranci
00050000-5579-4cc4-1fc5-dabc6f0e0529	2317	Oplotnica
00050000-5579-4cc4-0340-136d8315e2fa	2312	Orehova vas
00050000-5579-4cc4-740f-e512e78e960e	2270	Ormož
00050000-5579-4cc4-01b8-ea3c993cb229	1316	Ortnek
00050000-5579-4cc4-331e-d4dd3f1049df	1337	Osilnica
00050000-5579-4cc4-c0c5-e41af50a7f06	8222	Otočec
00050000-5579-4cc4-6426-57ab754b8cd9	2361	Ožbalt
00050000-5579-4cc4-e9cc-02902ba2b8cb	2231	Pernica
00050000-5579-4cc4-8db5-5df17da8f846	2211	Pesnica pri Mariboru
00050000-5579-4cc4-ac37-f0ca213c116e	9203	Petrovci
00050000-5579-4cc4-15fa-bdf99745c7d1	3301	Petrovče
00050000-5579-4cc4-7cf6-fdac26b793a1	6330	Piran/Pirano
00050000-5579-4cc4-d32d-8e7d4d4ec82b	8255	Pišece
00050000-5579-4cc4-56eb-849700d73b77	6257	Pivka
00050000-5579-4cc4-5867-35316b089bc8	6232	Planina
00050000-5579-4cc4-79fc-c1fa9ca07a51	3225	Planina pri Sevnici
00050000-5579-4cc4-2f61-82f8ff3d7ab7	6276	Pobegi
00050000-5579-4cc4-422f-bfc305b3469f	8312	Podbočje
00050000-5579-4cc4-3cfb-db8e74913523	5243	Podbrdo
00050000-5579-4cc4-367f-39e80e901338	3254	Podčetrtek
00050000-5579-4cc4-41d1-45854a142240	2273	Podgorci
00050000-5579-4cc4-fc97-fc24d1bc2b9b	6216	Podgorje
00050000-5579-4cc4-ba8d-427a9cd14061	2381	Podgorje pri Slovenj Gradcu
00050000-5579-4cc4-1fda-ca3b8577c554	6244	Podgrad
00050000-5579-4cc4-9262-00c03f1e02e9	1414	Podkum
00050000-5579-4cc4-007f-407e6dd4c594	2286	Podlehnik
00050000-5579-4cc4-8062-ae8fcf449c68	5272	Podnanos
00050000-5579-4cc4-3a80-68da3e9538fb	4244	Podnart
00050000-5579-4cc4-da33-24cb970133ce	3241	Podplat
00050000-5579-4cc4-0602-eda1921743dc	3257	Podsreda
00050000-5579-4cc4-7858-93f62ea282db	2363	Podvelka
00050000-5579-4cc4-7995-0ce7b3f7613a	2208	Pohorje
00050000-5579-4cc4-9f04-c885f5794c35	2257	Polenšak
00050000-5579-4cc4-7004-eb62a5c1a042	1355	Polhov Gradec
00050000-5579-4cc4-a219-c1773dfd11b1	4223	Poljane nad Škofjo Loko
00050000-5579-4cc4-0ca5-630c78564e8a	2319	Poljčane
00050000-5579-4cc4-96e1-991de2bb35cb	1272	Polšnik
00050000-5579-4cc4-b46e-1ff567455254	3313	Polzela
00050000-5579-4cc4-f060-098527aecd78	3232	Ponikva
00050000-5579-4cc4-9832-120ed494323d	6320	Portorož/Portorose
00050000-5579-4cc4-a52a-d3d01cebebfb	6230	Postojna
00050000-5579-4cc4-f939-d8af38a0a240	2331	Pragersko
00050000-5579-4cc4-70b1-8659814ae084	3312	Prebold
00050000-5579-4cc4-3242-8de6ea9d0403	4205	Preddvor
00050000-5579-4cc4-fdfc-365805e2b66c	6255	Prem
00050000-5579-4cc4-2980-fd6715b4ac1c	1352	Preserje
00050000-5579-4cc4-f312-49edfaafc81d	6258	Prestranek
00050000-5579-4cc4-3320-e4eb183de78f	2391	Prevalje
00050000-5579-4cc4-0c53-bdc49da82cb2	3262	Prevorje
00050000-5579-4cc4-dd7d-8643a59d6dc3	1276	Primskovo 
00050000-5579-4cc4-78aa-2ef682ec4ae4	3253	Pristava pri Mestinju
00050000-5579-4cc4-07fa-4b3895112288	9207	Prosenjakovci/Partosfalva
00050000-5579-4cc4-691b-18cf1da2053e	5297	Prvačina
00050000-5579-4cc4-8332-cb1c22cfb8b1	2250	Ptuj
00050000-5579-4cc4-adab-f7d2a8fcb362	2323	Ptujska Gora
00050000-5579-4cc4-1e61-a36494e14aad	9201	Puconci
00050000-5579-4cc4-be8e-976004e37569	2327	Rače
00050000-5579-4cc4-db52-892976be1be4	1433	Radeče
00050000-5579-4cc4-dff9-f6ed5dfc6dbb	9252	Radenci
00050000-5579-4cc4-e8a0-ca53ec6109dc	2360	Radlje ob Dravi
00050000-5579-4cc4-1dfb-a0cf08c5a255	1235	Radomlje
00050000-5579-4cc4-e901-1148f6a3b991	4240	Radovljica
00050000-5579-4cc4-598e-b35157746c9d	8274	Raka
00050000-5579-4cc4-9c13-395e91785427	1381	Rakek
00050000-5579-4cc4-d294-4c8565cf2f12	4283	Rateče - Planica
00050000-5579-4cc4-1075-09fa930c75c5	2390	Ravne na Koroškem
00050000-5579-4cc4-41f4-b1c19db50269	9246	Razkrižje
00050000-5579-4cc4-920e-fe6dc3126faf	3332	Rečica ob Savinji
00050000-5579-4cc4-f29f-36a83277913e	5292	Renče
00050000-5579-4cc4-55b4-d24623a4ae14	1310	Ribnica
00050000-5579-4cc4-82fa-6af5d107d133	2364	Ribnica na Pohorju
00050000-5579-4cc4-f318-f27055b25114	3272	Rimske Toplice
00050000-5579-4cc4-34b7-481721dc9d95	1314	Rob
00050000-5579-4cc4-4069-a930d96a1b33	5215	Ročinj
00050000-5579-4cc4-5204-82c16e32b44f	3250	Rogaška Slatina
00050000-5579-4cc4-ae24-2aadd9be5d97	9262	Rogašovci
00050000-5579-4cc4-c38d-dd1878ce901c	3252	Rogatec
00050000-5579-4cc4-6779-527d2828a7bf	1373	Rovte
00050000-5579-4cc4-e666-79609faa225a	2342	Ruše
00050000-5579-4cc4-9c69-d9dc1ecef6b6	1282	Sava
00050000-5579-4cc4-e027-aa1e0693391c	6333	Sečovlje/Sicciole
00050000-5579-4cc4-af6d-1ff5f98ee167	4227	Selca
00050000-5579-4cc4-d432-6e538fbeb4aa	2352	Selnica ob Dravi
00050000-5579-4cc4-743e-27a64e871350	8333	Semič
00050000-5579-4cc4-abdf-34ad8d23bb62	8281	Senovo
00050000-5579-4cc4-1a5f-a249adc19513	6224	Senožeče
00050000-5579-4cc4-1d69-0cce4a9e62a5	8290	Sevnica
00050000-5579-4cc4-ad5e-bfc8bbf770e0	6210	Sežana
00050000-5579-4cc4-66b9-1328ab66cb78	2214	Sladki Vrh
00050000-5579-4cc4-bc88-6a868d1c2606	5283	Slap ob Idrijci
00050000-5579-4cc4-f8d5-e3a4dbf98aac	2380	Slovenj Gradec
00050000-5579-4cc4-dc17-5a851956849c	2310	Slovenska Bistrica
00050000-5579-4cc4-d7df-808a41dfb968	3210	Slovenske Konjice
00050000-5579-4cc4-805e-465e43c44b03	1216	Smlednik
00050000-5579-4cc4-aff7-8a90854aeea8	5232	Soča
00050000-5579-4cc4-f563-d8e7dc1f6316	1317	Sodražica
00050000-5579-4cc4-a4ae-d37d4f065870	3335	Solčava
00050000-5579-4cc4-4ad4-2e873b03f034	5250	Solkan
00050000-5579-4cc4-00ac-915dfb73beef	4229	Sorica
00050000-5579-4cc4-1e57-146ba08e3977	4225	Sovodenj
00050000-5579-4cc4-9f7e-cf4fb6ff088e	5281	Spodnja Idrija
00050000-5579-4cc4-0a8a-f531be176e48	2241	Spodnji Duplek
00050000-5579-4cc4-81f2-c48e0cb32d76	9245	Spodnji Ivanjci
00050000-5579-4cc4-2b36-03b6b5d734ea	2277	Središče ob Dravi
00050000-5579-4cc4-c413-d2d0d7730159	4267	Srednja vas v Bohinju
00050000-5579-4cc4-0f3f-0c7128e5b30c	8256	Sromlje 
00050000-5579-4cc4-b307-5417f8cf2ff0	5224	Srpenica
00050000-5579-4cc4-e90e-8d14a3c697bc	1242	Stahovica
00050000-5579-4cc4-dddb-dd11142ada9f	1332	Stara Cerkev
00050000-5579-4cc4-f5b9-e6ea02820827	8342	Stari trg ob Kolpi
00050000-5579-4cc4-133a-8d2cb6d98723	1386	Stari trg pri Ložu
00050000-5579-4cc4-3719-482f2b2440da	2205	Starše
00050000-5579-4cc4-060c-3da33a826d46	2289	Stoperce
00050000-5579-4cc4-6d3a-9ecbdac2936a	8322	Stopiče
00050000-5579-4cc4-010e-a4d2a7adc5a9	3206	Stranice
00050000-5579-4cc4-7c1e-83c202562eb7	8351	Straža
00050000-5579-4cc4-b5a8-8f0661628e47	1313	Struge
00050000-5579-4cc4-197c-7932a2153cbc	8293	Studenec
00050000-5579-4cc4-2fa8-e8486b5d3da4	8331	Suhor
00050000-5579-4cc4-d266-8d30492a45c5	2233	Sv. Ana v Slovenskih goricah
00050000-5579-4cc4-ffaa-199446031b3a	2235	Sv. Trojica v Slovenskih goricah
00050000-5579-4cc4-4cac-54bbdac83eff	2353	Sveti Duh na Ostrem Vrhu
00050000-5579-4cc4-0ebe-9de28df9c593	9244	Sveti Jurij ob Ščavnici
00050000-5579-4cc4-a94e-e2fb0a04656c	3264	Sveti Štefan
00050000-5579-4cc4-5525-a14da954da8d	2258	Sveti Tomaž
00050000-5579-4cc4-8286-d165e0fed4c6	9204	Šalovci
00050000-5579-4cc4-471c-b7dd7f437ada	5261	Šempas
00050000-5579-4cc4-24a8-0216e2b49a7a	5290	Šempeter pri Gorici
00050000-5579-4cc4-963f-f1cf32b1c614	3311	Šempeter v Savinjski dolini
00050000-5579-4cc4-e5f0-9762f4b50afa	4208	Šenčur
00050000-5579-4cc4-48e5-71262076e0e7	2212	Šentilj v Slovenskih goricah
00050000-5579-4cc4-4ad5-c20ae6176b82	8297	Šentjanž
00050000-5579-4cc4-d796-50562bc17f39	2373	Šentjanž pri Dravogradu
00050000-5579-4cc4-17d2-090ecf864527	8310	Šentjernej
00050000-5579-4cc4-7dad-270f7ae29994	3230	Šentjur
00050000-5579-4cc4-ac6a-e61e49809db5	3271	Šentrupert
00050000-5579-4cc4-6580-20c17eb7f6a1	8232	Šentrupert
00050000-5579-4cc4-1a41-7bd3d9671281	1296	Šentvid pri Stični
00050000-5579-4cc4-7ce7-967b313206b1	8275	Škocjan
00050000-5579-4cc4-be01-12ad55c1b2be	6281	Škofije
00050000-5579-4cc4-7777-9fd713f7a711	4220	Škofja Loka
00050000-5579-4cc4-6b9a-eb7e3f263c5f	3211	Škofja vas
00050000-5579-4cc4-9bf4-effb03d7bb77	1291	Škofljica
00050000-5579-4cc4-31b2-36c83163c9c0	6274	Šmarje
00050000-5579-4cc4-f491-b2ad4d65bb93	1293	Šmarje - Sap
00050000-5579-4cc4-b874-9ad1915a1c83	3240	Šmarje pri Jelšah
00050000-5579-4cc4-c4ec-0d32a2d960f2	8220	Šmarješke Toplice
00050000-5579-4cc4-d1c6-d7fb8491da0a	2315	Šmartno na Pohorju
00050000-5579-4cc4-bf23-715cf5dcd325	3341	Šmartno ob Dreti
00050000-5579-4cc4-4a2e-12f4826b3a38	3327	Šmartno ob Paki
00050000-5579-4cc4-475f-2edca5e1b916	1275	Šmartno pri Litiji
00050000-5579-4cc4-f2c1-e38b502c4032	2383	Šmartno pri Slovenj Gradcu
00050000-5579-4cc4-ede3-cb3f41ee53b8	3201	Šmartno v Rožni dolini
00050000-5579-4cc4-bd64-634c69a1e94c	3325	Šoštanj
00050000-5579-4cc4-f7ee-7c03e6998e55	6222	Štanjel
00050000-5579-4cc4-7eb1-dfc0b09388ba	3220	Štore
00050000-5579-4cc4-bb2b-7a5b563d94ac	3304	Tabor
00050000-5579-4cc4-3176-5b754bf1d423	3221	Teharje
00050000-5579-4cc4-cc98-797d1e456a90	9251	Tišina
00050000-5579-4cc4-f34f-c1e8737fcf61	5220	Tolmin
00050000-5579-4cc4-cec6-9a0fa8bf92da	3326	Topolšica
00050000-5579-4cc4-dd6c-c15e61e964b0	2371	Trbonje
00050000-5579-4cc4-7d5e-099c1d39e50d	1420	Trbovlje
00050000-5579-4cc4-0056-905537e7eac9	8231	Trebelno 
00050000-5579-4cc4-69ef-dddf77176964	8210	Trebnje
00050000-5579-4cc4-c1f9-a33e436092a7	5252	Trnovo pri Gorici
00050000-5579-4cc4-3878-7e89c114657e	2254	Trnovska vas
00050000-5579-4cc4-5484-6627652d0c60	1222	Trojane
00050000-5579-4cc4-1770-1cd8c8292732	1236	Trzin
00050000-5579-4cc4-de19-d472e9c303f8	4290	Tržič
00050000-5579-4cc4-aa54-ca4ebfa23344	8295	Tržišče
00050000-5579-4cc4-f9bc-9ac328e8ed98	1311	Turjak
00050000-5579-4cc4-7f2b-a135e77875e7	9224	Turnišče
00050000-5579-4cc4-0c37-3b55516dd9b5	8323	Uršna sela
00050000-5579-4cc4-7d5f-c661b68e759c	1252	Vače
00050000-5579-4cc4-c704-95d93e47adb4	3320	Velenje 
00050000-5579-4cc4-e524-09bd9c76b4bf	3322	Velenje - poštni predali
00050000-5579-4cc4-eda5-7d5d7b0fa287	8212	Velika Loka
00050000-5579-4cc4-b53d-d63267813f93	2274	Velika Nedelja
00050000-5579-4cc4-df6d-9e2c485335b3	9225	Velika Polana
00050000-5579-4cc4-25c1-8f56dd22571b	1315	Velike Lašče
00050000-5579-4cc4-55f9-c5f0114bd8e6	8213	Veliki Gaber
00050000-5579-4cc4-ed81-577d97cc6d63	9241	Veržej
00050000-5579-4cc4-6a59-f7539e16e44c	1312	Videm - Dobrepolje
00050000-5579-4cc4-76c7-f48c4daa1151	2284	Videm pri Ptuju
00050000-5579-4cc4-67b0-67d52978d399	8344	Vinica
00050000-5579-4cc4-3b3e-b234bccf6ec2	5271	Vipava
00050000-5579-4cc4-2c21-2eabb71f88ab	4212	Visoko
00050000-5579-4cc4-de20-3481b1170e46	1294	Višnja Gora
00050000-5579-4cc4-780c-f2f4c95fc64c	3205	Vitanje
00050000-5579-4cc4-960b-7a173e23a9a7	2255	Vitomarci
00050000-5579-4cc4-d9ee-c31e35432199	1217	Vodice
00050000-5579-4cc4-de59-679f8211330f	3212	Vojnik\t
00050000-5579-4cc4-5b9f-91d8dd75780a	5293	Volčja Draga
00050000-5579-4cc4-0d33-eac6a448ecf4	2232	Voličina
00050000-5579-4cc4-e21d-164f3a94a93a	3305	Vransko
00050000-5579-4cc4-9a9d-0f7e60a464ea	6217	Vremski Britof
00050000-5579-4cc4-3a70-4499d1dbdea7	1360	Vrhnika
00050000-5579-4cc4-e919-2c31f050414b	2365	Vuhred
00050000-5579-4cc4-ccbb-a9a0340fa796	2367	Vuzenica
00050000-5579-4cc4-606a-c0775e780b36	8292	Zabukovje 
00050000-5579-4cc4-e774-f334d42c6231	1410	Zagorje ob Savi
00050000-5579-4cc4-b336-8e7c94ceed57	1303	Zagradec
00050000-5579-4cc4-7cb2-4c89f7b9b90c	2283	Zavrč
00050000-5579-4cc4-ac3a-2f54babff294	8272	Zdole 
00050000-5579-4cc4-3b1d-f85d01d22257	4201	Zgornja Besnica
00050000-5579-4cc4-eea5-d9ffce236c62	2242	Zgornja Korena
00050000-5579-4cc4-35e0-3f147b5a20fa	2201	Zgornja Kungota
00050000-5579-4cc4-46a1-2fd643a948f9	2316	Zgornja Ložnica
00050000-5579-4cc4-b2f1-c1b03dcb1866	2314	Zgornja Polskava
00050000-5579-4cc4-d4c4-41d64eb74ff9	2213	Zgornja Velka
00050000-5579-4cc4-1b8b-64050663c7d8	4247	Zgornje Gorje
00050000-5579-4cc4-b9b5-db5213d0fc25	4206	Zgornje Jezersko
00050000-5579-4cc4-682d-0f2463efd349	2285	Zgornji Leskovec
00050000-5579-4cc4-1676-7121beb1c135	1432	Zidani Most
00050000-5579-4cc4-dbdf-b0ea29933f6c	3214	Zreče
00050000-5579-4cc4-ddf4-7429e9c30c33	4209	Žabnica
00050000-5579-4cc4-c242-17d00d80002c	3310	Žalec
00050000-5579-4cc4-d1bd-d10745c3abef	4228	Železniki
00050000-5579-4cc4-0604-bd8ae9d1ce51	2287	Žetale
00050000-5579-4cc4-b19b-8d7aff8a9848	4226	Žiri
00050000-5579-4cc4-af0a-9b550659d005	4274	Žirovnica
00050000-5579-4cc4-2b5c-19166028b371	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 6956356)
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
-- TOC entry 2832 (class 0 OID 6956167)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6956245)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6956368)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 6956488)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 6956541)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5579-4cc6-a575-509671f99ca7	00080000-5579-4cc6-bcbb-1d55fcc99b1b	0987	A
00190000-5579-4cc6-9c37-90bcd8c3bdc3	00080000-5579-4cc6-23e6-8947642b4b0f	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 6956656)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 6956719)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 6956669)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 6956688)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6956397)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5579-4cc6-76b6-a5f4bab69286	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5579-4cc6-862b-1fbab2ac735c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5579-4cc6-3695-f921770fe978	0003	Kazinska	t	84	Kazinska dvorana
00220000-5579-4cc6-ba04-69796438df39	0004	Mali oder	t	24	Mali oder 
00220000-5579-4cc6-af03-494e9fe1bbfa	0005	Komorni oder	t	15	Komorni oder
00220000-5579-4cc6-d25f-0dc50d0fac2d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5579-4cc6-114c-800399bd4c2d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 6956341)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6956331)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6956530)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 6956465)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6956039)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5579-4cc5-f81d-9fde843a8e53	00010000-5579-4cc5-3b3d-c64426451a59	2015-06-11 10:54:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROH8JPcRKZlI.SwSY7/rnCYZ5cDJC8NPS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2892 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2857 (class 0 OID 6956407)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6956077)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5579-4cc5-d087-547a5701152e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5579-4cc5-a620-04b19525b021	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5579-4cc5-c3cf-99e469c9797a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5579-4cc5-2aee-c61f1541f48a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5579-4cc5-d3be-6629fbd064c6	planer	Planer dogodkov v koledarju	t
00020000-5579-4cc5-6158-fa7b0d872d46	kadrovska	Kadrovska služba	t
00020000-5579-4cc5-4fa1-ff25a6a1635d	arhivar	Ažuriranje arhivalij	t
00020000-5579-4cc5-e119-8f50a37ad434	igralec	Igralec	t
00020000-5579-4cc5-4741-b0ccb2a94752	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 6956061)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5579-4cc5-f81d-9fde843a8e53	00020000-5579-4cc5-c3cf-99e469c9797a
00010000-5579-4cc5-3b3d-c64426451a59	00020000-5579-4cc5-c3cf-99e469c9797a
\.


--
-- TOC entry 2859 (class 0 OID 6956421)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6956362)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6956312)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 6956752)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5579-4cc4-8bbd-3797608a3069	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5579-4cc4-0c66-faf5a82ecc12	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5579-4cc4-e5ea-5fc6a7f9d639	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5579-4cc4-93a4-512fb70e095d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5579-4cc4-951f-c27e5cd8adb3	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 6956744)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5579-4cc4-e14e-c6151435e821	00230000-5579-4cc4-93a4-512fb70e095d	popa
00240000-5579-4cc4-4cca-a4c090995413	00230000-5579-4cc4-93a4-512fb70e095d	oseba
00240000-5579-4cc4-1a33-d893170ab232	00230000-5579-4cc4-0c66-faf5a82ecc12	prostor
00240000-5579-4cc4-746f-2936d7470397	00230000-5579-4cc4-93a4-512fb70e095d	besedilo
00240000-5579-4cc4-eb3c-e17bd6f20adb	00230000-5579-4cc4-93a4-512fb70e095d	uprizoritev
00240000-5579-4cc4-ea75-eae8f7027d1a	00230000-5579-4cc4-93a4-512fb70e095d	funkcija
00240000-5579-4cc4-6dea-217535bec6e9	00230000-5579-4cc4-93a4-512fb70e095d	tipfunkcije
00240000-5579-4cc4-e585-bb9f5566115b	00230000-5579-4cc4-93a4-512fb70e095d	alternacija
00240000-5579-4cc4-532f-16765969002f	00230000-5579-4cc4-8bbd-3797608a3069	pogodba
00240000-5579-4cc4-e6d6-690baaf8e2e6	00230000-5579-4cc4-93a4-512fb70e095d	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 6956739)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 6956475)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6956139)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6956318)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5579-4cc6-00eb-00465967ab83	00180000-5579-4cc6-c43d-89ad5f8c7a36	000c0000-5579-4cc6-612b-53f4ee7f3fb6	00090000-5579-4cc6-53ce-3995fb068a54	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4cc6-0bf0-d8171509e817	00180000-5579-4cc6-c43d-89ad5f8c7a36	000c0000-5579-4cc6-c88e-b67ea662c728	00090000-5579-4cc6-1a4f-6a6db4bec18f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4cc6-db96-609ff183f17b	00180000-5579-4cc6-c43d-89ad5f8c7a36	000c0000-5579-4cc6-bf3a-c68687f73b6f	00090000-5579-4cc6-e74d-a54a4f01b93d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4cc6-dd61-0cbe58a65c05	00180000-5579-4cc6-c43d-89ad5f8c7a36	000c0000-5579-4cc6-a878-3aeda928a0b4	00090000-5579-4cc6-e4f0-209de3bfeced	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4cc6-f2fb-473959ba31bd	00180000-5579-4cc6-c43d-89ad5f8c7a36	000c0000-5579-4cc6-62e4-3d7bceff6fc9	00090000-5579-4cc6-e632-22a27cadcd91	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-4cc6-3a21-f60612ccc5ed	00180000-5579-4cc6-cd03-c4b18394b612	\N	00090000-5579-4cc6-e632-22a27cadcd91	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 6956519)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5579-4cc4-f495-43a88c48679c	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5579-4cc4-3208-251cf2a0ee46	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5579-4cc4-0529-edd2125e1c1b	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5579-4cc4-30d5-df180cc6ab53	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5579-4cc4-2ee4-4443d1f848c7	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5579-4cc4-746d-4f25d3938023	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5579-4cc4-6b6a-4015b71a3797	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5579-4cc4-cb3b-637d1e68d10d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5579-4cc4-cbf1-fb0bee8131f5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5579-4cc4-bc6d-92d85516326d	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5579-4cc4-f710-d66ce8f8e021	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5579-4cc4-bb9a-5c72927f2113	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5579-4cc4-37fe-76ae5899c3d1	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5579-4cc4-1c5d-ad2bea2551d3	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5579-4cc4-bc4f-237d4d4e7eae	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5579-4cc4-f564-4642241f6207	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 6956708)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5579-4cc4-f00b-fc1c033fa2e4	01	Velika predstava	f	1.00	1.00
002b0000-5579-4cc4-e0f4-f89300f424ed	02	Mala predstava	f	0.50	0.50
002b0000-5579-4cc4-be4e-ebecc1b08fe5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5579-4cc4-0007-eeb756ebac52	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5579-4cc4-f2e7-fe7527464ab6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 6956202)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6956048)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5579-4cc5-3b3d-c64426451a59	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO6jHE31rqy414YQlTL7REfFraIPTmNhu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-d8cd-4fd19560ccd7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-9938-dafb205f9098	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-aa3c-c5ce2fdfdd7f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-5aaa-0f2e3a0afbab	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-4c48-eafd1e1700a7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5579-4cc6-a508-697fa8c61c23	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5579-4cc5-f81d-9fde843a8e53	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 6956576)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5579-4cc6-f804-2dde57bcb90c	00160000-5579-4cc6-64a0-e38f8882fb58	00150000-5579-4cc4-1905-a427bd1d7b5f	00140000-5579-4cc4-60b9-7215606a55f0	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5579-4cc6-af03-494e9fe1bbfa
000e0000-5579-4cc6-d0ca-247377e1c015	00160000-5579-4cc6-a4a1-bb831d43db43	00150000-5579-4cc4-8148-3d39e28fb906	00140000-5579-4cc4-d312-1a53e05b8df5	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5579-4cc6-d25f-0dc50d0fac2d
000e0000-5579-4cc6-4d3b-4c2dde903006	\N	00150000-5579-4cc4-8148-3d39e28fb906	00140000-5579-4cc4-d312-1a53e05b8df5	00190000-5579-4cc6-a575-509671f99ca7	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5579-4cc6-af03-494e9fe1bbfa
000e0000-5579-4cc6-d0ff-07415e34d6a1	\N	00150000-5579-4cc4-8148-3d39e28fb906	00140000-5579-4cc4-d312-1a53e05b8df5	00190000-5579-4cc6-a575-509671f99ca7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5579-4cc6-af03-494e9fe1bbfa
\.


--
-- TOC entry 2840 (class 0 OID 6956264)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5579-4cc6-b838-49a1b4a89e8f	000e0000-5579-4cc6-d0ca-247377e1c015	1	
00200000-5579-4cc6-7968-4279a4fb4dc4	000e0000-5579-4cc6-d0ca-247377e1c015	2	
\.


--
-- TOC entry 2855 (class 0 OID 6956389)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6956458)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6956296)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 6956566)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5579-4cc4-60b9-7215606a55f0	01	Drama	drama (SURS 01)
00140000-5579-4cc4-f889-1537725283eb	02	Opera	opera (SURS 02)
00140000-5579-4cc4-838a-d919874aff4b	03	Balet	balet (SURS 03)
00140000-5579-4cc4-23d8-200d9800e2f4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5579-4cc4-a883-5191a70b2715	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5579-4cc4-d312-1a53e05b8df5	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5579-4cc4-1f43-9f7e6166ddc1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 6956448)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5579-4cc4-4d0c-6117fbf0285f	01	Opera	opera
00150000-5579-4cc4-8d7b-38f1f8b8ec0e	02	Opereta	opereta
00150000-5579-4cc4-4a1a-cf242a40c9a3	03	Balet	balet
00150000-5579-4cc4-9b06-016d2d7c8696	04	Plesne prireditve	plesne prireditve
00150000-5579-4cc4-61b8-b5da8640b8bd	05	Lutkovno gledališče	lutkovno gledališče
00150000-5579-4cc4-3470-0ecda74e21b4	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5579-4cc4-16b3-b242de4ca03a	07	Biografska drama	biografska drama
00150000-5579-4cc4-1905-a427bd1d7b5f	08	Komedija	komedija
00150000-5579-4cc4-e105-2264d85c8ba7	09	Črna komedija	črna komedija
00150000-5579-4cc4-f2f6-3349b2edbd34	10	E-igra	E-igra
00150000-5579-4cc4-8148-3d39e28fb906	11	Kriminalka	kriminalka
00150000-5579-4cc4-3829-9deff357b8a2	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 6956102)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6956623)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6956613)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6956518)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6956286)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6956311)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6956228)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6956652)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6956444)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6956262)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6956305)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6956242)
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
-- TOC entry 2495 (class 2606 OID 6956354)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6956381)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6956200)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6956111)
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
-- TOC entry 2410 (class 2606 OID 6956135)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6956091)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 6956076)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6956387)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6956420)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6956561)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6956164)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6956188)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6956360)
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
-- TOC entry 2425 (class 2606 OID 6956178)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6956249)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6956372)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6956500)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6956546)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6956667)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 6956737)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 6956684)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 6956705)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6956404)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6956345)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6956336)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 6956540)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6956472)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6956047)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6956411)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6956065)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 6956085)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6956429)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6956367)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6956317)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 6956761)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 6956749)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 6956743)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6956485)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 6956144)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6956327)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6956529)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 6956718)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6956213)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6956060)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6956592)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6956271)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6956395)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6956463)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6956300)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6956574)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6956456)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 6956293)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 6956486)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 6956487)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 6956166)
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
-- TOC entry 2508 (class 1259 OID 6956388)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 6956374)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 6956373)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 6956272)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 6956445)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 6956447)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 6956446)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6956244)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6956243)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 6956563)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 6956564)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 6956565)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 6956707)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 6956706)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 6956597)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 6956594)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 6956598)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 6956596)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 6956595)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 6956215)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 6956214)
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
-- TOC entry 2408 (class 1259 OID 6956138)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 6956412)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 6956306)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 6956092)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 6956093)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 6956432)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 6956431)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 6956430)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 6956250)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 6956252)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 6956251)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 6956751)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 6956340)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 6956338)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 6956337)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 6956339)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 6956066)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 6956067)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 6956396)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 6956361)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 6956473)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 6956474)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 6956653)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 6956654)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 6956655)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6956180)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 6956179)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 6956181)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 6956738)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 6956501)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6956502)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 6956627)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 6956629)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 6956625)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 6956628)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 6956626)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 6956464)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 6956349)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 6956348)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 6956346)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 6956347)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 6956615)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 6956614)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 6956668)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 6956263)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 6956113)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 6956112)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 6956145)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6956146)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 6956330)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 6956329)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 6956328)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 6956687)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 6956685)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 6956686)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 6956295)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 6956291)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 6956288)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 6956289)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 6956287)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 6956292)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 6956290)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 6956165)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 6956229)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 6956231)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 6956230)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 6956232)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 6956355)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 6956562)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6956593)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6956136)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 6956137)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 6956457)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 6956762)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6956201)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 6956750)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 6956406)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 6956405)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 6956624)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 6956189)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6956575)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6956547)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 6956548)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6956086)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 6956294)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 6956898)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 6956883)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 6956888)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 6956908)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 6956878)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 6956903)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 6956893)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 6957053)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 6957058)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 6956813)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6956993)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 6956988)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 6956983)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 6956873)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 6957023)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 6957033)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 6957028)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 6956848)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6956843)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 6956973)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 6957078)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 6957083)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 6957088)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 6957193)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 6957188)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 6957108)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 6957093)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 6957113)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 6957103)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 6957098)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 6956838)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 6956833)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 6956798)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 6956793)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 6957003)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 6956913)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 6956773)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6956778)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 6957018)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 6957013)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 6957008)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 6956853)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 6956863)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 6956858)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 6957203)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 6956948)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 6956938)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 6956933)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 6956943)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 6956763)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 6956768)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 6956998)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 6956978)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 6957043)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 6957048)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 6957153)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 6957158)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 6957163)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 6956823)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 6956818)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 6956828)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 6957198)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 6957063)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 6957068)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 6957138)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 6957148)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 6957128)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 6957143)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 6957133)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 6957038)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 6956968)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 6956963)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 6956953)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 6956958)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 6957123)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 6957118)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 6957168)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 6956868)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 6957073)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 6956788)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 6956783)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 6956803)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 6956808)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 6956928)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6956923)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 6956918)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 6957183)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 6957173)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 6957178)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-11 10:54:31 CEST

--
-- PostgreSQL database dump complete
--

