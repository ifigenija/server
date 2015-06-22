--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-22 13:26:02 CEST

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
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 7898567)
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
-- TOC entry 227 (class 1259 OID 7899089)
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
-- TOC entry 226 (class 1259 OID 7899072)
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
-- TOC entry 219 (class 1259 OID 7898976)
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
-- TOC entry 194 (class 1259 OID 7898746)
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
-- TOC entry 197 (class 1259 OID 7898780)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7898689)
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
-- TOC entry 228 (class 1259 OID 7899103)
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
    opredelitevdrugiviri text,
    vlozekgostitelja numeric(15,2) DEFAULT 0::numeric NOT NULL,
    vlozekkoproducenta numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(15,2) DEFAULT 0::numeric NOT NULL,
    stzaposlenih integer DEFAULT 0 NOT NULL,
    stdrugih integer DEFAULT 0 NOT NULL,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
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
    tip character varying(20) NOT NULL,
    stringpolje character varying(50) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 7898906)
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
-- TOC entry 192 (class 1259 OID 7898726)
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
-- TOC entry 196 (class 1259 OID 7898774)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7898706)
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
-- TOC entry 202 (class 1259 OID 7898823)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7898848)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7898663)
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
-- TOC entry 181 (class 1259 OID 7898576)
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
-- TOC entry 182 (class 1259 OID 7898587)
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
-- TOC entry 177 (class 1259 OID 7898541)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7898560)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7898855)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7898886)
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
-- TOC entry 223 (class 1259 OID 7899022)
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
-- TOC entry 184 (class 1259 OID 7898620)
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
    zamejstvo boolean,
    nvo boolean
);


--
-- TOC entry 186 (class 1259 OID 7898655)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7898829)
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
-- TOC entry 185 (class 1259 OID 7898640)
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
-- TOC entry 191 (class 1259 OID 7898718)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7898841)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7898961)
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
    tantieme numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 222 (class 1259 OID 7899014)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7899134)
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
-- TOC entry 233 (class 1259 OID 7899197)
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
-- TOC entry 230 (class 1259 OID 7899147)
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
-- TOC entry 231 (class 1259 OID 7899166)
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
-- TOC entry 209 (class 1259 OID 7898870)
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
-- TOC entry 201 (class 1259 OID 7898814)
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
-- TOC entry 200 (class 1259 OID 7898804)
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
-- TOC entry 221 (class 1259 OID 7899003)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7898938)
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
-- TOC entry 174 (class 1259 OID 7898512)
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
-- TOC entry 173 (class 1259 OID 7898510)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 7898880)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7898550)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7898534)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7898894)
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
-- TOC entry 204 (class 1259 OID 7898835)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7898785)
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
-- TOC entry 236 (class 1259 OID 7899230)
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
-- TOC entry 235 (class 1259 OID 7899222)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7899217)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7898948)
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
    tipstroska character varying(10) NOT NULL,
    sort integer
);


--
-- TOC entry 183 (class 1259 OID 7898612)
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
-- TOC entry 199 (class 1259 OID 7898791)
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
-- TOC entry 220 (class 1259 OID 7898992)
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
-- TOC entry 232 (class 1259 OID 7899186)
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
-- TOC entry 188 (class 1259 OID 7898675)
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
-- TOC entry 175 (class 1259 OID 7898521)
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
-- TOC entry 225 (class 1259 OID 7899049)
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
-- TOC entry 193 (class 1259 OID 7898737)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7898862)
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
-- TOC entry 215 (class 1259 OID 7898931)
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
-- TOC entry 195 (class 1259 OID 7898769)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7899039)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7898921)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7898515)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2832 (class 0 OID 7898567)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7899089)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5587-f0c9-82e2-dccf900e0d15	000d0000-5587-f0c9-880a-7b62ac2804eb	\N	00090000-5587-f0c9-6478-9520f8823264	\N	000b0000-5587-f0c9-e334-4d83bf540ea6	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5587-f0c9-2ef9-107b30d6ef23	000d0000-5587-f0c9-ef57-a79356fc7081	\N	00090000-5587-f0c9-4a55-802502b4b88b	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5587-f0c9-bca1-ac2b2faf838a	000d0000-5587-f0c9-5aee-d62233184fdf	\N	00090000-5587-f0c9-1846-f3e599d79810	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5587-f0c9-b040-5406b1f67696	000d0000-5587-f0c9-bdae-3fe91c702312	\N	00090000-5587-f0c9-3093-b2f8a723a59b	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5587-f0c9-c80d-9b886194f023	000d0000-5587-f0c9-ae9d-a5a41564348a	\N	00090000-5587-f0c9-b92f-a38a5244cbf6	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5587-f0c9-c59c-64167ef2fc32	000d0000-5587-f0c9-5fe5-a7626fc6c567	\N	00090000-5587-f0c9-4a55-802502b4b88b	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2878 (class 0 OID 7899072)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7898976)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5587-f0c9-3a1c-27d426d7695f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5587-f0c9-afd5-b77be3f2511d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5587-f0c9-42f2-62527ac192da	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2846 (class 0 OID 7898746)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5587-f0c9-e7d3-da86bfba38b4	\N	\N	00200000-5587-f0c9-64c5-a73dab9e968d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5587-f0c9-8c66-cea9c2032bef	\N	\N	00200000-5587-f0c9-15ee-b8f91f758cb6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5587-f0c9-b665-9d0023497936	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5587-f0c9-8f01-80383a7811b3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5587-f0c9-e108-e3401d7f89f9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2849 (class 0 OID 7898780)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7898689)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5587-f0c7-8208-1c368e89842c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5587-f0c7-493e-b105f88648d5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5587-f0c7-7263-2c3ca627e2cf	AL	ALB	008	Albania 	Albanija	\N
00040000-5587-f0c7-c1dd-9dd09a7ab57d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5587-f0c7-048b-bb81081f8953	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5587-f0c7-c6d2-eb2041bb3728	AD	AND	020	Andorra 	Andora	\N
00040000-5587-f0c7-6ef5-b03376a0ac9e	AO	AGO	024	Angola 	Angola	\N
00040000-5587-f0c7-6bae-e257bf23c722	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5587-f0c7-cb13-cb3295862265	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5587-f0c7-dc45-ca0a17048ddd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5587-f0c7-2ac4-94e74785c9f2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5587-f0c7-5fb7-4fd2856edb80	AM	ARM	051	Armenia 	Armenija	\N
00040000-5587-f0c7-2ead-7ce1ee96fd2f	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5587-f0c7-4a36-e579e1e01d28	AU	AUS	036	Australia 	Avstralija	\N
00040000-5587-f0c7-b34b-d932c7606353	AT	AUT	040	Austria 	Avstrija	\N
00040000-5587-f0c7-4b89-28139fd670f9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5587-f0c7-6272-a329facc3445	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5587-f0c7-60d9-49d26d94ad07	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5587-f0c7-102b-d2edd88e1b4e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5587-f0c7-6c25-4020042e0ae8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5587-f0c7-f2da-173a61470445	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5587-f0c7-0ed5-365e982bd213	BE	BEL	056	Belgium 	Belgija	\N
00040000-5587-f0c7-f48f-21918f39cec2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5587-f0c7-74ba-149f518285b2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5587-f0c7-382c-da5945bf1fd5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5587-f0c7-9e8c-46bc7fa911a9	BT	BTN	064	Bhutan 	Butan	\N
00040000-5587-f0c7-fb31-a568a49428e5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5587-f0c7-4de7-669604102dae	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5587-f0c7-386c-65b96cbc6720	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5587-f0c7-7c0c-78d8c89d6d78	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5587-f0c7-a9bb-3ced0b13901f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5587-f0c7-faa6-467e8caa9b69	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5587-f0c7-2729-3eb35fd90ad2	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5587-f0c7-2db1-1cf8c2c89d93	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5587-f0c7-8fcf-1d77de49763c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5587-f0c7-e0d9-6bdc4f4707b1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5587-f0c7-94d0-956f520c3ed7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5587-f0c7-0b73-d42bbe74be83	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5587-f0c7-c4db-b1cc387ff1fe	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5587-f0c7-99a1-6a919a584355	CA	CAN	124	Canada 	Kanada	\N
00040000-5587-f0c7-1fc3-ce20d223f578	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5587-f0c7-22fd-256398bbdf5b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5587-f0c7-fa9f-66f63b7a290f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5587-f0c7-dc66-c6892049b0d4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5587-f0c7-8a8d-97dbe4e09fd1	CL	CHL	152	Chile 	Čile	\N
00040000-5587-f0c7-db63-9f208c3fea29	CN	CHN	156	China 	Kitajska	\N
00040000-5587-f0c7-37a7-76cca42c71fd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5587-f0c7-2057-77d2bcf25360	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5587-f0c7-7cf0-1df1ec5473ac	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5587-f0c7-8277-68e69477fc18	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5587-f0c7-3cab-4205cc73af3f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5587-f0c7-b4ae-2493c4531a7d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5587-f0c7-a1ae-7221f7652d48	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5587-f0c7-96be-e7d525bf1769	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5587-f0c7-40b8-76704acd0b11	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5587-f0c7-2104-3dc656cc4fa3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5587-f0c7-236d-30dd75299a81	CU	CUB	192	Cuba 	Kuba	\N
00040000-5587-f0c7-e690-0385ab1a9e73	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5587-f0c7-c4aa-a148c1cfeef2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5587-f0c7-5bde-dc2fbb4c31c3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5587-f0c7-b2db-271d07fc52e7	DK	DNK	208	Denmark 	Danska	\N
00040000-5587-f0c7-16f4-9bd80534f83c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5587-f0c7-a126-47ffa522176e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5587-f0c7-2513-6882bb441bde	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5587-f0c7-7950-e16f366c4663	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5587-f0c7-eea5-f7ceeeb6ee29	EG	EGY	818	Egypt 	Egipt	\N
00040000-5587-f0c7-8c8e-1ba3eafc04d3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5587-f0c7-c2f3-86485d270d58	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5587-f0c7-5ef7-c398dc6c9963	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5587-f0c7-bd5f-d7d3abda8df3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5587-f0c7-d627-44a71ffec88e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5587-f0c7-7217-c97c222d1ffa	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5587-f0c7-318f-96fa46217903	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5587-f0c7-d60e-c34d8ff6a81e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5587-f0c7-9d4f-551f2e5da517	FI	FIN	246	Finland 	Finska	\N
00040000-5587-f0c7-d02a-30d3a47ca564	FR	FRA	250	France 	Francija	\N
00040000-5587-f0c7-1ad6-dbee582e313a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5587-f0c7-b9e0-1afeb55d850a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5587-f0c7-0d63-86ef0be3f066	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5587-f0c7-67da-530906d4312f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5587-f0c7-ade9-b24994c9321b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5587-f0c7-d81e-dd4665854a64	GM	GMB	270	Gambia 	Gambija	\N
00040000-5587-f0c7-2fe6-06ea0ce03e56	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5587-f0c7-34b9-0b36786b8ce7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5587-f0c7-d83c-c5cbe5f6b49c	GH	GHA	288	Ghana 	Gana	\N
00040000-5587-f0c7-e5ed-462e713a0025	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5587-f0c7-d1fd-5d5d7608adf2	GR	GRC	300	Greece 	Grčija	\N
00040000-5587-f0c7-5ca0-34459cbc2155	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5587-f0c7-9c2e-f18f89e5d74b	GD	GRD	308	Grenada 	Grenada	\N
00040000-5587-f0c7-e35c-2515993685e2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5587-f0c7-a4aa-08137bfdf2e7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5587-f0c7-54b0-7a0f4861802d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5587-f0c7-003a-7877c7ecade7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5587-f0c7-96c1-9ffb93f75aab	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5587-f0c7-5826-4b43c7712e58	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5587-f0c7-8155-ffb497647c9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5587-f0c7-eb13-540f8fcdafa0	HT	HTI	332	Haiti 	Haiti	\N
00040000-5587-f0c7-c25f-9e20a5bea533	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5587-f0c7-a97b-db852dfcd695	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5587-f0c7-ca97-45c6c3652300	HN	HND	340	Honduras 	Honduras	\N
00040000-5587-f0c7-221f-8f66d72a195d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5587-f0c7-0f86-e5163f20275d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5587-f0c7-a328-3729bfd2056e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5587-f0c7-43e8-450018d4b964	IN	IND	356	India 	Indija	\N
00040000-5587-f0c7-7fab-fb51d2da1383	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5587-f0c7-a4e6-397609079772	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5587-f0c7-ff91-c8f47a3bbdfa	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5587-f0c7-19a1-0826f58128bf	IE	IRL	372	Ireland 	Irska	\N
00040000-5587-f0c7-f14d-b4694ce7d7e8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5587-f0c7-98c8-6888aa6eeb0f	IL	ISR	376	Israel 	Izrael	\N
00040000-5587-f0c7-2f40-21b4a3e4e45f	IT	ITA	380	Italy 	Italija	\N
00040000-5587-f0c7-e706-c365fa5081db	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5587-f0c7-5f82-cac1d617e73f	JP	JPN	392	Japan 	Japonska	\N
00040000-5587-f0c7-0a3e-810e8903098c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5587-f0c7-fda1-8d4c6cc47588	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5587-f0c7-5eec-b8172b9f3121	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5587-f0c7-67be-a01a06daf2f1	KE	KEN	404	Kenya 	Kenija	\N
00040000-5587-f0c7-a95b-95c31614a35c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5587-f0c7-8ad3-4a3f7b49f2ea	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5587-f0c7-6171-f042fc3db31b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5587-f0c7-67cf-394328aee274	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5587-f0c7-d74a-7d33358250ae	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5587-f0c7-fb85-3833049743ae	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5587-f0c7-4543-bb3366c89713	LV	LVA	428	Latvia 	Latvija	\N
00040000-5587-f0c7-90c9-a1b0f2453554	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5587-f0c7-942f-96270372cc88	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5587-f0c7-328f-723bf749ca8e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5587-f0c7-a0f1-754b3fd353db	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5587-f0c7-4ab1-f4e6fa715d3d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5587-f0c7-b918-9e726d7b8873	LT	LTU	440	Lithuania 	Litva	\N
00040000-5587-f0c7-3ff6-5a392f468b30	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5587-f0c7-4563-9b23b1a8532c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5587-f0c7-278d-038718623447	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5587-f0c7-5ec6-6eaf2307cb72	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5587-f0c7-7365-7e945ddbdff5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5587-f0c7-b039-703e8783053a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5587-f0c7-bd8c-c5dec6f0af58	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5587-f0c7-878e-c2d4b4f22b9b	ML	MLI	466	Mali 	Mali	\N
00040000-5587-f0c7-c53e-17a81dc63a1d	MT	MLT	470	Malta 	Malta	\N
00040000-5587-f0c7-f372-87c4e8760ed5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5587-f0c7-b381-34cd5de3becb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5587-f0c7-2465-703bec3bf24a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5587-f0c7-e8df-7972595af31b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5587-f0c7-4dd5-321a574e978c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5587-f0c7-611a-07a23743fcfc	MX	MEX	484	Mexico 	Mehika	\N
00040000-5587-f0c7-0af5-137419deb0cb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5587-f0c7-115e-4212d0f81800	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5587-f0c7-298d-486ec8bc6074	MC	MCO	492	Monaco 	Monako	\N
00040000-5587-f0c7-1f0c-a0ca9951ff22	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5587-f0c7-4a2f-79c0594782dc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5587-f0c7-0f6d-1b3d9ac68d8c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5587-f0c7-13a1-0c32d353eb36	MA	MAR	504	Morocco 	Maroko	\N
00040000-5587-f0c7-0f7c-0d766902e65a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5587-f0c7-1845-f26a056e62e2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5587-f0c7-9a9f-984b00d811ad	NA	NAM	516	Namibia 	Namibija	\N
00040000-5587-f0c7-05f2-83e5d869c8f1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5587-f0c7-80ee-ff7b77212c4c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5587-f0c7-d3f8-4bca43ba89be	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5587-f0c7-cdfa-8da3c439e550	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5587-f0c7-aa6f-d43c0bf39634	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5587-f0c7-cb5a-79b7e1e20519	NE	NER	562	Niger 	Niger 	\N
00040000-5587-f0c7-6274-58927e28b1e5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5587-f0c7-d3e7-c72c03adbd32	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5587-f0c7-193b-2f24259cfdce	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5587-f0c7-4e3e-786d0454c9e2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5587-f0c7-1616-47ee47d0dbe8	NO	NOR	578	Norway 	Norveška	\N
00040000-5587-f0c7-71c7-71deef841a82	OM	OMN	512	Oman 	Oman	\N
00040000-5587-f0c7-6c84-a6fd39bee45d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5587-f0c7-5a6d-10d76b7ad949	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5587-f0c7-e5c9-a2f311b75103	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5587-f0c7-da54-9f2a48adc713	PA	PAN	591	Panama 	Panama	\N
00040000-5587-f0c7-ca06-9944cea7bba6	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5587-f0c7-4f0c-2cf9bb88b49b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5587-f0c7-5e37-1b044b8b9de8	PE	PER	604	Peru 	Peru	\N
00040000-5587-f0c7-bbdf-7336f3f93d91	PH	PHL	608	Philippines 	Filipini	\N
00040000-5587-f0c7-3737-0c1659decff9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5587-f0c7-451b-2b16cf3bb7b1	PL	POL	616	Poland 	Poljska	\N
00040000-5587-f0c7-39b2-65865dc7edfa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5587-f0c7-cc28-73f2bbd1754e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5587-f0c7-831d-fd3c6022bef0	QA	QAT	634	Qatar 	Katar	\N
00040000-5587-f0c7-0611-7aa291b22032	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5587-f0c7-257f-39be9a002a00	RO	ROU	642	Romania 	Romunija	\N
00040000-5587-f0c7-1cfa-801c146a81ca	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5587-f0c7-d7a6-97e91cb30d97	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5587-f0c7-85d2-440c98de73fc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5587-f0c7-f221-8b72d7095445	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5587-f0c7-53c2-e25c139260cc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5587-f0c7-dfad-bf902f546f01	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5587-f0c7-74c2-5b0f08ee8280	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5587-f0c7-f77e-be864d7ae8a6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5587-f0c7-ecde-02e02eb785c6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5587-f0c7-45b2-79344d58f50c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5587-f0c7-c931-b9efd1d70c17	SM	SMR	674	San Marino 	San Marino	\N
00040000-5587-f0c7-9e9a-fcef19c5fee5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5587-f0c7-6820-08117c8af43f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5587-f0c7-3649-e514dbced158	SN	SEN	686	Senegal 	Senegal	\N
00040000-5587-f0c7-9cbf-ca533dad8a2d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5587-f0c7-5d47-ebb9704a0b39	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5587-f0c7-ebc4-ae4898637468	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5587-f0c7-1a63-df7f6888b072	SG	SGP	702	Singapore 	Singapur	\N
00040000-5587-f0c7-c8aa-c0b9b8cde3ce	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5587-f0c7-342e-793694b9157f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5587-f0c7-d52e-783ecf8f9223	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5587-f0c7-1930-03b302b16253	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5587-f0c7-a6e2-23e8fe3dd84e	SO	SOM	706	Somalia 	Somalija	\N
00040000-5587-f0c7-00bc-8637ca4c561c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5587-f0c7-d7be-b5e2937a7ae3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5587-f0c7-0647-44bfec4a2914	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5587-f0c7-9e23-87ce2b5fbce6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5587-f0c7-1a01-c74ec35643c4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5587-f0c7-4b66-9fd284110a54	SD	SDN	729	Sudan 	Sudan	\N
00040000-5587-f0c7-8ee6-6523eb05c4e3	SR	SUR	740	Suriname 	Surinam	\N
00040000-5587-f0c7-dec9-ff4bbdacd3e0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5587-f0c7-a7f7-68b43184d997	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5587-f0c7-79c2-8b9be1a5a176	SE	SWE	752	Sweden 	Švedska	\N
00040000-5587-f0c7-b9ce-9d32b99dd672	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5587-f0c7-8285-cfc9f4f56cad	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5587-f0c7-3fb0-5a244e4afea5	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5587-f0c7-2588-d277ed044ffd	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5587-f0c7-0803-29d0c334eca7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5587-f0c7-1772-ac826bd1e4a3	TH	THA	764	Thailand 	Tajska	\N
00040000-5587-f0c7-f20e-5daa602fe5cd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5587-f0c7-0484-b44db41d709f	TG	TGO	768	Togo 	Togo	\N
00040000-5587-f0c7-4b88-e260d6238828	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5587-f0c7-0836-7572bf0585be	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5587-f0c7-72cd-c3d59f288386	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5587-f0c7-b8e0-dbdf45d47dd9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5587-f0c7-92ad-d9c2a04ce61a	TR	TUR	792	Turkey 	Turčija	\N
00040000-5587-f0c7-d9e9-f2d6206ba5ba	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5587-f0c7-11c3-7ba8eb0a4088	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5587-f0c7-56c5-e6c273d4e033	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5587-f0c7-b157-3523baff03b8	UG	UGA	800	Uganda 	Uganda	\N
00040000-5587-f0c7-8a97-5d7067bedac1	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5587-f0c7-4c71-99d357649674	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5587-f0c7-b793-f5629d6ea502	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5587-f0c7-c0da-3187c93f249d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5587-f0c7-a935-eac465029257	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5587-f0c7-8cad-97d3b93dde57	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5587-f0c7-d5d3-a6bd4c1b988b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5587-f0c7-4d12-db7b1668da7f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5587-f0c7-6760-6abb9a4b4ae4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5587-f0c7-91af-bf984e77938b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5587-f0c7-9dad-a8b7535f228f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5587-f0c7-ce45-693c87287218	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5587-f0c7-f589-10814836b379	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5587-f0c7-7d84-5b3a9a93fca8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5587-f0c7-9e2d-d942edd6ba7d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5587-f0c7-631d-aa26a0971a81	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5587-f0c7-2e74-2137e0469a3a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2880 (class 0 OID 7899103)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip, stringpolje) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7898906)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5587-f0c9-a44a-738410840096	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5587-f0c8-ed1d-6628b28eda2b
000d0000-5587-f0c9-880a-7b62ac2804eb	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5587-f0c8-ed1d-6628b28eda2b
000d0000-5587-f0c9-ef57-a79356fc7081	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5587-f0c8-4704-ec0d02609522
000d0000-5587-f0c9-5aee-d62233184fdf	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5587-f0c8-c0f1-a087004486bc
000d0000-5587-f0c9-bdae-3fe91c702312	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5587-f0c8-c0f1-a087004486bc
000d0000-5587-f0c9-ae9d-a5a41564348a	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5587-f0c8-c0f1-a087004486bc
000d0000-5587-f0c9-5fe5-a7626fc6c567	000e0000-5587-f0c9-2f15-4d809ac0b9c9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5587-f0c8-ed1d-6628b28eda2b
\.


--
-- TOC entry 2844 (class 0 OID 7898726)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 7898774)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7898706)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5587-f0c9-4824-9859682f06ae	00080000-5587-f0c9-d04d-3ecf4464b807	00090000-5587-f0c9-6478-9520f8823264	AK		
\.


--
-- TOC entry 2822 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 7898823)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7898848)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 7898663)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5587-f0c8-0882-fa04023abefd	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5587-f0c8-97f5-653c62c0751e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5587-f0c8-9ffe-39d00f0ce366	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5587-f0c8-6e54-2ffc060448f1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5587-f0c8-40e1-e913dd5073b7	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5587-f0c8-07dc-f37977cfb09f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5587-f0c8-46f9-0e2254dfde5c	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5587-f0c8-121f-d4ea197ea131	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5587-f0c8-4ed9-f3322fb9998d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5587-f0c8-e118-84991166a1cc	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5587-f0c8-5e12-066abee3428a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5587-f0c8-35d8-36611e9f6aee	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5587-f0c8-6713-2b71d6e4e702	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5587-f0c9-03f9-bc388c9efba9	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5587-f0c9-ad66-fcb3d9c584ae	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5587-f0c9-80b6-577d70c161b5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5587-f0c9-056f-c91797611b13	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5587-f0c9-fd62-fa5b3aa8c344	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5587-f0c9-73a5-70ec6f58e75a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2833 (class 0 OID 7898576)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5587-f0c9-b380-1b5cf588d898	00000000-5587-f0c9-ad66-fcb3d9c584ae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5587-f0c9-6775-5ee6c5a6958f	00000000-5587-f0c9-ad66-fcb3d9c584ae	00010000-5587-f0c8-cdfa-1d1eb047a014	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5587-f0c9-3931-b662fea45d1c	00000000-5587-f0c9-80b6-577d70c161b5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2834 (class 0 OID 7898587)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5587-f0c9-248c-66d01b0cb482	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5587-f0c9-3093-b2f8a723a59b	00010000-5587-f0c9-db05-1d31573b28e3	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5587-f0c9-1846-f3e599d79810	00010000-5587-f0c9-979e-5fded465ce5b	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5587-f0c9-578d-163650fa61ee	00010000-5587-f0c9-675d-b05beaddc673	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5587-f0c9-1754-071232fde8f4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5587-f0c9-43a8-aec363aef006	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5587-f0c9-b7c7-0d2b0ab5c643	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5587-f0c9-930b-9c05fc2b1a0a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5587-f0c9-6478-9520f8823264	00010000-5587-f0c9-7afb-0e4d498afdc5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5587-f0c9-4a55-802502b4b88b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5587-f0c9-d03e-d43d9e4c1cd8	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5587-f0c9-b92f-a38a5244cbf6	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5587-f0c9-bfde-ff29496f1744	00010000-5587-f0c9-e787-86262a642648	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2824 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7898541)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5587-f0c7-a1fc-a46034a67ad4	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5587-f0c7-0620-6161fa4244b4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5587-f0c7-068c-618aa7a969cc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5587-f0c7-2e70-23e85dfe0c47	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5587-f0c7-207d-125ce401d563	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5587-f0c7-88a7-0390b4c28bd6	Abonma-read	Abonma - branje	f
00030000-5587-f0c7-bb09-5c6561e1f361	Abonma-write	Abonma - spreminjanje	f
00030000-5587-f0c7-fb2c-3d17442cb27d	Alternacija-read	Alternacija - branje	f
00030000-5587-f0c7-9fc4-1b280db8260f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5587-f0c7-51ce-d7c74a685c33	Arhivalija-read	Arhivalija - branje	f
00030000-5587-f0c7-ae19-0ee67100688a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5587-f0c7-b7c4-e50b67672026	Besedilo-read	Besedilo - branje	f
00030000-5587-f0c7-47ea-67a49ab5d778	Besedilo-write	Besedilo - spreminjanje	f
00030000-5587-f0c7-847a-7512639e47c9	DogodekIzven-read	DogodekIzven - branje	f
00030000-5587-f0c7-e456-e262c61fec50	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5587-f0c7-c1c9-358aa767428c	Dogodek-read	Dogodek - branje	f
00030000-5587-f0c7-f484-03dd4cf91966	Dogodek-write	Dogodek - spreminjanje	f
00030000-5587-f0c7-d3e3-d44f6af1b4a6	Drzava-read	Drzava - branje	f
00030000-5587-f0c7-bb38-34dea1e39863	Drzava-write	Drzava - spreminjanje	f
00030000-5587-f0c7-b2cd-b3d9350b8968	Funkcija-read	Funkcija - branje	f
00030000-5587-f0c7-3665-7e98cbc696fa	Funkcija-write	Funkcija - spreminjanje	f
00030000-5587-f0c7-9898-d82716b44dac	Gostovanje-read	Gostovanje - branje	f
00030000-5587-f0c7-7e10-26f82dccb1ab	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5587-f0c7-6a73-4a0511f6541a	Gostujoca-read	Gostujoca - branje	f
00030000-5587-f0c7-90ed-212d977b0fc9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5587-f0c7-ad9e-e31e2f5c44c1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5587-f0c7-bffd-a450a457e344	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5587-f0c7-054b-8ef3eb2c4bfe	Kupec-read	Kupec - branje	f
00030000-5587-f0c7-b0b6-00808e7a4290	Kupec-write	Kupec - spreminjanje	f
00030000-5587-f0c7-6693-e6c762b04b50	NacinPlacina-read	NacinPlacina - branje	f
00030000-5587-f0c7-be60-5bbafb95cfc7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5587-f0c7-3be1-4c0d9327fe03	Option-read	Option - branje	f
00030000-5587-f0c7-a428-a1f847e35285	Option-write	Option - spreminjanje	f
00030000-5587-f0c7-d46c-cc94d7c61bd7	OptionValue-read	OptionValue - branje	f
00030000-5587-f0c7-958f-6bad6fc9b62c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5587-f0c7-689f-7bf79808e2e7	Oseba-read	Oseba - branje	f
00030000-5587-f0c7-cc13-b0d06dfc6918	Oseba-write	Oseba - spreminjanje	f
00030000-5587-f0c7-087b-df2c2c6a2660	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5587-f0c7-52f6-263c47eddb89	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5587-f0c7-6e77-2e6c8d516aca	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5587-f0c7-4e4a-9f84ed945e09	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5587-f0c7-3cb8-0effab5cc0bd	Pogodba-read	Pogodba - branje	f
00030000-5587-f0c7-e51f-fa3c9f8ab28a	Pogodba-write	Pogodba - spreminjanje	f
00030000-5587-f0c7-c118-62f57b148ff2	Popa-read	Popa - branje	f
00030000-5587-f0c7-99a0-48891400c30a	Popa-write	Popa - spreminjanje	f
00030000-5587-f0c7-4cef-3220ba76ec2e	Posta-read	Posta - branje	f
00030000-5587-f0c7-cba1-3986029d06ba	Posta-write	Posta - spreminjanje	f
00030000-5587-f0c7-2b1b-a9136230d78b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5587-f0c7-7368-a0eb381fbee4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5587-f0c7-c8e6-1409526a96a6	PostniNaslov-read	PostniNaslov - branje	f
00030000-5587-f0c7-5eee-48c005e81172	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5587-f0c7-2986-a90b25406470	Predstava-read	Predstava - branje	f
00030000-5587-f0c7-dcfe-e7eb6ea6e87a	Predstava-write	Predstava - spreminjanje	f
00030000-5587-f0c7-3f42-58bd2a4374bc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5587-f0c7-c4f6-1299227abf00	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5587-f0c7-9dc2-54a6ca7a7038	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5587-f0c7-8fbf-a79e4b40bd92	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5587-f0c7-4591-8b9e04f5e412	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5587-f0c7-4260-a07cb53817a9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5587-f0c7-1bec-a50af64d9691	ProgramDela-read	ProgramDela - branje	f
00030000-5587-f0c7-1230-bef57f9719a6	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5587-f0c7-7bda-3b8606ad0b39	ProgramFestival-read	ProgramFestival - branje	f
00030000-5587-f0c7-21ff-5c0b8a03a2f4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5587-f0c7-9fe0-c2cd121c6c22	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5587-f0c7-6a3c-8b20950d8c50	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5587-f0c7-199d-efa339f7ffb5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5587-f0c7-3b2b-0c74a859c41d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5587-f0c7-85d6-322db5c1c34b	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5587-f0c7-bc01-162010540711	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5587-f0c7-2cc8-1d9bdd9ba5ea	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5587-f0c7-4468-05bd873e62e2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5587-f0c7-443a-8f54d548ca28	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5587-f0c7-41bc-54a6b427689e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5587-f0c7-5ab7-e677a8417af7	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5587-f0c7-b8c2-7cf8d0038376	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5587-f0c7-a38f-c15aeb8dfe85	ProgramRazno-read	ProgramRazno - branje	f
00030000-5587-f0c7-316d-8268fd92792b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5587-f0c7-39e0-0454bf406270	Prostor-read	Prostor - branje	f
00030000-5587-f0c7-1818-3b81bbf2055b	Prostor-write	Prostor - spreminjanje	f
00030000-5587-f0c7-a4dd-1e16ae7e68fc	Racun-read	Racun - branje	f
00030000-5587-f0c7-c843-5cfd83e750db	Racun-write	Racun - spreminjanje	f
00030000-5587-f0c7-38ab-2d22acaf0d40	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5587-f0c7-baa1-cce373345a87	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5587-f0c7-a345-5fb6d1f57908	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5587-f0c7-0f8e-10fdb68becb8	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5587-f0c7-20c7-bcde0bee0215	Rekvizit-read	Rekvizit - branje	f
00030000-5587-f0c7-5766-ea5c296dddba	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5587-f0c7-7d29-386030dfba5f	Revizija-read	Revizija - branje	f
00030000-5587-f0c7-3fe9-9d663b28354e	Revizija-write	Revizija - spreminjanje	f
00030000-5587-f0c7-c9d0-e026234d4727	Rezervacija-read	Rezervacija - branje	f
00030000-5587-f0c7-388a-957b587c4805	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5587-f0c7-64a4-a0f35f0f0eb9	SedezniRed-read	SedezniRed - branje	f
00030000-5587-f0c7-bf9d-14e1d4cff480	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5587-f0c7-c003-0a0eeeab3e84	Sedez-read	Sedez - branje	f
00030000-5587-f0c7-03b4-2bdc83b6863f	Sedez-write	Sedez - spreminjanje	f
00030000-5587-f0c7-18ea-96fd630fcf56	Sezona-read	Sezona - branje	f
00030000-5587-f0c7-0726-3077d4825e13	Sezona-write	Sezona - spreminjanje	f
00030000-5587-f0c7-4f69-9a582635492b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5587-f0c7-6347-3f21c8ac1246	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5587-f0c7-d3b7-49e72c611a97	Stevilcenje-read	Stevilcenje - branje	f
00030000-5587-f0c7-4578-022d51ef1d90	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5587-f0c7-a96f-78dceda8ec99	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5587-f0c7-0eb6-4ad5007cfd2e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5587-f0c7-d895-0bf7fca62927	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5587-f0c7-0763-b8b919e106b1	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5587-f0c7-2725-5d3791e7d3cf	Telefonska-read	Telefonska - branje	f
00030000-5587-f0c7-8f07-9c0844ba60e0	Telefonska-write	Telefonska - spreminjanje	f
00030000-5587-f0c7-da77-7502aae64e51	TerminStoritve-read	TerminStoritve - branje	f
00030000-5587-f0c7-e72e-27267a05c392	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5587-f0c7-5d8d-ad5e30049fef	TipFunkcije-read	TipFunkcije - branje	f
00030000-5587-f0c7-eaeb-b33c90c1b698	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5587-f0c7-c88b-aa68e17b6586	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5587-f0c7-5b23-3c3914b691fb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5587-f0c7-ce75-0d49f9fa5cae	Trr-read	Trr - branje	f
00030000-5587-f0c7-e22f-b4e979e9f638	Trr-write	Trr - spreminjanje	f
00030000-5587-f0c7-fa3b-a722344f961c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5587-f0c7-51fd-541603aa7d04	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5587-f0c7-4ad8-99a77fbdcd7f	Vaja-read	Vaja - branje	f
00030000-5587-f0c7-82a4-f3ae9487aa3b	Vaja-write	Vaja - spreminjanje	f
00030000-5587-f0c7-3e86-23cc0ab3a8c0	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5587-f0c7-0eeb-c5615072aeef	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5587-f0c7-7914-0d14313b6acc	Zaposlitev-read	Zaposlitev - branje	f
00030000-5587-f0c7-5036-b312f7b6f1fe	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5587-f0c7-7886-26e3d0446ccf	Zasedenost-read	Zasedenost - branje	f
00030000-5587-f0c7-a765-7f72955eddde	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5587-f0c7-fd4a-d838b414c275	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5587-f0c7-631c-93b347288f79	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5587-f0c7-7280-2b15c6029078	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5587-f0c7-7201-bfab99132fd0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2831 (class 0 OID 7898560)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5587-f0c7-c798-e87108baee64	00030000-5587-f0c7-0620-6161fa4244b4
00020000-5587-f0c7-08b4-9578816b97ec	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-bb09-5c6561e1f361
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-fb2c-3d17442cb27d
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-9fc4-1b280db8260f
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-2e70-23e85dfe0c47
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-f484-03dd4cf91966
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-bb38-34dea1e39863
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-b2cd-b3d9350b8968
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-3665-7e98cbc696fa
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-7e10-26f82dccb1ab
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-90ed-212d977b0fc9
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-ad9e-e31e2f5c44c1
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-bffd-a450a457e344
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-689f-7bf79808e2e7
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-cc13-b0d06dfc6918
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-99a0-48891400c30a
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-cba1-3986029d06ba
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-c8e6-1409526a96a6
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-5eee-48c005e81172
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-dcfe-e7eb6ea6e87a
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-4591-8b9e04f5e412
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-4260-a07cb53817a9
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-1818-3b81bbf2055b
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-0f8e-10fdb68becb8
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-5766-ea5c296dddba
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-0726-3077d4825e13
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-5d8d-ad5e30049fef
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-fa3b-a722344f961c
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-51fd-541603aa7d04
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-4ad8-99a77fbdcd7f
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-82a4-f3ae9487aa3b
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-7886-26e3d0446ccf
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-a765-7f72955eddde
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c7-b7e9-013b13149eb5	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-ad9e-e31e2f5c44c1
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-bffd-a450a457e344
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-689f-7bf79808e2e7
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-cc13-b0d06dfc6918
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-c8e6-1409526a96a6
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-5eee-48c005e81172
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-2725-5d3791e7d3cf
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-8f07-9c0844ba60e0
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-ce75-0d49f9fa5cae
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-e22f-b4e979e9f638
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-7914-0d14313b6acc
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-5036-b312f7b6f1fe
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c7-8fba-d3f6f67f1f48	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-fb2c-3d17442cb27d
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-ae19-0ee67100688a
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-b7c4-e50b67672026
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-847a-7512639e47c9
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-b2cd-b3d9350b8968
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-ad9e-e31e2f5c44c1
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-689f-7bf79808e2e7
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-4591-8b9e04f5e412
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-5d8d-ad5e30049fef
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-4ad8-99a77fbdcd7f
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-7886-26e3d0446ccf
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c7-f3df-aa3e1b9d690e	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-bb09-5c6561e1f361
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-9fc4-1b280db8260f
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-5d8d-ad5e30049fef
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c7-54bb-3eeb4b512218	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-da77-7502aae64e51
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-068c-618aa7a969cc
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-5d8d-ad5e30049fef
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c7-cfbb-3cd99852ff6e	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a1fc-a46034a67ad4
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0620-6161fa4244b4
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-068c-618aa7a969cc
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-2e70-23e85dfe0c47
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-207d-125ce401d563
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-88a7-0390b4c28bd6
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-bb09-5c6561e1f361
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-fb2c-3d17442cb27d
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-9fc4-1b280db8260f
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-51ce-d7c74a685c33
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-ae19-0ee67100688a
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-b7c4-e50b67672026
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-47ea-67a49ab5d778
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-847a-7512639e47c9
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-e456-e262c61fec50
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c1c9-358aa767428c
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-f484-03dd4cf91966
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-d3e3-d44f6af1b4a6
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-bb38-34dea1e39863
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-b2cd-b3d9350b8968
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3665-7e98cbc696fa
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-9898-d82716b44dac
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7e10-26f82dccb1ab
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-6a73-4a0511f6541a
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-90ed-212d977b0fc9
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-ad9e-e31e2f5c44c1
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-bffd-a450a457e344
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-054b-8ef3eb2c4bfe
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-b0b6-00808e7a4290
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-6693-e6c762b04b50
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-be60-5bbafb95cfc7
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3be1-4c0d9327fe03
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a428-a1f847e35285
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-d46c-cc94d7c61bd7
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-958f-6bad6fc9b62c
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-689f-7bf79808e2e7
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-cc13-b0d06dfc6918
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-087b-df2c2c6a2660
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-52f6-263c47eddb89
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-6e77-2e6c8d516aca
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4e4a-9f84ed945e09
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3cb8-0effab5cc0bd
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-e51f-fa3c9f8ab28a
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c118-62f57b148ff2
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-99a0-48891400c30a
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4cef-3220ba76ec2e
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-cba1-3986029d06ba
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-2b1b-a9136230d78b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7368-a0eb381fbee4
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c8e6-1409526a96a6
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5eee-48c005e81172
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-2986-a90b25406470
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-dcfe-e7eb6ea6e87a
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3f42-58bd2a4374bc
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c4f6-1299227abf00
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-9dc2-54a6ca7a7038
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-8fbf-a79e4b40bd92
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4591-8b9e04f5e412
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4260-a07cb53817a9
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-1bec-a50af64d9691
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-1230-bef57f9719a6
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7bda-3b8606ad0b39
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-21ff-5c0b8a03a2f4
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-9fe0-c2cd121c6c22
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-6a3c-8b20950d8c50
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-199d-efa339f7ffb5
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3b2b-0c74a859c41d
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-85d6-322db5c1c34b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-bc01-162010540711
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-2cc8-1d9bdd9ba5ea
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4468-05bd873e62e2
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-443a-8f54d548ca28
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-41bc-54a6b427689e
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5ab7-e677a8417af7
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-b8c2-7cf8d0038376
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a38f-c15aeb8dfe85
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-316d-8268fd92792b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-39e0-0454bf406270
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-1818-3b81bbf2055b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a4dd-1e16ae7e68fc
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c843-5cfd83e750db
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-38ab-2d22acaf0d40
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-baa1-cce373345a87
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a345-5fb6d1f57908
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0f8e-10fdb68becb8
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-20c7-bcde0bee0215
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5766-ea5c296dddba
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7d29-386030dfba5f
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3fe9-9d663b28354e
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c9d0-e026234d4727
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-388a-957b587c4805
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-64a4-a0f35f0f0eb9
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-bf9d-14e1d4cff480
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c003-0a0eeeab3e84
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-03b4-2bdc83b6863f
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-18ea-96fd630fcf56
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0726-3077d4825e13
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4f69-9a582635492b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-6347-3f21c8ac1246
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-d3b7-49e72c611a97
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4578-022d51ef1d90
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a96f-78dceda8ec99
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0eb6-4ad5007cfd2e
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-d895-0bf7fca62927
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0763-b8b919e106b1
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-2725-5d3791e7d3cf
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-8f07-9c0844ba60e0
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-da77-7502aae64e51
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-e72e-27267a05c392
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5d8d-ad5e30049fef
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-eaeb-b33c90c1b698
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-c88b-aa68e17b6586
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5b23-3c3914b691fb
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-ce75-0d49f9fa5cae
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-e22f-b4e979e9f638
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-fa3b-a722344f961c
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-51fd-541603aa7d04
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-4ad8-99a77fbdcd7f
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-82a4-f3ae9487aa3b
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-3e86-23cc0ab3a8c0
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-0eeb-c5615072aeef
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7914-0d14313b6acc
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-5036-b312f7b6f1fe
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7886-26e3d0446ccf
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-a765-7f72955eddde
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-fd4a-d838b414c275
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-631c-93b347288f79
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7280-2b15c6029078
00020000-5587-f0c9-4430-59f086c8f9f8	00030000-5587-f0c7-7201-bfab99132fd0
\.


--
-- TOC entry 2859 (class 0 OID 7898855)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7898886)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7899022)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5587-f0c9-e334-4d83bf540ea6	00090000-5587-f0c9-248c-66d01b0cb482	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2836 (class 0 OID 7898620)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5587-f0c9-d04d-3ecf4464b807	00040000-5587-f0c7-8208-1c368e89842c	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5587-f0c9-508d-7851a19c371a	00040000-5587-f0c7-8208-1c368e89842c	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5587-f0c9-5006-42d1fa57b96c	00040000-5587-f0c7-8208-1c368e89842c	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5587-f0c9-5d5f-4387e7026ed1	00040000-5587-f0c7-8208-1c368e89842c	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5587-f0c9-848c-14dc0c911137	00040000-5587-f0c7-8208-1c368e89842c	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5587-f0c9-a2fd-248bb72c91ba	00040000-5587-f0c7-d52e-783ecf8f9223	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2838 (class 0 OID 7898655)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5587-f0c8-9b5d-3de07b0794ea	8341	Adlešiči
00050000-5587-f0c8-199f-09b6a76b2627	5270	Ajdovščina
00050000-5587-f0c8-3a72-0513ef6dd8b5	6280	Ankaran/Ancarano
00050000-5587-f0c8-0337-eee806d50cd3	9253	Apače
00050000-5587-f0c8-e76f-14b6324faf42	8253	Artiče
00050000-5587-f0c8-32c3-dfedc8aae22b	4275	Begunje na Gorenjskem
00050000-5587-f0c8-a1b8-24421ad03ccb	1382	Begunje pri Cerknici
00050000-5587-f0c8-220c-30bb64a84d7a	9231	Beltinci
00050000-5587-f0c8-08c9-87bd9e6fddfa	2234	Benedikt
00050000-5587-f0c8-1df0-bdc6efa44f8b	2345	Bistrica ob Dravi
00050000-5587-f0c8-3864-2570c24da16d	3256	Bistrica ob Sotli
00050000-5587-f0c8-3171-2a01021bf451	8259	Bizeljsko
00050000-5587-f0c8-9c77-61edc35c74fe	1223	Blagovica
00050000-5587-f0c8-03f8-c4449e59b511	8283	Blanca
00050000-5587-f0c8-e692-be6e4487c8a6	4260	Bled
00050000-5587-f0c8-f3a6-bd3aac82797a	4273	Blejska Dobrava
00050000-5587-f0c8-54b5-3d1d19a9a8bf	9265	Bodonci
00050000-5587-f0c8-1cc2-b262e1d4431c	9222	Bogojina
00050000-5587-f0c8-e9fe-e1067e649a36	4263	Bohinjska Bela
00050000-5587-f0c8-a36a-9ec91bd0aa90	4264	Bohinjska Bistrica
00050000-5587-f0c8-3eaf-5c249dc51efe	4265	Bohinjsko jezero
00050000-5587-f0c8-b7eb-181c250e23d4	1353	Borovnica
00050000-5587-f0c8-1347-dcf46e5601de	8294	Boštanj
00050000-5587-f0c8-dc9e-3b37da81c7d8	5230	Bovec
00050000-5587-f0c8-8325-1e93775c8ad2	5295	Branik
00050000-5587-f0c8-887f-d2f0fb229216	3314	Braslovče
00050000-5587-f0c8-1a52-77f856f80cff	5223	Breginj
00050000-5587-f0c8-9d06-f423256c18a1	8280	Brestanica
00050000-5587-f0c8-6aed-f6796e1c2074	2354	Bresternica
00050000-5587-f0c8-8063-dd16df43d030	4243	Brezje
00050000-5587-f0c8-b336-f62edf0d8894	1351	Brezovica pri Ljubljani
00050000-5587-f0c8-ee41-6bd038c53fc6	8250	Brežice
00050000-5587-f0c8-515c-f880653eb512	4210	Brnik - Aerodrom
00050000-5587-f0c8-8d4c-37d24f508112	8321	Brusnice
00050000-5587-f0c8-4519-b1a254a0f96e	3255	Buče
00050000-5587-f0c8-f11e-87b3e9af2dda	8276	Bučka 
00050000-5587-f0c8-71c3-737bc027ab65	9261	Cankova
00050000-5587-f0c8-e9e1-d1727e5b3e2c	3000	Celje 
00050000-5587-f0c8-b344-f86448485feb	3001	Celje - poštni predali
00050000-5587-f0c8-eaef-0e083d6e3c15	4207	Cerklje na Gorenjskem
00050000-5587-f0c8-8038-352d73e32b1f	8263	Cerklje ob Krki
00050000-5587-f0c8-297a-0e5d7c8d3a9f	1380	Cerknica
00050000-5587-f0c8-f284-2962cd121dfb	5282	Cerkno
00050000-5587-f0c8-8171-5099c07320fa	2236	Cerkvenjak
00050000-5587-f0c8-aa6d-d96c1cde93f7	2215	Ceršak
00050000-5587-f0c8-b5a3-b65ada15cf3e	2326	Cirkovce
00050000-5587-f0c8-0268-4b9636642f9d	2282	Cirkulane
00050000-5587-f0c8-40f0-ed456895321a	5273	Col
00050000-5587-f0c8-f7aa-71a7da595646	8251	Čatež ob Savi
00050000-5587-f0c8-b331-c2d2fee72317	1413	Čemšenik
00050000-5587-f0c8-fdae-ad68a54233c4	5253	Čepovan
00050000-5587-f0c8-0d37-a93c49bc185f	9232	Črenšovci
00050000-5587-f0c8-12f2-8898d0be75ec	2393	Črna na Koroškem
00050000-5587-f0c8-0cee-2f66a14d80d7	6275	Črni Kal
00050000-5587-f0c8-9b2d-b702a43856a3	5274	Črni Vrh nad Idrijo
00050000-5587-f0c8-73d3-cbe4d6a39de0	5262	Črniče
00050000-5587-f0c8-5d1e-c73aef987a51	8340	Črnomelj
00050000-5587-f0c8-4b13-c8a0fba279a3	6271	Dekani
00050000-5587-f0c8-0692-06df76a04e66	5210	Deskle
00050000-5587-f0c8-fe0e-04200277e800	2253	Destrnik
00050000-5587-f0c8-6c04-341f0f07510b	6215	Divača
00050000-5587-f0c8-309a-e0915a8e26d1	1233	Dob
00050000-5587-f0c8-2bae-745bdfd34144	3224	Dobje pri Planini
00050000-5587-f0c8-673f-e4d1510c0c14	8257	Dobova
00050000-5587-f0c8-0ae8-8e826b507114	1423	Dobovec
00050000-5587-f0c8-dcda-6167ea0709dd	5263	Dobravlje
00050000-5587-f0c8-2a23-72609158f981	3204	Dobrna
00050000-5587-f0c8-ea64-8fb8252c5b13	8211	Dobrnič
00050000-5587-f0c8-fa85-4da038e432a6	1356	Dobrova
00050000-5587-f0c8-6dc1-64398f4d25b1	9223	Dobrovnik/Dobronak 
00050000-5587-f0c8-dd8b-b75ae52f11b3	5212	Dobrovo v Brdih
00050000-5587-f0c8-c904-78f6403feb89	1431	Dol pri Hrastniku
00050000-5587-f0c8-d3bf-7413c4709dcd	1262	Dol pri Ljubljani
00050000-5587-f0c8-d8b8-54e703408e77	1273	Dole pri Litiji
00050000-5587-f0c8-06a9-fa47adfbdb91	1331	Dolenja vas
00050000-5587-f0c8-9e49-5b001c4c6ae4	8350	Dolenjske Toplice
00050000-5587-f0c8-9eaa-33debb56136c	1230	Domžale
00050000-5587-f0c8-580f-7cf0b87d7b65	2252	Dornava
00050000-5587-f0c8-7aa9-2f10e844c63a	5294	Dornberk
00050000-5587-f0c8-deb8-c449b92f0910	1319	Draga
00050000-5587-f0c8-530e-63bf0e6306e4	8343	Dragatuš
00050000-5587-f0c8-8c26-7d3c3b1546d3	3222	Dramlje
00050000-5587-f0c8-60ea-d78eb4ff38c4	2370	Dravograd
00050000-5587-f0c8-2619-68c0f4477f0d	4203	Duplje
00050000-5587-f0c8-5356-00a73734772d	6221	Dutovlje
00050000-5587-f0c8-ed6c-685a7f2931be	8361	Dvor
00050000-5587-f0c8-d8ad-23c371077b30	2343	Fala
00050000-5587-f0c8-88b8-d05d17ad3a2f	9208	Fokovci
00050000-5587-f0c8-4775-cb9ce4c47724	2313	Fram
00050000-5587-f0c8-feac-351ef88d5a82	3213	Frankolovo
00050000-5587-f0c8-0583-7e55c7d641aa	1274	Gabrovka
00050000-5587-f0c8-8724-51b8f0e04bfe	8254	Globoko
00050000-5587-f0c8-ec62-dec76473309d	5275	Godovič
00050000-5587-f0c8-5261-b9afd087ff45	4204	Golnik
00050000-5587-f0c8-78a1-cf07da09fb2b	3303	Gomilsko
00050000-5587-f0c8-58eb-e0ff837f81f2	4224	Gorenja vas
00050000-5587-f0c8-8745-0ad35b2e9f98	3263	Gorica pri Slivnici
00050000-5587-f0c8-b592-fefd6c6ac4a8	2272	Gorišnica
00050000-5587-f0c8-bd71-36f6df6cdc8a	9250	Gornja Radgona
00050000-5587-f0c8-3387-be3f71b3719e	3342	Gornji Grad
00050000-5587-f0c8-22b6-29639d2b7446	4282	Gozd Martuljek
00050000-5587-f0c8-7b09-bec2af435a18	6272	Gračišče
00050000-5587-f0c8-0369-9cea3409149a	9264	Grad
00050000-5587-f0c8-af2b-23945078446b	8332	Gradac
00050000-5587-f0c8-97bd-bcca696677d5	1384	Grahovo
00050000-5587-f0c8-baf0-107a60bf0b0c	5242	Grahovo ob Bači
00050000-5587-f0c8-1199-66980e2aa768	5251	Grgar
00050000-5587-f0c8-79b1-e7a698b30d6c	3302	Griže
00050000-5587-f0c8-f3ea-5ff38832f4f5	3231	Grobelno
00050000-5587-f0c8-982f-44058faf927a	1290	Grosuplje
00050000-5587-f0c8-184c-dd237f6739c7	2288	Hajdina
00050000-5587-f0c8-63fc-2db2a035686d	8362	Hinje
00050000-5587-f0c8-12e5-935afa272c9a	2311	Hoče
00050000-5587-f0c8-8db8-a072cbcd9285	9205	Hodoš/Hodos
00050000-5587-f0c8-cd13-f30d3d1831cd	1354	Horjul
00050000-5587-f0c8-962b-b9b1cd37ae9a	1372	Hotedršica
00050000-5587-f0c8-aae9-a01ea35c782f	1430	Hrastnik
00050000-5587-f0c8-cb51-b0debef6df88	6225	Hruševje
00050000-5587-f0c8-9fa8-cfd8d2e194f0	4276	Hrušica
00050000-5587-f0c8-3ca6-962e98ed7441	5280	Idrija
00050000-5587-f0c8-7f57-b6bf544121c0	1292	Ig
00050000-5587-f0c8-c80a-295f937c6a12	6250	Ilirska Bistrica
00050000-5587-f0c8-d3ef-08567e04f2cd	6251	Ilirska Bistrica-Trnovo
00050000-5587-f0c8-aa16-715010664d0f	1295	Ivančna Gorica
00050000-5587-f0c8-f0f3-d5df5ef6343a	2259	Ivanjkovci
00050000-5587-f0c8-1605-4138852d51a1	1411	Izlake
00050000-5587-f0c8-40e5-b40b80e03ef4	6310	Izola/Isola
00050000-5587-f0c8-d0a8-09fb8b950c41	2222	Jakobski Dol
00050000-5587-f0c8-0ee8-e137126b923b	2221	Jarenina
00050000-5587-f0c8-c86b-92fa4daeebcd	6254	Jelšane
00050000-5587-f0c8-1125-c9ad3d760dd5	4270	Jesenice
00050000-5587-f0c8-4abd-872cdf7102b0	8261	Jesenice na Dolenjskem
00050000-5587-f0c8-8f51-f2b0fa548894	3273	Jurklošter
00050000-5587-f0c8-1627-0ab5111ef5e4	2223	Jurovski Dol
00050000-5587-f0c8-4892-712cc33c7e1c	2256	Juršinci
00050000-5587-f0c8-7bfb-e677f4b877e2	5214	Kal nad Kanalom
00050000-5587-f0c8-d97c-8adc02ef2c75	3233	Kalobje
00050000-5587-f0c8-9a3c-e422a6448f88	4246	Kamna Gorica
00050000-5587-f0c8-797e-a53b88771a74	2351	Kamnica
00050000-5587-f0c8-e785-aee8238b016a	1241	Kamnik
00050000-5587-f0c8-ff14-3eaf002347f7	5213	Kanal
00050000-5587-f0c8-de0f-103f6ba28353	8258	Kapele
00050000-5587-f0c8-ddaa-14b72d9020cd	2362	Kapla
00050000-5587-f0c8-9ecf-8d8f92872150	2325	Kidričevo
00050000-5587-f0c8-5e82-ab4f5b07f733	1412	Kisovec
00050000-5587-f0c8-803f-c1013b96581e	6253	Knežak
00050000-5587-f0c8-7e9c-18ab1fe2427f	5222	Kobarid
00050000-5587-f0c8-3ba5-e177c9642f2e	9227	Kobilje
00050000-5587-f0c8-c0ef-30b3e39e859e	1330	Kočevje
00050000-5587-f0c8-ae4e-a040939df3c0	1338	Kočevska Reka
00050000-5587-f0c8-9a9e-0baab17d672d	2276	Kog
00050000-5587-f0c8-08ba-e3d0dbbe0206	5211	Kojsko
00050000-5587-f0c8-d299-bd5cce0b28fa	6223	Komen
00050000-5587-f0c8-1559-a47767cda6a0	1218	Komenda
00050000-5587-f0c8-3abe-0c628f0b1c9b	6000	Koper/Capodistria 
00050000-5587-f0c8-ad01-e499918351b2	6001	Koper/Capodistria - poštni predali
00050000-5587-f0c8-8ee2-9967ee733fd3	8282	Koprivnica
00050000-5587-f0c8-4c97-02ddc9700f51	5296	Kostanjevica na Krasu
00050000-5587-f0c8-9b2c-fa8abc4689dc	8311	Kostanjevica na Krki
00050000-5587-f0c8-25f2-57bfe327fd65	1336	Kostel
00050000-5587-f0c8-ea0e-85edfd8d6b50	6256	Košana
00050000-5587-f0c8-f33a-5f34fbc827b3	2394	Kotlje
00050000-5587-f0c8-93af-f0436b3ad730	6240	Kozina
00050000-5587-f0c8-6ab9-359e196eb1b3	3260	Kozje
00050000-5587-f0c8-e96f-722cafa85bf3	4000	Kranj 
00050000-5587-f0c8-7dad-20ffba14b8ca	4001	Kranj - poštni predali
00050000-5587-f0c8-cca4-cfae3d247275	4280	Kranjska Gora
00050000-5587-f0c8-c268-66e2a336ca92	1281	Kresnice
00050000-5587-f0c8-5d00-c8b623819fea	4294	Križe
00050000-5587-f0c8-e2f2-316ecc6e28ff	9206	Križevci
00050000-5587-f0c8-91bb-b5351087b66d	9242	Križevci pri Ljutomeru
00050000-5587-f0c8-8beb-b0dfc270f080	1301	Krka
00050000-5587-f0c8-c59d-8e8cfb152ecb	8296	Krmelj
00050000-5587-f0c8-7e64-3f9089041124	4245	Kropa
00050000-5587-f0c8-7bbd-db959a7f43d5	8262	Krška vas
00050000-5587-f0c8-c98c-2b8206386eac	8270	Krško
00050000-5587-f0c8-56f8-1295b560795b	9263	Kuzma
00050000-5587-f0c8-9b29-1e555744d1a7	2318	Laporje
00050000-5587-f0c8-37f2-0b09815af157	3270	Laško
00050000-5587-f0c8-1b65-450a975ec16b	1219	Laze v Tuhinju
00050000-5587-f0c8-3a2c-05156265a5de	2230	Lenart v Slovenskih goricah
00050000-5587-f0c8-f739-475f9287a718	9220	Lendava/Lendva
00050000-5587-f0c8-6d8b-b5a29a228cb2	4248	Lesce
00050000-5587-f0c8-d0d6-7ba386c84bf4	3261	Lesično
00050000-5587-f0c8-5c06-f8ab6ed0d738	8273	Leskovec pri Krškem
00050000-5587-f0c8-cf39-3ef09272286c	2372	Libeliče
00050000-5587-f0c8-30ae-071b9924c3c9	2341	Limbuš
00050000-5587-f0c8-2b7e-1784c2502282	1270	Litija
00050000-5587-f0c8-4f82-926e11e18927	3202	Ljubečna
00050000-5587-f0c8-ca1c-043a95e2871f	1000	Ljubljana 
00050000-5587-f0c8-19dd-55f1c3af1451	1001	Ljubljana - poštni predali
00050000-5587-f0c8-636c-882be455572f	1231	Ljubljana - Črnuče
00050000-5587-f0c8-cdcd-479199788b8c	1261	Ljubljana - Dobrunje
00050000-5587-f0c8-c04c-3631bb0329f4	1260	Ljubljana - Polje
00050000-5587-f0c8-95b9-cccc44195351	1210	Ljubljana - Šentvid
00050000-5587-f0c8-e411-0d319c7a0107	1211	Ljubljana - Šmartno
00050000-5587-f0c8-ed51-7304d13c6408	3333	Ljubno ob Savinji
00050000-5587-f0c8-0f70-fc236d384a86	9240	Ljutomer
00050000-5587-f0c8-c909-911081110bb7	3215	Loče
00050000-5587-f0c8-6b91-00fcda3c091e	5231	Log pod Mangartom
00050000-5587-f0c8-9558-ae75fced2cb1	1358	Log pri Brezovici
00050000-5587-f0c8-cd53-41e7a019fd03	1370	Logatec
00050000-5587-f0c8-f2be-3cd9ee86e90a	1371	Logatec
00050000-5587-f0c8-8968-fac34f5ff498	1434	Loka pri Zidanem Mostu
00050000-5587-f0c8-34a0-3036cbdf354f	3223	Loka pri Žusmu
00050000-5587-f0c8-e893-ddd6cebce99a	6219	Lokev
00050000-5587-f0c8-81a1-b356cdea9bf5	1318	Loški Potok
00050000-5587-f0c8-7906-7d17d1b43516	2324	Lovrenc na Dravskem polju
00050000-5587-f0c8-3159-0ccbdd6f873f	2344	Lovrenc na Pohorju
00050000-5587-f0c8-55b1-4d642c6ee679	3334	Luče
00050000-5587-f0c8-babd-980109e2401d	1225	Lukovica
00050000-5587-f0c8-732d-127a26d98234	9202	Mačkovci
00050000-5587-f0c8-0edb-6e15d9319dd1	2322	Majšperk
00050000-5587-f0c8-a546-20ecccecdf68	2321	Makole
00050000-5587-f0c8-ddaf-482c3e6e17c5	9243	Mala Nedelja
00050000-5587-f0c8-d0d4-f572dff2aa07	2229	Malečnik
00050000-5587-f0c8-1d3f-de33c8a3532f	6273	Marezige
00050000-5587-f0c8-63a0-5995a841a460	2000	Maribor 
00050000-5587-f0c8-7383-147a0f575e3d	2001	Maribor - poštni predali
00050000-5587-f0c8-a9be-5c003e71ce98	2206	Marjeta na Dravskem polju
00050000-5587-f0c8-6410-4c316711ba79	2281	Markovci
00050000-5587-f0c8-bcbf-a2abd9dc570c	9221	Martjanci
00050000-5587-f0c8-46ab-ff114cd6f545	6242	Materija
00050000-5587-f0c8-9e00-2dab39af55c6	4211	Mavčiče
00050000-5587-f0c8-a5e6-53635265bb37	1215	Medvode
00050000-5587-f0c8-d4e6-a21d2dfdd323	1234	Mengeš
00050000-5587-f0c8-e309-5c57c67d63d9	8330	Metlika
00050000-5587-f0c8-2dad-4db6c0722228	2392	Mežica
00050000-5587-f0c8-a527-e59abe90148d	2204	Miklavž na Dravskem polju
00050000-5587-f0c8-2cfe-b573bb0671b9	2275	Miklavž pri Ormožu
00050000-5587-f0c8-01fa-5072b761fa2d	5291	Miren
00050000-5587-f0c8-5a60-9e17901f2412	8233	Mirna
00050000-5587-f0c8-4fee-09d89460e6f4	8216	Mirna Peč
00050000-5587-f0c8-d519-a874ab8ffa27	2382	Mislinja
00050000-5587-f0c8-3aab-acee262d4958	4281	Mojstrana
00050000-5587-f0c8-814b-77b8ca0d35a7	8230	Mokronog
00050000-5587-f0c8-5877-be2f595d18dc	1251	Moravče
00050000-5587-f0c8-3809-361d97ee76f0	9226	Moravske Toplice
00050000-5587-f0c8-d152-1bd6c1ab89c2	5216	Most na Soči
00050000-5587-f0c8-b7cd-c2a19f0e06be	1221	Motnik
00050000-5587-f0c8-141c-2ad2e6355588	3330	Mozirje
00050000-5587-f0c8-7477-abaa176476bf	9000	Murska Sobota 
00050000-5587-f0c8-e83b-ec3bf9032455	9001	Murska Sobota - poštni predali
00050000-5587-f0c8-e3a0-858b763368f3	2366	Muta
00050000-5587-f0c8-387f-6d703563e598	4202	Naklo
00050000-5587-f0c8-369b-23b29e83d249	3331	Nazarje
00050000-5587-f0c8-6637-78ab063bcadf	1357	Notranje Gorice
00050000-5587-f0c8-f6cf-14babcf895f3	3203	Nova Cerkev
00050000-5587-f0c8-5aff-250c31d32824	5000	Nova Gorica 
00050000-5587-f0c8-5530-39d81d6d98ad	5001	Nova Gorica - poštni predali
00050000-5587-f0c8-ad19-238d85392a52	1385	Nova vas
00050000-5587-f0c8-750d-1f9f1e1317f6	8000	Novo mesto
00050000-5587-f0c8-13b3-1ba327eca0ce	8001	Novo mesto - poštni predali
00050000-5587-f0c8-5260-b8141c152d07	6243	Obrov
00050000-5587-f0c8-c5b4-d47732facf51	9233	Odranci
00050000-5587-f0c8-69c1-a0fada0d32d7	2317	Oplotnica
00050000-5587-f0c8-549d-636178d36b97	2312	Orehova vas
00050000-5587-f0c8-1622-b861a09ddbc9	2270	Ormož
00050000-5587-f0c8-8dfe-ee4ca848a959	1316	Ortnek
00050000-5587-f0c8-ce72-c8937fa2c994	1337	Osilnica
00050000-5587-f0c8-9461-0bd289c82a8a	8222	Otočec
00050000-5587-f0c8-86be-2bb033243a2a	2361	Ožbalt
00050000-5587-f0c8-2141-160bbea23515	2231	Pernica
00050000-5587-f0c8-2a48-ff3ba5b75f6b	2211	Pesnica pri Mariboru
00050000-5587-f0c8-6278-c58b38b82017	9203	Petrovci
00050000-5587-f0c8-d978-52fcef86ca8a	3301	Petrovče
00050000-5587-f0c8-e587-1fd0c99d1226	6330	Piran/Pirano
00050000-5587-f0c8-df47-0fd95dd7dcf1	8255	Pišece
00050000-5587-f0c8-054c-6d3d391689d5	6257	Pivka
00050000-5587-f0c8-df12-0e3d025cce3e	6232	Planina
00050000-5587-f0c8-40f2-1a48e7a5f561	3225	Planina pri Sevnici
00050000-5587-f0c8-b403-b8d22f260a05	6276	Pobegi
00050000-5587-f0c8-c16c-3240d2a1781d	8312	Podbočje
00050000-5587-f0c8-d23b-3ebc3f39eece	5243	Podbrdo
00050000-5587-f0c8-822c-57ecf960afd9	3254	Podčetrtek
00050000-5587-f0c8-9375-240c8bbd4f19	2273	Podgorci
00050000-5587-f0c8-4f2a-2a2e462720c4	6216	Podgorje
00050000-5587-f0c8-1da7-ae36e0e5637f	2381	Podgorje pri Slovenj Gradcu
00050000-5587-f0c8-ffc6-87bedcade2b3	6244	Podgrad
00050000-5587-f0c8-c005-83a88cb2d692	1414	Podkum
00050000-5587-f0c8-3ab1-ecb83309f3f2	2286	Podlehnik
00050000-5587-f0c8-e5c1-8f2349ba7a06	5272	Podnanos
00050000-5587-f0c8-8e92-bfbfdef78aac	4244	Podnart
00050000-5587-f0c8-d592-e9377e18a5bf	3241	Podplat
00050000-5587-f0c8-1334-80409f941ea6	3257	Podsreda
00050000-5587-f0c8-e699-f6a9c467606f	2363	Podvelka
00050000-5587-f0c8-f5e3-1fa35bf68d6e	2208	Pohorje
00050000-5587-f0c8-ca08-f84f39be755e	2257	Polenšak
00050000-5587-f0c8-3261-54eb943a6d29	1355	Polhov Gradec
00050000-5587-f0c8-2da7-a6581157b9bd	4223	Poljane nad Škofjo Loko
00050000-5587-f0c8-6fc7-90c7efbdff75	2319	Poljčane
00050000-5587-f0c8-4fa7-44924f955b2f	1272	Polšnik
00050000-5587-f0c8-85ff-479993750b33	3313	Polzela
00050000-5587-f0c8-a52e-5d93a04b8602	3232	Ponikva
00050000-5587-f0c8-f428-f3a1723a5b36	6320	Portorož/Portorose
00050000-5587-f0c8-bb1d-6bd543107ea5	6230	Postojna
00050000-5587-f0c8-5238-3feee65abbea	2331	Pragersko
00050000-5587-f0c8-ae82-d03d82363638	3312	Prebold
00050000-5587-f0c8-e949-ede713af7d68	4205	Preddvor
00050000-5587-f0c8-47dc-a78021cb3620	6255	Prem
00050000-5587-f0c8-7703-d3954832c3b7	1352	Preserje
00050000-5587-f0c8-cf65-ae6ee899f21a	6258	Prestranek
00050000-5587-f0c8-3546-cf0d47a2d0e2	2391	Prevalje
00050000-5587-f0c8-10ea-acf3ad94d3e4	3262	Prevorje
00050000-5587-f0c8-2593-c5e724efddcf	1276	Primskovo 
00050000-5587-f0c8-2aa2-87a7ae0d7dea	3253	Pristava pri Mestinju
00050000-5587-f0c8-11eb-3df7fb723992	9207	Prosenjakovci/Partosfalva
00050000-5587-f0c8-e936-11474f9fdf68	5297	Prvačina
00050000-5587-f0c8-4234-3af600556bba	2250	Ptuj
00050000-5587-f0c8-7b87-916fb73946f7	2323	Ptujska Gora
00050000-5587-f0c8-651a-6f4aa8075d15	9201	Puconci
00050000-5587-f0c8-7742-632c3d0fe581	2327	Rače
00050000-5587-f0c8-2a75-324217049d20	1433	Radeče
00050000-5587-f0c8-49ca-f51d9bff783b	9252	Radenci
00050000-5587-f0c8-ee7b-efb874ea8f41	2360	Radlje ob Dravi
00050000-5587-f0c8-64bf-51fefb775165	1235	Radomlje
00050000-5587-f0c8-d8f1-11eaac11bea8	4240	Radovljica
00050000-5587-f0c8-f8f4-50c88394466c	8274	Raka
00050000-5587-f0c8-c6eb-fae01f4ab804	1381	Rakek
00050000-5587-f0c8-bf0c-46cd48b6c55b	4283	Rateče - Planica
00050000-5587-f0c8-44b0-2a9c6c050bcf	2390	Ravne na Koroškem
00050000-5587-f0c8-c50c-19a5162cd14e	9246	Razkrižje
00050000-5587-f0c8-daa9-51e2f7a25f1a	3332	Rečica ob Savinji
00050000-5587-f0c8-6e8a-f3abf2ab59d5	5292	Renče
00050000-5587-f0c8-4673-f78053839d67	1310	Ribnica
00050000-5587-f0c8-e0b6-caf56cac9670	2364	Ribnica na Pohorju
00050000-5587-f0c8-36a2-e1cde4347f80	3272	Rimske Toplice
00050000-5587-f0c8-4a97-4165467a9563	1314	Rob
00050000-5587-f0c8-ffea-151bbde0df73	5215	Ročinj
00050000-5587-f0c8-98aa-83953539be00	3250	Rogaška Slatina
00050000-5587-f0c8-616e-826787b95280	9262	Rogašovci
00050000-5587-f0c8-7454-c84ea113c6d9	3252	Rogatec
00050000-5587-f0c8-400a-b04d2a6822b3	1373	Rovte
00050000-5587-f0c8-6b29-235ce73202e7	2342	Ruše
00050000-5587-f0c8-cf7b-d9b2f20c7a85	1282	Sava
00050000-5587-f0c8-8449-112a75a7978c	6333	Sečovlje/Sicciole
00050000-5587-f0c8-e2fd-4fd96477ac8a	4227	Selca
00050000-5587-f0c8-cd99-942e9a90c9c0	2352	Selnica ob Dravi
00050000-5587-f0c8-c70c-2f760e7084e0	8333	Semič
00050000-5587-f0c8-0752-1c13e5b33398	8281	Senovo
00050000-5587-f0c8-2f71-d321e90c9ff5	6224	Senožeče
00050000-5587-f0c8-5d47-c2cfc69e5482	8290	Sevnica
00050000-5587-f0c8-358d-50ce3865df5f	6210	Sežana
00050000-5587-f0c8-2db5-1d93cde4ed7c	2214	Sladki Vrh
00050000-5587-f0c8-0456-4b3f2732e849	5283	Slap ob Idrijci
00050000-5587-f0c8-1a40-d75f753c653f	2380	Slovenj Gradec
00050000-5587-f0c8-dcbf-c16212acff31	2310	Slovenska Bistrica
00050000-5587-f0c8-3727-5c90416d6f9d	3210	Slovenske Konjice
00050000-5587-f0c8-4858-ed080b251f44	1216	Smlednik
00050000-5587-f0c8-8fb6-54385881b2e4	5232	Soča
00050000-5587-f0c8-2646-d8fee85c5803	1317	Sodražica
00050000-5587-f0c8-da26-a0c7907e1b67	3335	Solčava
00050000-5587-f0c8-2c07-593fbf0683e6	5250	Solkan
00050000-5587-f0c8-e910-94ca7c583714	4229	Sorica
00050000-5587-f0c8-0967-814ce5db65b5	4225	Sovodenj
00050000-5587-f0c8-38dc-69f9f553ee9f	5281	Spodnja Idrija
00050000-5587-f0c8-9312-894b24976c28	2241	Spodnji Duplek
00050000-5587-f0c8-ae2d-e200da501043	9245	Spodnji Ivanjci
00050000-5587-f0c8-0537-d5edcf066e3e	2277	Središče ob Dravi
00050000-5587-f0c8-00c1-79c8cbb70997	4267	Srednja vas v Bohinju
00050000-5587-f0c8-a984-6d1bfc037c29	8256	Sromlje 
00050000-5587-f0c8-9d6f-b10e13b4f138	5224	Srpenica
00050000-5587-f0c8-3af7-ba7dd8030da6	1242	Stahovica
00050000-5587-f0c8-7637-0de71a915afa	1332	Stara Cerkev
00050000-5587-f0c8-ed6c-32d2b62ac1b1	8342	Stari trg ob Kolpi
00050000-5587-f0c8-2a2d-ba6d62ffda7b	1386	Stari trg pri Ložu
00050000-5587-f0c8-aecf-0b5c067d4db0	2205	Starše
00050000-5587-f0c8-cf75-bc4564391c29	2289	Stoperce
00050000-5587-f0c8-fd19-4d02bb4cca82	8322	Stopiče
00050000-5587-f0c8-a997-cb5392fd7164	3206	Stranice
00050000-5587-f0c8-7ec6-a1cc884df65e	8351	Straža
00050000-5587-f0c8-61b7-def01d89daf7	1313	Struge
00050000-5587-f0c8-9e8e-77aaddaa3d4a	8293	Studenec
00050000-5587-f0c8-0e01-6e488b0ff824	8331	Suhor
00050000-5587-f0c8-8c89-73d600e5155a	2233	Sv. Ana v Slovenskih goricah
00050000-5587-f0c8-de7a-e946a89bc2aa	2235	Sv. Trojica v Slovenskih goricah
00050000-5587-f0c8-e387-09788f4c47bc	2353	Sveti Duh na Ostrem Vrhu
00050000-5587-f0c8-a3ea-31774c3f6490	9244	Sveti Jurij ob Ščavnici
00050000-5587-f0c8-28bb-19d9992e551d	3264	Sveti Štefan
00050000-5587-f0c8-a60c-fac9643b2383	2258	Sveti Tomaž
00050000-5587-f0c8-e6dd-bd4c2dd23b48	9204	Šalovci
00050000-5587-f0c8-00a6-3a4c0bd2d2b4	5261	Šempas
00050000-5587-f0c8-4518-bf3a09d9ca29	5290	Šempeter pri Gorici
00050000-5587-f0c8-1b03-8e27d3f31f54	3311	Šempeter v Savinjski dolini
00050000-5587-f0c8-b22e-c9bbe582fbd8	4208	Šenčur
00050000-5587-f0c8-886f-cc60fa366cea	2212	Šentilj v Slovenskih goricah
00050000-5587-f0c8-a3f6-578cc6176b97	8297	Šentjanž
00050000-5587-f0c8-cbb8-5cd5a3adb73a	2373	Šentjanž pri Dravogradu
00050000-5587-f0c8-2f30-67aa3150361f	8310	Šentjernej
00050000-5587-f0c8-c318-9ec1dd327c5e	3230	Šentjur
00050000-5587-f0c8-5c25-2c571d0b52ae	3271	Šentrupert
00050000-5587-f0c8-c73a-6196d88b2d1a	8232	Šentrupert
00050000-5587-f0c8-51f1-5887e72db672	1296	Šentvid pri Stični
00050000-5587-f0c8-c0de-4b091b6405a9	8275	Škocjan
00050000-5587-f0c8-e1d7-793de39aa666	6281	Škofije
00050000-5587-f0c8-386c-41c624e58857	4220	Škofja Loka
00050000-5587-f0c8-8f8e-8e1e42e91b80	3211	Škofja vas
00050000-5587-f0c8-b2d4-bd588138ca4d	1291	Škofljica
00050000-5587-f0c8-83be-578f2defa3c3	6274	Šmarje
00050000-5587-f0c8-61e4-ef670f7f5695	1293	Šmarje - Sap
00050000-5587-f0c8-fa43-f0c244a5236c	3240	Šmarje pri Jelšah
00050000-5587-f0c8-2e64-6ec838f0ca09	8220	Šmarješke Toplice
00050000-5587-f0c8-ad0b-ede098ee443a	2315	Šmartno na Pohorju
00050000-5587-f0c8-a890-8606d1074461	3341	Šmartno ob Dreti
00050000-5587-f0c8-eae0-53dd7f463d12	3327	Šmartno ob Paki
00050000-5587-f0c8-791a-9c3edb960845	1275	Šmartno pri Litiji
00050000-5587-f0c8-5f66-99079269925a	2383	Šmartno pri Slovenj Gradcu
00050000-5587-f0c8-e8b3-c8736ebbb9b5	3201	Šmartno v Rožni dolini
00050000-5587-f0c8-7b02-b52c713faa47	3325	Šoštanj
00050000-5587-f0c8-a70d-85508ab14b3f	6222	Štanjel
00050000-5587-f0c8-67d6-3e46b04a0872	3220	Štore
00050000-5587-f0c8-2ab9-8bf7fcfbd7c3	3304	Tabor
00050000-5587-f0c8-06a3-a1ab67e89fc5	3221	Teharje
00050000-5587-f0c8-67b5-c20976ecef69	9251	Tišina
00050000-5587-f0c8-27d9-01d5f854b4e5	5220	Tolmin
00050000-5587-f0c8-06c3-fa06f08a8b1e	3326	Topolšica
00050000-5587-f0c8-c218-0b2de05d414a	2371	Trbonje
00050000-5587-f0c8-c75d-4c7a1e8d5886	1420	Trbovlje
00050000-5587-f0c8-2f3c-f506f3e6e17a	8231	Trebelno 
00050000-5587-f0c8-90f4-859411dc1f5c	8210	Trebnje
00050000-5587-f0c8-6028-a533e581b009	5252	Trnovo pri Gorici
00050000-5587-f0c8-558e-e0196fe433ca	2254	Trnovska vas
00050000-5587-f0c8-4620-dec370269516	1222	Trojane
00050000-5587-f0c8-69d7-a768a8ad1904	1236	Trzin
00050000-5587-f0c8-138d-69054cb50ecf	4290	Tržič
00050000-5587-f0c8-43f0-a6c96b985c25	8295	Tržišče
00050000-5587-f0c8-14db-8b93bec29cb0	1311	Turjak
00050000-5587-f0c8-7fbe-c4f0e3b6a115	9224	Turnišče
00050000-5587-f0c8-8392-7b7e0e4d26c7	8323	Uršna sela
00050000-5587-f0c8-7ba7-268f1782ebf5	1252	Vače
00050000-5587-f0c8-3349-6d0b09ccc58d	3320	Velenje 
00050000-5587-f0c8-da60-3d697e437a72	3322	Velenje - poštni predali
00050000-5587-f0c8-3f84-f1a443bb003e	8212	Velika Loka
00050000-5587-f0c8-8c30-d6e73bc855c7	2274	Velika Nedelja
00050000-5587-f0c8-0bb8-ca3c91342cfc	9225	Velika Polana
00050000-5587-f0c8-cf3e-84e7c68a3d10	1315	Velike Lašče
00050000-5587-f0c8-d56e-a6798c288ef6	8213	Veliki Gaber
00050000-5587-f0c8-a142-9a54627c4e4e	9241	Veržej
00050000-5587-f0c8-a1aa-a9dca6d5b4e2	1312	Videm - Dobrepolje
00050000-5587-f0c8-b8c7-e719dc11b981	2284	Videm pri Ptuju
00050000-5587-f0c8-1d80-251099787c9d	8344	Vinica
00050000-5587-f0c8-86fb-829203d62273	5271	Vipava
00050000-5587-f0c8-3f5c-0d591a0d5b45	4212	Visoko
00050000-5587-f0c8-37fb-a4774bb065d2	1294	Višnja Gora
00050000-5587-f0c8-368d-7c1b661a4330	3205	Vitanje
00050000-5587-f0c8-e4f6-9bf4f52ab3f5	2255	Vitomarci
00050000-5587-f0c8-b1b3-e288bb58f62e	1217	Vodice
00050000-5587-f0c8-1640-4c60499bf97d	3212	Vojnik\t
00050000-5587-f0c8-7e94-358be0cfae41	5293	Volčja Draga
00050000-5587-f0c8-cfaa-768441e46a62	2232	Voličina
00050000-5587-f0c8-5b29-a6994b66c86f	3305	Vransko
00050000-5587-f0c8-98ec-580f32f777b2	6217	Vremski Britof
00050000-5587-f0c8-d0ef-02ae1ee92f3a	1360	Vrhnika
00050000-5587-f0c8-7547-76783cf5f26a	2365	Vuhred
00050000-5587-f0c8-460b-f0d77d87fdf7	2367	Vuzenica
00050000-5587-f0c8-30d6-2550fc985b8c	8292	Zabukovje 
00050000-5587-f0c8-eb08-96fe7a32a223	1410	Zagorje ob Savi
00050000-5587-f0c8-704a-208c4a9b8d39	1303	Zagradec
00050000-5587-f0c8-e7de-4719497f2977	2283	Zavrč
00050000-5587-f0c8-a1f5-070799f34f86	8272	Zdole 
00050000-5587-f0c8-fe03-06654335098a	4201	Zgornja Besnica
00050000-5587-f0c8-bb13-4f8711c10291	2242	Zgornja Korena
00050000-5587-f0c8-4e7a-04efc24ebabb	2201	Zgornja Kungota
00050000-5587-f0c8-c058-2183aa92627e	2316	Zgornja Ložnica
00050000-5587-f0c8-f1ac-effbc2b2e2d0	2314	Zgornja Polskava
00050000-5587-f0c8-c264-c70a88f609b2	2213	Zgornja Velka
00050000-5587-f0c8-8c0e-61e308a90d8c	4247	Zgornje Gorje
00050000-5587-f0c8-278b-ece250da92ef	4206	Zgornje Jezersko
00050000-5587-f0c8-4d39-1e1d7ab0548c	2285	Zgornji Leskovec
00050000-5587-f0c8-1432-854a72b7c6c1	1432	Zidani Most
00050000-5587-f0c8-124f-0ba10c98ae37	3214	Zreče
00050000-5587-f0c8-2735-a011a74cc3a9	4209	Žabnica
00050000-5587-f0c8-095f-313135580d89	3310	Žalec
00050000-5587-f0c8-daed-a17672dfbbe4	4228	Železniki
00050000-5587-f0c8-7e71-d57db99fb88e	2287	Žetale
00050000-5587-f0c8-af8b-5993475715b1	4226	Žiri
00050000-5587-f0c8-bcb5-f8e04bbb4f3b	4274	Žirovnica
00050000-5587-f0c8-bde2-b53d0bea9b4e	8360	Žužemberk
\.


--
-- TOC entry 2855 (class 0 OID 7898829)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7898640)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7898718)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7898841)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7898961)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7899014)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5587-f0c9-2485-4ce2dcc7a373	00080000-5587-f0c9-a2fd-248bb72c91ba	0900	AK
00190000-5587-f0c9-67fe-9d2ff4765dcc	00080000-5587-f0c9-5006-42d1fa57b96c	0987	A
00190000-5587-f0c9-db78-f39593e75af2	00080000-5587-f0c9-508d-7851a19c371a	0989	A
\.


--
-- TOC entry 2881 (class 0 OID 7899134)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7899197)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7899147)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7899166)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7898870)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5587-f0c9-5791-7febbf47e392	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5587-f0c9-886f-03e6f28ac8e7	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5587-f0c9-5832-6fa84b369f49	0003	Kazinska	t	84	Kazinska dvorana
00220000-5587-f0c9-9d25-d07efcdfa806	0004	Mali oder	t	24	Mali oder 
00220000-5587-f0c9-60dc-bbf7dfe6b87f	0005	Komorni oder	t	15	Komorni oder
00220000-5587-f0c9-6cc6-a778f6a3e5b0	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5587-f0c9-5b70-829745028f22	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2853 (class 0 OID 7898814)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7898804)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7899003)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7898938)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7898512)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2862 (class 0 OID 7898880)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7898550)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5587-f0c7-c798-e87108baee64	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5587-f0c7-08b4-9578816b97ec	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5587-f0c7-d9da-ee517f080d80	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5587-f0c7-ed63-0577b0a23238	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5587-f0c7-b7e9-013b13149eb5	planer	Planer dogodkov v koledarju	t
00020000-5587-f0c7-8fba-d3f6f67f1f48	kadrovska	Kadrovska služba	t
00020000-5587-f0c7-f3df-aa3e1b9d690e	arhivar	Ažuriranje arhivalij	t
00020000-5587-f0c7-54bb-3eeb4b512218	igralec	Igralec	t
00020000-5587-f0c7-cfbb-3cd99852ff6e	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5587-f0c9-4430-59f086c8f9f8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2828 (class 0 OID 7898534)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5587-f0c8-cdfa-1d1eb047a014	00020000-5587-f0c7-d9da-ee517f080d80
00010000-5587-f0c8-41e8-9e69ea16dfa6	00020000-5587-f0c7-d9da-ee517f080d80
00010000-5587-f0c9-70a7-561b5890bb0a	00020000-5587-f0c9-4430-59f086c8f9f8
\.


--
-- TOC entry 2864 (class 0 OID 7898894)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7898835)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7898785)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 7899230)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5587-f0c8-1057-f5866a635b5e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5587-f0c8-ad18-418953bc51c6	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5587-f0c8-814c-93c4733a5fd6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5587-f0c8-e27c-2f523e5c491f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5587-f0c8-853c-6a1fd87e5714	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2887 (class 0 OID 7899222)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5587-f0c8-88e3-c51b22937f74	00230000-5587-f0c8-e27c-2f523e5c491f	popa
00240000-5587-f0c8-e97f-75a24ddd7b21	00230000-5587-f0c8-e27c-2f523e5c491f	oseba
00240000-5587-f0c8-8659-e1a46d9dbbd0	00230000-5587-f0c8-ad18-418953bc51c6	prostor
00240000-5587-f0c8-0330-78c0d459dc9b	00230000-5587-f0c8-e27c-2f523e5c491f	besedilo
00240000-5587-f0c8-682d-ac3fdf0ecaec	00230000-5587-f0c8-e27c-2f523e5c491f	uprizoritev
00240000-5587-f0c8-151c-44ebf361d7b7	00230000-5587-f0c8-e27c-2f523e5c491f	funkcija
00240000-5587-f0c8-fd98-0fdc0077ad7e	00230000-5587-f0c8-e27c-2f523e5c491f	tipfunkcije
00240000-5587-f0c8-67f6-7f3ef1c36ec8	00230000-5587-f0c8-e27c-2f523e5c491f	alternacija
00240000-5587-f0c8-a1a7-3c4329e379d4	00230000-5587-f0c8-1057-f5866a635b5e	pogodba
00240000-5587-f0c8-256c-e08b761b3ae0	00230000-5587-f0c8-e27c-2f523e5c491f	zaposlitev
\.


--
-- TOC entry 2886 (class 0 OID 7899217)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7898948)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5587-f0c9-9228-da74db05ff72	000e0000-5587-f0c9-2f15-4d809ac0b9c9	00080000-5587-f0c9-d04d-3ecf4464b807	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5587-f0c9-72a9-5445c4b1388e	000e0000-5587-f0c9-2f15-4d809ac0b9c9	00080000-5587-f0c9-d04d-3ecf4464b807	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5587-f0c9-dc8a-e9f58f93149f	000e0000-5587-f0c9-2f15-4d809ac0b9c9	00080000-5587-f0c9-848c-14dc0c911137	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2835 (class 0 OID 7898612)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7898791)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5587-f0c9-21b3-e9334686ea9c	00180000-5587-f0c9-e7d3-da86bfba38b4	000c0000-5587-f0c9-82e2-dccf900e0d15	00090000-5587-f0c9-6478-9520f8823264	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5587-f0c9-f6c5-167ce5adbe44	00180000-5587-f0c9-e7d3-da86bfba38b4	000c0000-5587-f0c9-2ef9-107b30d6ef23	00090000-5587-f0c9-4a55-802502b4b88b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5587-f0c9-dde9-c2350ec95f2a	00180000-5587-f0c9-e7d3-da86bfba38b4	000c0000-5587-f0c9-bca1-ac2b2faf838a	00090000-5587-f0c9-1846-f3e599d79810	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5587-f0c9-dfbf-03775b04ed74	00180000-5587-f0c9-e7d3-da86bfba38b4	000c0000-5587-f0c9-b040-5406b1f67696	00090000-5587-f0c9-3093-b2f8a723a59b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5587-f0c9-84bd-6cf10c7fd676	00180000-5587-f0c9-e7d3-da86bfba38b4	000c0000-5587-f0c9-c80d-9b886194f023	00090000-5587-f0c9-b92f-a38a5244cbf6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5587-f0c9-2336-301bb5406f5d	00180000-5587-f0c9-b665-9d0023497936	\N	00090000-5587-f0c9-b92f-a38a5244cbf6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2872 (class 0 OID 7898992)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5587-f0c8-ed1d-6628b28eda2b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5587-f0c8-5149-744bb11696e0	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5587-f0c8-80b2-e0e9040cae1d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5587-f0c8-4704-ec0d02609522	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5587-f0c8-757d-41dab972fbcd	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5587-f0c8-4940-aeb4e6f6993f	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5587-f0c8-37b6-97c9c2d5e361	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5587-f0c8-8f39-e7f29d2b71f4	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5587-f0c8-f442-d59c91a34191	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5587-f0c8-14bf-814e44248943	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5587-f0c8-ffa2-e88b603a19c9	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5587-f0c8-e63e-3245a9cf804e	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5587-f0c8-5e10-9393dfb900a6	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5587-f0c8-8da3-c15e659c588e	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5587-f0c8-57ec-e1912a7a153c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5587-f0c8-c0f1-a087004486bc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2884 (class 0 OID 7899186)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5587-f0c8-dfcf-bb6f8e503365	01	Velika predstava	f	1.00	1.00
002b0000-5587-f0c8-9af9-1bc3f22dd3cf	02	Mala predstava	f	0.50	0.50
002b0000-5587-f0c8-66ee-ff878695d199	03	Mala koprodukcija	t	0.40	1.00
002b0000-5587-f0c8-2823-fe0147180cde	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5587-f0c8-21ba-a2d3f7f11a53	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2840 (class 0 OID 7898675)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 7898521)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5587-f0c8-41e8-9e69ea16dfa6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROE/AmEzeVpzzz5vMjPMjXB2LPiNHjZ/C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-979e-5fded465ce5b	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-db05-1d31573b28e3	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-7afb-0e4d498afdc5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-e787-86262a642648	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-675d-b05beaddc673	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-2ce2-09ddebc44b7c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-60d3-a10520f2a839	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-cb03-fb69f261d528	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-f497-e98450aaca7e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5587-f0c9-70a7-561b5890bb0a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5587-f0c8-cdfa-1d1eb047a014	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7899049)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5587-f0c9-6f58-6dd1adbed484	00160000-5587-f0c9-3a1c-27d426d7695f	00150000-5587-f0c8-3611-48e4d7af3935	00140000-5587-f0c7-fcfa-acc94daf3bfb	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5587-f0c9-60dc-bbf7dfe6b87f
000e0000-5587-f0c9-2f15-4d809ac0b9c9	00160000-5587-f0c9-42f2-62527ac192da	00150000-5587-f0c8-4973-fef9ee0a1f01	00140000-5587-f0c7-8efb-3698f0968e88	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5587-f0c9-6cc6-a778f6a3e5b0
000e0000-5587-f0c9-32a5-22570ff6df6d	\N	00150000-5587-f0c8-4973-fef9ee0a1f01	00140000-5587-f0c7-8efb-3698f0968e88	00190000-5587-f0c9-67fe-9d2ff4765dcc	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5587-f0c9-60dc-bbf7dfe6b87f
000e0000-5587-f0c9-ec30-1ae644da0b29	\N	00150000-5587-f0c8-4973-fef9ee0a1f01	00140000-5587-f0c7-8efb-3698f0968e88	00190000-5587-f0c9-67fe-9d2ff4765dcc	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5587-f0c9-60dc-bbf7dfe6b87f
\.


--
-- TOC entry 2845 (class 0 OID 7898737)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5587-f0c9-64c5-a73dab9e968d	000e0000-5587-f0c9-2f15-4d809ac0b9c9	1	
00200000-5587-f0c9-15ee-b8f91f758cb6	000e0000-5587-f0c9-2f15-4d809ac0b9c9	2	
\.


--
-- TOC entry 2860 (class 0 OID 7898862)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7898931)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7898769)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 7899039)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5587-f0c7-fcfa-acc94daf3bfb	01	Drama	drama (SURS 01)
00140000-5587-f0c7-f393-379ad2e447a7	02	Opera	opera (SURS 02)
00140000-5587-f0c7-6e3b-c75f7ee55cf0	03	Balet	balet (SURS 03)
00140000-5587-f0c7-0556-5078065e2883	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5587-f0c7-910d-d3155c792f50	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5587-f0c7-8efb-3698f0968e88	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5587-f0c7-fb81-9022b2e57dc3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2866 (class 0 OID 7898921)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5587-f0c8-7216-27364f2d1562	01	Opera	opera
00150000-5587-f0c8-9c11-574f2767602f	02	Opereta	opereta
00150000-5587-f0c8-0056-4522023ee1c2	03	Balet	balet
00150000-5587-f0c8-e1c0-2b6c80380fbe	04	Plesne prireditve	plesne prireditve
00150000-5587-f0c8-f908-2b3d163ae379	05	Lutkovno gledališče	lutkovno gledališče
00150000-5587-f0c8-78b4-6f709f36dbe0	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5587-f0c8-a5ce-e693d89993cd	07	Biografska drama	biografska drama
00150000-5587-f0c8-3611-48e4d7af3935	08	Komedija	komedija
00150000-5587-f0c8-c23b-df412c6feba8	09	Črna komedija	črna komedija
00150000-5587-f0c8-743a-4c979fa33e1f	10	E-igra	E-igra
00150000-5587-f0c8-4973-fef9ee0a1f01	11	Kriminalka	kriminalka
00150000-5587-f0c8-11aa-146fffff32cd	12	Musical	musical
\.


--
-- TOC entry 2408 (class 2606 OID 7898575)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 7899096)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 7899086)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 7898991)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 7898759)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 7898784)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 7898701)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 7899130)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 7898917)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 7898735)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7898778)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7898715)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 7898827)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 7898854)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7898673)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 7898584)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2415 (class 2606 OID 7898608)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 7898564)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2399 (class 2606 OID 7898549)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7898860)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7898893)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 7899034)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7898637)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 7898661)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 7898833)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7898651)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 7898722)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7898845)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 7898973)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 7899019)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7899145)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7899215)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7899183)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7898877)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 7898818)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2492 (class 2606 OID 7898809)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 7899013)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 7898945)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 7898520)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 7898884)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 7898538)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2401 (class 2606 OID 7898558)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 7898902)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 7898840)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7898790)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 7899239)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 7899227)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 7899221)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 7898958)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 7898617)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 7898800)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7899002)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7899196)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 7898686)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 7898533)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7899065)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 7898744)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 7898868)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 7898936)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7898773)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 7899047)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 7898929)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 1259 OID 7898766)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2548 (class 1259 OID 7898959)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 7898960)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2422 (class 1259 OID 7898639)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2381 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2382 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2383 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2513 (class 1259 OID 7898861)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2507 (class 1259 OID 7898847)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2508 (class 1259 OID 7898846)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2459 (class 1259 OID 7898745)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7898918)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2536 (class 1259 OID 7898920)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2537 (class 1259 OID 7898919)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2447 (class 1259 OID 7898717)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2448 (class 1259 OID 7898716)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7899036)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2567 (class 1259 OID 7899037)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2568 (class 1259 OID 7899038)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2608 (class 1259 OID 7899185)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2609 (class 1259 OID 7899184)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2575 (class 1259 OID 7899070)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2576 (class 1259 OID 7899067)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2577 (class 1259 OID 7899071)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2578 (class 1259 OID 7899069)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2579 (class 1259 OID 7899068)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2437 (class 1259 OID 7898688)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2438 (class 1259 OID 7898687)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2413 (class 1259 OID 7898611)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2523 (class 1259 OID 7898885)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2477 (class 1259 OID 7898779)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2403 (class 1259 OID 7898565)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2404 (class 1259 OID 7898566)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2528 (class 1259 OID 7898905)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 7898904)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2530 (class 1259 OID 7898903)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2451 (class 1259 OID 7898723)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2452 (class 1259 OID 7898725)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2453 (class 1259 OID 7898724)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2619 (class 1259 OID 7899229)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2487 (class 1259 OID 7898813)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2488 (class 1259 OID 7898811)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2489 (class 1259 OID 7898810)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2490 (class 1259 OID 7898812)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2394 (class 1259 OID 7898539)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2395 (class 1259 OID 7898540)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2516 (class 1259 OID 7898869)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2502 (class 1259 OID 7898834)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2544 (class 1259 OID 7898946)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2545 (class 1259 OID 7898947)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7899131)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2598 (class 1259 OID 7899132)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2599 (class 1259 OID 7899133)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2426 (class 1259 OID 7898653)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2427 (class 1259 OID 7898652)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2428 (class 1259 OID 7898654)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 7899216)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 7898974)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2553 (class 1259 OID 7898975)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2589 (class 1259 OID 7899100)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 7899102)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2591 (class 1259 OID 7899098)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2592 (class 1259 OID 7899101)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2593 (class 1259 OID 7899099)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2541 (class 1259 OID 7898937)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2493 (class 1259 OID 7898822)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2494 (class 1259 OID 7898821)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2495 (class 1259 OID 7898819)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2496 (class 1259 OID 7898820)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2377 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2585 (class 1259 OID 7899088)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2586 (class 1259 OID 7899087)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2600 (class 1259 OID 7899146)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2458 (class 1259 OID 7898736)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2409 (class 1259 OID 7898586)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2410 (class 1259 OID 7898585)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2418 (class 1259 OID 7898618)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2419 (class 1259 OID 7898619)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2482 (class 1259 OID 7898803)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2483 (class 1259 OID 7898802)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2484 (class 1259 OID 7898801)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2603 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2605 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2465 (class 1259 OID 7898768)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2466 (class 1259 OID 7898764)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2467 (class 1259 OID 7898761)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2468 (class 1259 OID 7898762)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2469 (class 1259 OID 7898760)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2470 (class 1259 OID 7898765)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2471 (class 1259 OID 7898763)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2425 (class 1259 OID 7898638)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7898702)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 7898704)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2445 (class 1259 OID 7898703)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2446 (class 1259 OID 7898705)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2501 (class 1259 OID 7898828)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 7899035)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 7899066)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7898609)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2417 (class 1259 OID 7898610)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2538 (class 1259 OID 7898930)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 7899240)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2436 (class 1259 OID 7898674)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2622 (class 1259 OID 7899228)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2521 (class 1259 OID 7898879)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2522 (class 1259 OID 7898878)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 7899097)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2433 (class 1259 OID 7898662)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 7899048)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7899020)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2565 (class 1259 OID 7899021)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2402 (class 1259 OID 7898559)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2472 (class 1259 OID 7898767)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2651 (class 2606 OID 7899376)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2654 (class 2606 OID 7899361)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2653 (class 2606 OID 7899366)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2649 (class 2606 OID 7899386)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2655 (class 2606 OID 7899356)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2650 (class 2606 OID 7899381)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2652 (class 2606 OID 7899371)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2685 (class 2606 OID 7899531)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 7899536)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7899291)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2672 (class 2606 OID 7899471)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2670 (class 2606 OID 7899466)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2671 (class 2606 OID 7899461)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2648 (class 2606 OID 7899351)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2680 (class 2606 OID 7899501)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2678 (class 2606 OID 7899511)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2679 (class 2606 OID 7899506)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2642 (class 2606 OID 7899326)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2643 (class 2606 OID 7899321)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2668 (class 2606 OID 7899451)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2691 (class 2606 OID 7899556)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2690 (class 2606 OID 7899561)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2689 (class 2606 OID 7899566)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 7899671)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2712 (class 2606 OID 7899666)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2693 (class 2606 OID 7899586)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2696 (class 2606 OID 7899571)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2692 (class 2606 OID 7899591)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2694 (class 2606 OID 7899581)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2695 (class 2606 OID 7899576)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2640 (class 2606 OID 7899316)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2641 (class 2606 OID 7899311)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7899276)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2633 (class 2606 OID 7899271)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2674 (class 2606 OID 7899481)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2656 (class 2606 OID 7899391)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2629 (class 2606 OID 7899251)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2628 (class 2606 OID 7899256)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2675 (class 2606 OID 7899496)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2676 (class 2606 OID 7899491)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2677 (class 2606 OID 7899486)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2646 (class 2606 OID 7899331)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 7899341)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2645 (class 2606 OID 7899336)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2714 (class 2606 OID 7899681)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2660 (class 2606 OID 7899426)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2662 (class 2606 OID 7899416)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2663 (class 2606 OID 7899411)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2661 (class 2606 OID 7899421)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2627 (class 2606 OID 7899241)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7899246)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2673 (class 2606 OID 7899476)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2669 (class 2606 OID 7899456)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2683 (class 2606 OID 7899521)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2682 (class 2606 OID 7899526)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2706 (class 2606 OID 7899631)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7899636)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2704 (class 2606 OID 7899641)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2638 (class 2606 OID 7899301)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2639 (class 2606 OID 7899296)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 7899306)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2713 (class 2606 OID 7899676)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2687 (class 2606 OID 7899541)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2686 (class 2606 OID 7899546)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2701 (class 2606 OID 7899616)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2699 (class 2606 OID 7899626)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2703 (class 2606 OID 7899606)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2700 (class 2606 OID 7899621)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2702 (class 2606 OID 7899611)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2681 (class 2606 OID 7899516)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 7899446)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2665 (class 2606 OID 7899441)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2667 (class 2606 OID 7899431)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2666 (class 2606 OID 7899436)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 7899601)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 7899596)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7899646)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2647 (class 2606 OID 7899346)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2688 (class 2606 OID 7899551)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 7899266)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2631 (class 2606 OID 7899261)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2635 (class 2606 OID 7899281)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7899286)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2657 (class 2606 OID 7899406)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 7899401)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2659 (class 2606 OID 7899396)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2708 (class 2606 OID 7899661)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 7899651)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 7899656)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-22 13:26:02 CEST

--
-- PostgreSQL database dump complete
--

