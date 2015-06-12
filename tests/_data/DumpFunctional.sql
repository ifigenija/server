--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-12 16:45:27 CEST

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
-- TOC entry 180 (class 1259 OID 7141812)
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
-- TOC entry 227 (class 1259 OID 7142334)
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
-- TOC entry 226 (class 1259 OID 7142317)
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
-- TOC entry 219 (class 1259 OID 7142221)
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
-- TOC entry 194 (class 1259 OID 7141991)
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
-- TOC entry 197 (class 1259 OID 7142025)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7141934)
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
-- TOC entry 228 (class 1259 OID 7142348)
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
-- TOC entry 213 (class 1259 OID 7142151)
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
-- TOC entry 192 (class 1259 OID 7141971)
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
-- TOC entry 196 (class 1259 OID 7142019)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7141951)
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
-- TOC entry 202 (class 1259 OID 7142068)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7142093)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7141908)
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
-- TOC entry 181 (class 1259 OID 7141821)
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
-- TOC entry 182 (class 1259 OID 7141832)
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
-- TOC entry 177 (class 1259 OID 7141786)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7141805)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7142100)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7142131)
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
-- TOC entry 223 (class 1259 OID 7142267)
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
-- TOC entry 184 (class 1259 OID 7141865)
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
-- TOC entry 186 (class 1259 OID 7141900)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7142074)
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
-- TOC entry 185 (class 1259 OID 7141885)
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
-- TOC entry 191 (class 1259 OID 7141963)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7142086)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7142206)
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
-- TOC entry 222 (class 1259 OID 7142259)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7142374)
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
-- TOC entry 233 (class 1259 OID 7142437)
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
-- TOC entry 230 (class 1259 OID 7142387)
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
-- TOC entry 231 (class 1259 OID 7142406)
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
-- TOC entry 209 (class 1259 OID 7142115)
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
-- TOC entry 201 (class 1259 OID 7142059)
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
-- TOC entry 200 (class 1259 OID 7142049)
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
-- TOC entry 221 (class 1259 OID 7142248)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7142183)
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
-- TOC entry 174 (class 1259 OID 7141757)
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
-- TOC entry 173 (class 1259 OID 7141755)
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
-- TOC entry 210 (class 1259 OID 7142125)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7141795)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7141779)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7142139)
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
-- TOC entry 204 (class 1259 OID 7142080)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7142030)
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
-- TOC entry 236 (class 1259 OID 7142470)
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
-- TOC entry 235 (class 1259 OID 7142462)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7142457)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7142193)
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
-- TOC entry 183 (class 1259 OID 7141857)
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
-- TOC entry 199 (class 1259 OID 7142036)
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
-- TOC entry 220 (class 1259 OID 7142237)
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
-- TOC entry 232 (class 1259 OID 7142426)
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
-- TOC entry 188 (class 1259 OID 7141920)
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
-- TOC entry 175 (class 1259 OID 7141766)
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
-- TOC entry 225 (class 1259 OID 7142294)
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
-- TOC entry 193 (class 1259 OID 7141982)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7142107)
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
-- TOC entry 215 (class 1259 OID 7142176)
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
-- TOC entry 195 (class 1259 OID 7142014)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7142284)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7142166)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7141760)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7141812)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7142334)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557a-f087-2f32-89f0da42f931	000d0000-557a-f087-d52f-61123f18b4d5	\N	00090000-557a-f086-20b6-028dec5e4dca	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-f087-a1cd-b4ebd7cc6860	000d0000-557a-f087-7ea2-0073b2a19b2e	\N	00090000-557a-f086-7ed7-53f67c70b59f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-f087-6aed-d919fcc89567	000d0000-557a-f087-4468-1aa98b846f71	\N	00090000-557a-f086-ac67-6a2edc228d13	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-f087-8c72-fef9055ac504	000d0000-557a-f087-0759-b43f29f3653a	\N	00090000-557a-f086-8141-53fd0ffe831c	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-f087-2546-20ab31c3d7bf	000d0000-557a-f087-817c-a26338e674a4	\N	00090000-557a-f086-be3b-cc439d25a1b1	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-f087-a193-73124bdac17c	000d0000-557a-f087-8e79-0f2220d9581c	\N	00090000-557a-f086-7ed7-53f67c70b59f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7142317)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7142221)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557a-f086-5016-9a14b886a125	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557a-f086-de0c-48e8fb602f30	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557a-f086-c5e5-b1a5f05d8cfc	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7141991)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557a-f087-694b-845fdc919c82	\N	\N	00200000-557a-f087-6742-5719e7469402	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557a-f087-252d-04248a218395	\N	\N	00200000-557a-f087-05ba-3517e08739c8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557a-f087-e821-966f0b865f09	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557a-f087-7f1b-d208120a1da3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557a-f087-71b2-cfc935299927	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7142025)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7141934)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557a-f085-6a98-0aced1d298c0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557a-f085-f73c-6b484b1808e7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557a-f085-d2b6-7d83c98af920	AL	ALB	008	Albania 	Albanija	\N
00040000-557a-f085-c7a3-17f1a788b926	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557a-f085-e725-8b056fd16efc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557a-f085-0ec6-b0d54fc5718f	AD	AND	020	Andorra 	Andora	\N
00040000-557a-f085-c043-56e56a4b9825	AO	AGO	024	Angola 	Angola	\N
00040000-557a-f085-a0a1-6b12ff5f6319	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557a-f085-6784-8d6faa738b6a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557a-f085-da86-5df76a23eeaf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-f085-fac2-d938721cf806	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557a-f085-1f6d-11ddb4e7b9fe	AM	ARM	051	Armenia 	Armenija	\N
00040000-557a-f085-8c59-52347edafba8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557a-f085-fd90-656532025aa3	AU	AUS	036	Australia 	Avstralija	\N
00040000-557a-f085-be87-e44698e6f980	AT	AUT	040	Austria 	Avstrija	\N
00040000-557a-f085-ad88-75a670fc0271	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557a-f085-3f8d-fac7440e047a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557a-f085-4caa-d6cf6fc5e7df	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557a-f085-23c5-512daa954386	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557a-f085-73ce-94afd4689199	BB	BRB	052	Barbados 	Barbados	\N
00040000-557a-f085-9b84-d257f13eeb5b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557a-f085-fc1c-dca2b9522d83	BE	BEL	056	Belgium 	Belgija	\N
00040000-557a-f085-5896-facb1a5a1faf	BZ	BLZ	084	Belize 	Belize	\N
00040000-557a-f085-b475-385d678d1943	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557a-f085-a34e-ecb4b3fde2ba	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557a-f085-347f-682b6eef6985	BT	BTN	064	Bhutan 	Butan	\N
00040000-557a-f085-0b8a-ff35feb4f0a1	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557a-f085-d990-27f801b7581b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557a-f085-b7d1-105fc85cf07d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557a-f085-ee77-8f529dffc1bf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557a-f085-3eee-261100738ae8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557a-f085-eff8-2f407d28511d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557a-f085-f4d6-f5c28ddccf03	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557a-f085-5527-e9bf3cd4a45f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557a-f085-57c9-768f844aa736	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557a-f085-02a1-a877a7a5813f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557a-f085-b2fd-572a0de1f01e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557a-f085-7333-00766f5f9def	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557a-f085-1111-db595e7975af	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557a-f085-6dec-9f75159f899b	CA	CAN	124	Canada 	Kanada	\N
00040000-557a-f085-39f6-96ca9611ff2d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557a-f085-a126-e7085742dd15	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557a-f085-03e6-afc72b154788	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557a-f085-c9ae-cfa9afac06e9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557a-f085-c1ad-27a11fb8b9a0	CL	CHL	152	Chile 	Čile	\N
00040000-557a-f085-48b9-408ffcf1c1d6	CN	CHN	156	China 	Kitajska	\N
00040000-557a-f085-41b2-722ceec72a3c	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557a-f085-bd0a-71073482c633	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557a-f085-e6dc-27857f6b136b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557a-f085-4405-a9e0e5962a0c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557a-f085-692a-46d40da8d709	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557a-f085-aa38-f4bf899b7168	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557a-f085-28de-2f9088312245	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557a-f085-7862-60164bfd3109	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557a-f085-ecb2-df79b1b266d1	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557a-f085-312b-d40a6791a751	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557a-f085-ae87-6ca6774773cc	CU	CUB	192	Cuba 	Kuba	\N
00040000-557a-f085-b865-148386b4384d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557a-f085-1992-c5ef7842c7d0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557a-f085-716b-86073c4b909d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557a-f085-cff7-3b4ae2774b99	DK	DNK	208	Denmark 	Danska	\N
00040000-557a-f085-6670-e850be7bce57	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557a-f085-61e2-618675814f95	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-f085-9c2b-4145436d6142	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557a-f085-a9d5-3f957928dca0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557a-f085-8869-653849d5e139	EG	EGY	818	Egypt 	Egipt	\N
00040000-557a-f085-a4ec-e14717c8b83e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557a-f085-a400-25e852789cb3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557a-f085-dcbb-d2fcd02a6cb9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557a-f085-c077-34430529ca64	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557a-f085-80b5-e24cc13642c7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557a-f085-967f-aa015fa0faf6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557a-f085-d02b-a6a2a5cef41e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557a-f085-0e81-b40b0fe9322b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557a-f085-f6a1-54b53b2aaffe	FI	FIN	246	Finland 	Finska	\N
00040000-557a-f085-fdd0-755d7827d208	FR	FRA	250	France 	Francija	\N
00040000-557a-f085-5b69-347dbac7e6a0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557a-f085-9884-5fd95b5a6976	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557a-f085-e739-8f126c223b6a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557a-f085-7b86-4cfd41ecb183	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557a-f085-5066-bd8a52715aee	GA	GAB	266	Gabon 	Gabon	\N
00040000-557a-f085-97fe-33b9e05733d1	GM	GMB	270	Gambia 	Gambija	\N
00040000-557a-f085-4dac-023c7856e8c2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557a-f085-a28e-2adf81f1629e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557a-f085-edc1-0eb479b0bdad	GH	GHA	288	Ghana 	Gana	\N
00040000-557a-f085-4113-09a1af286acf	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557a-f085-c34d-c6f190fe8d5a	GR	GRC	300	Greece 	Grčija	\N
00040000-557a-f085-dfd9-e4473a2d8509	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557a-f085-64ff-db66aec7766a	GD	GRD	308	Grenada 	Grenada	\N
00040000-557a-f085-aef0-5d977a93c495	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557a-f085-bf8a-195cf9ab7b97	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557a-f085-6292-d286e096c40c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557a-f085-d9f5-a730ead15ab4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557a-f085-f838-0cd43429ed9a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557a-f085-8cbe-3c58cbbd0b2d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557a-f085-05ea-6991e9dce0be	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557a-f085-f8a7-efae936153f4	HT	HTI	332	Haiti 	Haiti	\N
00040000-557a-f085-9e5e-c8a503a53fdf	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557a-f085-a6f9-fa31984d81c4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557a-f085-8df9-2a020c940579	HN	HND	340	Honduras 	Honduras	\N
00040000-557a-f085-9497-836d834ff7f1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557a-f085-0af6-cf7481f4b6ea	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557a-f085-4155-753975bf3384	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557a-f085-d54c-7ecdcb6196d3	IN	IND	356	India 	Indija	\N
00040000-557a-f085-562d-27705a529505	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557a-f085-66a9-97fcd481f871	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557a-f085-64f1-e74abb16fec5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557a-f085-b80e-c340cce3a50f	IE	IRL	372	Ireland 	Irska	\N
00040000-557a-f085-6ce0-7259b236221c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557a-f085-77ca-b70cd3db30db	IL	ISR	376	Israel 	Izrael	\N
00040000-557a-f085-fda0-5bc0f8feecc6	IT	ITA	380	Italy 	Italija	\N
00040000-557a-f085-a2a9-8764742e4c90	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557a-f085-51a8-d5f7f4716e29	JP	JPN	392	Japan 	Japonska	\N
00040000-557a-f085-fa4d-c52944261597	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557a-f085-b5ec-d3584d9369d5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557a-f085-4288-0fb8aed19646	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557a-f085-114c-b19d432dbcdd	KE	KEN	404	Kenya 	Kenija	\N
00040000-557a-f085-4cef-cc89405a25f2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557a-f085-4e9e-608a819b56cb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557a-f085-fece-d1746f2c0ad0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557a-f085-9ea2-8abdd9c8f315	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557a-f085-4ee1-570ed8cd6b86	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557a-f085-7099-1fa5e7dc2265	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557a-f085-7a64-3cd5db3ffb7b	LV	LVA	428	Latvia 	Latvija	\N
00040000-557a-f085-1c6e-a6cda33382a3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557a-f085-54e6-b2f7b4f498a0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557a-f085-bf20-c479c22ce2cf	LR	LBR	430	Liberia 	Liberija	\N
00040000-557a-f085-1ecf-89d03fd94a7c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557a-f085-40eb-b69ff5680d31	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557a-f085-aa34-5ba40f742405	LT	LTU	440	Lithuania 	Litva	\N
00040000-557a-f085-2eb4-34a1e920ceb5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557a-f085-dc3a-ccc64c383920	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557a-f085-5372-f838733a9bc6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557a-f085-97a5-4205a7f85411	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557a-f085-2a85-c96efdc65c45	MW	MWI	454	Malawi 	Malavi	\N
00040000-557a-f085-bb72-36e4c2723a3c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557a-f085-044f-cc13b65b7dc5	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557a-f085-528c-e71fcbf2bfe8	ML	MLI	466	Mali 	Mali	\N
00040000-557a-f085-250d-2d7d0cabb3af	MT	MLT	470	Malta 	Malta	\N
00040000-557a-f085-76b9-2d1d747b7bff	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557a-f085-eace-262a9b91bae6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557a-f085-c85d-1f605e108a93	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557a-f085-acf1-89364ee53d6a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557a-f085-a440-0314720db081	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557a-f085-c5a5-e24fa55e3602	MX	MEX	484	Mexico 	Mehika	\N
00040000-557a-f085-0711-7bc12241103b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557a-f085-52bc-3c07d2d2902c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557a-f085-7168-bc481fc2c240	MC	MCO	492	Monaco 	Monako	\N
00040000-557a-f085-46fe-9710bd06c8b4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557a-f085-1e9b-fbcd0e47934f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557a-f085-503c-06e290ee967e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557a-f085-de1e-7740659a79a3	MA	MAR	504	Morocco 	Maroko	\N
00040000-557a-f085-64a9-83c811f2f324	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557a-f085-6b68-f39c8bde97c1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557a-f085-7b06-626f7f96754c	NA	NAM	516	Namibia 	Namibija	\N
00040000-557a-f085-ee22-729d2d9014a1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557a-f085-ba54-335718098753	NP	NPL	524	Nepal 	Nepal	\N
00040000-557a-f085-dcdf-bf0d94c1ddd5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557a-f085-b9b7-61dcf64c3ca1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557a-f085-989d-b0877726d90b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557a-f085-4716-61be5b0531b0	NE	NER	562	Niger 	Niger 	\N
00040000-557a-f085-7d3f-fef0b7b7cda2	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557a-f085-1220-9deb9521e11b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557a-f085-a836-8be7a5b3a6b5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557a-f085-6ced-c3775edf78ff	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557a-f085-24ee-9cdb9266591f	NO	NOR	578	Norway 	Norveška	\N
00040000-557a-f085-88a6-5e34d5e3e1ed	OM	OMN	512	Oman 	Oman	\N
00040000-557a-f085-6282-abc9a23fdcfe	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557a-f085-75fe-f86dcebd8b59	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557a-f085-42e6-cd6589f4ae1b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557a-f085-9db4-d96dfbbdfc3f	PA	PAN	591	Panama 	Panama	\N
00040000-557a-f085-abe8-6b5c9f80a4ba	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557a-f085-65b4-f022b5713551	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557a-f085-bb88-7ab0c1cfa412	PE	PER	604	Peru 	Peru	\N
00040000-557a-f085-46e3-0fad71902933	PH	PHL	608	Philippines 	Filipini	\N
00040000-557a-f085-8354-efbe61111179	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557a-f085-5998-d53a61cb1073	PL	POL	616	Poland 	Poljska	\N
00040000-557a-f085-7e7a-1496213e7566	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557a-f085-4c29-ee1442c64dcd	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557a-f085-ea0c-ee953a6a95aa	QA	QAT	634	Qatar 	Katar	\N
00040000-557a-f085-aac6-95bb3e836dfb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557a-f085-bb8e-9e585300b3ec	RO	ROU	642	Romania 	Romunija	\N
00040000-557a-f085-643e-36cf605f7b1c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557a-f085-951f-1b54700f5ea7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557a-f085-6958-a36fad0766b4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557a-f085-1374-f065fb98f810	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557a-f085-6351-6e77f615c59f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557a-f085-91e5-8484dd08377a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557a-f085-52df-dcb496ba7de1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557a-f085-8931-6176888905e3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557a-f085-1287-1dae8a189637	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557a-f085-ee32-05717b4f7b2e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557a-f085-0933-9c9aad05e55a	SM	SMR	674	San Marino 	San Marino	\N
00040000-557a-f085-2a8e-238efec135c2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557a-f085-9b1a-5d5d59b5db0a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557a-f085-0ccd-0e8c436f8b71	SN	SEN	686	Senegal 	Senegal	\N
00040000-557a-f085-b830-69461af5013d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557a-f085-0655-81c77ab86f7e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557a-f085-5239-53cfc76b1039	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557a-f085-59a6-fdf3b9f43e7f	SG	SGP	702	Singapore 	Singapur	\N
00040000-557a-f085-8f6e-419049fcf17b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557a-f085-4b8d-1326120583d8	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557a-f085-2de7-1b97e53492b9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557a-f085-32aa-f03c45ed5cc0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557a-f085-8b2b-2a6fbeacbb00	SO	SOM	706	Somalia 	Somalija	\N
00040000-557a-f085-aa22-99da2582a95c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557a-f085-187b-de2a6e887c67	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557a-f085-ddf3-766314278c96	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557a-f085-4b3b-50ae84093fdf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557a-f085-ce32-41f21ed9dcb3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557a-f085-b283-261ce33be1af	SD	SDN	729	Sudan 	Sudan	\N
00040000-557a-f085-f5f3-3266cea2d3b1	SR	SUR	740	Suriname 	Surinam	\N
00040000-557a-f085-0adf-c53efff36c7f	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557a-f085-0b84-fab1d5b37615	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557a-f085-9e36-238474582a22	SE	SWE	752	Sweden 	Švedska	\N
00040000-557a-f085-7bb2-829d172a125d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557a-f085-0772-eae5f8f1566a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557a-f085-2caf-21c455bf1635	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557a-f085-c738-b2d42d368eff	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557a-f085-2d22-aea09ea57845	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557a-f085-33c5-dd65e3fa5bde	TH	THA	764	Thailand 	Tajska	\N
00040000-557a-f085-91b4-cb78dd00ddc0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557a-f085-9e55-fc2f83d3243d	TG	TGO	768	Togo 	Togo	\N
00040000-557a-f085-37e7-61d9501d86d9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557a-f085-f49e-c29609f8f144	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557a-f085-b472-a9c50616bf66	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557a-f085-9632-3fe48f3d3259	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557a-f085-fd8e-5d6f304e68a3	TR	TUR	792	Turkey 	Turčija	\N
00040000-557a-f085-7139-b23d5a7eee7e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557a-f085-fac8-3ee45a665878	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-f085-30a9-c95b6c11cc15	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557a-f085-2fc9-5ff0c9709892	UG	UGA	800	Uganda 	Uganda	\N
00040000-557a-f085-d98c-2c447056d1f2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557a-f085-7543-d793d2a5ee3c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557a-f085-65c7-6c1558d1f657	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557a-f085-46c8-d86e35ae43ce	US	USA	840	United States 	Združene države Amerike	\N
00040000-557a-f085-6d13-6ed8dedb2439	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557a-f085-26a9-81627c443533	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557a-f085-a9e1-4f47d62cc388	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557a-f085-bb98-ffbd417f2735	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557a-f085-be3c-8dfef1cb8758	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557a-f085-049d-d001a714857b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557a-f085-410f-a95c44d6f735	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-f085-589b-0e63e94ac5ab	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557a-f085-0642-2b6826c264ad	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557a-f085-7b06-2046db1eb761	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557a-f085-189b-2de7f1f66941	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557a-f085-0a19-fe3315c00a1f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557a-f085-6d58-f835a6ca404f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7142348)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7142151)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557a-f087-e661-a52d43f1782c	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557a-f085-66d1-08bbd82e06eb
000d0000-557a-f087-d52f-61123f18b4d5	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-f085-66d1-08bbd82e06eb
000d0000-557a-f087-7ea2-0073b2a19b2e	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557a-f085-71ac-2d7557144b7d
000d0000-557a-f087-4468-1aa98b846f71	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557a-f085-5631-ce20ad6c6d0b
000d0000-557a-f087-0759-b43f29f3653a	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557a-f085-5631-ce20ad6c6d0b
000d0000-557a-f087-817c-a26338e674a4	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557a-f085-5631-ce20ad6c6d0b
000d0000-557a-f087-8e79-0f2220d9581c	000e0000-557a-f086-64dd-82e8f9e55ba3	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-f085-66d1-08bbd82e06eb
\.


--
-- TOC entry 2839 (class 0 OID 7141971)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7142019)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7141951)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557a-f086-05d7-15ff57e7348b	00080000-557a-f086-2753-462f9f19544f	00090000-557a-f086-20b6-028dec5e4dca	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7142068)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7142093)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7141908)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557a-f086-e136-ad508b3e1f93	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557a-f086-8990-94b012dd7afd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557a-f086-0941-3c1a7ec56ff1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557a-f086-3c6e-9ca421a746b7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557a-f086-cc01-9049278766ef	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557a-f086-07e8-41cceaff7034	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557a-f086-aa38-f5fcb67194a7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557a-f086-e421-f34f4f0a5d69	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557a-f086-cfe6-71ef00159905	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557a-f086-b932-ecb5f4520499	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557a-f086-4d6e-ff26af08d302	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557a-f086-5936-42ecd514aa75	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557a-f086-36de-ecac0b91ac79	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-f086-02d2-acf17a70d1a7	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-f086-a6bb-0d427dfe9219	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557a-f086-08cd-5106a0dd61cf	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7141821)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557a-f086-2a37-97d8181f9cac	00000000-557a-f086-cc01-9049278766ef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557a-f086-f3d2-e56a49ac899a	00000000-557a-f086-cc01-9049278766ef	00010000-557a-f086-8b33-21a72ab69cbd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557a-f086-92b6-55e674a35512	00000000-557a-f086-07e8-41cceaff7034	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7141832)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557a-f086-89cc-719286da4cca	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557a-f086-8141-53fd0ffe831c	00010000-557a-f086-a0ac-bd2b0bc18b33	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557a-f086-ac67-6a2edc228d13	00010000-557a-f086-ba44-675df83d1727	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557a-f086-d38c-393a26f53e09	00010000-557a-f086-03e5-fd3b4f4a92cd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557a-f086-8d59-8c1253151a4f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557a-f086-4c55-5a6d297afeb6	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557a-f086-050a-7fb6ddc7aae2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557a-f086-46c8-1bd5110c3fde	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557a-f086-20b6-028dec5e4dca	00010000-557a-f086-e1ef-0e1d8381f0fb	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557a-f086-7ed7-53f67c70b59f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557a-f086-e5cd-f8947cc36e45	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557a-f086-be3b-cc439d25a1b1	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557a-f086-ac1e-72be18a2aa88	00010000-557a-f086-1fa0-5112ce73acf6	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7141786)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557a-f085-7464-83fc2de898df	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557a-f085-1a7f-75812f2c13e3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557a-f085-ae12-7cb4a5ff32a2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557a-f085-6dee-aff9b09b78f8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557a-f085-3160-97a5e593c92d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557a-f085-ae58-b988df55f2c1	Abonma-read	Abonma - branje	f
00030000-557a-f085-bf20-b00d5bb9c147	Abonma-write	Abonma - spreminjanje	f
00030000-557a-f085-7ef3-dff14058f7f7	Alternacija-read	Alternacija - branje	f
00030000-557a-f085-8650-c4456705a897	Alternacija-write	Alternacija - spreminjanje	f
00030000-557a-f085-8fc5-da4bef53f29b	Arhivalija-read	Arhivalija - branje	f
00030000-557a-f085-2091-1fe891c93e6f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557a-f085-ce60-7e46abaa3e74	Besedilo-read	Besedilo - branje	f
00030000-557a-f085-c2b8-42690675db59	Besedilo-write	Besedilo - spreminjanje	f
00030000-557a-f085-1a2b-b74f769be3ec	DogodekIzven-read	DogodekIzven - branje	f
00030000-557a-f085-2a8b-1b33155d8abc	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557a-f085-a080-6e8250575a6b	Dogodek-read	Dogodek - branje	f
00030000-557a-f085-746b-06db90ccdcac	Dogodek-write	Dogodek - spreminjanje	f
00030000-557a-f085-531c-618003282374	Drzava-read	Drzava - branje	f
00030000-557a-f085-63f0-d09f0c5dd7e4	Drzava-write	Drzava - spreminjanje	f
00030000-557a-f085-9fce-dceae2d5d5f8	Funkcija-read	Funkcija - branje	f
00030000-557a-f085-2e47-ce72f385f3b2	Funkcija-write	Funkcija - spreminjanje	f
00030000-557a-f085-0b88-69da6b99e341	Gostovanje-read	Gostovanje - branje	f
00030000-557a-f085-3d7b-0764705d9ba9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557a-f085-e58c-59e4fef1cbcf	Gostujoca-read	Gostujoca - branje	f
00030000-557a-f085-1bc9-737a28d0d7bb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557a-f085-015f-11d3e6d06b95	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557a-f085-412a-faee3498858b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557a-f085-a7c6-d7cd43321180	Kupec-read	Kupec - branje	f
00030000-557a-f085-4d29-54d9790085e2	Kupec-write	Kupec - spreminjanje	f
00030000-557a-f085-0c58-85d8ca743fab	NacinPlacina-read	NacinPlacina - branje	f
00030000-557a-f085-3e5f-2bc263f0f6f6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557a-f085-dac1-415f5df6b2ec	Option-read	Option - branje	f
00030000-557a-f085-32c7-53beaffa396a	Option-write	Option - spreminjanje	f
00030000-557a-f085-f1c4-63e83b2678b0	OptionValue-read	OptionValue - branje	f
00030000-557a-f085-8d24-e76b39c644c0	OptionValue-write	OptionValue - spreminjanje	f
00030000-557a-f085-19ea-8acffe5c8be9	Oseba-read	Oseba - branje	f
00030000-557a-f085-a298-31f540280d0a	Oseba-write	Oseba - spreminjanje	f
00030000-557a-f085-45bb-bc9d9caae072	Permission-read	Permission - branje	f
00030000-557a-f085-62d6-25df5999b673	Permission-write	Permission - spreminjanje	f
00030000-557a-f085-cd11-84660cccc896	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557a-f085-73a0-48bf28f01cbd	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557a-f085-5ce7-7ac78e01b6ad	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557a-f085-fbc7-8f8bcd32c0a2	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557a-f085-2b06-a1ec18b77dea	Pogodba-read	Pogodba - branje	f
00030000-557a-f085-ca7d-5229c1af2505	Pogodba-write	Pogodba - spreminjanje	f
00030000-557a-f085-6331-94197493cf57	Popa-read	Popa - branje	f
00030000-557a-f085-e50e-0a83e68729bb	Popa-write	Popa - spreminjanje	f
00030000-557a-f085-61d8-d39871f8a233	Posta-read	Posta - branje	f
00030000-557a-f085-fcbb-96675c032f09	Posta-write	Posta - spreminjanje	f
00030000-557a-f085-dc9e-06cdd33f7a15	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557a-f085-cbd2-20c4f26790fc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557a-f085-9a02-47354ba560d6	PostniNaslov-read	PostniNaslov - branje	f
00030000-557a-f085-4bd7-6bbf3b588712	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557a-f085-7af0-2a825280e5a6	Predstava-read	Predstava - branje	f
00030000-557a-f085-0cf6-36621fd072b0	Predstava-write	Predstava - spreminjanje	f
00030000-557a-f085-1662-ffee38f88bde	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557a-f085-294f-8586d0878377	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557a-f085-f4b2-090c09873536	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557a-f085-3ff9-3c6e14cd467f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557a-f085-1b05-3161d27b15f5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557a-f085-a4af-a649ef98d4cb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557a-f085-30f8-8b3fdeb61401	ProgramDela-read	ProgramDela - branje	f
00030000-557a-f085-1022-6373a6a6f025	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557a-f085-c0ae-aee045e502d1	ProgramFestival-read	ProgramFestival - branje	f
00030000-557a-f085-40e3-c080fd6f89f0	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557a-f085-b4e7-6386b7169ad1	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557a-f085-6b49-82e7bb35544f	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557a-f085-7f7b-b2a48fd86ad7	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557a-f085-2066-d6298f47bdee	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557a-f085-d0cb-4e09b3e7d61f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557a-f085-cec1-2f0d686f7bcc	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557a-f085-bcda-ffc76a38e180	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557a-f085-f2b0-33d376591247	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557a-f085-5797-bc076740af8f	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557a-f085-3413-143c112bb2d2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557a-f085-6a3d-d55d37829a67	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557a-f085-e874-3bc61883650a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557a-f085-bedc-ca2cea9b6fcf	ProgramRazno-read	ProgramRazno - branje	f
00030000-557a-f085-9b7f-0134e55c79e4	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557a-f085-8f83-07365489565c	Prostor-read	Prostor - branje	f
00030000-557a-f085-50f7-97c92a15d949	Prostor-write	Prostor - spreminjanje	f
00030000-557a-f085-357e-9248483ce9d1	Racun-read	Racun - branje	f
00030000-557a-f085-190c-919ecf8d6903	Racun-write	Racun - spreminjanje	f
00030000-557a-f085-0054-6a216d9b0a85	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557a-f085-d0ae-25830a98a140	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557a-f085-9ce9-dff71664ac84	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557a-f085-014e-d9e60294e5ed	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557a-f085-8cb8-17011c25908e	Rekvizit-read	Rekvizit - branje	f
00030000-557a-f085-8f18-eebd56face34	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557a-f085-4299-3d67945f2cf9	Revizija-read	Revizija - branje	f
00030000-557a-f085-abac-129d5c7e3d8f	Revizija-write	Revizija - spreminjanje	f
00030000-557a-f085-9548-c2621602f03d	Rezervacija-read	Rezervacija - branje	f
00030000-557a-f085-30eb-6c8a648fff1f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557a-f085-b38f-53ed15c91760	Role-read	Role - branje	f
00030000-557a-f085-db93-ad9ed792bb65	Role-write	Role - spreminjanje	f
00030000-557a-f085-1548-46c7bba1eb0f	SedezniRed-read	SedezniRed - branje	f
00030000-557a-f085-2356-282f1a4a80a8	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557a-f085-c071-197488bb80ac	Sedez-read	Sedez - branje	f
00030000-557a-f085-27b8-dd1d5caa1e7c	Sedez-write	Sedez - spreminjanje	f
00030000-557a-f085-bbfd-d973e9a72038	Sezona-read	Sezona - branje	f
00030000-557a-f085-3ccd-63c6c834826a	Sezona-write	Sezona - spreminjanje	f
00030000-557a-f085-c14b-70ed7886f62b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557a-f085-6572-3acd7a760beb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557a-f085-ccf4-13b939ce7499	Stevilcenje-read	Stevilcenje - branje	f
00030000-557a-f085-0bc5-f4195998b7f6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557a-f085-273d-337437b92c7b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557a-f085-eafb-f8a51ed3d8e7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557a-f085-2511-d06ec9158676	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557a-f085-6919-3cfee70cd852	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557a-f085-2829-1d0d6b31cc89	Telefonska-read	Telefonska - branje	f
00030000-557a-f085-4190-272a2b0ef465	Telefonska-write	Telefonska - spreminjanje	f
00030000-557a-f085-35e1-e01aeb7b8b85	TerminStoritve-read	TerminStoritve - branje	f
00030000-557a-f085-7f44-8075229dddf6	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557a-f085-9329-5dbc5f8c03a7	TipFunkcije-read	TipFunkcije - branje	f
00030000-557a-f085-e07a-441ea829603a	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557a-f085-0e85-fa250b696ba1	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557a-f085-d712-a9cded1fc425	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557a-f085-a2e7-5611b35d5289	Trr-read	Trr - branje	f
00030000-557a-f085-e978-d40ab0b69623	Trr-write	Trr - spreminjanje	f
00030000-557a-f085-d9c0-a927ddf91442	Uprizoritev-read	Uprizoritev - branje	f
00030000-557a-f085-be79-9199d0ab1161	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557a-f085-750d-8fcec2cefa7a	User-read	User - branje	f
00030000-557a-f085-c55f-a16252b158f4	User-write	User - spreminjanje	f
00030000-557a-f085-e517-e7df78bccf1d	Vaja-read	Vaja - branje	f
00030000-557a-f085-8b07-7e8d1e17a025	Vaja-write	Vaja - spreminjanje	f
00030000-557a-f085-7407-04a8015650ca	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557a-f085-355c-049c26a69826	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557a-f085-944f-11a351d0f59b	Zaposlitev-read	Zaposlitev - branje	f
00030000-557a-f085-707c-c095219badd6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557a-f085-3ec8-0a79671b96cc	Zasedenost-read	Zasedenost - branje	f
00030000-557a-f085-d5c6-4d03f940d7c6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557a-f085-fe70-1a5b8fef56ef	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557a-f085-c08d-489457f1aa13	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557a-f085-cc8b-ae6ef7145231	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557a-f085-1064-697d1eca1339	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7141805)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557a-f085-7d46-1975d69a9013	00030000-557a-f085-531c-618003282374
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-ae58-b988df55f2c1
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-bf20-b00d5bb9c147
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-7ef3-dff14058f7f7
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8650-c4456705a897
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8fc5-da4bef53f29b
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-a080-6e8250575a6b
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-6dee-aff9b09b78f8
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-746b-06db90ccdcac
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-531c-618003282374
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-63f0-d09f0c5dd7e4
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-9fce-dceae2d5d5f8
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-2e47-ce72f385f3b2
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-0b88-69da6b99e341
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-3d7b-0764705d9ba9
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-e58c-59e4fef1cbcf
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-1bc9-737a28d0d7bb
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-015f-11d3e6d06b95
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-412a-faee3498858b
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-dac1-415f5df6b2ec
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-f1c4-63e83b2678b0
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-19ea-8acffe5c8be9
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-a298-31f540280d0a
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-6331-94197493cf57
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-e50e-0a83e68729bb
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-61d8-d39871f8a233
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-fcbb-96675c032f09
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-9a02-47354ba560d6
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-4bd7-6bbf3b588712
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-7af0-2a825280e5a6
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-0cf6-36621fd072b0
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-1b05-3161d27b15f5
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-a4af-a649ef98d4cb
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8f83-07365489565c
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-50f7-97c92a15d949
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-9ce9-dff71664ac84
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-014e-d9e60294e5ed
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8cb8-17011c25908e
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8f18-eebd56face34
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-bbfd-d973e9a72038
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-3ccd-63c6c834826a
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-9329-5dbc5f8c03a7
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-d9c0-a927ddf91442
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-be79-9199d0ab1161
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-e517-e7df78bccf1d
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-8b07-7e8d1e17a025
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-3ec8-0a79671b96cc
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-d5c6-4d03f940d7c6
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-fe70-1a5b8fef56ef
00020000-557a-f085-4f92-77f7cbe08556	00030000-557a-f085-cc8b-ae6ef7145231
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-ae58-b988df55f2c1
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-8fc5-da4bef53f29b
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-a080-6e8250575a6b
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-531c-618003282374
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-0b88-69da6b99e341
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-e58c-59e4fef1cbcf
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-015f-11d3e6d06b95
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-412a-faee3498858b
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-dac1-415f5df6b2ec
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-f1c4-63e83b2678b0
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-19ea-8acffe5c8be9
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-a298-31f540280d0a
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-6331-94197493cf57
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-61d8-d39871f8a233
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-9a02-47354ba560d6
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-4bd7-6bbf3b588712
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-7af0-2a825280e5a6
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-8f83-07365489565c
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-9ce9-dff71664ac84
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-8cb8-17011c25908e
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-bbfd-d973e9a72038
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-2829-1d0d6b31cc89
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-4190-272a2b0ef465
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-a2e7-5611b35d5289
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-e978-d40ab0b69623
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-944f-11a351d0f59b
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-707c-c095219badd6
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-fe70-1a5b8fef56ef
00020000-557a-f085-4102-a1de029ced95	00030000-557a-f085-cc8b-ae6ef7145231
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-ae58-b988df55f2c1
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-7ef3-dff14058f7f7
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-8fc5-da4bef53f29b
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-2091-1fe891c93e6f
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-ce60-7e46abaa3e74
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-1a2b-b74f769be3ec
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-a080-6e8250575a6b
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-531c-618003282374
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-9fce-dceae2d5d5f8
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-0b88-69da6b99e341
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-e58c-59e4fef1cbcf
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-015f-11d3e6d06b95
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-dac1-415f5df6b2ec
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-f1c4-63e83b2678b0
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-19ea-8acffe5c8be9
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-6331-94197493cf57
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-61d8-d39871f8a233
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-7af0-2a825280e5a6
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-1b05-3161d27b15f5
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-8f83-07365489565c
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-9ce9-dff71664ac84
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-8cb8-17011c25908e
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-bbfd-d973e9a72038
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-9329-5dbc5f8c03a7
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-e517-e7df78bccf1d
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-3ec8-0a79671b96cc
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-fe70-1a5b8fef56ef
00020000-557a-f086-363e-7a2b38aaf105	00030000-557a-f085-cc8b-ae6ef7145231
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-ae58-b988df55f2c1
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-bf20-b00d5bb9c147
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-8650-c4456705a897
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-8fc5-da4bef53f29b
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-a080-6e8250575a6b
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-531c-618003282374
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-0b88-69da6b99e341
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-e58c-59e4fef1cbcf
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-dac1-415f5df6b2ec
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-f1c4-63e83b2678b0
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-6331-94197493cf57
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-61d8-d39871f8a233
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-7af0-2a825280e5a6
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-8f83-07365489565c
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-9ce9-dff71664ac84
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-8cb8-17011c25908e
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-bbfd-d973e9a72038
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-9329-5dbc5f8c03a7
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-fe70-1a5b8fef56ef
00020000-557a-f086-2312-9a161c983919	00030000-557a-f085-cc8b-ae6ef7145231
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-ae58-b988df55f2c1
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-8fc5-da4bef53f29b
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-a080-6e8250575a6b
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-531c-618003282374
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-0b88-69da6b99e341
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-e58c-59e4fef1cbcf
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-dac1-415f5df6b2ec
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-f1c4-63e83b2678b0
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-6331-94197493cf57
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-61d8-d39871f8a233
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-7af0-2a825280e5a6
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-8f83-07365489565c
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-9ce9-dff71664ac84
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-8cb8-17011c25908e
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-bbfd-d973e9a72038
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-35e1-e01aeb7b8b85
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-ae12-7cb4a5ff32a2
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-9329-5dbc5f8c03a7
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-fe70-1a5b8fef56ef
00020000-557a-f086-e8e4-1fbf9ddbda6f	00030000-557a-f085-cc8b-ae6ef7145231
\.


--
-- TOC entry 2854 (class 0 OID 7142100)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7142131)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7142267)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7141865)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557a-f086-2753-462f9f19544f	00040000-557a-f085-6a98-0aced1d298c0	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-f086-0315-8d22990c2246	00040000-557a-f085-6a98-0aced1d298c0	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-f086-f0e8-96a85892c9cb	00040000-557a-f085-6a98-0aced1d298c0	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-f086-d128-a53eb865631c	00040000-557a-f085-6a98-0aced1d298c0	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7141900)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557a-f085-b761-91848c80a82b	8341	Adlešiči
00050000-557a-f085-8541-ed04d8e2b707	5270	Ajdovščina
00050000-557a-f085-282c-8a8d142fa98f	6280	Ankaran/Ancarano
00050000-557a-f085-4fdd-5cfa91412007	9253	Apače
00050000-557a-f085-0c6f-af3fc5905f8d	8253	Artiče
00050000-557a-f085-e3f9-6cf7669adbbb	4275	Begunje na Gorenjskem
00050000-557a-f085-12b7-c2f34df1b437	1382	Begunje pri Cerknici
00050000-557a-f085-6782-0f8d6345bde6	9231	Beltinci
00050000-557a-f085-1bf3-a728a4d02da0	2234	Benedikt
00050000-557a-f085-21ba-0f994694a6b0	2345	Bistrica ob Dravi
00050000-557a-f085-dc31-ad30f54b2a49	3256	Bistrica ob Sotli
00050000-557a-f085-edcd-a736aba76656	8259	Bizeljsko
00050000-557a-f085-b1fc-4f1ad77d82dc	1223	Blagovica
00050000-557a-f085-003b-442e86c5a81c	8283	Blanca
00050000-557a-f085-6e0a-24c6f6ec215c	4260	Bled
00050000-557a-f085-0bd0-30dd09e480de	4273	Blejska Dobrava
00050000-557a-f085-4477-1cc8ca0e083e	9265	Bodonci
00050000-557a-f085-87ec-7bbf46eaccc2	9222	Bogojina
00050000-557a-f085-ab30-94e6eef863af	4263	Bohinjska Bela
00050000-557a-f085-9055-06a1c0763535	4264	Bohinjska Bistrica
00050000-557a-f085-6941-d33e3b356755	4265	Bohinjsko jezero
00050000-557a-f085-8df5-98a1146e3514	1353	Borovnica
00050000-557a-f085-71ec-189dffd4cf70	8294	Boštanj
00050000-557a-f085-a857-c97ba8e183dd	5230	Bovec
00050000-557a-f085-4bc4-b20cd4d0ddf0	5295	Branik
00050000-557a-f085-37be-0a3026109e41	3314	Braslovče
00050000-557a-f085-2f0c-6e7a0b07a674	5223	Breginj
00050000-557a-f085-6d10-f72e7d1659f4	8280	Brestanica
00050000-557a-f085-7d9f-83b78bdd74c9	2354	Bresternica
00050000-557a-f085-d7e0-0a7eee0e6484	4243	Brezje
00050000-557a-f085-579b-be981339b068	1351	Brezovica pri Ljubljani
00050000-557a-f085-5856-24ad77ce8fdd	8250	Brežice
00050000-557a-f085-f327-4b5ce9752dff	4210	Brnik - Aerodrom
00050000-557a-f085-d338-89487488ee70	8321	Brusnice
00050000-557a-f085-abad-2c3f957f0d1b	3255	Buče
00050000-557a-f085-b47b-e1cb26a97bfb	8276	Bučka 
00050000-557a-f085-1a56-79935782673a	9261	Cankova
00050000-557a-f085-6826-d59566e0cfd0	3000	Celje 
00050000-557a-f085-5b09-9365ec5cb57b	3001	Celje - poštni predali
00050000-557a-f085-a088-77163de44316	4207	Cerklje na Gorenjskem
00050000-557a-f085-ef6e-565a104f9f2c	8263	Cerklje ob Krki
00050000-557a-f085-8192-6f8631f6e084	1380	Cerknica
00050000-557a-f085-4920-44519b42464a	5282	Cerkno
00050000-557a-f085-6752-91ae6ac1f276	2236	Cerkvenjak
00050000-557a-f085-5fd2-e01070965c4b	2215	Ceršak
00050000-557a-f085-8bca-f12da85f5ddc	2326	Cirkovce
00050000-557a-f085-972d-65518a8a399d	2282	Cirkulane
00050000-557a-f085-aa19-b7b6f4dd9d65	5273	Col
00050000-557a-f085-e4a7-0ab7a75cf2ce	8251	Čatež ob Savi
00050000-557a-f085-c730-0c38a7a7f9af	1413	Čemšenik
00050000-557a-f085-418e-d8aec2b75269	5253	Čepovan
00050000-557a-f085-6b0e-7992e3feb79a	9232	Črenšovci
00050000-557a-f085-8110-41e402896f16	2393	Črna na Koroškem
00050000-557a-f085-1cbd-ab56cf2b4e97	6275	Črni Kal
00050000-557a-f085-2840-292d2fd803f6	5274	Črni Vrh nad Idrijo
00050000-557a-f085-563f-5732c1f7dd05	5262	Črniče
00050000-557a-f085-fde6-e95ddfda0cf4	8340	Črnomelj
00050000-557a-f085-3886-5859f41a244f	6271	Dekani
00050000-557a-f085-b026-3c55b330ce0d	5210	Deskle
00050000-557a-f085-56e1-35de11ecef6f	2253	Destrnik
00050000-557a-f085-19d3-ca637d431a8b	6215	Divača
00050000-557a-f085-7bea-d04677125f13	1233	Dob
00050000-557a-f085-8e23-730815027e7c	3224	Dobje pri Planini
00050000-557a-f085-98e9-d4682c4e9656	8257	Dobova
00050000-557a-f085-9b66-3178b5a63fd1	1423	Dobovec
00050000-557a-f085-c8e5-026ced93e392	5263	Dobravlje
00050000-557a-f085-3477-2ce14519dce1	3204	Dobrna
00050000-557a-f085-bf9f-bec9a1a1ccad	8211	Dobrnič
00050000-557a-f085-c0a3-447f9f6b2159	1356	Dobrova
00050000-557a-f085-c30e-737bd37ce7ac	9223	Dobrovnik/Dobronak 
00050000-557a-f085-377c-2c77e256d93f	5212	Dobrovo v Brdih
00050000-557a-f085-9feb-63ffd4168514	1431	Dol pri Hrastniku
00050000-557a-f085-daf0-51d2f7db3ab6	1262	Dol pri Ljubljani
00050000-557a-f085-222d-7d93c1de36be	1273	Dole pri Litiji
00050000-557a-f085-b5dd-4b8054d19541	1331	Dolenja vas
00050000-557a-f085-c392-24ff200ab5aa	8350	Dolenjske Toplice
00050000-557a-f085-775f-c0dfada4135d	1230	Domžale
00050000-557a-f085-9391-262f4436b6d8	2252	Dornava
00050000-557a-f085-fd7d-4c58ebd4938c	5294	Dornberk
00050000-557a-f085-0005-658c1a966ce5	1319	Draga
00050000-557a-f085-c581-fbb12bcb01ea	8343	Dragatuš
00050000-557a-f085-3d61-b0b37c0234d0	3222	Dramlje
00050000-557a-f085-3dd8-6b504de4bbdc	2370	Dravograd
00050000-557a-f085-8e7f-6b19c2042be8	4203	Duplje
00050000-557a-f085-4d33-eb36bfd6d7df	6221	Dutovlje
00050000-557a-f085-003b-a3856a0ed69d	8361	Dvor
00050000-557a-f085-1a6b-6581220ef260	2343	Fala
00050000-557a-f085-1560-452e44eb62c3	9208	Fokovci
00050000-557a-f085-adbc-c3991ea73dc3	2313	Fram
00050000-557a-f085-a9c1-2cf04e52149e	3213	Frankolovo
00050000-557a-f085-bc37-9cd62b1bce63	1274	Gabrovka
00050000-557a-f085-5028-1e2d6e53c689	8254	Globoko
00050000-557a-f085-c0a3-04a0c74426e8	5275	Godovič
00050000-557a-f085-c09a-3d63a08f3393	4204	Golnik
00050000-557a-f085-c7dd-e9cf847813bb	3303	Gomilsko
00050000-557a-f085-a8c8-5611cb294692	4224	Gorenja vas
00050000-557a-f085-6962-1121c488c149	3263	Gorica pri Slivnici
00050000-557a-f085-98b4-b1c091b2dba2	2272	Gorišnica
00050000-557a-f085-6326-ae3fe3729b3d	9250	Gornja Radgona
00050000-557a-f085-8ade-11a76242c250	3342	Gornji Grad
00050000-557a-f085-e77b-227284904064	4282	Gozd Martuljek
00050000-557a-f085-40a4-e1045f856cc3	6272	Gračišče
00050000-557a-f085-c988-a6de3990f595	9264	Grad
00050000-557a-f085-25b8-253af5ce9099	8332	Gradac
00050000-557a-f085-50a3-7418e9b1a321	1384	Grahovo
00050000-557a-f085-aec2-f53712a43fb6	5242	Grahovo ob Bači
00050000-557a-f085-4683-d0bf5532235b	5251	Grgar
00050000-557a-f085-7923-d04b2314c442	3302	Griže
00050000-557a-f085-ffb6-ec96ac2a21f9	3231	Grobelno
00050000-557a-f085-48ac-a3d47a9d377a	1290	Grosuplje
00050000-557a-f085-2a5f-dfa17f8752fc	2288	Hajdina
00050000-557a-f085-43c8-9a7bb0f1c2b1	8362	Hinje
00050000-557a-f085-97f9-b09a4077ddd0	2311	Hoče
00050000-557a-f085-152f-3a289b57e29b	9205	Hodoš/Hodos
00050000-557a-f085-8233-fb19138ef7dc	1354	Horjul
00050000-557a-f085-49a0-4f633429aa5a	1372	Hotedršica
00050000-557a-f085-c2ba-e72b50580307	1430	Hrastnik
00050000-557a-f085-c452-e7eb4151e39f	6225	Hruševje
00050000-557a-f085-1fab-f2544984a5ea	4276	Hrušica
00050000-557a-f085-a84a-bfc0c0a56a15	5280	Idrija
00050000-557a-f085-d6dc-2f22a70316be	1292	Ig
00050000-557a-f085-e47d-fcb2b1cbecf3	6250	Ilirska Bistrica
00050000-557a-f085-6772-b726108dbc24	6251	Ilirska Bistrica-Trnovo
00050000-557a-f085-ded6-8c38dea07377	1295	Ivančna Gorica
00050000-557a-f085-dd64-2a7a5dd1187f	2259	Ivanjkovci
00050000-557a-f085-b34c-a5e0e9733bc9	1411	Izlake
00050000-557a-f085-6bee-90f808868076	6310	Izola/Isola
00050000-557a-f085-a683-f949ed0e135e	2222	Jakobski Dol
00050000-557a-f085-b5d7-8a23e0779835	2221	Jarenina
00050000-557a-f085-67e6-0007a185afbc	6254	Jelšane
00050000-557a-f085-b33c-7768bc48a541	4270	Jesenice
00050000-557a-f085-dffc-af3b5009ead7	8261	Jesenice na Dolenjskem
00050000-557a-f085-008d-719aa6c3297c	3273	Jurklošter
00050000-557a-f085-d638-d2f30e4228c0	2223	Jurovski Dol
00050000-557a-f085-61d4-d9fd4445651d	2256	Juršinci
00050000-557a-f085-4b83-c1069ccb0fd7	5214	Kal nad Kanalom
00050000-557a-f085-4861-2d76ccf6c83f	3233	Kalobje
00050000-557a-f085-6327-e225df7b6a5b	4246	Kamna Gorica
00050000-557a-f085-2e53-900ff4f605bb	2351	Kamnica
00050000-557a-f085-9943-0e436292c573	1241	Kamnik
00050000-557a-f085-42df-9c6ab40b6c50	5213	Kanal
00050000-557a-f085-9b25-8900b8cf0abf	8258	Kapele
00050000-557a-f085-2c6e-79e23ca73892	2362	Kapla
00050000-557a-f085-e735-71bd31e8028d	2325	Kidričevo
00050000-557a-f085-2733-0a06f80146e2	1412	Kisovec
00050000-557a-f085-a27a-a0182283db1b	6253	Knežak
00050000-557a-f085-361d-0e7e7fc01c4e	5222	Kobarid
00050000-557a-f085-8bef-40462bca4d84	9227	Kobilje
00050000-557a-f085-5ac0-8c13cbdacd77	1330	Kočevje
00050000-557a-f085-5a08-82190522c442	1338	Kočevska Reka
00050000-557a-f085-db0b-0e7d9efe0503	2276	Kog
00050000-557a-f085-18d5-6a0011c8c500	5211	Kojsko
00050000-557a-f085-abd3-8b790e39805a	6223	Komen
00050000-557a-f085-b98a-c3ef423092b4	1218	Komenda
00050000-557a-f085-d1ae-6822e4f9cd0c	6000	Koper/Capodistria 
00050000-557a-f085-a7f9-f505ba9fbbd5	6001	Koper/Capodistria - poštni predali
00050000-557a-f085-cae3-3678f17ab662	8282	Koprivnica
00050000-557a-f085-179e-b4d072ef7e78	5296	Kostanjevica na Krasu
00050000-557a-f085-b531-cc519caadec4	8311	Kostanjevica na Krki
00050000-557a-f085-fe43-865decd528d0	1336	Kostel
00050000-557a-f085-9468-24efa41e8093	6256	Košana
00050000-557a-f085-8866-57a5a810d2ef	2394	Kotlje
00050000-557a-f085-4dfa-1137d579255f	6240	Kozina
00050000-557a-f085-bc34-824e4c4794d7	3260	Kozje
00050000-557a-f085-5251-f4514cd39933	4000	Kranj 
00050000-557a-f085-4ad0-f98149b452ee	4001	Kranj - poštni predali
00050000-557a-f085-e065-734f05289919	4280	Kranjska Gora
00050000-557a-f085-cb44-26557639db9e	1281	Kresnice
00050000-557a-f085-3fb0-47a105f6c7f3	4294	Križe
00050000-557a-f085-a8eb-6b1f2c9b96b5	9206	Križevci
00050000-557a-f085-cb8f-10350771048c	9242	Križevci pri Ljutomeru
00050000-557a-f085-635b-7862904aa06e	1301	Krka
00050000-557a-f085-7de6-3014f30209e2	8296	Krmelj
00050000-557a-f085-510a-7e40bf4d5616	4245	Kropa
00050000-557a-f085-d862-606fd7cb6b54	8262	Krška vas
00050000-557a-f085-6516-b12be2630473	8270	Krško
00050000-557a-f085-b332-3ec40b468e47	9263	Kuzma
00050000-557a-f085-bc11-df0d4e2476e3	2318	Laporje
00050000-557a-f085-d956-7a51ac4dc0df	3270	Laško
00050000-557a-f085-f6dd-4396273b5644	1219	Laze v Tuhinju
00050000-557a-f085-4b48-7dd519c4ba69	2230	Lenart v Slovenskih goricah
00050000-557a-f085-f6a6-ce60cd2ad179	9220	Lendava/Lendva
00050000-557a-f085-4632-a4a271a0e5d4	4248	Lesce
00050000-557a-f085-52fb-9b015c93ac35	3261	Lesično
00050000-557a-f085-ca2c-e0b198ce5b19	8273	Leskovec pri Krškem
00050000-557a-f085-284c-c57011ade8f9	2372	Libeliče
00050000-557a-f085-2ff6-7366525e8657	2341	Limbuš
00050000-557a-f085-4d6e-60dcfb5cf1c1	1270	Litija
00050000-557a-f085-5bd4-76fcfbeb65e1	3202	Ljubečna
00050000-557a-f085-40e2-8c752fdacf82	1000	Ljubljana 
00050000-557a-f085-e0f6-89125f21840d	1001	Ljubljana - poštni predali
00050000-557a-f085-8f5f-e6ab4329f2db	1231	Ljubljana - Črnuče
00050000-557a-f085-59ef-06d1e287edc0	1261	Ljubljana - Dobrunje
00050000-557a-f085-4e1c-3ef258d21695	1260	Ljubljana - Polje
00050000-557a-f085-3436-2fe8fadbedf5	1210	Ljubljana - Šentvid
00050000-557a-f085-edf3-cbdd71dc5ba4	1211	Ljubljana - Šmartno
00050000-557a-f085-9e01-21cc601bec21	3333	Ljubno ob Savinji
00050000-557a-f085-c405-7d3a0e193daf	9240	Ljutomer
00050000-557a-f085-853a-5b9968887ceb	3215	Loče
00050000-557a-f085-13d9-4248793805ad	5231	Log pod Mangartom
00050000-557a-f085-334f-e62ee3aa2f83	1358	Log pri Brezovici
00050000-557a-f085-5499-b7f991a78e1c	1370	Logatec
00050000-557a-f085-5706-3622e4da2b8b	1371	Logatec
00050000-557a-f085-6ed7-ff64cfb64b7b	1434	Loka pri Zidanem Mostu
00050000-557a-f085-9625-4fa14be5a21a	3223	Loka pri Žusmu
00050000-557a-f085-bde8-41041945506f	6219	Lokev
00050000-557a-f085-6ccb-549b083b7ec4	1318	Loški Potok
00050000-557a-f085-5cc7-8c8333081313	2324	Lovrenc na Dravskem polju
00050000-557a-f085-574d-ad69976e6767	2344	Lovrenc na Pohorju
00050000-557a-f085-509c-191c4d5d5d1d	3334	Luče
00050000-557a-f085-ef40-8a08bf9621f4	1225	Lukovica
00050000-557a-f085-82c2-01112e958e98	9202	Mačkovci
00050000-557a-f085-d862-ed70515f3c97	2322	Majšperk
00050000-557a-f085-3e32-93d2ffd8ed6e	2321	Makole
00050000-557a-f085-aca9-baeb8b45637f	9243	Mala Nedelja
00050000-557a-f085-79cc-72330e3edad6	2229	Malečnik
00050000-557a-f085-4baa-cb8cb49a917b	6273	Marezige
00050000-557a-f085-dc9b-50c15f9c7168	2000	Maribor 
00050000-557a-f085-c49e-aafaf0299acf	2001	Maribor - poštni predali
00050000-557a-f085-fd10-0e082c14d3b9	2206	Marjeta na Dravskem polju
00050000-557a-f085-ded4-74453fcbc6d6	2281	Markovci
00050000-557a-f085-3a01-efdeec48d1ca	9221	Martjanci
00050000-557a-f085-ff93-4b9764402480	6242	Materija
00050000-557a-f085-7ec2-78c508f3019d	4211	Mavčiče
00050000-557a-f085-b854-f8ed9123ce71	1215	Medvode
00050000-557a-f085-8a68-24b41e4b659a	1234	Mengeš
00050000-557a-f085-f447-08a2b882f6eb	8330	Metlika
00050000-557a-f085-2628-fb5a2da734e9	2392	Mežica
00050000-557a-f085-43bd-693dda0fb4a5	2204	Miklavž na Dravskem polju
00050000-557a-f085-45ac-c9d7c1d0038d	2275	Miklavž pri Ormožu
00050000-557a-f085-b433-89ce74b21397	5291	Miren
00050000-557a-f085-e5a2-e3d5d7f19f6b	8233	Mirna
00050000-557a-f085-5e0a-4e493f174c12	8216	Mirna Peč
00050000-557a-f085-0f91-4438772141c8	2382	Mislinja
00050000-557a-f085-b9b1-381466ad96d1	4281	Mojstrana
00050000-557a-f085-07bd-5f61a76c2a51	8230	Mokronog
00050000-557a-f085-775d-7274ff7441be	1251	Moravče
00050000-557a-f085-6e13-d2ec850eb7e7	9226	Moravske Toplice
00050000-557a-f085-4fa9-53b965488346	5216	Most na Soči
00050000-557a-f085-c57e-aeb62918bbf1	1221	Motnik
00050000-557a-f085-5c92-b2ac7957da77	3330	Mozirje
00050000-557a-f085-34cf-9ece9f21de04	9000	Murska Sobota 
00050000-557a-f085-494c-c1e3ecb50b2e	9001	Murska Sobota - poštni predali
00050000-557a-f085-54a3-e5635d1e72d7	2366	Muta
00050000-557a-f085-dec6-9806a72c6a95	4202	Naklo
00050000-557a-f085-1f09-7b2c5490a30e	3331	Nazarje
00050000-557a-f085-d8e5-41ec71838dfa	1357	Notranje Gorice
00050000-557a-f085-2294-140ab97f134a	3203	Nova Cerkev
00050000-557a-f085-d4ec-884f50ffba88	5000	Nova Gorica 
00050000-557a-f085-cff7-dbd670857132	5001	Nova Gorica - poštni predali
00050000-557a-f085-9e4a-75917ff12dfd	1385	Nova vas
00050000-557a-f085-c794-b3210e247e07	8000	Novo mesto
00050000-557a-f085-dd6b-8d922e2cc4e9	8001	Novo mesto - poštni predali
00050000-557a-f085-648f-eb90f3c5f2a7	6243	Obrov
00050000-557a-f085-3a11-cbb3c7d268e3	9233	Odranci
00050000-557a-f085-11f5-5199d4214a94	2317	Oplotnica
00050000-557a-f085-b160-9d06277549bb	2312	Orehova vas
00050000-557a-f085-56f4-5e06ec98e58b	2270	Ormož
00050000-557a-f085-0f3f-9f74c26d9d29	1316	Ortnek
00050000-557a-f085-b851-06439a189f40	1337	Osilnica
00050000-557a-f085-6d48-28af791e5ae6	8222	Otočec
00050000-557a-f085-db21-97a44b3cc37d	2361	Ožbalt
00050000-557a-f085-d923-3ae3b891e30d	2231	Pernica
00050000-557a-f085-5e09-b725d9ff3939	2211	Pesnica pri Mariboru
00050000-557a-f085-89b6-bfd81ff10744	9203	Petrovci
00050000-557a-f085-5097-273e0312804b	3301	Petrovče
00050000-557a-f085-2d6c-1be947dd8f02	6330	Piran/Pirano
00050000-557a-f085-8a1d-0cdbaa6a7234	8255	Pišece
00050000-557a-f085-700e-b8f1e7674115	6257	Pivka
00050000-557a-f085-28d6-5642304f6f4e	6232	Planina
00050000-557a-f085-7580-c0244210cb3a	3225	Planina pri Sevnici
00050000-557a-f085-ecaf-f71f2735c810	6276	Pobegi
00050000-557a-f085-22be-6a15153949d1	8312	Podbočje
00050000-557a-f085-99ca-3832d209c6eb	5243	Podbrdo
00050000-557a-f085-a0e8-1098b97871ae	3254	Podčetrtek
00050000-557a-f085-f183-cd7430456697	2273	Podgorci
00050000-557a-f085-99dd-4801024461ef	6216	Podgorje
00050000-557a-f085-a063-5f1390aef5c7	2381	Podgorje pri Slovenj Gradcu
00050000-557a-f085-ec95-34404807f73e	6244	Podgrad
00050000-557a-f085-97e5-9c5c6bb65aca	1414	Podkum
00050000-557a-f085-42d9-cd41e96695ab	2286	Podlehnik
00050000-557a-f085-0ce1-48fb2c2679aa	5272	Podnanos
00050000-557a-f085-3c5a-90595253eecc	4244	Podnart
00050000-557a-f085-dc78-615d79b3f036	3241	Podplat
00050000-557a-f085-d6cd-ef76be089511	3257	Podsreda
00050000-557a-f085-af86-f883f9d6621c	2363	Podvelka
00050000-557a-f085-f337-6cd76496ecac	2208	Pohorje
00050000-557a-f085-3a40-7de4b0349fa0	2257	Polenšak
00050000-557a-f085-e3dd-2f4fc1651370	1355	Polhov Gradec
00050000-557a-f085-ae99-14faae6f514e	4223	Poljane nad Škofjo Loko
00050000-557a-f085-f3aa-da0973afb231	2319	Poljčane
00050000-557a-f085-6b9f-08029a00c3d4	1272	Polšnik
00050000-557a-f085-a22d-4a21be220fc2	3313	Polzela
00050000-557a-f085-b223-a93485d629b2	3232	Ponikva
00050000-557a-f085-95dc-05795fac853d	6320	Portorož/Portorose
00050000-557a-f085-5e45-a85bfb150500	6230	Postojna
00050000-557a-f085-825f-8822ad4b6ab4	2331	Pragersko
00050000-557a-f085-094b-13a5412b6f9a	3312	Prebold
00050000-557a-f085-657d-3d63caf66239	4205	Preddvor
00050000-557a-f085-20a7-891e57d546d7	6255	Prem
00050000-557a-f085-c2d8-da3b6328746a	1352	Preserje
00050000-557a-f085-c6fb-54e185d21eb7	6258	Prestranek
00050000-557a-f085-6ebd-6bb70fc3d627	2391	Prevalje
00050000-557a-f085-c02d-0287829945d3	3262	Prevorje
00050000-557a-f085-e222-824ffb05efa8	1276	Primskovo 
00050000-557a-f085-3104-e2a8c06732eb	3253	Pristava pri Mestinju
00050000-557a-f085-8831-68394298f765	9207	Prosenjakovci/Partosfalva
00050000-557a-f085-6006-390066a105d5	5297	Prvačina
00050000-557a-f085-fd15-dfee7552ac70	2250	Ptuj
00050000-557a-f085-c38d-d7da76fb8b3c	2323	Ptujska Gora
00050000-557a-f085-5b12-a771539f622d	9201	Puconci
00050000-557a-f085-fd32-a7f7aab62663	2327	Rače
00050000-557a-f085-51b5-b976a6775214	1433	Radeče
00050000-557a-f085-ad92-f2b6a3fffc73	9252	Radenci
00050000-557a-f085-9c90-50a3517c782c	2360	Radlje ob Dravi
00050000-557a-f085-82a7-aea86f37f270	1235	Radomlje
00050000-557a-f085-e9cf-880069abf560	4240	Radovljica
00050000-557a-f085-4a09-885a714950f4	8274	Raka
00050000-557a-f085-9acc-1a51478e5fbf	1381	Rakek
00050000-557a-f085-b482-3eaaf536eadc	4283	Rateče - Planica
00050000-557a-f085-8ec2-05ea7c5b9be8	2390	Ravne na Koroškem
00050000-557a-f085-fed4-3d546ed1d4e0	9246	Razkrižje
00050000-557a-f085-173c-e27b895fb31e	3332	Rečica ob Savinji
00050000-557a-f085-e19f-3dc1032a9613	5292	Renče
00050000-557a-f085-7977-6d0d57ec3d66	1310	Ribnica
00050000-557a-f085-a1ae-d3fd4a5657b0	2364	Ribnica na Pohorju
00050000-557a-f085-bfd4-33f263811042	3272	Rimske Toplice
00050000-557a-f085-2e94-cf6d5c05933d	1314	Rob
00050000-557a-f085-ad29-96fb7bae89b7	5215	Ročinj
00050000-557a-f085-5c95-116db6ecb0da	3250	Rogaška Slatina
00050000-557a-f085-cf33-99362b5ee342	9262	Rogašovci
00050000-557a-f085-5ed3-605686abcd1a	3252	Rogatec
00050000-557a-f085-4c2f-6b73cc962ac4	1373	Rovte
00050000-557a-f085-d72c-7af4988dae72	2342	Ruše
00050000-557a-f085-0004-a8aa8d51cc51	1282	Sava
00050000-557a-f085-4e1b-ed5e2d5a3492	6333	Sečovlje/Sicciole
00050000-557a-f085-b2a5-752c154e55d9	4227	Selca
00050000-557a-f085-a73a-a37799e700e9	2352	Selnica ob Dravi
00050000-557a-f085-a501-97b35d1e6a92	8333	Semič
00050000-557a-f085-20ec-7c8eaf25a310	8281	Senovo
00050000-557a-f085-c492-a0dc9c5e8bb4	6224	Senožeče
00050000-557a-f085-3af8-7d6348853dec	8290	Sevnica
00050000-557a-f085-edac-3599edf4dee4	6210	Sežana
00050000-557a-f085-f086-60026787694b	2214	Sladki Vrh
00050000-557a-f085-a188-d8dfcf7ba829	5283	Slap ob Idrijci
00050000-557a-f085-864c-1148a95e1f14	2380	Slovenj Gradec
00050000-557a-f085-41e2-420529462748	2310	Slovenska Bistrica
00050000-557a-f085-9a85-fb0c39103829	3210	Slovenske Konjice
00050000-557a-f085-8f74-ca9c49704031	1216	Smlednik
00050000-557a-f085-b1de-94c5743902da	5232	Soča
00050000-557a-f085-a928-414e6caaac27	1317	Sodražica
00050000-557a-f085-4c89-6ef918154390	3335	Solčava
00050000-557a-f085-eff5-2b32c436a43d	5250	Solkan
00050000-557a-f085-7ba1-f3934e58c7a9	4229	Sorica
00050000-557a-f085-ea35-33a3f4724dcf	4225	Sovodenj
00050000-557a-f085-c8f3-5eb3a2bf8f48	5281	Spodnja Idrija
00050000-557a-f085-f53d-7c4c1fdf69e1	2241	Spodnji Duplek
00050000-557a-f085-a23e-8b43cd87d26e	9245	Spodnji Ivanjci
00050000-557a-f085-62c6-27325dbbb6a9	2277	Središče ob Dravi
00050000-557a-f085-abbf-9268024cefb1	4267	Srednja vas v Bohinju
00050000-557a-f085-4b29-6a2793d4e060	8256	Sromlje 
00050000-557a-f085-af28-f8aacefdabe1	5224	Srpenica
00050000-557a-f085-9213-3152bde29b09	1242	Stahovica
00050000-557a-f085-de82-07a3439a5aae	1332	Stara Cerkev
00050000-557a-f085-5e9d-1793941826be	8342	Stari trg ob Kolpi
00050000-557a-f085-5f23-be6410059b02	1386	Stari trg pri Ložu
00050000-557a-f085-164a-542e80a680c0	2205	Starše
00050000-557a-f085-4f92-9b995dae1797	2289	Stoperce
00050000-557a-f085-eecb-43f138791011	8322	Stopiče
00050000-557a-f085-e631-4aa75bcd9af7	3206	Stranice
00050000-557a-f085-2429-0cd27a49ff17	8351	Straža
00050000-557a-f085-af1d-f7517c95ac30	1313	Struge
00050000-557a-f085-435b-d82e5dc6edd1	8293	Studenec
00050000-557a-f085-0886-ddcf73577b13	8331	Suhor
00050000-557a-f085-24c7-cdf5dde6566e	2233	Sv. Ana v Slovenskih goricah
00050000-557a-f085-1de8-12b55a848bb0	2235	Sv. Trojica v Slovenskih goricah
00050000-557a-f085-955b-c7f8dde8f222	2353	Sveti Duh na Ostrem Vrhu
00050000-557a-f085-296e-019a6c0dc45c	9244	Sveti Jurij ob Ščavnici
00050000-557a-f085-e164-3b56b70aee72	3264	Sveti Štefan
00050000-557a-f085-1ab3-50e25b8d1337	2258	Sveti Tomaž
00050000-557a-f085-ca2e-312ccf9c71d9	9204	Šalovci
00050000-557a-f085-753f-e06102956155	5261	Šempas
00050000-557a-f085-1fac-e5b7072ca05d	5290	Šempeter pri Gorici
00050000-557a-f085-5b9c-22f73d93ef1a	3311	Šempeter v Savinjski dolini
00050000-557a-f085-038d-c5f7a34c9c5a	4208	Šenčur
00050000-557a-f085-cf89-482143a16600	2212	Šentilj v Slovenskih goricah
00050000-557a-f085-d863-2d9dca491fe1	8297	Šentjanž
00050000-557a-f085-803b-cbecf156575a	2373	Šentjanž pri Dravogradu
00050000-557a-f085-2828-3b750b7c78a3	8310	Šentjernej
00050000-557a-f085-ea75-430e5d62d900	3230	Šentjur
00050000-557a-f085-08a9-43802d1902fc	3271	Šentrupert
00050000-557a-f085-efba-380000eba25e	8232	Šentrupert
00050000-557a-f085-6894-dae3cf8ebb43	1296	Šentvid pri Stični
00050000-557a-f085-be85-a200ccfce1e9	8275	Škocjan
00050000-557a-f085-26fa-ba280fc5ee80	6281	Škofije
00050000-557a-f085-0d00-05443521b6e5	4220	Škofja Loka
00050000-557a-f085-d6ca-54ba7502de16	3211	Škofja vas
00050000-557a-f085-3a89-2e0949d3e98e	1291	Škofljica
00050000-557a-f085-a007-e020447fe398	6274	Šmarje
00050000-557a-f085-fc16-10641125bd92	1293	Šmarje - Sap
00050000-557a-f085-6d24-ceb1bcf86d36	3240	Šmarje pri Jelšah
00050000-557a-f085-2ccf-596269df64fe	8220	Šmarješke Toplice
00050000-557a-f085-b331-8a8f5e1c5170	2315	Šmartno na Pohorju
00050000-557a-f085-8322-ffd332c35ec9	3341	Šmartno ob Dreti
00050000-557a-f085-8d5d-11a7adf934e2	3327	Šmartno ob Paki
00050000-557a-f085-7ff0-604c2168c7eb	1275	Šmartno pri Litiji
00050000-557a-f085-1455-c7b99fc40d9c	2383	Šmartno pri Slovenj Gradcu
00050000-557a-f085-501d-ce52e0a1f49f	3201	Šmartno v Rožni dolini
00050000-557a-f085-de0a-765b727a9c67	3325	Šoštanj
00050000-557a-f085-a7a0-8850c68d5ed0	6222	Štanjel
00050000-557a-f085-672a-1c353093aeff	3220	Štore
00050000-557a-f085-d779-3506ac7cbbdc	3304	Tabor
00050000-557a-f085-a46c-bca1fd901351	3221	Teharje
00050000-557a-f085-8394-a9b3cf2309a0	9251	Tišina
00050000-557a-f085-3f8e-935d07cd28e2	5220	Tolmin
00050000-557a-f085-8364-a9db316b3610	3326	Topolšica
00050000-557a-f085-6b5d-91b2fbc285d8	2371	Trbonje
00050000-557a-f085-8aec-070ee4e00a31	1420	Trbovlje
00050000-557a-f085-ad41-6bf3b0d12322	8231	Trebelno 
00050000-557a-f085-f310-61245c462a64	8210	Trebnje
00050000-557a-f085-4e19-d8a9d1c95cd7	5252	Trnovo pri Gorici
00050000-557a-f085-1133-146909e064b4	2254	Trnovska vas
00050000-557a-f085-2f3e-cf72c8f69929	1222	Trojane
00050000-557a-f085-1f9f-2817f266f931	1236	Trzin
00050000-557a-f085-8c88-ea16f28af369	4290	Tržič
00050000-557a-f085-ed9f-2552ca0cec88	8295	Tržišče
00050000-557a-f085-faa8-997937a59678	1311	Turjak
00050000-557a-f085-45e2-9b6400a7ada9	9224	Turnišče
00050000-557a-f085-b433-3d0b5fdd6f5d	8323	Uršna sela
00050000-557a-f085-9ff4-0781890524c6	1252	Vače
00050000-557a-f085-6e69-ef858b3ed574	3320	Velenje 
00050000-557a-f085-120b-6446c31638c0	3322	Velenje - poštni predali
00050000-557a-f085-5f85-46c684780221	8212	Velika Loka
00050000-557a-f085-eed8-0be94cb35679	2274	Velika Nedelja
00050000-557a-f085-afdc-5d32a40cf749	9225	Velika Polana
00050000-557a-f085-70ee-f3ba72f054ce	1315	Velike Lašče
00050000-557a-f085-0ab3-4ec6a9bf7b1d	8213	Veliki Gaber
00050000-557a-f085-1969-08bd02109fac	9241	Veržej
00050000-557a-f085-9547-7116bee8d839	1312	Videm - Dobrepolje
00050000-557a-f085-b570-8c6aa510a239	2284	Videm pri Ptuju
00050000-557a-f085-2dcb-8ebe76d04393	8344	Vinica
00050000-557a-f085-13e0-b18562cf3ab2	5271	Vipava
00050000-557a-f085-de5e-a2340f95faa3	4212	Visoko
00050000-557a-f085-f6e5-b60f28161e62	1294	Višnja Gora
00050000-557a-f085-496e-990a10e504d8	3205	Vitanje
00050000-557a-f085-22c8-74df37adea38	2255	Vitomarci
00050000-557a-f085-0bb6-2bf611c74ade	1217	Vodice
00050000-557a-f085-9771-eb7436441441	3212	Vojnik\t
00050000-557a-f085-45ab-8f177baf2618	5293	Volčja Draga
00050000-557a-f085-5780-21863759708e	2232	Voličina
00050000-557a-f085-490a-6f6b76de6dcd	3305	Vransko
00050000-557a-f085-8931-69d82bb5f752	6217	Vremski Britof
00050000-557a-f085-079f-1b2f15ad8536	1360	Vrhnika
00050000-557a-f085-b083-7d0885c52afe	2365	Vuhred
00050000-557a-f085-8178-7f0c3ec603a7	2367	Vuzenica
00050000-557a-f085-ed94-8eafed5eefeb	8292	Zabukovje 
00050000-557a-f085-2e23-5c2dfaa974d2	1410	Zagorje ob Savi
00050000-557a-f085-b0fe-1969482cdc19	1303	Zagradec
00050000-557a-f085-e3dd-f9c03d9211a5	2283	Zavrč
00050000-557a-f085-2398-8a97da980997	8272	Zdole 
00050000-557a-f085-be2f-2975ce8052db	4201	Zgornja Besnica
00050000-557a-f085-cdbc-3e6e8184d566	2242	Zgornja Korena
00050000-557a-f085-0853-cd617a24d7b0	2201	Zgornja Kungota
00050000-557a-f085-6903-963a53a45d30	2316	Zgornja Ložnica
00050000-557a-f085-209d-a6f93913e4c5	2314	Zgornja Polskava
00050000-557a-f085-e99f-251312cf1735	2213	Zgornja Velka
00050000-557a-f085-e30d-88645a74eabf	4247	Zgornje Gorje
00050000-557a-f085-0638-d2b3efb490b8	4206	Zgornje Jezersko
00050000-557a-f085-966f-00203db42637	2285	Zgornji Leskovec
00050000-557a-f085-c148-8e552fb5d0dd	1432	Zidani Most
00050000-557a-f085-191c-531f6bd0053c	3214	Zreče
00050000-557a-f085-f5c8-f963cc1db68f	4209	Žabnica
00050000-557a-f085-fbae-9c57ef315ebd	3310	Žalec
00050000-557a-f085-c17e-d9780ea1de41	4228	Železniki
00050000-557a-f085-96dd-56df57292773	2287	Žetale
00050000-557a-f085-6d34-deab8d6bab38	4226	Žiri
00050000-557a-f085-c71e-11ff0d822843	4274	Žirovnica
00050000-557a-f085-d6b8-be4659c6d0e1	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7142074)
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
-- TOC entry 2832 (class 0 OID 7141885)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7141963)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7142086)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7142206)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7142259)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557a-f086-dc47-657dbe10858c	00080000-557a-f086-f0e8-96a85892c9cb	0987	A
00190000-557a-f086-6874-eb3a59bc8664	00080000-557a-f086-0315-8d22990c2246	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7142374)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7142437)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7142387)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7142406)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7142115)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557a-f086-d48b-24d9c4f86059	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557a-f086-f58d-0a3d99257b1d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557a-f086-cc1f-97758f26d6bd	0003	Kazinska	t	84	Kazinska dvorana
00220000-557a-f086-0a2d-ca3d484bf83b	0004	Mali oder	t	24	Mali oder 
00220000-557a-f086-fd9e-1ad5ff701bf7	0005	Komorni oder	t	15	Komorni oder
00220000-557a-f086-22a7-b90dac7ac745	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557a-f086-26cb-73b8afd8e7d5	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7142059)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7142049)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7142248)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7142183)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7141757)
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
-- TOC entry 2857 (class 0 OID 7142125)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7141795)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557a-f085-5a07-66de1e7a255f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557a-f085-7d46-1975d69a9013	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557a-f085-9e2e-31eb758a2e9a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557a-f085-8864-7e62d9861b5f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557a-f085-4f92-77f7cbe08556	planer	Planer dogodkov v koledarju	t
00020000-557a-f085-4102-a1de029ced95	kadrovska	Kadrovska služba	t
00020000-557a-f086-363e-7a2b38aaf105	arhivar	Ažuriranje arhivalij	t
00020000-557a-f086-2312-9a161c983919	igralec	Igralec	t
00020000-557a-f086-e8e4-1fbf9ddbda6f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7141779)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557a-f086-8b33-21a72ab69cbd	00020000-557a-f085-9e2e-31eb758a2e9a
00010000-557a-f086-266b-d940f2157943	00020000-557a-f085-9e2e-31eb758a2e9a
\.


--
-- TOC entry 2859 (class 0 OID 7142139)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7142080)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7142030)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7142470)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557a-f085-51f2-62db7800c0f6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557a-f085-a74f-62c1d444f75e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557a-f085-ff12-4c75e51e34d2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557a-f085-e6d0-2967bcf9dc97	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557a-f085-60c8-e96b13bce8ed	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7142462)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557a-f085-9742-4d3149c32c5c	00230000-557a-f085-e6d0-2967bcf9dc97	popa
00240000-557a-f085-a1ec-06311e25bdf2	00230000-557a-f085-e6d0-2967bcf9dc97	oseba
00240000-557a-f085-83a2-2b2e0ed7a933	00230000-557a-f085-a74f-62c1d444f75e	prostor
00240000-557a-f085-aeea-7063b2bbbc30	00230000-557a-f085-e6d0-2967bcf9dc97	besedilo
00240000-557a-f085-07ba-4907c3574a5e	00230000-557a-f085-e6d0-2967bcf9dc97	uprizoritev
00240000-557a-f085-e1e5-65b496220759	00230000-557a-f085-e6d0-2967bcf9dc97	funkcija
00240000-557a-f085-6a76-38936d1176c0	00230000-557a-f085-e6d0-2967bcf9dc97	tipfunkcije
00240000-557a-f085-fe0e-b285a6ef0ccb	00230000-557a-f085-e6d0-2967bcf9dc97	alternacija
00240000-557a-f085-582d-277a2bffde30	00230000-557a-f085-51f2-62db7800c0f6	pogodba
00240000-557a-f085-5a88-4572590e80e9	00230000-557a-f085-e6d0-2967bcf9dc97	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7142457)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7142193)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7141857)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7142036)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557a-f087-989d-ecf903af3d67	00180000-557a-f087-694b-845fdc919c82	000c0000-557a-f087-2f32-89f0da42f931	00090000-557a-f086-20b6-028dec5e4dca	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-f087-bf1c-8f1b589cda37	00180000-557a-f087-694b-845fdc919c82	000c0000-557a-f087-a1cd-b4ebd7cc6860	00090000-557a-f086-7ed7-53f67c70b59f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-f087-a14d-b7d1cc4596f0	00180000-557a-f087-694b-845fdc919c82	000c0000-557a-f087-6aed-d919fcc89567	00090000-557a-f086-ac67-6a2edc228d13	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-f087-de53-a403919dbdb4	00180000-557a-f087-694b-845fdc919c82	000c0000-557a-f087-8c72-fef9055ac504	00090000-557a-f086-8141-53fd0ffe831c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-f087-bf80-9689322a633c	00180000-557a-f087-694b-845fdc919c82	000c0000-557a-f087-2546-20ab31c3d7bf	00090000-557a-f086-be3b-cc439d25a1b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-f087-7bb2-e0b8936ce43b	00180000-557a-f087-e821-966f0b865f09	\N	00090000-557a-f086-be3b-cc439d25a1b1	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7142237)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557a-f085-66d1-08bbd82e06eb	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557a-f085-b544-c92526d6461b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557a-f085-2a1e-23ba4e6cfa58	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557a-f085-71ac-2d7557144b7d	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557a-f085-53d0-a6324478669e	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557a-f085-1dd1-7cd4c7373ea3	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557a-f085-0461-61bb21467d37	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557a-f085-0482-34b9f287be2d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557a-f085-6e68-587442db430f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557a-f085-b03c-2cbc7ebb1edb	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557a-f085-338e-a7bce7f6b70e	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557a-f085-b2a7-702a8b93c7e8	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557a-f085-ae48-2b3c569634c4	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557a-f085-c504-34836e2797df	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557a-f085-c50d-9f012c1b57f1	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557a-f085-5631-ce20ad6c6d0b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7142426)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557a-f085-bc7d-0a35c8fbf9a2	01	Velika predstava	f	1.00	1.00
002b0000-557a-f085-ae97-2eea6df0d8c9	02	Mala predstava	f	0.50	0.50
002b0000-557a-f085-df7f-b65a4b220db4	03	Mala koprodukcija	t	0.40	1.00
002b0000-557a-f085-fb22-dfe9c39f4c2b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557a-f085-dca0-6fbffe0059f3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7141920)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7141766)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557a-f086-266b-d940f2157943	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROUrYxhVQDGXo0lbbMy5MdKQi5BluU1Fa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557a-f086-ba44-675df83d1727	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557a-f086-a0ac-bd2b0bc18b33	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557a-f086-e1ef-0e1d8381f0fb	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557a-f086-1fa0-5112ce73acf6	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557a-f086-03e5-fd3b4f4a92cd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557a-f086-5af0-0d1756f3111e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557a-f086-8b33-21a72ab69cbd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7142294)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557a-f086-131f-ac6dedd64362	00160000-557a-f086-5016-9a14b886a125	00150000-557a-f085-27fb-dc7e675cd1c8	00140000-557a-f085-1607-3205c9b7229d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557a-f086-fd9e-1ad5ff701bf7
000e0000-557a-f086-64dd-82e8f9e55ba3	00160000-557a-f086-c5e5-b1a5f05d8cfc	00150000-557a-f085-eaa4-a93afeb2afa3	00140000-557a-f085-5dab-a38ba6feb617	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557a-f086-22a7-b90dac7ac745
000e0000-557a-f086-a1ca-40454cdfa38d	\N	00150000-557a-f085-eaa4-a93afeb2afa3	00140000-557a-f085-5dab-a38ba6feb617	00190000-557a-f086-dc47-657dbe10858c	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557a-f086-fd9e-1ad5ff701bf7
000e0000-557a-f086-e1f0-93453ecb27ec	\N	00150000-557a-f085-eaa4-a93afeb2afa3	00140000-557a-f085-5dab-a38ba6feb617	00190000-557a-f086-dc47-657dbe10858c	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557a-f086-fd9e-1ad5ff701bf7
\.


--
-- TOC entry 2840 (class 0 OID 7141982)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557a-f087-6742-5719e7469402	000e0000-557a-f086-64dd-82e8f9e55ba3	1	
00200000-557a-f087-05ba-3517e08739c8	000e0000-557a-f086-64dd-82e8f9e55ba3	2	
\.


--
-- TOC entry 2855 (class 0 OID 7142107)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7142176)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7142014)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7142284)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557a-f085-1607-3205c9b7229d	01	Drama	drama (SURS 01)
00140000-557a-f085-025f-2de913b70475	02	Opera	opera (SURS 02)
00140000-557a-f085-1b8a-2037bc5832e5	03	Balet	balet (SURS 03)
00140000-557a-f085-5405-f834fff4fb70	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557a-f085-c3ef-84564f1641cf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557a-f085-5dab-a38ba6feb617	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557a-f085-b5ae-1f1cd78b245e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7142166)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557a-f085-f8a2-30d5c35e8a7a	01	Opera	opera
00150000-557a-f085-f1bf-e4d4782380e8	02	Opereta	opereta
00150000-557a-f085-7a9f-8f1b14127116	03	Balet	balet
00150000-557a-f085-8b9f-d8cb861aa67a	04	Plesne prireditve	plesne prireditve
00150000-557a-f085-0edd-ab6153cf4622	05	Lutkovno gledališče	lutkovno gledališče
00150000-557a-f085-659e-aea55b495358	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557a-f085-4b18-9855f8113ad6	07	Biografska drama	biografska drama
00150000-557a-f085-27fb-dc7e675cd1c8	08	Komedija	komedija
00150000-557a-f085-ba69-bc45fd71aafe	09	Črna komedija	črna komedija
00150000-557a-f085-664e-c1c3b2f7101c	10	E-igra	E-igra
00150000-557a-f085-eaa4-a93afeb2afa3	11	Kriminalka	kriminalka
00150000-557a-f085-2982-b824a96132ae	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7141820)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7142341)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7142331)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7142236)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7142004)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7142029)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7141946)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7142370)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7142162)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7141980)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7142023)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7141960)
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
-- TOC entry 2495 (class 2606 OID 7142072)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7142099)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7141918)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7141829)
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
-- TOC entry 2410 (class 2606 OID 7141853)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7141809)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7141794)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7142105)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7142138)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7142279)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7141882)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7141906)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7142078)
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
-- TOC entry 2425 (class 2606 OID 7141896)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7141967)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7142090)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7142218)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7142264)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7142385)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7142455)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7142402)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7142423)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7142122)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7142063)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7142054)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7142258)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7142190)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7141765)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7142129)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7141783)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7141803)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7142147)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7142085)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7142035)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7142479)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7142467)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7142461)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7142203)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7141862)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7142045)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7142247)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7142436)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7141931)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7141778)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7142310)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7141989)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7142113)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7142181)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7142018)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7142292)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7142174)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7142011)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7142204)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7142205)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7141884)
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
-- TOC entry 2508 (class 1259 OID 7142106)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7142092)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7142091)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7141990)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7142163)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7142165)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7142164)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7141962)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7141961)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7142281)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7142282)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7142283)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7142425)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7142424)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7142315)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7142312)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7142316)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7142314)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7142313)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7141933)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7141932)
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
-- TOC entry 2408 (class 1259 OID 7141856)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7142130)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7142024)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7141810)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7141811)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7142150)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7142149)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7142148)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7141968)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7141970)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7141969)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7142469)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7142058)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7142056)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7142055)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7142057)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7141784)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7141785)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7142114)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7142079)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7142191)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7142192)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7142371)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7142372)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7142373)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7141898)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7141897)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7141899)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7142456)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7142219)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7142220)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7142345)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7142347)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7142343)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7142346)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7142344)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7142182)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7142067)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7142066)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7142064)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7142065)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7142333)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7142332)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7142386)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7141981)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7141831)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7141830)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7141863)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7141864)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7142048)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7142047)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7142046)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7142405)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7142403)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7142404)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7142013)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7142009)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7142006)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7142007)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7142005)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7142010)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7142008)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7141883)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7141947)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7141949)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7141948)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7141950)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7142073)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7142280)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7142311)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7141854)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7141855)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7142175)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7142480)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7141919)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7142468)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7142124)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7142123)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7142342)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7141907)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7142293)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7142265)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7142266)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7141804)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7142012)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7142616)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7142601)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7142606)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7142626)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7142596)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7142621)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7142611)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7142771)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7142776)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7142531)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7142711)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7142706)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7142701)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7142591)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7142741)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7142751)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7142746)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7142566)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7142561)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7142691)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7142796)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7142801)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7142806)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7142911)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7142906)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7142826)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7142811)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7142831)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7142821)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7142816)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7142556)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7142551)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7142516)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7142511)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7142721)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7142631)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7142491)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7142496)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7142736)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7142731)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7142726)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7142571)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7142581)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7142576)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7142921)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7142666)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7142656)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7142651)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7142661)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7142481)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7142486)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7142716)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7142696)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7142761)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7142766)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7142871)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7142876)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7142881)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7142541)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7142536)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7142546)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7142916)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7142781)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7142786)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7142856)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7142866)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7142846)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7142861)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7142851)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7142756)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7142686)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7142681)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7142671)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7142676)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7142841)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7142836)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7142886)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7142586)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7142791)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7142506)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7142501)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7142521)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7142526)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7142646)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7142641)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7142636)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7142901)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7142891)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7142896)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-12 16:45:27 CEST

--
-- PostgreSQL database dump complete
--

