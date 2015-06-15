--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-15 16:38:51 CEST

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
-- TOC entry 180 (class 1259 OID 7298023)
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
-- TOC entry 227 (class 1259 OID 7298545)
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
-- TOC entry 226 (class 1259 OID 7298528)
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
-- TOC entry 219 (class 1259 OID 7298432)
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
-- TOC entry 194 (class 1259 OID 7298202)
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
-- TOC entry 197 (class 1259 OID 7298236)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7298145)
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
-- TOC entry 228 (class 1259 OID 7298559)
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
-- TOC entry 213 (class 1259 OID 7298362)
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
-- TOC entry 192 (class 1259 OID 7298182)
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
-- TOC entry 196 (class 1259 OID 7298230)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7298162)
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
-- TOC entry 202 (class 1259 OID 7298279)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7298304)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7298119)
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
-- TOC entry 181 (class 1259 OID 7298032)
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
-- TOC entry 182 (class 1259 OID 7298043)
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
-- TOC entry 177 (class 1259 OID 7297997)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7298016)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7298311)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7298342)
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
-- TOC entry 223 (class 1259 OID 7298478)
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
-- TOC entry 184 (class 1259 OID 7298076)
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
-- TOC entry 186 (class 1259 OID 7298111)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7298285)
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
-- TOC entry 185 (class 1259 OID 7298096)
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
-- TOC entry 191 (class 1259 OID 7298174)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7298297)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7298417)
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
-- TOC entry 222 (class 1259 OID 7298470)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7298585)
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
-- TOC entry 233 (class 1259 OID 7298648)
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
-- TOC entry 230 (class 1259 OID 7298598)
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
-- TOC entry 231 (class 1259 OID 7298617)
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
-- TOC entry 209 (class 1259 OID 7298326)
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
-- TOC entry 201 (class 1259 OID 7298270)
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
-- TOC entry 200 (class 1259 OID 7298260)
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
-- TOC entry 221 (class 1259 OID 7298459)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7298394)
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
-- TOC entry 174 (class 1259 OID 7297968)
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
-- TOC entry 173 (class 1259 OID 7297966)
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
-- TOC entry 210 (class 1259 OID 7298336)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7298006)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7297990)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7298350)
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
-- TOC entry 204 (class 1259 OID 7298291)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7298241)
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
-- TOC entry 236 (class 1259 OID 7298681)
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
-- TOC entry 235 (class 1259 OID 7298673)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7298668)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7298404)
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
-- TOC entry 183 (class 1259 OID 7298068)
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
-- TOC entry 199 (class 1259 OID 7298247)
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
-- TOC entry 220 (class 1259 OID 7298448)
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
-- TOC entry 232 (class 1259 OID 7298637)
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
-- TOC entry 188 (class 1259 OID 7298131)
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
-- TOC entry 175 (class 1259 OID 7297977)
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
-- TOC entry 225 (class 1259 OID 7298505)
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
-- TOC entry 193 (class 1259 OID 7298193)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7298318)
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
-- TOC entry 215 (class 1259 OID 7298387)
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
-- TOC entry 195 (class 1259 OID 7298225)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7298495)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7298377)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7297971)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7298023)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7298545)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557e-e37b-6e6f-94efcda773ff	000d0000-557e-e37b-529b-ba4996933b19	\N	00090000-557e-e37a-e438-478cc70805bb	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-e37b-5d03-0db0095835da	000d0000-557e-e37b-d6d8-eb82466e657b	\N	00090000-557e-e37a-a07f-cb4444fdd83e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-e37b-dfbd-07bfd0011682	000d0000-557e-e37b-3975-317e00753e3b	\N	00090000-557e-e37a-3a65-fa3bfc9f6d29	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-e37b-e0ba-750f94347460	000d0000-557e-e37b-df83-873be20d6757	\N	00090000-557e-e37a-62d8-7292c188f463	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-e37b-a4c1-20be152d94b5	000d0000-557e-e37b-3f11-afc44f397a82	\N	00090000-557e-e37a-b368-429f1278ffa4	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557e-e37b-c1b5-70dce24e2e6c	000d0000-557e-e37b-e0cf-8f42555b2319	\N	00090000-557e-e37a-a07f-cb4444fdd83e	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7298528)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7298432)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557e-e37a-7b11-774563099793	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557e-e37a-e148-47bf2802600d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557e-e37a-0d03-9bab371bde13	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7298202)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557e-e37b-5ada-13db5cd014ce	\N	\N	00200000-557e-e37a-ba04-35f0a54edca4	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557e-e37b-2aee-cb11e5660e7c	\N	\N	00200000-557e-e37a-13a6-1d8ca4ec230a	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557e-e37b-9500-df518960aa7f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557e-e37b-ef97-0ef778cfc362	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557e-e37b-dcb4-ee71305d39fa	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7298236)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7298145)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557e-e379-b0a7-ee0245224b9e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557e-e379-91ef-38cc261735a0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557e-e379-6c8e-b64d417f86b3	AL	ALB	008	Albania 	Albanija	\N
00040000-557e-e379-0239-6d5912d7116f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557e-e379-1bd0-bbf94a3f03de	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557e-e379-33b4-26036ecd7980	AD	AND	020	Andorra 	Andora	\N
00040000-557e-e379-aa12-550ac3c0d689	AO	AGO	024	Angola 	Angola	\N
00040000-557e-e379-5cfa-f92449a8f2d7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557e-e379-5997-85a9df989a68	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557e-e379-99d5-0a87c88db9ab	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557e-e379-1aa6-6d5d25511f72	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557e-e379-a355-cb49114a51c4	AM	ARM	051	Armenia 	Armenija	\N
00040000-557e-e379-fff0-e40f4a9071d4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557e-e379-8821-4cae5751859f	AU	AUS	036	Australia 	Avstralija	\N
00040000-557e-e379-6b05-ccb0fbaa2dfa	AT	AUT	040	Austria 	Avstrija	\N
00040000-557e-e379-2c7d-4447af9805d9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557e-e379-b779-8b4d5c91ca64	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557e-e379-875b-1f94d17c5b7a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557e-e379-4107-c8e020393764	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557e-e379-53a6-d4c681e3e612	BB	BRB	052	Barbados 	Barbados	\N
00040000-557e-e379-12da-6e8b874c1b70	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557e-e379-a094-d66548efcd54	BE	BEL	056	Belgium 	Belgija	\N
00040000-557e-e379-9fbb-56941e377f3b	BZ	BLZ	084	Belize 	Belize	\N
00040000-557e-e379-115b-1e7a716c9a0a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557e-e379-a05b-95526ba167a3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557e-e379-7b9e-afc79d423510	BT	BTN	064	Bhutan 	Butan	\N
00040000-557e-e379-521b-fb2a7ba4c0d7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557e-e379-79aa-c3a401e2ce9a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557e-e379-d9ea-bb387284da55	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557e-e379-7d8f-f60e58bdd19e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557e-e379-7b3d-e4f660375467	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557e-e379-0cf7-d39b56dfd9d7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557e-e379-e92c-7f705e481d15	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557e-e379-3042-cb64140b83db	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557e-e379-9b42-e0eef01a871e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557e-e379-0eb6-3eb929ce206f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557e-e379-1285-7f67a7904a3c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557e-e379-337b-7f9847a71198	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557e-e379-0c7c-0dba320f7944	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557e-e379-daf5-441e7f415062	CA	CAN	124	Canada 	Kanada	\N
00040000-557e-e379-3d91-640fe211c413	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557e-e379-33a1-ae137e6989db	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557e-e379-36a0-93685bfd6d09	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557e-e379-8982-dce1f9864992	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557e-e379-0e58-1da5865f5b5d	CL	CHL	152	Chile 	Čile	\N
00040000-557e-e379-626c-150e44008b10	CN	CHN	156	China 	Kitajska	\N
00040000-557e-e379-c739-706a651b5e9d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557e-e379-a31a-3b7e6e2858b0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557e-e379-6bf2-6f69bf2c2d26	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557e-e379-b48a-70908889ecf4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557e-e379-0586-671dcbb2cab5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557e-e379-f75d-1c6415be0c44	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557e-e379-d3a2-e7ebfb42619f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557e-e379-7d40-040b334be8a7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557e-e379-b5e6-59037205f1e2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557e-e379-6a94-e97e875188e1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557e-e379-e282-66558208bf8f	CU	CUB	192	Cuba 	Kuba	\N
00040000-557e-e379-7c71-58b905b80bbb	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557e-e379-457d-682f64688e37	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557e-e379-dc1e-2934e336d294	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557e-e379-5ba5-4869099eeb9e	DK	DNK	208	Denmark 	Danska	\N
00040000-557e-e379-57c5-611563aaef7a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557e-e379-e4c4-7fd1517302cf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557e-e379-1661-c1ee922a349c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557e-e379-ab1a-07d5ff597627	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557e-e379-bcfa-69489d99093b	EG	EGY	818	Egypt 	Egipt	\N
00040000-557e-e379-71ea-346bf8effc66	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557e-e379-28b3-2c45cefb6e09	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557e-e379-5880-792e6c03cc4e	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557e-e379-23be-d5f19e1a00d9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557e-e379-26ea-4b477b72f938	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557e-e379-4ed3-10338c63b0d4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557e-e379-c884-49c04006b495	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557e-e379-85d2-05c45bc54ef4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557e-e379-fc5a-d96ef2ddd78d	FI	FIN	246	Finland 	Finska	\N
00040000-557e-e379-d850-e10b4195a647	FR	FRA	250	France 	Francija	\N
00040000-557e-e379-0dc7-8ddcd47aee9b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557e-e379-5669-7645c13e6d78	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557e-e379-55bb-ebdab04a673a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557e-e379-ac75-b2a5391ac601	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557e-e379-99bf-7743f365d616	GA	GAB	266	Gabon 	Gabon	\N
00040000-557e-e379-9c07-edde29121b19	GM	GMB	270	Gambia 	Gambija	\N
00040000-557e-e379-bec1-08726f0de294	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557e-e379-8b00-cb32cfce03f6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557e-e379-92e0-3ecf4634bf9b	GH	GHA	288	Ghana 	Gana	\N
00040000-557e-e379-84ba-97c0f697f6cd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557e-e379-1101-b6d52cae5c9a	GR	GRC	300	Greece 	Grčija	\N
00040000-557e-e379-39fc-0cb3dee54938	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557e-e379-83a3-41de8aa5cf50	GD	GRD	308	Grenada 	Grenada	\N
00040000-557e-e379-3818-31c78cf9f659	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557e-e379-2dfd-ace93dcc3f4c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557e-e379-92d2-f0f1815716d4	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557e-e379-61c4-9ef9e7be485a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557e-e379-3a01-adad3e057dc0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557e-e379-ebf2-15cd76d5ee5b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557e-e379-3dcb-89f088f775c6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557e-e379-19b9-a5b02847a3b2	HT	HTI	332	Haiti 	Haiti	\N
00040000-557e-e379-53c3-ed38850fa0cd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557e-e379-11f7-7b9efd27423d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557e-e379-4617-397b4b089491	HN	HND	340	Honduras 	Honduras	\N
00040000-557e-e379-17b0-dbdb972ddb1c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557e-e379-6484-ad898ee22f12	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557e-e379-18e5-891fa0ed34fe	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557e-e379-751a-73dc7154c269	IN	IND	356	India 	Indija	\N
00040000-557e-e379-3f4c-16ac326acc20	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557e-e379-4289-cb37343b9bf1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557e-e379-1e7f-17be115da056	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557e-e379-e985-df7959b4b330	IE	IRL	372	Ireland 	Irska	\N
00040000-557e-e379-5237-1e135f526f67	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557e-e379-cf66-3d1abdb4e468	IL	ISR	376	Israel 	Izrael	\N
00040000-557e-e379-7648-51397ae2a1d6	IT	ITA	380	Italy 	Italija	\N
00040000-557e-e379-b01a-d60f3330e8be	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557e-e379-71d2-621d8ede064e	JP	JPN	392	Japan 	Japonska	\N
00040000-557e-e379-3316-34cfab955832	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557e-e379-6554-f3379b52e00c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557e-e379-334d-77f2290ce964	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557e-e379-e77d-bdb2f49e1d8d	KE	KEN	404	Kenya 	Kenija	\N
00040000-557e-e379-7a72-78319bcee0d7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557e-e379-b19e-bb904dfef366	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557e-e379-475a-3fc69aec7b96	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557e-e379-2949-6d0516e4f4a4	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557e-e379-2823-0ef966a09481	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557e-e379-dec8-db7136d256e9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557e-e379-279e-0b32516a4274	LV	LVA	428	Latvia 	Latvija	\N
00040000-557e-e379-7566-a5064f788956	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557e-e379-3694-9ea3fcc7f3e9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557e-e379-4c13-23244e563609	LR	LBR	430	Liberia 	Liberija	\N
00040000-557e-e379-e243-4910fe1a4734	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557e-e379-d973-6e5005cb760a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557e-e379-91d4-2e14d02a02d3	LT	LTU	440	Lithuania 	Litva	\N
00040000-557e-e379-21bc-8dccc7d685c3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557e-e379-f17e-f2c9277f78f7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557e-e379-45b8-a2a2137de103	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557e-e379-a18e-74cab9c04663	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557e-e379-6586-42c95b763e79	MW	MWI	454	Malawi 	Malavi	\N
00040000-557e-e379-1ec7-c3f5b573a095	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557e-e379-cb5c-c43c9c7ec4db	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557e-e379-bb86-77b20ce35642	ML	MLI	466	Mali 	Mali	\N
00040000-557e-e379-7459-557df3c05417	MT	MLT	470	Malta 	Malta	\N
00040000-557e-e379-2428-4dacf0c7dbbc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557e-e379-ec4a-4ca7efbb36e9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557e-e379-8adc-103a15e53d96	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557e-e379-013b-b2a03726f359	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557e-e379-231e-18a2718bfeea	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557e-e379-c6ef-f5cecd97362f	MX	MEX	484	Mexico 	Mehika	\N
00040000-557e-e379-6dbf-56c6f112b30c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557e-e379-245a-999f46ee9222	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557e-e379-fc77-69b2e59f0154	MC	MCO	492	Monaco 	Monako	\N
00040000-557e-e379-e3d5-4a483b1149dc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557e-e379-efa1-cefd9ad69d22	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557e-e379-0756-b8ff2ce1ddde	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557e-e379-1740-01f2c549a87c	MA	MAR	504	Morocco 	Maroko	\N
00040000-557e-e379-9ca2-1ce19881c37b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557e-e379-de1f-1a4d0991d604	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557e-e379-6ac8-4c9df88969a5	NA	NAM	516	Namibia 	Namibija	\N
00040000-557e-e379-8a7a-8d5448fbf3a0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557e-e379-26c7-5d180f434633	NP	NPL	524	Nepal 	Nepal	\N
00040000-557e-e379-f958-29ed58134d5b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557e-e379-9672-1b6387de933f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557e-e379-cd11-a60693471324	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557e-e379-e4bf-ea720896576d	NE	NER	562	Niger 	Niger 	\N
00040000-557e-e379-b9f1-ab0ae6dcb278	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557e-e379-0c73-3df6b9bad8e1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557e-e379-3c26-f86cc0a4cac5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557e-e379-0e70-608916b71a0b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557e-e379-c60e-649292ee3ccf	NO	NOR	578	Norway 	Norveška	\N
00040000-557e-e379-0267-add297bf2ca3	OM	OMN	512	Oman 	Oman	\N
00040000-557e-e379-eea6-4e10ef31e243	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557e-e379-b1c5-4e504962a062	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557e-e379-8f4a-7f24097677ff	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557e-e379-fcd8-846e9f141c06	PA	PAN	591	Panama 	Panama	\N
00040000-557e-e379-7518-f313f305eaeb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557e-e379-440f-df9d40343a58	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557e-e379-77ba-68ab54441ed2	PE	PER	604	Peru 	Peru	\N
00040000-557e-e379-9ed1-e1edfc573121	PH	PHL	608	Philippines 	Filipini	\N
00040000-557e-e379-57cf-77ee3ce7226f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557e-e379-5eb7-32cdbd74051d	PL	POL	616	Poland 	Poljska	\N
00040000-557e-e379-e78c-8e09bc6f59c5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557e-e379-97bb-7234ddf868c4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557e-e379-907e-a9283651a3dd	QA	QAT	634	Qatar 	Katar	\N
00040000-557e-e379-844a-bf2e3900a547	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557e-e379-8e05-7751059a44eb	RO	ROU	642	Romania 	Romunija	\N
00040000-557e-e379-1673-054b5a0422d6	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557e-e379-f627-8a4bdb6b1e24	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557e-e379-449b-f1867c4e2d87	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557e-e379-3548-389a7af595e1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557e-e379-fdd0-09b7e73ff315	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557e-e379-151d-d39a2df0bc15	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557e-e379-70df-2d3d701b438b	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557e-e379-2eba-b6653020fede	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557e-e379-7fc4-5b48d4821dc6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557e-e379-c884-055d521d58ec	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557e-e379-b234-dae44efdce68	SM	SMR	674	San Marino 	San Marino	\N
00040000-557e-e379-f2ee-1f13c4d46b55	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557e-e379-6ebf-8629caac48cd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557e-e379-c01f-a1e3a4266923	SN	SEN	686	Senegal 	Senegal	\N
00040000-557e-e379-934d-05486bf7fd36	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557e-e379-da21-71a1ba532af3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557e-e379-5b66-46169be9e5b6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557e-e379-5362-74bcdb56000a	SG	SGP	702	Singapore 	Singapur	\N
00040000-557e-e379-fa72-6e4009b3dd2e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557e-e379-24d2-0a6cc155cd9d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557e-e379-5b48-8ea01b8b3bec	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557e-e379-5e09-28eadd3f857d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557e-e379-ab18-73de058af960	SO	SOM	706	Somalia 	Somalija	\N
00040000-557e-e379-a218-3e36d27ff8d1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557e-e379-92d6-04745d0cb95c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557e-e379-551e-d58f70d0c041	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557e-e379-4e7b-23113b898f93	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557e-e379-cc07-46096d727f4c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557e-e379-79aa-5a62f1339683	SD	SDN	729	Sudan 	Sudan	\N
00040000-557e-e379-058f-c6f7f598e1e8	SR	SUR	740	Suriname 	Surinam	\N
00040000-557e-e379-1e27-3815332b7148	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557e-e379-a0ac-cf4e38beb938	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557e-e379-08f4-004d8ff2bda4	SE	SWE	752	Sweden 	Švedska	\N
00040000-557e-e379-a391-172cea69b66b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557e-e379-59e1-dac43a9dd3cd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557e-e379-97e8-6505bf41153a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557e-e379-8a97-644a5d82dc9a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557e-e379-3f41-fb78d6f0b3f3	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557e-e379-c162-2221d940eaff	TH	THA	764	Thailand 	Tajska	\N
00040000-557e-e379-1687-1dda1991dc82	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557e-e379-a462-f7eeaaf698cc	TG	TGO	768	Togo 	Togo	\N
00040000-557e-e379-8885-f0cf837a5f2f	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557e-e379-e0a0-a5f86914af20	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557e-e379-820a-73aa995a63dc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557e-e379-630e-590a458ca8cb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557e-e379-a383-fe8b9ac425b1	TR	TUR	792	Turkey 	Turčija	\N
00040000-557e-e379-0132-3dfed877fcdc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557e-e379-835a-c291baa323b1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557e-e379-ecd2-f96ec3d4e52c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557e-e379-9803-56845c0a4106	UG	UGA	800	Uganda 	Uganda	\N
00040000-557e-e379-7240-d196aacf1d56	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557e-e379-b8f8-f08b069bccb7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557e-e379-1b9e-af7516585ed3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557e-e379-e73d-50d319951741	US	USA	840	United States 	Združene države Amerike	\N
00040000-557e-e379-7168-34aab1fd80f7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557e-e379-1d41-39816016c096	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557e-e379-79f0-04b3a657eb56	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557e-e379-0391-82143321a4fc	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557e-e379-1014-6c9e1f007ea9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557e-e379-2c22-75c5d7fb280c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557e-e379-ca42-16b218963a65	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557e-e379-54c0-0122cf158097	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557e-e379-d5e3-3f3669b96d9a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557e-e379-3393-de8f03dc79fd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557e-e379-5e03-2d6d4564a787	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557e-e379-85e8-5d5d55579d4b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557e-e379-d2a6-76cfe2303cd2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7298559)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7298362)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557e-e37b-c030-96796292ec89	000e0000-557e-e37a-f3fa-6349d48092d4	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557e-e379-3ba8-fc74ef3b4ea9
000d0000-557e-e37b-529b-ba4996933b19	000e0000-557e-e37a-f3fa-6349d48092d4	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557e-e379-3ba8-fc74ef3b4ea9
000d0000-557e-e37b-d6d8-eb82466e657b	000e0000-557e-e37a-f3fa-6349d48092d4	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557e-e379-549c-255e19ab8b90
000d0000-557e-e37b-3975-317e00753e3b	000e0000-557e-e37a-f3fa-6349d48092d4	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557e-e379-18c0-f3a610ae3cbe
000d0000-557e-e37b-df83-873be20d6757	000e0000-557e-e37a-f3fa-6349d48092d4	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557e-e379-18c0-f3a610ae3cbe
000d0000-557e-e37b-3f11-afc44f397a82	000e0000-557e-e37a-f3fa-6349d48092d4	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557e-e379-18c0-f3a610ae3cbe
000d0000-557e-e37b-e0cf-8f42555b2319	000e0000-557e-e37a-f3fa-6349d48092d4	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557e-e379-3ba8-fc74ef3b4ea9
\.


--
-- TOC entry 2839 (class 0 OID 7298182)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7298230)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7298162)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557e-e37a-4d54-3d11bf3c68d4	00080000-557e-e37a-af6b-6827cc1febb4	00090000-557e-e37a-e438-478cc70805bb	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7298279)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7298304)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7298119)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557e-e37a-9744-1687226b84f9	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557e-e37a-0b84-e3caffd49910	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557e-e37a-71a4-e8fab78cf61e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557e-e37a-b96d-c487154db6d5	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557e-e37a-c84a-56749562174c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557e-e37a-07c8-1c0a51804d23	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557e-e37a-e71f-29e863fac954	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557e-e37a-4035-869d335adc83	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557e-e37a-44eb-f4f2dd6e1502	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557e-e37a-1937-74131b5cce08	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557e-e37a-f715-a20ad94097db	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557e-e37a-e67c-6c5d5daeb7d8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557e-e37a-4e2b-43ac693aeb6b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557e-e37a-7061-b1e4cc3b53b8	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557e-e37a-8215-d4854ab41feb	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557e-e37a-dc50-a89991f0a730	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7298032)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557e-e37a-de8f-0d49eec7272e	00000000-557e-e37a-c84a-56749562174c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557e-e37a-ab52-ec6bb0497985	00000000-557e-e37a-c84a-56749562174c	00010000-557e-e37a-8744-fc37c68f363b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557e-e37a-c29e-6568879042e6	00000000-557e-e37a-07c8-1c0a51804d23	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7298043)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557e-e37a-c9f2-1759cb3c52ff	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557e-e37a-62d8-7292c188f463	00010000-557e-e37a-d1e8-0c5e8ef747bd	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557e-e37a-3a65-fa3bfc9f6d29	00010000-557e-e37a-6652-c3552abd8a9f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557e-e37a-4e59-5f53366b3d9e	00010000-557e-e37a-4a3d-3d7b94954f40	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557e-e37a-ff68-4dec62936ac9	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557e-e37a-a247-d7ecb44badf1	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557e-e37a-8f91-dd71ba51657d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557e-e37a-7b20-55d13a5e371e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557e-e37a-e438-478cc70805bb	00010000-557e-e37a-c429-014326b37952	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557e-e37a-a07f-cb4444fdd83e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557e-e37a-2f53-e092ef62aecd	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557e-e37a-b368-429f1278ffa4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557e-e37a-168c-f4ff07acbe50	00010000-557e-e37a-cbbe-8200c30b9903	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7297997)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557e-e379-bae1-536d7be9c995	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557e-e379-0dd0-1d9ca1d360b2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557e-e379-2578-5ee9940da91d	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557e-e379-8e30-83cfc7a041f7	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557e-e379-e414-8bda65ceac82	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557e-e379-8e5e-48070bc486ef	Abonma-read	Abonma - branje	f
00030000-557e-e379-1017-23a6724ec8e9	Abonma-write	Abonma - spreminjanje	f
00030000-557e-e379-855d-84a5a284fde5	Alternacija-read	Alternacija - branje	f
00030000-557e-e379-5872-24408cc94a6c	Alternacija-write	Alternacija - spreminjanje	f
00030000-557e-e379-1719-7f481dd22021	Arhivalija-read	Arhivalija - branje	f
00030000-557e-e379-2cc7-2ab1cc53d1e3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557e-e379-40e2-23405335341f	Besedilo-read	Besedilo - branje	f
00030000-557e-e379-354a-3a440ad67406	Besedilo-write	Besedilo - spreminjanje	f
00030000-557e-e379-74a4-9c8b61030d91	DogodekIzven-read	DogodekIzven - branje	f
00030000-557e-e379-f831-db4988be9942	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557e-e379-3310-803003c88874	Dogodek-read	Dogodek - branje	f
00030000-557e-e379-b6fc-0899f8607ae0	Dogodek-write	Dogodek - spreminjanje	f
00030000-557e-e379-0df7-2d3e6f9c2654	Drzava-read	Drzava - branje	f
00030000-557e-e379-ddda-55885365bba4	Drzava-write	Drzava - spreminjanje	f
00030000-557e-e379-14c1-94322f9c9848	Funkcija-read	Funkcija - branje	f
00030000-557e-e379-64b3-0aa7c8269dd8	Funkcija-write	Funkcija - spreminjanje	f
00030000-557e-e379-93c0-f23a4be3e64a	Gostovanje-read	Gostovanje - branje	f
00030000-557e-e379-884c-5706be57193b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557e-e379-4866-1f9eaeedcd34	Gostujoca-read	Gostujoca - branje	f
00030000-557e-e379-7f39-069903267039	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557e-e379-95dd-dc725c9dc488	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557e-e379-12c7-46d73d2346de	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557e-e379-86c6-d280f252eff3	Kupec-read	Kupec - branje	f
00030000-557e-e379-4bd8-55734386ef92	Kupec-write	Kupec - spreminjanje	f
00030000-557e-e379-6a0d-e01c4798d819	NacinPlacina-read	NacinPlacina - branje	f
00030000-557e-e379-fea1-da93294b1ae3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557e-e379-1c1c-8886e5be1288	Option-read	Option - branje	f
00030000-557e-e379-3ce3-44a652ecd390	Option-write	Option - spreminjanje	f
00030000-557e-e379-5208-22de95486a6c	OptionValue-read	OptionValue - branje	f
00030000-557e-e379-0990-db8f53d7974c	OptionValue-write	OptionValue - spreminjanje	f
00030000-557e-e379-ff6c-0b2ee3b2462c	Oseba-read	Oseba - branje	f
00030000-557e-e379-c649-08cc75b62da5	Oseba-write	Oseba - spreminjanje	f
00030000-557e-e379-b2fd-2752df025ad2	Permission-read	Permission - branje	f
00030000-557e-e379-21c6-a238269d0bf9	Permission-write	Permission - spreminjanje	f
00030000-557e-e379-c9b5-dc96e469a71f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557e-e379-bf8e-a137ed9ddc14	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557e-e379-0662-d0f38e1e8503	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557e-e379-5e34-5c7f550d0667	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557e-e379-abf8-b439606342a8	Pogodba-read	Pogodba - branje	f
00030000-557e-e379-4179-3292265a9e73	Pogodba-write	Pogodba - spreminjanje	f
00030000-557e-e379-2583-8a116516bbe5	Popa-read	Popa - branje	f
00030000-557e-e379-1393-9db08c56f745	Popa-write	Popa - spreminjanje	f
00030000-557e-e379-5a47-4fd614750b50	Posta-read	Posta - branje	f
00030000-557e-e379-c403-fccfa9fb440e	Posta-write	Posta - spreminjanje	f
00030000-557e-e379-43f8-97843fea06f2	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557e-e379-edf6-4235892c3bee	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557e-e379-4cb6-ff3e0b8a0495	PostniNaslov-read	PostniNaslov - branje	f
00030000-557e-e379-796d-635465a3c1ce	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557e-e379-e544-10d5c36a2102	Predstava-read	Predstava - branje	f
00030000-557e-e379-770e-c31a1fef5764	Predstava-write	Predstava - spreminjanje	f
00030000-557e-e379-f57c-966270cefce5	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557e-e379-15f3-143843faf284	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557e-e379-4435-5773cc406641	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557e-e379-f3ae-a6e3ce79d095	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557e-e379-85a9-079a789457f8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557e-e379-9d8f-7870c12964d2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557e-e379-06f2-bc9450221816	ProgramDela-read	ProgramDela - branje	f
00030000-557e-e379-aeb7-f5339f3fe120	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557e-e379-2232-607163aa67c1	ProgramFestival-read	ProgramFestival - branje	f
00030000-557e-e379-139c-1d8ef7fad523	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557e-e379-13c9-069be4160ddf	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557e-e379-4752-3dfc198f9302	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557e-e379-ca8b-0f83cf7a2c7f	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557e-e379-cd4c-344edc634272	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557e-e379-f3a4-f4d77bae4fa7	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557e-e379-4f09-8dc4823710f3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557e-e379-dd20-c466dc860620	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557e-e379-4c6e-e6be030b1a55	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557e-e379-92e2-b2a28e360128	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557e-e379-4c93-68c846a1b060	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557e-e379-68a7-c94930abc39d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557e-e379-e018-f22f86237449	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557e-e379-077e-1f029e665ece	ProgramRazno-read	ProgramRazno - branje	f
00030000-557e-e379-f11a-49b60511e2c9	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557e-e379-6ab3-5b4dabe9048f	Prostor-read	Prostor - branje	f
00030000-557e-e379-1ce3-cd78341ee2be	Prostor-write	Prostor - spreminjanje	f
00030000-557e-e379-83d6-40d3a74fac76	Racun-read	Racun - branje	f
00030000-557e-e379-25b3-0048e4a88256	Racun-write	Racun - spreminjanje	f
00030000-557e-e379-91b4-844afad79f92	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557e-e379-473f-0f25ee7d4320	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557e-e379-6f60-60f0cb779443	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557e-e379-f054-b07923981b9a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557e-e379-113e-540f03054c86	Rekvizit-read	Rekvizit - branje	f
00030000-557e-e379-cd26-a205afb95bf0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557e-e379-a69f-62fe4a887689	Revizija-read	Revizija - branje	f
00030000-557e-e379-854e-221ef50938b5	Revizija-write	Revizija - spreminjanje	f
00030000-557e-e379-6a6a-89cc6d01e72a	Rezervacija-read	Rezervacija - branje	f
00030000-557e-e379-2152-775d8b9d47d9	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557e-e379-d630-fe7f5693eec9	Role-read	Role - branje	f
00030000-557e-e379-6b6b-88039e4febd5	Role-write	Role - spreminjanje	f
00030000-557e-e379-f75a-364d4ffb4a75	SedezniRed-read	SedezniRed - branje	f
00030000-557e-e379-b774-c0260a11956a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557e-e379-a2e5-97ea8109c05b	Sedez-read	Sedez - branje	f
00030000-557e-e379-fedc-71b90f19b293	Sedez-write	Sedez - spreminjanje	f
00030000-557e-e379-b1ad-6e789ff7e38b	Sezona-read	Sezona - branje	f
00030000-557e-e379-5460-79bbccf1fa71	Sezona-write	Sezona - spreminjanje	f
00030000-557e-e379-8425-4645d8092fea	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557e-e379-ced5-ee067ae5c0ae	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557e-e379-40a1-195cbd708163	Stevilcenje-read	Stevilcenje - branje	f
00030000-557e-e379-e802-02f92b12bcfe	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557e-e379-e45a-88d740d2d4e6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557e-e379-c0e6-15f8119d6867	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557e-e379-3141-e804859c485a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557e-e379-ef14-d8a19c52915f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557e-e379-fa6f-216db088393b	Telefonska-read	Telefonska - branje	f
00030000-557e-e379-042e-99356a7d2509	Telefonska-write	Telefonska - spreminjanje	f
00030000-557e-e379-cae7-efce3f0b70bb	TerminStoritve-read	TerminStoritve - branje	f
00030000-557e-e379-8e6e-858ae4216ce3	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557e-e379-f714-22e5718dcffd	TipFunkcije-read	TipFunkcije - branje	f
00030000-557e-e379-e69d-6d1d0144757c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557e-e379-b58f-55e8b50414db	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557e-e379-0b61-bc8c984524e2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557e-e379-5dc1-2832f85c127b	Trr-read	Trr - branje	f
00030000-557e-e379-97a6-9417b59eb0cc	Trr-write	Trr - spreminjanje	f
00030000-557e-e379-23f2-880d59fe76cd	Uprizoritev-read	Uprizoritev - branje	f
00030000-557e-e379-feb8-ee2bdb0eedc2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557e-e379-4f26-2c8c516734b8	User-read	User - branje	f
00030000-557e-e379-3a35-b554ad46cd2a	User-write	User - spreminjanje	f
00030000-557e-e379-c669-3198cd8e2a4f	Vaja-read	Vaja - branje	f
00030000-557e-e379-a96e-3ca02515afce	Vaja-write	Vaja - spreminjanje	f
00030000-557e-e379-d8ea-87b612a78ec3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557e-e379-91c6-8a66ac278c67	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557e-e379-a6bd-1fce09eb0b1d	Zaposlitev-read	Zaposlitev - branje	f
00030000-557e-e379-9932-f0303dd0ba91	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557e-e379-9c44-9f0564a9ac4d	Zasedenost-read	Zasedenost - branje	f
00030000-557e-e379-c0f9-aa9a7d9cca6d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557e-e379-1e47-7534b96f54ec	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557e-e379-41cf-b011dbc9fc60	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557e-e379-cc62-a7445d4d9570	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557e-e379-2279-ede8218d9692	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7298016)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557e-e37a-3ff7-0a76b60a0cbe	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-8e5e-48070bc486ef
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1017-23a6724ec8e9
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-855d-84a5a284fde5
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-5872-24408cc94a6c
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1719-7f481dd22021
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-3310-803003c88874
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-8e30-83cfc7a041f7
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-b6fc-0899f8607ae0
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-ddda-55885365bba4
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-14c1-94322f9c9848
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-64b3-0aa7c8269dd8
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-93c0-f23a4be3e64a
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-884c-5706be57193b
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-4866-1f9eaeedcd34
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-7f39-069903267039
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-95dd-dc725c9dc488
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-12c7-46d73d2346de
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1c1c-8886e5be1288
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-5208-22de95486a6c
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-ff6c-0b2ee3b2462c
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-c649-08cc75b62da5
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-2583-8a116516bbe5
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1393-9db08c56f745
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-5a47-4fd614750b50
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-c403-fccfa9fb440e
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-4cb6-ff3e0b8a0495
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-796d-635465a3c1ce
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-e544-10d5c36a2102
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-770e-c31a1fef5764
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-85a9-079a789457f8
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-9d8f-7870c12964d2
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-6ab3-5b4dabe9048f
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1ce3-cd78341ee2be
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-6f60-60f0cb779443
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-f054-b07923981b9a
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-113e-540f03054c86
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-cd26-a205afb95bf0
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-b1ad-6e789ff7e38b
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-5460-79bbccf1fa71
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-f714-22e5718dcffd
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-23f2-880d59fe76cd
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-feb8-ee2bdb0eedc2
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-c669-3198cd8e2a4f
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-a96e-3ca02515afce
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-9c44-9f0564a9ac4d
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-c0f9-aa9a7d9cca6d
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-1e47-7534b96f54ec
00020000-557e-e37a-2a53-8ca7e46f52cc	00030000-557e-e379-cc62-a7445d4d9570
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-8e5e-48070bc486ef
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-1719-7f481dd22021
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-3310-803003c88874
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-93c0-f23a4be3e64a
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-4866-1f9eaeedcd34
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-95dd-dc725c9dc488
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-12c7-46d73d2346de
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-1c1c-8886e5be1288
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-5208-22de95486a6c
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-ff6c-0b2ee3b2462c
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-c649-08cc75b62da5
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-2583-8a116516bbe5
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-5a47-4fd614750b50
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-4cb6-ff3e0b8a0495
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-796d-635465a3c1ce
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-e544-10d5c36a2102
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-6ab3-5b4dabe9048f
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-6f60-60f0cb779443
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-113e-540f03054c86
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-b1ad-6e789ff7e38b
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-fa6f-216db088393b
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-042e-99356a7d2509
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-5dc1-2832f85c127b
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-97a6-9417b59eb0cc
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-a6bd-1fce09eb0b1d
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-9932-f0303dd0ba91
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-1e47-7534b96f54ec
00020000-557e-e37a-83e5-59b39793d94e	00030000-557e-e379-cc62-a7445d4d9570
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-8e5e-48070bc486ef
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-855d-84a5a284fde5
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-1719-7f481dd22021
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-2cc7-2ab1cc53d1e3
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-40e2-23405335341f
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-74a4-9c8b61030d91
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-3310-803003c88874
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-14c1-94322f9c9848
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-93c0-f23a4be3e64a
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-4866-1f9eaeedcd34
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-95dd-dc725c9dc488
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-1c1c-8886e5be1288
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-5208-22de95486a6c
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-ff6c-0b2ee3b2462c
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-2583-8a116516bbe5
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-5a47-4fd614750b50
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-e544-10d5c36a2102
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-85a9-079a789457f8
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-6ab3-5b4dabe9048f
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-6f60-60f0cb779443
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-113e-540f03054c86
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-b1ad-6e789ff7e38b
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-f714-22e5718dcffd
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-c669-3198cd8e2a4f
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-9c44-9f0564a9ac4d
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-1e47-7534b96f54ec
00020000-557e-e37a-799a-41a58e1dc662	00030000-557e-e379-cc62-a7445d4d9570
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-8e5e-48070bc486ef
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-1017-23a6724ec8e9
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-5872-24408cc94a6c
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-1719-7f481dd22021
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-3310-803003c88874
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-93c0-f23a4be3e64a
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-4866-1f9eaeedcd34
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-1c1c-8886e5be1288
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-5208-22de95486a6c
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-2583-8a116516bbe5
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-5a47-4fd614750b50
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-e544-10d5c36a2102
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-6ab3-5b4dabe9048f
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-6f60-60f0cb779443
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-113e-540f03054c86
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-b1ad-6e789ff7e38b
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-f714-22e5718dcffd
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-1e47-7534b96f54ec
00020000-557e-e37a-139b-8edac8617ed5	00030000-557e-e379-cc62-a7445d4d9570
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-8e5e-48070bc486ef
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-1719-7f481dd22021
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-3310-803003c88874
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-0df7-2d3e6f9c2654
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-93c0-f23a4be3e64a
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-4866-1f9eaeedcd34
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-1c1c-8886e5be1288
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-5208-22de95486a6c
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-2583-8a116516bbe5
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-5a47-4fd614750b50
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-e544-10d5c36a2102
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-6ab3-5b4dabe9048f
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-6f60-60f0cb779443
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-113e-540f03054c86
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-b1ad-6e789ff7e38b
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-cae7-efce3f0b70bb
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-2578-5ee9940da91d
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-f714-22e5718dcffd
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-1e47-7534b96f54ec
00020000-557e-e37a-cd9c-256302686f74	00030000-557e-e379-cc62-a7445d4d9570
\.


--
-- TOC entry 2854 (class 0 OID 7298311)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7298342)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7298478)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7298076)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557e-e37a-af6b-6827cc1febb4	00040000-557e-e379-b0a7-ee0245224b9e	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-e37a-0d08-9eef77f1af69	00040000-557e-e379-b0a7-ee0245224b9e	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-e37a-0c64-ee9a1464d51a	00040000-557e-e379-b0a7-ee0245224b9e	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557e-e37a-4c2a-9f715f9e40d8	00040000-557e-e379-b0a7-ee0245224b9e	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7298111)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557e-e379-a909-5d5f35c145ed	8341	Adlešiči
00050000-557e-e379-f9a1-2f26bb9a7fb4	5270	Ajdovščina
00050000-557e-e379-2b4a-f517c9afb8af	6280	Ankaran/Ancarano
00050000-557e-e379-90c9-bd224a54e94c	9253	Apače
00050000-557e-e379-5f17-13a6865b2319	8253	Artiče
00050000-557e-e379-d793-c2ce2a641220	4275	Begunje na Gorenjskem
00050000-557e-e379-c94d-674439a85b5d	1382	Begunje pri Cerknici
00050000-557e-e379-a4d4-95af698999b5	9231	Beltinci
00050000-557e-e379-25e5-514963e631f2	2234	Benedikt
00050000-557e-e379-44b9-4d6fcb6b6ff3	2345	Bistrica ob Dravi
00050000-557e-e379-b229-c6f44b0724f7	3256	Bistrica ob Sotli
00050000-557e-e379-f053-5d7202159dab	8259	Bizeljsko
00050000-557e-e379-d315-852de41a7385	1223	Blagovica
00050000-557e-e379-f6db-e18f658186fb	8283	Blanca
00050000-557e-e379-767d-3993bf328fcc	4260	Bled
00050000-557e-e379-b707-30ee3bdeda2b	4273	Blejska Dobrava
00050000-557e-e379-841b-35f046c058ce	9265	Bodonci
00050000-557e-e379-abed-44165d3d0408	9222	Bogojina
00050000-557e-e379-805d-380b17b5e39e	4263	Bohinjska Bela
00050000-557e-e379-cbd6-ed849e345c71	4264	Bohinjska Bistrica
00050000-557e-e379-6452-df8645b26cdf	4265	Bohinjsko jezero
00050000-557e-e379-ff76-3a3f5a28ad02	1353	Borovnica
00050000-557e-e379-c68a-ba73d8ab355c	8294	Boštanj
00050000-557e-e379-5af4-19e7135fa53f	5230	Bovec
00050000-557e-e379-cdff-276c74ddd18e	5295	Branik
00050000-557e-e379-390b-e9b2c5d60b7b	3314	Braslovče
00050000-557e-e379-9248-29d1755aba62	5223	Breginj
00050000-557e-e379-2c07-d0305ce5610f	8280	Brestanica
00050000-557e-e379-92c9-9f202a549c11	2354	Bresternica
00050000-557e-e379-b195-0590595d7ebe	4243	Brezje
00050000-557e-e379-b385-e57b68754941	1351	Brezovica pri Ljubljani
00050000-557e-e379-c19e-729978cd6a06	8250	Brežice
00050000-557e-e379-9ff9-a540c6a3686a	4210	Brnik - Aerodrom
00050000-557e-e379-d3ad-1549312945f4	8321	Brusnice
00050000-557e-e379-6320-e529d5ecaa51	3255	Buče
00050000-557e-e379-fccf-ec712dbd0ef9	8276	Bučka 
00050000-557e-e379-323d-7032675cbdd3	9261	Cankova
00050000-557e-e379-2a02-ae10f0ee6261	3000	Celje 
00050000-557e-e379-612d-b4464270ffd2	3001	Celje - poštni predali
00050000-557e-e379-c90d-e6710cf4ec7c	4207	Cerklje na Gorenjskem
00050000-557e-e379-d8b3-d07609dd60d8	8263	Cerklje ob Krki
00050000-557e-e379-c606-fed6cbfd9faa	1380	Cerknica
00050000-557e-e379-62c4-90809d143d0c	5282	Cerkno
00050000-557e-e379-0170-e105e7e4779b	2236	Cerkvenjak
00050000-557e-e379-4cf0-cfb29a952baa	2215	Ceršak
00050000-557e-e379-400b-014c9e377355	2326	Cirkovce
00050000-557e-e379-8786-9531273161ab	2282	Cirkulane
00050000-557e-e379-e6f9-def444f34972	5273	Col
00050000-557e-e379-90a0-d5f7f87c00b7	8251	Čatež ob Savi
00050000-557e-e379-8943-0e3bfd71da36	1413	Čemšenik
00050000-557e-e379-b9e0-4039a4ebe5c7	5253	Čepovan
00050000-557e-e379-ff35-4f6a44ba5d33	9232	Črenšovci
00050000-557e-e379-d2e0-247ea7fe5b87	2393	Črna na Koroškem
00050000-557e-e379-a934-1fe1329b3875	6275	Črni Kal
00050000-557e-e379-18bf-f037cc2dc79e	5274	Črni Vrh nad Idrijo
00050000-557e-e379-4499-8183255a3f3c	5262	Črniče
00050000-557e-e379-16f0-b852f54cf2fd	8340	Črnomelj
00050000-557e-e379-d6ae-28b5da2247ec	6271	Dekani
00050000-557e-e379-d3c6-c28df078e9d1	5210	Deskle
00050000-557e-e379-26ea-108fdc947abf	2253	Destrnik
00050000-557e-e379-5290-eccdb6160dff	6215	Divača
00050000-557e-e379-4ef4-d4d925b4c7c9	1233	Dob
00050000-557e-e379-8593-2b8a4a599109	3224	Dobje pri Planini
00050000-557e-e379-da6d-eceaf828f2f1	8257	Dobova
00050000-557e-e379-8bae-3d9e7c53a60e	1423	Dobovec
00050000-557e-e379-b6e1-605c1f73e283	5263	Dobravlje
00050000-557e-e379-cc04-fef4529a5b20	3204	Dobrna
00050000-557e-e379-dadd-2921f455fbc2	8211	Dobrnič
00050000-557e-e379-378a-86f764630049	1356	Dobrova
00050000-557e-e379-4b35-7115a6c66bb7	9223	Dobrovnik/Dobronak 
00050000-557e-e379-4734-644f16d0606f	5212	Dobrovo v Brdih
00050000-557e-e379-1609-ca42b4d93a00	1431	Dol pri Hrastniku
00050000-557e-e379-f646-ff0c0bf049c0	1262	Dol pri Ljubljani
00050000-557e-e379-e734-f1f747ec61f0	1273	Dole pri Litiji
00050000-557e-e379-f93e-07591f1cb8fa	1331	Dolenja vas
00050000-557e-e379-a397-81c57a7da6ad	8350	Dolenjske Toplice
00050000-557e-e379-2296-ce00de852d14	1230	Domžale
00050000-557e-e379-dd0e-8c943c012707	2252	Dornava
00050000-557e-e379-7b2b-d51f8cb4bfbc	5294	Dornberk
00050000-557e-e379-0991-24f6b316e944	1319	Draga
00050000-557e-e379-4ea6-5f22604a7228	8343	Dragatuš
00050000-557e-e379-c658-1f648aa7919b	3222	Dramlje
00050000-557e-e379-554f-2b348cd35211	2370	Dravograd
00050000-557e-e379-f178-18a40348882d	4203	Duplje
00050000-557e-e379-7cca-3cc897e6808f	6221	Dutovlje
00050000-557e-e379-836f-23164a9b4cd8	8361	Dvor
00050000-557e-e379-3d01-aeb061f8f7d2	2343	Fala
00050000-557e-e379-ea83-a589e2447902	9208	Fokovci
00050000-557e-e379-cb71-1b581432f0fc	2313	Fram
00050000-557e-e379-324d-11857a253bd8	3213	Frankolovo
00050000-557e-e379-8a1e-8745de1d138f	1274	Gabrovka
00050000-557e-e379-8b83-eb93f960532d	8254	Globoko
00050000-557e-e379-3d9e-aed99fab7938	5275	Godovič
00050000-557e-e379-5ddb-9c823eb62bc4	4204	Golnik
00050000-557e-e379-93da-28c210b7cafc	3303	Gomilsko
00050000-557e-e379-bbde-f84f1b1cc12a	4224	Gorenja vas
00050000-557e-e379-bd3b-2e0bd5e81a1f	3263	Gorica pri Slivnici
00050000-557e-e379-407e-d0f5a9bad5d9	2272	Gorišnica
00050000-557e-e379-8801-eb8b21f5f5a1	9250	Gornja Radgona
00050000-557e-e379-f4f8-a118a88022a9	3342	Gornji Grad
00050000-557e-e379-473c-8eb769305675	4282	Gozd Martuljek
00050000-557e-e379-e1ca-8bf39ea68a97	6272	Gračišče
00050000-557e-e379-9af0-303226b21e72	9264	Grad
00050000-557e-e379-4e21-e38cd1e61e57	8332	Gradac
00050000-557e-e379-7c76-4aebfa05ae5c	1384	Grahovo
00050000-557e-e379-f25d-e1ef5541c381	5242	Grahovo ob Bači
00050000-557e-e379-afe9-e656abf084a1	5251	Grgar
00050000-557e-e379-3fd8-7a344d833483	3302	Griže
00050000-557e-e379-49a3-7b54a162af17	3231	Grobelno
00050000-557e-e379-6d16-070e5496cb3a	1290	Grosuplje
00050000-557e-e379-6945-777733b5e105	2288	Hajdina
00050000-557e-e379-b5d0-3baa37dc32de	8362	Hinje
00050000-557e-e379-600e-f928e89e48cf	2311	Hoče
00050000-557e-e379-8db7-c05761a3a3b5	9205	Hodoš/Hodos
00050000-557e-e379-a8f6-f15ac4bebc41	1354	Horjul
00050000-557e-e379-613e-bc85464875bb	1372	Hotedršica
00050000-557e-e379-a046-398523b53f9a	1430	Hrastnik
00050000-557e-e379-4af8-ab870b9f2aa4	6225	Hruševje
00050000-557e-e379-99ab-b387d0c4cd78	4276	Hrušica
00050000-557e-e379-706a-9d69a18e4e14	5280	Idrija
00050000-557e-e379-011c-c1337151a32a	1292	Ig
00050000-557e-e379-b607-4c874f855363	6250	Ilirska Bistrica
00050000-557e-e379-8b51-171cfc892f04	6251	Ilirska Bistrica-Trnovo
00050000-557e-e379-3aa2-014955f95bc7	1295	Ivančna Gorica
00050000-557e-e379-d236-dde099fcc367	2259	Ivanjkovci
00050000-557e-e379-1e7d-a939ee295d08	1411	Izlake
00050000-557e-e379-c1c8-4b2610692892	6310	Izola/Isola
00050000-557e-e379-9506-71797b4c35d6	2222	Jakobski Dol
00050000-557e-e379-ae95-ecbd6e373cb0	2221	Jarenina
00050000-557e-e379-730c-9613fd51936f	6254	Jelšane
00050000-557e-e379-0714-54ad0588a4db	4270	Jesenice
00050000-557e-e379-6439-961f2f0239d6	8261	Jesenice na Dolenjskem
00050000-557e-e379-18c3-aab6236641ed	3273	Jurklošter
00050000-557e-e379-2329-51e7ac509ac5	2223	Jurovski Dol
00050000-557e-e379-f0fa-810da64f2ba1	2256	Juršinci
00050000-557e-e379-5135-fc241fad4888	5214	Kal nad Kanalom
00050000-557e-e379-8512-83c7defce0e4	3233	Kalobje
00050000-557e-e379-e36b-3ab8c88b768c	4246	Kamna Gorica
00050000-557e-e379-20dc-a5dede6e3400	2351	Kamnica
00050000-557e-e379-6866-2c2289ea25d8	1241	Kamnik
00050000-557e-e379-832c-abd164a4c5a5	5213	Kanal
00050000-557e-e379-66f0-c1dd9beecfca	8258	Kapele
00050000-557e-e379-81b0-b9c77a76d9fe	2362	Kapla
00050000-557e-e379-35a7-9a8a8f4d5d9a	2325	Kidričevo
00050000-557e-e379-b2cc-42cd460a840f	1412	Kisovec
00050000-557e-e379-473d-df0c5e82ec75	6253	Knežak
00050000-557e-e379-415e-548f580f0dcd	5222	Kobarid
00050000-557e-e379-a6e5-29f82231d63e	9227	Kobilje
00050000-557e-e379-eaf4-8dc634e7f604	1330	Kočevje
00050000-557e-e379-155b-074a5813903d	1338	Kočevska Reka
00050000-557e-e379-dd18-cf3bc521c65b	2276	Kog
00050000-557e-e379-2b56-02423bff61c8	5211	Kojsko
00050000-557e-e379-d1f6-306a57a01e09	6223	Komen
00050000-557e-e379-3f8e-3b862e44f7a4	1218	Komenda
00050000-557e-e379-e728-00bdedde0a16	6000	Koper/Capodistria 
00050000-557e-e379-34e3-c1edf6ce0a15	6001	Koper/Capodistria - poštni predali
00050000-557e-e379-86dc-78e67306560d	8282	Koprivnica
00050000-557e-e379-ec7a-c5216aff172c	5296	Kostanjevica na Krasu
00050000-557e-e379-870a-e8a233678be3	8311	Kostanjevica na Krki
00050000-557e-e379-5d85-9ee1e4827ed8	1336	Kostel
00050000-557e-e379-dfd2-0d0228229d5e	6256	Košana
00050000-557e-e379-0cea-a79e2b082073	2394	Kotlje
00050000-557e-e379-34d8-ccb1a74d5983	6240	Kozina
00050000-557e-e379-0250-a0982b4a2093	3260	Kozje
00050000-557e-e379-d6f9-a8a1c9757746	4000	Kranj 
00050000-557e-e379-5b35-fb5e65098e2d	4001	Kranj - poštni predali
00050000-557e-e379-3ba1-633cb22f5eb7	4280	Kranjska Gora
00050000-557e-e379-38c1-dd7ddca78280	1281	Kresnice
00050000-557e-e379-01cc-53ec344f1567	4294	Križe
00050000-557e-e379-ace7-f8a141103f82	9206	Križevci
00050000-557e-e379-8c86-30581736f9bb	9242	Križevci pri Ljutomeru
00050000-557e-e379-dcdf-0e6f14970878	1301	Krka
00050000-557e-e379-aa81-2b3acc919f5f	8296	Krmelj
00050000-557e-e379-9234-d97c6a9b1dfb	4245	Kropa
00050000-557e-e379-1c9e-39c902379992	8262	Krška vas
00050000-557e-e379-a944-1127169588c7	8270	Krško
00050000-557e-e379-4924-bd4a64bd1de5	9263	Kuzma
00050000-557e-e379-345d-c96e29c67405	2318	Laporje
00050000-557e-e379-25a2-aa4ebaada833	3270	Laško
00050000-557e-e379-8223-d5dfbd33db38	1219	Laze v Tuhinju
00050000-557e-e379-24b4-36e1bee01060	2230	Lenart v Slovenskih goricah
00050000-557e-e379-eae4-6f64383a5e0c	9220	Lendava/Lendva
00050000-557e-e379-9c67-91fe344f01e9	4248	Lesce
00050000-557e-e379-450a-2d80f139b6c4	3261	Lesično
00050000-557e-e379-62e7-1b022822cade	8273	Leskovec pri Krškem
00050000-557e-e379-69ff-118392737b7a	2372	Libeliče
00050000-557e-e379-1930-d76a1033ec31	2341	Limbuš
00050000-557e-e379-f183-f15c394b696c	1270	Litija
00050000-557e-e379-d7ec-d773cc34dce4	3202	Ljubečna
00050000-557e-e379-c240-c52862bcb1d4	1000	Ljubljana 
00050000-557e-e379-9d60-c4404ef1442c	1001	Ljubljana - poštni predali
00050000-557e-e379-8cd3-6c22f6f373c9	1231	Ljubljana - Črnuče
00050000-557e-e379-c4b5-1380d466a242	1261	Ljubljana - Dobrunje
00050000-557e-e379-2b0d-5f955f5ce171	1260	Ljubljana - Polje
00050000-557e-e379-f46d-ab1e62e4a611	1210	Ljubljana - Šentvid
00050000-557e-e379-4c10-b858884a75c0	1211	Ljubljana - Šmartno
00050000-557e-e379-4cbd-8b69dc184707	3333	Ljubno ob Savinji
00050000-557e-e379-80b1-c5d9dc82007a	9240	Ljutomer
00050000-557e-e379-2979-66ab97fef97a	3215	Loče
00050000-557e-e379-7f57-39040f1ffc44	5231	Log pod Mangartom
00050000-557e-e379-7eae-f68fbcf923d2	1358	Log pri Brezovici
00050000-557e-e379-6cbd-feafce18118d	1370	Logatec
00050000-557e-e379-3b33-bfcf6c27cedf	1371	Logatec
00050000-557e-e379-f82c-93b539933a02	1434	Loka pri Zidanem Mostu
00050000-557e-e379-5150-0c38692bfe97	3223	Loka pri Žusmu
00050000-557e-e379-ef53-3887b6283002	6219	Lokev
00050000-557e-e379-7470-685944fa5f48	1318	Loški Potok
00050000-557e-e379-6e49-36a3ab670bd8	2324	Lovrenc na Dravskem polju
00050000-557e-e379-8fec-7b134c8329a8	2344	Lovrenc na Pohorju
00050000-557e-e379-d9f1-1c3ff4a84957	3334	Luče
00050000-557e-e379-d4e6-0a42051f516f	1225	Lukovica
00050000-557e-e379-19c4-0a3729114ecd	9202	Mačkovci
00050000-557e-e379-8245-499916920fbb	2322	Majšperk
00050000-557e-e379-db72-f59c9a9dccb5	2321	Makole
00050000-557e-e379-91b4-7c4970f5622b	9243	Mala Nedelja
00050000-557e-e379-9a07-eafd3fbbf7f2	2229	Malečnik
00050000-557e-e379-fdf5-9d985dfd723e	6273	Marezige
00050000-557e-e379-bbf1-f0a67b28e11e	2000	Maribor 
00050000-557e-e379-3951-e3d605deae0c	2001	Maribor - poštni predali
00050000-557e-e379-b69e-07374fb674f6	2206	Marjeta na Dravskem polju
00050000-557e-e379-6278-4a1fcdbdb299	2281	Markovci
00050000-557e-e379-725f-326079cd36d1	9221	Martjanci
00050000-557e-e379-3985-2afac12d5220	6242	Materija
00050000-557e-e379-e13e-d9e8604f1fcc	4211	Mavčiče
00050000-557e-e379-7098-b6e16f684b46	1215	Medvode
00050000-557e-e379-65aa-9ddf91a32931	1234	Mengeš
00050000-557e-e379-b463-4d67009f376f	8330	Metlika
00050000-557e-e379-ec91-407b34b8f882	2392	Mežica
00050000-557e-e379-b5b5-a9d2d17f835e	2204	Miklavž na Dravskem polju
00050000-557e-e379-261a-7269355ea538	2275	Miklavž pri Ormožu
00050000-557e-e379-7488-c7adc652ff76	5291	Miren
00050000-557e-e379-a1f2-6f4b87961550	8233	Mirna
00050000-557e-e379-df91-25bbf73fd216	8216	Mirna Peč
00050000-557e-e379-44eb-ed71cdff4820	2382	Mislinja
00050000-557e-e379-45d9-6f34f07f769a	4281	Mojstrana
00050000-557e-e379-b953-e6e8a1534000	8230	Mokronog
00050000-557e-e379-b890-6e2e1ef5a600	1251	Moravče
00050000-557e-e379-9ddb-b44c879ebfd5	9226	Moravske Toplice
00050000-557e-e379-6e1c-3ff07629e319	5216	Most na Soči
00050000-557e-e379-46a4-adfc16c0d78a	1221	Motnik
00050000-557e-e379-6718-9dbde6798e08	3330	Mozirje
00050000-557e-e379-14a0-efaf88e05484	9000	Murska Sobota 
00050000-557e-e379-d79e-38d2a1d31503	9001	Murska Sobota - poštni predali
00050000-557e-e379-b34e-d79cb003aba5	2366	Muta
00050000-557e-e379-83ad-a9a2dd78b2d1	4202	Naklo
00050000-557e-e379-3435-ab1ee7070176	3331	Nazarje
00050000-557e-e379-d736-7d2fd83e4cc8	1357	Notranje Gorice
00050000-557e-e379-e66a-d638ff8df68f	3203	Nova Cerkev
00050000-557e-e379-4ad9-dd113cc963a8	5000	Nova Gorica 
00050000-557e-e379-68ad-6ce4a4e780a8	5001	Nova Gorica - poštni predali
00050000-557e-e379-ba54-bccfbcbc6298	1385	Nova vas
00050000-557e-e379-6eb9-3be6c5c291b0	8000	Novo mesto
00050000-557e-e379-eac0-6503f8566560	8001	Novo mesto - poštni predali
00050000-557e-e379-daca-5333e35c3f54	6243	Obrov
00050000-557e-e379-a6c3-d5ed6fa493a3	9233	Odranci
00050000-557e-e379-499f-5152ad376f41	2317	Oplotnica
00050000-557e-e379-b7ed-9b2e091344a4	2312	Orehova vas
00050000-557e-e379-ffec-778f6c72c2f1	2270	Ormož
00050000-557e-e379-c222-fd3c7d5a0957	1316	Ortnek
00050000-557e-e379-4218-2a25744a34b0	1337	Osilnica
00050000-557e-e379-a366-0999ea03b60f	8222	Otočec
00050000-557e-e379-fb93-05f145af91ef	2361	Ožbalt
00050000-557e-e379-31cc-6fb42bf3fee5	2231	Pernica
00050000-557e-e379-6f55-e11b546c130a	2211	Pesnica pri Mariboru
00050000-557e-e379-7400-c1cd5b1dd712	9203	Petrovci
00050000-557e-e379-eb6f-e80fd9fcf9a8	3301	Petrovče
00050000-557e-e379-2fdc-e0915371df09	6330	Piran/Pirano
00050000-557e-e379-29cf-b5c099535171	8255	Pišece
00050000-557e-e379-8e73-a9dfc1fe13c1	6257	Pivka
00050000-557e-e379-0d08-132e29a4cd8c	6232	Planina
00050000-557e-e379-d7df-f93a2a704639	3225	Planina pri Sevnici
00050000-557e-e379-3a93-d0997e14356d	6276	Pobegi
00050000-557e-e379-ae79-6fa16f1bec5d	8312	Podbočje
00050000-557e-e379-9ed0-7286a6af000d	5243	Podbrdo
00050000-557e-e379-58b5-2978a4074dbb	3254	Podčetrtek
00050000-557e-e379-c817-e89a501693cb	2273	Podgorci
00050000-557e-e379-3092-e04808efb244	6216	Podgorje
00050000-557e-e379-fdee-526e8fa4f541	2381	Podgorje pri Slovenj Gradcu
00050000-557e-e379-d43e-35aa8f207126	6244	Podgrad
00050000-557e-e379-0d56-c864ac19ed3d	1414	Podkum
00050000-557e-e379-9bec-2221d47a58bb	2286	Podlehnik
00050000-557e-e379-d891-d8f37cf1ea09	5272	Podnanos
00050000-557e-e379-8315-21676836ac31	4244	Podnart
00050000-557e-e379-4a06-4a7a1fc1da41	3241	Podplat
00050000-557e-e379-e16a-2f834eef2f86	3257	Podsreda
00050000-557e-e379-88ca-8936d499abb9	2363	Podvelka
00050000-557e-e379-8d2f-881e58e52802	2208	Pohorje
00050000-557e-e379-a444-6d72fa326172	2257	Polenšak
00050000-557e-e379-c77d-54e80eee4b3a	1355	Polhov Gradec
00050000-557e-e379-d4a8-8eb801255e8a	4223	Poljane nad Škofjo Loko
00050000-557e-e379-529c-e42fb0aa93fc	2319	Poljčane
00050000-557e-e379-f3ce-aa4a12201145	1272	Polšnik
00050000-557e-e379-9cc8-636a51cd8151	3313	Polzela
00050000-557e-e379-9fe1-daca19a76472	3232	Ponikva
00050000-557e-e379-c7cb-be9aa7fb6bc2	6320	Portorož/Portorose
00050000-557e-e379-e275-e83a434e55c1	6230	Postojna
00050000-557e-e379-e071-f828f20cb5d0	2331	Pragersko
00050000-557e-e379-0b59-023a21ef6269	3312	Prebold
00050000-557e-e379-6f30-4a675b134a22	4205	Preddvor
00050000-557e-e379-01a6-b7305413e0f7	6255	Prem
00050000-557e-e379-2067-25622bb20c94	1352	Preserje
00050000-557e-e379-800e-e2ade7176c1c	6258	Prestranek
00050000-557e-e379-beb0-c4158a34f6e0	2391	Prevalje
00050000-557e-e379-3025-56ae702d770c	3262	Prevorje
00050000-557e-e379-286c-795dc9ca37ca	1276	Primskovo 
00050000-557e-e379-c0ed-348c0284aefa	3253	Pristava pri Mestinju
00050000-557e-e379-cc4b-907c383dd4ef	9207	Prosenjakovci/Partosfalva
00050000-557e-e379-0a6e-f37aae5d0301	5297	Prvačina
00050000-557e-e379-db4d-5eec9f8512d9	2250	Ptuj
00050000-557e-e379-51d8-dd643e0f9fe5	2323	Ptujska Gora
00050000-557e-e379-3478-68bc9b9a037d	9201	Puconci
00050000-557e-e379-221e-4c8f01f8c34b	2327	Rače
00050000-557e-e379-d325-a6ca5f68cdb7	1433	Radeče
00050000-557e-e379-dc81-af3c1adf5d80	9252	Radenci
00050000-557e-e379-1838-a46fa5e81891	2360	Radlje ob Dravi
00050000-557e-e379-9c56-40586e15e21e	1235	Radomlje
00050000-557e-e379-1d87-4e4a93f22c60	4240	Radovljica
00050000-557e-e379-23d2-c792f3934694	8274	Raka
00050000-557e-e379-fc59-106168c71d69	1381	Rakek
00050000-557e-e379-d35d-fab6dbffbaf6	4283	Rateče - Planica
00050000-557e-e379-7892-d4002f8b0c91	2390	Ravne na Koroškem
00050000-557e-e379-9d2c-f5b65ab625e9	9246	Razkrižje
00050000-557e-e379-a2fc-75c9cd4d3857	3332	Rečica ob Savinji
00050000-557e-e379-0eb2-4db68a1ddf87	5292	Renče
00050000-557e-e379-1d97-17d7cf13861f	1310	Ribnica
00050000-557e-e379-d339-271cafabdb0f	2364	Ribnica na Pohorju
00050000-557e-e379-4102-0930abc47fd6	3272	Rimske Toplice
00050000-557e-e379-efab-9e108ea20a38	1314	Rob
00050000-557e-e379-5b4c-650b19b44934	5215	Ročinj
00050000-557e-e379-f787-75b6fc1590dd	3250	Rogaška Slatina
00050000-557e-e379-970d-8b1187e8cda5	9262	Rogašovci
00050000-557e-e379-2677-61da719809c1	3252	Rogatec
00050000-557e-e379-9b85-1244dbb4a5a5	1373	Rovte
00050000-557e-e379-8bf4-98301ae00d4d	2342	Ruše
00050000-557e-e379-6efc-d76dc675716d	1282	Sava
00050000-557e-e379-951a-2ffed35865df	6333	Sečovlje/Sicciole
00050000-557e-e379-ebac-8201095f8a94	4227	Selca
00050000-557e-e379-4b3a-af4a39cde906	2352	Selnica ob Dravi
00050000-557e-e379-06e7-64230842106a	8333	Semič
00050000-557e-e379-08fa-043da3cb51b4	8281	Senovo
00050000-557e-e379-dbbd-cd5a10bb0715	6224	Senožeče
00050000-557e-e379-d053-087b6af293d7	8290	Sevnica
00050000-557e-e379-db16-f61b8ca1f479	6210	Sežana
00050000-557e-e379-71c8-5380ef943c21	2214	Sladki Vrh
00050000-557e-e379-071c-1077afc9aa85	5283	Slap ob Idrijci
00050000-557e-e379-b749-9ae09821ec35	2380	Slovenj Gradec
00050000-557e-e379-05d7-71ac89ea97f8	2310	Slovenska Bistrica
00050000-557e-e379-d4fe-1822c3c36d60	3210	Slovenske Konjice
00050000-557e-e379-a74d-d4c2a96b75d1	1216	Smlednik
00050000-557e-e379-e600-80b71bc0da76	5232	Soča
00050000-557e-e379-593a-735b254a8677	1317	Sodražica
00050000-557e-e379-159d-235ff725f02c	3335	Solčava
00050000-557e-e379-d93c-1a3a1dd9dc41	5250	Solkan
00050000-557e-e379-74c2-74ac7bbe8227	4229	Sorica
00050000-557e-e379-62d7-5957c640e7e9	4225	Sovodenj
00050000-557e-e379-35a9-eea8e2d8b626	5281	Spodnja Idrija
00050000-557e-e379-91f2-2e03bb5a22f7	2241	Spodnji Duplek
00050000-557e-e379-cad3-92a0b446a335	9245	Spodnji Ivanjci
00050000-557e-e379-957c-d32566c8cc7b	2277	Središče ob Dravi
00050000-557e-e379-feb5-ca29bacfa278	4267	Srednja vas v Bohinju
00050000-557e-e379-87ff-f9a1924145f2	8256	Sromlje 
00050000-557e-e379-eed2-ed38e84d8226	5224	Srpenica
00050000-557e-e379-e2e1-0d80adfd0ea6	1242	Stahovica
00050000-557e-e379-beda-b8532ff8bd5b	1332	Stara Cerkev
00050000-557e-e379-bbc2-a61701d36253	8342	Stari trg ob Kolpi
00050000-557e-e379-9f80-f5ef77b2013e	1386	Stari trg pri Ložu
00050000-557e-e379-abf0-bbd4d9068ba2	2205	Starše
00050000-557e-e379-e36b-8a65f446d17e	2289	Stoperce
00050000-557e-e379-f837-194764cc10e0	8322	Stopiče
00050000-557e-e379-a913-c71ede5da756	3206	Stranice
00050000-557e-e379-5ba4-b6bc17275ff5	8351	Straža
00050000-557e-e379-37e3-3bf12b5eb03e	1313	Struge
00050000-557e-e379-a8ea-98f27ea74e6f	8293	Studenec
00050000-557e-e379-e8af-ad60d99c9b23	8331	Suhor
00050000-557e-e379-4018-f00555890e14	2233	Sv. Ana v Slovenskih goricah
00050000-557e-e379-f0bc-a013ed95694e	2235	Sv. Trojica v Slovenskih goricah
00050000-557e-e379-c59a-595d68e58d3f	2353	Sveti Duh na Ostrem Vrhu
00050000-557e-e379-64ec-f3fdde962a8a	9244	Sveti Jurij ob Ščavnici
00050000-557e-e379-c047-a37efaa2aaf8	3264	Sveti Štefan
00050000-557e-e379-8907-abd69e40b67f	2258	Sveti Tomaž
00050000-557e-e379-fbdc-aa814d0c8633	9204	Šalovci
00050000-557e-e379-b25e-dc1d92820159	5261	Šempas
00050000-557e-e379-fd8e-01b83dc5b547	5290	Šempeter pri Gorici
00050000-557e-e379-6a71-1bdc238d7de1	3311	Šempeter v Savinjski dolini
00050000-557e-e379-1d7e-1fa6988120e7	4208	Šenčur
00050000-557e-e379-90ee-11d18c2d5077	2212	Šentilj v Slovenskih goricah
00050000-557e-e379-5e7c-83396ea09c98	8297	Šentjanž
00050000-557e-e379-521f-a1103d2673c0	2373	Šentjanž pri Dravogradu
00050000-557e-e379-ca1f-3ecd666273cf	8310	Šentjernej
00050000-557e-e379-0eb8-bca31c389bdb	3230	Šentjur
00050000-557e-e379-23d9-0c2189209a09	3271	Šentrupert
00050000-557e-e379-de3e-c3b5c7fae12f	8232	Šentrupert
00050000-557e-e379-0d55-b75090ed3f01	1296	Šentvid pri Stični
00050000-557e-e379-2d99-5b7bc9e092fc	8275	Škocjan
00050000-557e-e379-ffe0-d959845c4c57	6281	Škofije
00050000-557e-e379-29f5-a1f24386cdc5	4220	Škofja Loka
00050000-557e-e379-9874-f6ee401d5aa2	3211	Škofja vas
00050000-557e-e379-71bc-0152a67c5165	1291	Škofljica
00050000-557e-e379-cf52-b60154a506de	6274	Šmarje
00050000-557e-e379-3f75-97d66e62efb2	1293	Šmarje - Sap
00050000-557e-e379-d13c-822eae07e400	3240	Šmarje pri Jelšah
00050000-557e-e379-3414-7ef3a5f99c10	8220	Šmarješke Toplice
00050000-557e-e379-e030-70c4a6655677	2315	Šmartno na Pohorju
00050000-557e-e379-919e-a3309d5f7258	3341	Šmartno ob Dreti
00050000-557e-e379-52cb-520ece579619	3327	Šmartno ob Paki
00050000-557e-e379-e7b7-5e627e4f1730	1275	Šmartno pri Litiji
00050000-557e-e379-2bb6-459cf95ca604	2383	Šmartno pri Slovenj Gradcu
00050000-557e-e379-b0f6-7d608f29aa24	3201	Šmartno v Rožni dolini
00050000-557e-e379-cb41-33fe523b3e52	3325	Šoštanj
00050000-557e-e379-90fe-e5c157bf1362	6222	Štanjel
00050000-557e-e379-7793-c585b5f08243	3220	Štore
00050000-557e-e379-a453-de2cd8de29a5	3304	Tabor
00050000-557e-e379-f5bd-22d376d389af	3221	Teharje
00050000-557e-e379-a4bd-b86d7bfffe0e	9251	Tišina
00050000-557e-e379-053f-b8770223b299	5220	Tolmin
00050000-557e-e379-53d9-1c598a8ec15f	3326	Topolšica
00050000-557e-e379-ce02-3ea314d47923	2371	Trbonje
00050000-557e-e379-7b50-ebdfa99a3a2e	1420	Trbovlje
00050000-557e-e379-ceb9-b8911b4747b5	8231	Trebelno 
00050000-557e-e379-3f95-567608c92a58	8210	Trebnje
00050000-557e-e379-20d2-50d13816ba25	5252	Trnovo pri Gorici
00050000-557e-e379-4afc-934835683f5e	2254	Trnovska vas
00050000-557e-e379-4306-470681663bff	1222	Trojane
00050000-557e-e379-7307-9dd176874ac5	1236	Trzin
00050000-557e-e379-3985-0e8cc2dccec3	4290	Tržič
00050000-557e-e379-fa93-5ced78049fcb	8295	Tržišče
00050000-557e-e379-0801-796198b48236	1311	Turjak
00050000-557e-e379-1953-6cbdc69d1da4	9224	Turnišče
00050000-557e-e379-f1b7-00bf49d3c405	8323	Uršna sela
00050000-557e-e379-1b37-4ef55f65e6e3	1252	Vače
00050000-557e-e379-6573-a6595642ef88	3320	Velenje 
00050000-557e-e379-db56-b196befd6140	3322	Velenje - poštni predali
00050000-557e-e379-03ac-86c7bdf8556f	8212	Velika Loka
00050000-557e-e379-d648-474a0f76b7ec	2274	Velika Nedelja
00050000-557e-e379-7af6-c3331546f571	9225	Velika Polana
00050000-557e-e379-da9b-7165b297c91f	1315	Velike Lašče
00050000-557e-e379-39ae-a387ecf26ced	8213	Veliki Gaber
00050000-557e-e379-deeb-649e9e132539	9241	Veržej
00050000-557e-e379-6991-c9f05474e892	1312	Videm - Dobrepolje
00050000-557e-e379-eb13-71c87aad9de3	2284	Videm pri Ptuju
00050000-557e-e379-a40e-bd01c08ee18f	8344	Vinica
00050000-557e-e379-8fbd-608896d5a285	5271	Vipava
00050000-557e-e379-0d72-045cd11cef6a	4212	Visoko
00050000-557e-e379-6fe1-efbb850d8699	1294	Višnja Gora
00050000-557e-e379-c6be-175d014dbdc3	3205	Vitanje
00050000-557e-e379-85ea-711c264d6c58	2255	Vitomarci
00050000-557e-e379-e732-49cf8e780904	1217	Vodice
00050000-557e-e379-7373-a8631c16a58d	3212	Vojnik\t
00050000-557e-e379-ba2c-5e26c6286d28	5293	Volčja Draga
00050000-557e-e379-bf26-c8b29af37b8e	2232	Voličina
00050000-557e-e379-f6c8-ce0a40130702	3305	Vransko
00050000-557e-e379-ee63-e81626641f28	6217	Vremski Britof
00050000-557e-e379-dffc-8ebe3fe65e43	1360	Vrhnika
00050000-557e-e379-dc52-2a8161abfc4c	2365	Vuhred
00050000-557e-e379-43cb-a598ce1652e2	2367	Vuzenica
00050000-557e-e379-02cc-59831ee111d3	8292	Zabukovje 
00050000-557e-e379-145e-0711d74d72cd	1410	Zagorje ob Savi
00050000-557e-e379-b560-183f08206bc7	1303	Zagradec
00050000-557e-e379-ee6c-aa4ab5f97780	2283	Zavrč
00050000-557e-e379-c203-0df572482d7b	8272	Zdole 
00050000-557e-e379-7665-8dbb3aed21f1	4201	Zgornja Besnica
00050000-557e-e379-900d-e962f6e823e7	2242	Zgornja Korena
00050000-557e-e379-38c9-7821bea298cc	2201	Zgornja Kungota
00050000-557e-e379-938f-24f9bd5546af	2316	Zgornja Ložnica
00050000-557e-e379-6b94-8d0e3919dddb	2314	Zgornja Polskava
00050000-557e-e379-b80f-b035ae8c47ca	2213	Zgornja Velka
00050000-557e-e379-fb8a-8de80e6a6720	4247	Zgornje Gorje
00050000-557e-e379-2bcf-9edcdde36294	4206	Zgornje Jezersko
00050000-557e-e379-4beb-5f925ba3182e	2285	Zgornji Leskovec
00050000-557e-e379-9202-12a22a0caffb	1432	Zidani Most
00050000-557e-e379-6a67-22de2d77fb19	3214	Zreče
00050000-557e-e379-53f3-ad9ef7184041	4209	Žabnica
00050000-557e-e379-5278-1c16799d8223	3310	Žalec
00050000-557e-e379-416f-77460e3b9aac	4228	Železniki
00050000-557e-e379-3dac-0da0a1a25a65	2287	Žetale
00050000-557e-e379-c2c5-84160e11bf54	4226	Žiri
00050000-557e-e379-d4ac-c52f6c786d63	4274	Žirovnica
00050000-557e-e379-bb44-06e4fc157db8	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7298285)
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
-- TOC entry 2832 (class 0 OID 7298096)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7298174)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7298297)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7298417)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7298470)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557e-e37a-901d-cff66d28471c	00080000-557e-e37a-0c64-ee9a1464d51a	0987	A
00190000-557e-e37a-22c2-35f10a4018f7	00080000-557e-e37a-0d08-9eef77f1af69	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7298585)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7298648)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7298598)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7298617)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7298326)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557e-e37a-373c-7a62e6ccd609	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557e-e37a-794a-3500114ba6e0	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557e-e37a-cc48-a519da50d2b6	0003	Kazinska	t	84	Kazinska dvorana
00220000-557e-e37a-971b-87c8c6b35fbc	0004	Mali oder	t	24	Mali oder 
00220000-557e-e37a-1b8a-2736009942f9	0005	Komorni oder	t	15	Komorni oder
00220000-557e-e37a-2ae4-178eafb5a03f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557e-e37a-de34-1f829a2304a1	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7298270)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7298260)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7298459)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7298394)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7297968)
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
-- TOC entry 2857 (class 0 OID 7298336)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7298006)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557e-e37a-219a-82f823d31d3f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557e-e37a-3ff7-0a76b60a0cbe	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557e-e37a-09fd-f4430c748066	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557e-e37a-a1ac-097a96d4e78a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557e-e37a-2a53-8ca7e46f52cc	planer	Planer dogodkov v koledarju	t
00020000-557e-e37a-83e5-59b39793d94e	kadrovska	Kadrovska služba	t
00020000-557e-e37a-799a-41a58e1dc662	arhivar	Ažuriranje arhivalij	t
00020000-557e-e37a-139b-8edac8617ed5	igralec	Igralec	t
00020000-557e-e37a-cd9c-256302686f74	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7297990)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557e-e37a-8744-fc37c68f363b	00020000-557e-e37a-09fd-f4430c748066
00010000-557e-e37a-df24-2dd66ba0e633	00020000-557e-e37a-09fd-f4430c748066
\.


--
-- TOC entry 2859 (class 0 OID 7298350)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7298291)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7298241)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7298681)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557e-e379-527b-0aee01f60690	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557e-e379-821e-bbfaef44f381	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557e-e379-6670-b4c58526409f	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557e-e379-edb4-efbe85489484	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557e-e379-60e9-ad432d8c5407	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7298673)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557e-e379-1cad-4ebc1b72046f	00230000-557e-e379-edb4-efbe85489484	popa
00240000-557e-e379-39e5-81841532ea44	00230000-557e-e379-edb4-efbe85489484	oseba
00240000-557e-e379-e9df-a530f4ebc040	00230000-557e-e379-821e-bbfaef44f381	prostor
00240000-557e-e379-65a2-4737cab4a9d4	00230000-557e-e379-edb4-efbe85489484	besedilo
00240000-557e-e379-e464-bf6519aefa41	00230000-557e-e379-edb4-efbe85489484	uprizoritev
00240000-557e-e379-b10e-a882a94ca4d9	00230000-557e-e379-edb4-efbe85489484	funkcija
00240000-557e-e379-c29e-03c534327e38	00230000-557e-e379-edb4-efbe85489484	tipfunkcije
00240000-557e-e379-740d-5d366b05ae52	00230000-557e-e379-edb4-efbe85489484	alternacija
00240000-557e-e379-5317-d76e89e0f8b1	00230000-557e-e379-527b-0aee01f60690	pogodba
00240000-557e-e379-444f-249d72beb0e0	00230000-557e-e379-edb4-efbe85489484	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7298668)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7298404)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7298068)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7298247)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557e-e37b-bb35-8773e52661c3	00180000-557e-e37b-5ada-13db5cd014ce	000c0000-557e-e37b-6e6f-94efcda773ff	00090000-557e-e37a-e438-478cc70805bb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-e37b-3a12-ae960c1d0063	00180000-557e-e37b-5ada-13db5cd014ce	000c0000-557e-e37b-5d03-0db0095835da	00090000-557e-e37a-a07f-cb4444fdd83e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-e37b-cb90-342044c56270	00180000-557e-e37b-5ada-13db5cd014ce	000c0000-557e-e37b-dfbd-07bfd0011682	00090000-557e-e37a-3a65-fa3bfc9f6d29	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-e37b-c8c2-c10b15e2a67d	00180000-557e-e37b-5ada-13db5cd014ce	000c0000-557e-e37b-e0ba-750f94347460	00090000-557e-e37a-62d8-7292c188f463	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-e37b-227c-3f94dbc8e6e3	00180000-557e-e37b-5ada-13db5cd014ce	000c0000-557e-e37b-a4c1-20be152d94b5	00090000-557e-e37a-b368-429f1278ffa4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557e-e37b-f524-9d40c8927f80	00180000-557e-e37b-9500-df518960aa7f	\N	00090000-557e-e37a-b368-429f1278ffa4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7298448)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557e-e379-3ba8-fc74ef3b4ea9	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557e-e379-0f17-ee57707ccdbd	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557e-e379-2629-7d191667f7d7	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557e-e379-549c-255e19ab8b90	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557e-e379-d28a-9c9bc9f1ddc8	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557e-e379-a6f8-7741e011e712	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557e-e379-a7af-25f2a2aa882b	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557e-e379-49bb-d9fd3e3a5976	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557e-e379-9337-21f871782d08	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557e-e379-be03-07a9c9a74c49	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557e-e379-fd06-95baf01f9c18	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557e-e379-d9cf-a628d3a80193	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557e-e379-3d67-24e9139c6704	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557e-e379-55f7-6d1407c97983	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557e-e379-2201-09cd0a8757b9	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557e-e379-18c0-f3a610ae3cbe	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7298637)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557e-e379-593a-aa2a062a8da2	01	Velika predstava	f	1.00	1.00
002b0000-557e-e379-6cc2-c658b9837edf	02	Mala predstava	f	0.50	0.50
002b0000-557e-e379-b1a3-ecd73f9fc4d9	03	Mala koprodukcija	t	0.40	1.00
002b0000-557e-e379-a161-ed6153047e68	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557e-e379-f9be-579cc5f4701d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7298131)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7297977)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557e-e37a-df24-2dd66ba0e633	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROBY4E/.0IHzvX.OpF5kQ/IY3H/g0xh7e	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557e-e37a-6652-c3552abd8a9f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557e-e37a-d1e8-0c5e8ef747bd	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557e-e37a-c429-014326b37952	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557e-e37a-cbbe-8200c30b9903	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557e-e37a-4a3d-3d7b94954f40	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557e-e37a-d3a0-51ba9fde039a	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557e-e37a-0452-8b1856c09f40	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-557e-e37a-8744-fc37c68f363b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7298505)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557e-e37a-f1c5-b048e8faf66f	00160000-557e-e37a-7b11-774563099793	00150000-557e-e379-0735-dae3e98ff55c	00140000-557e-e379-aa94-97e399cc4a51	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557e-e37a-1b8a-2736009942f9
000e0000-557e-e37a-f3fa-6349d48092d4	00160000-557e-e37a-0d03-9bab371bde13	00150000-557e-e379-6f25-fc9bad5032d9	00140000-557e-e379-4ddc-640c77f54ab1	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557e-e37a-2ae4-178eafb5a03f
000e0000-557e-e37a-6620-fe84bb09d0e0	\N	00150000-557e-e379-6f25-fc9bad5032d9	00140000-557e-e379-4ddc-640c77f54ab1	00190000-557e-e37a-901d-cff66d28471c	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557e-e37a-1b8a-2736009942f9
000e0000-557e-e37a-9f48-a8822ecef769	\N	00150000-557e-e379-6f25-fc9bad5032d9	00140000-557e-e379-4ddc-640c77f54ab1	00190000-557e-e37a-901d-cff66d28471c	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557e-e37a-1b8a-2736009942f9
\.


--
-- TOC entry 2840 (class 0 OID 7298193)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557e-e37a-ba04-35f0a54edca4	000e0000-557e-e37a-f3fa-6349d48092d4	1	
00200000-557e-e37a-13a6-1d8ca4ec230a	000e0000-557e-e37a-f3fa-6349d48092d4	2	
\.


--
-- TOC entry 2855 (class 0 OID 7298318)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7298387)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7298225)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7298495)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557e-e379-aa94-97e399cc4a51	01	Drama	drama (SURS 01)
00140000-557e-e379-057d-3c33f068c8bd	02	Opera	opera (SURS 02)
00140000-557e-e379-ebbb-55e02184d927	03	Balet	balet (SURS 03)
00140000-557e-e379-4bd2-3918fa1e94e4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557e-e379-6bac-b46c6693af5e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557e-e379-4ddc-640c77f54ab1	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557e-e379-67b7-c2e113f6b1c9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7298377)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557e-e379-9f18-f2148f5107cd	01	Opera	opera
00150000-557e-e379-6552-7219dc34f5e7	02	Opereta	opereta
00150000-557e-e379-a83a-c4dd27f78761	03	Balet	balet
00150000-557e-e379-540b-cab960413dde	04	Plesne prireditve	plesne prireditve
00150000-557e-e379-c2a6-9f21c1403bec	05	Lutkovno gledališče	lutkovno gledališče
00150000-557e-e379-7d7e-4c044d5cd0a8	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557e-e379-f9dd-9ff362863b18	07	Biografska drama	biografska drama
00150000-557e-e379-0735-dae3e98ff55c	08	Komedija	komedija
00150000-557e-e379-3b28-bfc948f42843	09	Črna komedija	črna komedija
00150000-557e-e379-bb5f-5f4dd9eac9a7	10	E-igra	E-igra
00150000-557e-e379-6f25-fc9bad5032d9	11	Kriminalka	kriminalka
00150000-557e-e379-423c-3161500d3ae0	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7298031)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7298552)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7298542)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7298447)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7298215)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7298240)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7298157)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7298581)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7298373)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7298191)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7298234)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7298171)
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
-- TOC entry 2495 (class 2606 OID 7298283)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7298310)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7298129)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7298040)
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
-- TOC entry 2410 (class 2606 OID 7298064)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7298020)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7298005)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7298316)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7298349)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7298490)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7298093)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7298117)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7298289)
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
-- TOC entry 2425 (class 2606 OID 7298107)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7298178)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7298301)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7298429)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7298475)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7298596)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7298666)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7298613)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7298634)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7298333)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7298274)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7298265)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7298469)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7298401)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7297976)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7298340)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7297994)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7298014)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7298358)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7298296)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7298246)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7298690)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7298678)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7298672)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7298414)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7298073)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7298256)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7298458)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7298647)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7298142)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7297989)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7298521)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7298200)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7298324)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7298392)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7298229)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7298503)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7298385)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7298222)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7298415)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7298416)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7298095)
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
-- TOC entry 2508 (class 1259 OID 7298317)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7298303)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7298302)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7298201)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7298374)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7298376)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7298375)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7298173)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7298172)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7298492)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7298493)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7298494)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7298636)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7298635)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7298526)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7298523)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7298527)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7298525)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7298524)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7298144)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7298143)
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
-- TOC entry 2408 (class 1259 OID 7298067)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7298341)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7298235)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7298021)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7298022)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7298361)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7298360)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7298359)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7298179)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7298181)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7298180)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7298680)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7298269)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7298267)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7298266)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7298268)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7297995)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7297996)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7298325)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7298290)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7298402)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7298403)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7298582)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7298583)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7298584)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7298109)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7298108)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7298110)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7298667)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7298430)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7298431)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7298556)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7298558)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7298554)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7298557)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7298555)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7298393)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7298278)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7298277)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7298275)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7298276)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7298544)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7298543)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7298597)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7298192)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7298042)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7298041)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7298074)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7298075)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7298259)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7298258)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7298257)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7298616)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7298614)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7298615)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7298224)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7298220)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7298217)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7298218)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7298216)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7298221)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7298219)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7298094)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7298158)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7298160)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7298159)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7298161)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7298284)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7298491)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7298522)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7298065)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7298066)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7298386)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7298691)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7298130)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7298679)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7298335)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7298334)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7298553)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7298118)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7298504)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7298476)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7298477)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7298015)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7298223)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7298827)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7298812)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7298817)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7298837)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7298807)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7298832)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7298822)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7298982)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7298987)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7298742)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7298922)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7298917)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7298912)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7298802)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7298952)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7298962)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7298957)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7298777)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7298772)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7298902)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7299007)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7299012)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7299017)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7299122)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7299117)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7299037)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7299022)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7299042)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7299032)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7299027)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7298767)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7298762)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7298727)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7298722)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7298932)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7298842)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7298702)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7298707)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7298947)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7298942)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7298937)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7298782)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7298792)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7298787)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7299132)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7298877)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7298867)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7298862)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7298872)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7298692)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7298697)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7298927)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7298907)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7298972)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7298977)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7299082)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7299087)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7299092)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7298752)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7298747)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7298757)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7299127)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7298992)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7298997)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7299067)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7299077)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7299057)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7299072)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7299062)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7298967)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7298897)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7298892)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7298882)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7298887)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7299052)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7299047)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7299097)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7298797)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7299002)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7298717)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7298712)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7298732)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7298737)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7298857)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7298852)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7298847)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7299112)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7299102)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7299107)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-15 16:38:51 CEST

--
-- PostgreSQL database dump complete
--

