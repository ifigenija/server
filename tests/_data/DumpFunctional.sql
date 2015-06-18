--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-18 16:39:23 CEST

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
-- TOC entry 180 (class 1259 OID 7782178)
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
-- TOC entry 227 (class 1259 OID 7782700)
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
-- TOC entry 226 (class 1259 OID 7782683)
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
-- TOC entry 219 (class 1259 OID 7782587)
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
-- TOC entry 194 (class 1259 OID 7782357)
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
-- TOC entry 197 (class 1259 OID 7782391)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7782300)
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
-- TOC entry 228 (class 1259 OID 7782714)
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
-- TOC entry 213 (class 1259 OID 7782517)
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
-- TOC entry 192 (class 1259 OID 7782337)
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
-- TOC entry 196 (class 1259 OID 7782385)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7782317)
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
-- TOC entry 202 (class 1259 OID 7782434)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7782459)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7782274)
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
-- TOC entry 181 (class 1259 OID 7782187)
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
-- TOC entry 182 (class 1259 OID 7782198)
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
-- TOC entry 177 (class 1259 OID 7782152)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7782171)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7782466)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7782497)
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
-- TOC entry 223 (class 1259 OID 7782633)
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
-- TOC entry 184 (class 1259 OID 7782231)
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
-- TOC entry 186 (class 1259 OID 7782266)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7782440)
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
-- TOC entry 185 (class 1259 OID 7782251)
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
-- TOC entry 191 (class 1259 OID 7782329)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7782452)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7782572)
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
-- TOC entry 222 (class 1259 OID 7782625)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7782744)
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
-- TOC entry 233 (class 1259 OID 7782807)
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
-- TOC entry 230 (class 1259 OID 7782757)
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
-- TOC entry 231 (class 1259 OID 7782776)
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
-- TOC entry 209 (class 1259 OID 7782481)
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
-- TOC entry 201 (class 1259 OID 7782425)
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
-- TOC entry 200 (class 1259 OID 7782415)
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
-- TOC entry 221 (class 1259 OID 7782614)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7782549)
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
-- TOC entry 174 (class 1259 OID 7782123)
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
-- TOC entry 173 (class 1259 OID 7782121)
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
-- TOC entry 210 (class 1259 OID 7782491)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7782161)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7782145)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7782505)
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
-- TOC entry 204 (class 1259 OID 7782446)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7782396)
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
-- TOC entry 236 (class 1259 OID 7782840)
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
-- TOC entry 235 (class 1259 OID 7782832)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7782827)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7782559)
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
-- TOC entry 183 (class 1259 OID 7782223)
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
-- TOC entry 199 (class 1259 OID 7782402)
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
-- TOC entry 220 (class 1259 OID 7782603)
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
-- TOC entry 232 (class 1259 OID 7782796)
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
-- TOC entry 188 (class 1259 OID 7782286)
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
-- TOC entry 175 (class 1259 OID 7782132)
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
-- TOC entry 225 (class 1259 OID 7782660)
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
-- TOC entry 193 (class 1259 OID 7782348)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7782473)
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
-- TOC entry 215 (class 1259 OID 7782542)
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
-- TOC entry 195 (class 1259 OID 7782380)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7782650)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7782532)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7782126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7782178)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7782700)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5582-d818-27f0-b08cb3d980e0	000d0000-5582-d818-2954-a96e922f4c44	\N	00090000-5582-d80a-7f42-ac23ceb97791	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-d818-6125-3e94982af458	000d0000-5582-d818-e9af-8983ff985f1e	\N	00090000-5582-d80a-6076-7e936a775ec0	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-d818-6810-c5dce2a2ed89	000d0000-5582-d818-41a4-91a0ea1b2396	\N	00090000-5582-d80a-58c3-7ab942521819	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-d818-6d3b-60ec676fc0e9	000d0000-5582-d818-26be-6ac3eeb1b59d	\N	00090000-5582-d80a-1d36-bb6a985d2b78	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-d818-bfcd-a33acdc4e366	000d0000-5582-d818-9ad9-d9206855c089	\N	00090000-5582-d80a-d68f-0064641b44f4	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-d818-accc-6584e31dbf4a	000d0000-5582-d818-8e06-817bf8f53068	\N	00090000-5582-d80a-6076-7e936a775ec0	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7782683)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7782587)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5582-d809-8dbd-226f808c645a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5582-d809-fb9b-3feb68d14ac4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5582-d809-f6aa-2773e8c8a63a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7782357)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5582-d80a-84ad-f76f7e46763c	\N	\N	00200000-5582-d80a-d553-429ac5796a55	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5582-d80a-50b0-a7c6f27051cc	\N	\N	00200000-5582-d80a-425d-c4a120392432	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5582-d80a-31d3-160f15230153	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5582-d80a-1ba6-457f859993a4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5582-d80a-b256-7b958cd4c511	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7782391)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7782300)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5582-d804-d454-021a6b8a2356	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5582-d804-e44c-d7b3da1936c5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5582-d804-9a4f-f7de86818b3d	AL	ALB	008	Albania 	Albanija	\N
00040000-5582-d804-4c44-6229b3c83966	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5582-d804-7fba-c907f79d53b3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5582-d804-9cdc-f830c312618f	AD	AND	020	Andorra 	Andora	\N
00040000-5582-d804-a45f-571697c7dc8b	AO	AGO	024	Angola 	Angola	\N
00040000-5582-d804-cc90-34809f2d181a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5582-d804-0924-c4194f422355	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5582-d804-bc53-c8730aac239a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-d804-cc41-59b61cd6fc21	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5582-d804-fdd5-25045075fb71	AM	ARM	051	Armenia 	Armenija	\N
00040000-5582-d804-4733-d87f1b49d705	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5582-d804-3838-6c7b1d2499e6	AU	AUS	036	Australia 	Avstralija	\N
00040000-5582-d804-dab0-d65946dbba95	AT	AUT	040	Austria 	Avstrija	\N
00040000-5582-d804-1cf0-7188e2f3d0bc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5582-d804-b04f-d317b7add814	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5582-d804-80f3-4a16ba8857a5	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5582-d804-1194-e742c0292d83	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5582-d804-f8d9-fafa5dc9b43d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5582-d804-3925-5b1b9f302bdd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5582-d804-03d8-36b01b47f728	BE	BEL	056	Belgium 	Belgija	\N
00040000-5582-d804-fbad-0f7ec3030e47	BZ	BLZ	084	Belize 	Belize	\N
00040000-5582-d804-f8d3-842c0ba93afc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5582-d804-9ac3-0c11bf63f98e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5582-d804-535f-76cadcee527d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5582-d804-bfda-8a101364b5a8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5582-d804-5c08-8948039abb8a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5582-d804-01cd-1237cd9aa271	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5582-d804-5d62-f40750d15781	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5582-d804-b18d-b79d313d76b8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5582-d804-3592-3f5512a00121	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5582-d804-c147-b296cdfc7038	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5582-d804-3d3d-75064da047e8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5582-d804-f20a-e6377187926e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5582-d804-657e-edabfc411c82	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5582-d804-b47d-b39e32c15830	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5582-d804-9acd-a36a1e9491dc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5582-d804-eccd-1fe270d2a107	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5582-d804-e5d5-4b5c0dd9db55	CA	CAN	124	Canada 	Kanada	\N
00040000-5582-d804-e190-b2ebeff5f198	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5582-d804-a0d5-7be2353041d2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5582-d804-aff7-f548f495429f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5582-d804-0a1b-ff0845783984	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5582-d804-cacd-6b610ef215d4	CL	CHL	152	Chile 	Čile	\N
00040000-5582-d804-eee5-3347da887cd3	CN	CHN	156	China 	Kitajska	\N
00040000-5582-d804-ae6b-40dcd9cdd15a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5582-d804-9444-1f55c1b313a4	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5582-d804-63bc-a968de89ccaa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5582-d804-85e2-ff0e99950f89	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5582-d804-4f14-ae3f7383349e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5582-d804-d156-9b96d387a251	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5582-d804-4fdf-45edd4c575f0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5582-d804-90c5-31ad7e65cee7	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5582-d804-7ad1-bb282e6361c0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5582-d804-8d04-91a9f9da64b4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5582-d804-6267-726b6d98487f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5582-d804-ef62-77c7646ef637	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5582-d804-f766-ad80871c84bb	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5582-d804-dbde-d247e1b55a1e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5582-d804-3ade-f746e8372904	DK	DNK	208	Denmark 	Danska	\N
00040000-5582-d804-8dd0-764fb7f1fd39	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5582-d804-2cfc-d92d15b8fb57	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-d804-2030-eeb794347502	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5582-d804-c1ff-679b8aa4385b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5582-d804-2981-5272d29e0204	EG	EGY	818	Egypt 	Egipt	\N
00040000-5582-d804-566e-1b683c4eb8b1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5582-d804-386b-5608588fa932	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5582-d804-683c-3b607852a9e5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5582-d804-ffa0-118ee2e23dde	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5582-d804-4352-8bf8461634f7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5582-d804-268a-4c0798721063	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5582-d804-897e-dc637ef410f8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5582-d804-76a0-703053a6bc2d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5582-d804-ac33-a1dba611baa1	FI	FIN	246	Finland 	Finska	\N
00040000-5582-d804-9c81-71dcba5c3367	FR	FRA	250	France 	Francija	\N
00040000-5582-d804-1773-e36882385b07	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5582-d804-451a-84d15437abf6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5582-d804-3c7b-0913f9c1db05	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5582-d804-5eff-ef271bad06ba	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5582-d804-5787-7a9121ca696d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5582-d804-6fdb-ea53e4463ecd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5582-d804-2351-856f1757eb31	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5582-d804-d5c4-b850c7c395e3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5582-d804-efa5-28833f1a8fa2	GH	GHA	288	Ghana 	Gana	\N
00040000-5582-d804-6412-ff625dd5346c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5582-d804-8e0e-8367b6767493	GR	GRC	300	Greece 	Grčija	\N
00040000-5582-d804-2db6-571590ef47e8	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5582-d804-0958-403278bb3260	GD	GRD	308	Grenada 	Grenada	\N
00040000-5582-d804-cc7c-b143dc5f99d8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5582-d804-f469-03a28f1f0262	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5582-d804-6490-ae934a9167b3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5582-d804-c438-00d56959417d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5582-d804-120c-068658bd35b5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5582-d804-eac7-1173e5d94090	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5582-d804-44be-105357d7211b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5582-d804-20c2-d940a6a8e58c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5582-d804-1dfb-9a1bd4247758	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5582-d804-2232-b37e6a548d5e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5582-d804-fbde-2adffab2e534	HN	HND	340	Honduras 	Honduras	\N
00040000-5582-d804-8fcd-af962edc3d44	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5582-d804-ff75-746d103e67a8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5582-d804-03e1-3b36c78b1058	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5582-d804-30a6-fc3360a45dc6	IN	IND	356	India 	Indija	\N
00040000-5582-d804-b2cd-ca7400057a1b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5582-d804-6752-c9f41ff2cd5e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5582-d804-e353-593d97ab465d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5582-d804-ad4f-343396f1f0ae	IE	IRL	372	Ireland 	Irska	\N
00040000-5582-d804-b837-153b42e44bbc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5582-d804-bc3c-a6025a86ae9c	IL	ISR	376	Israel 	Izrael	\N
00040000-5582-d804-2bce-1a3bef323bdd	IT	ITA	380	Italy 	Italija	\N
00040000-5582-d804-2817-9d80b678e7d5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5582-d804-887b-fdbe5b309d55	JP	JPN	392	Japan 	Japonska	\N
00040000-5582-d804-6999-4aecebf02174	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5582-d804-eaf4-9cc83220a8d6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5582-d804-81a0-a6e12e1c7ddd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5582-d804-03e0-ce7ba0bdc120	KE	KEN	404	Kenya 	Kenija	\N
00040000-5582-d804-83ce-9de2ff50fbad	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5582-d804-9325-ce8e828b1185	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5582-d804-6f86-381c2dd9a480	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5582-d804-6525-952b3fd89f4b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5582-d804-a5e9-290852e788fc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5582-d804-9a7e-1813e7f5322b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5582-d804-41bb-df06dd952895	LV	LVA	428	Latvia 	Latvija	\N
00040000-5582-d804-5b4d-164cbc431108	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5582-d804-e774-80722ba698ce	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5582-d804-8b03-cbdd66825477	LR	LBR	430	Liberia 	Liberija	\N
00040000-5582-d804-3c7e-978cf2ed1baf	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5582-d804-3009-3b44bb69d9ab	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5582-d804-4849-4664dd54ac68	LT	LTU	440	Lithuania 	Litva	\N
00040000-5582-d804-2448-e41c22a2003e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5582-d804-5c18-7e550a4ea7dc	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5582-d804-587b-42ca71530e23	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5582-d804-46d4-f7b094e84a63	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5582-d804-7a2a-c0377e44ef97	MW	MWI	454	Malawi 	Malavi	\N
00040000-5582-d804-9560-6ebdf79e29cb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5582-d804-dd70-82af6a53c8bf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5582-d804-9ee0-9c8b4ce58a62	ML	MLI	466	Mali 	Mali	\N
00040000-5582-d804-b586-c7edaca72c5d	MT	MLT	470	Malta 	Malta	\N
00040000-5582-d804-7246-4a8a029d7817	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5582-d804-20dd-c5a053b464c6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5582-d804-2719-95028f13f005	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5582-d804-2b16-110f1eafa2ee	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5582-d804-3130-8447f1b55521	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5582-d804-e90b-bb174afa8ed3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5582-d804-984c-78024de48e4f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5582-d804-ae06-fd0ba2e998d1	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5582-d804-b301-bacd1fb38468	MC	MCO	492	Monaco 	Monako	\N
00040000-5582-d804-98ac-976672d12af7	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5582-d804-7cea-daef43f1923b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5582-d804-a984-3806db997d02	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5582-d804-53f1-5ee483759b80	MA	MAR	504	Morocco 	Maroko	\N
00040000-5582-d804-457c-882a221f592e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5582-d804-24b8-2a71dfb14627	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5582-d804-0127-7541b15e6356	NA	NAM	516	Namibia 	Namibija	\N
00040000-5582-d804-afba-865d9ace2278	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5582-d804-5d03-2254da0ad8ac	NP	NPL	524	Nepal 	Nepal	\N
00040000-5582-d804-9bc8-a2e0ffa9d266	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5582-d804-2b86-85cb230d38dd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5582-d804-cc14-3e40f2db8f20	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5582-d804-adfc-188a20be7c82	NE	NER	562	Niger 	Niger 	\N
00040000-5582-d804-f41f-016970eefdb6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5582-d804-6923-1517b832b870	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5582-d804-a9fe-7c2f279e1de5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5582-d804-495c-d8006a432631	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5582-d804-df91-d9146f4090c8	NO	NOR	578	Norway 	Norveška	\N
00040000-5582-d804-7d27-da20be48d6cd	OM	OMN	512	Oman 	Oman	\N
00040000-5582-d804-4d3d-360c8a057e51	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5582-d804-74ef-b0a2fe6e737e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5582-d804-0bb9-f513b767fa39	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5582-d804-9ab0-2c7421df5b40	PA	PAN	591	Panama 	Panama	\N
00040000-5582-d804-2162-c559e2638ab1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5582-d804-d55f-789c34bb8197	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5582-d804-7291-b69142a5d260	PE	PER	604	Peru 	Peru	\N
00040000-5582-d804-2c6d-eccb75122e83	PH	PHL	608	Philippines 	Filipini	\N
00040000-5582-d804-bfe1-e9e054d7f139	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5582-d804-445b-2f623f1868ef	PL	POL	616	Poland 	Poljska	\N
00040000-5582-d804-ecf1-15e5a6237adb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5582-d804-c88d-54f52b8708e1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5582-d804-aed0-087236687cae	QA	QAT	634	Qatar 	Katar	\N
00040000-5582-d804-3153-7cee38d2c783	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5582-d804-9ad0-b691bbc35ad6	RO	ROU	642	Romania 	Romunija	\N
00040000-5582-d804-a5ef-325c60e1c164	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5582-d804-c321-0a9f66a6c8fe	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5582-d804-8fc2-3c9faf86414b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5582-d804-e8ba-c3bbafe59708	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5582-d804-d7e9-fb354fd7fb7b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5582-d804-85f7-b7e2ec3b3f36	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5582-d804-3e58-5225f00a5bec	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5582-d804-1eca-21ee26081fa8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5582-d804-7ddd-f11f4be8c67f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5582-d804-a9c3-4784c6e7266e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5582-d804-a17e-3fbdcb14471f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5582-d804-dfb3-46b353347489	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5582-d804-4bf8-def1e6b69838	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5582-d804-147a-ef1ce34451a4	SN	SEN	686	Senegal 	Senegal	\N
00040000-5582-d804-45d1-27a6955f2221	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5582-d804-4126-683413a015d8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5582-d805-78cf-a6f87595addb	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5582-d805-7624-51539a1c8ed6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5582-d805-dc8c-a052f66bb3ac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5582-d805-750e-bd1ef90beeb1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5582-d805-9924-3dfeb5fdc988	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5582-d805-444b-b622896f59dc	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5582-d805-d977-f7daaedf22ae	SO	SOM	706	Somalia 	Somalija	\N
00040000-5582-d805-eb50-584db6118558	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5582-d805-7643-ef83da42de1b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5582-d805-9186-0b07274525af	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5582-d805-73e8-4666ada171ea	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5582-d805-c320-c49e01ead970	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5582-d805-391b-6e4e56e27dc3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5582-d805-99cd-2e2830712c2f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5582-d805-8fb3-ee23b3fdd229	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5582-d805-192d-154a54df361b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5582-d805-63d2-5ba6b92c66e3	SE	SWE	752	Sweden 	Švedska	\N
00040000-5582-d805-b3fd-9fe43f39673b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5582-d805-cf1e-20c63932a56b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5582-d805-4ddd-9e1b57d4532b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5582-d805-cdb7-2fc439eea7bc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5582-d805-d70f-32e6ee334d9a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5582-d805-eb5c-882d1a78bf28	TH	THA	764	Thailand 	Tajska	\N
00040000-5582-d805-8399-73a4bfeca0c0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5582-d805-d4d9-6f5bdb005c12	TG	TGO	768	Togo 	Togo	\N
00040000-5582-d805-5e29-9bb4ba84f432	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5582-d805-ba76-86f3f637f151	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5582-d805-59d0-afcf880e5ea1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5582-d805-06ff-4161336879de	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5582-d805-dfce-2fb9fe9f8c4b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5582-d805-a27f-83d487bd828f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5582-d805-bfbe-500330fabe7d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-d805-a0bb-4af94f2ef6ac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5582-d805-a089-41167921d7f7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5582-d805-c67f-7d6fdcdde2ee	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5582-d805-e47b-45b26c366529	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5582-d805-2a6c-ffd67f74b75a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5582-d805-1f30-5cb6e93d97d2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5582-d805-aff7-0f7a28958787	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5582-d805-4fb5-97bc25297ed4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5582-d805-bf75-904d9992757b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5582-d805-a63f-491f40b8749d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5582-d805-e328-a5e8991a50ee	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5582-d805-208d-992eda95cde8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5582-d805-8137-1bcb5fab9b5c	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-d805-c564-e73165e77d26	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5582-d805-ab9f-792059c58ca5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5582-d805-0eb6-dd0a85e74730	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5582-d805-2b78-40dbb779ee93	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5582-d805-8908-6c9938fc455e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5582-d805-b275-d00be6ae067e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7782714)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7782517)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5582-d818-adf3-08fa430aa26b	000e0000-5582-d80a-aac4-47609357be6e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5582-d807-c4f8-8414216975d9
000d0000-5582-d818-2954-a96e922f4c44	000e0000-5582-d80a-aac4-47609357be6e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-d807-c4f8-8414216975d9
000d0000-5582-d818-e9af-8983ff985f1e	000e0000-5582-d80a-aac4-47609357be6e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5582-d807-7e01-d7bb505f03f2
000d0000-5582-d818-41a4-91a0ea1b2396	000e0000-5582-d80a-aac4-47609357be6e	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5582-d807-f40d-1627e02b44aa
000d0000-5582-d818-26be-6ac3eeb1b59d	000e0000-5582-d80a-aac4-47609357be6e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5582-d807-f40d-1627e02b44aa
000d0000-5582-d818-9ad9-d9206855c089	000e0000-5582-d80a-aac4-47609357be6e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5582-d807-f40d-1627e02b44aa
000d0000-5582-d818-8e06-817bf8f53068	000e0000-5582-d80a-aac4-47609357be6e	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-d807-c4f8-8414216975d9
\.


--
-- TOC entry 2843 (class 0 OID 7782337)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7782385)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7782317)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5582-d80a-9a77-c22fc2a691f0	00080000-5582-d80a-02ae-19361cd8cd73	00090000-5582-d80a-7f42-ac23ceb97791	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7782434)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7782459)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7782274)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5582-d806-8e3f-dcb298463050	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5582-d806-566e-a94f1bbe538e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5582-d806-8a87-a58e18c79297	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5582-d806-43f5-069b43c7c7fe	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5582-d806-1924-e88d854b19f1	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5582-d806-2607-924e43fffc3b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5582-d806-1b6e-0a1c142021df	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5582-d806-b47e-40b3c97761bd	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-d806-7e21-2595c949329b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-d806-6552-096d1fd3a730	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5582-d806-4979-2fa5b1682aa7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5582-d806-4b85-8287395e20b9	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5582-d809-219a-0866ba5d4f59	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5582-d809-8d58-286fc99940f7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5582-d809-3271-6ce6c93342bb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5582-d809-0c2d-eacfe2fbdfe8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5582-d809-3d4b-9f0e8d4a4a7b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5582-d809-df9d-7025bd2dd8c6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7782187)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5582-d809-c98f-eeca5e1cab6d	00000000-5582-d809-8d58-286fc99940f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5582-d809-5ab9-7230759b64f9	00000000-5582-d809-8d58-286fc99940f7	00010000-5582-d806-51ff-4f6255e8cb13	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5582-d809-99f4-acec9c89c43f	00000000-5582-d809-3271-6ce6c93342bb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7782198)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5582-d80a-ef0c-68fa67ef929f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5582-d80a-1d36-bb6a985d2b78	00010000-5582-d809-2dca-bb117e4109c0	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5582-d80a-58c3-7ab942521819	00010000-5582-d809-d81d-d71b46773212	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5582-d80a-a203-2affa23d954b	00010000-5582-d809-3ae9-f6b128f842e3	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5582-d80a-8463-52c96e5f3b3c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5582-d80a-f969-8b6fb9d938b5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5582-d80a-7326-a06dbec34f33	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5582-d80a-d279-3ae89814d337	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5582-d80a-7f42-ac23ceb97791	00010000-5582-d809-c8c7-fbdbc9ed16cf	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5582-d80a-6076-7e936a775ec0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5582-d80a-658c-15501bff7952	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5582-d80a-d68f-0064641b44f4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5582-d80a-423f-2cd101d9cf63	00010000-5582-d809-ee6d-f1b81bf28ff7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7782152)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5582-d805-0a6e-acddb0e658a7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5582-d805-2c70-aac71fa06d76	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5582-d805-6173-f2675263d2ea	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5582-d805-28ba-6ef47ece978f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5582-d805-b4b6-62d2c32b26af	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5582-d805-3fec-13fbefc219f9	Abonma-read	Abonma - branje	f
00030000-5582-d805-34ff-ab60160c036e	Abonma-write	Abonma - spreminjanje	f
00030000-5582-d805-1a0f-aa1cd02eabaa	Alternacija-read	Alternacija - branje	f
00030000-5582-d805-c9ab-b03222fb6aa5	Alternacija-write	Alternacija - spreminjanje	f
00030000-5582-d805-c9a9-eac5274b2f80	Arhivalija-read	Arhivalija - branje	f
00030000-5582-d805-258a-473ee7bc17b2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5582-d805-1507-16201caf911e	Besedilo-read	Besedilo - branje	f
00030000-5582-d805-4fae-d8a5818eeb6c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5582-d805-46cb-f6244f484774	DogodekIzven-read	DogodekIzven - branje	f
00030000-5582-d805-5695-f35c57bb2dec	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5582-d805-00d1-842f4b473d39	Dogodek-read	Dogodek - branje	f
00030000-5582-d805-4c13-ecbb5432a0c1	Dogodek-write	Dogodek - spreminjanje	f
00030000-5582-d805-7636-aa7c57af085d	Drzava-read	Drzava - branje	f
00030000-5582-d805-3d1d-cd66dcde2d39	Drzava-write	Drzava - spreminjanje	f
00030000-5582-d805-b1eb-0ef69b65236d	Funkcija-read	Funkcija - branje	f
00030000-5582-d805-6726-925c2edc423d	Funkcija-write	Funkcija - spreminjanje	f
00030000-5582-d805-c804-aace1f4a0c8f	Gostovanje-read	Gostovanje - branje	f
00030000-5582-d805-2fad-e6787d193bdf	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5582-d805-ba2e-c0804317c2ba	Gostujoca-read	Gostujoca - branje	f
00030000-5582-d805-1480-7e7c11c2ff1d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5582-d805-7dbc-4d8a92ac7c79	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5582-d805-ccb2-a0244e6e6020	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5582-d805-90f8-b97ef4ea7631	Kupec-read	Kupec - branje	f
00030000-5582-d805-4fbf-5e65330ca773	Kupec-write	Kupec - spreminjanje	f
00030000-5582-d805-1481-29f2f6e7d2c7	NacinPlacina-read	NacinPlacina - branje	f
00030000-5582-d805-0217-33f323709ef1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5582-d805-4bbb-507dce5e9c18	Option-read	Option - branje	f
00030000-5582-d805-d990-c47d2486d4ef	Option-write	Option - spreminjanje	f
00030000-5582-d805-043e-9d576806efb2	OptionValue-read	OptionValue - branje	f
00030000-5582-d805-487d-5fcbcd1cc123	OptionValue-write	OptionValue - spreminjanje	f
00030000-5582-d805-a285-ea4941fbb5fe	Oseba-read	Oseba - branje	f
00030000-5582-d805-73c3-bfecb5fd8abf	Oseba-write	Oseba - spreminjanje	f
00030000-5582-d805-b52f-ab9b3bc33309	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5582-d805-26b0-180d1d3d0a38	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5582-d805-e99f-25fb4def59c6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5582-d805-a228-1f552f32173d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5582-d805-bc7e-54ca9413b65e	Pogodba-read	Pogodba - branje	f
00030000-5582-d805-b96a-905677114172	Pogodba-write	Pogodba - spreminjanje	f
00030000-5582-d805-3a05-d161ee867c75	Popa-read	Popa - branje	f
00030000-5582-d805-2f35-6ac175546e34	Popa-write	Popa - spreminjanje	f
00030000-5582-d805-8051-e348629d5bd9	Posta-read	Posta - branje	f
00030000-5582-d805-32c1-6e5a7c5209af	Posta-write	Posta - spreminjanje	f
00030000-5582-d805-d084-81831d2c09df	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5582-d805-dbd1-80fc855a8897	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5582-d805-2d15-18d9970d80d0	PostniNaslov-read	PostniNaslov - branje	f
00030000-5582-d805-b106-0c694eae0945	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5582-d805-1fa5-7d602c104f49	Predstava-read	Predstava - branje	f
00030000-5582-d805-3930-1ade84bfda04	Predstava-write	Predstava - spreminjanje	f
00030000-5582-d805-51f5-6cab1d0df686	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5582-d805-ce3c-3dfe405ed301	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5582-d805-b63d-95c937d406a2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5582-d805-42a2-5863848169d1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5582-d805-00c3-b6a5ad7cf180	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5582-d805-3402-1c1e99147820	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5582-d805-8998-f07a600f2cdc	ProgramDela-read	ProgramDela - branje	f
00030000-5582-d805-36da-0edc7bec64ba	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5582-d805-bb2b-27526abd7767	ProgramFestival-read	ProgramFestival - branje	f
00030000-5582-d805-9106-4162933ab0db	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5582-d805-f935-c7ffb2d34bc6	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5582-d805-a021-4d0e586bc087	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5582-d805-9b72-11a042e00b60	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5582-d805-37ef-6f8d32082183	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5582-d805-c8d5-e431de7470f5	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5582-d805-fd42-a800e61ff90d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5582-d805-a28b-e7e46b1bd228	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5582-d805-0757-c2597eb52451	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5582-d805-4032-ab843374c1f1	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5582-d805-006a-a9c51dd5bd1e	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5582-d805-20b3-4b2cd07f460f	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5582-d805-36e6-3f0f4465a796	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5582-d805-81a8-b4f2950e5569	ProgramRazno-read	ProgramRazno - branje	f
00030000-5582-d805-83f1-18060c78dea9	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5582-d805-b0d9-a8628804eec6	Prostor-read	Prostor - branje	f
00030000-5582-d805-1300-869e38bd4aeb	Prostor-write	Prostor - spreminjanje	f
00030000-5582-d805-bfb1-383c2dae37bb	Racun-read	Racun - branje	f
00030000-5582-d805-8cc0-747f8e359d4a	Racun-write	Racun - spreminjanje	f
00030000-5582-d805-9687-dbc80fa76ec1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5582-d805-99e3-74f9f6de049f	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5582-d805-3435-3c9b3566d796	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5582-d805-3449-6a84b551db60	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5582-d805-f682-771dabb99682	Rekvizit-read	Rekvizit - branje	f
00030000-5582-d805-3de8-64ba3824d999	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5582-d805-a93e-077a2e02cf29	Revizija-read	Revizija - branje	f
00030000-5582-d805-8b4d-3c47efc198cf	Revizija-write	Revizija - spreminjanje	f
00030000-5582-d805-f3fa-408b2d50075c	Rezervacija-read	Rezervacija - branje	f
00030000-5582-d805-f948-9121b4dc946b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5582-d805-ba38-280a1a220b0d	SedezniRed-read	SedezniRed - branje	f
00030000-5582-d805-0d7c-84f39b9d46ef	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5582-d805-8b13-3ac520b3dd43	Sedez-read	Sedez - branje	f
00030000-5582-d805-73f4-8b5e0f8b3eeb	Sedez-write	Sedez - spreminjanje	f
00030000-5582-d805-b4d1-d9ead6f06ade	Sezona-read	Sezona - branje	f
00030000-5582-d805-f75b-53559f736e55	Sezona-write	Sezona - spreminjanje	f
00030000-5582-d805-9cee-cc9529ddcedb	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5582-d805-0d07-212e756d1c41	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5582-d805-dcee-373c297d0174	Stevilcenje-read	Stevilcenje - branje	f
00030000-5582-d805-870f-15b6149ca7c6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5582-d805-af26-c9ab017cc2d3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5582-d805-bf1d-b6c7d75a539a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5582-d805-bec3-98518cbe7a42	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5582-d805-2280-ef2323dc03b4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5582-d805-73d8-c50e57e33939	Telefonska-read	Telefonska - branje	f
00030000-5582-d805-c7c0-74c997f8e36e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5582-d805-9035-ee99d2f9704a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5582-d805-04c0-5b39886c0fc4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5582-d805-e174-90fb9140cf44	TipFunkcije-read	TipFunkcije - branje	f
00030000-5582-d805-576f-da05ae2a63c8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5582-d805-7f80-7898fd6c179e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5582-d805-5d33-e3bc7a2ef3f0	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5582-d805-b277-3cfee80248b7	Trr-read	Trr - branje	f
00030000-5582-d805-3003-0bf3fe795696	Trr-write	Trr - spreminjanje	f
00030000-5582-d805-2c61-3fc8f172e94c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5582-d805-6827-1c160fc82faf	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5582-d805-5bf8-f27229204d82	Vaja-read	Vaja - branje	f
00030000-5582-d805-a94d-05fffcd25d18	Vaja-write	Vaja - spreminjanje	f
00030000-5582-d805-07e1-fa9813cf5500	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5582-d805-03fa-188b1708c962	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5582-d805-a917-1b0d5137ff03	Zaposlitev-read	Zaposlitev - branje	f
00030000-5582-d805-98ff-80943dfef00c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5582-d805-1883-1bfc1120226d	Zasedenost-read	Zasedenost - branje	f
00030000-5582-d805-458d-86cad4960cfc	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5582-d805-d454-e143b0651581	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5582-d805-891c-ded4cc932010	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5582-d805-b517-6f9b7df275be	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5582-d805-31ff-baaea0106028	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7782171)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5582-d805-a990-8f2ceec3ccd4	00030000-5582-d805-2c70-aac71fa06d76
00020000-5582-d805-66b7-fce98a7b5a27	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3fec-13fbefc219f9
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-34ff-ab60160c036e
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-1a0f-aa1cd02eabaa
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-c9ab-b03222fb6aa5
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-c9a9-eac5274b2f80
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-00d1-842f4b473d39
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-28ba-6ef47ece978f
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-4c13-ecbb5432a0c1
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3d1d-cd66dcde2d39
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-b1eb-0ef69b65236d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-6726-925c2edc423d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-c804-aace1f4a0c8f
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-2fad-e6787d193bdf
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-ba2e-c0804317c2ba
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-1480-7e7c11c2ff1d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-7dbc-4d8a92ac7c79
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-ccb2-a0244e6e6020
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-4bbb-507dce5e9c18
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-043e-9d576806efb2
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-a285-ea4941fbb5fe
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-73c3-bfecb5fd8abf
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3a05-d161ee867c75
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-2f35-6ac175546e34
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-8051-e348629d5bd9
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-32c1-6e5a7c5209af
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-2d15-18d9970d80d0
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-b106-0c694eae0945
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-1fa5-7d602c104f49
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3930-1ade84bfda04
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-00c3-b6a5ad7cf180
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3402-1c1e99147820
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-b0d9-a8628804eec6
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-1300-869e38bd4aeb
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3435-3c9b3566d796
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3449-6a84b551db60
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-f682-771dabb99682
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-3de8-64ba3824d999
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-b4d1-d9ead6f06ade
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-f75b-53559f736e55
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-e174-90fb9140cf44
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-2c61-3fc8f172e94c
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-6827-1c160fc82faf
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-5bf8-f27229204d82
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-a94d-05fffcd25d18
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-1883-1bfc1120226d
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-458d-86cad4960cfc
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-d454-e143b0651581
00020000-5582-d805-01f1-ce28163f33f6	00030000-5582-d805-b517-6f9b7df275be
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-3fec-13fbefc219f9
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-c9a9-eac5274b2f80
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-00d1-842f4b473d39
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-c804-aace1f4a0c8f
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-ba2e-c0804317c2ba
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-7dbc-4d8a92ac7c79
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-ccb2-a0244e6e6020
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-4bbb-507dce5e9c18
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-043e-9d576806efb2
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-a285-ea4941fbb5fe
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-73c3-bfecb5fd8abf
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-3a05-d161ee867c75
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-8051-e348629d5bd9
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-2d15-18d9970d80d0
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-b106-0c694eae0945
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-1fa5-7d602c104f49
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-b0d9-a8628804eec6
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-3435-3c9b3566d796
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-f682-771dabb99682
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-b4d1-d9ead6f06ade
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-73d8-c50e57e33939
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-c7c0-74c997f8e36e
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-b277-3cfee80248b7
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-3003-0bf3fe795696
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-a917-1b0d5137ff03
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-98ff-80943dfef00c
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-d454-e143b0651581
00020000-5582-d805-af53-2deff33a7e61	00030000-5582-d805-b517-6f9b7df275be
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-3fec-13fbefc219f9
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-1a0f-aa1cd02eabaa
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-c9a9-eac5274b2f80
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-258a-473ee7bc17b2
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-1507-16201caf911e
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-46cb-f6244f484774
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-00d1-842f4b473d39
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-b1eb-0ef69b65236d
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-c804-aace1f4a0c8f
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-ba2e-c0804317c2ba
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-7dbc-4d8a92ac7c79
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-4bbb-507dce5e9c18
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-043e-9d576806efb2
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-a285-ea4941fbb5fe
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-3a05-d161ee867c75
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-8051-e348629d5bd9
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-1fa5-7d602c104f49
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-00c3-b6a5ad7cf180
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-b0d9-a8628804eec6
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-3435-3c9b3566d796
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-f682-771dabb99682
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-b4d1-d9ead6f06ade
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-e174-90fb9140cf44
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-5bf8-f27229204d82
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-1883-1bfc1120226d
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-d454-e143b0651581
00020000-5582-d805-75ae-c63e60a71c5b	00030000-5582-d805-b517-6f9b7df275be
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-3fec-13fbefc219f9
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-34ff-ab60160c036e
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-c9ab-b03222fb6aa5
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-c9a9-eac5274b2f80
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-00d1-842f4b473d39
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-c804-aace1f4a0c8f
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-ba2e-c0804317c2ba
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-4bbb-507dce5e9c18
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-043e-9d576806efb2
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-3a05-d161ee867c75
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-8051-e348629d5bd9
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-1fa5-7d602c104f49
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-b0d9-a8628804eec6
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-3435-3c9b3566d796
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-f682-771dabb99682
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-b4d1-d9ead6f06ade
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-e174-90fb9140cf44
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-d454-e143b0651581
00020000-5582-d805-5971-3018060495d5	00030000-5582-d805-b517-6f9b7df275be
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-3fec-13fbefc219f9
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-c9a9-eac5274b2f80
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-00d1-842f4b473d39
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-7636-aa7c57af085d
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-c804-aace1f4a0c8f
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-ba2e-c0804317c2ba
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-4bbb-507dce5e9c18
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-043e-9d576806efb2
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-3a05-d161ee867c75
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-8051-e348629d5bd9
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-1fa5-7d602c104f49
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-b0d9-a8628804eec6
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-3435-3c9b3566d796
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-f682-771dabb99682
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-b4d1-d9ead6f06ade
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-9035-ee99d2f9704a
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-6173-f2675263d2ea
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-e174-90fb9140cf44
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-d454-e143b0651581
00020000-5582-d805-97a7-1f31cfd57732	00030000-5582-d805-b517-6f9b7df275be
\.


--
-- TOC entry 2858 (class 0 OID 7782466)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7782497)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7782633)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7782231)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5582-d80a-02ae-19361cd8cd73	00040000-5582-d804-d454-021a6b8a2356	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-d80a-7658-1de5b3557f84	00040000-5582-d804-d454-021a6b8a2356	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-d80a-a97c-2997468f29dc	00040000-5582-d804-d454-021a6b8a2356	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-d80a-40d3-61599e9bbb2f	00040000-5582-d804-d454-021a6b8a2356	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-d80a-3772-63c73f02a61b	00040000-5582-d805-9924-3dfeb5fdc988	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7782266)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5582-d806-49f3-fef6741683e1	8341	Adlešiči
00050000-5582-d806-43ba-c2c05d1d2622	5270	Ajdovščina
00050000-5582-d806-d294-249b3e99c500	6280	Ankaran/Ancarano
00050000-5582-d806-7eaf-491cbbfd68c1	9253	Apače
00050000-5582-d806-e188-d907fd81dbbf	8253	Artiče
00050000-5582-d806-7712-ebea9aa72611	4275	Begunje na Gorenjskem
00050000-5582-d806-c7ad-42b9e0109366	1382	Begunje pri Cerknici
00050000-5582-d806-5f27-9d80b3d4671f	9231	Beltinci
00050000-5582-d806-7712-59c02d27a69e	2234	Benedikt
00050000-5582-d806-75e4-e21aa0aeded6	2345	Bistrica ob Dravi
00050000-5582-d806-a6a9-0eaee2fdf158	3256	Bistrica ob Sotli
00050000-5582-d806-4ab7-8e163469724b	8259	Bizeljsko
00050000-5582-d806-e697-4b046fdeef19	1223	Blagovica
00050000-5582-d806-9d0e-9807379d3168	8283	Blanca
00050000-5582-d806-86fb-58bdfa58490d	4260	Bled
00050000-5582-d806-a92d-a6a1d2be9587	4273	Blejska Dobrava
00050000-5582-d806-10bb-55a1095f1b61	9265	Bodonci
00050000-5582-d806-ab08-8bad63f62b24	9222	Bogojina
00050000-5582-d806-e72a-b28a4aeae436	4263	Bohinjska Bela
00050000-5582-d806-2b5f-9d883b2c0468	4264	Bohinjska Bistrica
00050000-5582-d806-8ae1-71c0655fb9a9	4265	Bohinjsko jezero
00050000-5582-d806-b5b5-9671f051684a	1353	Borovnica
00050000-5582-d806-4212-7aaf3df44019	8294	Boštanj
00050000-5582-d806-b98d-5d092e25d689	5230	Bovec
00050000-5582-d806-d7c7-7300074c7d7e	5295	Branik
00050000-5582-d806-2c31-4dd3adb2f5f8	3314	Braslovče
00050000-5582-d806-446b-aa7f600022ea	5223	Breginj
00050000-5582-d806-09ef-252c808c1aac	8280	Brestanica
00050000-5582-d806-8c90-732c91361edc	2354	Bresternica
00050000-5582-d806-553e-e08fb931ebce	4243	Brezje
00050000-5582-d806-18fe-e35ae92c951b	1351	Brezovica pri Ljubljani
00050000-5582-d806-0c7f-07a9ff8a1a66	8250	Brežice
00050000-5582-d806-7618-32e6c574d39f	4210	Brnik - Aerodrom
00050000-5582-d806-d112-d02b0ebca6fc	8321	Brusnice
00050000-5582-d806-ca03-4affb547e672	3255	Buče
00050000-5582-d806-80ea-fe9755296a28	8276	Bučka 
00050000-5582-d806-675e-435250f6007e	9261	Cankova
00050000-5582-d806-d0f2-0bd7c5afe140	3000	Celje 
00050000-5582-d806-617e-0fe3d415f8c0	3001	Celje - poštni predali
00050000-5582-d806-f671-e04c715fbd54	4207	Cerklje na Gorenjskem
00050000-5582-d806-c0f1-9dcd4dfdee09	8263	Cerklje ob Krki
00050000-5582-d806-ea69-44c599cb011b	1380	Cerknica
00050000-5582-d806-eead-52928b7048ff	5282	Cerkno
00050000-5582-d806-c98f-04d79a1187b7	2236	Cerkvenjak
00050000-5582-d806-9567-aaf750551f8b	2215	Ceršak
00050000-5582-d806-9c8f-d66c6f358e83	2326	Cirkovce
00050000-5582-d806-9166-a01221277b6e	2282	Cirkulane
00050000-5582-d806-7720-ebbcaa13d13c	5273	Col
00050000-5582-d806-08b2-ed4409e6f9ac	8251	Čatež ob Savi
00050000-5582-d806-6945-0f7c61644037	1413	Čemšenik
00050000-5582-d806-37bc-e50d9126eb1a	5253	Čepovan
00050000-5582-d806-5af9-b93b78f2283f	9232	Črenšovci
00050000-5582-d806-93d2-fa40ce42fb46	2393	Črna na Koroškem
00050000-5582-d806-f545-231d99eb6f7e	6275	Črni Kal
00050000-5582-d806-4e9f-197efc53b9d5	5274	Črni Vrh nad Idrijo
00050000-5582-d806-08ae-20f7095b2518	5262	Črniče
00050000-5582-d806-ced1-48e8b024232a	8340	Črnomelj
00050000-5582-d806-2a06-a38687f0d7d1	6271	Dekani
00050000-5582-d806-b499-81b1eeb3e835	5210	Deskle
00050000-5582-d806-30c3-7bdbde9799ef	2253	Destrnik
00050000-5582-d806-cffd-0c77917f3593	6215	Divača
00050000-5582-d806-43c3-9f680df40d6f	1233	Dob
00050000-5582-d806-502d-040aabde34e0	3224	Dobje pri Planini
00050000-5582-d806-2c6c-fea22ef18614	8257	Dobova
00050000-5582-d806-d625-6388f93fdeb6	1423	Dobovec
00050000-5582-d806-2ff2-b1c7e917dc7d	5263	Dobravlje
00050000-5582-d806-2254-beecde2155c9	3204	Dobrna
00050000-5582-d806-80ac-b633746c7f21	8211	Dobrnič
00050000-5582-d806-2d13-d7a8bbd194eb	1356	Dobrova
00050000-5582-d806-9bfe-26b5af36a033	9223	Dobrovnik/Dobronak 
00050000-5582-d806-744a-ca896bdc5113	5212	Dobrovo v Brdih
00050000-5582-d806-57bb-5547615ccf4f	1431	Dol pri Hrastniku
00050000-5582-d806-4859-48e23d3fc4c3	1262	Dol pri Ljubljani
00050000-5582-d806-e1c7-f0c9a09e1b5d	1273	Dole pri Litiji
00050000-5582-d806-5c94-6ac844b2dd7e	1331	Dolenja vas
00050000-5582-d806-d561-cd0065e81ede	8350	Dolenjske Toplice
00050000-5582-d806-ff23-52936851a1f1	1230	Domžale
00050000-5582-d806-00e5-8a4d7804a61f	2252	Dornava
00050000-5582-d806-a353-342323143149	5294	Dornberk
00050000-5582-d806-2a3e-db13d637116f	1319	Draga
00050000-5582-d806-e77d-5b656abc56fd	8343	Dragatuš
00050000-5582-d806-d510-572a5709a963	3222	Dramlje
00050000-5582-d806-7807-2758e4e7144a	2370	Dravograd
00050000-5582-d806-f6e5-f9094b0e438f	4203	Duplje
00050000-5582-d806-0d70-19f042a52532	6221	Dutovlje
00050000-5582-d806-3ac0-fb490710b8cf	8361	Dvor
00050000-5582-d806-62df-127e6d84acc3	2343	Fala
00050000-5582-d806-27d7-7d2e03be4c59	9208	Fokovci
00050000-5582-d806-a033-79bf69690fdb	2313	Fram
00050000-5582-d806-9d6c-f33752812e23	3213	Frankolovo
00050000-5582-d806-9141-06d474719468	1274	Gabrovka
00050000-5582-d806-90c1-2bd9261f0b71	8254	Globoko
00050000-5582-d806-c45c-1ac10d9b7df3	5275	Godovič
00050000-5582-d806-1c9c-b92e4ecaa510	4204	Golnik
00050000-5582-d806-1f6c-34add31e924f	3303	Gomilsko
00050000-5582-d806-66ee-0ce2a6fae775	4224	Gorenja vas
00050000-5582-d806-7cf1-ac4a146dcf9b	3263	Gorica pri Slivnici
00050000-5582-d806-7953-e2b3570bc0a7	2272	Gorišnica
00050000-5582-d806-b9e9-383f1f6cba19	9250	Gornja Radgona
00050000-5582-d806-5f29-22f80b0a5086	3342	Gornji Grad
00050000-5582-d806-fbe3-f02222b16219	4282	Gozd Martuljek
00050000-5582-d806-6bc0-e6aa1b8b2ebf	6272	Gračišče
00050000-5582-d806-c499-0405615fe387	9264	Grad
00050000-5582-d806-240d-e0257b0b55a1	8332	Gradac
00050000-5582-d806-b493-c44fde6452f0	1384	Grahovo
00050000-5582-d806-7920-94d6613fb5ab	5242	Grahovo ob Bači
00050000-5582-d806-45b7-0d7197869b6c	5251	Grgar
00050000-5582-d806-37f2-b4d73ea5f4dc	3302	Griže
00050000-5582-d806-a729-69c5e8905db4	3231	Grobelno
00050000-5582-d806-c714-0874e60a9d81	1290	Grosuplje
00050000-5582-d806-d5fe-67329b4ab66c	2288	Hajdina
00050000-5582-d806-2231-cfd2086dd34f	8362	Hinje
00050000-5582-d806-1ec7-b8d8d4ff0ecb	2311	Hoče
00050000-5582-d806-109a-a4f041ab04d9	9205	Hodoš/Hodos
00050000-5582-d806-917a-fd32ce42290d	1354	Horjul
00050000-5582-d806-2e2d-ee687e9c9b0a	1372	Hotedršica
00050000-5582-d806-e1b6-ea762d1f9b45	1430	Hrastnik
00050000-5582-d806-8ebe-6c8f066b66f5	6225	Hruševje
00050000-5582-d806-791c-bb27f9f68730	4276	Hrušica
00050000-5582-d806-1240-79dbcef481fa	5280	Idrija
00050000-5582-d806-7900-ec3be78e2e37	1292	Ig
00050000-5582-d806-0551-aefef82c960d	6250	Ilirska Bistrica
00050000-5582-d806-6dbb-87e023ac31c3	6251	Ilirska Bistrica-Trnovo
00050000-5582-d806-f945-a8ff74a02ba4	1295	Ivančna Gorica
00050000-5582-d806-54fc-5870621016a8	2259	Ivanjkovci
00050000-5582-d806-0637-e17e35afd533	1411	Izlake
00050000-5582-d806-c03d-38ed43b45d1d	6310	Izola/Isola
00050000-5582-d806-a8fe-f3784ea7452f	2222	Jakobski Dol
00050000-5582-d806-3a18-6a274be058ef	2221	Jarenina
00050000-5582-d806-0c59-55ff7cc3f5ba	6254	Jelšane
00050000-5582-d806-b7b6-2d67e184073d	4270	Jesenice
00050000-5582-d806-d3fa-8bbd1b5df614	8261	Jesenice na Dolenjskem
00050000-5582-d806-720f-14e269d16c9b	3273	Jurklošter
00050000-5582-d806-4d0b-3a1a339df74f	2223	Jurovski Dol
00050000-5582-d806-8048-538e8dd04c0d	2256	Juršinci
00050000-5582-d806-726e-a8f5ac63f342	5214	Kal nad Kanalom
00050000-5582-d806-23ab-511be417cc0c	3233	Kalobje
00050000-5582-d806-6dfc-9a4070cf2b89	4246	Kamna Gorica
00050000-5582-d806-8712-ead9a96b170c	2351	Kamnica
00050000-5582-d806-3707-a3592c2eb383	1241	Kamnik
00050000-5582-d806-1635-b92259b8aa38	5213	Kanal
00050000-5582-d806-476a-a9f71c687896	8258	Kapele
00050000-5582-d806-a4a9-b3c367335e65	2362	Kapla
00050000-5582-d806-81cd-ea1f7e6cfd27	2325	Kidričevo
00050000-5582-d806-cb38-db51e736b25b	1412	Kisovec
00050000-5582-d806-bb7c-bb3f686c0952	6253	Knežak
00050000-5582-d806-f76c-a7318d3a7f90	5222	Kobarid
00050000-5582-d806-9dcc-8ca2535e9780	9227	Kobilje
00050000-5582-d806-a0f3-11609c838126	1330	Kočevje
00050000-5582-d806-b839-88fd57254553	1338	Kočevska Reka
00050000-5582-d806-2a41-714c66cc56d9	2276	Kog
00050000-5582-d806-5917-034fedb00471	5211	Kojsko
00050000-5582-d806-4bc5-3f819fe05ff1	6223	Komen
00050000-5582-d806-45b8-599d17f109ba	1218	Komenda
00050000-5582-d806-2b07-8183d5ee6cee	6000	Koper/Capodistria 
00050000-5582-d806-3a2b-0bcb411cd0bc	6001	Koper/Capodistria - poštni predali
00050000-5582-d806-0f9e-b105606224b0	8282	Koprivnica
00050000-5582-d806-26b8-f8b5858ed293	5296	Kostanjevica na Krasu
00050000-5582-d806-0aff-ad4def76c938	8311	Kostanjevica na Krki
00050000-5582-d806-835b-d5377f9ee50b	1336	Kostel
00050000-5582-d806-9331-503e7a2f4a04	6256	Košana
00050000-5582-d806-ead9-1a3cf3bf70ce	2394	Kotlje
00050000-5582-d806-d6b3-98432488facb	6240	Kozina
00050000-5582-d806-a3f9-c5d48d1765f9	3260	Kozje
00050000-5582-d806-5d72-6c44911f3fbd	4000	Kranj 
00050000-5582-d806-f03e-59594cf08bf1	4001	Kranj - poštni predali
00050000-5582-d806-cd07-290a40c913aa	4280	Kranjska Gora
00050000-5582-d806-2dc2-cfc75c51f860	1281	Kresnice
00050000-5582-d806-0804-327a75baf700	4294	Križe
00050000-5582-d806-337b-da1e553c7291	9206	Križevci
00050000-5582-d806-a139-99f45965dcbd	9242	Križevci pri Ljutomeru
00050000-5582-d806-b7b9-af2335b72dee	1301	Krka
00050000-5582-d806-3eb6-3d85d2e0afe9	8296	Krmelj
00050000-5582-d806-160e-51962600f802	4245	Kropa
00050000-5582-d806-1717-c425fc9bfce1	8262	Krška vas
00050000-5582-d806-85c4-fd38314af65f	8270	Krško
00050000-5582-d806-9eff-cc248242c148	9263	Kuzma
00050000-5582-d806-e0c1-c23ef8eb1a55	2318	Laporje
00050000-5582-d806-b46e-4779fb07f2ce	3270	Laško
00050000-5582-d806-0180-b8e621212e0b	1219	Laze v Tuhinju
00050000-5582-d806-e160-93ce3bbbf5ae	2230	Lenart v Slovenskih goricah
00050000-5582-d806-c06f-e79c001f1613	9220	Lendava/Lendva
00050000-5582-d806-f1b2-77768f07e07f	4248	Lesce
00050000-5582-d806-05e6-c716acbe15a6	3261	Lesično
00050000-5582-d806-b009-fbb19dbc1a9f	8273	Leskovec pri Krškem
00050000-5582-d806-229a-e4226bfbad1a	2372	Libeliče
00050000-5582-d806-9e5a-5d86b1a463d1	2341	Limbuš
00050000-5582-d806-3e1d-becf1687db04	1270	Litija
00050000-5582-d806-2469-b2bce2ce60ca	3202	Ljubečna
00050000-5582-d806-32b9-a1465c849b10	1000	Ljubljana 
00050000-5582-d806-adaa-288680c5df2a	1001	Ljubljana - poštni predali
00050000-5582-d806-4517-e59deda6b1e8	1231	Ljubljana - Črnuče
00050000-5582-d806-a9f4-f8d8702d72af	1261	Ljubljana - Dobrunje
00050000-5582-d806-ad3f-10b5aa042439	1260	Ljubljana - Polje
00050000-5582-d806-4f5b-a6d7614bd3b2	1210	Ljubljana - Šentvid
00050000-5582-d806-57e9-ba1ea2641cf9	1211	Ljubljana - Šmartno
00050000-5582-d806-d69d-8edd1caf300a	3333	Ljubno ob Savinji
00050000-5582-d806-2108-03772dc39dff	9240	Ljutomer
00050000-5582-d806-cb97-1214a321ded3	3215	Loče
00050000-5582-d806-a037-c80d34c67f24	5231	Log pod Mangartom
00050000-5582-d806-0ab3-5c8bd8df2869	1358	Log pri Brezovici
00050000-5582-d806-8290-4390aa32ebd6	1370	Logatec
00050000-5582-d806-c106-1f53d9323ee1	1371	Logatec
00050000-5582-d806-7b63-b8933c609220	1434	Loka pri Zidanem Mostu
00050000-5582-d806-abf1-0555685338a6	3223	Loka pri Žusmu
00050000-5582-d806-4cf8-0df33efc36c3	6219	Lokev
00050000-5582-d806-241b-f9dd29bc503b	1318	Loški Potok
00050000-5582-d806-54fc-a1991dcb334a	2324	Lovrenc na Dravskem polju
00050000-5582-d806-103b-672c36dc2f6c	2344	Lovrenc na Pohorju
00050000-5582-d806-a535-6b6907349272	3334	Luče
00050000-5582-d806-75ab-91adab34f72c	1225	Lukovica
00050000-5582-d806-d355-234fe0c37e1c	9202	Mačkovci
00050000-5582-d806-e84b-93ee7d2f88d2	2322	Majšperk
00050000-5582-d806-f778-39c0eb00c2b9	2321	Makole
00050000-5582-d806-ac85-a618ef1bc462	9243	Mala Nedelja
00050000-5582-d806-6cf0-82cfaea18a53	2229	Malečnik
00050000-5582-d806-32fc-c45d1a5bb435	6273	Marezige
00050000-5582-d806-cb3f-0536766d17a5	2000	Maribor 
00050000-5582-d806-c9e1-b58cb73d0a90	2001	Maribor - poštni predali
00050000-5582-d806-a62e-4ce99d5fe20f	2206	Marjeta na Dravskem polju
00050000-5582-d806-2351-23ee8fb05b3e	2281	Markovci
00050000-5582-d806-791a-e9596506eaa2	9221	Martjanci
00050000-5582-d806-09dc-8f6447eede95	6242	Materija
00050000-5582-d806-871c-9e417cf6e8af	4211	Mavčiče
00050000-5582-d806-9232-1e5d79cd6f3e	1215	Medvode
00050000-5582-d806-16b2-10c765e2215d	1234	Mengeš
00050000-5582-d806-72c4-0f9ce4300c76	8330	Metlika
00050000-5582-d806-09f3-28166429bd86	2392	Mežica
00050000-5582-d806-d3c9-98f22b395c1d	2204	Miklavž na Dravskem polju
00050000-5582-d806-4862-49cea92ea5a0	2275	Miklavž pri Ormožu
00050000-5582-d806-a135-6bd2edb93402	5291	Miren
00050000-5582-d806-7aa2-d19cee769b12	8233	Mirna
00050000-5582-d806-a9d1-318534fef34e	8216	Mirna Peč
00050000-5582-d806-d345-d6b30abf467d	2382	Mislinja
00050000-5582-d806-ca14-d6d06c4f6b0f	4281	Mojstrana
00050000-5582-d806-f31a-314b3f5a30c3	8230	Mokronog
00050000-5582-d806-6b1f-200f4e503ac0	1251	Moravče
00050000-5582-d806-832c-f95498a16569	9226	Moravske Toplice
00050000-5582-d806-7f9f-88d9a721de78	5216	Most na Soči
00050000-5582-d806-9318-385b03154d55	1221	Motnik
00050000-5582-d806-c981-4188434bcdac	3330	Mozirje
00050000-5582-d806-7e89-090b98bc2c17	9000	Murska Sobota 
00050000-5582-d806-b085-0276c498ce3e	9001	Murska Sobota - poštni predali
00050000-5582-d806-4d19-45394a189740	2366	Muta
00050000-5582-d806-092a-42b9428091d9	4202	Naklo
00050000-5582-d806-62f7-68acc09b1477	3331	Nazarje
00050000-5582-d806-5156-7a3ad20295c3	1357	Notranje Gorice
00050000-5582-d806-df9b-ced683626acd	3203	Nova Cerkev
00050000-5582-d806-0234-a77a3070824d	5000	Nova Gorica 
00050000-5582-d806-0d90-a280527d7f24	5001	Nova Gorica - poštni predali
00050000-5582-d806-ea10-e981829950a0	1385	Nova vas
00050000-5582-d806-db1a-8c6b1057748b	8000	Novo mesto
00050000-5582-d806-55fa-f54cbdfe84ed	8001	Novo mesto - poštni predali
00050000-5582-d806-770c-fcf87b59c355	6243	Obrov
00050000-5582-d806-424b-35f8b9611ef7	9233	Odranci
00050000-5582-d806-894c-aecf4a2f3c34	2317	Oplotnica
00050000-5582-d806-e6b2-00c49ad508f3	2312	Orehova vas
00050000-5582-d806-4449-dd058c7475d9	2270	Ormož
00050000-5582-d806-7955-6cc3cf9fa236	1316	Ortnek
00050000-5582-d806-091c-1643f764db87	1337	Osilnica
00050000-5582-d806-50a9-98e35086484d	8222	Otočec
00050000-5582-d806-0a01-a16dc3839236	2361	Ožbalt
00050000-5582-d806-ad07-eeb17312af99	2231	Pernica
00050000-5582-d806-0565-fcb4cf122412	2211	Pesnica pri Mariboru
00050000-5582-d806-fe6e-abef1d426e90	9203	Petrovci
00050000-5582-d806-0fda-9c9d0fae15c7	3301	Petrovče
00050000-5582-d806-e376-6facc9e250d1	6330	Piran/Pirano
00050000-5582-d806-643e-82b07ae3b666	8255	Pišece
00050000-5582-d806-0c19-186304c686dd	6257	Pivka
00050000-5582-d806-42d3-3fad5622e22f	6232	Planina
00050000-5582-d806-e454-45a042e92694	3225	Planina pri Sevnici
00050000-5582-d806-3738-5e24374ff1cc	6276	Pobegi
00050000-5582-d806-4437-b5d263e50d5b	8312	Podbočje
00050000-5582-d806-1398-97032e31815d	5243	Podbrdo
00050000-5582-d806-2ed7-abecfea7d65b	3254	Podčetrtek
00050000-5582-d806-1e1e-a01e958673d1	2273	Podgorci
00050000-5582-d806-0a79-a627721ddf97	6216	Podgorje
00050000-5582-d806-e79c-6a08f37f2d8d	2381	Podgorje pri Slovenj Gradcu
00050000-5582-d806-b768-cf3cdaa5e619	6244	Podgrad
00050000-5582-d806-000e-026f8ac16fec	1414	Podkum
00050000-5582-d806-c5ab-438cab53d5fb	2286	Podlehnik
00050000-5582-d806-fd5d-c00da2ddc2fe	5272	Podnanos
00050000-5582-d806-c18e-39c98013000b	4244	Podnart
00050000-5582-d806-bc6c-b8b9f055f0a5	3241	Podplat
00050000-5582-d806-acaa-c95e4906f939	3257	Podsreda
00050000-5582-d806-0721-6095babf1dc9	2363	Podvelka
00050000-5582-d806-c994-a709433109d8	2208	Pohorje
00050000-5582-d806-849a-b28e332b1e6e	2257	Polenšak
00050000-5582-d806-6431-fa399537b977	1355	Polhov Gradec
00050000-5582-d806-c2ba-0a47e7742b58	4223	Poljane nad Škofjo Loko
00050000-5582-d806-0b58-aa321c778c3a	2319	Poljčane
00050000-5582-d806-dce9-cd63f06fd29e	1272	Polšnik
00050000-5582-d806-07e9-72441f32c035	3313	Polzela
00050000-5582-d806-4226-08d0b4741b0f	3232	Ponikva
00050000-5582-d806-76f5-dc2a10561072	6320	Portorož/Portorose
00050000-5582-d806-e93c-fd8314f6c34a	6230	Postojna
00050000-5582-d806-49a1-96feba955eef	2331	Pragersko
00050000-5582-d806-05eb-286722e3785c	3312	Prebold
00050000-5582-d806-991e-234ce754b532	4205	Preddvor
00050000-5582-d806-b66c-5a6748f42bac	6255	Prem
00050000-5582-d806-fcff-08b21e359974	1352	Preserje
00050000-5582-d806-6664-f9a06ff1f481	6258	Prestranek
00050000-5582-d806-cc7f-d0ae88aea7c3	2391	Prevalje
00050000-5582-d806-c808-86c34334dbbd	3262	Prevorje
00050000-5582-d806-65c4-81f654249ca6	1276	Primskovo 
00050000-5582-d806-155d-6ac7fbf94896	3253	Pristava pri Mestinju
00050000-5582-d806-9282-a475707f3aac	9207	Prosenjakovci/Partosfalva
00050000-5582-d806-5618-6226fb20de5c	5297	Prvačina
00050000-5582-d806-04c0-65cb4828bd57	2250	Ptuj
00050000-5582-d806-97a7-4b2b6bad7e80	2323	Ptujska Gora
00050000-5582-d806-29f1-045044a6627d	9201	Puconci
00050000-5582-d806-054a-698bccba38b4	2327	Rače
00050000-5582-d806-6f6f-6d35b5bab618	1433	Radeče
00050000-5582-d806-599f-e74454c7f97b	9252	Radenci
00050000-5582-d806-2177-575112ed4fe6	2360	Radlje ob Dravi
00050000-5582-d806-4756-cdae2fc56cbc	1235	Radomlje
00050000-5582-d806-17b2-282551efa0f2	4240	Radovljica
00050000-5582-d806-7a60-72f9928b7f2a	8274	Raka
00050000-5582-d806-7fc2-70baea1096a7	1381	Rakek
00050000-5582-d806-f699-b05af3ae70ef	4283	Rateče - Planica
00050000-5582-d806-8412-18f69621046a	2390	Ravne na Koroškem
00050000-5582-d806-ec12-2bd9897d37cc	9246	Razkrižje
00050000-5582-d806-d56a-0c9cc413a274	3332	Rečica ob Savinji
00050000-5582-d806-a0cc-b608e6d7cad3	5292	Renče
00050000-5582-d806-c295-788e08633120	1310	Ribnica
00050000-5582-d806-7451-64907820d08d	2364	Ribnica na Pohorju
00050000-5582-d806-69d2-58900145e81c	3272	Rimske Toplice
00050000-5582-d806-ece5-75f5415596f6	1314	Rob
00050000-5582-d806-b6a8-889d70f19b3c	5215	Ročinj
00050000-5582-d806-8c91-81f2893b5340	3250	Rogaška Slatina
00050000-5582-d806-80c1-c680a11197be	9262	Rogašovci
00050000-5582-d806-dca0-8b1d361c186e	3252	Rogatec
00050000-5582-d806-5164-e157c7d2d1d8	1373	Rovte
00050000-5582-d806-47f3-103114f2a65e	2342	Ruše
00050000-5582-d806-cb28-7280a79c4997	1282	Sava
00050000-5582-d806-8a22-b883a7273cd3	6333	Sečovlje/Sicciole
00050000-5582-d806-f28b-15b464842864	4227	Selca
00050000-5582-d806-969f-ff3b973988ef	2352	Selnica ob Dravi
00050000-5582-d806-a5ae-c98bc94664f9	8333	Semič
00050000-5582-d806-b44f-ba0c71cc04b4	8281	Senovo
00050000-5582-d806-6dc2-7080d4e79c6e	6224	Senožeče
00050000-5582-d806-c076-4df386851659	8290	Sevnica
00050000-5582-d806-ff2a-83e311997b0c	6210	Sežana
00050000-5582-d806-d5a1-abbc8a939a44	2214	Sladki Vrh
00050000-5582-d806-aa32-37e271994c6b	5283	Slap ob Idrijci
00050000-5582-d806-7784-10d18184c837	2380	Slovenj Gradec
00050000-5582-d806-5ddb-cc42fe7b57ce	2310	Slovenska Bistrica
00050000-5582-d806-8d13-9fbb0969e86c	3210	Slovenske Konjice
00050000-5582-d806-ec00-d3d64a09c426	1216	Smlednik
00050000-5582-d806-bb95-061b973c558e	5232	Soča
00050000-5582-d806-97c7-d6c0aead28cd	1317	Sodražica
00050000-5582-d806-4222-5c8ffe1a09b1	3335	Solčava
00050000-5582-d806-cbbd-975b9b7025ed	5250	Solkan
00050000-5582-d806-5d86-90e85af503a2	4229	Sorica
00050000-5582-d806-a20d-135c93d82f8a	4225	Sovodenj
00050000-5582-d806-25aa-ad3c4703c747	5281	Spodnja Idrija
00050000-5582-d806-8f6f-ca56856249ca	2241	Spodnji Duplek
00050000-5582-d806-e078-581675fbdcd2	9245	Spodnji Ivanjci
00050000-5582-d806-ef87-e833b64da7e3	2277	Središče ob Dravi
00050000-5582-d806-cc57-c51f2a6acfa9	4267	Srednja vas v Bohinju
00050000-5582-d806-a623-986b809e5487	8256	Sromlje 
00050000-5582-d806-4d09-20fa90c9500b	5224	Srpenica
00050000-5582-d806-c29c-58425c13835c	1242	Stahovica
00050000-5582-d806-2528-8606938cd627	1332	Stara Cerkev
00050000-5582-d806-38ac-17b26a24d48f	8342	Stari trg ob Kolpi
00050000-5582-d806-df6a-933e39c6f5a4	1386	Stari trg pri Ložu
00050000-5582-d806-85fb-0f846662a37e	2205	Starše
00050000-5582-d806-d0c9-c85ee2a058c5	2289	Stoperce
00050000-5582-d806-8b75-13d694406163	8322	Stopiče
00050000-5582-d806-17d6-4147d647168d	3206	Stranice
00050000-5582-d806-6ec5-c6dc5d07a5a4	8351	Straža
00050000-5582-d806-21ae-dce03db24196	1313	Struge
00050000-5582-d806-2c91-2f5808da7cde	8293	Studenec
00050000-5582-d806-66e0-03128a93fd26	8331	Suhor
00050000-5582-d806-9921-4fb67244b196	2233	Sv. Ana v Slovenskih goricah
00050000-5582-d806-5ae4-ee045510e69a	2235	Sv. Trojica v Slovenskih goricah
00050000-5582-d806-8e39-26ed1b83e1f1	2353	Sveti Duh na Ostrem Vrhu
00050000-5582-d806-4ee2-40df63e7bc99	9244	Sveti Jurij ob Ščavnici
00050000-5582-d806-6fc3-d32f287f2c8a	3264	Sveti Štefan
00050000-5582-d806-ef9f-a1b5c3cdd4b5	2258	Sveti Tomaž
00050000-5582-d806-5cb4-d5167574bd9a	9204	Šalovci
00050000-5582-d806-a8d2-b0dc05b8d7fb	5261	Šempas
00050000-5582-d806-af0a-60dac1d139ac	5290	Šempeter pri Gorici
00050000-5582-d806-d7b1-47c6e88e0d9b	3311	Šempeter v Savinjski dolini
00050000-5582-d806-fde5-f670252c88fb	4208	Šenčur
00050000-5582-d806-7175-d5670290f8b9	2212	Šentilj v Slovenskih goricah
00050000-5582-d806-10e2-b3e2933cc308	8297	Šentjanž
00050000-5582-d806-9598-b4b0ee8cf712	2373	Šentjanž pri Dravogradu
00050000-5582-d806-a762-86cab871cd67	8310	Šentjernej
00050000-5582-d806-43f3-f0a9a92f8907	3230	Šentjur
00050000-5582-d806-b224-0e4c724f56b1	3271	Šentrupert
00050000-5582-d806-1be0-a7fedbc8e1ae	8232	Šentrupert
00050000-5582-d806-2c3a-9cc213ef5c12	1296	Šentvid pri Stični
00050000-5582-d806-d9cb-7666d69b1f85	8275	Škocjan
00050000-5582-d806-8966-45d93c4cdc67	6281	Škofije
00050000-5582-d806-e803-0d2b100436f4	4220	Škofja Loka
00050000-5582-d806-090f-ac812fb17770	3211	Škofja vas
00050000-5582-d806-bc4d-9372f446dd14	1291	Škofljica
00050000-5582-d806-7d36-ea0eb576e1a9	6274	Šmarje
00050000-5582-d806-522c-0137de44f11c	1293	Šmarje - Sap
00050000-5582-d806-7363-50035e696017	3240	Šmarje pri Jelšah
00050000-5582-d806-938c-2fb74f6cc12e	8220	Šmarješke Toplice
00050000-5582-d806-2f9e-a7e35459f2e4	2315	Šmartno na Pohorju
00050000-5582-d806-a30b-c72813c3ca5e	3341	Šmartno ob Dreti
00050000-5582-d806-e52e-61d8c435cc11	3327	Šmartno ob Paki
00050000-5582-d806-b32a-4d7c2ff65f25	1275	Šmartno pri Litiji
00050000-5582-d806-0d99-5ba9127a4a1b	2383	Šmartno pri Slovenj Gradcu
00050000-5582-d806-3aff-a58b116f0d18	3201	Šmartno v Rožni dolini
00050000-5582-d806-da6c-c960717a4ddc	3325	Šoštanj
00050000-5582-d806-83d6-7db32911fe5a	6222	Štanjel
00050000-5582-d806-4680-f4e4db38ad52	3220	Štore
00050000-5582-d806-80a6-214025343015	3304	Tabor
00050000-5582-d806-f1e9-94441aa56063	3221	Teharje
00050000-5582-d806-b522-f049a4a11264	9251	Tišina
00050000-5582-d806-73b9-6beeac6656e9	5220	Tolmin
00050000-5582-d806-3073-42a9a8ca440d	3326	Topolšica
00050000-5582-d806-f1fb-2ad6d95ca067	2371	Trbonje
00050000-5582-d806-8561-82107f398737	1420	Trbovlje
00050000-5582-d806-a403-3da9dcb3a9fd	8231	Trebelno 
00050000-5582-d806-6077-d8c061da4f56	8210	Trebnje
00050000-5582-d806-7149-17d57595cb9b	5252	Trnovo pri Gorici
00050000-5582-d806-89fb-e32564acf37c	2254	Trnovska vas
00050000-5582-d806-95db-875165b3be0c	1222	Trojane
00050000-5582-d806-cbaa-7699c81de85b	1236	Trzin
00050000-5582-d806-56ac-9e4f27ccfdf3	4290	Tržič
00050000-5582-d806-4d55-4eb9b7fd4dcb	8295	Tržišče
00050000-5582-d806-0c24-a97d8d695dea	1311	Turjak
00050000-5582-d806-35b1-27cd483dd76e	9224	Turnišče
00050000-5582-d806-0c4b-3635921e364f	8323	Uršna sela
00050000-5582-d806-41f9-12992641f421	1252	Vače
00050000-5582-d806-9bec-b9061a6bc934	3320	Velenje 
00050000-5582-d806-d54c-0bc6a0e39a35	3322	Velenje - poštni predali
00050000-5582-d806-b073-cd8a7ac0acf4	8212	Velika Loka
00050000-5582-d806-303a-c0a48b3ed745	2274	Velika Nedelja
00050000-5582-d806-7fe3-29c6b3b15454	9225	Velika Polana
00050000-5582-d806-00bf-c0b8934dd4aa	1315	Velike Lašče
00050000-5582-d806-6c9e-2bcda3284b40	8213	Veliki Gaber
00050000-5582-d806-a0aa-2f52c2125dd0	9241	Veržej
00050000-5582-d806-0478-12cd2200774a	1312	Videm - Dobrepolje
00050000-5582-d806-175f-34270f61011a	2284	Videm pri Ptuju
00050000-5582-d806-5e7c-930cf8e4ebc5	8344	Vinica
00050000-5582-d806-b7ec-240fa98b25f8	5271	Vipava
00050000-5582-d806-0d76-73aa942e5411	4212	Visoko
00050000-5582-d806-f787-68a84677b64b	1294	Višnja Gora
00050000-5582-d806-3627-c8541b6b71f1	3205	Vitanje
00050000-5582-d806-f3a0-20ad01043052	2255	Vitomarci
00050000-5582-d806-5bc8-29cfb5cee6e0	1217	Vodice
00050000-5582-d806-f4eb-a0232d52816f	3212	Vojnik\t
00050000-5582-d806-0705-81cc98d1a2fc	5293	Volčja Draga
00050000-5582-d806-2615-32949d18b2c0	2232	Voličina
00050000-5582-d806-7b21-394fc8912f20	3305	Vransko
00050000-5582-d806-5322-9d39620df3e7	6217	Vremski Britof
00050000-5582-d806-6843-49561bb81407	1360	Vrhnika
00050000-5582-d806-b0e6-e1c61a10759d	2365	Vuhred
00050000-5582-d806-ad8d-c5b93c6786d0	2367	Vuzenica
00050000-5582-d806-b571-2b1bff29b683	8292	Zabukovje 
00050000-5582-d806-3a71-b76231719bac	1410	Zagorje ob Savi
00050000-5582-d806-0797-fca5a7daf6f6	1303	Zagradec
00050000-5582-d806-e210-8d78d603375c	2283	Zavrč
00050000-5582-d806-cc3f-ec9e6656caa3	8272	Zdole 
00050000-5582-d806-ac77-e162aa27edde	4201	Zgornja Besnica
00050000-5582-d806-2773-da8e872c8084	2242	Zgornja Korena
00050000-5582-d806-0220-124682c4bb80	2201	Zgornja Kungota
00050000-5582-d806-b78a-5202aa3907dc	2316	Zgornja Ložnica
00050000-5582-d806-d2f4-a7d1f38f290d	2314	Zgornja Polskava
00050000-5582-d806-3833-56e932dfe551	2213	Zgornja Velka
00050000-5582-d806-dfdd-d7b4630e6b14	4247	Zgornje Gorje
00050000-5582-d806-4b9e-75ec86ce8936	4206	Zgornje Jezersko
00050000-5582-d806-27c6-232be318f3da	2285	Zgornji Leskovec
00050000-5582-d806-8b95-b46b4a4ef21e	1432	Zidani Most
00050000-5582-d806-e755-5d04d3f27eb2	3214	Zreče
00050000-5582-d806-8761-ca474fc4c149	4209	Žabnica
00050000-5582-d806-7596-934fdb01de66	3310	Žalec
00050000-5582-d806-08fd-8dbc4568e902	4228	Železniki
00050000-5582-d806-785f-bc80f06c97bd	2287	Žetale
00050000-5582-d806-5124-75337d49444a	4226	Žiri
00050000-5582-d806-9efd-d16b8da88a9d	4274	Žirovnica
00050000-5582-d806-e661-e785b65e79b6	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7782440)
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
-- TOC entry 2836 (class 0 OID 7782251)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7782329)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7782452)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7782572)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7782625)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5582-d80a-0338-d881ad82ea15	00080000-5582-d80a-3772-63c73f02a61b	0900	AK
00190000-5582-d80a-4ee4-1f4094f00416	00080000-5582-d80a-a97c-2997468f29dc	0987	A
00190000-5582-d80a-2886-5717cb8f241f	00080000-5582-d80a-7658-1de5b3557f84	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7782744)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7782807)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7782757)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7782776)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7782481)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5582-d809-d150-cae1a76df2de	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5582-d809-8453-fdaf32eb8075	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5582-d809-7aa1-1297434abfad	0003	Kazinska	t	84	Kazinska dvorana
00220000-5582-d809-c6c7-4b0078590c32	0004	Mali oder	t	24	Mali oder 
00220000-5582-d809-661a-8d4c4ffa6691	0005	Komorni oder	t	15	Komorni oder
00220000-5582-d809-29f9-8cd0b9464df5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5582-d809-2bb8-10b48f510cb6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7782425)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7782415)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7782614)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7782549)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7782123)
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
-- TOC entry 2861 (class 0 OID 7782491)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7782161)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5582-d805-a990-8f2ceec3ccd4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5582-d805-66b7-fce98a7b5a27	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5582-d805-cc80-6d03575f3ea0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5582-d805-9416-d37bab1b44af	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5582-d805-01f1-ce28163f33f6	planer	Planer dogodkov v koledarju	t
00020000-5582-d805-af53-2deff33a7e61	kadrovska	Kadrovska služba	t
00020000-5582-d805-75ae-c63e60a71c5b	arhivar	Ažuriranje arhivalij	t
00020000-5582-d805-5971-3018060495d5	igralec	Igralec	t
00020000-5582-d805-97a7-1f31cfd57732	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7782145)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5582-d806-51ff-4f6255e8cb13	00020000-5582-d805-cc80-6d03575f3ea0
00010000-5582-d806-0501-f50745f6f897	00020000-5582-d805-cc80-6d03575f3ea0
\.


--
-- TOC entry 2863 (class 0 OID 7782505)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7782446)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7782396)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7782840)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5582-d807-0b0b-f466bc11725d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5582-d807-88e2-d4b56e8ca1c0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5582-d807-2fe5-89f981da3f5d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5582-d807-a163-11083311c0f6	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5582-d807-a401-d56adb1bffc1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7782832)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5582-d807-fcaa-541186c7d0aa	00230000-5582-d807-a163-11083311c0f6	popa
00240000-5582-d807-abaf-be2315e366dd	00230000-5582-d807-a163-11083311c0f6	oseba
00240000-5582-d807-9bc4-57a35bff4248	00230000-5582-d807-88e2-d4b56e8ca1c0	prostor
00240000-5582-d807-b090-2843e1e1ac55	00230000-5582-d807-a163-11083311c0f6	besedilo
00240000-5582-d807-6beb-a85b0fa64a32	00230000-5582-d807-a163-11083311c0f6	uprizoritev
00240000-5582-d807-a221-e807660a3c84	00230000-5582-d807-a163-11083311c0f6	funkcija
00240000-5582-d807-fb1b-577058a19002	00230000-5582-d807-a163-11083311c0f6	tipfunkcije
00240000-5582-d807-6e1d-0e38db6c6ff3	00230000-5582-d807-a163-11083311c0f6	alternacija
00240000-5582-d807-78a7-8d25f6c3d36f	00230000-5582-d807-0b0b-f466bc11725d	pogodba
00240000-5582-d807-7e6e-e2c023e653a2	00230000-5582-d807-a163-11083311c0f6	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7782827)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7782559)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
00270000-5582-d80e-0390-ba971ba7499c	000e0000-5582-d80a-a2ec-222912440935	00080000-5582-d80a-02ae-19361cd8cd73	Nabava kostumov	600.50	20.00	Krila in maske	1
00270000-5582-d815-5efa-d6bebb93c19d	000e0000-5582-d80a-a2ec-222912440935	00080000-5582-d80a-02ae-19361cd8cd73	Zavese	125.70	3.10	Modra in zelena zavesa	2
\.


--
-- TOC entry 2834 (class 0 OID 7782223)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7782402)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5582-d818-b53d-39126990314e	00180000-5582-d80a-84ad-f76f7e46763c	000c0000-5582-d818-27f0-b08cb3d980e0	00090000-5582-d80a-7f42-ac23ceb97791	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-d818-869d-831138502b96	00180000-5582-d80a-84ad-f76f7e46763c	000c0000-5582-d818-6125-3e94982af458	00090000-5582-d80a-6076-7e936a775ec0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-d818-2ad8-c19b52b56f7a	00180000-5582-d80a-84ad-f76f7e46763c	000c0000-5582-d818-6810-c5dce2a2ed89	00090000-5582-d80a-58c3-7ab942521819	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-d818-2f2c-d91b3ff3ad6f	00180000-5582-d80a-84ad-f76f7e46763c	000c0000-5582-d818-6d3b-60ec676fc0e9	00090000-5582-d80a-1d36-bb6a985d2b78	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-d818-a6e2-97c012c5f84e	00180000-5582-d80a-84ad-f76f7e46763c	000c0000-5582-d818-bfcd-a33acdc4e366	00090000-5582-d80a-d68f-0064641b44f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-d818-831c-955afcf4d430	00180000-5582-d80a-31d3-160f15230153	\N	00090000-5582-d80a-d68f-0064641b44f4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7782603)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5582-d807-c4f8-8414216975d9	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5582-d807-3864-f00d93d4edc6	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5582-d807-c8f6-3b6ffcb25934	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5582-d807-7e01-d7bb505f03f2	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5582-d807-0952-45daf13420b2	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5582-d807-dbfb-dab45da3f729	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5582-d807-e926-08d762cc853e	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5582-d807-8787-2b472cfb4c18	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5582-d807-2907-a2632dafedef	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5582-d807-1048-8d22fe242864	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5582-d807-e391-0b71806e815e	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5582-d807-5634-64bd3bab6095	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5582-d807-5ea9-4be0f9d0cf62	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5582-d807-917f-a497c1437233	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5582-d807-d4dc-f732c5e407d6	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5582-d807-f40d-1627e02b44aa	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7782796)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5582-d807-98f4-cd8b905bca15	01	Velika predstava	f	1.00	1.00
002b0000-5582-d807-c1bb-6496dcd906bf	02	Mala predstava	f	0.50	0.50
002b0000-5582-d807-42ee-c7fd7e17dcff	03	Mala koprodukcija	t	0.40	1.00
002b0000-5582-d807-54f7-ee8f01ac10ff	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5582-d807-70aa-b2f0257a6078	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7782286)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7782132)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5582-d806-0501-f50745f6f897	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROADdL.WmIxLK/z.p12zFle5o8BkDyS4a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5582-d809-d81d-d71b46773212	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5582-d809-2dca-bb117e4109c0	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5582-d809-c8c7-fbdbc9ed16cf	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5582-d809-ee6d-f1b81bf28ff7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5582-d809-3ae9-f6b128f842e3	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5582-d809-882f-748c96280e39	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5582-d809-b853-5f77980e3dfe	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5582-d809-b8b7-baf1cfdd0eac	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5582-d809-1f44-1f3b99b349bd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5582-d806-51ff-4f6255e8cb13	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7782660)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5582-d80a-a2ec-222912440935	00160000-5582-d809-8dbd-226f808c645a	00150000-5582-d807-d9b5-6dda0ef45c2e	00140000-5582-d804-5b59-52ac0e8cac03	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5582-d809-661a-8d4c4ffa6691
000e0000-5582-d80a-aac4-47609357be6e	00160000-5582-d809-f6aa-2773e8c8a63a	00150000-5582-d807-04fd-fad1615d1bce	00140000-5582-d804-4446-3a4002f7fd66	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5582-d809-29f9-8cd0b9464df5
000e0000-5582-d80a-ffb7-578f4980b99f	\N	00150000-5582-d807-04fd-fad1615d1bce	00140000-5582-d804-4446-3a4002f7fd66	00190000-5582-d80a-4ee4-1f4094f00416	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5582-d809-661a-8d4c4ffa6691
000e0000-5582-d80a-13ad-8126bb03af8b	\N	00150000-5582-d807-04fd-fad1615d1bce	00140000-5582-d804-4446-3a4002f7fd66	00190000-5582-d80a-4ee4-1f4094f00416	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5582-d809-661a-8d4c4ffa6691
\.


--
-- TOC entry 2844 (class 0 OID 7782348)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5582-d80a-d553-429ac5796a55	000e0000-5582-d80a-aac4-47609357be6e	1	
00200000-5582-d80a-425d-c4a120392432	000e0000-5582-d80a-aac4-47609357be6e	2	
\.


--
-- TOC entry 2859 (class 0 OID 7782473)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7782542)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7782380)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7782650)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5582-d804-5b59-52ac0e8cac03	01	Drama	drama (SURS 01)
00140000-5582-d804-2086-cbf140d1abf4	02	Opera	opera (SURS 02)
00140000-5582-d804-ddb4-7f68b7aa122e	03	Balet	balet (SURS 03)
00140000-5582-d804-d39c-31902d61a85d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5582-d804-e9cf-4feae76ed1a1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5582-d804-4446-3a4002f7fd66	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5582-d804-88d1-d7e904d63434	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7782532)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5582-d807-1090-4894c47b03ff	01	Opera	opera
00150000-5582-d807-5a31-1b7cbf0ce626	02	Opereta	opereta
00150000-5582-d807-ef9c-c886e1efb3a7	03	Balet	balet
00150000-5582-d807-2cc6-4a845c8706c2	04	Plesne prireditve	plesne prireditve
00150000-5582-d807-bbb5-b64d1024dbe4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5582-d807-21ca-cad531e369df	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5582-d807-ca7b-b0795acbc82f	07	Biografska drama	biografska drama
00150000-5582-d807-d9b5-6dda0ef45c2e	08	Komedija	komedija
00150000-5582-d807-2952-d7bcbac65e00	09	Črna komedija	črna komedija
00150000-5582-d807-6139-873854ddd42e	10	E-igra	E-igra
00150000-5582-d807-04fd-fad1615d1bce	11	Kriminalka	kriminalka
00150000-5582-d807-a8b2-4ac8f6fc6a83	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7782186)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7782707)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7782697)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7782602)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7782370)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7782395)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7782312)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7782740)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7782528)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7782346)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7782389)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7782326)
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
-- TOC entry 2499 (class 2606 OID 7782438)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7782465)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7782284)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7782195)
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
-- TOC entry 2414 (class 2606 OID 7782219)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7782175)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7782160)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7782471)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7782504)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7782645)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7782248)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7782272)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7782444)
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
-- TOC entry 2429 (class 2606 OID 7782262)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7782333)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7782456)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7782584)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7782630)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7782755)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7782825)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7782772)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7782793)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7782488)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7782429)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7782420)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7782624)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7782556)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7782131)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7782495)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7782149)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7782169)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7782513)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7782451)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7782401)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7782849)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7782837)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7782831)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7782569)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7782228)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7782411)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7782613)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7782806)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7782297)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7782144)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7782676)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7782355)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7782479)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7782547)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7782384)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7782658)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7782540)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7782377)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7782570)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7782571)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7782250)
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
-- TOC entry 2512 (class 1259 OID 7782472)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7782458)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7782457)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7782356)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7782529)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7782531)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7782530)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7782328)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7782327)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7782647)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7782648)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7782649)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7782795)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7782794)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7782681)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7782678)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7782682)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7782680)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7782679)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7782299)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7782298)
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
-- TOC entry 2412 (class 1259 OID 7782222)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7782496)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7782390)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7782176)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7782177)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7782516)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7782515)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7782514)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7782334)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7782336)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7782335)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7782839)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7782424)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7782422)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7782421)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7782423)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7782150)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7782151)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7782480)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7782445)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7782557)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7782558)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7782741)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7782742)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7782743)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7782264)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7782263)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7782265)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7782826)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7782585)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7782586)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7782711)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7782713)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7782709)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7782712)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7782710)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7782548)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7782433)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7782432)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7782430)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7782431)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7782699)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7782698)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7782756)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7782347)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7782197)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7782196)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7782229)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7782230)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7782414)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7782413)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7782412)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7782775)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7782773)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7782774)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7782379)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7782375)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7782372)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7782373)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7782371)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7782376)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7782374)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7782249)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7782313)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7782315)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7782314)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7782316)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7782439)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7782646)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7782677)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7782220)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7782221)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7782541)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7782850)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7782285)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7782838)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7782490)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7782489)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7782708)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7782273)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7782659)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7782631)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7782632)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7782170)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7782378)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7782986)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7782971)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7782976)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7782996)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7782966)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7782991)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7782981)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7783141)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7783146)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7782901)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7783081)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7783076)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7783071)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7782961)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7783111)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7783121)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7783116)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7782936)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7782931)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7783061)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7783166)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7783171)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7783176)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7783281)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7783276)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7783196)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7783181)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7783201)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7783191)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7783186)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7782926)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7782921)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7782886)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7782881)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7783091)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7783001)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7782861)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7782866)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7783106)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7783101)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7783096)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7782941)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7782951)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7782946)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7783291)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7783036)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7783026)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7783021)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7783031)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7782851)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7782856)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7783086)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7783066)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7783131)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7783136)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7783241)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7783246)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7783251)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7782911)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7782906)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7782916)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7783286)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7783151)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7783156)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7783226)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7783236)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7783216)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7783231)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7783221)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7783126)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7783056)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7783051)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7783041)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7783046)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7783211)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7783206)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7783256)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7782956)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7783161)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7782876)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7782871)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7782891)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7782896)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7783016)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7783011)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7783006)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7783271)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7783261)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7783266)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-18 16:39:23 CEST

--
-- PostgreSQL database dump complete
--

