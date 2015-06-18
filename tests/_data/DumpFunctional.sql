--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-18 16:52:34 CEST

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
-- TOC entry 180 (class 1259 OID 7793126)
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
-- TOC entry 227 (class 1259 OID 7793648)
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
-- TOC entry 226 (class 1259 OID 7793631)
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
-- TOC entry 219 (class 1259 OID 7793535)
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
-- TOC entry 194 (class 1259 OID 7793305)
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
-- TOC entry 197 (class 1259 OID 7793339)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7793248)
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
-- TOC entry 228 (class 1259 OID 7793662)
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
-- TOC entry 213 (class 1259 OID 7793465)
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
-- TOC entry 192 (class 1259 OID 7793285)
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
-- TOC entry 196 (class 1259 OID 7793333)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7793265)
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
-- TOC entry 202 (class 1259 OID 7793382)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7793407)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7793222)
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
-- TOC entry 181 (class 1259 OID 7793135)
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
-- TOC entry 182 (class 1259 OID 7793146)
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
-- TOC entry 177 (class 1259 OID 7793100)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7793119)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7793414)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7793445)
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
-- TOC entry 223 (class 1259 OID 7793581)
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
-- TOC entry 184 (class 1259 OID 7793179)
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
-- TOC entry 186 (class 1259 OID 7793214)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7793388)
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
-- TOC entry 185 (class 1259 OID 7793199)
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
-- TOC entry 191 (class 1259 OID 7793277)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7793400)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7793520)
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
-- TOC entry 222 (class 1259 OID 7793573)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7793692)
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
-- TOC entry 233 (class 1259 OID 7793755)
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
-- TOC entry 230 (class 1259 OID 7793705)
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
-- TOC entry 231 (class 1259 OID 7793724)
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
-- TOC entry 209 (class 1259 OID 7793429)
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
-- TOC entry 201 (class 1259 OID 7793373)
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
-- TOC entry 200 (class 1259 OID 7793363)
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
-- TOC entry 221 (class 1259 OID 7793562)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7793497)
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
-- TOC entry 174 (class 1259 OID 7793071)
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
-- TOC entry 173 (class 1259 OID 7793069)
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
-- TOC entry 210 (class 1259 OID 7793439)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7793109)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7793093)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7793453)
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
-- TOC entry 204 (class 1259 OID 7793394)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7793344)
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
-- TOC entry 236 (class 1259 OID 7793788)
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
-- TOC entry 235 (class 1259 OID 7793780)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7793775)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7793507)
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
-- TOC entry 183 (class 1259 OID 7793171)
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
-- TOC entry 199 (class 1259 OID 7793350)
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
-- TOC entry 220 (class 1259 OID 7793551)
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
-- TOC entry 232 (class 1259 OID 7793744)
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
-- TOC entry 188 (class 1259 OID 7793234)
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
-- TOC entry 175 (class 1259 OID 7793080)
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
-- TOC entry 225 (class 1259 OID 7793608)
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
-- TOC entry 193 (class 1259 OID 7793296)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7793421)
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
-- TOC entry 215 (class 1259 OID 7793490)
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
-- TOC entry 195 (class 1259 OID 7793328)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7793598)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7793480)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7793074)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7793126)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7793648)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5582-db31-d01c-3002530e1819	000d0000-5582-db31-3f59-b8cd98a47e28	\N	00090000-5582-db31-a67c-35a11af910fa	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-db31-14ff-e87a4c40340b	000d0000-5582-db31-1713-76eadabb58ef	\N	00090000-5582-db31-d0e3-03f8d14c8381	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-db31-ceff-a90fabbf03d2	000d0000-5582-db31-b369-da4cc7977f82	\N	00090000-5582-db31-8ec2-5b2ff8e52024	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-db31-58ab-8ec0b48e745a	000d0000-5582-db31-1ffb-e637251019f0	\N	00090000-5582-db31-3e32-ee871942e918	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-db31-26ea-2bcf1378f26c	000d0000-5582-db31-f4b1-54bc94aee1c5	\N	00090000-5582-db31-ab3a-647d0ed01c74	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-db31-e821-dbde8bd5a0a5	000d0000-5582-db31-224e-c7e493459f66	\N	00090000-5582-db31-d0e3-03f8d14c8381	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7793631)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7793535)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5582-db31-270d-c6fb5430e305	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5582-db31-4f11-35d491d56ed4	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5582-db31-eb01-0d43481ce478	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7793305)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5582-db31-b0d7-98d8d876afa4	\N	\N	00200000-5582-db31-f0c2-a75c7610ef0b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5582-db31-199d-82af2f12e1a0	\N	\N	00200000-5582-db31-9be2-12af79d38661	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5582-db31-936e-cbce39249fc2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5582-db31-8336-5d4e44f636c8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5582-db31-3cd3-f4adea53d589	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7793339)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7793248)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5582-db2f-b21c-df776367f447	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5582-db2f-c0a9-6defe89f7bb5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5582-db2f-e2ea-d3f5bb6bb05f	AL	ALB	008	Albania 	Albanija	\N
00040000-5582-db2f-dbfd-f789ba44d107	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5582-db2f-13c1-6d7c6e1ff730	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5582-db2f-cb5e-b45ec56de1b2	AD	AND	020	Andorra 	Andora	\N
00040000-5582-db2f-955e-274739266b0e	AO	AGO	024	Angola 	Angola	\N
00040000-5582-db2f-0ebe-c4ce1aee71d8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5582-db2f-9007-47df9a44522a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5582-db2f-ae29-e860f6148a19	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-db2f-aeb2-3c37b0cb38c7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5582-db2f-9d2d-6bf49c3b88a5	AM	ARM	051	Armenia 	Armenija	\N
00040000-5582-db2f-2942-d51d2441392c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5582-db2f-7fab-3862cda22f8f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5582-db2f-9aa3-3b25316ae145	AT	AUT	040	Austria 	Avstrija	\N
00040000-5582-db2f-3447-1c118637ffd1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5582-db2f-e3ab-3e78be571880	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5582-db2f-300a-c37984aa2612	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5582-db2f-40bd-4ce7592331db	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5582-db2f-83a5-c7873b76de4e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5582-db2f-f8dd-fd0ea080533f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5582-db2f-1577-b1710def489d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5582-db2f-ef3f-f3fdaf87b413	BZ	BLZ	084	Belize 	Belize	\N
00040000-5582-db2f-bd05-472a171799d6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5582-db2f-336d-0f3c785c7293	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5582-db2f-eae4-4819af851644	BT	BTN	064	Bhutan 	Butan	\N
00040000-5582-db2f-1436-12d6f44d619c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5582-db2f-dcfb-54da9d03d180	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5582-db2f-0f37-5e62ec6aebf7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5582-db2f-e6e0-58402d23108e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5582-db2f-f89c-9a594403cdf5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5582-db2f-b163-636bca2f2ec8	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5582-db2f-14b1-29cde32c589a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5582-db2f-26ac-488cdba2d5d2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5582-db2f-aa10-66c8a493b9e5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5582-db2f-cead-436c96bdd163	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5582-db2f-40ab-28f1b3cf2ef4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5582-db2f-8260-1811e7d73a25	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5582-db2f-6948-b8121ee0fa42	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5582-db2f-68d5-ff2c4d2b6400	CA	CAN	124	Canada 	Kanada	\N
00040000-5582-db2f-1449-0121195bc7d2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5582-db2f-b75d-861816a9318c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5582-db2f-b81c-d45ca524a29f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5582-db2f-2c84-0402b07bf2f0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5582-db2f-e6b4-22ea5b9a8c41	CL	CHL	152	Chile 	Čile	\N
00040000-5582-db2f-c12e-5552536c0441	CN	CHN	156	China 	Kitajska	\N
00040000-5582-db2f-e818-2b8ad8a3bdbb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5582-db2f-534f-2fdcd3c40773	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5582-db2f-ae04-a218563bafe4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5582-db2f-379d-8c1ddf3a1e5c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5582-db2f-ebfc-8d96692d18cb	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5582-db2f-17cf-1bb2ca9328f6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5582-db2f-583c-7b57ac03552b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5582-db2f-6a25-ebbaa5341349	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5582-db2f-17c7-f7a1a4b4a1bd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5582-db2f-2f6b-96480436f66b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5582-db2f-22e7-48cc7613b6a6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5582-db2f-00cf-f8bc658312b6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5582-db2f-eb7e-fb9088305f6f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5582-db2f-2331-dd1a5d01a4d0	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5582-db2f-7b73-4245b6e81edd	DK	DNK	208	Denmark 	Danska	\N
00040000-5582-db2f-cc28-a332e1402b17	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5582-db2f-4916-7a2a4e84246a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-db2f-77be-177ca6ed9c2e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5582-db2f-35bd-fb75192486d0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5582-db2f-703b-a0d7bfd2cdfc	EG	EGY	818	Egypt 	Egipt	\N
00040000-5582-db2f-af9d-1b13143c52f1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5582-db2f-834d-c8576f887277	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5582-db2f-6f03-092961663265	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5582-db2f-a302-2d95b491a98c	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5582-db2f-33ea-6219717421f9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5582-db2f-09bd-21114a5e98ec	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5582-db2f-83eb-e931ee50e164	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5582-db2f-e402-3ae83148b9c6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5582-db2f-ba51-933b8bc80b14	FI	FIN	246	Finland 	Finska	\N
00040000-5582-db2f-9f38-1ec8902fe328	FR	FRA	250	France 	Francija	\N
00040000-5582-db2f-7db1-4d55977ccb59	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5582-db2f-daa5-accf776f3ddd	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5582-db2f-75fa-79c864834ac9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5582-db2f-5a88-200a09bdfcb3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5582-db2f-f7cc-558c24d881f1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5582-db2f-30f8-d1b79928166e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5582-db2f-4fe9-06b5824b4f86	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5582-db2f-3604-102da706f7fe	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5582-db2f-e725-114150fbd88f	GH	GHA	288	Ghana 	Gana	\N
00040000-5582-db2f-4095-a3277c9dbf9c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5582-db2f-2e98-86c206e42539	GR	GRC	300	Greece 	Grčija	\N
00040000-5582-db2f-a4c9-890a78df4115	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5582-db2f-417c-51171d58e6c9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5582-db2f-02c4-2759ddcbb7a7	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5582-db2f-645a-b686dedabde3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5582-db2f-e690-465d024bcb66	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5582-db2f-7324-f0895593bed5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5582-db2f-4df3-73bbc6ab66f0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5582-db2f-610d-bdbfc86a1a2b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5582-db2f-e877-23d1c82a98c8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5582-db2f-7e2d-082a8a3fc9b8	HT	HTI	332	Haiti 	Haiti	\N
00040000-5582-db2f-ea22-afe24ec4b37f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5582-db2f-9b75-231c6e3c7651	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5582-db2f-5329-3635f46da63c	HN	HND	340	Honduras 	Honduras	\N
00040000-5582-db2f-7b80-385dca8845e7	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5582-db2f-557c-12ec5622dfe5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5582-db2f-4c38-12c6927a7b23	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5582-db2f-206c-9a51d83d8d61	IN	IND	356	India 	Indija	\N
00040000-5582-db2f-25d0-2f8e471bb6b4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5582-db2f-3d38-98c3a431d6e3	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5582-db2f-559f-41d788a66b94	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5582-db2f-bca0-da847a6c43d1	IE	IRL	372	Ireland 	Irska	\N
00040000-5582-db2f-f9a9-954d82c80955	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5582-db2f-b09f-0d8b05a44f81	IL	ISR	376	Israel 	Izrael	\N
00040000-5582-db2f-dc74-c854eff0b95a	IT	ITA	380	Italy 	Italija	\N
00040000-5582-db2f-4de1-3256cac4e7a5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5582-db2f-5baf-93c1ade2a739	JP	JPN	392	Japan 	Japonska	\N
00040000-5582-db2f-8716-ee03ca6260c9	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5582-db2f-25fd-3a201b47f129	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5582-db2f-5f66-0ae5ae6cef93	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5582-db2f-6f97-93f61316e208	KE	KEN	404	Kenya 	Kenija	\N
00040000-5582-db2f-da52-c87eacb62ea4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5582-db2f-6c97-088242675102	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5582-db2f-cdac-a56388694b89	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5582-db2f-b5c7-e4ab6af3b1ee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5582-db2f-af01-aa29a7cd3896	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5582-db2f-2c4a-7b2759d15b28	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5582-db2f-16fe-cee57b13c919	LV	LVA	428	Latvia 	Latvija	\N
00040000-5582-db2f-e5a7-882424ac0752	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5582-db2f-cfe8-3e902d638822	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5582-db2f-f4d5-21bb26f03254	LR	LBR	430	Liberia 	Liberija	\N
00040000-5582-db2f-897f-f008926d8db3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5582-db2f-3b20-3d3e633560c0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5582-db2f-a885-7954089cad20	LT	LTU	440	Lithuania 	Litva	\N
00040000-5582-db2f-baa7-c188700406f0	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5582-db2f-d002-a8ffdeec3840	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5582-db2f-128b-6cf7d08b7593	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5582-db2f-19bf-b93bfed47070	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5582-db2f-dc09-4e65534e3169	MW	MWI	454	Malawi 	Malavi	\N
00040000-5582-db2f-1422-3db4333be6fd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5582-db2f-63dc-11107a0ef6cf	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5582-db2f-de8b-54ce6e054605	ML	MLI	466	Mali 	Mali	\N
00040000-5582-db2f-b0bf-df23ed95c4d9	MT	MLT	470	Malta 	Malta	\N
00040000-5582-db2f-ffb1-97955bdb97f1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5582-db2f-6d5f-3c4bfc95af90	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5582-db2f-dca2-cd703bde5ec6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5582-db2f-9486-e14c73e1bf70	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5582-db2f-8f06-86bcba381385	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5582-db2f-106a-2bcc101b6525	MX	MEX	484	Mexico 	Mehika	\N
00040000-5582-db2f-59a9-18b7da299cc8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5582-db2f-4b00-06ca0bc26f51	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5582-db2f-0845-3c30cee465ea	MC	MCO	492	Monaco 	Monako	\N
00040000-5582-db2f-a967-780e3b7d3009	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5582-db2f-9669-db85706263bc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5582-db2f-03dd-cdc6f8c9652f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5582-db2f-0b59-126846888837	MA	MAR	504	Morocco 	Maroko	\N
00040000-5582-db2f-286d-ab4654de1508	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5582-db2f-25bd-a42e6acd31d5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5582-db2f-df85-7b5c70dbdef7	NA	NAM	516	Namibia 	Namibija	\N
00040000-5582-db2f-c791-17a0591fa15e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5582-db2f-94c1-f06dd049977b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5582-db2f-6ea6-1a0bad8b77f3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5582-db2f-2d2c-64375ddc218c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5582-db2f-490d-aa45eae45593	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5582-db2f-2b90-9b47e4fe24ac	NE	NER	562	Niger 	Niger 	\N
00040000-5582-db2f-4151-56c27b912dec	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5582-db2f-dc47-11941e194588	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5582-db2f-eff9-fcf6134d4692	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5582-db2f-19c7-5c9bbd084245	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5582-db2f-d701-589cb6996a1a	NO	NOR	578	Norway 	Norveška	\N
00040000-5582-db2f-aebc-a0e185fd8ea9	OM	OMN	512	Oman 	Oman	\N
00040000-5582-db2f-d9e7-e040401e4a57	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5582-db2f-5110-7c4d901b6660	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5582-db2f-3c18-98a431fb66c5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5582-db2f-ceac-36417a2ded8b	PA	PAN	591	Panama 	Panama	\N
00040000-5582-db2f-3c32-c176e48d1462	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5582-db2f-b3cd-da1bab980a33	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5582-db2f-11d1-a23e4f233279	PE	PER	604	Peru 	Peru	\N
00040000-5582-db2f-1ae7-208679ba0976	PH	PHL	608	Philippines 	Filipini	\N
00040000-5582-db2f-a92f-5444da0c15b9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5582-db2f-e172-7e61cd267c89	PL	POL	616	Poland 	Poljska	\N
00040000-5582-db2f-6a19-3ac1e0d3d007	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5582-db2f-b996-c2ca76975a88	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5582-db2f-b07a-9891b048821b	QA	QAT	634	Qatar 	Katar	\N
00040000-5582-db2f-ff00-ab1660c621a5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5582-db2f-8c28-70b4f1ee4fcb	RO	ROU	642	Romania 	Romunija	\N
00040000-5582-db2f-5da3-d9cf3644f77a	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5582-db2f-d32c-2dc300b61ab7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5582-db2f-c90a-c6f927a5ce18	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5582-db2f-8725-6a3d543a1286	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5582-db2f-44ec-5dc2ae937c08	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5582-db2f-3378-14c52b504aeb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5582-db2f-d528-e9760b038d6d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5582-db2f-714e-207460a53d49	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5582-db2f-f51a-a1518b2ee241	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5582-db2f-bfe3-d88de79d6fde	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5582-db2f-24b1-70969f0c73f1	SM	SMR	674	San Marino 	San Marino	\N
00040000-5582-db2f-b43e-11e12e5f544c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5582-db2f-34a4-b24b1db2e078	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5582-db2f-3524-2ef0e173b1b7	SN	SEN	686	Senegal 	Senegal	\N
00040000-5582-db2f-06e1-b23937316145	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5582-db2f-dff0-7d29e5dbf96d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5582-db2f-1397-65e45e8b88c6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5582-db2f-704c-9dcc7e474e62	SG	SGP	702	Singapore 	Singapur	\N
00040000-5582-db2f-e367-6754d6d14c8e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5582-db2f-c664-170568865f5f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5582-db2f-3075-6c0c61506931	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5582-db2f-4419-559599cac29a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5582-db2f-ac78-44b3e2f44b00	SO	SOM	706	Somalia 	Somalija	\N
00040000-5582-db2f-5f63-4318a96f4588	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5582-db2f-0040-2783e9c9ee05	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5582-db2f-2b91-1322552045c3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5582-db2f-cb72-f455a36e5aad	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5582-db2f-a653-001c65261f4f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5582-db2f-9a01-e030c3bc323d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5582-db2f-fb17-0ee29aa4261a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5582-db2f-00d8-a90b63483621	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5582-db2f-c3d6-96fa84ec039b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5582-db2f-58cc-784e4e66f8ba	SE	SWE	752	Sweden 	Švedska	\N
00040000-5582-db2f-9549-30d7eee90417	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5582-db2f-a5b9-d33cfaa6f6b4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5582-db2f-c930-7684e2d4f47d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5582-db2f-ad30-cd8e98a3e958	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5582-db2f-4e97-26bad14028bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5582-db2f-2333-4d24318799fd	TH	THA	764	Thailand 	Tajska	\N
00040000-5582-db2f-14ea-e870d23a7740	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5582-db2f-fb0f-3a05f46cc680	TG	TGO	768	Togo 	Togo	\N
00040000-5582-db2f-8770-799c7484a562	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5582-db2f-c76e-3744dc39e0e5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5582-db2f-1942-5ae54d8294e5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5582-db2f-719c-057f06c47806	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5582-db2f-9de0-7f0869eac6c6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5582-db2f-b323-dc739f3cceaf	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5582-db2f-9d20-baaffe5f304b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-db2f-2af7-55588e20d2cb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5582-db2f-7201-04e73c5e943f	UG	UGA	800	Uganda 	Uganda	\N
00040000-5582-db2f-8117-ecb9f565b25d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5582-db2f-2cc9-13cc32e272d7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5582-db2f-d2b6-0eca62bb31c0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5582-db2f-a5b9-075a9b95b39e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5582-db2f-e732-330f645d4aeb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5582-db2f-2df9-45cc75440adf	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5582-db2f-8de3-8245fc8d718c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5582-db2f-e2ba-70560e15d66a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5582-db2f-7362-4290270f95ca	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5582-db2f-35f5-91cab0288f2e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5582-db2f-edf3-0ed7802f336a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-db2f-76c3-68e1275fb853	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5582-db2f-dc38-2d0a9b6f930f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5582-db2f-ba06-0545938bd7a2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5582-db2f-48c1-8fd3a47d2437	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5582-db2f-859f-85c4f055363d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5582-db2f-9bb5-40816455b389	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7793662)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7793465)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5582-db31-081e-5ecd573f0db6	000e0000-5582-db31-9af3-96342b170db9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5582-db30-c9d1-660f341c600c
000d0000-5582-db31-3f59-b8cd98a47e28	000e0000-5582-db31-9af3-96342b170db9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-db30-c9d1-660f341c600c
000d0000-5582-db31-1713-76eadabb58ef	000e0000-5582-db31-9af3-96342b170db9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5582-db30-2a7b-bc757fdfba20
000d0000-5582-db31-b369-da4cc7977f82	000e0000-5582-db31-9af3-96342b170db9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5582-db30-dc91-3d36c1229bcb
000d0000-5582-db31-1ffb-e637251019f0	000e0000-5582-db31-9af3-96342b170db9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5582-db30-dc91-3d36c1229bcb
000d0000-5582-db31-f4b1-54bc94aee1c5	000e0000-5582-db31-9af3-96342b170db9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5582-db30-dc91-3d36c1229bcb
000d0000-5582-db31-224e-c7e493459f66	000e0000-5582-db31-9af3-96342b170db9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-db30-c9d1-660f341c600c
\.


--
-- TOC entry 2843 (class 0 OID 7793285)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7793333)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7793265)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5582-db31-6f7f-4f6e0b3b0a39	00080000-5582-db31-9915-8edba35e8666	00090000-5582-db31-a67c-35a11af910fa	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7793382)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7793407)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7793222)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5582-db30-b65d-af0af0d18103	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5582-db30-b847-23d7b18e1ee5	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5582-db30-6811-f1caf65c396e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5582-db30-f3c9-698931ef8748	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5582-db30-9a02-1b02968e2c43	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5582-db30-56d1-132c02f8a13e	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5582-db30-19fd-c2cdcc13acb8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5582-db30-5e60-510809c9baf6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-db30-72fe-4ddc7fdc9804	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-db30-2263-d2ef8bef2e85	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5582-db30-8185-aef46e4f071f	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5582-db30-a292-7ad0ce712a0a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5582-db31-4fe4-66fb9056fa47	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5582-db31-b83d-c8430b2a5138	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5582-db31-af6b-f74d0ae9baea	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5582-db31-7985-7b3d2a5ef9c9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5582-db31-1009-6523fa5d8a0c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5582-db31-844f-db6619d19fe3	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7793135)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5582-db31-f001-87de1d4f0cbc	00000000-5582-db31-b83d-c8430b2a5138	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5582-db31-2bac-a721e62d1c3a	00000000-5582-db31-b83d-c8430b2a5138	00010000-5582-db30-c412-fbb953e5dcb6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5582-db31-8999-d7c18687cd67	00000000-5582-db31-af6b-f74d0ae9baea	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7793146)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5582-db31-4038-ab4412f120f2	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5582-db31-3e32-ee871942e918	00010000-5582-db31-7c75-346ef66c9858	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5582-db31-8ec2-5b2ff8e52024	00010000-5582-db31-662f-bf184905303e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5582-db31-7493-7013b7a2f244	00010000-5582-db31-1174-9918e43b0b4d	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5582-db31-0b00-bd670983c55d	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5582-db31-3fdc-21e9ec324e61	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5582-db31-d3d9-9596c574e3b8	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5582-db31-982f-423adf4550bc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5582-db31-a67c-35a11af910fa	00010000-5582-db31-52fe-9282b234fa0c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5582-db31-d0e3-03f8d14c8381	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5582-db31-3d9d-7499d1028257	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5582-db31-ab3a-647d0ed01c74	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5582-db31-0520-1fc6f91f60be	00010000-5582-db31-f9f6-1ac15f75fe7f	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7793100)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5582-db2f-e67e-f898c04ba5bd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5582-db2f-539a-a252f02582bd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5582-db2f-e04c-9dbecad09f61	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5582-db2f-4bc9-e4b78c3b3328	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5582-db2f-0519-e215d4aec310	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5582-db2f-78cf-43d923692a58	Abonma-read	Abonma - branje	f
00030000-5582-db2f-b4fa-c61666316e58	Abonma-write	Abonma - spreminjanje	f
00030000-5582-db2f-7a73-0526c5c19d40	Alternacija-read	Alternacija - branje	f
00030000-5582-db2f-d78e-40b41245a53e	Alternacija-write	Alternacija - spreminjanje	f
00030000-5582-db2f-26a4-05c2323e8462	Arhivalija-read	Arhivalija - branje	f
00030000-5582-db2f-2a69-6febafd9c99e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5582-db2f-b963-a6ffefe50cc7	Besedilo-read	Besedilo - branje	f
00030000-5582-db2f-714d-109638edfd37	Besedilo-write	Besedilo - spreminjanje	f
00030000-5582-db2f-c983-a8f5523761be	DogodekIzven-read	DogodekIzven - branje	f
00030000-5582-db2f-80ac-3862529b6ce4	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5582-db2f-6a4b-c48fa0f335fc	Dogodek-read	Dogodek - branje	f
00030000-5582-db2f-eb7b-b4e2a28e7a03	Dogodek-write	Dogodek - spreminjanje	f
00030000-5582-db2f-bb48-539535e854c2	Drzava-read	Drzava - branje	f
00030000-5582-db2f-086c-68906715ef21	Drzava-write	Drzava - spreminjanje	f
00030000-5582-db2f-368e-ff05839e19ac	Funkcija-read	Funkcija - branje	f
00030000-5582-db2f-3ece-33993fab6771	Funkcija-write	Funkcija - spreminjanje	f
00030000-5582-db2f-85f6-d6369eb660d6	Gostovanje-read	Gostovanje - branje	f
00030000-5582-db2f-58d4-631b7df75cbb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5582-db2f-a3ad-68f107e20a05	Gostujoca-read	Gostujoca - branje	f
00030000-5582-db2f-6b5d-42913e41e0ff	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5582-db2f-8a27-b72b470f0a70	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5582-db2f-d6da-1a4d83edd4f9	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5582-db2f-28c6-ff6df3f363c7	Kupec-read	Kupec - branje	f
00030000-5582-db2f-fecb-a6dd3558ee5a	Kupec-write	Kupec - spreminjanje	f
00030000-5582-db2f-4e7d-e1fbbb58caaa	NacinPlacina-read	NacinPlacina - branje	f
00030000-5582-db2f-c16a-4d94db0fd69f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5582-db2f-dcc5-bc064d771acb	Option-read	Option - branje	f
00030000-5582-db2f-5e56-2ca4fe5e4481	Option-write	Option - spreminjanje	f
00030000-5582-db2f-872e-8611754b55de	OptionValue-read	OptionValue - branje	f
00030000-5582-db2f-05ef-f26fc63b9512	OptionValue-write	OptionValue - spreminjanje	f
00030000-5582-db2f-b985-f4d5d09aa0e9	Oseba-read	Oseba - branje	f
00030000-5582-db2f-a5b0-d822dfd7751b	Oseba-write	Oseba - spreminjanje	f
00030000-5582-db2f-4cae-3ebbeee1721b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5582-db2f-fd88-57a31b3cd04c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5582-db2f-e56f-17d3aa26b71c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5582-db2f-b8ee-53a2c805518d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5582-db2f-7f26-a6f588288b1f	Pogodba-read	Pogodba - branje	f
00030000-5582-db2f-da89-84086dbe6ca7	Pogodba-write	Pogodba - spreminjanje	f
00030000-5582-db2f-81a5-62cdec92d006	Popa-read	Popa - branje	f
00030000-5582-db2f-da85-3213cd88f6e4	Popa-write	Popa - spreminjanje	f
00030000-5582-db2f-58cd-8a6150a32b88	Posta-read	Posta - branje	f
00030000-5582-db2f-e021-6bcbb317a011	Posta-write	Posta - spreminjanje	f
00030000-5582-db2f-4479-9425b93c37cd	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5582-db2f-73c2-9bfce15d95fb	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5582-db2f-e8a2-b012712e9a0f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5582-db2f-0737-20887a3dfcd4	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5582-db2f-8748-5a96f1fb0fd6	Predstava-read	Predstava - branje	f
00030000-5582-db2f-4d0f-24b88ed2e10b	Predstava-write	Predstava - spreminjanje	f
00030000-5582-db2f-be56-1917221eab7a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5582-db2f-258a-1546b23404ad	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5582-db2f-e754-0e5372ccc17c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5582-db2f-6429-e6feca87d8e3	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5582-db2f-50d5-44df1a579870	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5582-db2f-dad0-dce57db811b5	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5582-db2f-a24d-47829286c647	ProgramDela-read	ProgramDela - branje	f
00030000-5582-db2f-f310-5bcacf2ece01	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5582-db2f-6f2e-d63c30a05de9	ProgramFestival-read	ProgramFestival - branje	f
00030000-5582-db2f-b5db-2c254877a894	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5582-db2f-01af-7765b5056b1e	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5582-db2f-2726-7d37a882cd0a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5582-db2f-88da-9a5cc7889ee4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5582-db2f-783a-dc7a18c911ef	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5582-db2f-c6c9-96d5ace03f9a	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5582-db2f-27f5-2664944923c7	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5582-db2f-de36-9d91f9677ee2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5582-db2f-9c4b-b94f50064569	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5582-db2f-cb02-16597d014d81	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5582-db2f-8a8e-c857017947c2	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5582-db2f-6eac-1fd2acafde3d	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5582-db2f-2eb9-5d216cd9a4bb	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5582-db2f-0fde-ed5f38418aba	ProgramRazno-read	ProgramRazno - branje	f
00030000-5582-db2f-82f2-32c750d4a8d9	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5582-db2f-6735-0be3ad1994bc	Prostor-read	Prostor - branje	f
00030000-5582-db2f-997a-1165c85f2a3e	Prostor-write	Prostor - spreminjanje	f
00030000-5582-db2f-2e95-220224145844	Racun-read	Racun - branje	f
00030000-5582-db2f-c6d5-6265ed854159	Racun-write	Racun - spreminjanje	f
00030000-5582-db2f-aa06-3dddc3622460	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5582-db2f-03cd-f1186f272f3c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5582-db2f-8a9d-322c63e070cf	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5582-db2f-a683-fcd9a48bc48c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5582-db2f-d697-57be409eb367	Rekvizit-read	Rekvizit - branje	f
00030000-5582-db2f-f3f0-895ed3c5cd6b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5582-db2f-1942-8d0ad40b8e3c	Revizija-read	Revizija - branje	f
00030000-5582-db2f-1419-6742195a5d58	Revizija-write	Revizija - spreminjanje	f
00030000-5582-db2f-33d3-29236a80ffca	Rezervacija-read	Rezervacija - branje	f
00030000-5582-db2f-e159-b169f19f91fe	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5582-db2f-c553-732b5d9803d5	SedezniRed-read	SedezniRed - branje	f
00030000-5582-db2f-96e7-554954dcf4c3	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5582-db2f-0b1f-49a75df42023	Sedez-read	Sedez - branje	f
00030000-5582-db2f-3f9a-6ee70df99f7d	Sedez-write	Sedez - spreminjanje	f
00030000-5582-db2f-802f-ebf99c2cbebf	Sezona-read	Sezona - branje	f
00030000-5582-db2f-d083-3230c5af95d9	Sezona-write	Sezona - spreminjanje	f
00030000-5582-db2f-0b80-b1eea61c85e5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5582-db2f-cdd7-be02f31f78b9	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5582-db2f-f166-d614871a0f4b	Stevilcenje-read	Stevilcenje - branje	f
00030000-5582-db2f-4d48-510b8cb2a8eb	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5582-db2f-00f3-c486b903b15e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5582-db2f-b36b-c1dd51dce283	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5582-db2f-60fe-da92edb4de42	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5582-db2f-87c5-4ee4ac8d5c4d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5582-db2f-798d-c825a6418a71	Telefonska-read	Telefonska - branje	f
00030000-5582-db2f-86b3-0913ec651dad	Telefonska-write	Telefonska - spreminjanje	f
00030000-5582-db2f-f81d-7f7d24613b40	TerminStoritve-read	TerminStoritve - branje	f
00030000-5582-db2f-c3ba-f0c908c8210b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5582-db2f-06fb-31943ee6c947	TipFunkcije-read	TipFunkcije - branje	f
00030000-5582-db2f-bf10-ea7292202fcd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5582-db2f-af41-720ec70cfc7b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5582-db2f-f692-186af53404eb	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5582-db2f-9f17-8b9243989811	Trr-read	Trr - branje	f
00030000-5582-db2f-1c77-2e567d0db5ac	Trr-write	Trr - spreminjanje	f
00030000-5582-db2f-d170-bb45e2f63736	Uprizoritev-read	Uprizoritev - branje	f
00030000-5582-db2f-b1fc-56d02c8c6024	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5582-db2f-715b-00388449096c	Vaja-read	Vaja - branje	f
00030000-5582-db2f-1cf8-4b3cceb35b2b	Vaja-write	Vaja - spreminjanje	f
00030000-5582-db2f-0ec5-bb8a74d2b3e9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5582-db2f-c020-d08d30709e22	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5582-db2f-b00d-1ee380fe9b60	Zaposlitev-read	Zaposlitev - branje	f
00030000-5582-db2f-8ff0-d540aae842c6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5582-db2f-cebd-770d99c2eef7	Zasedenost-read	Zasedenost - branje	f
00030000-5582-db2f-79a9-f3761ca2cb72	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5582-db2f-1514-bb3a627f7a8f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5582-db2f-0c1b-9f35464f2577	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5582-db2f-1438-67768b2144a8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5582-db2f-ddf2-196ff2611a17	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7793119)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5582-db2f-73f4-725bff3b000d	00030000-5582-db2f-539a-a252f02582bd
00020000-5582-db2f-123b-597191629dc3	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-78cf-43d923692a58
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-b4fa-c61666316e58
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-7a73-0526c5c19d40
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-d78e-40b41245a53e
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-26a4-05c2323e8462
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-6a4b-c48fa0f335fc
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-4bc9-e4b78c3b3328
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-eb7b-b4e2a28e7a03
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-086c-68906715ef21
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-368e-ff05839e19ac
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-3ece-33993fab6771
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-85f6-d6369eb660d6
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-58d4-631b7df75cbb
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-a3ad-68f107e20a05
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-6b5d-42913e41e0ff
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-8a27-b72b470f0a70
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-d6da-1a4d83edd4f9
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-dcc5-bc064d771acb
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-872e-8611754b55de
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-b985-f4d5d09aa0e9
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-a5b0-d822dfd7751b
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-81a5-62cdec92d006
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-da85-3213cd88f6e4
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-58cd-8a6150a32b88
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-e021-6bcbb317a011
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-e8a2-b012712e9a0f
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-0737-20887a3dfcd4
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-8748-5a96f1fb0fd6
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-4d0f-24b88ed2e10b
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-50d5-44df1a579870
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-dad0-dce57db811b5
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-6735-0be3ad1994bc
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-997a-1165c85f2a3e
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-8a9d-322c63e070cf
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-a683-fcd9a48bc48c
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-d697-57be409eb367
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-f3f0-895ed3c5cd6b
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-802f-ebf99c2cbebf
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-d083-3230c5af95d9
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-06fb-31943ee6c947
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-d170-bb45e2f63736
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-b1fc-56d02c8c6024
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-715b-00388449096c
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-1cf8-4b3cceb35b2b
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-cebd-770d99c2eef7
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-79a9-f3761ca2cb72
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-1514-bb3a627f7a8f
00020000-5582-db30-9cd6-1816b5bf5d1a	00030000-5582-db2f-1438-67768b2144a8
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-78cf-43d923692a58
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-26a4-05c2323e8462
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-6a4b-c48fa0f335fc
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-85f6-d6369eb660d6
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-a3ad-68f107e20a05
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-8a27-b72b470f0a70
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-d6da-1a4d83edd4f9
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-dcc5-bc064d771acb
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-872e-8611754b55de
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-b985-f4d5d09aa0e9
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-a5b0-d822dfd7751b
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-81a5-62cdec92d006
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-58cd-8a6150a32b88
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-e8a2-b012712e9a0f
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-0737-20887a3dfcd4
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-8748-5a96f1fb0fd6
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-6735-0be3ad1994bc
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-8a9d-322c63e070cf
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-d697-57be409eb367
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-802f-ebf99c2cbebf
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-798d-c825a6418a71
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-86b3-0913ec651dad
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-9f17-8b9243989811
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-1c77-2e567d0db5ac
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-b00d-1ee380fe9b60
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-8ff0-d540aae842c6
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-1514-bb3a627f7a8f
00020000-5582-db30-e75a-60155b0fdf15	00030000-5582-db2f-1438-67768b2144a8
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-78cf-43d923692a58
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-7a73-0526c5c19d40
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-26a4-05c2323e8462
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-2a69-6febafd9c99e
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-b963-a6ffefe50cc7
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-c983-a8f5523761be
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-6a4b-c48fa0f335fc
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-368e-ff05839e19ac
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-85f6-d6369eb660d6
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-a3ad-68f107e20a05
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-8a27-b72b470f0a70
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-dcc5-bc064d771acb
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-872e-8611754b55de
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-b985-f4d5d09aa0e9
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-81a5-62cdec92d006
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-58cd-8a6150a32b88
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-8748-5a96f1fb0fd6
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-50d5-44df1a579870
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-6735-0be3ad1994bc
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-8a9d-322c63e070cf
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-d697-57be409eb367
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-802f-ebf99c2cbebf
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-06fb-31943ee6c947
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-715b-00388449096c
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-cebd-770d99c2eef7
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-1514-bb3a627f7a8f
00020000-5582-db30-84bf-632721daec7d	00030000-5582-db2f-1438-67768b2144a8
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-78cf-43d923692a58
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-b4fa-c61666316e58
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-d78e-40b41245a53e
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-26a4-05c2323e8462
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-6a4b-c48fa0f335fc
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-85f6-d6369eb660d6
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-a3ad-68f107e20a05
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-dcc5-bc064d771acb
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-872e-8611754b55de
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-81a5-62cdec92d006
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-58cd-8a6150a32b88
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-8748-5a96f1fb0fd6
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-6735-0be3ad1994bc
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-8a9d-322c63e070cf
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-d697-57be409eb367
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-802f-ebf99c2cbebf
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-06fb-31943ee6c947
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-1514-bb3a627f7a8f
00020000-5582-db30-ef64-e174f13f9952	00030000-5582-db2f-1438-67768b2144a8
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-78cf-43d923692a58
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-26a4-05c2323e8462
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-6a4b-c48fa0f335fc
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-bb48-539535e854c2
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-85f6-d6369eb660d6
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-a3ad-68f107e20a05
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-dcc5-bc064d771acb
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-872e-8611754b55de
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-81a5-62cdec92d006
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-58cd-8a6150a32b88
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-8748-5a96f1fb0fd6
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-6735-0be3ad1994bc
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-8a9d-322c63e070cf
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-d697-57be409eb367
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-802f-ebf99c2cbebf
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-f81d-7f7d24613b40
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-e04c-9dbecad09f61
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-06fb-31943ee6c947
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-1514-bb3a627f7a8f
00020000-5582-db30-eadb-1239b20bfd6d	00030000-5582-db2f-1438-67768b2144a8
\.


--
-- TOC entry 2858 (class 0 OID 7793414)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7793445)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7793581)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7793179)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5582-db31-9915-8edba35e8666	00040000-5582-db2f-b21c-df776367f447	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-db31-3530-6a4b42f3b8f9	00040000-5582-db2f-b21c-df776367f447	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-db31-8fcb-0c3d482223fb	00040000-5582-db2f-b21c-df776367f447	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-db31-cc7b-0140bbf1f800	00040000-5582-db2f-b21c-df776367f447	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-db31-c8cd-507d0438859c	00040000-5582-db2f-3075-6c0c61506931	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7793214)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5582-db30-0423-e80a13531cad	8341	Adlešiči
00050000-5582-db30-fa29-c0f8d147af2f	5270	Ajdovščina
00050000-5582-db30-bfec-098419cfed13	6280	Ankaran/Ancarano
00050000-5582-db30-39a1-5ecd4dd0405d	9253	Apače
00050000-5582-db30-ddba-cfad55f866d8	8253	Artiče
00050000-5582-db30-daf7-5b5ea4ec58c8	4275	Begunje na Gorenjskem
00050000-5582-db30-81bc-791575005760	1382	Begunje pri Cerknici
00050000-5582-db30-7620-e54968b5d428	9231	Beltinci
00050000-5582-db30-56a1-bdf50928221a	2234	Benedikt
00050000-5582-db30-271f-bcc0fe652bc9	2345	Bistrica ob Dravi
00050000-5582-db30-f98e-896aa3d72c45	3256	Bistrica ob Sotli
00050000-5582-db30-0268-e7bc807c5a9e	8259	Bizeljsko
00050000-5582-db30-2067-84d19cecccd0	1223	Blagovica
00050000-5582-db30-47d9-dc5889136912	8283	Blanca
00050000-5582-db30-cc56-e4b875d232a3	4260	Bled
00050000-5582-db30-0e50-eb35c0864a1a	4273	Blejska Dobrava
00050000-5582-db30-48a3-7b8413cb8a12	9265	Bodonci
00050000-5582-db30-b5f9-bcc598e7afea	9222	Bogojina
00050000-5582-db30-dfea-2d2fae13b0f3	4263	Bohinjska Bela
00050000-5582-db30-bcfb-87a344c6d75d	4264	Bohinjska Bistrica
00050000-5582-db30-bfe7-60017fb54eaa	4265	Bohinjsko jezero
00050000-5582-db30-b468-bc41d239cc21	1353	Borovnica
00050000-5582-db30-ef7c-60eafb66f40e	8294	Boštanj
00050000-5582-db30-f4e3-c569148ed165	5230	Bovec
00050000-5582-db30-bcd8-9b46b1a698f3	5295	Branik
00050000-5582-db30-2f8d-39275072116c	3314	Braslovče
00050000-5582-db30-55bd-6369e6691b72	5223	Breginj
00050000-5582-db30-743e-181504b77cb8	8280	Brestanica
00050000-5582-db30-2d2d-6e559f7989d9	2354	Bresternica
00050000-5582-db30-b294-fcd5ea1c13dc	4243	Brezje
00050000-5582-db30-3b69-57d84e49c3b2	1351	Brezovica pri Ljubljani
00050000-5582-db30-d2c4-abd839d604e7	8250	Brežice
00050000-5582-db30-56eb-25eb1f8caa87	4210	Brnik - Aerodrom
00050000-5582-db30-6f31-a4dce48b7324	8321	Brusnice
00050000-5582-db30-95e3-af5ac9aa6e00	3255	Buče
00050000-5582-db30-edd7-83cfac4770c7	8276	Bučka 
00050000-5582-db30-f410-50e2fc7992b0	9261	Cankova
00050000-5582-db30-1136-904b0e915290	3000	Celje 
00050000-5582-db30-18f2-edab61a0604e	3001	Celje - poštni predali
00050000-5582-db30-afff-6c725f68d044	4207	Cerklje na Gorenjskem
00050000-5582-db30-9bef-cf17da508771	8263	Cerklje ob Krki
00050000-5582-db30-4f06-0edfe05bf37f	1380	Cerknica
00050000-5582-db30-04f0-65e8b2341011	5282	Cerkno
00050000-5582-db30-a11c-7ca12bba8fc7	2236	Cerkvenjak
00050000-5582-db30-33b5-80fc28bc4bea	2215	Ceršak
00050000-5582-db30-d7da-e590b51bccdb	2326	Cirkovce
00050000-5582-db30-e9c7-a3bd2dac0ce1	2282	Cirkulane
00050000-5582-db30-21ab-2ff7454e90ae	5273	Col
00050000-5582-db30-79ab-098171eb1291	8251	Čatež ob Savi
00050000-5582-db30-8202-006400a53ec4	1413	Čemšenik
00050000-5582-db30-1be4-627e680bbb2b	5253	Čepovan
00050000-5582-db30-27ef-0b6c7da3a03d	9232	Črenšovci
00050000-5582-db30-378d-93c629238326	2393	Črna na Koroškem
00050000-5582-db30-2292-afa7d64042b9	6275	Črni Kal
00050000-5582-db30-488b-b0d929bc3bc3	5274	Črni Vrh nad Idrijo
00050000-5582-db30-9a19-8c1e0e73a3b5	5262	Črniče
00050000-5582-db30-7c71-17f7dfdc1690	8340	Črnomelj
00050000-5582-db30-60b3-4b4dea85a16b	6271	Dekani
00050000-5582-db30-58ae-fab0e539d12e	5210	Deskle
00050000-5582-db30-d104-0ae49ad43d65	2253	Destrnik
00050000-5582-db30-b267-9dcabd75c4fa	6215	Divača
00050000-5582-db30-f88f-adcb00e5bfe3	1233	Dob
00050000-5582-db30-0c1b-cd4ba644d678	3224	Dobje pri Planini
00050000-5582-db30-3a33-da5b0509df78	8257	Dobova
00050000-5582-db30-78b8-148abf07ad36	1423	Dobovec
00050000-5582-db30-5ef8-81a853eea9d9	5263	Dobravlje
00050000-5582-db30-4e8d-87d47e245c73	3204	Dobrna
00050000-5582-db30-339b-7fe59870ea19	8211	Dobrnič
00050000-5582-db30-038e-c2eeab4d2b61	1356	Dobrova
00050000-5582-db30-046e-fb9e3a48f4d7	9223	Dobrovnik/Dobronak 
00050000-5582-db30-5bff-102bd3a1e947	5212	Dobrovo v Brdih
00050000-5582-db30-dbdb-0854550289f2	1431	Dol pri Hrastniku
00050000-5582-db30-b69c-eeb008c5b6ef	1262	Dol pri Ljubljani
00050000-5582-db30-3c1d-602c18901a5f	1273	Dole pri Litiji
00050000-5582-db30-60f3-b1c6a6046f1a	1331	Dolenja vas
00050000-5582-db30-cbd1-fdd0af980183	8350	Dolenjske Toplice
00050000-5582-db30-f22f-cf66fbb942c3	1230	Domžale
00050000-5582-db30-339b-7822d8ee6341	2252	Dornava
00050000-5582-db30-855b-7e5746d7030d	5294	Dornberk
00050000-5582-db30-37ee-f0cc15daf6e3	1319	Draga
00050000-5582-db30-0795-d68da79fb3ac	8343	Dragatuš
00050000-5582-db30-8ff3-471ae53e936a	3222	Dramlje
00050000-5582-db30-c000-ab4431fa5864	2370	Dravograd
00050000-5582-db30-7048-9c2ec543aded	4203	Duplje
00050000-5582-db30-5258-3151999b3c42	6221	Dutovlje
00050000-5582-db30-8d1c-0dd621ac5be1	8361	Dvor
00050000-5582-db30-ecea-844cf6405c2c	2343	Fala
00050000-5582-db30-bb6a-c856794e5ea3	9208	Fokovci
00050000-5582-db30-a475-54fd21a6f2d6	2313	Fram
00050000-5582-db30-af3b-768ad455f336	3213	Frankolovo
00050000-5582-db30-2844-02e5d4ce1387	1274	Gabrovka
00050000-5582-db30-6e64-3fcc74763412	8254	Globoko
00050000-5582-db30-13df-e37623daab4a	5275	Godovič
00050000-5582-db30-f39a-74247f52039f	4204	Golnik
00050000-5582-db30-12bc-e24a1ffa691d	3303	Gomilsko
00050000-5582-db30-ead3-b1a43a0eb1a2	4224	Gorenja vas
00050000-5582-db30-47f7-e0c680fc7b35	3263	Gorica pri Slivnici
00050000-5582-db30-00ca-9535b3c2bca7	2272	Gorišnica
00050000-5582-db30-966c-b4c313c717c7	9250	Gornja Radgona
00050000-5582-db30-5384-7989b9f8d7b9	3342	Gornji Grad
00050000-5582-db30-ee49-2a22973914f4	4282	Gozd Martuljek
00050000-5582-db30-96e6-a1f0d76e4415	6272	Gračišče
00050000-5582-db30-b896-496cfdfcea74	9264	Grad
00050000-5582-db30-eff6-9ffcd39d1465	8332	Gradac
00050000-5582-db30-5409-805949ca2609	1384	Grahovo
00050000-5582-db30-4303-55361f35ae1c	5242	Grahovo ob Bači
00050000-5582-db30-09c7-79bee35991da	5251	Grgar
00050000-5582-db30-f872-8228cc71c69f	3302	Griže
00050000-5582-db30-52d3-11fdb3d89aaa	3231	Grobelno
00050000-5582-db30-11d1-e8fd3f39fbd0	1290	Grosuplje
00050000-5582-db30-4739-6b84803260d4	2288	Hajdina
00050000-5582-db30-5ece-0f4052095484	8362	Hinje
00050000-5582-db30-8857-1cc0b99e0410	2311	Hoče
00050000-5582-db30-23b0-710acad6a69f	9205	Hodoš/Hodos
00050000-5582-db30-8bac-2b88356a1231	1354	Horjul
00050000-5582-db30-c155-a31e6de47e85	1372	Hotedršica
00050000-5582-db30-4583-dfffd9085766	1430	Hrastnik
00050000-5582-db30-3def-c701e0ff6be1	6225	Hruševje
00050000-5582-db30-48ef-acc021aa5f0b	4276	Hrušica
00050000-5582-db30-f27d-bd096edfbfbf	5280	Idrija
00050000-5582-db30-fdee-95e41d9e3712	1292	Ig
00050000-5582-db30-4c71-7988525633cc	6250	Ilirska Bistrica
00050000-5582-db30-9ea3-06809a831918	6251	Ilirska Bistrica-Trnovo
00050000-5582-db30-8c78-59f19cee9820	1295	Ivančna Gorica
00050000-5582-db30-adc6-6a0bfa5a0e1f	2259	Ivanjkovci
00050000-5582-db30-d1bf-7098ce951744	1411	Izlake
00050000-5582-db30-cc57-96cb422e4460	6310	Izola/Isola
00050000-5582-db30-3aad-5dce230ce283	2222	Jakobski Dol
00050000-5582-db30-66c5-be816eee2747	2221	Jarenina
00050000-5582-db30-dc7b-f174e377a72d	6254	Jelšane
00050000-5582-db30-f18f-3a63622dd6db	4270	Jesenice
00050000-5582-db30-a68f-f032bbcbc541	8261	Jesenice na Dolenjskem
00050000-5582-db30-e487-593fb968df6b	3273	Jurklošter
00050000-5582-db30-b4d7-2a2f98c66b03	2223	Jurovski Dol
00050000-5582-db30-4397-a42888343ad2	2256	Juršinci
00050000-5582-db30-580c-3b7403c786e9	5214	Kal nad Kanalom
00050000-5582-db30-2cc0-56600eabd1e6	3233	Kalobje
00050000-5582-db30-57ab-ba49dcdab549	4246	Kamna Gorica
00050000-5582-db30-c9ec-7db394a5c2bf	2351	Kamnica
00050000-5582-db30-3a08-56c8386283f3	1241	Kamnik
00050000-5582-db30-96f2-40bd4d7caff3	5213	Kanal
00050000-5582-db30-f09d-91a32977ecbd	8258	Kapele
00050000-5582-db30-639b-bc93fca38139	2362	Kapla
00050000-5582-db30-1f4e-b00236e61867	2325	Kidričevo
00050000-5582-db30-e06b-1285b06646ec	1412	Kisovec
00050000-5582-db30-8b69-58abf2bb0ed2	6253	Knežak
00050000-5582-db30-6e61-c32c71ddac52	5222	Kobarid
00050000-5582-db30-6134-d12dffa9f382	9227	Kobilje
00050000-5582-db30-ae95-e90a6e393919	1330	Kočevje
00050000-5582-db30-b97c-9f83a64fcb62	1338	Kočevska Reka
00050000-5582-db30-102e-da6c870c2ab5	2276	Kog
00050000-5582-db30-2190-0dad465b351b	5211	Kojsko
00050000-5582-db30-35b4-b265f656ad5f	6223	Komen
00050000-5582-db30-9808-e231e87ebb2c	1218	Komenda
00050000-5582-db30-8613-74c58cc235d1	6000	Koper/Capodistria 
00050000-5582-db30-fd42-6f8f9911ea36	6001	Koper/Capodistria - poštni predali
00050000-5582-db30-bac5-94fa1c27a9a6	8282	Koprivnica
00050000-5582-db30-1e46-dbfa74168796	5296	Kostanjevica na Krasu
00050000-5582-db30-fe06-f7ce9434d375	8311	Kostanjevica na Krki
00050000-5582-db30-6621-65726f949930	1336	Kostel
00050000-5582-db30-5fe3-7e7d1648aaea	6256	Košana
00050000-5582-db30-8a47-3a7b7ad8d379	2394	Kotlje
00050000-5582-db30-3af9-807bd70d06b5	6240	Kozina
00050000-5582-db30-55ef-748df03aa0af	3260	Kozje
00050000-5582-db30-cac3-3fc74b217868	4000	Kranj 
00050000-5582-db30-670c-7506a4b0a89c	4001	Kranj - poštni predali
00050000-5582-db30-9cdc-1e2573212039	4280	Kranjska Gora
00050000-5582-db30-5976-a13ea43fc2de	1281	Kresnice
00050000-5582-db30-01ac-1eb453394f58	4294	Križe
00050000-5582-db30-5be9-be8e7fa2af37	9206	Križevci
00050000-5582-db30-0a00-9aa9881419ff	9242	Križevci pri Ljutomeru
00050000-5582-db30-f406-8a135186af79	1301	Krka
00050000-5582-db30-3c93-d25d9b5daa90	8296	Krmelj
00050000-5582-db30-ca93-9b39722a0d5c	4245	Kropa
00050000-5582-db30-f52d-6b5642ae323c	8262	Krška vas
00050000-5582-db30-9b4b-532af29fbe72	8270	Krško
00050000-5582-db30-1030-5e3acac32814	9263	Kuzma
00050000-5582-db30-bea4-758ae10ea53d	2318	Laporje
00050000-5582-db30-8a33-c45da773db8c	3270	Laško
00050000-5582-db30-708d-0b7adc391083	1219	Laze v Tuhinju
00050000-5582-db30-99d5-62f3eeab0470	2230	Lenart v Slovenskih goricah
00050000-5582-db30-3817-6695e9f4123b	9220	Lendava/Lendva
00050000-5582-db30-7345-fd24bf2c6297	4248	Lesce
00050000-5582-db30-c254-843bafcd7604	3261	Lesično
00050000-5582-db30-39e0-1b5637444437	8273	Leskovec pri Krškem
00050000-5582-db30-c8b9-6e5de21ea955	2372	Libeliče
00050000-5582-db30-827a-39705471e435	2341	Limbuš
00050000-5582-db30-a11a-c4f4a58b4a25	1270	Litija
00050000-5582-db30-a27b-e2bbd221f31e	3202	Ljubečna
00050000-5582-db30-0d08-07ac43421e8f	1000	Ljubljana 
00050000-5582-db30-0cbc-01a1a6da1007	1001	Ljubljana - poštni predali
00050000-5582-db30-da60-01ed441fe31f	1231	Ljubljana - Črnuče
00050000-5582-db30-99f0-0b3988720e76	1261	Ljubljana - Dobrunje
00050000-5582-db30-56ab-5ff708c2d294	1260	Ljubljana - Polje
00050000-5582-db30-d616-82c0f8293c36	1210	Ljubljana - Šentvid
00050000-5582-db30-ffc0-45b913baa15c	1211	Ljubljana - Šmartno
00050000-5582-db30-a37d-ef5865a4d48e	3333	Ljubno ob Savinji
00050000-5582-db30-2ac6-c4878187b2fe	9240	Ljutomer
00050000-5582-db30-ac99-61b5a711dfd2	3215	Loče
00050000-5582-db30-2c88-2c18bbfed48d	5231	Log pod Mangartom
00050000-5582-db30-a28e-6aaabff68f64	1358	Log pri Brezovici
00050000-5582-db30-841c-1171f0f2f276	1370	Logatec
00050000-5582-db30-753a-eb9d9dd89bef	1371	Logatec
00050000-5582-db30-b912-7f27031aeac2	1434	Loka pri Zidanem Mostu
00050000-5582-db30-3325-c4f0d199bfef	3223	Loka pri Žusmu
00050000-5582-db30-68c8-f04414203681	6219	Lokev
00050000-5582-db30-6812-88b312b09523	1318	Loški Potok
00050000-5582-db30-0f4c-49136100f8d2	2324	Lovrenc na Dravskem polju
00050000-5582-db30-23fe-8c1a1c667c01	2344	Lovrenc na Pohorju
00050000-5582-db30-bfba-3f9442b6f67f	3334	Luče
00050000-5582-db30-d241-aae45bbddacf	1225	Lukovica
00050000-5582-db30-d8c8-9841a3ec0c2d	9202	Mačkovci
00050000-5582-db30-43e9-03b35659bdac	2322	Majšperk
00050000-5582-db30-6374-c449ca3c7473	2321	Makole
00050000-5582-db30-36c5-e57053b0fa40	9243	Mala Nedelja
00050000-5582-db30-5cab-361e631e17cf	2229	Malečnik
00050000-5582-db30-85cf-d2639d5b1df8	6273	Marezige
00050000-5582-db30-6755-d3842f3a2c23	2000	Maribor 
00050000-5582-db30-f266-a5679d276fe9	2001	Maribor - poštni predali
00050000-5582-db30-d762-c9d3430e14a4	2206	Marjeta na Dravskem polju
00050000-5582-db30-7cca-77baf1f8576b	2281	Markovci
00050000-5582-db30-02df-2d4887858bbd	9221	Martjanci
00050000-5582-db30-29a2-7b5a3571a75b	6242	Materija
00050000-5582-db30-e849-294ad481a0ed	4211	Mavčiče
00050000-5582-db30-4007-40559ee48b88	1215	Medvode
00050000-5582-db30-68f7-6107a2d2b5b5	1234	Mengeš
00050000-5582-db30-9e1b-7dab877e40ed	8330	Metlika
00050000-5582-db30-68c8-7081ba7bc243	2392	Mežica
00050000-5582-db30-aa71-e3a77fc29697	2204	Miklavž na Dravskem polju
00050000-5582-db30-aeda-47831811dd0b	2275	Miklavž pri Ormožu
00050000-5582-db30-535b-26218fafce1e	5291	Miren
00050000-5582-db30-b565-b8c52f624579	8233	Mirna
00050000-5582-db30-70c6-a1feef5c8478	8216	Mirna Peč
00050000-5582-db30-698e-dc354bb58a9e	2382	Mislinja
00050000-5582-db30-2697-c60da46632ce	4281	Mojstrana
00050000-5582-db30-fc74-95cf5a0eb11c	8230	Mokronog
00050000-5582-db30-b6d6-8caf982ea872	1251	Moravče
00050000-5582-db30-af35-d3fa1963bd88	9226	Moravske Toplice
00050000-5582-db30-8e74-f6ba2468c447	5216	Most na Soči
00050000-5582-db30-2aea-a7a18f34451f	1221	Motnik
00050000-5582-db30-407d-4dd7b1e07d72	3330	Mozirje
00050000-5582-db30-3eba-ac629e70f6ab	9000	Murska Sobota 
00050000-5582-db30-958b-443a460ed0c8	9001	Murska Sobota - poštni predali
00050000-5582-db30-3466-01b0d7dad918	2366	Muta
00050000-5582-db30-d657-723444cd8a62	4202	Naklo
00050000-5582-db30-6de3-4b048d803466	3331	Nazarje
00050000-5582-db30-40b2-539c251efbeb	1357	Notranje Gorice
00050000-5582-db30-b173-3e82b475b3d0	3203	Nova Cerkev
00050000-5582-db30-65a3-b1e13e5209ab	5000	Nova Gorica 
00050000-5582-db30-ba01-721d2bde0aca	5001	Nova Gorica - poštni predali
00050000-5582-db30-17a9-54005b1e3d18	1385	Nova vas
00050000-5582-db30-3f1a-9584e9ac4c1a	8000	Novo mesto
00050000-5582-db30-5102-4d1223dc697e	8001	Novo mesto - poštni predali
00050000-5582-db30-28e2-f5a41cf02dd9	6243	Obrov
00050000-5582-db30-fd32-cd3fa8e3dde1	9233	Odranci
00050000-5582-db30-5420-36dcec4e8e8d	2317	Oplotnica
00050000-5582-db30-3845-5ae72f4a2b67	2312	Orehova vas
00050000-5582-db30-47f3-caaa004fb61d	2270	Ormož
00050000-5582-db30-22df-06b101c0df44	1316	Ortnek
00050000-5582-db30-ba4d-81267d2291cd	1337	Osilnica
00050000-5582-db30-3338-4ec6a737822e	8222	Otočec
00050000-5582-db30-ce3b-63dd34d38a2f	2361	Ožbalt
00050000-5582-db30-e78e-84f503f79c0e	2231	Pernica
00050000-5582-db30-d179-a86f1742aeac	2211	Pesnica pri Mariboru
00050000-5582-db30-0a25-f565510fccec	9203	Petrovci
00050000-5582-db30-9cff-7e49aaabd3ac	3301	Petrovče
00050000-5582-db30-18f0-595cfcf8af99	6330	Piran/Pirano
00050000-5582-db30-72f8-9fd7d8092f2a	8255	Pišece
00050000-5582-db30-4731-52e87dab1285	6257	Pivka
00050000-5582-db30-8d07-af71ec16ea18	6232	Planina
00050000-5582-db30-d9ef-a527ea7849af	3225	Planina pri Sevnici
00050000-5582-db30-f735-e32435e20990	6276	Pobegi
00050000-5582-db30-c581-ce06cbbb0867	8312	Podbočje
00050000-5582-db30-75e6-eefbe3df1ec2	5243	Podbrdo
00050000-5582-db30-77f4-02cb22364530	3254	Podčetrtek
00050000-5582-db30-139c-e9dba29b3c0d	2273	Podgorci
00050000-5582-db30-8ee1-918122b55748	6216	Podgorje
00050000-5582-db30-1b44-15cae1d7b07b	2381	Podgorje pri Slovenj Gradcu
00050000-5582-db30-1f02-b71aa5c9517a	6244	Podgrad
00050000-5582-db30-124d-4c85b205fd4c	1414	Podkum
00050000-5582-db30-25df-b570f88e3eeb	2286	Podlehnik
00050000-5582-db30-d05b-bba1d2423729	5272	Podnanos
00050000-5582-db30-6a76-19b49e84fb73	4244	Podnart
00050000-5582-db30-5e87-245875c4ee38	3241	Podplat
00050000-5582-db30-d5c6-eab22f15dba9	3257	Podsreda
00050000-5582-db30-84f1-8ccd5ab0c77b	2363	Podvelka
00050000-5582-db30-a12f-43dd322c0a02	2208	Pohorje
00050000-5582-db30-55c0-b50beeff0ff4	2257	Polenšak
00050000-5582-db30-3f44-92f59cb640d4	1355	Polhov Gradec
00050000-5582-db30-9147-448f0b098381	4223	Poljane nad Škofjo Loko
00050000-5582-db30-f73a-642e979db327	2319	Poljčane
00050000-5582-db30-8fb2-e289458ac946	1272	Polšnik
00050000-5582-db30-cc5b-079ad974b4e1	3313	Polzela
00050000-5582-db30-f1f8-334d9f012978	3232	Ponikva
00050000-5582-db30-c4b3-047c054c95ce	6320	Portorož/Portorose
00050000-5582-db30-2c20-13818059764a	6230	Postojna
00050000-5582-db30-0970-a0391d9bae86	2331	Pragersko
00050000-5582-db30-e2e5-41965cac9dcf	3312	Prebold
00050000-5582-db30-58f2-0903aa4d59e2	4205	Preddvor
00050000-5582-db30-56dc-299085a2ea47	6255	Prem
00050000-5582-db30-4cb4-fd2a83444b37	1352	Preserje
00050000-5582-db30-9116-ac6ab81c1db1	6258	Prestranek
00050000-5582-db30-4ccd-84855df0b033	2391	Prevalje
00050000-5582-db30-065a-a9e6a1237f35	3262	Prevorje
00050000-5582-db30-d1fa-e1798cecec3f	1276	Primskovo 
00050000-5582-db30-bdc9-b1866e1b2eb8	3253	Pristava pri Mestinju
00050000-5582-db30-3c54-1a85036bbc13	9207	Prosenjakovci/Partosfalva
00050000-5582-db30-b0d2-71042d944000	5297	Prvačina
00050000-5582-db30-e4a3-b93f7140e130	2250	Ptuj
00050000-5582-db30-e594-3a14f09dff60	2323	Ptujska Gora
00050000-5582-db30-7866-f38169106ac1	9201	Puconci
00050000-5582-db30-9227-24694f115b17	2327	Rače
00050000-5582-db30-694d-2249d8587a38	1433	Radeče
00050000-5582-db30-d76f-aa4f1eeab1d5	9252	Radenci
00050000-5582-db30-5e10-48fd46278826	2360	Radlje ob Dravi
00050000-5582-db30-c030-8b613ccb542f	1235	Radomlje
00050000-5582-db30-15a8-d0aaf1c963d4	4240	Radovljica
00050000-5582-db30-9541-ab0cc0c0a74c	8274	Raka
00050000-5582-db30-2b7e-78efd76b2077	1381	Rakek
00050000-5582-db30-4596-7a134874bd25	4283	Rateče - Planica
00050000-5582-db30-94db-d1b42b5b38cd	2390	Ravne na Koroškem
00050000-5582-db30-bb84-7daf31437722	9246	Razkrižje
00050000-5582-db30-f501-8b76ce18a17d	3332	Rečica ob Savinji
00050000-5582-db30-b298-afae6a68c4f9	5292	Renče
00050000-5582-db30-c8da-6e07e7f530bc	1310	Ribnica
00050000-5582-db30-5d9c-76e80180d709	2364	Ribnica na Pohorju
00050000-5582-db30-00cf-6953a6b11794	3272	Rimske Toplice
00050000-5582-db30-f04d-5c0dcb5d5afe	1314	Rob
00050000-5582-db30-c884-aeec06833e16	5215	Ročinj
00050000-5582-db30-f7d6-a69a636567b4	3250	Rogaška Slatina
00050000-5582-db30-60bf-da800d3682ad	9262	Rogašovci
00050000-5582-db30-ac95-83d1b4fd6986	3252	Rogatec
00050000-5582-db30-593c-aec5f9e7965a	1373	Rovte
00050000-5582-db30-f127-cc3fc911944e	2342	Ruše
00050000-5582-db30-65c0-2a8d242676fe	1282	Sava
00050000-5582-db30-f9f9-d725efde8817	6333	Sečovlje/Sicciole
00050000-5582-db30-1ef8-3926f72b44a7	4227	Selca
00050000-5582-db30-976d-9b55297d90cf	2352	Selnica ob Dravi
00050000-5582-db30-e609-4be9f6ff4a71	8333	Semič
00050000-5582-db30-c210-5ad642ba938b	8281	Senovo
00050000-5582-db30-03b0-8a777e5ad31e	6224	Senožeče
00050000-5582-db30-f39f-236d96b390ce	8290	Sevnica
00050000-5582-db30-3a8c-b5797858a4bb	6210	Sežana
00050000-5582-db30-001a-f23cbfc89caa	2214	Sladki Vrh
00050000-5582-db30-5fcb-b49518e129b4	5283	Slap ob Idrijci
00050000-5582-db30-be76-35456b35f14e	2380	Slovenj Gradec
00050000-5582-db30-37ce-01085af57fdd	2310	Slovenska Bistrica
00050000-5582-db30-dec5-63dc2341fb37	3210	Slovenske Konjice
00050000-5582-db30-35fd-88384d144ab0	1216	Smlednik
00050000-5582-db30-101f-cc0b7faac1ae	5232	Soča
00050000-5582-db30-5266-79ce4b463898	1317	Sodražica
00050000-5582-db30-5290-fae6b8ba7c8a	3335	Solčava
00050000-5582-db30-4c56-9adf9e04a1c2	5250	Solkan
00050000-5582-db30-1079-f760f9023b2a	4229	Sorica
00050000-5582-db30-95f7-404f31971784	4225	Sovodenj
00050000-5582-db30-5fcc-5813e90a7e01	5281	Spodnja Idrija
00050000-5582-db30-823a-8367cddd1833	2241	Spodnji Duplek
00050000-5582-db30-764a-2e1e27cddb1f	9245	Spodnji Ivanjci
00050000-5582-db30-0130-41734d9bb3e1	2277	Središče ob Dravi
00050000-5582-db30-8965-45e44043b9e3	4267	Srednja vas v Bohinju
00050000-5582-db30-b089-251c2d620c01	8256	Sromlje 
00050000-5582-db30-efa4-9681a209b0b8	5224	Srpenica
00050000-5582-db30-76f3-c855e10049c0	1242	Stahovica
00050000-5582-db30-896e-e424c3f2748f	1332	Stara Cerkev
00050000-5582-db30-6fa7-64a012799d08	8342	Stari trg ob Kolpi
00050000-5582-db30-c210-ad5a6fdd4cad	1386	Stari trg pri Ložu
00050000-5582-db30-1a36-51d9265d70cf	2205	Starše
00050000-5582-db30-ff90-884049450543	2289	Stoperce
00050000-5582-db30-2826-eda536de3a25	8322	Stopiče
00050000-5582-db30-fffb-61443e225f97	3206	Stranice
00050000-5582-db30-e287-4393ee06bbeb	8351	Straža
00050000-5582-db30-34cc-d582095ca735	1313	Struge
00050000-5582-db30-f354-959b5325ebed	8293	Studenec
00050000-5582-db30-3a2d-fa0ada258b4b	8331	Suhor
00050000-5582-db30-09f1-870808017216	2233	Sv. Ana v Slovenskih goricah
00050000-5582-db30-4d2b-de013ac75d06	2235	Sv. Trojica v Slovenskih goricah
00050000-5582-db30-ba99-ac19a375f9ab	2353	Sveti Duh na Ostrem Vrhu
00050000-5582-db30-c0e2-d20fd073ed99	9244	Sveti Jurij ob Ščavnici
00050000-5582-db30-fe22-d82ffaccee9e	3264	Sveti Štefan
00050000-5582-db30-8279-d69889f9822e	2258	Sveti Tomaž
00050000-5582-db30-a730-c57917fde8ef	9204	Šalovci
00050000-5582-db30-4aba-5ebe19ede423	5261	Šempas
00050000-5582-db30-1985-a8ad07b68b1b	5290	Šempeter pri Gorici
00050000-5582-db30-f282-27ce90255a0b	3311	Šempeter v Savinjski dolini
00050000-5582-db30-840a-3d742cb2b3fd	4208	Šenčur
00050000-5582-db30-aed8-24cfe73ae2e6	2212	Šentilj v Slovenskih goricah
00050000-5582-db30-c0ff-864475ed15f1	8297	Šentjanž
00050000-5582-db30-35c0-cf8bfa7ee81e	2373	Šentjanž pri Dravogradu
00050000-5582-db30-2785-ca8e6cd1b8c7	8310	Šentjernej
00050000-5582-db30-2411-f0ab4aa45150	3230	Šentjur
00050000-5582-db30-89ec-da75d4c514b2	3271	Šentrupert
00050000-5582-db30-6696-4d5df090cc0e	8232	Šentrupert
00050000-5582-db30-6a03-5d5f88f16179	1296	Šentvid pri Stični
00050000-5582-db30-1092-bc44c8ab8749	8275	Škocjan
00050000-5582-db30-7ef5-16b6e9587a2f	6281	Škofije
00050000-5582-db30-3e51-cf8d9100f8c6	4220	Škofja Loka
00050000-5582-db30-5b6a-45f2da455a0d	3211	Škofja vas
00050000-5582-db30-11b2-cd9a2f678f9e	1291	Škofljica
00050000-5582-db30-1d8b-cb6771a80772	6274	Šmarje
00050000-5582-db30-fd08-4d2f86b50920	1293	Šmarje - Sap
00050000-5582-db30-4d8d-fc1dd35c859e	3240	Šmarje pri Jelšah
00050000-5582-db30-7c30-46bd6c7d6178	8220	Šmarješke Toplice
00050000-5582-db30-8d30-3077b313565c	2315	Šmartno na Pohorju
00050000-5582-db30-4ab5-9aad4e40c17c	3341	Šmartno ob Dreti
00050000-5582-db30-39dc-5b287037d712	3327	Šmartno ob Paki
00050000-5582-db30-cb88-eea791ade5ad	1275	Šmartno pri Litiji
00050000-5582-db30-df11-d9a8b26cdb08	2383	Šmartno pri Slovenj Gradcu
00050000-5582-db30-49f1-19040be2ea33	3201	Šmartno v Rožni dolini
00050000-5582-db30-74e0-a31ad5d7be77	3325	Šoštanj
00050000-5582-db30-183c-c8c16eb31a5d	6222	Štanjel
00050000-5582-db30-f348-869f9897299c	3220	Štore
00050000-5582-db30-5a96-0213c51088dc	3304	Tabor
00050000-5582-db30-0cca-cfa609a9eb0c	3221	Teharje
00050000-5582-db30-6870-5f81ce649f69	9251	Tišina
00050000-5582-db30-dbe9-cca349f3a494	5220	Tolmin
00050000-5582-db30-26ed-1f7f2fa1dcfa	3326	Topolšica
00050000-5582-db30-01a3-5b5f70f1425b	2371	Trbonje
00050000-5582-db30-c563-d82e74de283b	1420	Trbovlje
00050000-5582-db30-dc76-38fdd6472600	8231	Trebelno 
00050000-5582-db30-2c79-18d04adcce4c	8210	Trebnje
00050000-5582-db30-b947-86c7c033f571	5252	Trnovo pri Gorici
00050000-5582-db30-6a87-90dfdb596ac4	2254	Trnovska vas
00050000-5582-db30-7dd4-b6e741b90c52	1222	Trojane
00050000-5582-db30-0110-c7f1e2fe12a7	1236	Trzin
00050000-5582-db30-9b46-ece7af45c806	4290	Tržič
00050000-5582-db30-752b-b11d3d23f035	8295	Tržišče
00050000-5582-db30-66f6-4244078a1854	1311	Turjak
00050000-5582-db30-f607-0af485a8bdf0	9224	Turnišče
00050000-5582-db30-ff78-7c4566ee455e	8323	Uršna sela
00050000-5582-db30-f9d3-e532b3ed313b	1252	Vače
00050000-5582-db30-46d6-78cd377fbb1b	3320	Velenje 
00050000-5582-db30-e1d7-cd8574537597	3322	Velenje - poštni predali
00050000-5582-db30-56c6-c1cd1a2da0fb	8212	Velika Loka
00050000-5582-db30-e2e4-7d7ad8657035	2274	Velika Nedelja
00050000-5582-db30-e8ba-b4be7ba72e28	9225	Velika Polana
00050000-5582-db30-a047-d42f2ba66137	1315	Velike Lašče
00050000-5582-db30-07dc-2318f4dbb7a1	8213	Veliki Gaber
00050000-5582-db30-16ba-3f2c48dfe051	9241	Veržej
00050000-5582-db30-d171-d3fa5e20d91d	1312	Videm - Dobrepolje
00050000-5582-db30-7b64-2153e1f34339	2284	Videm pri Ptuju
00050000-5582-db30-64ee-6955fcf6cf57	8344	Vinica
00050000-5582-db30-36f8-93545d1c65ef	5271	Vipava
00050000-5582-db30-e49f-395f199a8c5d	4212	Visoko
00050000-5582-db30-6903-841915eb931e	1294	Višnja Gora
00050000-5582-db30-2b03-55a6cf2e1484	3205	Vitanje
00050000-5582-db30-2829-6997642c77ac	2255	Vitomarci
00050000-5582-db30-998d-3a37328b93b8	1217	Vodice
00050000-5582-db30-c604-976d8054a632	3212	Vojnik\t
00050000-5582-db30-9127-de82fed30d61	5293	Volčja Draga
00050000-5582-db30-752d-529c1cfb3893	2232	Voličina
00050000-5582-db30-9f70-42ae386e395a	3305	Vransko
00050000-5582-db30-f90d-f995bfb55e21	6217	Vremski Britof
00050000-5582-db30-4b6f-dca4f1cf96a5	1360	Vrhnika
00050000-5582-db30-cf76-f01643a97dc2	2365	Vuhred
00050000-5582-db30-a136-3dee059c82fb	2367	Vuzenica
00050000-5582-db30-583c-2af6f54cfce5	8292	Zabukovje 
00050000-5582-db30-b6f1-eb25417453bd	1410	Zagorje ob Savi
00050000-5582-db30-7b9a-7eadfefb692f	1303	Zagradec
00050000-5582-db30-a8d6-f19b9aed950c	2283	Zavrč
00050000-5582-db30-bbc9-3f8b0dc48acb	8272	Zdole 
00050000-5582-db30-537b-bd8854873e0c	4201	Zgornja Besnica
00050000-5582-db30-e866-49f8da2eeb57	2242	Zgornja Korena
00050000-5582-db30-53a4-2ce6f64076f1	2201	Zgornja Kungota
00050000-5582-db30-bb8d-9ac531320a1d	2316	Zgornja Ložnica
00050000-5582-db30-80a5-24db8ba3abdd	2314	Zgornja Polskava
00050000-5582-db30-939c-bb96adf517fd	2213	Zgornja Velka
00050000-5582-db30-7f4f-a6dcdb590988	4247	Zgornje Gorje
00050000-5582-db30-bf65-9b111c328ab2	4206	Zgornje Jezersko
00050000-5582-db30-7b6e-5e24bb03b9d2	2285	Zgornji Leskovec
00050000-5582-db30-a977-921d8225253a	1432	Zidani Most
00050000-5582-db30-8e5e-1040773a4ba8	3214	Zreče
00050000-5582-db30-5453-54a7686e066a	4209	Žabnica
00050000-5582-db30-4bb7-6de1425c359a	3310	Žalec
00050000-5582-db30-8d86-c9ab70f5a867	4228	Železniki
00050000-5582-db30-1030-84147d8ba2fe	2287	Žetale
00050000-5582-db30-d617-2d35ff68023b	4226	Žiri
00050000-5582-db30-4c50-23a81fb47396	4274	Žirovnica
00050000-5582-db30-8cf5-d8c7fa6fdd97	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7793388)
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
-- TOC entry 2836 (class 0 OID 7793199)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7793277)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7793400)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7793520)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7793573)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5582-db31-b625-5ad1a14dcd04	00080000-5582-db31-c8cd-507d0438859c	0900	AK
00190000-5582-db31-cfae-82f11c74996e	00080000-5582-db31-8fcb-0c3d482223fb	0987	A
00190000-5582-db31-9ec8-c8f4d5c4406c	00080000-5582-db31-3530-6a4b42f3b8f9	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7793692)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7793755)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7793705)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7793724)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7793429)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5582-db31-dfa0-72fd2ce65bc4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5582-db31-bdda-ee7b7114c3a4	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5582-db31-2a16-9ec62a48f5af	0003	Kazinska	t	84	Kazinska dvorana
00220000-5582-db31-b3ec-dcf56c7e1755	0004	Mali oder	t	24	Mali oder 
00220000-5582-db31-2f54-0dd895943252	0005	Komorni oder	t	15	Komorni oder
00220000-5582-db31-1e1f-ede8ec1dcea7	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5582-db31-ccf7-1148c6fcb1f6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7793373)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7793363)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7793562)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7793497)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7793071)
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
-- TOC entry 2861 (class 0 OID 7793439)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7793109)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5582-db2f-73f4-725bff3b000d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5582-db2f-123b-597191629dc3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5582-db2f-8b2c-d579174eb23d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5582-db2f-470f-146a3c05ce3e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5582-db30-9cd6-1816b5bf5d1a	planer	Planer dogodkov v koledarju	t
00020000-5582-db30-e75a-60155b0fdf15	kadrovska	Kadrovska služba	t
00020000-5582-db30-84bf-632721daec7d	arhivar	Ažuriranje arhivalij	t
00020000-5582-db30-ef64-e174f13f9952	igralec	Igralec	t
00020000-5582-db30-eadb-1239b20bfd6d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7793093)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5582-db30-c412-fbb953e5dcb6	00020000-5582-db2f-8b2c-d579174eb23d
00010000-5582-db30-26ad-be1501c70d1b	00020000-5582-db2f-8b2c-d579174eb23d
\.


--
-- TOC entry 2863 (class 0 OID 7793453)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7793394)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7793344)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7793788)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5582-db30-3146-37a49907853f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5582-db30-2ce9-4f61eb3de539	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5582-db30-5a20-6970391ab3e1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5582-db30-6e55-e9efed26cf8e	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5582-db30-4d84-533856129979	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7793780)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5582-db30-6d8f-a5fd4d630ea3	00230000-5582-db30-6e55-e9efed26cf8e	popa
00240000-5582-db30-d8ee-9b913309604a	00230000-5582-db30-6e55-e9efed26cf8e	oseba
00240000-5582-db30-f495-5f4d4d16f8f4	00230000-5582-db30-2ce9-4f61eb3de539	prostor
00240000-5582-db30-3f5c-816e6b2656d5	00230000-5582-db30-6e55-e9efed26cf8e	besedilo
00240000-5582-db30-66e2-57a13b5be6c7	00230000-5582-db30-6e55-e9efed26cf8e	uprizoritev
00240000-5582-db30-6926-7c9d285ee979	00230000-5582-db30-6e55-e9efed26cf8e	funkcija
00240000-5582-db30-4b18-25a4083da420	00230000-5582-db30-6e55-e9efed26cf8e	tipfunkcije
00240000-5582-db30-528a-5d2c4ee9ef9d	00230000-5582-db30-6e55-e9efed26cf8e	alternacija
00240000-5582-db30-3946-b8b3b8665b59	00230000-5582-db30-3146-37a49907853f	pogodba
00240000-5582-db30-64ad-a6cdbefdc0c5	00230000-5582-db30-6e55-e9efed26cf8e	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7793775)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7793507)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
00270000-5582-db31-94c8-217ba801d803	000e0000-5582-db31-f0bb-a441b8140d71	00080000-5582-db31-9915-8edba35e8666	Nabava kostumov	600.50	20.00	Krila in maske	1
00270000-5582-db31-d668-2d72b2460fce	000e0000-5582-db31-f0bb-a441b8140d71	00080000-5582-db31-9915-8edba35e8666	Zavese	125.70	3.10	Modra in zelena zavesa	2
\.


--
-- TOC entry 2834 (class 0 OID 7793171)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7793350)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5582-db31-f7ef-485b41637b96	00180000-5582-db31-b0d7-98d8d876afa4	000c0000-5582-db31-d01c-3002530e1819	00090000-5582-db31-a67c-35a11af910fa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-db31-987d-2974f416941f	00180000-5582-db31-b0d7-98d8d876afa4	000c0000-5582-db31-14ff-e87a4c40340b	00090000-5582-db31-d0e3-03f8d14c8381	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-db31-6996-00ce859484a1	00180000-5582-db31-b0d7-98d8d876afa4	000c0000-5582-db31-ceff-a90fabbf03d2	00090000-5582-db31-8ec2-5b2ff8e52024	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-db31-67b6-7a294c1226d2	00180000-5582-db31-b0d7-98d8d876afa4	000c0000-5582-db31-58ab-8ec0b48e745a	00090000-5582-db31-3e32-ee871942e918	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-db31-2ec0-39d34f3f78da	00180000-5582-db31-b0d7-98d8d876afa4	000c0000-5582-db31-26ea-2bcf1378f26c	00090000-5582-db31-ab3a-647d0ed01c74	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-db31-019c-0948ccc5bfd4	00180000-5582-db31-936e-cbce39249fc2	\N	00090000-5582-db31-ab3a-647d0ed01c74	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7793551)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5582-db30-c9d1-660f341c600c	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5582-db30-fdf7-3e5c4d5db3d0	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5582-db30-dd72-81c0f9177597	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5582-db30-2a7b-bc757fdfba20	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5582-db30-182a-417b87f13f9a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5582-db30-ca40-ab99b6737e9a	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5582-db30-6243-a13c7e63a9f4	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5582-db30-5be8-66508e020b94	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5582-db30-2099-ff5b0728bda3	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5582-db30-8d67-e1b5fb836782	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5582-db30-2f07-739c3e4b8419	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5582-db30-31ab-58f72a3c1954	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5582-db30-fdfe-db6ebe97b05f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5582-db30-63a0-b78d0dd6aede	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5582-db30-db07-d4166c4c0fcd	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5582-db30-dc91-3d36c1229bcb	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7793744)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5582-db30-3f45-84042e75fa92	01	Velika predstava	f	1.00	1.00
002b0000-5582-db30-d5e7-a958dbfc8b94	02	Mala predstava	f	0.50	0.50
002b0000-5582-db30-f5ac-55fc4a711ec1	03	Mala koprodukcija	t	0.40	1.00
002b0000-5582-db30-6c19-520355225c83	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5582-db30-fd86-9e739ade6fc4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7793234)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7793080)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5582-db30-26ad-be1501c70d1b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRORTCL8T7Y5jKHwokMHtoKiA2LKLFo7Pa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5582-db31-662f-bf184905303e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5582-db31-7c75-346ef66c9858	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5582-db31-52fe-9282b234fa0c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5582-db31-f9f6-1ac15f75fe7f	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5582-db31-1174-9918e43b0b4d	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5582-db31-60a2-f0ea6d25a399	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5582-db31-be88-60976ba75934	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5582-db31-e369-5fdc59c42eff	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5582-db31-35a0-e08223352477	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5582-db30-c412-fbb953e5dcb6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7793608)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5582-db31-f0bb-a441b8140d71	00160000-5582-db31-270d-c6fb5430e305	00150000-5582-db30-c962-8fe5ce971997	00140000-5582-db2f-f59a-51c0adecedf3	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5582-db31-2f54-0dd895943252
000e0000-5582-db31-9af3-96342b170db9	00160000-5582-db31-eb01-0d43481ce478	00150000-5582-db30-b7a7-7d88b2fe249a	00140000-5582-db2f-3b28-41a80aeea77c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5582-db31-1e1f-ede8ec1dcea7
000e0000-5582-db31-b760-db273f1ce0f5	\N	00150000-5582-db30-b7a7-7d88b2fe249a	00140000-5582-db2f-3b28-41a80aeea77c	00190000-5582-db31-cfae-82f11c74996e	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5582-db31-2f54-0dd895943252
000e0000-5582-db31-b698-5daf3e3fc0a7	\N	00150000-5582-db30-b7a7-7d88b2fe249a	00140000-5582-db2f-3b28-41a80aeea77c	00190000-5582-db31-cfae-82f11c74996e	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5582-db31-2f54-0dd895943252
\.


--
-- TOC entry 2844 (class 0 OID 7793296)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5582-db31-f0c2-a75c7610ef0b	000e0000-5582-db31-9af3-96342b170db9	1	
00200000-5582-db31-9be2-12af79d38661	000e0000-5582-db31-9af3-96342b170db9	2	
\.


--
-- TOC entry 2859 (class 0 OID 7793421)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7793490)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7793328)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7793598)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5582-db2f-f59a-51c0adecedf3	01	Drama	drama (SURS 01)
00140000-5582-db2f-4897-137edfc29b39	02	Opera	opera (SURS 02)
00140000-5582-db2f-2be3-56c8189c28fa	03	Balet	balet (SURS 03)
00140000-5582-db2f-9192-6027c6637a84	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5582-db2f-9d9c-cd558364d32c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5582-db2f-3b28-41a80aeea77c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5582-db2f-5876-11ba80e14cb9	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7793480)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5582-db30-2cc5-de4bedc337e5	01	Opera	opera
00150000-5582-db30-48b3-29db6331ca28	02	Opereta	opereta
00150000-5582-db30-7da6-6dd9a9e11bd6	03	Balet	balet
00150000-5582-db30-5a04-e9fd2baff6fa	04	Plesne prireditve	plesne prireditve
00150000-5582-db30-f137-eeee0076d036	05	Lutkovno gledališče	lutkovno gledališče
00150000-5582-db30-7a20-1fc1b92c1578	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5582-db30-0cf6-444025fe3109	07	Biografska drama	biografska drama
00150000-5582-db30-c962-8fe5ce971997	08	Komedija	komedija
00150000-5582-db30-bf8d-289aaf71282a	09	Črna komedija	črna komedija
00150000-5582-db30-6f6e-dddd23af2d0a	10	E-igra	E-igra
00150000-5582-db30-b7a7-7d88b2fe249a	11	Kriminalka	kriminalka
00150000-5582-db30-0d84-f5d06dd4a4c4	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7793134)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7793655)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7793645)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7793550)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7793318)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7793343)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7793260)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7793688)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7793476)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7793294)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7793337)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7793274)
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
-- TOC entry 2499 (class 2606 OID 7793386)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7793413)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7793232)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7793143)
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
-- TOC entry 2414 (class 2606 OID 7793167)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7793123)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7793108)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7793419)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7793452)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7793593)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7793196)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7793220)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7793392)
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
-- TOC entry 2429 (class 2606 OID 7793210)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7793281)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7793404)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7793532)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7793578)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7793703)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7793773)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7793720)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7793741)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7793436)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7793377)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7793368)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7793572)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7793504)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7793079)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7793443)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7793097)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7793117)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7793461)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7793399)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7793349)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7793797)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7793785)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7793779)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7793517)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7793176)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7793359)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7793561)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7793754)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7793245)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7793092)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7793624)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7793303)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7793427)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7793495)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7793332)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7793606)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7793488)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7793325)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7793518)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7793519)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7793198)
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
-- TOC entry 2512 (class 1259 OID 7793420)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7793406)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7793405)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7793304)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7793477)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7793479)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7793478)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7793276)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7793275)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7793595)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7793596)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7793597)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7793743)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7793742)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7793629)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7793626)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7793630)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7793628)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7793627)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7793247)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7793246)
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
-- TOC entry 2412 (class 1259 OID 7793170)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7793444)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7793338)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7793124)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7793125)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7793464)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7793463)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7793462)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7793282)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7793284)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7793283)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7793787)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7793372)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7793370)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7793369)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7793371)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7793098)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7793099)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7793428)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7793393)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7793505)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7793506)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7793689)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7793690)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7793691)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7793212)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7793211)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7793213)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7793774)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7793533)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7793534)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7793659)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7793661)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7793657)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7793660)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7793658)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7793496)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7793381)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7793380)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7793378)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7793379)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7793647)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7793646)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7793704)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7793295)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7793145)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7793144)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7793177)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7793178)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7793362)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7793361)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7793360)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7793723)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7793721)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7793722)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7793327)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7793323)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7793320)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7793321)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7793319)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7793324)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7793322)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7793197)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7793261)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7793263)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7793262)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7793264)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7793387)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7793594)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7793625)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7793168)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7793169)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7793489)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7793798)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7793233)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7793786)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7793438)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7793437)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7793656)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7793221)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7793607)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7793579)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7793580)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7793118)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7793326)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7793934)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7793919)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7793924)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7793944)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7793914)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7793939)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7793929)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7794089)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7794094)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7793849)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7794029)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7794024)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7794019)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7793909)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7794059)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7794069)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7794064)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7793884)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7793879)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7794009)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7794114)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7794119)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7794124)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7794229)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7794224)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7794144)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7794129)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7794149)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7794139)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7794134)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7793874)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7793869)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7793834)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7793829)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7794039)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7793949)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7793809)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7793814)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7794054)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7794049)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7794044)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7793889)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7793899)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7793894)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7794239)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7793984)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7793974)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7793969)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7793979)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7793799)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7793804)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7794034)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7794014)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7794079)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7794084)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7794189)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7794194)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7794199)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7793859)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7793854)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7793864)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7794234)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7794099)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7794104)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7794174)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7794184)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7794164)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7794179)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7794169)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7794074)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7794004)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7793999)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7793989)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7793994)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7794159)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7794154)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7794204)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7793904)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7794109)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7793824)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7793819)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7793839)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7793844)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7793964)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7793959)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7793954)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7794219)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7794209)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7794214)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-18 16:52:34 CEST

--
-- PostgreSQL database dump complete
--

