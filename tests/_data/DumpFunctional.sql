--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-16 13:49:27 CEST

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
-- TOC entry 180 (class 1259 OID 7416584)
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
-- TOC entry 227 (class 1259 OID 7417106)
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
-- TOC entry 226 (class 1259 OID 7417089)
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
-- TOC entry 219 (class 1259 OID 7416993)
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
-- TOC entry 194 (class 1259 OID 7416763)
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
-- TOC entry 197 (class 1259 OID 7416797)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7416706)
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
-- TOC entry 228 (class 1259 OID 7417120)
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
-- TOC entry 213 (class 1259 OID 7416923)
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
-- TOC entry 192 (class 1259 OID 7416743)
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
-- TOC entry 196 (class 1259 OID 7416791)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7416723)
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
-- TOC entry 202 (class 1259 OID 7416840)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7416865)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7416680)
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
-- TOC entry 181 (class 1259 OID 7416593)
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
-- TOC entry 182 (class 1259 OID 7416604)
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
-- TOC entry 177 (class 1259 OID 7416558)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7416577)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7416872)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7416903)
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
-- TOC entry 223 (class 1259 OID 7417039)
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
-- TOC entry 184 (class 1259 OID 7416637)
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
-- TOC entry 186 (class 1259 OID 7416672)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7416846)
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
-- TOC entry 185 (class 1259 OID 7416657)
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
-- TOC entry 191 (class 1259 OID 7416735)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7416858)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7416978)
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
-- TOC entry 222 (class 1259 OID 7417031)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7417150)
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
-- TOC entry 233 (class 1259 OID 7417213)
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
-- TOC entry 230 (class 1259 OID 7417163)
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
-- TOC entry 231 (class 1259 OID 7417182)
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
-- TOC entry 209 (class 1259 OID 7416887)
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
-- TOC entry 201 (class 1259 OID 7416831)
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
-- TOC entry 200 (class 1259 OID 7416821)
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
-- TOC entry 221 (class 1259 OID 7417020)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7416955)
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
-- TOC entry 174 (class 1259 OID 7416529)
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
-- TOC entry 173 (class 1259 OID 7416527)
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
-- TOC entry 210 (class 1259 OID 7416897)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7416567)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7416551)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7416911)
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
-- TOC entry 204 (class 1259 OID 7416852)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7416802)
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
-- TOC entry 236 (class 1259 OID 7417246)
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
-- TOC entry 235 (class 1259 OID 7417238)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7417233)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7416965)
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
-- TOC entry 183 (class 1259 OID 7416629)
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
-- TOC entry 199 (class 1259 OID 7416808)
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
-- TOC entry 220 (class 1259 OID 7417009)
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
-- TOC entry 232 (class 1259 OID 7417202)
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
-- TOC entry 188 (class 1259 OID 7416692)
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
-- TOC entry 175 (class 1259 OID 7416538)
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
-- TOC entry 225 (class 1259 OID 7417066)
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
-- TOC entry 193 (class 1259 OID 7416754)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7416879)
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
-- TOC entry 215 (class 1259 OID 7416948)
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
-- TOC entry 195 (class 1259 OID 7416786)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7417056)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7416938)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7416532)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7416584)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7417106)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5580-0d46-95ec-6a18f6b2bbd7	000d0000-5580-0d46-9fc0-3aec8684dfed	\N	00090000-5580-0d46-4a4a-84b876485e42	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-0d46-ec7b-3c4360ff05c1	000d0000-5580-0d46-db35-4079ef5070f6	\N	00090000-5580-0d46-2f8d-0f919ebd9a7e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-0d46-6c66-1132df9d91ba	000d0000-5580-0d46-294b-629942fff403	\N	00090000-5580-0d46-00fb-c7258d4d2688	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-0d46-3fe5-067aab1ed136	000d0000-5580-0d46-31f4-b7f3b38cb653	\N	00090000-5580-0d46-77d8-f8280829ea43	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-0d46-3c70-2e41f30e6a6c	000d0000-5580-0d46-fa3f-b2c9a8eb5e30	\N	00090000-5580-0d46-140d-5aa84548c7aa	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5580-0d46-8c34-930b1db224b6	000d0000-5580-0d46-866d-439c1a643c0c	\N	00090000-5580-0d46-2f8d-0f919ebd9a7e	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7417089)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7416993)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5580-0d45-b247-f4aacba63c5a	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5580-0d45-a9dc-ba347ac619de	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5580-0d45-7090-eced961e360a	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7416763)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5580-0d46-d3f6-3739cc64539e	\N	\N	00200000-5580-0d46-ce1b-8ee30d2c4ba7	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5580-0d46-4de9-0e4b384907ab	\N	\N	00200000-5580-0d46-6728-e4cb7b47ef68	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5580-0d46-17de-18af7de89fb3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5580-0d46-75ca-7522f76dcee5	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5580-0d46-073f-be1e80ce45a8	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7416797)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7416706)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5580-0d44-cee2-fa9edf8212f5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5580-0d44-5bb9-4c66e9e78362	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5580-0d44-eaa1-636077650df3	AL	ALB	008	Albania 	Albanija	\N
00040000-5580-0d44-227b-691088f1f8df	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5580-0d44-748e-745974bda495	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5580-0d44-b88e-04e39fd2719e	AD	AND	020	Andorra 	Andora	\N
00040000-5580-0d44-67b6-39ede0fe1622	AO	AGO	024	Angola 	Angola	\N
00040000-5580-0d44-ad1d-87e860d106cb	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5580-0d44-78d1-f192c8c9e1b3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5580-0d44-14b8-1284db22044c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5580-0d44-572c-9ac765dd0e33	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5580-0d44-6958-dc0363568d00	AM	ARM	051	Armenia 	Armenija	\N
00040000-5580-0d44-fb64-a94941cc656b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5580-0d44-cba0-988825408e93	AU	AUS	036	Australia 	Avstralija	\N
00040000-5580-0d44-73db-471d0aeffa88	AT	AUT	040	Austria 	Avstrija	\N
00040000-5580-0d44-085f-8e4edcd6f237	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5580-0d44-5865-671e03929a60	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5580-0d44-b5db-9fea56947f73	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5580-0d44-3bf9-93d99616bc83	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5580-0d44-8fb0-c23d1656c80e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5580-0d44-c460-4ee85d298b27	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5580-0d44-b810-79572da7e0c0	BE	BEL	056	Belgium 	Belgija	\N
00040000-5580-0d44-3891-1a7f14fda891	BZ	BLZ	084	Belize 	Belize	\N
00040000-5580-0d44-c117-761b23e24fc8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5580-0d44-3b73-8548b2cd3214	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5580-0d44-3598-a0e6f13ddbea	BT	BTN	064	Bhutan 	Butan	\N
00040000-5580-0d44-6e44-55be74c23ea7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5580-0d44-b029-c5a154453e0c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5580-0d44-94fc-7413e06c26b8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5580-0d44-2435-34d75b749ecd	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5580-0d44-800e-2a6001b4e1e7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5580-0d44-37f6-5a604758231f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5580-0d44-c33e-de0970e39ced	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5580-0d44-3a98-e9536538b721	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5580-0d44-6950-6a7fec783c3a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5580-0d44-f96a-b430eee7c7f4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5580-0d44-b55e-a4933df5f6dd	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5580-0d44-b2c3-3d2d32ddc60e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5580-0d44-8070-8ad6b2a83bb3	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5580-0d44-ea1f-e2612c093bfc	CA	CAN	124	Canada 	Kanada	\N
00040000-5580-0d44-2722-b10c2fa42e34	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5580-0d44-d826-436b7e14954f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5580-0d44-7767-ba766c4e0d1a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5580-0d44-66d0-b029f65332da	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5580-0d44-474e-ebdeae8166de	CL	CHL	152	Chile 	Čile	\N
00040000-5580-0d44-45a6-000789cc97c8	CN	CHN	156	China 	Kitajska	\N
00040000-5580-0d44-1a3f-81af350053cb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5580-0d44-0aab-1d5b926f5e20	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5580-0d44-a3e4-9290643f7ce2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5580-0d44-bdf1-5a5235b50706	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5580-0d44-39f1-b26607237d6c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5580-0d44-7491-642c54ad1eeb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5580-0d44-e2c5-50e89814e199	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5580-0d44-864b-802f949454ec	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5580-0d44-f5d4-6268db281d0d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5580-0d44-7018-32a93c871fa3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5580-0d44-97aa-9eba50b4699e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5580-0d44-38e6-6e8aa15c9221	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5580-0d44-fe00-094e459c8028	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5580-0d44-9179-19807a9c830b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5580-0d44-1996-4fb622c77525	DK	DNK	208	Denmark 	Danska	\N
00040000-5580-0d44-ecc2-ebc0a21f80bf	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5580-0d44-9b59-57888e867ffd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5580-0d44-63df-2442b87c3331	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5580-0d44-57bd-5958a0375b4f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5580-0d44-8b78-382e4b91588e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5580-0d44-dc7a-51b898f1fb29	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5580-0d44-53b4-d501f317078d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5580-0d44-b9dd-7236877e3940	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5580-0d44-05d8-3ff4fc882f4f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5580-0d44-b12c-6a99004a566e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5580-0d44-a8d7-7ed4ce87118f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5580-0d44-fbe8-e0a169f0e274	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5580-0d44-fd32-00f7b5513643	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5580-0d44-074b-9780b2bd5e84	FI	FIN	246	Finland 	Finska	\N
00040000-5580-0d44-a265-7425da1ee8eb	FR	FRA	250	France 	Francija	\N
00040000-5580-0d44-d0a0-64d7a030af10	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5580-0d44-9857-96342b1f46a0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5580-0d44-725e-d8fedd208dd7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5580-0d44-dbc9-192268877adc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5580-0d44-c90c-ab39fd09ab7e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5580-0d44-502a-077a8c4204db	GM	GMB	270	Gambia 	Gambija	\N
00040000-5580-0d44-73e6-9f47683b6088	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5580-0d44-1876-63a0d448ce07	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5580-0d44-6fec-bf30b4c4308e	GH	GHA	288	Ghana 	Gana	\N
00040000-5580-0d44-884a-27f484e29cc8	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5580-0d44-ee71-c413ebbbdb51	GR	GRC	300	Greece 	Grčija	\N
00040000-5580-0d44-6426-8ad406276101	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5580-0d44-4557-fea3f64562c5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5580-0d44-7579-e96747110269	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5580-0d44-e3fc-ecbf8a3cf4c2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5580-0d44-9f95-84e73aec47d2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5580-0d44-1f92-f5717559bc1b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5580-0d44-3089-e1931def4b65	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5580-0d44-cd71-6be93e1241dc	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5580-0d44-0f7d-9f5221389645	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5580-0d44-72ea-06d43c00770b	HT	HTI	332	Haiti 	Haiti	\N
00040000-5580-0d44-223f-07ec7d80d14b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5580-0d44-aefd-969b4f760fc5	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5580-0d44-b211-ca6de5baaa27	HN	HND	340	Honduras 	Honduras	\N
00040000-5580-0d44-d7ea-37c45d9ba164	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5580-0d44-1416-83ea46d9f1c3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5580-0d44-89c3-0dce08432355	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5580-0d44-2da5-a8e5b2e3b674	IN	IND	356	India 	Indija	\N
00040000-5580-0d44-f356-98f723c0d33d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5580-0d44-c8b6-6bb2151e7b5a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5580-0d44-a5b3-59f6e6f335df	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5580-0d44-cbba-109ba042822d	IE	IRL	372	Ireland 	Irska	\N
00040000-5580-0d44-4a55-b56512ac8ab4	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5580-0d44-c301-574ff6d0c7ab	IL	ISR	376	Israel 	Izrael	\N
00040000-5580-0d44-582e-2aea64f192dc	IT	ITA	380	Italy 	Italija	\N
00040000-5580-0d44-cb22-e63a16dbdd99	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5580-0d44-ea50-12a6e9f71d54	JP	JPN	392	Japan 	Japonska	\N
00040000-5580-0d44-02e0-05654539fd63	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5580-0d44-a977-da86f453f4a6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5580-0d44-eece-f3d005ce7dbb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5580-0d44-96b6-fd13d9876429	KE	KEN	404	Kenya 	Kenija	\N
00040000-5580-0d44-5529-e38524ebb89e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5580-0d44-7a44-b87887e983cb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5580-0d44-ed0d-deed9fcd22aa	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5580-0d44-a0f6-18242e0a39eb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5580-0d44-13b8-1e9c5dba6305	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5580-0d44-3b2d-724979534537	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5580-0d44-6aad-f0195554e667	LV	LVA	428	Latvia 	Latvija	\N
00040000-5580-0d44-6c42-e254c45753eb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5580-0d44-2613-df3b0d56c576	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5580-0d44-c656-6b72f898799a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5580-0d44-d3a7-58eecff39591	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5580-0d44-0703-b108c2fd2b53	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5580-0d44-6fdd-5c24caf11730	LT	LTU	440	Lithuania 	Litva	\N
00040000-5580-0d44-cd86-9193e221c570	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5580-0d44-283d-fecccf8a20a5	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5580-0d44-8055-d1f5ec3badc8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5580-0d44-fcc7-5295d7313e29	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5580-0d44-1915-15a42405ca0a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5580-0d44-54c8-e86e59ca4385	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5580-0d44-2825-d023b4f3efc4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5580-0d44-d3fa-0e3ba83a6dac	ML	MLI	466	Mali 	Mali	\N
00040000-5580-0d44-a64e-accd1c52bb3b	MT	MLT	470	Malta 	Malta	\N
00040000-5580-0d44-3552-180afcd411c3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5580-0d44-b4cc-858f9c10dfdc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5580-0d44-7ea3-f4d45f63150b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5580-0d44-7778-ce8f264745bc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5580-0d44-1c09-28009e7f9133	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5580-0d44-7c51-ed6090bc37f8	MX	MEX	484	Mexico 	Mehika	\N
00040000-5580-0d44-295e-21eadc8f8bbb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5580-0d44-49e7-c148060e05f4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5580-0d44-18a2-3bcc2f512abf	MC	MCO	492	Monaco 	Monako	\N
00040000-5580-0d44-92a3-ce79b91a6b4e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5580-0d44-7936-42cf71aa6e1c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5580-0d44-140c-001c0001ef1f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5580-0d44-c4e1-e0daf7685a7a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5580-0d44-bcce-c539f2465b52	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5580-0d44-b525-07e38a0fe74f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5580-0d44-1d6e-d9576a311426	NA	NAM	516	Namibia 	Namibija	\N
00040000-5580-0d44-1dab-eb4eb1373f83	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5580-0d44-3e55-76794abb21e4	NP	NPL	524	Nepal 	Nepal	\N
00040000-5580-0d44-2b28-be198d59635f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5580-0d44-f713-7504f3d59df9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5580-0d44-6854-a94a53966fd8	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5580-0d44-6f2e-3f915a36ef6e	NE	NER	562	Niger 	Niger 	\N
00040000-5580-0d44-c79c-710fa864691d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5580-0d44-53ab-4c0dd69d84d1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5580-0d44-b6ab-b573a9bfe9a7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5580-0d44-1cae-53e8898e7c34	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5580-0d44-44b0-0cc8b7c3b176	NO	NOR	578	Norway 	Norveška	\N
00040000-5580-0d44-5284-2875b10d95e4	OM	OMN	512	Oman 	Oman	\N
00040000-5580-0d44-3eba-1bccebf2eae6	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5580-0d44-5c84-58f954afd845	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5580-0d44-621d-72cf0c66e1c9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5580-0d44-83ff-e8ff5e4a6636	PA	PAN	591	Panama 	Panama	\N
00040000-5580-0d44-a8e7-2a066f48d5c9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5580-0d44-b01c-a6b7992249f2	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5580-0d44-d70b-a14de5c0bb98	PE	PER	604	Peru 	Peru	\N
00040000-5580-0d44-1040-f49441acadc9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5580-0d44-12b1-8f80d769aa0e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5580-0d44-15ee-b43360de9208	PL	POL	616	Poland 	Poljska	\N
00040000-5580-0d44-de6a-35c9007c00d3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5580-0d44-2e26-d8ba3d888303	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5580-0d44-468f-dc45dd7b4eb7	QA	QAT	634	Qatar 	Katar	\N
00040000-5580-0d44-30b3-d81354208bee	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5580-0d44-c2c8-4020b4fa32b9	RO	ROU	642	Romania 	Romunija	\N
00040000-5580-0d44-7c25-5b3de72d9546	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5580-0d44-76b4-8e33c10672f5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5580-0d44-7d4c-cc20c318a5c3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5580-0d44-06b4-c49b0bd41bb1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5580-0d44-b881-1d1e2e2332e2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5580-0d44-07fb-198668ff5d79	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5580-0d44-8b46-9f984a1a380c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5580-0d44-562e-ad754fd57e0c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5580-0d44-fd00-ca5a827acda9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5580-0d44-0035-190bcdef1795	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5580-0d44-49e8-9a2470669e8c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5580-0d44-7d3d-2f5eaf90133b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5580-0d44-a7f7-bc36422ffdd6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5580-0d44-9bc6-2d235930334c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5580-0d44-0c4a-c75675a06830	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5580-0d44-1e43-5ad2a34ccb75	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5580-0d44-00e0-f01f99facc11	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5580-0d44-ba23-c2bbb49cfcdc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5580-0d44-6a3d-4867a221d1f0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5580-0d44-41cc-3edf85f93e28	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5580-0d44-faaf-5de6615237fe	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5580-0d44-2d1a-8ae658cdb682	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5580-0d44-7c08-596402fe9dfe	SO	SOM	706	Somalia 	Somalija	\N
00040000-5580-0d44-c543-65cfb99c1b24	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5580-0d44-6b66-5298e07e4a67	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5580-0d44-5d4a-85156de38f43	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5580-0d44-a43c-c067a712fed7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5580-0d44-d2ab-62a072ffd590	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5580-0d44-9c33-88e11c19f82f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5580-0d44-7a16-8c3e8d90cdad	SR	SUR	740	Suriname 	Surinam	\N
00040000-5580-0d44-8568-3bb34f66c46e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5580-0d44-6f30-8a630eb1fa03	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5580-0d44-7ce7-3123db1920d8	SE	SWE	752	Sweden 	Švedska	\N
00040000-5580-0d44-7317-56e127fc134d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5580-0d44-444e-bbfa235d42aa	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5580-0d44-b3a9-d92656c6b673	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5580-0d44-5636-8911d950db6c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5580-0d44-9584-16ded2cae4fe	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5580-0d44-66c1-20fe84fe92f5	TH	THA	764	Thailand 	Tajska	\N
00040000-5580-0d44-b72a-e70c5c2cee63	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5580-0d44-8bc5-3be75e4be615	TG	TGO	768	Togo 	Togo	\N
00040000-5580-0d44-2809-9653f56ab74d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5580-0d44-24bf-b299ead9a4b1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5580-0d44-da6c-2bbac7a94db2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5580-0d44-c490-3a6ead8bb330	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5580-0d44-b077-b72637e907b2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5580-0d44-05d2-0564d8ad12e2	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5580-0d44-6d72-7e41b85e3677	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5580-0d44-6beb-7a023411cad5	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5580-0d44-61ab-8b464a8d26ff	UG	UGA	800	Uganda 	Uganda	\N
00040000-5580-0d44-9e9d-e11a0ffd956f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5580-0d44-0633-575f23338114	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5580-0d44-f678-ff6cfab78d98	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5580-0d44-ace8-6988700488c8	US	USA	840	United States 	Združene države Amerike	\N
00040000-5580-0d44-7d99-1996b3d18d78	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5580-0d44-63cd-f3b148b4385f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5580-0d44-d561-61b58c985800	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5580-0d44-0b53-40584abc6622	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5580-0d44-8cd1-6069f5428ea3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5580-0d44-8b11-a3034b702e9f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5580-0d44-0cd8-139ffd1a41d4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5580-0d44-d958-7e9571bce5a9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5580-0d44-e4e9-3f83dd14bbe7	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5580-0d44-08df-24896a771077	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5580-0d44-75a0-65e9ddec6f2e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5580-0d44-4421-9930180bbb1b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5580-0d44-92e1-9cac98ab25fc	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7417120)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7416923)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5580-0d46-e3a5-40dfbdbf7a20	000e0000-5580-0d46-f34d-b439088c4ed8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5580-0d44-8e3e-3c857d7f8c70
000d0000-5580-0d46-9fc0-3aec8684dfed	000e0000-5580-0d46-f34d-b439088c4ed8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5580-0d44-8e3e-3c857d7f8c70
000d0000-5580-0d46-db35-4079ef5070f6	000e0000-5580-0d46-f34d-b439088c4ed8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5580-0d44-98e1-d548a7965bc5
000d0000-5580-0d46-294b-629942fff403	000e0000-5580-0d46-f34d-b439088c4ed8	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5580-0d44-5411-4590d3053996
000d0000-5580-0d46-31f4-b7f3b38cb653	000e0000-5580-0d46-f34d-b439088c4ed8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5580-0d44-5411-4590d3053996
000d0000-5580-0d46-fa3f-b2c9a8eb5e30	000e0000-5580-0d46-f34d-b439088c4ed8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5580-0d44-5411-4590d3053996
000d0000-5580-0d46-866d-439c1a643c0c	000e0000-5580-0d46-f34d-b439088c4ed8	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5580-0d44-8e3e-3c857d7f8c70
\.


--
-- TOC entry 2843 (class 0 OID 7416743)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7416791)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7416723)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5580-0d46-544f-f1d38c62b87c	00080000-5580-0d46-4196-53eada428ab9	00090000-5580-0d46-4a4a-84b876485e42	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7416840)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7416865)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7416680)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5580-0d45-6c99-be8065bf7051	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5580-0d45-a239-540a070a2494	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5580-0d45-ff5c-4182f4811fab	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5580-0d45-5c40-be5a0199bd0d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5580-0d45-8443-1f2f2a764472	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5580-0d45-c954-b19958f7bc24	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5580-0d45-c521-2edd700c8583	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5580-0d45-b9f5-65b5956e28c7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5580-0d45-ac45-691cf22188c0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5580-0d45-2e7c-58a7f705dcbc	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5580-0d45-783a-3cc40b9de0da	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5580-0d45-eea8-46e7f0d0d38a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5580-0d45-edcb-8919aa8342d6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5580-0d45-8856-589b77f945d9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5580-0d45-edd4-24639815288f	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5580-0d45-578a-32aa616475ed	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2832 (class 0 OID 7416593)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5580-0d45-935b-56c1374f8b16	00000000-5580-0d45-8443-1f2f2a764472	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5580-0d45-e713-f62f46be0630	00000000-5580-0d45-8443-1f2f2a764472	00010000-5580-0d45-fff9-59b940e458a1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5580-0d45-d086-37567561d903	00000000-5580-0d45-c954-b19958f7bc24	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7416604)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5580-0d46-9aaf-d8e91bbf3127	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5580-0d46-77d8-f8280829ea43	00010000-5580-0d46-8895-888f31506bec	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5580-0d46-00fb-c7258d4d2688	00010000-5580-0d45-1a66-03ab988e2f3c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5580-0d46-0c85-f44ec0254357	00010000-5580-0d46-99bf-79af37662b2a	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5580-0d46-28a8-09e5b5e420b4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5580-0d46-9645-e5a9f79d0516	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5580-0d46-e48a-95979cbf8cdd	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5580-0d46-1691-de2c5d8321b1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5580-0d46-4a4a-84b876485e42	00010000-5580-0d46-8b3f-d011def02cc5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5580-0d46-2f8d-0f919ebd9a7e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5580-0d46-5170-e1d186f4a201	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5580-0d46-140d-5aa84548c7aa	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5580-0d46-a3cd-c84cf9475646	00010000-5580-0d46-0321-6153281fb3f7	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7416558)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5580-0d44-94ab-06c333d34b6a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5580-0d44-3cd9-89370edcd992	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5580-0d44-680d-b972152c747c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5580-0d44-f070-0a79617fcef4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5580-0d44-a862-5c15db6e97ec	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5580-0d44-e267-eedfdfbbb983	Abonma-read	Abonma - branje	f
00030000-5580-0d44-92d0-223ad8a5f2f7	Abonma-write	Abonma - spreminjanje	f
00030000-5580-0d44-1873-c9fa6adccc69	Alternacija-read	Alternacija - branje	f
00030000-5580-0d44-83de-b420095945f2	Alternacija-write	Alternacija - spreminjanje	f
00030000-5580-0d44-1bdc-c15b96d465ba	Arhivalija-read	Arhivalija - branje	f
00030000-5580-0d44-403b-aee1584eda1c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5580-0d44-ffa6-16523d67773c	Besedilo-read	Besedilo - branje	f
00030000-5580-0d44-ff79-5f624690e377	Besedilo-write	Besedilo - spreminjanje	f
00030000-5580-0d44-d3e3-a0040e325766	DogodekIzven-read	DogodekIzven - branje	f
00030000-5580-0d44-daca-2c94d56d7ecd	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5580-0d44-abdc-04699b924326	Dogodek-read	Dogodek - branje	f
00030000-5580-0d44-8be0-84feab4a7613	Dogodek-write	Dogodek - spreminjanje	f
00030000-5580-0d44-f4d7-54f9b0ab1340	Drzava-read	Drzava - branje	f
00030000-5580-0d44-2449-bb37e628fb6e	Drzava-write	Drzava - spreminjanje	f
00030000-5580-0d44-8eb8-292f3c85a599	Funkcija-read	Funkcija - branje	f
00030000-5580-0d44-54ac-8c39d1b87f97	Funkcija-write	Funkcija - spreminjanje	f
00030000-5580-0d44-1351-6ae9379c8926	Gostovanje-read	Gostovanje - branje	f
00030000-5580-0d44-5961-e2ef0507e1ad	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5580-0d44-63a6-09b8a733f3db	Gostujoca-read	Gostujoca - branje	f
00030000-5580-0d44-fc2d-bf2715586b4b	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5580-0d44-a2d5-3a6bd87f0c46	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5580-0d44-a74f-e88e5cf84f52	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5580-0d44-98d2-c2be2e1de6fd	Kupec-read	Kupec - branje	f
00030000-5580-0d44-6356-e6f53f085400	Kupec-write	Kupec - spreminjanje	f
00030000-5580-0d44-abad-299a9a3a79f5	NacinPlacina-read	NacinPlacina - branje	f
00030000-5580-0d44-dceb-383ea09da239	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5580-0d44-d78d-cebf695fc5ce	Option-read	Option - branje	f
00030000-5580-0d44-38a2-f8e98ec7d520	Option-write	Option - spreminjanje	f
00030000-5580-0d44-e73b-852b80f4ff76	OptionValue-read	OptionValue - branje	f
00030000-5580-0d44-5de8-0358ac4aa525	OptionValue-write	OptionValue - spreminjanje	f
00030000-5580-0d44-6fcd-75d54f2d96f0	Oseba-read	Oseba - branje	f
00030000-5580-0d44-15b9-d524d0d99c92	Oseba-write	Oseba - spreminjanje	f
00030000-5580-0d44-a49f-add4a98e1c37	Permission-read	Permission - branje	f
00030000-5580-0d44-e866-de6ab862d7f2	Permission-write	Permission - spreminjanje	f
00030000-5580-0d44-fba2-f4f589ccecef	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5580-0d44-fe99-152eb2ded769	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5580-0d44-37d5-85e629b13582	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5580-0d44-4efc-3f24b713b395	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5580-0d44-90ee-465d787473e8	Pogodba-read	Pogodba - branje	f
00030000-5580-0d44-18c0-e9ac0a0a1ad6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5580-0d44-9807-3c974fa6b15a	Popa-read	Popa - branje	f
00030000-5580-0d44-3211-c1f4da2f2c9a	Popa-write	Popa - spreminjanje	f
00030000-5580-0d44-252e-036d854afea8	Posta-read	Posta - branje	f
00030000-5580-0d44-faad-9647e601df4c	Posta-write	Posta - spreminjanje	f
00030000-5580-0d44-9778-1e2402ce7e82	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5580-0d44-8763-663bf9f5ea00	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5580-0d44-fbab-e7984f6d15e7	PostniNaslov-read	PostniNaslov - branje	f
00030000-5580-0d44-e67b-04b5a20cf3c5	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5580-0d44-8b33-0641c0a92554	Predstava-read	Predstava - branje	f
00030000-5580-0d44-c9ab-514b081a90d1	Predstava-write	Predstava - spreminjanje	f
00030000-5580-0d44-dc77-d381af81a674	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5580-0d44-66f6-d1cc2702a327	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5580-0d44-2f08-f6f762cc8799	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5580-0d44-f538-4d352c39f191	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5580-0d44-349f-3f1ed75750e2	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5580-0d44-91ce-30035f7a9195	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5580-0d44-0381-ecc32ba5bcf3	ProgramDela-read	ProgramDela - branje	f
00030000-5580-0d44-29f9-6bf20e581bf2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5580-0d44-b16c-f2c21acc33b6	ProgramFestival-read	ProgramFestival - branje	f
00030000-5580-0d44-32c1-5ebb6facf160	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5580-0d44-b09d-5230755fc470	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5580-0d44-0ba0-9db601ae7585	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5580-0d44-99b3-0e3ad80a74da	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5580-0d44-0351-9cc1985189f4	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5580-0d44-3adf-6240517b5f18	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5580-0d44-cde6-619739f754a4	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5580-0d44-d450-3a9b2a83cc66	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5580-0d44-fd27-51f64674bbdf	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5580-0d44-9eff-f58cda4d7db6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5580-0d44-99df-be25fbc21b16	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5580-0d44-12e6-8eba0386fd3a	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5580-0d44-7f66-ffc921171d38	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5580-0d44-cbe4-10dfc08bb7b5	ProgramRazno-read	ProgramRazno - branje	f
00030000-5580-0d44-158f-7a5b6d2f6211	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5580-0d44-b348-eea0df132123	Prostor-read	Prostor - branje	f
00030000-5580-0d44-3374-a59c6096bc9a	Prostor-write	Prostor - spreminjanje	f
00030000-5580-0d44-7337-3ee4dfda21bc	Racun-read	Racun - branje	f
00030000-5580-0d44-5e13-5fad1598f706	Racun-write	Racun - spreminjanje	f
00030000-5580-0d44-01c2-2e4bc393ff13	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5580-0d44-0fef-428a4fe3bc0a	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5580-0d44-3a08-418fd852c232	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5580-0d44-c607-6592d444367f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5580-0d44-7a5e-1c5693827a3a	Rekvizit-read	Rekvizit - branje	f
00030000-5580-0d44-bda1-272fc0e2431b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5580-0d44-ccab-acff6d94466b	Revizija-read	Revizija - branje	f
00030000-5580-0d44-4cb4-30fb0796dc75	Revizija-write	Revizija - spreminjanje	f
00030000-5580-0d44-95ec-01e35c5c56b5	Rezervacija-read	Rezervacija - branje	f
00030000-5580-0d44-3707-923b679edb40	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5580-0d44-c534-fc62a3da5901	Role-read	Role - branje	f
00030000-5580-0d44-6dbd-5d9e279438c6	Role-write	Role - spreminjanje	f
00030000-5580-0d44-56c1-be7ae843d958	SedezniRed-read	SedezniRed - branje	f
00030000-5580-0d44-5f5f-f229f61f53ac	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5580-0d44-aca2-3d6419928cb5	Sedez-read	Sedez - branje	f
00030000-5580-0d44-badf-6c4f889006a4	Sedez-write	Sedez - spreminjanje	f
00030000-5580-0d44-ae0b-753a0b7602c8	Sezona-read	Sezona - branje	f
00030000-5580-0d44-1a8e-eb6f62684b32	Sezona-write	Sezona - spreminjanje	f
00030000-5580-0d44-b547-fa0377d8f22e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5580-0d44-5fce-f37d8e2b712c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5580-0d44-a6f1-1421172a80f6	Stevilcenje-read	Stevilcenje - branje	f
00030000-5580-0d44-c753-d7ae8e69b5b3	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5580-0d44-d5f8-4f69ee817aed	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5580-0d44-a7f0-f4db65eeed92	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5580-0d44-aec8-7f1e8720af1c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5580-0d44-9ae3-67c2b22863b9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5580-0d44-b8c9-65b404eb4d70	Telefonska-read	Telefonska - branje	f
00030000-5580-0d44-7223-8feaff2b9121	Telefonska-write	Telefonska - spreminjanje	f
00030000-5580-0d44-18d0-4e1aafc84201	TerminStoritve-read	TerminStoritve - branje	f
00030000-5580-0d44-9c97-1045f2339a1c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5580-0d44-6f0c-2b5c7e06ee45	TipFunkcije-read	TipFunkcije - branje	f
00030000-5580-0d44-fc04-159203992dd2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5580-0d44-ac39-7ac766b6ee5d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5580-0d44-6d74-5a6922ae0ac5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5580-0d44-34b3-b54342ee4312	Trr-read	Trr - branje	f
00030000-5580-0d44-7a1f-285d2429de1a	Trr-write	Trr - spreminjanje	f
00030000-5580-0d44-478d-bc74d2267995	Uprizoritev-read	Uprizoritev - branje	f
00030000-5580-0d44-ba59-8805c7156b39	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5580-0d44-4eb0-20d90676ee93	User-read	User - branje	f
00030000-5580-0d44-1772-d37639d8dda1	User-write	User - spreminjanje	f
00030000-5580-0d44-1ff0-ab3b881b0cb5	Vaja-read	Vaja - branje	f
00030000-5580-0d44-5972-cf3ae1359070	Vaja-write	Vaja - spreminjanje	f
00030000-5580-0d44-1fa8-562ab756102a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5580-0d44-51cb-fb5e924017e8	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5580-0d44-50de-9a596dc7f330	Zaposlitev-read	Zaposlitev - branje	f
00030000-5580-0d44-55aa-8f6b030c9c70	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5580-0d44-9815-431eb5d520b9	Zasedenost-read	Zasedenost - branje	f
00030000-5580-0d44-f424-0967c245b6a2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5580-0d44-06ad-5cc1f9d14591	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5580-0d44-535a-1208a69f076f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5580-0d44-c331-e92f03d75bac	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5580-0d44-8b27-0508adf271ec	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7416577)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5580-0d45-0494-1533bcf3295d	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-e267-eedfdfbbb983
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-92d0-223ad8a5f2f7
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-1873-c9fa6adccc69
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-83de-b420095945f2
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-1bdc-c15b96d465ba
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-abdc-04699b924326
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-f070-0a79617fcef4
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-8be0-84feab4a7613
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-2449-bb37e628fb6e
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-8eb8-292f3c85a599
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-54ac-8c39d1b87f97
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-1351-6ae9379c8926
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-5961-e2ef0507e1ad
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-63a6-09b8a733f3db
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-fc2d-bf2715586b4b
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-a2d5-3a6bd87f0c46
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-a74f-e88e5cf84f52
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-d78d-cebf695fc5ce
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-e73b-852b80f4ff76
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-6fcd-75d54f2d96f0
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-15b9-d524d0d99c92
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-9807-3c974fa6b15a
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-3211-c1f4da2f2c9a
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-252e-036d854afea8
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-faad-9647e601df4c
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-fbab-e7984f6d15e7
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-e67b-04b5a20cf3c5
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-8b33-0641c0a92554
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-c9ab-514b081a90d1
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-349f-3f1ed75750e2
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-91ce-30035f7a9195
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-b348-eea0df132123
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-3374-a59c6096bc9a
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-3a08-418fd852c232
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-c607-6592d444367f
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-7a5e-1c5693827a3a
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-bda1-272fc0e2431b
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-ae0b-753a0b7602c8
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-1a8e-eb6f62684b32
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-6f0c-2b5c7e06ee45
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-478d-bc74d2267995
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-ba59-8805c7156b39
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-1ff0-ab3b881b0cb5
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-5972-cf3ae1359070
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-9815-431eb5d520b9
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-f424-0967c245b6a2
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-06ad-5cc1f9d14591
00020000-5580-0d45-141e-27e396bdbb26	00030000-5580-0d44-c331-e92f03d75bac
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-e267-eedfdfbbb983
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-1bdc-c15b96d465ba
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-abdc-04699b924326
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-1351-6ae9379c8926
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-63a6-09b8a733f3db
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-a2d5-3a6bd87f0c46
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-a74f-e88e5cf84f52
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-d78d-cebf695fc5ce
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-e73b-852b80f4ff76
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-6fcd-75d54f2d96f0
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-15b9-d524d0d99c92
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-9807-3c974fa6b15a
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-252e-036d854afea8
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-fbab-e7984f6d15e7
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-e67b-04b5a20cf3c5
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-8b33-0641c0a92554
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-b348-eea0df132123
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-3a08-418fd852c232
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-7a5e-1c5693827a3a
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-ae0b-753a0b7602c8
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-b8c9-65b404eb4d70
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-7223-8feaff2b9121
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-34b3-b54342ee4312
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-7a1f-285d2429de1a
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-50de-9a596dc7f330
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-55aa-8f6b030c9c70
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-06ad-5cc1f9d14591
00020000-5580-0d45-95ea-be71aeb5e438	00030000-5580-0d44-c331-e92f03d75bac
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-e267-eedfdfbbb983
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-1873-c9fa6adccc69
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-1bdc-c15b96d465ba
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-403b-aee1584eda1c
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-ffa6-16523d67773c
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-d3e3-a0040e325766
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-abdc-04699b924326
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-8eb8-292f3c85a599
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-1351-6ae9379c8926
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-63a6-09b8a733f3db
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-a2d5-3a6bd87f0c46
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-d78d-cebf695fc5ce
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-e73b-852b80f4ff76
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-6fcd-75d54f2d96f0
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-9807-3c974fa6b15a
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-252e-036d854afea8
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-8b33-0641c0a92554
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-349f-3f1ed75750e2
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-b348-eea0df132123
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-3a08-418fd852c232
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-7a5e-1c5693827a3a
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-ae0b-753a0b7602c8
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-6f0c-2b5c7e06ee45
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-1ff0-ab3b881b0cb5
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-9815-431eb5d520b9
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-06ad-5cc1f9d14591
00020000-5580-0d45-3614-e041bf867329	00030000-5580-0d44-c331-e92f03d75bac
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-e267-eedfdfbbb983
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-92d0-223ad8a5f2f7
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-83de-b420095945f2
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-1bdc-c15b96d465ba
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-abdc-04699b924326
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-1351-6ae9379c8926
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-63a6-09b8a733f3db
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-d78d-cebf695fc5ce
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-e73b-852b80f4ff76
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-9807-3c974fa6b15a
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-252e-036d854afea8
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-8b33-0641c0a92554
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-b348-eea0df132123
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-3a08-418fd852c232
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-7a5e-1c5693827a3a
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-ae0b-753a0b7602c8
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-6f0c-2b5c7e06ee45
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-06ad-5cc1f9d14591
00020000-5580-0d45-fd57-d03205d56e79	00030000-5580-0d44-c331-e92f03d75bac
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-e267-eedfdfbbb983
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-1bdc-c15b96d465ba
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-abdc-04699b924326
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-f4d7-54f9b0ab1340
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-1351-6ae9379c8926
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-63a6-09b8a733f3db
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-d78d-cebf695fc5ce
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-e73b-852b80f4ff76
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-9807-3c974fa6b15a
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-252e-036d854afea8
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-8b33-0641c0a92554
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-b348-eea0df132123
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-3a08-418fd852c232
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-7a5e-1c5693827a3a
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-ae0b-753a0b7602c8
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-18d0-4e1aafc84201
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-680d-b972152c747c
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-6f0c-2b5c7e06ee45
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-06ad-5cc1f9d14591
00020000-5580-0d45-0874-b850e4ca84e0	00030000-5580-0d44-c331-e92f03d75bac
\.


--
-- TOC entry 2858 (class 0 OID 7416872)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7416903)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7417039)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7416637)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5580-0d46-4196-53eada428ab9	00040000-5580-0d44-cee2-fa9edf8212f5	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-0d46-5dc4-716667e32091	00040000-5580-0d44-cee2-fa9edf8212f5	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-0d46-6a48-2b9e18a1099d	00040000-5580-0d44-cee2-fa9edf8212f5	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5580-0d46-a5f7-2931ce8de3f7	00040000-5580-0d44-cee2-fa9edf8212f5	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7416672)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5580-0d44-a168-eb7fd06f0c5b	8341	Adlešiči
00050000-5580-0d44-c742-5b9f33b2feec	5270	Ajdovščina
00050000-5580-0d44-f3d6-dafbbea31658	6280	Ankaran/Ancarano
00050000-5580-0d44-e9dc-3d39786b4c94	9253	Apače
00050000-5580-0d44-f6e6-22375926e23f	8253	Artiče
00050000-5580-0d44-3321-c9de76ca4a1d	4275	Begunje na Gorenjskem
00050000-5580-0d44-3258-9c2119a4205a	1382	Begunje pri Cerknici
00050000-5580-0d44-b0bd-3e36112e493d	9231	Beltinci
00050000-5580-0d44-6cbc-33d27d46e286	2234	Benedikt
00050000-5580-0d44-51d8-ffed7f46548e	2345	Bistrica ob Dravi
00050000-5580-0d44-c346-4e941abcca25	3256	Bistrica ob Sotli
00050000-5580-0d44-6fac-570684280de8	8259	Bizeljsko
00050000-5580-0d44-2541-15f2ec897681	1223	Blagovica
00050000-5580-0d44-69b1-df078526e39e	8283	Blanca
00050000-5580-0d44-7ad6-4bd5c2545f6e	4260	Bled
00050000-5580-0d44-d180-722c6b80f2ce	4273	Blejska Dobrava
00050000-5580-0d44-ab1a-1c6f11173344	9265	Bodonci
00050000-5580-0d44-7a62-164715aa9df1	9222	Bogojina
00050000-5580-0d44-4542-b4457c7af35a	4263	Bohinjska Bela
00050000-5580-0d44-5e63-519c6f88ddb0	4264	Bohinjska Bistrica
00050000-5580-0d44-63b1-4c4a925e5a66	4265	Bohinjsko jezero
00050000-5580-0d44-49cd-e9f44cc60798	1353	Borovnica
00050000-5580-0d44-4a09-9fce0581773b	8294	Boštanj
00050000-5580-0d44-1040-8f48d1171972	5230	Bovec
00050000-5580-0d44-e816-9f978a079656	5295	Branik
00050000-5580-0d44-f012-43e41e7d4521	3314	Braslovče
00050000-5580-0d44-182f-6a7c4e288a91	5223	Breginj
00050000-5580-0d44-78a6-aca129bcb288	8280	Brestanica
00050000-5580-0d44-6715-09ea2700db1a	2354	Bresternica
00050000-5580-0d44-911a-400cb8867787	4243	Brezje
00050000-5580-0d44-3f0c-aa53fad0bd67	1351	Brezovica pri Ljubljani
00050000-5580-0d44-c17f-c2f6a01cb483	8250	Brežice
00050000-5580-0d44-93fc-1828bae778f1	4210	Brnik - Aerodrom
00050000-5580-0d44-3449-08f712e9376a	8321	Brusnice
00050000-5580-0d44-7e9b-47ecebaaca75	3255	Buče
00050000-5580-0d44-860c-09719406a8c7	8276	Bučka 
00050000-5580-0d44-c5cc-452fabceeb21	9261	Cankova
00050000-5580-0d44-97a3-0baf7fa6a17e	3000	Celje 
00050000-5580-0d44-66f3-435b11c39d43	3001	Celje - poštni predali
00050000-5580-0d44-2854-ee0b51050a6e	4207	Cerklje na Gorenjskem
00050000-5580-0d44-5e46-cf8dd44fe06b	8263	Cerklje ob Krki
00050000-5580-0d44-7a66-fb6710302a03	1380	Cerknica
00050000-5580-0d44-5a0a-4a6dae7d7d5a	5282	Cerkno
00050000-5580-0d44-c707-08140848af90	2236	Cerkvenjak
00050000-5580-0d44-5226-830bad522810	2215	Ceršak
00050000-5580-0d44-54a4-c314e6dc87b0	2326	Cirkovce
00050000-5580-0d44-ddad-b368e03c6412	2282	Cirkulane
00050000-5580-0d44-7bc2-884683e17499	5273	Col
00050000-5580-0d44-ad89-4b5d734be8b4	8251	Čatež ob Savi
00050000-5580-0d44-ac92-174bd2b055fb	1413	Čemšenik
00050000-5580-0d44-837b-25ef40272915	5253	Čepovan
00050000-5580-0d44-16fc-4d0bea8a9fba	9232	Črenšovci
00050000-5580-0d44-e9c1-e5c783f43431	2393	Črna na Koroškem
00050000-5580-0d44-50bb-ce3b734b43eb	6275	Črni Kal
00050000-5580-0d44-599e-c2994b7c4220	5274	Črni Vrh nad Idrijo
00050000-5580-0d44-c12c-8235e65244f2	5262	Črniče
00050000-5580-0d44-0fd8-e8db704639ff	8340	Črnomelj
00050000-5580-0d44-1466-4bbc3e62ee16	6271	Dekani
00050000-5580-0d44-9882-8a69c7b14943	5210	Deskle
00050000-5580-0d44-d4a9-f6167ae779b5	2253	Destrnik
00050000-5580-0d44-4c0e-a41418e35354	6215	Divača
00050000-5580-0d44-8017-aec25d3bc3f5	1233	Dob
00050000-5580-0d44-fbf9-04831c033cf8	3224	Dobje pri Planini
00050000-5580-0d44-ecda-c8dc40e92b1f	8257	Dobova
00050000-5580-0d44-68e3-49cf566e31b8	1423	Dobovec
00050000-5580-0d44-2fca-10262173d3d5	5263	Dobravlje
00050000-5580-0d44-591e-9bb4b5beb954	3204	Dobrna
00050000-5580-0d44-bec0-6ca19c227c7b	8211	Dobrnič
00050000-5580-0d44-a434-24fc84cfa3da	1356	Dobrova
00050000-5580-0d44-5eb4-cd8d70659b77	9223	Dobrovnik/Dobronak 
00050000-5580-0d44-94b5-7fecda7508f5	5212	Dobrovo v Brdih
00050000-5580-0d44-10cc-aef7339ed56d	1431	Dol pri Hrastniku
00050000-5580-0d44-ab9b-480637f2dd5c	1262	Dol pri Ljubljani
00050000-5580-0d44-3bd8-e52f3fecccfa	1273	Dole pri Litiji
00050000-5580-0d44-7d83-cf37e7f9cb29	1331	Dolenja vas
00050000-5580-0d44-cada-1c090c055de3	8350	Dolenjske Toplice
00050000-5580-0d44-30dd-2d67790b47bd	1230	Domžale
00050000-5580-0d44-0868-dcf28b51fce1	2252	Dornava
00050000-5580-0d44-a42f-0c7584af531e	5294	Dornberk
00050000-5580-0d44-c993-048b9322ce25	1319	Draga
00050000-5580-0d44-fc8f-2a62f8f20cb5	8343	Dragatuš
00050000-5580-0d44-725c-6ca6c8e9f4bf	3222	Dramlje
00050000-5580-0d44-c63f-c501444a8036	2370	Dravograd
00050000-5580-0d44-a1f5-9facc713c3cc	4203	Duplje
00050000-5580-0d44-af28-86da4896e9cc	6221	Dutovlje
00050000-5580-0d44-43e7-987a997a5955	8361	Dvor
00050000-5580-0d44-96e6-67e9e3082513	2343	Fala
00050000-5580-0d44-8362-a177567b1424	9208	Fokovci
00050000-5580-0d44-a062-d4821e028db1	2313	Fram
00050000-5580-0d44-3e6f-76d73a6dbe5f	3213	Frankolovo
00050000-5580-0d44-5fec-2a97a06c4b78	1274	Gabrovka
00050000-5580-0d44-ac55-184e83b65fb3	8254	Globoko
00050000-5580-0d44-53a2-52ce570f3bc7	5275	Godovič
00050000-5580-0d44-6e1e-06b04e7bd48a	4204	Golnik
00050000-5580-0d44-40c7-3c5f081bcbb7	3303	Gomilsko
00050000-5580-0d44-5c50-910d28ca8e20	4224	Gorenja vas
00050000-5580-0d44-2b2d-8f6f8e6a234f	3263	Gorica pri Slivnici
00050000-5580-0d44-8309-31ada8e70fa5	2272	Gorišnica
00050000-5580-0d44-c9ce-1922638b622e	9250	Gornja Radgona
00050000-5580-0d44-b0ea-2cee853d3a94	3342	Gornji Grad
00050000-5580-0d44-7f82-6fbe57f56bf0	4282	Gozd Martuljek
00050000-5580-0d44-bbaf-fa7b51d24530	6272	Gračišče
00050000-5580-0d44-c8f3-96b79ec97c71	9264	Grad
00050000-5580-0d44-cacf-91e04a83c600	8332	Gradac
00050000-5580-0d44-8d3c-8defb83a8969	1384	Grahovo
00050000-5580-0d44-8515-4a1b0a8cd37e	5242	Grahovo ob Bači
00050000-5580-0d44-46d3-dd08cbcdca13	5251	Grgar
00050000-5580-0d44-1353-62b39bf4a7ed	3302	Griže
00050000-5580-0d44-fece-1aa233dc4eeb	3231	Grobelno
00050000-5580-0d44-4e3c-c6e4733b4fa2	1290	Grosuplje
00050000-5580-0d44-db08-01ebc6563a41	2288	Hajdina
00050000-5580-0d44-47e5-2195aa892da2	8362	Hinje
00050000-5580-0d44-bcec-ec8aaaa8151e	2311	Hoče
00050000-5580-0d44-76b7-631efe42d7a4	9205	Hodoš/Hodos
00050000-5580-0d44-451e-7c43003ff638	1354	Horjul
00050000-5580-0d44-7ea4-15f07d3782d5	1372	Hotedršica
00050000-5580-0d44-eeac-cdd94d70f7cf	1430	Hrastnik
00050000-5580-0d44-20f2-896bcb3f71e6	6225	Hruševje
00050000-5580-0d44-50db-23af057dda0a	4276	Hrušica
00050000-5580-0d44-8f3d-83381964f5fc	5280	Idrija
00050000-5580-0d44-0bce-ad506597ac44	1292	Ig
00050000-5580-0d44-a1b8-617aef271590	6250	Ilirska Bistrica
00050000-5580-0d44-6d50-6c035668344b	6251	Ilirska Bistrica-Trnovo
00050000-5580-0d44-f16c-3a73adaf385b	1295	Ivančna Gorica
00050000-5580-0d44-0f2c-5390d34c8d85	2259	Ivanjkovci
00050000-5580-0d44-88d8-f40bc5389758	1411	Izlake
00050000-5580-0d44-6aff-b5edb57a9f76	6310	Izola/Isola
00050000-5580-0d44-78fb-f3f33d519e15	2222	Jakobski Dol
00050000-5580-0d44-b0b3-9f0718c11329	2221	Jarenina
00050000-5580-0d44-4b49-1a6bec6729f3	6254	Jelšane
00050000-5580-0d44-ef04-fa7be37d5ce7	4270	Jesenice
00050000-5580-0d44-c881-27d5aa41ac52	8261	Jesenice na Dolenjskem
00050000-5580-0d44-294c-c0c232b6c00a	3273	Jurklošter
00050000-5580-0d44-0744-9bb5775e6996	2223	Jurovski Dol
00050000-5580-0d44-5121-7b943b420a2a	2256	Juršinci
00050000-5580-0d44-8c84-6f7c244e7478	5214	Kal nad Kanalom
00050000-5580-0d44-553c-7644720cb87b	3233	Kalobje
00050000-5580-0d44-4f53-82052eec74fb	4246	Kamna Gorica
00050000-5580-0d44-a94a-f189d96a5340	2351	Kamnica
00050000-5580-0d44-8d71-6730f7659f4c	1241	Kamnik
00050000-5580-0d44-bca0-306d2ac0248b	5213	Kanal
00050000-5580-0d44-ad80-a066da7bae10	8258	Kapele
00050000-5580-0d44-6203-e3a017af7fd3	2362	Kapla
00050000-5580-0d44-dd5f-413a49dc5f78	2325	Kidričevo
00050000-5580-0d44-2b35-529d445edc8a	1412	Kisovec
00050000-5580-0d44-acb0-caa068ce46ed	6253	Knežak
00050000-5580-0d44-7a23-2f2a81c953c3	5222	Kobarid
00050000-5580-0d44-a554-bc6d44bab8bb	9227	Kobilje
00050000-5580-0d44-2df0-7d0487c2231d	1330	Kočevje
00050000-5580-0d44-8c17-491783341fcf	1338	Kočevska Reka
00050000-5580-0d44-c40a-5f48df78b14f	2276	Kog
00050000-5580-0d44-4bda-216e36b3d81f	5211	Kojsko
00050000-5580-0d44-4e66-161f0cc5e2a4	6223	Komen
00050000-5580-0d44-b5af-b8bb2a73fdc9	1218	Komenda
00050000-5580-0d44-daa4-72c3ef7ad7e2	6000	Koper/Capodistria 
00050000-5580-0d44-6e55-f067412b7396	6001	Koper/Capodistria - poštni predali
00050000-5580-0d44-2bcf-e63052fada4a	8282	Koprivnica
00050000-5580-0d44-895d-837937ed56e7	5296	Kostanjevica na Krasu
00050000-5580-0d44-cd77-4d3e51afb15f	8311	Kostanjevica na Krki
00050000-5580-0d44-ba60-7d7c6de3306a	1336	Kostel
00050000-5580-0d44-f476-22dd7676a499	6256	Košana
00050000-5580-0d44-abc3-179dd740656f	2394	Kotlje
00050000-5580-0d44-b03e-dbd14e0f9bbe	6240	Kozina
00050000-5580-0d44-1338-8f7190d3ccfe	3260	Kozje
00050000-5580-0d44-68b4-6fde4653bc6c	4000	Kranj 
00050000-5580-0d44-9971-3f83e382f74a	4001	Kranj - poštni predali
00050000-5580-0d44-1cc3-ab5e7bf4e321	4280	Kranjska Gora
00050000-5580-0d44-5942-d8083082ae93	1281	Kresnice
00050000-5580-0d44-94b3-0a62c3ed9a68	4294	Križe
00050000-5580-0d44-dc7a-ed335c9100fc	9206	Križevci
00050000-5580-0d44-9c7f-5dfe6c65ba84	9242	Križevci pri Ljutomeru
00050000-5580-0d44-2559-b0d3dc253910	1301	Krka
00050000-5580-0d44-b6e0-95b0ab70c5aa	8296	Krmelj
00050000-5580-0d44-5c6c-3ee8afaa90b1	4245	Kropa
00050000-5580-0d44-d6a6-6176aa770399	8262	Krška vas
00050000-5580-0d44-00d4-cea374bcc48f	8270	Krško
00050000-5580-0d44-9cd6-f5f78d0229af	9263	Kuzma
00050000-5580-0d44-2f76-93fa1725ce05	2318	Laporje
00050000-5580-0d44-d4a5-605171d8bf5f	3270	Laško
00050000-5580-0d44-011e-ba8bc0114d0e	1219	Laze v Tuhinju
00050000-5580-0d44-07c7-29163c79f2fa	2230	Lenart v Slovenskih goricah
00050000-5580-0d44-5b5a-36fb443bea1d	9220	Lendava/Lendva
00050000-5580-0d44-da63-6fad24482016	4248	Lesce
00050000-5580-0d44-3e75-5abc536620d3	3261	Lesično
00050000-5580-0d44-1ba0-6f7c84d06ac4	8273	Leskovec pri Krškem
00050000-5580-0d44-1450-01a2d9d83406	2372	Libeliče
00050000-5580-0d44-69cb-5f5de334843b	2341	Limbuš
00050000-5580-0d44-8108-153b46a38e19	1270	Litija
00050000-5580-0d44-89a0-619dcb2b6fb9	3202	Ljubečna
00050000-5580-0d44-474f-9394eea436b9	1000	Ljubljana 
00050000-5580-0d44-2f31-397df8ee48ed	1001	Ljubljana - poštni predali
00050000-5580-0d44-4f46-3ade788c93fe	1231	Ljubljana - Črnuče
00050000-5580-0d44-604b-5f663889263e	1261	Ljubljana - Dobrunje
00050000-5580-0d44-2bc5-c80f535b1090	1260	Ljubljana - Polje
00050000-5580-0d44-4881-8327de1af6f1	1210	Ljubljana - Šentvid
00050000-5580-0d44-1f6d-86e64b94ebaf	1211	Ljubljana - Šmartno
00050000-5580-0d44-15e9-8f70c891a0c0	3333	Ljubno ob Savinji
00050000-5580-0d44-175d-29d730170d24	9240	Ljutomer
00050000-5580-0d44-1a41-9a9443f03e70	3215	Loče
00050000-5580-0d44-6c9a-91cfbc768f31	5231	Log pod Mangartom
00050000-5580-0d44-5cb7-7d4bf9b99760	1358	Log pri Brezovici
00050000-5580-0d44-cb20-a54d5630e006	1370	Logatec
00050000-5580-0d44-7afc-cf591a6159a6	1371	Logatec
00050000-5580-0d44-483b-bfcf49fedad0	1434	Loka pri Zidanem Mostu
00050000-5580-0d44-4be8-42eb522a3b21	3223	Loka pri Žusmu
00050000-5580-0d44-53fa-875576f9fcbb	6219	Lokev
00050000-5580-0d44-f4c8-184916e7a879	1318	Loški Potok
00050000-5580-0d44-5707-fb1728a30312	2324	Lovrenc na Dravskem polju
00050000-5580-0d44-3ed7-1ba314d0d161	2344	Lovrenc na Pohorju
00050000-5580-0d44-1ea4-5a182757b504	3334	Luče
00050000-5580-0d44-3941-1aeed0cfc0fb	1225	Lukovica
00050000-5580-0d44-28b8-b976624c1f50	9202	Mačkovci
00050000-5580-0d44-3ac5-c9229cedd089	2322	Majšperk
00050000-5580-0d44-a26d-30c144e869a8	2321	Makole
00050000-5580-0d44-96ab-f4b782802d9f	9243	Mala Nedelja
00050000-5580-0d44-8508-559e9167ed8c	2229	Malečnik
00050000-5580-0d44-a84b-3e4c2d26fa65	6273	Marezige
00050000-5580-0d44-d4c6-553f5e9f9dd3	2000	Maribor 
00050000-5580-0d44-2537-0e460cfbe2d6	2001	Maribor - poštni predali
00050000-5580-0d44-c9f4-cbbee1630fa1	2206	Marjeta na Dravskem polju
00050000-5580-0d44-b0e7-93186a5befe1	2281	Markovci
00050000-5580-0d44-6537-b0214ce1692c	9221	Martjanci
00050000-5580-0d44-7926-aae8f9fbb6eb	6242	Materija
00050000-5580-0d44-4af4-5661af79169f	4211	Mavčiče
00050000-5580-0d44-d027-bdd1a0b0d5f9	1215	Medvode
00050000-5580-0d44-3cb3-69e6a640c13a	1234	Mengeš
00050000-5580-0d44-2a24-65fd058c49f7	8330	Metlika
00050000-5580-0d44-6704-0b969e601912	2392	Mežica
00050000-5580-0d44-ec18-6402dd1cfe78	2204	Miklavž na Dravskem polju
00050000-5580-0d44-e1f2-68941682725c	2275	Miklavž pri Ormožu
00050000-5580-0d44-2dc6-3947401cc224	5291	Miren
00050000-5580-0d44-5d11-dffa3338d331	8233	Mirna
00050000-5580-0d44-9042-be97e525a741	8216	Mirna Peč
00050000-5580-0d44-e7f9-096c64a354d2	2382	Mislinja
00050000-5580-0d44-7b62-aebbb41451da	4281	Mojstrana
00050000-5580-0d44-8118-c8b4e2dd776d	8230	Mokronog
00050000-5580-0d44-b400-fcd3268a7cf0	1251	Moravče
00050000-5580-0d44-e970-f0e4cd51217f	9226	Moravske Toplice
00050000-5580-0d44-23a2-aa649261c16b	5216	Most na Soči
00050000-5580-0d44-6f5c-b4104a11c3a0	1221	Motnik
00050000-5580-0d44-3410-642530c9b43b	3330	Mozirje
00050000-5580-0d44-0bde-4ce2cd63ef16	9000	Murska Sobota 
00050000-5580-0d44-e8c4-573bb1f4dc6d	9001	Murska Sobota - poštni predali
00050000-5580-0d44-a746-1a3aee70d00b	2366	Muta
00050000-5580-0d44-2d05-65af2d682e08	4202	Naklo
00050000-5580-0d44-0ea0-1f66b6148103	3331	Nazarje
00050000-5580-0d44-e781-5e7b8d1482b4	1357	Notranje Gorice
00050000-5580-0d44-9229-208ce2467db8	3203	Nova Cerkev
00050000-5580-0d44-786b-cb3351ff98d8	5000	Nova Gorica 
00050000-5580-0d44-2606-2eaa772dc3be	5001	Nova Gorica - poštni predali
00050000-5580-0d44-d084-81338d5380ad	1385	Nova vas
00050000-5580-0d44-36b3-68c8f26dc149	8000	Novo mesto
00050000-5580-0d44-40e8-44f625af31eb	8001	Novo mesto - poštni predali
00050000-5580-0d44-8f55-115a33c8e77f	6243	Obrov
00050000-5580-0d44-9771-42f1c7d8a30f	9233	Odranci
00050000-5580-0d44-7764-86154d75e544	2317	Oplotnica
00050000-5580-0d44-0d65-fc0a3e3f0bbe	2312	Orehova vas
00050000-5580-0d44-5869-d551b6444d4e	2270	Ormož
00050000-5580-0d44-ecb9-6310569765f7	1316	Ortnek
00050000-5580-0d44-fe55-be0180a00dcd	1337	Osilnica
00050000-5580-0d44-b48a-5fda915ee8cd	8222	Otočec
00050000-5580-0d44-db3c-fe79c5473e65	2361	Ožbalt
00050000-5580-0d44-8df0-814434c04ca7	2231	Pernica
00050000-5580-0d44-b872-dfba84d9198e	2211	Pesnica pri Mariboru
00050000-5580-0d44-98e9-3ae22de80973	9203	Petrovci
00050000-5580-0d44-7f68-22e817f41a8a	3301	Petrovče
00050000-5580-0d44-cd0e-343b2aaf8cc6	6330	Piran/Pirano
00050000-5580-0d44-0c09-0dac5f4ac80e	8255	Pišece
00050000-5580-0d44-09ff-9f6513695c28	6257	Pivka
00050000-5580-0d44-ea98-0669dc07d4da	6232	Planina
00050000-5580-0d44-6cd7-05c52a496a71	3225	Planina pri Sevnici
00050000-5580-0d44-a174-65915912ce0c	6276	Pobegi
00050000-5580-0d44-9dbd-d92f2cc66e30	8312	Podbočje
00050000-5580-0d44-53a2-211221febf1d	5243	Podbrdo
00050000-5580-0d44-2b17-aaeec44028a1	3254	Podčetrtek
00050000-5580-0d44-9180-ad4dac04ca75	2273	Podgorci
00050000-5580-0d44-c930-24a528de9020	6216	Podgorje
00050000-5580-0d44-173a-d40293cfcc2b	2381	Podgorje pri Slovenj Gradcu
00050000-5580-0d44-283a-18224beb6a5b	6244	Podgrad
00050000-5580-0d44-aea3-fa4d27b772c0	1414	Podkum
00050000-5580-0d44-7ab5-053f14ebb6fb	2286	Podlehnik
00050000-5580-0d44-2370-0b911af24e89	5272	Podnanos
00050000-5580-0d44-863f-e91a4eb7fe45	4244	Podnart
00050000-5580-0d44-9c4a-376ac90baeb8	3241	Podplat
00050000-5580-0d44-102f-cb43b8928ede	3257	Podsreda
00050000-5580-0d44-34b9-b0f445088cd5	2363	Podvelka
00050000-5580-0d44-a3d5-61bca5b60906	2208	Pohorje
00050000-5580-0d44-3a2f-a6e86e22e298	2257	Polenšak
00050000-5580-0d44-b20f-bac56fa4ebc5	1355	Polhov Gradec
00050000-5580-0d44-7181-10cafdda59d3	4223	Poljane nad Škofjo Loko
00050000-5580-0d44-4812-563b1bd08e20	2319	Poljčane
00050000-5580-0d44-9e3e-bb1c5f7ee0be	1272	Polšnik
00050000-5580-0d44-9251-a252098c8cb9	3313	Polzela
00050000-5580-0d44-42bb-b8477b3786c4	3232	Ponikva
00050000-5580-0d44-f07e-7fcead3b4166	6320	Portorož/Portorose
00050000-5580-0d44-bdda-b5f1fe3839ef	6230	Postojna
00050000-5580-0d44-7d80-f569bbc0a24f	2331	Pragersko
00050000-5580-0d44-4be1-d01ec4c0ac42	3312	Prebold
00050000-5580-0d44-7c2f-535f3ee962c2	4205	Preddvor
00050000-5580-0d44-91ba-f1b91d8df8b1	6255	Prem
00050000-5580-0d44-4cec-84e30fd3218a	1352	Preserje
00050000-5580-0d44-1795-3fa80b1c01e2	6258	Prestranek
00050000-5580-0d44-6dc2-f54a72e0f65e	2391	Prevalje
00050000-5580-0d44-568b-e90090e39e8a	3262	Prevorje
00050000-5580-0d44-ad69-15b9066f552b	1276	Primskovo 
00050000-5580-0d44-8c97-537d069ef13d	3253	Pristava pri Mestinju
00050000-5580-0d44-df13-dc89ba241d36	9207	Prosenjakovci/Partosfalva
00050000-5580-0d44-396c-5e910e3f574f	5297	Prvačina
00050000-5580-0d44-cb95-e783936f4c91	2250	Ptuj
00050000-5580-0d44-5e9b-df85a30244ea	2323	Ptujska Gora
00050000-5580-0d44-362d-acbc70f70efd	9201	Puconci
00050000-5580-0d44-6b33-d1dfd408c591	2327	Rače
00050000-5580-0d44-9b0a-cbff15453045	1433	Radeče
00050000-5580-0d44-d316-4ee128c43353	9252	Radenci
00050000-5580-0d44-b7be-262197c98654	2360	Radlje ob Dravi
00050000-5580-0d44-04cb-7d145e89b2d6	1235	Radomlje
00050000-5580-0d44-b5bd-fb1ec5bf8fa9	4240	Radovljica
00050000-5580-0d44-2c8a-5104e0493cb7	8274	Raka
00050000-5580-0d44-9582-2cfd9fbc2e59	1381	Rakek
00050000-5580-0d44-b2bc-e36acb873bf6	4283	Rateče - Planica
00050000-5580-0d44-0531-cbca0a52813f	2390	Ravne na Koroškem
00050000-5580-0d44-4600-c7f0e78bc776	9246	Razkrižje
00050000-5580-0d44-4cad-e2c8d48eb9b5	3332	Rečica ob Savinji
00050000-5580-0d44-46d7-63ac4384d4b9	5292	Renče
00050000-5580-0d44-588f-e83639e69604	1310	Ribnica
00050000-5580-0d44-5348-29493e3bf1bd	2364	Ribnica na Pohorju
00050000-5580-0d44-7376-4a188081637e	3272	Rimske Toplice
00050000-5580-0d44-b90a-95ce7e64b233	1314	Rob
00050000-5580-0d44-c78e-203332135960	5215	Ročinj
00050000-5580-0d44-3dbb-a31ce75246a8	3250	Rogaška Slatina
00050000-5580-0d44-3977-1f59a7c7f615	9262	Rogašovci
00050000-5580-0d44-19c3-ebbcf5ca8577	3252	Rogatec
00050000-5580-0d44-a189-03dc0ef3ae69	1373	Rovte
00050000-5580-0d44-8189-353c3a1c9807	2342	Ruše
00050000-5580-0d44-0603-918680f5d386	1282	Sava
00050000-5580-0d44-9ccf-475f41a71494	6333	Sečovlje/Sicciole
00050000-5580-0d44-0d11-35694f6adeb8	4227	Selca
00050000-5580-0d44-da32-005f58fe88ca	2352	Selnica ob Dravi
00050000-5580-0d44-fbe8-cbc072fd9cf9	8333	Semič
00050000-5580-0d44-ce03-e40f01665e6d	8281	Senovo
00050000-5580-0d44-cd88-834a6d9a9166	6224	Senožeče
00050000-5580-0d44-4000-42bd5b214a0b	8290	Sevnica
00050000-5580-0d44-c53a-5a42c7d592ef	6210	Sežana
00050000-5580-0d44-d038-424d5aa101ba	2214	Sladki Vrh
00050000-5580-0d44-c386-5c689070f22d	5283	Slap ob Idrijci
00050000-5580-0d44-2610-ac5a959c456b	2380	Slovenj Gradec
00050000-5580-0d44-96be-17c94a6a3b2f	2310	Slovenska Bistrica
00050000-5580-0d44-e424-6b7011b1bbbe	3210	Slovenske Konjice
00050000-5580-0d44-2fd2-93c3807451aa	1216	Smlednik
00050000-5580-0d44-d56c-7c82ef68d681	5232	Soča
00050000-5580-0d44-cc31-d7e9fd2a594a	1317	Sodražica
00050000-5580-0d44-ec92-c1f1b523c861	3335	Solčava
00050000-5580-0d44-9585-edac4170e2e6	5250	Solkan
00050000-5580-0d44-cbd9-d0914886d85d	4229	Sorica
00050000-5580-0d44-e533-0e72be51ba62	4225	Sovodenj
00050000-5580-0d44-1ce2-87b6b7f95b82	5281	Spodnja Idrija
00050000-5580-0d44-7fdc-8e9159b78b1d	2241	Spodnji Duplek
00050000-5580-0d44-3c06-b56116fb0b40	9245	Spodnji Ivanjci
00050000-5580-0d44-f9bd-d8328b908198	2277	Središče ob Dravi
00050000-5580-0d44-dfe2-c8ecec6016cd	4267	Srednja vas v Bohinju
00050000-5580-0d44-6417-1858f5d673cb	8256	Sromlje 
00050000-5580-0d44-a305-b24ab23f4a05	5224	Srpenica
00050000-5580-0d44-703d-c82028d117bf	1242	Stahovica
00050000-5580-0d44-39cd-8e4d6c6b4083	1332	Stara Cerkev
00050000-5580-0d44-a105-58c94a42029c	8342	Stari trg ob Kolpi
00050000-5580-0d44-aa6b-d468f561d558	1386	Stari trg pri Ložu
00050000-5580-0d44-09be-e264816d27bd	2205	Starše
00050000-5580-0d44-a9ec-094cfae251cc	2289	Stoperce
00050000-5580-0d44-1bbd-dcaf35cf4492	8322	Stopiče
00050000-5580-0d44-0c06-667e00b20da4	3206	Stranice
00050000-5580-0d44-a3cd-38323ae19bff	8351	Straža
00050000-5580-0d44-6aa7-67881f14dfd4	1313	Struge
00050000-5580-0d44-09c8-6e068a39ff5a	8293	Studenec
00050000-5580-0d44-ee96-58804dc8c8f1	8331	Suhor
00050000-5580-0d44-fdef-095b55b79a3f	2233	Sv. Ana v Slovenskih goricah
00050000-5580-0d44-562c-54ec93906d95	2235	Sv. Trojica v Slovenskih goricah
00050000-5580-0d44-10a4-b6a98555aff4	2353	Sveti Duh na Ostrem Vrhu
00050000-5580-0d44-8a17-1c08aa6e7bc9	9244	Sveti Jurij ob Ščavnici
00050000-5580-0d44-2783-517186eaf775	3264	Sveti Štefan
00050000-5580-0d44-c794-7c12154d3bdd	2258	Sveti Tomaž
00050000-5580-0d44-72fd-9b7dff84292b	9204	Šalovci
00050000-5580-0d44-6123-12d4e0e34c7c	5261	Šempas
00050000-5580-0d44-72c9-64b5b1af7fcc	5290	Šempeter pri Gorici
00050000-5580-0d44-ab10-f33b63f55f35	3311	Šempeter v Savinjski dolini
00050000-5580-0d44-f0c2-2db1e409e16b	4208	Šenčur
00050000-5580-0d44-4aea-7a84b862e967	2212	Šentilj v Slovenskih goricah
00050000-5580-0d44-43eb-46aefa370057	8297	Šentjanž
00050000-5580-0d44-c338-7e9d4b4e7f58	2373	Šentjanž pri Dravogradu
00050000-5580-0d44-8159-9aefb56db75b	8310	Šentjernej
00050000-5580-0d44-71fc-acc2823abdba	3230	Šentjur
00050000-5580-0d44-f1e9-25a410986263	3271	Šentrupert
00050000-5580-0d44-b4a8-01b306f34c72	8232	Šentrupert
00050000-5580-0d44-19d0-98741cfd64c2	1296	Šentvid pri Stični
00050000-5580-0d44-05d6-e88191cd6a26	8275	Škocjan
00050000-5580-0d44-d3a1-e1da13254b35	6281	Škofije
00050000-5580-0d44-85a1-c4bc999dfa1b	4220	Škofja Loka
00050000-5580-0d44-22c1-118cd6de944d	3211	Škofja vas
00050000-5580-0d44-0650-6b9f3836e487	1291	Škofljica
00050000-5580-0d44-43ba-433f7dccaa74	6274	Šmarje
00050000-5580-0d44-04a4-3d35c78d3d07	1293	Šmarje - Sap
00050000-5580-0d44-e71f-34b2ccbb8aae	3240	Šmarje pri Jelšah
00050000-5580-0d44-86c0-276a2d53fd3e	8220	Šmarješke Toplice
00050000-5580-0d44-6341-b1d0a1530cf7	2315	Šmartno na Pohorju
00050000-5580-0d44-232f-46cc15e02ce3	3341	Šmartno ob Dreti
00050000-5580-0d44-2c76-d6ac047e6e15	3327	Šmartno ob Paki
00050000-5580-0d44-c525-a273aa88f42f	1275	Šmartno pri Litiji
00050000-5580-0d44-ea28-90888a816e01	2383	Šmartno pri Slovenj Gradcu
00050000-5580-0d44-f4b1-4e59220c203f	3201	Šmartno v Rožni dolini
00050000-5580-0d44-f5a5-f29eda9df363	3325	Šoštanj
00050000-5580-0d44-82fe-c4b1927c7a96	6222	Štanjel
00050000-5580-0d44-8999-bcef53e9ec1e	3220	Štore
00050000-5580-0d44-49fc-9b1390ef178d	3304	Tabor
00050000-5580-0d44-cc8b-3ba3c8bb3207	3221	Teharje
00050000-5580-0d44-47f0-48f4994ffe75	9251	Tišina
00050000-5580-0d44-7bf2-f0f730fa567c	5220	Tolmin
00050000-5580-0d44-d104-9b5f061ef850	3326	Topolšica
00050000-5580-0d44-deeb-343d240b7558	2371	Trbonje
00050000-5580-0d44-11a1-805129acc29d	1420	Trbovlje
00050000-5580-0d44-6cfd-0dff2b1ec722	8231	Trebelno 
00050000-5580-0d44-3b2f-2d5a9d469114	8210	Trebnje
00050000-5580-0d44-c912-77a3ee622df4	5252	Trnovo pri Gorici
00050000-5580-0d44-f948-4fd08d7d33c4	2254	Trnovska vas
00050000-5580-0d44-2dda-80791c1a9407	1222	Trojane
00050000-5580-0d44-12d1-c5d545befc45	1236	Trzin
00050000-5580-0d44-4db8-a668cfe9f688	4290	Tržič
00050000-5580-0d44-f8a2-d55a961857f7	8295	Tržišče
00050000-5580-0d44-e936-e03730a05dc2	1311	Turjak
00050000-5580-0d44-cd79-c037c83a5686	9224	Turnišče
00050000-5580-0d44-fabe-9cbdbca70f54	8323	Uršna sela
00050000-5580-0d44-f45b-fadc8ee2da61	1252	Vače
00050000-5580-0d44-b3b4-6a42f3734f5a	3320	Velenje 
00050000-5580-0d44-05a7-3e6b6a353aa6	3322	Velenje - poštni predali
00050000-5580-0d44-4b4d-9c249ab32615	8212	Velika Loka
00050000-5580-0d44-ee39-c7a2ab7c7005	2274	Velika Nedelja
00050000-5580-0d44-a6a4-46605439ff10	9225	Velika Polana
00050000-5580-0d44-7e4c-e54907db5f36	1315	Velike Lašče
00050000-5580-0d44-ec5c-916b8ec863f0	8213	Veliki Gaber
00050000-5580-0d44-578b-62b0910d2614	9241	Veržej
00050000-5580-0d44-17af-840a10ba1e5c	1312	Videm - Dobrepolje
00050000-5580-0d44-1074-b31cc664d72a	2284	Videm pri Ptuju
00050000-5580-0d44-bedc-eaa2f57a80a0	8344	Vinica
00050000-5580-0d44-55cf-8ad8df0a25e0	5271	Vipava
00050000-5580-0d44-36e7-3e450fbe1e56	4212	Visoko
00050000-5580-0d44-fedb-2a03d84b6ab8	1294	Višnja Gora
00050000-5580-0d44-c82b-82558f64cef7	3205	Vitanje
00050000-5580-0d44-f6d5-ef7fcd7e2002	2255	Vitomarci
00050000-5580-0d44-9a0e-657aa40192a0	1217	Vodice
00050000-5580-0d44-1e88-5726c544dde2	3212	Vojnik\t
00050000-5580-0d44-e28a-c6d4977a41d3	5293	Volčja Draga
00050000-5580-0d44-7058-97e5ed649612	2232	Voličina
00050000-5580-0d44-cb62-8bd474e178b4	3305	Vransko
00050000-5580-0d44-4512-f2fbfc193660	6217	Vremski Britof
00050000-5580-0d44-9467-ca498629b9a8	1360	Vrhnika
00050000-5580-0d44-499b-1b9f6eb1f273	2365	Vuhred
00050000-5580-0d44-f4c3-33d681c80d86	2367	Vuzenica
00050000-5580-0d44-c338-647e7a93be67	8292	Zabukovje 
00050000-5580-0d44-f51d-187ab8d394ea	1410	Zagorje ob Savi
00050000-5580-0d44-3b34-42b7e599c18b	1303	Zagradec
00050000-5580-0d44-482a-28b1300f64f6	2283	Zavrč
00050000-5580-0d44-e6bf-49a8c18b0fed	8272	Zdole 
00050000-5580-0d44-b67f-7fb2ddb6f02d	4201	Zgornja Besnica
00050000-5580-0d44-91f1-6efc4fb2f7ca	2242	Zgornja Korena
00050000-5580-0d44-c33b-a2797ab682a1	2201	Zgornja Kungota
00050000-5580-0d44-0ef3-3184d6af4ebf	2316	Zgornja Ložnica
00050000-5580-0d44-6da3-524e461b21aa	2314	Zgornja Polskava
00050000-5580-0d44-b732-e24de6caa260	2213	Zgornja Velka
00050000-5580-0d44-6203-81a855d5ee37	4247	Zgornje Gorje
00050000-5580-0d44-ee8f-51f82f113800	4206	Zgornje Jezersko
00050000-5580-0d44-774d-fd22d53ebfe6	2285	Zgornji Leskovec
00050000-5580-0d44-a489-fa8be42a7b18	1432	Zidani Most
00050000-5580-0d44-d997-b339a7643170	3214	Zreče
00050000-5580-0d44-1760-ef72d25ffea5	4209	Žabnica
00050000-5580-0d44-dd80-6d99bdd4461d	3310	Žalec
00050000-5580-0d44-a19a-090925e7544a	4228	Železniki
00050000-5580-0d44-77f0-dcd5bcb71786	2287	Žetale
00050000-5580-0d44-1038-b80efb3c862f	4226	Žiri
00050000-5580-0d44-fd1f-0ebcfca881ab	4274	Žirovnica
00050000-5580-0d44-c687-1e4015293a71	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7416846)
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
-- TOC entry 2836 (class 0 OID 7416657)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7416735)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7416858)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7416978)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7417031)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5580-0d46-a46d-323cb8328fc0	00080000-5580-0d46-6a48-2b9e18a1099d	0987	A
00190000-5580-0d46-c4bb-63291680791f	00080000-5580-0d46-5dc4-716667e32091	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7417150)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7417213)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7417163)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7417182)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7416887)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5580-0d46-286c-0b7b78f86e47	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5580-0d46-a0e9-b66a72d9acc8	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5580-0d46-b6a6-c9f26a72030b	0003	Kazinska	t	84	Kazinska dvorana
00220000-5580-0d46-070b-15c8ff6ef732	0004	Mali oder	t	24	Mali oder 
00220000-5580-0d46-cd83-2eb1d62c7009	0005	Komorni oder	t	15	Komorni oder
00220000-5580-0d46-d2c2-9f837c8c88c3	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5580-0d46-987f-29fdb579cd60	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7416831)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7416821)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7417020)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7416955)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7416529)
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
-- TOC entry 2861 (class 0 OID 7416897)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7416567)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5580-0d45-a46c-ce96272ff528	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5580-0d45-0494-1533bcf3295d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5580-0d45-4ebb-ec0227cca364	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5580-0d45-667c-ab5639e2d089	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5580-0d45-141e-27e396bdbb26	planer	Planer dogodkov v koledarju	t
00020000-5580-0d45-95ea-be71aeb5e438	kadrovska	Kadrovska služba	t
00020000-5580-0d45-3614-e041bf867329	arhivar	Ažuriranje arhivalij	t
00020000-5580-0d45-fd57-d03205d56e79	igralec	Igralec	t
00020000-5580-0d45-0874-b850e4ca84e0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7416551)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5580-0d45-fff9-59b940e458a1	00020000-5580-0d45-4ebb-ec0227cca364
00010000-5580-0d45-6830-32ae3380283f	00020000-5580-0d45-4ebb-ec0227cca364
\.


--
-- TOC entry 2863 (class 0 OID 7416911)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7416852)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7416802)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7417246)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5580-0d44-2840-61a4cc081ab4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5580-0d44-abb1-14846c9112b0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5580-0d44-5401-a1cdeb5be73d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5580-0d44-1b99-307465eab791	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5580-0d44-97a6-c0ada70ef336	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7417238)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5580-0d44-30b2-e5bb48f90085	00230000-5580-0d44-1b99-307465eab791	popa
00240000-5580-0d44-d6bf-097b067cc7a0	00230000-5580-0d44-1b99-307465eab791	oseba
00240000-5580-0d44-7e64-382e256b391c	00230000-5580-0d44-abb1-14846c9112b0	prostor
00240000-5580-0d44-e0e5-4787ccd9bb73	00230000-5580-0d44-1b99-307465eab791	besedilo
00240000-5580-0d44-a2bf-5f815f472d7f	00230000-5580-0d44-1b99-307465eab791	uprizoritev
00240000-5580-0d44-2820-f74fc1112570	00230000-5580-0d44-1b99-307465eab791	funkcija
00240000-5580-0d44-d022-3b95b342a870	00230000-5580-0d44-1b99-307465eab791	tipfunkcije
00240000-5580-0d44-b1aa-da3cc4f4f61d	00230000-5580-0d44-1b99-307465eab791	alternacija
00240000-5580-0d44-c2a5-2c96f453794a	00230000-5580-0d44-2840-61a4cc081ab4	pogodba
00240000-5580-0d44-bc9e-f531f412ad3d	00230000-5580-0d44-1b99-307465eab791	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7417233)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7416965)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7416629)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7416808)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5580-0d46-3e6e-308ed95690d4	00180000-5580-0d46-d3f6-3739cc64539e	000c0000-5580-0d46-95ec-6a18f6b2bbd7	00090000-5580-0d46-4a4a-84b876485e42	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-0d46-569a-4c475fe5f22a	00180000-5580-0d46-d3f6-3739cc64539e	000c0000-5580-0d46-ec7b-3c4360ff05c1	00090000-5580-0d46-2f8d-0f919ebd9a7e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-0d46-0471-403ac5b87bd6	00180000-5580-0d46-d3f6-3739cc64539e	000c0000-5580-0d46-6c66-1132df9d91ba	00090000-5580-0d46-00fb-c7258d4d2688	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-0d46-bb02-be3f204da5f3	00180000-5580-0d46-d3f6-3739cc64539e	000c0000-5580-0d46-3fe5-067aab1ed136	00090000-5580-0d46-77d8-f8280829ea43	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-0d46-f64f-b4ed28865a93	00180000-5580-0d46-d3f6-3739cc64539e	000c0000-5580-0d46-3c70-2e41f30e6a6c	00090000-5580-0d46-140d-5aa84548c7aa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5580-0d46-fcc1-dbe96af8fc0c	00180000-5580-0d46-17de-18af7de89fb3	\N	00090000-5580-0d46-140d-5aa84548c7aa	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7417009)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5580-0d44-8e3e-3c857d7f8c70	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5580-0d44-a048-2f5974c73b00	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5580-0d44-0356-637ea1969e5c	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5580-0d44-98e1-d548a7965bc5	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5580-0d44-53b1-4e851eff127d	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5580-0d44-b5c0-a00e357cadb8	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5580-0d44-7543-2faa94825407	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5580-0d44-5019-7e2eeb640a97	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5580-0d44-0b90-1a196ac32f5e	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5580-0d44-16c1-c65780392b85	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5580-0d44-d49b-c42719ff5f3e	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5580-0d44-cbf9-0848d211d6b7	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5580-0d44-5124-feb8078ec9a4	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5580-0d44-f28f-947b62c8b0c7	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5580-0d44-3753-0bb821660444	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5580-0d44-5411-4590d3053996	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7417202)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5580-0d44-ea56-949d866e48d6	01	Velika predstava	f	1.00	1.00
002b0000-5580-0d44-317b-b015ab3a7482	02	Mala predstava	f	0.50	0.50
002b0000-5580-0d44-8357-b44537957558	03	Mala koprodukcija	t	0.40	1.00
002b0000-5580-0d44-a4c8-1d2d68c78be4	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5580-0d44-238f-cc995b04b736	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7416692)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7416538)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5580-0d45-6830-32ae3380283f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROV5RRNGHQCol6b0ZHaQlFxkwOCG.bhAW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5580-0d45-1a66-03ab988e2f3c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5580-0d46-8895-888f31506bec	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5580-0d46-8b3f-d011def02cc5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5580-0d46-0321-6153281fb3f7	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5580-0d46-99bf-79af37662b2a	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5580-0d46-e65e-6cc365a94384	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5580-0d46-b0ce-3fe532d8249e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5580-0d46-dbb8-e1977242854e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5580-0d45-fff9-59b940e458a1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7417066)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5580-0d46-c557-0968575ff01b	00160000-5580-0d45-b247-f4aacba63c5a	00150000-5580-0d44-13f2-5f52ca444932	00140000-5580-0d44-0103-4e491948e9b8	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5580-0d46-cd83-2eb1d62c7009
000e0000-5580-0d46-f34d-b439088c4ed8	00160000-5580-0d45-7090-eced961e360a	00150000-5580-0d44-2e4f-ccea890b4620	00140000-5580-0d44-616b-43b44aa4b916	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5580-0d46-d2c2-9f837c8c88c3
000e0000-5580-0d46-244d-912bb26f9bbc	\N	00150000-5580-0d44-2e4f-ccea890b4620	00140000-5580-0d44-616b-43b44aa4b916	00190000-5580-0d46-a46d-323cb8328fc0	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5580-0d46-cd83-2eb1d62c7009
000e0000-5580-0d46-f624-911f331832d7	\N	00150000-5580-0d44-2e4f-ccea890b4620	00140000-5580-0d44-616b-43b44aa4b916	00190000-5580-0d46-a46d-323cb8328fc0	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5580-0d46-cd83-2eb1d62c7009
\.


--
-- TOC entry 2844 (class 0 OID 7416754)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5580-0d46-ce1b-8ee30d2c4ba7	000e0000-5580-0d46-f34d-b439088c4ed8	1	
00200000-5580-0d46-6728-e4cb7b47ef68	000e0000-5580-0d46-f34d-b439088c4ed8	2	
\.


--
-- TOC entry 2859 (class 0 OID 7416879)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7416948)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7416786)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7417056)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5580-0d44-0103-4e491948e9b8	01	Drama	drama (SURS 01)
00140000-5580-0d44-ebcc-6ca7231f83c9	02	Opera	opera (SURS 02)
00140000-5580-0d44-8649-ab1bf5c8eb16	03	Balet	balet (SURS 03)
00140000-5580-0d44-2f65-bbdb73e60949	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5580-0d44-4ab2-aff50c3613fc	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5580-0d44-616b-43b44aa4b916	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5580-0d44-8b2f-8230c91610ba	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7416938)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5580-0d44-43af-054dc2753a77	01	Opera	opera
00150000-5580-0d44-079e-a041b02bfebe	02	Opereta	opereta
00150000-5580-0d44-d9ba-2e8fa199d546	03	Balet	balet
00150000-5580-0d44-8d61-3202e641a31f	04	Plesne prireditve	plesne prireditve
00150000-5580-0d44-6313-a6670830158a	05	Lutkovno gledališče	lutkovno gledališče
00150000-5580-0d44-3c4d-6a3ac13ed2af	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5580-0d44-1e54-f8deb9cc988a	07	Biografska drama	biografska drama
00150000-5580-0d44-13f2-5f52ca444932	08	Komedija	komedija
00150000-5580-0d44-b965-aa18ba303a49	09	Črna komedija	črna komedija
00150000-5580-0d44-78fb-fc9b8792f9a3	10	E-igra	E-igra
00150000-5580-0d44-2e4f-ccea890b4620	11	Kriminalka	kriminalka
00150000-5580-0d44-a6fe-4bb4b2ce5cef	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7416592)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7417113)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7417103)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7417008)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7416776)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7416801)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7416718)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7417146)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7416934)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7416752)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7416795)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7416732)
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
-- TOC entry 2499 (class 2606 OID 7416844)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7416871)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7416690)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7416601)
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
-- TOC entry 2414 (class 2606 OID 7416625)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7416581)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7416566)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7416877)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7416910)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7417051)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7416654)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7416678)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7416850)
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
-- TOC entry 2429 (class 2606 OID 7416668)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7416739)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7416862)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7416990)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7417036)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7417161)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7417231)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7417178)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7417199)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7416894)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7416835)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7416826)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7417030)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7416962)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7416537)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7416901)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7416555)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7416575)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7416919)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7416857)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7416807)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7417255)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7417243)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7417237)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7416975)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7416634)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7416817)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7417019)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7417212)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7416703)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7416550)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7417082)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7416761)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7416885)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7416953)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7416790)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7417064)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7416946)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7416783)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7416976)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7416977)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7416656)
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
-- TOC entry 2512 (class 1259 OID 7416878)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7416864)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7416863)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7416762)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7416935)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7416937)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7416936)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7416734)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7416733)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7417053)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7417054)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7417055)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7417201)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7417200)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7417087)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7417084)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7417088)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7417086)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7417085)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7416705)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7416704)
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
-- TOC entry 2412 (class 1259 OID 7416628)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7416902)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7416796)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7416582)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7416583)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7416922)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7416921)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7416920)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7416740)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7416742)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7416741)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7417245)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7416830)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7416828)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7416827)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7416829)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7416556)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7416557)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7416886)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7416851)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7416963)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7416964)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7417147)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7417148)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7417149)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7416670)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7416669)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7416671)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7417232)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7416991)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7416992)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7417117)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7417119)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7417115)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7417118)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7417116)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7416954)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7416839)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7416838)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7416836)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7416837)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7417105)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7417104)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7417162)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7416753)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7416603)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7416602)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7416635)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7416636)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7416820)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7416819)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7416818)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7417181)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7417179)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7417180)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7416785)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7416781)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7416778)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7416779)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7416777)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7416782)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7416780)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7416655)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7416719)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7416721)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7416720)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7416722)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7416845)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7417052)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7417083)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7416626)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7416627)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7416947)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7417256)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7416691)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7417244)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7416896)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7416895)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7417114)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7416679)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7417065)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7417037)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7417038)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7416576)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7416784)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7417392)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7417377)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7417382)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7417402)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7417372)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7417397)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7417387)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7417547)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7417552)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7417307)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7417487)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7417482)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7417477)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7417367)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7417517)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7417527)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7417522)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7417342)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7417337)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7417467)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7417572)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7417577)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7417582)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7417687)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7417682)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7417602)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7417587)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7417607)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7417597)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7417592)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7417332)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7417327)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7417292)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7417287)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7417497)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7417407)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7417267)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7417272)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7417512)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7417507)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7417502)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7417347)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7417357)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7417352)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7417697)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7417442)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7417432)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7417427)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7417437)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7417257)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7417262)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7417492)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7417472)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7417537)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7417542)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7417647)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7417652)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7417657)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7417317)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7417312)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7417322)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7417692)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7417557)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7417562)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7417632)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7417642)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7417622)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7417637)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7417627)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7417532)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7417462)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7417457)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7417447)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7417452)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7417617)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7417612)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7417662)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7417362)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7417567)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7417282)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7417277)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7417297)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7417302)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7417422)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7417417)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7417412)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7417677)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7417667)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7417672)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-16 13:49:27 CEST

--
-- PostgreSQL database dump complete
--

