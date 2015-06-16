--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-16 17:08:43 CEST

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
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 7477406)
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
-- TOC entry 227 (class 1259 OID 7477928)
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
-- TOC entry 226 (class 1259 OID 7477911)
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
-- TOC entry 219 (class 1259 OID 7477815)
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
-- TOC entry 194 (class 1259 OID 7477585)
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
-- TOC entry 197 (class 1259 OID 7477619)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7477528)
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
-- TOC entry 228 (class 1259 OID 7477942)
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
    tip character varying(20) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 7477745)
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
-- TOC entry 192 (class 1259 OID 7477565)
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
-- TOC entry 196 (class 1259 OID 7477613)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7477545)
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
-- TOC entry 202 (class 1259 OID 7477662)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7477687)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7477502)
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
-- TOC entry 181 (class 1259 OID 7477415)
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
-- TOC entry 182 (class 1259 OID 7477426)
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
-- TOC entry 177 (class 1259 OID 7477380)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7477399)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7477694)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7477725)
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
-- TOC entry 223 (class 1259 OID 7477861)
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
-- TOC entry 184 (class 1259 OID 7477459)
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
-- TOC entry 186 (class 1259 OID 7477494)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7477668)
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
-- TOC entry 185 (class 1259 OID 7477479)
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
-- TOC entry 191 (class 1259 OID 7477557)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7477680)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7477800)
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
-- TOC entry 222 (class 1259 OID 7477853)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7477972)
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
-- TOC entry 233 (class 1259 OID 7478035)
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
-- TOC entry 230 (class 1259 OID 7477985)
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
-- TOC entry 231 (class 1259 OID 7478004)
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
-- TOC entry 209 (class 1259 OID 7477709)
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
-- TOC entry 201 (class 1259 OID 7477653)
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
-- TOC entry 200 (class 1259 OID 7477643)
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
-- TOC entry 221 (class 1259 OID 7477842)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7477777)
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
-- TOC entry 174 (class 1259 OID 7477351)
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
-- TOC entry 173 (class 1259 OID 7477349)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 7477719)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7477389)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7477373)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7477733)
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
-- TOC entry 204 (class 1259 OID 7477674)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7477624)
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
-- TOC entry 236 (class 1259 OID 7478068)
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
-- TOC entry 235 (class 1259 OID 7478060)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7478055)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7477787)
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
-- TOC entry 183 (class 1259 OID 7477451)
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
-- TOC entry 199 (class 1259 OID 7477630)
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
-- TOC entry 220 (class 1259 OID 7477831)
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
-- TOC entry 232 (class 1259 OID 7478024)
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
-- TOC entry 188 (class 1259 OID 7477514)
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
-- TOC entry 175 (class 1259 OID 7477360)
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
-- TOC entry 225 (class 1259 OID 7477888)
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
-- TOC entry 193 (class 1259 OID 7477576)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7477701)
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
-- TOC entry 215 (class 1259 OID 7477770)
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
-- TOC entry 195 (class 1259 OID 7477608)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7477878)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7477760)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7477354)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7477406)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7477928)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5580-3bfa-7dab-eb5d286cac0a	000d0000-5580-3bfa-da65-1a2cea33ae46	\N	00090000-5580-3bfa-737f-b0b6a7f4d04f	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-3bfa-b42a-ecf30be9a1bb	000d0000-5580-3bfa-61bc-6fc05cacb4a1	\N	00090000-5580-3bfa-0a97-bdfff8302be5	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-3bfa-ab79-f7927cd02249	000d0000-5580-3bfa-5782-08c30f007a90	\N	00090000-5580-3bfa-2f68-d4fca76cae79	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-3bfa-b14d-af7ac27d1efd	000d0000-5580-3bfa-65f3-ca1b4563fd9e	\N	00090000-5580-3bfa-8304-292882ec5b0f	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-3bfa-3cac-041368cff785	000d0000-5580-3bfa-8525-9deeafe96413	\N	00090000-5580-3bfa-255b-44de577d95c0	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-3bfa-7536-42bbefd8450e	000d0000-5580-3bfa-b423-75552bf3b9c9	\N	00090000-5580-3bfa-0a97-bdfff8302be5	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7477911)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7477815)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5580-3bfa-09ff-01d745f94b75	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5580-3bfa-33e5-668e90a976cf	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5580-3bfa-6aa7-0cb8b5726545	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7477585)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5580-3bfa-6d70-522c48580f15	\N	\N	00200000-5580-3bfa-0494-b2f83947ff73	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5580-3bfa-4fb3-f868084a10b5	\N	\N	00200000-5580-3bfa-cef0-101b7b3518da	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5580-3bfa-3d7e-e212a2c2f95f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5580-3bfa-65d3-449eb5af7e57	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5580-3bfa-b4bc-92c971eb6461	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7477619)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7477528)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5580-3bf8-6f24-ec8d6dd09587	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5580-3bf8-4542-fb786081af31	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5580-3bf8-9b79-7b4ca7a0563f	AL	ALB	008	Albania 	Albanija	\N
00040000-5580-3bf8-4ff1-5b7822549954	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5580-3bf8-7d81-e4630e3076c8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5580-3bf8-5f89-59950230c8a3	AD	AND	020	Andorra 	Andora	\N
00040000-5580-3bf8-d893-407d5aa833ee	AO	AGO	024	Angola 	Angola	\N
00040000-5580-3bf8-af57-e532af157cf3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5580-3bf8-734f-75c21179c51a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5580-3bf8-cb33-bac3f48d988b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5580-3bf8-162c-b43e88b779f8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5580-3bf8-c18b-c7594c185970	AM	ARM	051	Armenia 	Armenija	\N
00040000-5580-3bf8-185c-1bbe12ac7a6d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5580-3bf8-bdb9-bfe1770cea12	AU	AUS	036	Australia 	Avstralija	\N
00040000-5580-3bf8-668f-c371a20993c5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5580-3bf8-04d8-3d56102c5ed4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5580-3bf8-998d-81da99b6a7a9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5580-3bf8-b5c3-e9d2f6d74360	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5580-3bf8-d23a-bd7b1829e2aa	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5580-3bf8-e7f0-d8f31039fd85	BB	BRB	052	Barbados 	Barbados	\N
00040000-5580-3bf8-831d-8b6c824eca12	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5580-3bf8-9085-232270856d44	BE	BEL	056	Belgium 	Belgija	\N
00040000-5580-3bf8-b0eb-e33806654d4e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5580-3bf8-a947-e4e174f06f1f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5580-3bf8-ef57-4c38f7422bf6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5580-3bf8-548c-f1181c0f2d88	BT	BTN	064	Bhutan 	Butan	\N
00040000-5580-3bf8-7d46-80cfbb4fd316	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5580-3bf8-31e6-bd02537c573c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5580-3bf8-1abb-6f936e97c3fb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5580-3bf8-cbd2-b35937a61c35	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5580-3bf8-9913-d6c41787047a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5580-3bf8-8912-b4c08461c8a9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5580-3bf8-c911-86f37ebd001e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5580-3bf8-715a-eda892167bb2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5580-3bf8-d6bb-349707d10baa	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5580-3bf8-bc3f-f7bfb99d5b53	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5580-3bf8-06af-0d11ee29908f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5580-3bf8-89fe-d65065cc1966	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5580-3bf8-e776-e220a3aa622f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5580-3bf8-2579-992ae744cb05	CA	CAN	124	Canada 	Kanada	\N
00040000-5580-3bf8-3149-2f0d7958152c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5580-3bf8-5a06-ed442773d879	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5580-3bf8-f30a-e34f9b73769e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5580-3bf8-bdd3-1cdbec1f1139	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5580-3bf8-fd4a-da43e1c24dab	CL	CHL	152	Chile 	Čile	\N
00040000-5580-3bf8-f872-d5775e85cf6a	CN	CHN	156	China 	Kitajska	\N
00040000-5580-3bf8-40a2-8f8705e15b69	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5580-3bf8-a735-de6e291d5e90	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5580-3bf8-cd12-2e236dbc7281	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5580-3bf8-28b8-90af901e9268	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5580-3bf8-b40b-99a9583bb1c7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5580-3bf8-06bf-8775e44aa30e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5580-3bf8-fb65-63de79b18d95	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5580-3bf8-177c-9a905a917407	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5580-3bf8-3420-e3e7f106278a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5580-3bf8-b930-fbdfe1bab96b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5580-3bf8-b0ad-40e458b30501	CU	CUB	192	Cuba 	Kuba	\N
00040000-5580-3bf8-543c-4fcf478dbcfc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5580-3bf8-6b76-49829ea65518	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5580-3bf8-3d47-d68adb1f94bf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5580-3bf8-88fd-7cbf54041196	DK	DNK	208	Denmark 	Danska	\N
00040000-5580-3bf8-e123-d712d0e0bd88	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5580-3bf8-82b4-8fb59c972fd9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5580-3bf8-df10-43fc937f2a59	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5580-3bf8-144f-16f9d849768f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5580-3bf8-9404-e1b380aa8109	EG	EGY	818	Egypt 	Egipt	\N
00040000-5580-3bf8-502d-80cdcfbb0c3f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5580-3bf8-8ac7-aee34c77ad3e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5580-3bf8-c6a3-ba2acce97e75	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5580-3bf8-40aa-b195df4f2db7	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5580-3bf8-eb09-b46d54d51c41	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5580-3bf8-f76c-d8a3fc34499a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5580-3bf8-79e4-3d7ea932dc21	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5580-3bf8-b764-99111d5d967e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5580-3bf8-d245-e9da49879eef	FI	FIN	246	Finland 	Finska	\N
00040000-5580-3bf8-fb12-e590a7b63624	FR	FRA	250	France 	Francija	\N
00040000-5580-3bf8-7d0b-cac23a163537	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5580-3bf8-e4a0-4890651a7c06	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5580-3bf8-bcd5-de6e9c3af5bb	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5580-3bf8-69e5-80c7328cf06a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5580-3bf8-6b8b-0a0cc6fa97f8	GA	GAB	266	Gabon 	Gabon	\N
00040000-5580-3bf8-8023-5ae420346124	GM	GMB	270	Gambia 	Gambija	\N
00040000-5580-3bf8-e066-d120f21afcd3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5580-3bf8-d45c-5a47e354e30a	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5580-3bf8-7dd1-46e39277f1f1	GH	GHA	288	Ghana 	Gana	\N
00040000-5580-3bf8-4941-7a9f9eaaa5b9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5580-3bf8-dabf-02e12ebcf114	GR	GRC	300	Greece 	Grčija	\N
00040000-5580-3bf8-26f1-d6921313b3f8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5580-3bf8-80be-46920dfb19d5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5580-3bf8-351b-3626a4579e33	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5580-3bf8-8dbb-c0608fcc7a73	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5580-3bf8-65f3-36fbb1238d13	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5580-3bf8-bd7b-85f04811ce7e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5580-3bf8-b2a3-404f496e0050	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5580-3bf8-32f7-edff6399788b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5580-3bf8-e019-08413705e98d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5580-3bf8-f8c8-0dc22876440e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5580-3bf8-b945-210e2489e088	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5580-3bf8-fc55-9671eb421b85	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5580-3bf8-dca3-ca5e3a3074a2	HN	HND	340	Honduras 	Honduras	\N
00040000-5580-3bf8-b6b3-5ee8f54881bc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5580-3bf8-f305-538c4c2e5e2e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5580-3bf8-d6a9-894329aa8c05	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5580-3bf8-2a85-7b6dde5823a8	IN	IND	356	India 	Indija	\N
00040000-5580-3bf8-c9d0-3cb5b23646e8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5580-3bf8-97ba-3964a700a24e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5580-3bf8-e67d-8fa7462a0c17	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5580-3bf8-de0c-11871bdceeb6	IE	IRL	372	Ireland 	Irska	\N
00040000-5580-3bf8-89eb-a0beb3dacc50	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5580-3bf8-7fda-d00310724c39	IL	ISR	376	Israel 	Izrael	\N
00040000-5580-3bf8-dbb0-856989fbabea	IT	ITA	380	Italy 	Italija	\N
00040000-5580-3bf8-da04-3c6f59d3a1af	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5580-3bf8-051f-2d052b39bc77	JP	JPN	392	Japan 	Japonska	\N
00040000-5580-3bf8-f805-6623c37b0aca	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5580-3bf8-485f-89637f18308a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5580-3bf8-4ed4-efa27fc78831	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5580-3bf8-431e-13688119ad72	KE	KEN	404	Kenya 	Kenija	\N
00040000-5580-3bf8-1f64-fe7269723ba1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5580-3bf8-acd6-acbc3b15b090	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5580-3bf8-1f13-7208b5d74a20	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5580-3bf8-6026-d00b8ad5c452	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5580-3bf8-cdb6-8949f493fad3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5580-3bf8-cefc-e0eb7490f4d7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5580-3bf8-7774-0d50de2a992e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5580-3bf8-6eab-bf7366c65057	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5580-3bf8-e5d7-cc9b9642cc59	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5580-3bf8-ece6-548b0c0ec218	LR	LBR	430	Liberia 	Liberija	\N
00040000-5580-3bf8-e7e9-af2f41ad9775	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5580-3bf8-9376-b62378b1b954	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5580-3bf8-bb5a-2ce4709227f9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5580-3bf8-d7c2-932e3df9dea6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5580-3bf8-ace2-8c6a9189fdcc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5580-3bf8-8e90-9001b53cfda1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5580-3bf8-1b4a-12ad20e5e5e0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5580-3bf8-5c72-f1c6f1ce7ed3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5580-3bf8-2178-7b642f3f1843	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5580-3bf8-3e98-ab8cdc3063a6	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5580-3bf8-280e-8295b631aba8	ML	MLI	466	Mali 	Mali	\N
00040000-5580-3bf8-aefb-b8a869af8637	MT	MLT	470	Malta 	Malta	\N
00040000-5580-3bf8-a126-31bb3c55334a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5580-3bf8-8c11-04a5eda14015	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5580-3bf8-4b82-d1c14b307745	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5580-3bf8-f2b8-769d6ed44e02	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5580-3bf8-2b22-fa089b32b2af	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5580-3bf8-489f-558740f6cd3f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5580-3bf8-68ae-37659a658a20	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5580-3bf8-8954-64334f13e12c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5580-3bf8-f925-cd7f978af74e	MC	MCO	492	Monaco 	Monako	\N
00040000-5580-3bf8-23f9-60558dca6e8f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5580-3bf8-e78b-449a7c841d49	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5580-3bf8-1d9d-ea21f745b64d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5580-3bf8-98e3-b2c0b578ee79	MA	MAR	504	Morocco 	Maroko	\N
00040000-5580-3bf8-d81c-344bbc2a7d3f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5580-3bf8-a9f5-b46a84949a9d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5580-3bf8-e2f1-3e86cbdb4366	NA	NAM	516	Namibia 	Namibija	\N
00040000-5580-3bf8-562f-b1938a76b684	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5580-3bf8-c00e-ff7eef0b6a46	NP	NPL	524	Nepal 	Nepal	\N
00040000-5580-3bf8-a794-b3f4f9309f6a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5580-3bf8-7b62-19bc76991a59	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5580-3bf8-5180-d1795f3bad2a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5580-3bf8-3a1c-42cff6043893	NE	NER	562	Niger 	Niger 	\N
00040000-5580-3bf8-9933-f562fe4d15fe	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5580-3bf8-f496-9a4c399138db	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5580-3bf8-72ba-230821499e64	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5580-3bf8-1e92-fea3e613bc75	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5580-3bf8-036f-d12111eb8ec2	NO	NOR	578	Norway 	Norveška	\N
00040000-5580-3bf8-fed8-54df2d397de1	OM	OMN	512	Oman 	Oman	\N
00040000-5580-3bf8-fb8e-71d6965aebe8	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5580-3bf8-9b06-af7ccd263f4d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5580-3bf8-3ef2-21d631e134f0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5580-3bf8-b2c8-f88d3e43ba53	PA	PAN	591	Panama 	Panama	\N
00040000-5580-3bf8-f88c-da72ea57acbc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5580-3bf8-cc64-d699b68c3d0c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5580-3bf8-776e-8e0342f56cc7	PE	PER	604	Peru 	Peru	\N
00040000-5580-3bf8-74b2-7d0aa9bace21	PH	PHL	608	Philippines 	Filipini	\N
00040000-5580-3bf8-25fe-5c6b65537b11	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5580-3bf8-f938-4a7b6cf40a4d	PL	POL	616	Poland 	Poljska	\N
00040000-5580-3bf8-5e94-902c5c5dae64	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5580-3bf8-b6eb-23b40f544de1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5580-3bf8-d952-e2f2f4a983a9	QA	QAT	634	Qatar 	Katar	\N
00040000-5580-3bf8-934e-db879ccb4b7c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5580-3bf8-93d2-5f2b16daf1fb	RO	ROU	642	Romania 	Romunija	\N
00040000-5580-3bf8-4c7a-3fe5a20569aa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5580-3bf8-da9a-ce33c0c37e0a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5580-3bf8-c2e8-8e0d0d3d56e4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5580-3bf8-41fe-07522830ec11	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5580-3bf8-1cee-6185af6695d3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5580-3bf8-036f-38f38a992d27	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5580-3bf8-6a62-124cc745e6a6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5580-3bf8-bd84-e3b4e75d05c1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5580-3bf8-670f-83c5bc0c63a9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5580-3bf8-a4de-07f6dc0d01ed	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5580-3bf8-0fb3-0d202d7bd749	SM	SMR	674	San Marino 	San Marino	\N
00040000-5580-3bf8-ec19-09de95ff9771	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5580-3bf8-592b-d08a190e86fe	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5580-3bf8-eb12-c180bb63f4e5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5580-3bf8-99d2-adcc2f9dab6d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5580-3bf8-b837-15e4777d3072	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5580-3bf8-0d06-69b0c5cd87ed	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5580-3bf8-bb32-c2625a038861	SG	SGP	702	Singapore 	Singapur	\N
00040000-5580-3bf8-b3ca-0f8f701cf54a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5580-3bf8-3af2-0e9a0d33b1e9	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5580-3bf8-27e5-8b521e50ff6a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5580-3bf8-fd00-434c1ce0ace6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5580-3bf8-eb7c-98544d6e17fb	SO	SOM	706	Somalia 	Somalija	\N
00040000-5580-3bf8-d676-48ec47f4a40c	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5580-3bf8-a205-599366debd92	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5580-3bf8-fdff-635c1c6a5c60	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5580-3bf8-193f-091d0a6f04f6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5580-3bf8-b051-2ab3e7ad069e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5580-3bf8-373a-20195e6052b4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5580-3bf8-0080-bc1b801b98d2	SR	SUR	740	Suriname 	Surinam	\N
00040000-5580-3bf8-4ddf-7dbff276ea18	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5580-3bf8-1490-3af1670b4347	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5580-3bf8-458b-58caad1b0c73	SE	SWE	752	Sweden 	Švedska	\N
00040000-5580-3bf8-125b-12da09b01b2e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5580-3bf8-c33c-c1885ed6094f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5580-3bf8-977e-60776dcfcfe3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5580-3bf8-cc02-607ebbf14da3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5580-3bf8-5e8b-ebc52121db1c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5580-3bf8-84e2-7b41272546ff	TH	THA	764	Thailand 	Tajska	\N
00040000-5580-3bf8-b7c7-5772e7a82a12	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5580-3bf8-742d-32a0904bf519	TG	TGO	768	Togo 	Togo	\N
00040000-5580-3bf8-e793-5c7fbf0c9f5d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5580-3bf8-4a81-ab36d1344bf8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5580-3bf8-508b-8944a7e75ca3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5580-3bf8-e153-77e3ade78633	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5580-3bf8-0666-b370ed5559f6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5580-3bf8-5081-1041f39d19cb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5580-3bf8-2377-2bf8523baf2a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5580-3bf8-662b-f2a9c28d13e5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5580-3bf8-0028-7cd6b50400ab	UG	UGA	800	Uganda 	Uganda	\N
00040000-5580-3bf8-cf46-3c53e938cbcd	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5580-3bf8-418a-0d174a3ce6c6	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5580-3bf8-b4e5-313adf49d6be	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5580-3bf8-b489-cd8e37d82c72	US	USA	840	United States 	Združene države Amerike	\N
00040000-5580-3bf8-ece4-5afb5890511f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5580-3bf8-d41e-1366aa8bb295	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5580-3bf8-9708-e0ded7ca2e41	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5580-3bf8-372e-3227a502e876	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5580-3bf8-3f4a-30d2e522a6b5	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5580-3bf8-c9d1-c5588cea35f5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5580-3bf8-e2b9-70cd7be2d3a0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5580-3bf8-5f8e-c66f0ba18901	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5580-3bf8-298f-cbc8a1af7e49	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5580-3bf8-adce-f7b2345f7b22	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5580-3bf8-11c6-f68160d1cbc2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5580-3bf8-b449-42252f97a7c9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5580-3bf8-ac43-a26f4f0de545	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7477942)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7477745)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5580-3bfa-ce37-3a13f1a160b7	000e0000-5580-3bfa-8882-c3e792397480	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5580-3bf8-3a5a-a0648cbe2225
000d0000-5580-3bfa-da65-1a2cea33ae46	000e0000-5580-3bfa-8882-c3e792397480	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5580-3bf8-3a5a-a0648cbe2225
000d0000-5580-3bfa-61bc-6fc05cacb4a1	000e0000-5580-3bfa-8882-c3e792397480	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5580-3bf8-2ece-3906c5be4835
000d0000-5580-3bfa-5782-08c30f007a90	000e0000-5580-3bfa-8882-c3e792397480	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5580-3bf8-cb15-e3a71b45e744
000d0000-5580-3bfa-65f3-ca1b4563fd9e	000e0000-5580-3bfa-8882-c3e792397480	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5580-3bf8-cb15-e3a71b45e744
000d0000-5580-3bfa-8525-9deeafe96413	000e0000-5580-3bfa-8882-c3e792397480	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5580-3bf8-cb15-e3a71b45e744
000d0000-5580-3bfa-b423-75552bf3b9c9	000e0000-5580-3bfa-8882-c3e792397480	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5580-3bf8-3a5a-a0648cbe2225
\.


--
-- TOC entry 2843 (class 0 OID 7477565)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7477613)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7477545)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5580-3bfa-24fa-ee538060b029	00080000-5580-3bfa-fb07-d66a31a89d7a	00090000-5580-3bfa-737f-b0b6a7f4d04f	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7477662)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7477687)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7477502)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5580-3bf9-aaa5-5acfa47e21c3	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5580-3bf9-a4e5-f5cdd0597d51	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5580-3bf9-dc04-976ecd83e94d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5580-3bf9-931a-0ee34a39fea2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5580-3bf9-83b7-9b88d69409f1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5580-3bf9-f083-15ca56a2c4f7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5580-3bf9-39c9-b59a00ca24c8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5580-3bf9-b78b-cbeab015f7d9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5580-3bf9-6449-8a820c7750be	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5580-3bf9-cd42-d5b6e52f6f63	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5580-3bf9-92b2-f918eccad740	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5580-3bf9-5ec4-c3424bebce74	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5580-3bf9-c578-63adcc6c366a	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5580-3bf9-9d3d-95c8c063f025	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5580-3bf9-04b8-1c19c3717793	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5580-3bf9-e925-c9d504c7cfb1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2832 (class 0 OID 7477415)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5580-3bf9-655e-a0f9473a1b31	00000000-5580-3bf9-83b7-9b88d69409f1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5580-3bf9-071a-0d38d15e3053	00000000-5580-3bf9-83b7-9b88d69409f1	00010000-5580-3bf9-1602-89902c199ce6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5580-3bf9-e157-ec688933487f	00000000-5580-3bf9-f083-15ca56a2c4f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7477426)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5580-3bfa-5c85-4a931ef60ddf	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5580-3bfa-8304-292882ec5b0f	00010000-5580-3bfa-d257-8303d4404a81	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5580-3bfa-2f68-d4fca76cae79	00010000-5580-3bfa-df30-8cc88a1740be	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5580-3bfa-6117-c8871618a951	00010000-5580-3bfa-5cf6-02f307c1aacf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5580-3bfa-c7e5-2304bbad12fd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5580-3bfa-cd29-050f698f6ef4	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5580-3bfa-d0ee-27d647d85fce	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5580-3bfa-4ca8-d9799b6b888c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5580-3bfa-737f-b0b6a7f4d04f	00010000-5580-3bfa-3625-3446f111d3f1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5580-3bfa-0a97-bdfff8302be5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5580-3bfa-caf3-47408e9a6fdc	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5580-3bfa-255b-44de577d95c0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5580-3bfa-774a-9f2f8cfc02fe	00010000-5580-3bfa-7c30-50b8b9ca0ccb	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7477380)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5580-3bf9-0524-cbb78d340b97	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5580-3bf9-fb29-519d2d2dcf95	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5580-3bf9-3c31-a81a2c25a218	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5580-3bf9-1055-d456ddf0b5d4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5580-3bf9-d7df-7b3eaf61633e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5580-3bf9-3f65-974438977143	Abonma-read	Abonma - branje	f
00030000-5580-3bf9-2c9a-18932bc40315	Abonma-write	Abonma - spreminjanje	f
00030000-5580-3bf9-1c36-33b41a5f45f8	Alternacija-read	Alternacija - branje	f
00030000-5580-3bf9-8acb-a748c07df45e	Alternacija-write	Alternacija - spreminjanje	f
00030000-5580-3bf9-abc6-e750f2303c77	Arhivalija-read	Arhivalija - branje	f
00030000-5580-3bf9-bb39-d05040b6ceb3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5580-3bf9-9771-c207230d6846	Besedilo-read	Besedilo - branje	f
00030000-5580-3bf9-21e0-841226f57879	Besedilo-write	Besedilo - spreminjanje	f
00030000-5580-3bf9-8ce4-5d15f0952983	DogodekIzven-read	DogodekIzven - branje	f
00030000-5580-3bf9-b798-f7b23a8c7fe5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5580-3bf9-0a30-8890293fca93	Dogodek-read	Dogodek - branje	f
00030000-5580-3bf9-45b2-4b9b2a6486eb	Dogodek-write	Dogodek - spreminjanje	f
00030000-5580-3bf9-1708-eb2a61d06b56	Drzava-read	Drzava - branje	f
00030000-5580-3bf9-02aa-157030004950	Drzava-write	Drzava - spreminjanje	f
00030000-5580-3bf9-69a2-9001065c7a77	Funkcija-read	Funkcija - branje	f
00030000-5580-3bf9-5cea-10a7839fd715	Funkcija-write	Funkcija - spreminjanje	f
00030000-5580-3bf9-452d-b03faccc7dc4	Gostovanje-read	Gostovanje - branje	f
00030000-5580-3bf9-ddf4-137769b491f2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5580-3bf9-2505-eb000bb2942e	Gostujoca-read	Gostujoca - branje	f
00030000-5580-3bf9-bf35-3b6d5b488e83	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5580-3bf9-4208-6d6e817c6aae	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5580-3bf9-a4ca-942807864766	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5580-3bf9-4903-7c6667206c0c	Kupec-read	Kupec - branje	f
00030000-5580-3bf9-6121-59251dbc4b5e	Kupec-write	Kupec - spreminjanje	f
00030000-5580-3bf9-9cb8-89487dd9124b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5580-3bf9-1dc9-b7f9d0f0af40	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5580-3bf9-05c9-b8a58bd49b49	Option-read	Option - branje	f
00030000-5580-3bf9-a18f-0b4cd69e2cbb	Option-write	Option - spreminjanje	f
00030000-5580-3bf9-659b-969550201719	OptionValue-read	OptionValue - branje	f
00030000-5580-3bf9-d809-3cd60ff06e0a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5580-3bf9-00e3-3e2fe82e99d5	Oseba-read	Oseba - branje	f
00030000-5580-3bf9-7403-8bcd9f040f4b	Oseba-write	Oseba - spreminjanje	f
00030000-5580-3bf9-9568-396a983779ce	Permission-read	Permission - branje	f
00030000-5580-3bf9-d923-79b876125577	Permission-write	Permission - spreminjanje	f
00030000-5580-3bf9-b120-7af39573e401	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5580-3bf9-3ba9-1a2621318b45	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5580-3bf9-c2f7-f4841e073399	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5580-3bf9-db6d-bda2475bd70a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5580-3bf9-5e3b-6012b1b7f4c9	Pogodba-read	Pogodba - branje	f
00030000-5580-3bf9-b07f-11b618f6c17e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5580-3bf9-a5d8-6bff8f5f35fd	Popa-read	Popa - branje	f
00030000-5580-3bf9-8efb-2489caf7e689	Popa-write	Popa - spreminjanje	f
00030000-5580-3bf9-8e8c-05a8cb924d64	Posta-read	Posta - branje	f
00030000-5580-3bf9-9606-5468b84fb6c9	Posta-write	Posta - spreminjanje	f
00030000-5580-3bf9-2758-cafcbbef1bb1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5580-3bf9-97f0-4c62f3ce4d11	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5580-3bf9-c156-0554077d7592	PostniNaslov-read	PostniNaslov - branje	f
00030000-5580-3bf9-c0d9-ffa7e3db14a1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5580-3bf9-6c35-59780324722a	Predstava-read	Predstava - branje	f
00030000-5580-3bf9-91fb-5f7bb1eae358	Predstava-write	Predstava - spreminjanje	f
00030000-5580-3bf9-a72e-9fca886384c1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5580-3bf9-2f1b-3414ade2a46e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5580-3bf9-96ca-d5ca9751650d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5580-3bf9-c5d6-3ad3ea096dd5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5580-3bf9-ca5b-a2abf3ec4a26	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5580-3bf9-c02d-f9bb94273746	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5580-3bf9-b466-4ee777842ad4	ProgramDela-read	ProgramDela - branje	f
00030000-5580-3bf9-6619-b7a7ab35fba4	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5580-3bf9-aea9-1f1ad8980da9	ProgramFestival-read	ProgramFestival - branje	f
00030000-5580-3bf9-a609-5c30b6eeaa1e	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5580-3bf9-7649-dcfcc02a9406	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5580-3bf9-9176-23ca5ea0721e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5580-3bf9-0dbd-f0c3251ed2c1	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5580-3bf9-ce63-4a0f91a41d3c	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5580-3bf9-b570-f5257efa00ee	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5580-3bf9-0120-c8618495df68	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5580-3bf9-dbe1-d589e267e640	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5580-3bf9-da96-09e26bb643f4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5580-3bf9-4570-47e33654deb8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5580-3bf9-b2eb-ff05015aa59a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5580-3bf9-0a0d-314c4ecbe59f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5580-3bf9-710e-1a062e870385	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5580-3bf9-c816-4207c353382f	ProgramRazno-read	ProgramRazno - branje	f
00030000-5580-3bf9-cd74-abfef6ec563d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5580-3bf9-29f1-a3b08f3b0f1f	Prostor-read	Prostor - branje	f
00030000-5580-3bf9-6675-007ccc48ceed	Prostor-write	Prostor - spreminjanje	f
00030000-5580-3bf9-383c-3042aabe0150	Racun-read	Racun - branje	f
00030000-5580-3bf9-df43-c4ef94bef75f	Racun-write	Racun - spreminjanje	f
00030000-5580-3bf9-a9ff-12b5ec4ed646	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5580-3bf9-6e6f-5f47eb491abc	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5580-3bf9-eb91-7a6818cc7047	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5580-3bf9-e097-07390d478d79	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5580-3bf9-edcd-406539ede3d5	Rekvizit-read	Rekvizit - branje	f
00030000-5580-3bf9-e775-1de5bc3228f5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5580-3bf9-70a0-226672b2f7e2	Revizija-read	Revizija - branje	f
00030000-5580-3bf9-8706-1158c5fab0fa	Revizija-write	Revizija - spreminjanje	f
00030000-5580-3bf9-f5ee-2fa9e58422ae	Rezervacija-read	Rezervacija - branje	f
00030000-5580-3bf9-4a03-c8163608b34b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5580-3bf9-0bc2-ede339450d8e	Role-read	Role - branje	f
00030000-5580-3bf9-ada7-0f62c58b2d55	Role-write	Role - spreminjanje	f
00030000-5580-3bf9-3a09-d340a2f8d272	SedezniRed-read	SedezniRed - branje	f
00030000-5580-3bf9-87cf-bda913b74313	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5580-3bf9-d81b-b7fc0f6dd5fd	Sedez-read	Sedez - branje	f
00030000-5580-3bf9-9987-7b132b9be336	Sedez-write	Sedez - spreminjanje	f
00030000-5580-3bf9-cf58-a2f80a116b8a	Sezona-read	Sezona - branje	f
00030000-5580-3bf9-e876-47cce3ab0829	Sezona-write	Sezona - spreminjanje	f
00030000-5580-3bf9-6410-98d416cb4c7d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5580-3bf9-6c96-0a0619c76d7e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5580-3bf9-3d64-a437aa783860	Stevilcenje-read	Stevilcenje - branje	f
00030000-5580-3bf9-c5fd-3d72dc3bff7e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5580-3bf9-4a53-a76677f12d46	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5580-3bf9-96e3-a9266d5af7a7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5580-3bf9-b5ee-c328a0a052e2	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5580-3bf9-fbcc-2f2106700f0e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5580-3bf9-84ac-acaee9f95c60	Telefonska-read	Telefonska - branje	f
00030000-5580-3bf9-ba30-ff07d36c017c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5580-3bf9-8586-dd966d4d422b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5580-3bf9-e221-bf9fb488b426	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5580-3bf9-c538-53531bd30f11	TipFunkcije-read	TipFunkcije - branje	f
00030000-5580-3bf9-9a8e-923870616df6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5580-3bf9-f835-f8fea606acf3	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5580-3bf9-7de6-87aac624f1af	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5580-3bf9-b5be-70aa3f57b63e	Trr-read	Trr - branje	f
00030000-5580-3bf9-554b-d32635e38b33	Trr-write	Trr - spreminjanje	f
00030000-5580-3bf9-8722-8ab7342c287f	Uprizoritev-read	Uprizoritev - branje	f
00030000-5580-3bf9-57f4-fefc12396299	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5580-3bf9-cbd6-f57ef7c5048f	User-read	User - branje	f
00030000-5580-3bf9-6b4f-4c04c1daee35	User-write	User - spreminjanje	f
00030000-5580-3bf9-a94a-a52e231eabe3	Vaja-read	Vaja - branje	f
00030000-5580-3bf9-6070-a3d68bc41bf4	Vaja-write	Vaja - spreminjanje	f
00030000-5580-3bf9-4857-e9faad7b1293	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5580-3bf9-7a09-abcfb77c25af	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5580-3bf9-8f8f-7140a7d21ad8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5580-3bf9-b9c3-5b4eac5aac31	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5580-3bf9-c937-cc782b607132	Zasedenost-read	Zasedenost - branje	f
00030000-5580-3bf9-88c5-557936cba541	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5580-3bf9-b653-a5f9c62a28d0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5580-3bf9-06c3-921c181f1572	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5580-3bf9-ede4-66830c715a79	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5580-3bf9-46e0-5b4611d65a39	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7477399)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5580-3bf9-b6c5-f804f818acf7	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-3f65-974438977143
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-2c9a-18932bc40315
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-1c36-33b41a5f45f8
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-8acb-a748c07df45e
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-abc6-e750f2303c77
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-0a30-8890293fca93
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-1055-d456ddf0b5d4
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-45b2-4b9b2a6486eb
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-02aa-157030004950
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-69a2-9001065c7a77
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-5cea-10a7839fd715
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-452d-b03faccc7dc4
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-ddf4-137769b491f2
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-2505-eb000bb2942e
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-bf35-3b6d5b488e83
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-4208-6d6e817c6aae
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-a4ca-942807864766
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-05c9-b8a58bd49b49
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-659b-969550201719
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-00e3-3e2fe82e99d5
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-7403-8bcd9f040f4b
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-a5d8-6bff8f5f35fd
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-8efb-2489caf7e689
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-8e8c-05a8cb924d64
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-9606-5468b84fb6c9
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-c156-0554077d7592
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-c0d9-ffa7e3db14a1
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-6c35-59780324722a
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-91fb-5f7bb1eae358
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-ca5b-a2abf3ec4a26
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-c02d-f9bb94273746
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-29f1-a3b08f3b0f1f
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-6675-007ccc48ceed
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-eb91-7a6818cc7047
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-e097-07390d478d79
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-edcd-406539ede3d5
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-e775-1de5bc3228f5
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-cf58-a2f80a116b8a
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-e876-47cce3ab0829
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-c538-53531bd30f11
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-8722-8ab7342c287f
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-57f4-fefc12396299
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-a94a-a52e231eabe3
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-6070-a3d68bc41bf4
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-c937-cc782b607132
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-88c5-557936cba541
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-b653-a5f9c62a28d0
00020000-5580-3bf9-a766-4d9e4cabdc5f	00030000-5580-3bf9-ede4-66830c715a79
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-3f65-974438977143
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-abc6-e750f2303c77
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-0a30-8890293fca93
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-452d-b03faccc7dc4
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-2505-eb000bb2942e
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-4208-6d6e817c6aae
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-a4ca-942807864766
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-05c9-b8a58bd49b49
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-659b-969550201719
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-00e3-3e2fe82e99d5
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-7403-8bcd9f040f4b
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-a5d8-6bff8f5f35fd
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-8e8c-05a8cb924d64
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-c156-0554077d7592
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-c0d9-ffa7e3db14a1
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-6c35-59780324722a
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-29f1-a3b08f3b0f1f
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-eb91-7a6818cc7047
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-edcd-406539ede3d5
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-cf58-a2f80a116b8a
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-84ac-acaee9f95c60
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-ba30-ff07d36c017c
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-b5be-70aa3f57b63e
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-554b-d32635e38b33
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-8f8f-7140a7d21ad8
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-b9c3-5b4eac5aac31
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-b653-a5f9c62a28d0
00020000-5580-3bf9-e3ed-53dba9590299	00030000-5580-3bf9-ede4-66830c715a79
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-3f65-974438977143
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-1c36-33b41a5f45f8
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-abc6-e750f2303c77
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-bb39-d05040b6ceb3
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-9771-c207230d6846
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-8ce4-5d15f0952983
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-0a30-8890293fca93
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-69a2-9001065c7a77
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-452d-b03faccc7dc4
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-2505-eb000bb2942e
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-4208-6d6e817c6aae
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-05c9-b8a58bd49b49
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-659b-969550201719
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-00e3-3e2fe82e99d5
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-a5d8-6bff8f5f35fd
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-8e8c-05a8cb924d64
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-6c35-59780324722a
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-ca5b-a2abf3ec4a26
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-29f1-a3b08f3b0f1f
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-eb91-7a6818cc7047
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-edcd-406539ede3d5
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-cf58-a2f80a116b8a
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-c538-53531bd30f11
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-a94a-a52e231eabe3
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-c937-cc782b607132
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-b653-a5f9c62a28d0
00020000-5580-3bf9-1f60-524311bb33f7	00030000-5580-3bf9-ede4-66830c715a79
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-3f65-974438977143
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-2c9a-18932bc40315
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-8acb-a748c07df45e
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-abc6-e750f2303c77
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-0a30-8890293fca93
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-452d-b03faccc7dc4
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-2505-eb000bb2942e
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-05c9-b8a58bd49b49
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-659b-969550201719
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-a5d8-6bff8f5f35fd
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-8e8c-05a8cb924d64
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-6c35-59780324722a
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-29f1-a3b08f3b0f1f
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-eb91-7a6818cc7047
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-edcd-406539ede3d5
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-cf58-a2f80a116b8a
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-c538-53531bd30f11
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-b653-a5f9c62a28d0
00020000-5580-3bf9-3325-a9528abbbc4c	00030000-5580-3bf9-ede4-66830c715a79
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-3f65-974438977143
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-abc6-e750f2303c77
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-0a30-8890293fca93
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-1708-eb2a61d06b56
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-452d-b03faccc7dc4
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-2505-eb000bb2942e
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-05c9-b8a58bd49b49
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-659b-969550201719
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-a5d8-6bff8f5f35fd
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-8e8c-05a8cb924d64
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-6c35-59780324722a
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-29f1-a3b08f3b0f1f
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-eb91-7a6818cc7047
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-edcd-406539ede3d5
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-cf58-a2f80a116b8a
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-8586-dd966d4d422b
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-3c31-a81a2c25a218
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-c538-53531bd30f11
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-b653-a5f9c62a28d0
00020000-5580-3bf9-1de0-186601ae4dcd	00030000-5580-3bf9-ede4-66830c715a79
\.


--
-- TOC entry 2858 (class 0 OID 7477694)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7477725)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7477861)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7477459)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5580-3bfa-fb07-d66a31a89d7a	00040000-5580-3bf8-6f24-ec8d6dd09587	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-3bfa-0740-631302d69c54	00040000-5580-3bf8-6f24-ec8d6dd09587	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-3bfa-9eeb-61e0bab0541d	00040000-5580-3bf8-6f24-ec8d6dd09587	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-3bfa-d628-f277def20b22	00040000-5580-3bf8-6f24-ec8d6dd09587	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7477494)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5580-3bf8-66d4-a5d81ea1139e	8341	Adlešiči
00050000-5580-3bf8-c375-be8e0abac4aa	5270	Ajdovščina
00050000-5580-3bf8-5334-75735da870d9	6280	Ankaran/Ancarano
00050000-5580-3bf8-eb37-63cc260fc8f5	9253	Apače
00050000-5580-3bf8-2017-676bc3feadc7	8253	Artiče
00050000-5580-3bf8-228b-bcff5ee35e3a	4275	Begunje na Gorenjskem
00050000-5580-3bf8-0659-5e2465c14fb4	1382	Begunje pri Cerknici
00050000-5580-3bf8-6a5b-71dd5ad541f3	9231	Beltinci
00050000-5580-3bf8-ec24-5149fdea10db	2234	Benedikt
00050000-5580-3bf8-4a62-06d2be66cf4d	2345	Bistrica ob Dravi
00050000-5580-3bf8-a037-02cadbeb5a0a	3256	Bistrica ob Sotli
00050000-5580-3bf8-8c75-da883547a929	8259	Bizeljsko
00050000-5580-3bf8-8f63-fa0256c8cbcc	1223	Blagovica
00050000-5580-3bf8-5f12-c3d266552839	8283	Blanca
00050000-5580-3bf8-49f3-684582a64767	4260	Bled
00050000-5580-3bf8-c43b-9312ec169cd3	4273	Blejska Dobrava
00050000-5580-3bf8-d176-584fdb7093b1	9265	Bodonci
00050000-5580-3bf8-dc84-76155e6e6d71	9222	Bogojina
00050000-5580-3bf8-24c1-45112d7a9621	4263	Bohinjska Bela
00050000-5580-3bf8-85b8-b2a8395efed6	4264	Bohinjska Bistrica
00050000-5580-3bf8-3db8-f3bd4fc9196d	4265	Bohinjsko jezero
00050000-5580-3bf8-158b-32fd3406c6da	1353	Borovnica
00050000-5580-3bf8-8404-9b75637b848c	8294	Boštanj
00050000-5580-3bf8-7d6b-ea88e8dee35c	5230	Bovec
00050000-5580-3bf8-f476-5626e2c898ee	5295	Branik
00050000-5580-3bf8-4dd6-11e428057615	3314	Braslovče
00050000-5580-3bf8-c0cf-7d3d915cac7a	5223	Breginj
00050000-5580-3bf8-14dc-0c07b78b6fff	8280	Brestanica
00050000-5580-3bf8-a34f-87f2796202cf	2354	Bresternica
00050000-5580-3bf8-06d5-9bd67c224a24	4243	Brezje
00050000-5580-3bf8-b261-1320efecd1a4	1351	Brezovica pri Ljubljani
00050000-5580-3bf8-43dd-7efca190b87f	8250	Brežice
00050000-5580-3bf8-a8ec-e15a1f236314	4210	Brnik - Aerodrom
00050000-5580-3bf8-8576-903a7df1fa9d	8321	Brusnice
00050000-5580-3bf8-c080-308bbdb26cd3	3255	Buče
00050000-5580-3bf8-8d7e-6169f9534b3b	8276	Bučka 
00050000-5580-3bf8-02a9-66c3ddf58829	9261	Cankova
00050000-5580-3bf8-e443-4d59e5e58fc0	3000	Celje 
00050000-5580-3bf8-4bb1-66e93d5a8ab7	3001	Celje - poštni predali
00050000-5580-3bf8-f483-775d93f7c38e	4207	Cerklje na Gorenjskem
00050000-5580-3bf8-44ed-44941435ad4b	8263	Cerklje ob Krki
00050000-5580-3bf8-61b5-79101498f344	1380	Cerknica
00050000-5580-3bf8-c7fd-193c2126cb9b	5282	Cerkno
00050000-5580-3bf8-ff2b-e55aeabacb34	2236	Cerkvenjak
00050000-5580-3bf8-02e7-0b4518f42082	2215	Ceršak
00050000-5580-3bf8-bd13-be0d21442d60	2326	Cirkovce
00050000-5580-3bf8-7c37-fd1be1d55a1d	2282	Cirkulane
00050000-5580-3bf8-cead-537f485e9afe	5273	Col
00050000-5580-3bf8-7551-d36aa9b39dd9	8251	Čatež ob Savi
00050000-5580-3bf8-875a-07c601bec283	1413	Čemšenik
00050000-5580-3bf8-0505-d4beee4599e4	5253	Čepovan
00050000-5580-3bf8-03fd-161a03f6ef85	9232	Črenšovci
00050000-5580-3bf8-7ee4-c963ec4ed39f	2393	Črna na Koroškem
00050000-5580-3bf8-626c-90c1111f097c	6275	Črni Kal
00050000-5580-3bf8-db5c-164b8e74ab09	5274	Črni Vrh nad Idrijo
00050000-5580-3bf8-c98e-280539349a39	5262	Črniče
00050000-5580-3bf8-40a5-82c6094bcbc4	8340	Črnomelj
00050000-5580-3bf8-64c6-c0a09ca3b3d5	6271	Dekani
00050000-5580-3bf8-be80-d706db7ebed0	5210	Deskle
00050000-5580-3bf8-9fd6-823d501e3bbb	2253	Destrnik
00050000-5580-3bf8-6222-1ed9ab08a592	6215	Divača
00050000-5580-3bf8-9d49-5f507591eda5	1233	Dob
00050000-5580-3bf8-b0cb-d583b149ab91	3224	Dobje pri Planini
00050000-5580-3bf8-2dcf-97c040141eb0	8257	Dobova
00050000-5580-3bf8-51fc-df68fdb962de	1423	Dobovec
00050000-5580-3bf8-fa09-70ab53c3eaf0	5263	Dobravlje
00050000-5580-3bf8-9216-ac6cab43c4bb	3204	Dobrna
00050000-5580-3bf8-251f-a6f9b8fdc794	8211	Dobrnič
00050000-5580-3bf8-4193-faadc7023710	1356	Dobrova
00050000-5580-3bf8-8f7e-0baf1c4753a8	9223	Dobrovnik/Dobronak 
00050000-5580-3bf8-5d42-e19391efd370	5212	Dobrovo v Brdih
00050000-5580-3bf8-3d21-ecbedb0b74a0	1431	Dol pri Hrastniku
00050000-5580-3bf8-6ac0-4ae5346677d0	1262	Dol pri Ljubljani
00050000-5580-3bf8-4f47-b8dadd62076a	1273	Dole pri Litiji
00050000-5580-3bf8-7857-884bb4497f74	1331	Dolenja vas
00050000-5580-3bf8-75a0-7b2c2443d5a2	8350	Dolenjske Toplice
00050000-5580-3bf8-be0d-4a4d19710bfa	1230	Domžale
00050000-5580-3bf8-d29a-940f656a02c7	2252	Dornava
00050000-5580-3bf8-000f-2958147f928a	5294	Dornberk
00050000-5580-3bf8-a665-e81fed20444c	1319	Draga
00050000-5580-3bf8-b27a-440ce330054c	8343	Dragatuš
00050000-5580-3bf8-a329-b9eaf1b9457f	3222	Dramlje
00050000-5580-3bf8-2a3b-809c771debd6	2370	Dravograd
00050000-5580-3bf8-cce1-ea23507b0b39	4203	Duplje
00050000-5580-3bf8-8998-f37dafc6692e	6221	Dutovlje
00050000-5580-3bf8-580b-79b994c50193	8361	Dvor
00050000-5580-3bf8-d4ec-521243540fc7	2343	Fala
00050000-5580-3bf8-27cd-f02745e9c1f2	9208	Fokovci
00050000-5580-3bf8-8334-7b7c98c64cbe	2313	Fram
00050000-5580-3bf8-9d5c-80f9258dfd4e	3213	Frankolovo
00050000-5580-3bf8-84f2-d73a5bfdca86	1274	Gabrovka
00050000-5580-3bf8-da9d-fd415b75fa76	8254	Globoko
00050000-5580-3bf8-1231-7537dc967e53	5275	Godovič
00050000-5580-3bf8-9c58-adaf6abc15eb	4204	Golnik
00050000-5580-3bf8-4134-dcf086131769	3303	Gomilsko
00050000-5580-3bf8-81f1-fc2fc872013e	4224	Gorenja vas
00050000-5580-3bf8-44fb-87a70dc67f7e	3263	Gorica pri Slivnici
00050000-5580-3bf8-558a-788ed3afb1c4	2272	Gorišnica
00050000-5580-3bf8-952f-473b44b6d0c2	9250	Gornja Radgona
00050000-5580-3bf8-1ff6-97b69f6aaa5a	3342	Gornji Grad
00050000-5580-3bf8-c11b-ae080b9cd786	4282	Gozd Martuljek
00050000-5580-3bf8-fb64-c97711540642	6272	Gračišče
00050000-5580-3bf8-1708-955bcfd2e65b	9264	Grad
00050000-5580-3bf8-1441-70b012725a50	8332	Gradac
00050000-5580-3bf8-b311-5edc0707d4a4	1384	Grahovo
00050000-5580-3bf8-5562-74ec24a27606	5242	Grahovo ob Bači
00050000-5580-3bf8-28b0-857526324291	5251	Grgar
00050000-5580-3bf8-08a3-809358e3132e	3302	Griže
00050000-5580-3bf8-c17b-16a368dc47e5	3231	Grobelno
00050000-5580-3bf8-38d9-a17731f9512b	1290	Grosuplje
00050000-5580-3bf8-5815-a093a87e03df	2288	Hajdina
00050000-5580-3bf8-560d-09ceb15649c6	8362	Hinje
00050000-5580-3bf8-24c1-cbfa228fdd16	2311	Hoče
00050000-5580-3bf8-8550-06834ff6332f	9205	Hodoš/Hodos
00050000-5580-3bf8-ca99-97e72ff0c2a3	1354	Horjul
00050000-5580-3bf8-0e35-e75e56a95d5f	1372	Hotedršica
00050000-5580-3bf8-eccb-00433682224f	1430	Hrastnik
00050000-5580-3bf8-4808-b08c2dd41821	6225	Hruševje
00050000-5580-3bf8-4df7-5d72dcf43983	4276	Hrušica
00050000-5580-3bf8-398b-ef7f7ee4626b	5280	Idrija
00050000-5580-3bf8-3d64-4eea7b87916c	1292	Ig
00050000-5580-3bf8-00c1-997f3c0a13bb	6250	Ilirska Bistrica
00050000-5580-3bf8-7484-d3be98244eb4	6251	Ilirska Bistrica-Trnovo
00050000-5580-3bf8-7493-b868fb2e3f7e	1295	Ivančna Gorica
00050000-5580-3bf8-1eb8-1519cef6eec7	2259	Ivanjkovci
00050000-5580-3bf8-d6cd-45af42cd5c05	1411	Izlake
00050000-5580-3bf8-7597-ced0b2a02f32	6310	Izola/Isola
00050000-5580-3bf8-36da-33d4cd50602d	2222	Jakobski Dol
00050000-5580-3bf8-466c-c94034da319d	2221	Jarenina
00050000-5580-3bf8-e5fa-19c7a20cdf8d	6254	Jelšane
00050000-5580-3bf8-5677-2427ce884215	4270	Jesenice
00050000-5580-3bf8-97b7-ad848e1153c1	8261	Jesenice na Dolenjskem
00050000-5580-3bf8-e400-d23c8b6c30bb	3273	Jurklošter
00050000-5580-3bf8-1d82-a641e6779547	2223	Jurovski Dol
00050000-5580-3bf8-694e-8357d18e82c9	2256	Juršinci
00050000-5580-3bf8-6f12-e7c6543e29d8	5214	Kal nad Kanalom
00050000-5580-3bf8-8510-5a58bb7dce08	3233	Kalobje
00050000-5580-3bf8-3ef3-bc60d0cfbb03	4246	Kamna Gorica
00050000-5580-3bf8-3fd1-10e4142bb16d	2351	Kamnica
00050000-5580-3bf8-e048-5f0cb7827142	1241	Kamnik
00050000-5580-3bf8-dfe8-2e58e17ba423	5213	Kanal
00050000-5580-3bf8-3f77-6658398968f7	8258	Kapele
00050000-5580-3bf8-594b-fd3f3fc5b3b6	2362	Kapla
00050000-5580-3bf8-d441-4d68f236ca83	2325	Kidričevo
00050000-5580-3bf8-a59a-ba897dd87568	1412	Kisovec
00050000-5580-3bf8-c1a7-63b69e297fe1	6253	Knežak
00050000-5580-3bf8-7933-d28ec9b497a5	5222	Kobarid
00050000-5580-3bf8-2e2a-51ebd08097db	9227	Kobilje
00050000-5580-3bf8-be37-ac5a430d4c04	1330	Kočevje
00050000-5580-3bf8-cf64-82444a65e3be	1338	Kočevska Reka
00050000-5580-3bf8-3734-ce05a28c6568	2276	Kog
00050000-5580-3bf8-2144-12c72c2c1e24	5211	Kojsko
00050000-5580-3bf8-a318-506f0203271a	6223	Komen
00050000-5580-3bf8-72ab-84487d4079d4	1218	Komenda
00050000-5580-3bf8-5e55-86b069c59337	6000	Koper/Capodistria 
00050000-5580-3bf8-0244-55ac23c2fba2	6001	Koper/Capodistria - poštni predali
00050000-5580-3bf8-6f00-f13431933e02	8282	Koprivnica
00050000-5580-3bf8-fe8c-e4c25e432df8	5296	Kostanjevica na Krasu
00050000-5580-3bf8-1db6-6b02629fb32f	8311	Kostanjevica na Krki
00050000-5580-3bf8-2470-6800d1b95bb5	1336	Kostel
00050000-5580-3bf8-8e3e-1c462db29d87	6256	Košana
00050000-5580-3bf8-991e-db4329802077	2394	Kotlje
00050000-5580-3bf8-54d2-8e5cbc441b54	6240	Kozina
00050000-5580-3bf8-1275-460dbb19ab2f	3260	Kozje
00050000-5580-3bf8-6fb3-92106d0f1c9b	4000	Kranj 
00050000-5580-3bf8-8861-f49dcfeee218	4001	Kranj - poštni predali
00050000-5580-3bf8-05f5-f7de06b2fbe8	4280	Kranjska Gora
00050000-5580-3bf8-27d6-5775010c46b2	1281	Kresnice
00050000-5580-3bf8-7870-4cd2a61dd9bb	4294	Križe
00050000-5580-3bf8-756b-5074e6fc88e0	9206	Križevci
00050000-5580-3bf8-0fc9-de92353c755f	9242	Križevci pri Ljutomeru
00050000-5580-3bf8-499e-ef6636f5f3fe	1301	Krka
00050000-5580-3bf8-e673-d259a709d5af	8296	Krmelj
00050000-5580-3bf8-0137-11de0d699d2f	4245	Kropa
00050000-5580-3bf8-e7a5-3701665e074e	8262	Krška vas
00050000-5580-3bf8-4411-4380c6a7b677	8270	Krško
00050000-5580-3bf8-07aa-51f79fe508d7	9263	Kuzma
00050000-5580-3bf8-7f6b-9b9b2d7da0ab	2318	Laporje
00050000-5580-3bf8-36c7-956574e47e63	3270	Laško
00050000-5580-3bf8-8242-8109f4414f9f	1219	Laze v Tuhinju
00050000-5580-3bf8-2669-343d05e61ff8	2230	Lenart v Slovenskih goricah
00050000-5580-3bf8-f798-4858899a1ab6	9220	Lendava/Lendva
00050000-5580-3bf8-e469-c6e34fc35233	4248	Lesce
00050000-5580-3bf8-054a-39cd927d9367	3261	Lesično
00050000-5580-3bf8-273b-51579268f42d	8273	Leskovec pri Krškem
00050000-5580-3bf8-ec84-a4f27241d111	2372	Libeliče
00050000-5580-3bf8-cdf9-c79c08e0fa74	2341	Limbuš
00050000-5580-3bf8-1339-ea3fd8cc9947	1270	Litija
00050000-5580-3bf8-e4ef-e45e6aa863c8	3202	Ljubečna
00050000-5580-3bf8-c971-dde494be1fd9	1000	Ljubljana 
00050000-5580-3bf8-7245-7190c2dd37a5	1001	Ljubljana - poštni predali
00050000-5580-3bf8-dd07-49811ed816e6	1231	Ljubljana - Črnuče
00050000-5580-3bf8-28ee-b7f896926c80	1261	Ljubljana - Dobrunje
00050000-5580-3bf8-f893-139d82d119c2	1260	Ljubljana - Polje
00050000-5580-3bf8-735e-9ef9decc6275	1210	Ljubljana - Šentvid
00050000-5580-3bf8-8e0b-2907f78e3031	1211	Ljubljana - Šmartno
00050000-5580-3bf8-b282-378572341907	3333	Ljubno ob Savinji
00050000-5580-3bf8-9a90-88f4efedf141	9240	Ljutomer
00050000-5580-3bf8-d2b5-8d0894d1be67	3215	Loče
00050000-5580-3bf8-b876-e4e90692a047	5231	Log pod Mangartom
00050000-5580-3bf8-9b02-c7b7ee9c1833	1358	Log pri Brezovici
00050000-5580-3bf8-c4e1-302b021b8348	1370	Logatec
00050000-5580-3bf8-9671-6c2d919e30bc	1371	Logatec
00050000-5580-3bf8-019d-f02f3241d7e0	1434	Loka pri Zidanem Mostu
00050000-5580-3bf8-d23b-47f4a5f3ff4e	3223	Loka pri Žusmu
00050000-5580-3bf8-6511-4010e2ee6199	6219	Lokev
00050000-5580-3bf8-2179-b8de64503b06	1318	Loški Potok
00050000-5580-3bf8-59ce-a6bd5e900dad	2324	Lovrenc na Dravskem polju
00050000-5580-3bf8-bab9-03980776a728	2344	Lovrenc na Pohorju
00050000-5580-3bf8-ac5c-f72f5fc45568	3334	Luče
00050000-5580-3bf8-3211-474717435adb	1225	Lukovica
00050000-5580-3bf8-f2b9-9335a668597f	9202	Mačkovci
00050000-5580-3bf8-ba0e-6acd98fb361d	2322	Majšperk
00050000-5580-3bf8-ca3a-5a01232494e4	2321	Makole
00050000-5580-3bf8-47ac-e7b3c40f59e9	9243	Mala Nedelja
00050000-5580-3bf8-0c03-87e6b1b78380	2229	Malečnik
00050000-5580-3bf8-a93d-a9d05c32f27f	6273	Marezige
00050000-5580-3bf8-cf0c-16438a71ac12	2000	Maribor 
00050000-5580-3bf8-c225-1ed6eea36c2f	2001	Maribor - poštni predali
00050000-5580-3bf8-700e-b2aa401de756	2206	Marjeta na Dravskem polju
00050000-5580-3bf8-5d45-825795bfdcc5	2281	Markovci
00050000-5580-3bf8-2f14-af36fc299ee6	9221	Martjanci
00050000-5580-3bf8-a4f7-6c694a8dc957	6242	Materija
00050000-5580-3bf8-826f-ef7d742e03f9	4211	Mavčiče
00050000-5580-3bf8-2e3a-c0a51784ec87	1215	Medvode
00050000-5580-3bf8-1890-46c79e1e9983	1234	Mengeš
00050000-5580-3bf8-e78a-ca9645811d71	8330	Metlika
00050000-5580-3bf8-e564-089037e4db5c	2392	Mežica
00050000-5580-3bf8-96ee-6a20a13f58f1	2204	Miklavž na Dravskem polju
00050000-5580-3bf8-a1ae-91a5ac8d7295	2275	Miklavž pri Ormožu
00050000-5580-3bf8-e5d7-327b592bc518	5291	Miren
00050000-5580-3bf8-ad7f-e186bce2a822	8233	Mirna
00050000-5580-3bf8-d48d-8d87264dd753	8216	Mirna Peč
00050000-5580-3bf8-49c6-535a35362aa9	2382	Mislinja
00050000-5580-3bf8-e8c9-378cdfaed0e2	4281	Mojstrana
00050000-5580-3bf8-39cf-de61ba6e8003	8230	Mokronog
00050000-5580-3bf8-feb9-2369ed57415f	1251	Moravče
00050000-5580-3bf8-9e55-510850daa8bb	9226	Moravske Toplice
00050000-5580-3bf8-1233-facf5a83b27c	5216	Most na Soči
00050000-5580-3bf8-5f25-7315cf2e5161	1221	Motnik
00050000-5580-3bf8-7bc6-4310aadbcd39	3330	Mozirje
00050000-5580-3bf8-5126-0abebd8fd42c	9000	Murska Sobota 
00050000-5580-3bf8-e4e9-91d4c3d1439c	9001	Murska Sobota - poštni predali
00050000-5580-3bf8-6100-930a8817b4c3	2366	Muta
00050000-5580-3bf8-77ae-9fe7452f16e6	4202	Naklo
00050000-5580-3bf8-5423-169b135d7490	3331	Nazarje
00050000-5580-3bf8-a0cd-cf9f606ffcd4	1357	Notranje Gorice
00050000-5580-3bf8-bded-157836cdb382	3203	Nova Cerkev
00050000-5580-3bf8-662e-04bc386138bc	5000	Nova Gorica 
00050000-5580-3bf8-cc67-b03b9ee9a8d8	5001	Nova Gorica - poštni predali
00050000-5580-3bf8-007c-81ba2b7eda8c	1385	Nova vas
00050000-5580-3bf8-16c6-d5a8b81c00b2	8000	Novo mesto
00050000-5580-3bf8-cd31-c117d6d988c0	8001	Novo mesto - poštni predali
00050000-5580-3bf8-a9ff-b4c48c8a15e8	6243	Obrov
00050000-5580-3bf8-f1b5-c2b175d6453a	9233	Odranci
00050000-5580-3bf8-3a3b-eff81ba88175	2317	Oplotnica
00050000-5580-3bf8-cf2d-1238a0a2a6c5	2312	Orehova vas
00050000-5580-3bf8-c139-e9c2a59ce10f	2270	Ormož
00050000-5580-3bf8-0052-911e93f1901f	1316	Ortnek
00050000-5580-3bf8-9b5c-c0197fbc45af	1337	Osilnica
00050000-5580-3bf8-8bda-1d8b8f96f5b1	8222	Otočec
00050000-5580-3bf8-1464-bce39dbacb5c	2361	Ožbalt
00050000-5580-3bf8-748c-1edcac28c39e	2231	Pernica
00050000-5580-3bf8-11ac-4e219da117be	2211	Pesnica pri Mariboru
00050000-5580-3bf8-ab4f-3888325c9cec	9203	Petrovci
00050000-5580-3bf8-f6ad-006f379946cc	3301	Petrovče
00050000-5580-3bf8-fed1-2f4708f96129	6330	Piran/Pirano
00050000-5580-3bf8-f0c3-67286464e2f0	8255	Pišece
00050000-5580-3bf8-bffd-62bd453ed91f	6257	Pivka
00050000-5580-3bf8-ca2c-db51055d0709	6232	Planina
00050000-5580-3bf8-c9cb-46513eaea576	3225	Planina pri Sevnici
00050000-5580-3bf8-3f80-1ae967b157d9	6276	Pobegi
00050000-5580-3bf8-84d9-c5a5b8fd6f94	8312	Podbočje
00050000-5580-3bf8-fdf0-9bd3daef6f92	5243	Podbrdo
00050000-5580-3bf8-6edf-fdaa1428b2a6	3254	Podčetrtek
00050000-5580-3bf8-5318-b71ff7ac9817	2273	Podgorci
00050000-5580-3bf8-9ed6-a31f94859572	6216	Podgorje
00050000-5580-3bf8-5535-e97e318884ea	2381	Podgorje pri Slovenj Gradcu
00050000-5580-3bf8-58ab-76f49cd4b73c	6244	Podgrad
00050000-5580-3bf8-556c-cb9a693038e4	1414	Podkum
00050000-5580-3bf8-863d-db1fc724fe5c	2286	Podlehnik
00050000-5580-3bf8-9191-0d49824a9e35	5272	Podnanos
00050000-5580-3bf8-a8d4-4aed7c56ae71	4244	Podnart
00050000-5580-3bf8-1406-1cff12a1f575	3241	Podplat
00050000-5580-3bf8-c4d6-fdc2309f9a12	3257	Podsreda
00050000-5580-3bf8-0ac1-d4a4644841a0	2363	Podvelka
00050000-5580-3bf8-7017-b532bd6e8e01	2208	Pohorje
00050000-5580-3bf8-8f43-79ee6972b892	2257	Polenšak
00050000-5580-3bf8-e7b2-f9ab1dc94204	1355	Polhov Gradec
00050000-5580-3bf8-7e16-dd20af76b06e	4223	Poljane nad Škofjo Loko
00050000-5580-3bf8-d8f7-a8cdea7f2169	2319	Poljčane
00050000-5580-3bf8-8d6d-f26ade1d131a	1272	Polšnik
00050000-5580-3bf8-e6a6-cc2866afafaa	3313	Polzela
00050000-5580-3bf8-d2a7-8f828d05c59b	3232	Ponikva
00050000-5580-3bf8-fd5c-937d35794941	6320	Portorož/Portorose
00050000-5580-3bf8-cf70-7110258979f2	6230	Postojna
00050000-5580-3bf8-2095-ae4c9bca73e8	2331	Pragersko
00050000-5580-3bf8-f817-4979f261a2b4	3312	Prebold
00050000-5580-3bf8-4521-bd6a1e537993	4205	Preddvor
00050000-5580-3bf8-ea3a-cd29a88f96c2	6255	Prem
00050000-5580-3bf8-7b64-6ac89911b8f4	1352	Preserje
00050000-5580-3bf8-77bc-7f6844ec2c60	6258	Prestranek
00050000-5580-3bf8-ffbb-cc78807e403c	2391	Prevalje
00050000-5580-3bf8-c4f2-69bf832346c5	3262	Prevorje
00050000-5580-3bf8-94c0-991c377adfab	1276	Primskovo 
00050000-5580-3bf8-af0e-34b9959b8c34	3253	Pristava pri Mestinju
00050000-5580-3bf8-2f58-f61903888a2f	9207	Prosenjakovci/Partosfalva
00050000-5580-3bf8-0611-886f29431941	5297	Prvačina
00050000-5580-3bf8-4d2d-af188283ea68	2250	Ptuj
00050000-5580-3bf8-304a-7a8cff11cbd4	2323	Ptujska Gora
00050000-5580-3bf8-64ee-44e31329cdb4	9201	Puconci
00050000-5580-3bf8-d118-ff51189ad049	2327	Rače
00050000-5580-3bf8-4cef-8753bed16555	1433	Radeče
00050000-5580-3bf8-3699-0990a479462f	9252	Radenci
00050000-5580-3bf8-47ee-027ef550239d	2360	Radlje ob Dravi
00050000-5580-3bf8-4203-a746c9da3b52	1235	Radomlje
00050000-5580-3bf8-b15a-e54fd126b2b5	4240	Radovljica
00050000-5580-3bf8-d6ec-ba77d9e59fec	8274	Raka
00050000-5580-3bf8-2523-fe82a9bb8d75	1381	Rakek
00050000-5580-3bf8-cf33-15d653ed8bb7	4283	Rateče - Planica
00050000-5580-3bf8-1c52-047d137a351c	2390	Ravne na Koroškem
00050000-5580-3bf8-c35d-1f23b0dba21d	9246	Razkrižje
00050000-5580-3bf8-235e-064dc480bb72	3332	Rečica ob Savinji
00050000-5580-3bf8-3ad1-5c45f0bb345b	5292	Renče
00050000-5580-3bf8-c063-59f577fffd07	1310	Ribnica
00050000-5580-3bf8-6313-faeeb0794643	2364	Ribnica na Pohorju
00050000-5580-3bf8-8956-2b88bb902c02	3272	Rimske Toplice
00050000-5580-3bf8-b792-5ed0fdb827f8	1314	Rob
00050000-5580-3bf8-346a-7613daa863f3	5215	Ročinj
00050000-5580-3bf8-b63a-e3f4e7f1d244	3250	Rogaška Slatina
00050000-5580-3bf8-1fa0-f2ba57b37b2b	9262	Rogašovci
00050000-5580-3bf8-ec25-c2304d474ccf	3252	Rogatec
00050000-5580-3bf8-1ca6-9a6aac3cb55f	1373	Rovte
00050000-5580-3bf8-eeb5-2fafe678780e	2342	Ruše
00050000-5580-3bf8-5f93-9d809e0a1738	1282	Sava
00050000-5580-3bf8-2266-30e94cf8239e	6333	Sečovlje/Sicciole
00050000-5580-3bf8-2d50-524db3ac51e4	4227	Selca
00050000-5580-3bf8-7b8d-bd15e3cf25d2	2352	Selnica ob Dravi
00050000-5580-3bf8-cbd2-ff11a70419fa	8333	Semič
00050000-5580-3bf8-6f8a-ec99c19c4024	8281	Senovo
00050000-5580-3bf8-94b2-ed17660d3955	6224	Senožeče
00050000-5580-3bf8-9a40-10ebb23ab3f0	8290	Sevnica
00050000-5580-3bf8-354e-eff892264091	6210	Sežana
00050000-5580-3bf8-318a-a7ef5ef8b142	2214	Sladki Vrh
00050000-5580-3bf8-37b6-d91ebc3c31c7	5283	Slap ob Idrijci
00050000-5580-3bf8-9f15-1af062c85f11	2380	Slovenj Gradec
00050000-5580-3bf8-d8ea-2a7eebccd08e	2310	Slovenska Bistrica
00050000-5580-3bf8-e229-6fa00ee30ca2	3210	Slovenske Konjice
00050000-5580-3bf8-c178-dbf962efd056	1216	Smlednik
00050000-5580-3bf8-ddb3-6b300226a8ca	5232	Soča
00050000-5580-3bf8-d093-66b44861c80e	1317	Sodražica
00050000-5580-3bf8-a5b1-4129ecc22a6a	3335	Solčava
00050000-5580-3bf8-c471-2d1d348f5741	5250	Solkan
00050000-5580-3bf8-42ff-fa88482ac730	4229	Sorica
00050000-5580-3bf8-a071-43672059a29e	4225	Sovodenj
00050000-5580-3bf8-e783-636e77cef33e	5281	Spodnja Idrija
00050000-5580-3bf8-d715-b8d2c09ac113	2241	Spodnji Duplek
00050000-5580-3bf8-5416-a968737a1046	9245	Spodnji Ivanjci
00050000-5580-3bf8-5ce3-320de9dfef0e	2277	Središče ob Dravi
00050000-5580-3bf8-7a0c-fc085d29fa70	4267	Srednja vas v Bohinju
00050000-5580-3bf8-4b2f-3a32f5f47c4a	8256	Sromlje 
00050000-5580-3bf8-d876-3f119a3e25d3	5224	Srpenica
00050000-5580-3bf8-c10e-e7cb05381273	1242	Stahovica
00050000-5580-3bf8-0257-af08ad91c65e	1332	Stara Cerkev
00050000-5580-3bf8-84fb-b37f97fbdfdb	8342	Stari trg ob Kolpi
00050000-5580-3bf8-644e-145e62a42153	1386	Stari trg pri Ložu
00050000-5580-3bf8-7e2c-76474dbd129c	2205	Starše
00050000-5580-3bf8-4263-3b3777596ea3	2289	Stoperce
00050000-5580-3bf8-2be7-f51a92f16858	8322	Stopiče
00050000-5580-3bf8-9c85-c0a772a70e68	3206	Stranice
00050000-5580-3bf8-ad7f-480dd592f88b	8351	Straža
00050000-5580-3bf8-5258-d6de0a53cccc	1313	Struge
00050000-5580-3bf8-e8d1-ba37c3c06be7	8293	Studenec
00050000-5580-3bf8-5825-0d45c9edc1f4	8331	Suhor
00050000-5580-3bf8-03d4-34ea3dc4492f	2233	Sv. Ana v Slovenskih goricah
00050000-5580-3bf8-c205-66a8d527742d	2235	Sv. Trojica v Slovenskih goricah
00050000-5580-3bf8-ed7e-6a32fd090c3e	2353	Sveti Duh na Ostrem Vrhu
00050000-5580-3bf8-7f09-3b161094ba16	9244	Sveti Jurij ob Ščavnici
00050000-5580-3bf8-fd5b-7929605e4c0b	3264	Sveti Štefan
00050000-5580-3bf8-abf9-ce136fd2bb98	2258	Sveti Tomaž
00050000-5580-3bf8-6d5a-2b626d51ce7e	9204	Šalovci
00050000-5580-3bf8-8d75-dced4a3931e7	5261	Šempas
00050000-5580-3bf8-725d-a7a21148de6c	5290	Šempeter pri Gorici
00050000-5580-3bf8-2fac-c05bf9d67253	3311	Šempeter v Savinjski dolini
00050000-5580-3bf8-16e8-04e4007086a6	4208	Šenčur
00050000-5580-3bf8-55f8-c92888fae463	2212	Šentilj v Slovenskih goricah
00050000-5580-3bf8-1a63-317d1b4757ba	8297	Šentjanž
00050000-5580-3bf8-b346-0df99e87bb6c	2373	Šentjanž pri Dravogradu
00050000-5580-3bf8-f641-b5c42849eb68	8310	Šentjernej
00050000-5580-3bf8-a498-ee78bff354ee	3230	Šentjur
00050000-5580-3bf8-f876-bf26a3e35cce	3271	Šentrupert
00050000-5580-3bf8-4f80-a70f41663a6c	8232	Šentrupert
00050000-5580-3bf8-5233-7b447133525f	1296	Šentvid pri Stični
00050000-5580-3bf8-194f-6c2a8dd50266	8275	Škocjan
00050000-5580-3bf8-b491-7355c7fd0645	6281	Škofije
00050000-5580-3bf8-ea75-f68c67eed16f	4220	Škofja Loka
00050000-5580-3bf8-4eec-563a352e4759	3211	Škofja vas
00050000-5580-3bf8-ce3a-41be84f10da9	1291	Škofljica
00050000-5580-3bf8-5986-01426d5a0986	6274	Šmarje
00050000-5580-3bf8-4025-130ef27d3a1d	1293	Šmarje - Sap
00050000-5580-3bf8-098b-1c85d5fda90d	3240	Šmarje pri Jelšah
00050000-5580-3bf8-4352-13994861f9a6	8220	Šmarješke Toplice
00050000-5580-3bf8-0ae5-293a3b74772f	2315	Šmartno na Pohorju
00050000-5580-3bf8-26e0-c25463a1e87a	3341	Šmartno ob Dreti
00050000-5580-3bf8-d8f1-df036f688d46	3327	Šmartno ob Paki
00050000-5580-3bf8-f77b-f9a9b00bc5fc	1275	Šmartno pri Litiji
00050000-5580-3bf8-45c2-3478e8daf859	2383	Šmartno pri Slovenj Gradcu
00050000-5580-3bf8-aa20-4a8da3206111	3201	Šmartno v Rožni dolini
00050000-5580-3bf8-b8eb-f786cd1bac14	3325	Šoštanj
00050000-5580-3bf8-8e78-3ec8d2ffba65	6222	Štanjel
00050000-5580-3bf8-0d60-b8b7983a3cfe	3220	Štore
00050000-5580-3bf8-524a-b853548732cf	3304	Tabor
00050000-5580-3bf8-a12d-a991692ad8e6	3221	Teharje
00050000-5580-3bf8-9942-502f1885b0da	9251	Tišina
00050000-5580-3bf8-3706-e2b3e71c2587	5220	Tolmin
00050000-5580-3bf8-27a4-5255c94fc991	3326	Topolšica
00050000-5580-3bf8-7d27-a0be79aa053f	2371	Trbonje
00050000-5580-3bf8-8802-ec4ff98aaf52	1420	Trbovlje
00050000-5580-3bf8-ca53-e946fe6f329d	8231	Trebelno 
00050000-5580-3bf8-0bcc-b8929e9db590	8210	Trebnje
00050000-5580-3bf8-8aae-1d240cf07ff2	5252	Trnovo pri Gorici
00050000-5580-3bf8-c6cd-5ac7ef818692	2254	Trnovska vas
00050000-5580-3bf8-477f-6f6ac0c216dd	1222	Trojane
00050000-5580-3bf8-2b2a-8c777da0499f	1236	Trzin
00050000-5580-3bf8-c9e3-3486543f88b9	4290	Tržič
00050000-5580-3bf8-4b54-d318cf08c09d	8295	Tržišče
00050000-5580-3bf8-e8c1-91d36b0d2b2b	1311	Turjak
00050000-5580-3bf8-31d1-4cd0a7587f0c	9224	Turnišče
00050000-5580-3bf8-8cda-03467d7cd67a	8323	Uršna sela
00050000-5580-3bf8-007f-c3cc831a2508	1252	Vače
00050000-5580-3bf8-dc52-8ada6fca05b7	3320	Velenje 
00050000-5580-3bf8-bb76-e83df21839a4	3322	Velenje - poštni predali
00050000-5580-3bf8-a176-82cd6874663e	8212	Velika Loka
00050000-5580-3bf8-898b-178c4ee112de	2274	Velika Nedelja
00050000-5580-3bf8-8039-ae0afebbe1ce	9225	Velika Polana
00050000-5580-3bf8-c6e7-4fb66f829e14	1315	Velike Lašče
00050000-5580-3bf8-07e6-211d9f7245be	8213	Veliki Gaber
00050000-5580-3bf8-f65a-8e26625edc18	9241	Veržej
00050000-5580-3bf8-1307-af33497d648d	1312	Videm - Dobrepolje
00050000-5580-3bf8-ce88-03d1f3a2386d	2284	Videm pri Ptuju
00050000-5580-3bf8-3aaa-59ba724af8fd	8344	Vinica
00050000-5580-3bf8-70d1-4f60d043bf14	5271	Vipava
00050000-5580-3bf8-35ff-033b3ec872ad	4212	Visoko
00050000-5580-3bf8-c7bb-928cf5cd049d	1294	Višnja Gora
00050000-5580-3bf8-daa9-26cd37146ffd	3205	Vitanje
00050000-5580-3bf8-0935-6cc57df519c5	2255	Vitomarci
00050000-5580-3bf8-9930-edc79b4abe97	1217	Vodice
00050000-5580-3bf8-6f68-ee3fd3203bc7	3212	Vojnik\t
00050000-5580-3bf8-f6c8-403455b62058	5293	Volčja Draga
00050000-5580-3bf8-54a2-effc6f875741	2232	Voličina
00050000-5580-3bf8-9c56-a21e802d1c90	3305	Vransko
00050000-5580-3bf8-86da-6efb5063e390	6217	Vremski Britof
00050000-5580-3bf8-4c65-86954f75b3d9	1360	Vrhnika
00050000-5580-3bf8-187c-dcaad7d82a80	2365	Vuhred
00050000-5580-3bf8-d412-307d55d46d31	2367	Vuzenica
00050000-5580-3bf8-1005-3b20b191b555	8292	Zabukovje 
00050000-5580-3bf8-2515-e4ce21e58bc5	1410	Zagorje ob Savi
00050000-5580-3bf8-57a2-c03d4d953a3c	1303	Zagradec
00050000-5580-3bf8-adba-bfb7ed6abcd8	2283	Zavrč
00050000-5580-3bf8-de5c-783843ecb476	8272	Zdole 
00050000-5580-3bf8-fced-6bb9362cfb83	4201	Zgornja Besnica
00050000-5580-3bf8-44f3-2e96e06548b5	2242	Zgornja Korena
00050000-5580-3bf8-f7ff-3c929fabf36e	2201	Zgornja Kungota
00050000-5580-3bf8-be4c-0c20000ebee8	2316	Zgornja Ložnica
00050000-5580-3bf8-79c2-4a17f87af0c6	2314	Zgornja Polskava
00050000-5580-3bf8-02c5-4442bd840eb2	2213	Zgornja Velka
00050000-5580-3bf8-0829-f9734e824096	4247	Zgornje Gorje
00050000-5580-3bf8-c30f-a5e59d3a0ee2	4206	Zgornje Jezersko
00050000-5580-3bf8-a2c4-36a1c5b2dc8f	2285	Zgornji Leskovec
00050000-5580-3bf8-3e7a-e0c9b9ebf516	1432	Zidani Most
00050000-5580-3bf8-e78c-31aa066ec404	3214	Zreče
00050000-5580-3bf8-7b65-bb791fce4bf4	4209	Žabnica
00050000-5580-3bf8-32fd-ae823ca2f599	3310	Žalec
00050000-5580-3bf8-bfb8-d579e231f026	4228	Železniki
00050000-5580-3bf8-1a5d-637a16af3e5a	2287	Žetale
00050000-5580-3bf8-5276-a0e9fe20cf9b	4226	Žiri
00050000-5580-3bf8-26ea-67799e2a68d8	4274	Žirovnica
00050000-5580-3bf8-86a7-4e1cc532b748	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7477668)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7477479)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7477557)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7477680)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7477800)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7477853)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5580-3bfa-c66b-2418d5a3316a	00080000-5580-3bfa-9eeb-61e0bab0541d	0987	A
00190000-5580-3bfa-c7ac-dde5da83c49c	00080000-5580-3bfa-0740-631302d69c54	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7477972)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7478035)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7477985)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7478004)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7477709)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5580-3bfa-0890-6d25a6a0358d	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5580-3bfa-118e-ee1bdad45a2b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5580-3bfa-b0de-963ee826427a	0003	Kazinska	t	84	Kazinska dvorana
00220000-5580-3bfa-9140-77caa85f98ee	0004	Mali oder	t	24	Mali oder 
00220000-5580-3bfa-e1d5-e9bef933f8f3	0005	Komorni oder	t	15	Komorni oder
00220000-5580-3bfa-e681-daf710321356	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5580-3bfa-dd58-8aba52bb580c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7477653)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7477643)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7477842)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7477777)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7477351)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2861 (class 0 OID 7477719)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7477389)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5580-3bf9-97a9-d09edf6d8e22	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5580-3bf9-b6c5-f804f818acf7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5580-3bf9-28f6-3a92263bee9c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5580-3bf9-cb3d-bcfc85bbe03a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5580-3bf9-a766-4d9e4cabdc5f	planer	Planer dogodkov v koledarju	t
00020000-5580-3bf9-e3ed-53dba9590299	kadrovska	Kadrovska služba	t
00020000-5580-3bf9-1f60-524311bb33f7	arhivar	Ažuriranje arhivalij	t
00020000-5580-3bf9-3325-a9528abbbc4c	igralec	Igralec	t
00020000-5580-3bf9-1de0-186601ae4dcd	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7477373)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5580-3bf9-1602-89902c199ce6	00020000-5580-3bf9-28f6-3a92263bee9c
00010000-5580-3bf9-2619-0a522a8d1eaf	00020000-5580-3bf9-28f6-3a92263bee9c
\.


--
-- TOC entry 2863 (class 0 OID 7477733)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7477674)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7477624)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7478068)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5580-3bf8-223e-724178c9f9bc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5580-3bf8-280d-bdadecf50f80	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5580-3bf8-bd29-62431a8296e1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5580-3bf8-72f6-e9fa3bc9f125	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5580-3bf8-5b7f-dbaa9fc154c0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7478060)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5580-3bf8-e8cb-81bbb9022ee6	00230000-5580-3bf8-72f6-e9fa3bc9f125	popa
00240000-5580-3bf8-1a6d-76d332dff9d5	00230000-5580-3bf8-72f6-e9fa3bc9f125	oseba
00240000-5580-3bf8-d46c-78115ac97606	00230000-5580-3bf8-280d-bdadecf50f80	prostor
00240000-5580-3bf8-393d-6c0a211b9a0d	00230000-5580-3bf8-72f6-e9fa3bc9f125	besedilo
00240000-5580-3bf8-1c10-26133bb5bbdd	00230000-5580-3bf8-72f6-e9fa3bc9f125	uprizoritev
00240000-5580-3bf8-2fb2-9aecd20bcad0	00230000-5580-3bf8-72f6-e9fa3bc9f125	funkcija
00240000-5580-3bf8-a975-a7e1337c98a3	00230000-5580-3bf8-72f6-e9fa3bc9f125	tipfunkcije
00240000-5580-3bf8-11c7-08cdd89d1e07	00230000-5580-3bf8-72f6-e9fa3bc9f125	alternacija
00240000-5580-3bf8-e18f-e84d528bc9d7	00230000-5580-3bf8-223e-724178c9f9bc	pogodba
00240000-5580-3bf8-8d61-7ffbf3897f0b	00230000-5580-3bf8-72f6-e9fa3bc9f125	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7478055)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7477787)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7477451)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7477630)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5580-3bfa-c076-90afbc9c2156	00180000-5580-3bfa-6d70-522c48580f15	000c0000-5580-3bfa-7dab-eb5d286cac0a	00090000-5580-3bfa-737f-b0b6a7f4d04f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-3bfa-efd4-929b601a44c3	00180000-5580-3bfa-6d70-522c48580f15	000c0000-5580-3bfa-b42a-ecf30be9a1bb	00090000-5580-3bfa-0a97-bdfff8302be5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-3bfa-6534-e6807c4f8548	00180000-5580-3bfa-6d70-522c48580f15	000c0000-5580-3bfa-ab79-f7927cd02249	00090000-5580-3bfa-2f68-d4fca76cae79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-3bfa-c38c-dfe5d17f94ad	00180000-5580-3bfa-6d70-522c48580f15	000c0000-5580-3bfa-b14d-af7ac27d1efd	00090000-5580-3bfa-8304-292882ec5b0f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-3bfa-fddd-9a98ea0edfc4	00180000-5580-3bfa-6d70-522c48580f15	000c0000-5580-3bfa-3cac-041368cff785	00090000-5580-3bfa-255b-44de577d95c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-3bfa-e8e6-5dad200ce864	00180000-5580-3bfa-3d7e-e212a2c2f95f	\N	00090000-5580-3bfa-255b-44de577d95c0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7477831)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5580-3bf8-3a5a-a0648cbe2225	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5580-3bf8-fff0-787ae8def5c9	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5580-3bf8-2e64-64322a7e340d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5580-3bf8-2ece-3906c5be4835	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5580-3bf8-893e-664a60a5f740	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5580-3bf8-d976-5f7fee595b1d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5580-3bf8-36fc-42170f255116	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5580-3bf8-3fed-84a3739e0f9d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5580-3bf8-5e94-4f79dc8c197f	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5580-3bf8-83ca-ccbf750d6c1f	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5580-3bf8-1e37-9333fc38ed0b	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5580-3bf8-8fc2-1c5a47507df2	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5580-3bf8-59ae-503e8e1b187d	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5580-3bf8-da5a-89f8dbf2ea5d	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5580-3bf8-473a-090401b66cc8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5580-3bf8-cb15-e3a71b45e744	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7478024)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5580-3bf8-aeb0-cda4035bf871	01	Velika predstava	f	1.00	1.00
002b0000-5580-3bf8-f8f6-afd7a1db0fb8	02	Mala predstava	f	0.50	0.50
002b0000-5580-3bf8-54df-8e614fe6cb92	03	Mala koprodukcija	t	0.40	1.00
002b0000-5580-3bf8-7ad8-f7e429a0fe8b	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5580-3bf8-4cd0-bc93cc1acc5e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7477514)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7477360)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5580-3bf9-2619-0a522a8d1eaf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROkYj0zVC21hCrGusCYsG6pEi18c0QYTi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-df30-8cc88a1740be	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-d257-8303d4404a81	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-3625-3446f111d3f1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-7c30-50b8b9ca0ccb	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-5cf6-02f307c1aacf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-d03b-c34d62f44a51	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-0e25-2f726920a50a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5580-3bfa-e6a6-9759c7065aab	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5580-3bf9-1602-89902c199ce6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7477888)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5580-3bfa-66fa-26a0af3c582e	00160000-5580-3bfa-09ff-01d745f94b75	00150000-5580-3bf8-4660-7feab29e1516	00140000-5580-3bf8-5a86-3cc6b115ee5f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5580-3bfa-e1d5-e9bef933f8f3
000e0000-5580-3bfa-8882-c3e792397480	00160000-5580-3bfa-6aa7-0cb8b5726545	00150000-5580-3bf8-1921-29ce0e232bf5	00140000-5580-3bf8-02d9-3ca596a051dc	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5580-3bfa-e681-daf710321356
000e0000-5580-3bfa-a71b-e4fdd27f9b92	\N	00150000-5580-3bf8-1921-29ce0e232bf5	00140000-5580-3bf8-02d9-3ca596a051dc	00190000-5580-3bfa-c66b-2418d5a3316a	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5580-3bfa-e1d5-e9bef933f8f3
000e0000-5580-3bfa-bd4d-28dd0a224a2a	\N	00150000-5580-3bf8-1921-29ce0e232bf5	00140000-5580-3bf8-02d9-3ca596a051dc	00190000-5580-3bfa-c66b-2418d5a3316a	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5580-3bfa-e1d5-e9bef933f8f3
\.


--
-- TOC entry 2844 (class 0 OID 7477576)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5580-3bfa-0494-b2f83947ff73	000e0000-5580-3bfa-8882-c3e792397480	1	
00200000-5580-3bfa-cef0-101b7b3518da	000e0000-5580-3bfa-8882-c3e792397480	2	
\.


--
-- TOC entry 2859 (class 0 OID 7477701)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7477770)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7477608)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7477878)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5580-3bf8-5a86-3cc6b115ee5f	01	Drama	drama (SURS 01)
00140000-5580-3bf8-bfff-3315013f4107	02	Opera	opera (SURS 02)
00140000-5580-3bf8-27d1-023ad481e352	03	Balet	balet (SURS 03)
00140000-5580-3bf8-1f29-1aa639a1edec	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5580-3bf8-1bf5-e70a7c1f1a1d	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5580-3bf8-02d9-3ca596a051dc	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5580-3bf8-cbc6-4c041915b6f1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7477760)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5580-3bf8-1575-e98143710c8f	01	Opera	opera
00150000-5580-3bf8-1467-70de460119bc	02	Opereta	opereta
00150000-5580-3bf8-a5f5-22b9d2ba7817	03	Balet	balet
00150000-5580-3bf8-95e8-4335a2f21755	04	Plesne prireditve	plesne prireditve
00150000-5580-3bf8-b5c5-c0f8efaa0923	05	Lutkovno gledališče	lutkovno gledališče
00150000-5580-3bf8-3010-a0a084faad64	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5580-3bf8-6f7f-dea7ae84bcc8	07	Biografska drama	biografska drama
00150000-5580-3bf8-4660-7feab29e1516	08	Komedija	komedija
00150000-5580-3bf8-d49a-115b46b7005d	09	Črna komedija	črna komedija
00150000-5580-3bf8-70d5-14a366f9ae78	10	E-igra	E-igra
00150000-5580-3bf8-1921-29ce0e232bf5	11	Kriminalka	kriminalka
00150000-5580-3bf8-0d67-f79ce415ca36	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7477414)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7477935)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7477925)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7477830)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7477598)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7477623)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7477540)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7477968)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7477756)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7477574)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7477617)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7477554)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7477666)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7477693)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7477512)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7477423)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2414 (class 2606 OID 7477447)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7477403)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7477388)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7477699)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7477732)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7477873)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7477476)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7477500)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7477672)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 7477490)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7477561)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7477684)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7477812)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7477858)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7477983)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7478053)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7478000)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7478021)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7477716)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7477657)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7477648)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7477852)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7477784)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7477359)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7477723)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7477377)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7477397)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7477741)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7477679)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7477629)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7478077)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7478065)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7478059)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7477797)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7477456)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7477639)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7477841)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7478034)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7477525)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7477372)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7477904)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7477583)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7477707)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7477775)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7477612)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7477886)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7477768)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7477605)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7477798)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7477799)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7477478)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2380 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2382 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2512 (class 1259 OID 7477700)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7477686)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7477685)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7477584)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7477757)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7477759)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7477758)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7477556)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7477555)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7477875)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7477876)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7477877)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7478023)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7478022)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7477909)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7477906)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7477910)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7477908)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7477907)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7477527)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7477526)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2385 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2412 (class 1259 OID 7477450)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7477724)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7477618)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7477404)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7477405)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7477744)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7477743)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7477742)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7477562)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7477564)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7477563)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7478067)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7477652)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7477650)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7477649)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7477651)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7477378)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7477379)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7477708)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7477673)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7477785)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7477786)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7477969)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7477970)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7477971)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7477492)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7477491)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7477493)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7478054)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7477813)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7477814)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7477939)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7477941)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7477937)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7477940)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7477938)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7477776)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7477661)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7477660)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7477658)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7477659)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7477927)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7477926)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7477984)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7477575)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7477425)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7477424)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7477457)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7477458)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7477642)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7477641)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7477640)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7478003)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7478001)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7478002)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7477607)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7477603)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7477600)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7477601)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7477599)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7477604)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7477602)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7477477)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7477541)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7477543)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7477542)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7477544)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7477667)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7477874)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7477905)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7477448)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7477449)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7477769)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7478078)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7477513)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7478066)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7477718)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7477717)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7477936)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7477501)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7477887)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7477859)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7477860)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7477398)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7477606)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2652 (class 2606 OID 7478214)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7478199)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2650 (class 2606 OID 7478204)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2654 (class 2606 OID 7478224)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2648 (class 2606 OID 7478194)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2653 (class 2606 OID 7478219)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7478209)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2683 (class 2606 OID 7478369)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 7478374)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7478129)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7478309)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2670 (class 2606 OID 7478304)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2669 (class 2606 OID 7478299)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7478189)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7478339)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7478349)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7478344)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2642 (class 2606 OID 7478164)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2641 (class 2606 OID 7478159)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7478289)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7478394)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7478399)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7478404)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 7478509)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2710 (class 2606 OID 7478504)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2694 (class 2606 OID 7478424)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7478409)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2695 (class 2606 OID 7478429)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7478419)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2692 (class 2606 OID 7478414)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2640 (class 2606 OID 7478154)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2639 (class 2606 OID 7478149)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7478114)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2631 (class 2606 OID 7478109)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7478319)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7478229)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2627 (class 2606 OID 7478089)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2628 (class 2606 OID 7478094)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2676 (class 2606 OID 7478334)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7478329)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2674 (class 2606 OID 7478324)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2643 (class 2606 OID 7478169)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 7478179)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7478174)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7478519)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2662 (class 2606 OID 7478264)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2660 (class 2606 OID 7478254)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2659 (class 2606 OID 7478249)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2661 (class 2606 OID 7478259)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2625 (class 2606 OID 7478079)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7478084)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7478314)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7478294)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2681 (class 2606 OID 7478359)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2682 (class 2606 OID 7478364)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 7478469)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7478474)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2705 (class 2606 OID 7478479)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7478139)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7478134)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2638 (class 2606 OID 7478144)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7478514)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2685 (class 2606 OID 7478379)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2686 (class 2606 OID 7478384)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7478454)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2702 (class 2606 OID 7478464)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7478444)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2701 (class 2606 OID 7478459)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2699 (class 2606 OID 7478449)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7478354)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 7478284)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2665 (class 2606 OID 7478279)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2663 (class 2606 OID 7478269)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2664 (class 2606 OID 7478274)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2697 (class 2606 OID 7478439)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7478434)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7478484)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7478184)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7478389)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2630 (class 2606 OID 7478104)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2629 (class 2606 OID 7478099)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2633 (class 2606 OID 7478119)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7478124)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2658 (class 2606 OID 7478244)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7478239)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2656 (class 2606 OID 7478234)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2709 (class 2606 OID 7478499)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7478489)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7478494)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-16 17:08:43 CEST

--
-- PostgreSQL database dump complete
--

