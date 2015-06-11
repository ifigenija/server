--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-11 16:17:36 CEST

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
-- TOC entry 180 (class 1259 OID 6972352)
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
-- TOC entry 227 (class 1259 OID 6972874)
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
-- TOC entry 226 (class 1259 OID 6972857)
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
-- TOC entry 219 (class 1259 OID 6972761)
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
-- TOC entry 194 (class 1259 OID 6972531)
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
-- TOC entry 197 (class 1259 OID 6972565)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6972474)
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
-- TOC entry 228 (class 1259 OID 6972888)
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
-- TOC entry 213 (class 1259 OID 6972691)
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
-- TOC entry 192 (class 1259 OID 6972511)
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
-- TOC entry 196 (class 1259 OID 6972559)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6972491)
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
-- TOC entry 202 (class 1259 OID 6972608)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6972633)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6972448)
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
-- TOC entry 181 (class 1259 OID 6972361)
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
-- TOC entry 182 (class 1259 OID 6972372)
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
-- TOC entry 177 (class 1259 OID 6972326)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6972345)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6972640)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6972671)
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
-- TOC entry 223 (class 1259 OID 6972807)
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
-- TOC entry 184 (class 1259 OID 6972405)
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
-- TOC entry 186 (class 1259 OID 6972440)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6972614)
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
-- TOC entry 185 (class 1259 OID 6972425)
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
-- TOC entry 191 (class 1259 OID 6972503)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6972626)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6972746)
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
-- TOC entry 222 (class 1259 OID 6972799)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6972914)
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
-- TOC entry 233 (class 1259 OID 6972977)
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
-- TOC entry 230 (class 1259 OID 6972927)
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
-- TOC entry 231 (class 1259 OID 6972946)
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
-- TOC entry 209 (class 1259 OID 6972655)
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
-- TOC entry 201 (class 1259 OID 6972599)
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
-- TOC entry 200 (class 1259 OID 6972589)
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
-- TOC entry 221 (class 1259 OID 6972788)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6972723)
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
-- TOC entry 174 (class 1259 OID 6972297)
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
-- TOC entry 173 (class 1259 OID 6972295)
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
-- TOC entry 210 (class 1259 OID 6972665)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6972335)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6972319)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6972679)
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
-- TOC entry 204 (class 1259 OID 6972620)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6972570)
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
-- TOC entry 236 (class 1259 OID 6973010)
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
-- TOC entry 235 (class 1259 OID 6973002)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 6972997)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6972733)
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
-- TOC entry 183 (class 1259 OID 6972397)
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
-- TOC entry 199 (class 1259 OID 6972576)
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
-- TOC entry 220 (class 1259 OID 6972777)
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
-- TOC entry 232 (class 1259 OID 6972966)
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
-- TOC entry 188 (class 1259 OID 6972460)
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
-- TOC entry 175 (class 1259 OID 6972306)
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
-- TOC entry 225 (class 1259 OID 6972834)
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
-- TOC entry 193 (class 1259 OID 6972522)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6972647)
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
-- TOC entry 215 (class 1259 OID 6972716)
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
-- TOC entry 195 (class 1259 OID 6972554)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6972824)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6972706)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 6972300)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 6972352)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 6972874)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5579-987f-5cdc-3f117dd964f9	000d0000-5579-987f-1b70-9f30dd5dc642	\N	00090000-5579-987f-47ae-c566a712bfc2	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-987f-7a5e-a04cbad3cb4a	000d0000-5579-987f-58e5-966e71beb9ff	\N	00090000-5579-987f-8026-2130cfbb742f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-987f-b447-04612d7524ca	000d0000-5579-987f-e753-8944d63c8cc0	\N	00090000-5579-987f-05ed-eca2d69629db	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-987f-a9db-cd5aa4381edf	000d0000-5579-987f-11b4-b173fa5985cd	\N	00090000-5579-987f-daa9-f8b7bf0a88c8	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-987f-b88e-121bb1ce8d98	000d0000-5579-987f-957c-ae8872addef9	\N	00090000-5579-987f-586f-44a28e3a5730	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5579-987f-c14e-4f243caa9254	000d0000-5579-987f-5e57-d008d7178a2f	\N	00090000-5579-987f-8026-2130cfbb742f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 6972857)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 6972761)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5579-987f-22c0-528f4f48f684	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5579-987f-14f4-24e9ef15445e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5579-987f-82fa-0696ba610093	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 6972531)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5579-987f-39e1-f6c0fa1c1ab7	\N	\N	00200000-5579-987f-a931-aa03bcf75290	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5579-987f-13fb-d1625ab670ef	\N	\N	00200000-5579-987f-ee93-41b32e75e874	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5579-987f-823d-7bfff35d204b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5579-987f-75fa-1ee9c6a4173f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5579-987f-f95c-4d2f65f740f2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 6972565)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6972474)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5579-987e-c86d-c61b43337299	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5579-987e-f45b-722c961a71f4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5579-987e-9677-4812d69bdf33	AL	ALB	008	Albania 	Albanija	\N
00040000-5579-987e-17d4-62ecf2f90d35	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5579-987e-9fdc-390f67fa5967	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5579-987e-f48d-7e663cad1525	AD	AND	020	Andorra 	Andora	\N
00040000-5579-987e-6ba9-bb7c63a3ead1	AO	AGO	024	Angola 	Angola	\N
00040000-5579-987e-65d4-8fddd46e650e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5579-987e-83c0-8770eb0146f6	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5579-987e-0b79-6bd5cf5e9430	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-987e-645c-0b23c0e88a07	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5579-987e-79a9-c405d939db53	AM	ARM	051	Armenia 	Armenija	\N
00040000-5579-987e-f89a-d9d629eac955	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5579-987e-1000-712e761bd62d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5579-987e-7f74-fb20f15c748f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5579-987e-6838-da0bd57ac624	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5579-987e-4922-1d1c1066634c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5579-987e-3e9d-016acbf51fc7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5579-987e-6f47-d270a99e4844	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5579-987e-f46d-36525736919b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5579-987e-1187-b7d2e59e15e5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5579-987e-8ab8-1c186b1180b2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5579-987e-40c4-a751e0ab558b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5579-987e-02b0-f268bd8bfd0c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5579-987e-4d96-d069bcf44721	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5579-987e-871d-928d00dfef8c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5579-987e-2e36-3cdcf0d2d1d0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5579-987e-a289-7c7e77267311	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5579-987e-627a-f63db6ee9ad9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5579-987e-0460-3a387a42bbe1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5579-987e-f454-ba4924a1c0ce	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5579-987e-5d2d-184ef7a38cad	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5579-987e-0564-bf19d8bf40de	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5579-987e-1bae-5f7719963e06	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5579-987e-edf1-89150cfcf6d7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5579-987e-4188-1aeb179cc84e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5579-987e-83e6-64e3aaa469b6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5579-987e-8019-7d108d78a1a0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5579-987e-f8f0-ed65bd3b18c0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5579-987e-ded6-bea0cfee46f8	CA	CAN	124	Canada 	Kanada	\N
00040000-5579-987e-16e2-013760445ee0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5579-987e-5195-ca9287d90ee0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5579-987e-044b-be65d60a4122	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5579-987e-9a51-fdb400c70989	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5579-987e-3b3b-dcae38d60a95	CL	CHL	152	Chile 	Čile	\N
00040000-5579-987e-5a22-a8a6e20d5417	CN	CHN	156	China 	Kitajska	\N
00040000-5579-987e-f50e-3ba83785e6b3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5579-987e-1052-69ec2f8702f1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5579-987e-fab1-af7a530f49c1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5579-987e-b212-dc3eb03b2b68	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5579-987e-0a3c-54428b38c9ae	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5579-987e-de9b-57256654262b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5579-987e-9d10-843cb9a88b22	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5579-987e-41fb-5f19e7d9e03b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5579-987e-2b0e-49b55b2f545e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5579-987e-ddd2-a8a31d950ae9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5579-987e-b807-ce7b12595ee0	CU	CUB	192	Cuba 	Kuba	\N
00040000-5579-987e-e815-1142f02d4a7f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5579-987e-a452-f686edeaa361	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5579-987e-fda2-2008c21099b1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5579-987e-a8ec-5a895f9dc94a	DK	DNK	208	Denmark 	Danska	\N
00040000-5579-987e-0374-fce30c4c67f2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5579-987e-3ed8-b03d7171b679	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5579-987e-d851-6709f026c7ac	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5579-987e-2612-e4ea2f7150a2	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5579-987e-f0a9-c39235738ae8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5579-987e-000f-b5518505ae9d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5579-987e-13a0-15cfb5414313	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5579-987e-2850-618c446e6259	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5579-987e-0176-8860be9d85dd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5579-987e-e569-20a1a321e5df	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5579-987e-9e6e-b8242de89b74	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5579-987e-1fad-7e251723667c	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5579-987e-e3c5-1d602976822e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5579-987e-b28f-3c488897189d	FI	FIN	246	Finland 	Finska	\N
00040000-5579-987e-0fd4-65297e13ce5f	FR	FRA	250	France 	Francija	\N
00040000-5579-987e-3209-06c3ba6469d3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5579-987e-9c2c-74324d5fd9d0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5579-987e-ac5e-22246bf2c99b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5579-987e-3e64-af3f4e80b6ef	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5579-987e-272d-5d806a1238b0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5579-987e-09d6-624b2b9c2360	GM	GMB	270	Gambia 	Gambija	\N
00040000-5579-987e-ea66-4ced4fe247e4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5579-987e-38ce-b1d187f65bf0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5579-987e-db70-47f0699d6423	GH	GHA	288	Ghana 	Gana	\N
00040000-5579-987e-020a-711c69c05b88	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5579-987e-740c-b6705c78737d	GR	GRC	300	Greece 	Grčija	\N
00040000-5579-987e-9464-59c6512fd3c1	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5579-987e-84a9-0523287323b0	GD	GRD	308	Grenada 	Grenada	\N
00040000-5579-987e-a02d-952a15757900	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5579-987e-76d1-9e9a795a3287	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5579-987e-06dd-6f2947f14a4c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5579-987e-e3d2-7881a6d1b629	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5579-987e-6710-13c806c653a4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5579-987e-96d8-9573c08175c7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5579-987e-614b-7f781634a456	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5579-987e-afc8-f7b06096b219	HT	HTI	332	Haiti 	Haiti	\N
00040000-5579-987e-d0c3-9d5b70fe063a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5579-987e-751a-2a3461b17102	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5579-987e-827c-771edb5e2664	HN	HND	340	Honduras 	Honduras	\N
00040000-5579-987e-0e09-1c505e005673	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5579-987e-d0b1-3807b2fe6b73	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5579-987e-0b0d-6aacc4585497	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5579-987e-0184-fe62644e6cae	IN	IND	356	India 	Indija	\N
00040000-5579-987e-ce0e-acb2eaed38fb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5579-987e-1cd3-57566ba60db9	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5579-987e-4b0d-4b2b5dc03da2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5579-987e-28d5-216c2779aa17	IE	IRL	372	Ireland 	Irska	\N
00040000-5579-987e-357e-d451ce6403de	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5579-987e-b9df-90b7ed0f8059	IL	ISR	376	Israel 	Izrael	\N
00040000-5579-987e-aca0-e3b8994512a7	IT	ITA	380	Italy 	Italija	\N
00040000-5579-987e-955e-797c8a10d9e9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5579-987e-b8d1-1e03fdd7dee2	JP	JPN	392	Japan 	Japonska	\N
00040000-5579-987e-8f37-78ad3f117e5a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5579-987e-2c3d-8b3ec1ac6a65	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5579-987e-1cfb-3301fde641a4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5579-987e-60e6-4055139e579e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5579-987e-52d1-099d831f710b	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5579-987e-4ab6-315e750fc601	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5579-987e-8763-b0639847e1b3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5579-987e-1b41-4654e1cfd09d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5579-987e-52e6-e08d363c903d	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5579-987e-ad13-c2f034d9c716	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5579-987e-6d8d-c8ea2bd0c5ab	LV	LVA	428	Latvia 	Latvija	\N
00040000-5579-987e-7415-37c1480ea5eb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5579-987e-570e-0026d52f0447	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5579-987e-75e7-8e2d0872dbe3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5579-987e-9312-6e6707731e86	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5579-987e-0a52-b8f3919d8cdc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5579-987e-99b5-2904c6717bf5	LT	LTU	440	Lithuania 	Litva	\N
00040000-5579-987e-da05-14b37a71de1e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5579-987e-147e-d81a96632ddf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5579-987e-e5b1-7b29a3d734cc	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5579-987e-bd50-3dedd6a7ec22	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5579-987e-6dd2-88c60da8b9df	MW	MWI	454	Malawi 	Malavi	\N
00040000-5579-987e-d30c-8b350095807e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5579-987e-7219-ae6480d672a3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5579-987e-b5fb-50e0ac14b50d	ML	MLI	466	Mali 	Mali	\N
00040000-5579-987e-c8a7-0916b7f1d701	MT	MLT	470	Malta 	Malta	\N
00040000-5579-987e-af93-ea5100774216	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5579-987e-5a33-ca58b056b0b7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5579-987e-558e-ec208d1a5838	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5579-987e-5a58-ea82edc6c00b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5579-987e-6609-c69d4b7e022b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5579-987e-c186-e66d5c8fa8d0	MX	MEX	484	Mexico 	Mehika	\N
00040000-5579-987e-8287-0707e9f460ba	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5579-987e-466b-6de346924f0a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5579-987e-4779-cccff9dd1be0	MC	MCO	492	Monaco 	Monako	\N
00040000-5579-987e-656a-270c48ae3c27	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5579-987e-83be-9b0a0669f448	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5579-987e-ba43-3d9abd99ae16	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5579-987e-36fd-72442e395739	MA	MAR	504	Morocco 	Maroko	\N
00040000-5579-987e-d1f6-07cc48c56832	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5579-987e-264d-573337b554ac	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5579-987e-d465-dcd01928379b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5579-987e-c268-e378c801cddd	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5579-987e-ea50-4fe7253bf763	NP	NPL	524	Nepal 	Nepal	\N
00040000-5579-987e-42f1-e6d50e097b30	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5579-987e-31ce-859eb6d36426	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5579-987e-70fe-fcec93610152	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5579-987e-60ac-67a752fe3dc6	NE	NER	562	Niger 	Niger 	\N
00040000-5579-987e-a878-c1a8e7367e0e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5579-987e-3839-a43b31aee92b	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5579-987e-b97e-357a6f7f8aa9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5579-987e-028e-ff86935b9fc8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5579-987e-8a57-1dad58fd9d17	NO	NOR	578	Norway 	Norveška	\N
00040000-5579-987e-f574-4bc8ccfc083e	OM	OMN	512	Oman 	Oman	\N
00040000-5579-987e-6531-6ada30d0c123	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5579-987e-db75-e53e01acfd4a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5579-987e-a9bf-d9e8b9b6a5e9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5579-987e-564f-c0c6f0ef444d	PA	PAN	591	Panama 	Panama	\N
00040000-5579-987e-3188-c06afcd724dc	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5579-987e-4d0d-0bd396df1edb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5579-987e-10ad-f6bd4df13c4f	PE	PER	604	Peru 	Peru	\N
00040000-5579-987e-bde8-fd02434de4d1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5579-987e-58a0-dd3ef2dc0dc1	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5579-987e-ff95-66935efb045f	PL	POL	616	Poland 	Poljska	\N
00040000-5579-987e-1cb6-20a701a9e68f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5579-987e-fccc-00002a80fcd3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5579-987e-f516-777f303d0291	QA	QAT	634	Qatar 	Katar	\N
00040000-5579-987e-b27c-6ee2fa2cd5b0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5579-987e-5f4c-151529ab5c1f	RO	ROU	642	Romania 	Romunija	\N
00040000-5579-987e-60a5-568d7899e51f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5579-987e-f547-2947714c220f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5579-987e-546d-51467692cf45	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5579-987e-03dc-2a68208dc5b7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5579-987e-fffb-65d3b5544463	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5579-987e-f0cc-628444f4c74b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5579-987e-29ad-e6df6ed32d8d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5579-987e-5cef-c85f4347525e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5579-987e-e476-132c832c77c3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5579-987e-85ce-4b25a0d44b29	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5579-987e-7a5d-7a16f3fbd410	SM	SMR	674	San Marino 	San Marino	\N
00040000-5579-987e-c4eb-ea3dfa5f8559	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5579-987e-bd38-4c697fcd837d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5579-987e-52d8-0cafdd1e5008	SN	SEN	686	Senegal 	Senegal	\N
00040000-5579-987e-16ef-8698a121e33a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5579-987e-fb5b-066ff5c0f386	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5579-987e-4d37-0d4d79bf7282	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5579-987e-6271-1c9b1f3211e4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5579-987e-86c2-f875ba1cc592	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5579-987e-82e5-7bb1ecf3d752	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5579-987e-a632-3388c73eed61	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5579-987e-bc80-1c6064e80bef	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5579-987e-4f66-6f94f0c9b440	SO	SOM	706	Somalia 	Somalija	\N
00040000-5579-987e-e248-7fe0a5abf3b9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5579-987e-d832-cd530bcdb8ed	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5579-987e-a299-2d779e45b962	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5579-987e-6de8-2ff5661b157f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5579-987e-42bb-1357077f11f3	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5579-987e-c091-420cdb9e92f7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5579-987e-30c7-f192f429a993	SR	SUR	740	Suriname 	Surinam	\N
00040000-5579-987e-a80c-4971424ae5e9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5579-987e-9f6f-bbcb77acb01f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5579-987e-1881-f72e15e0ec3c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5579-987e-ed66-3bd10db207c1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5579-987e-1815-f5192ea6b1cb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5579-987e-43b8-b75c4e8d8c1d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5579-987e-3896-1559c61849a4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5579-987e-3497-ed6ee74caad5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5579-987e-7720-ffc19b78924b	TH	THA	764	Thailand 	Tajska	\N
00040000-5579-987e-73ae-6bcc9d81edf1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5579-987e-e16b-963b86d97d7f	TG	TGO	768	Togo 	Togo	\N
00040000-5579-987e-ee2d-b67974d38dbe	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5579-987e-0ab3-b6ff65bb82a1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5579-987e-a56c-7d1a0969813f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5579-987e-422b-d41252e2b737	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5579-987e-b8ae-a37bcc46ce7b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5579-987e-d407-cd5562f8d810	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5579-987e-52f9-ab7b910c5ff8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-987e-a226-55ab6467524d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5579-987e-e060-02dae85f2a8f	UG	UGA	800	Uganda 	Uganda	\N
00040000-5579-987e-2970-7dc423f17d37	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5579-987e-d9e7-cae627cd9810	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5579-987e-daeb-075ce4864d7a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5579-987e-586b-93eceb13a972	US	USA	840	United States 	Združene države Amerike	\N
00040000-5579-987e-3869-259f68ac40bc	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5579-987e-6f34-fa5d73eea57d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5579-987e-18ec-e7aa25430f7c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5579-987e-b750-00948c0941e5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5579-987e-ad5d-e02f69947518	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5579-987e-7f3e-a7148dcc0bd3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5579-987e-0f80-868896897bd7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5579-987e-2a4e-38e3e0781262	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5579-987e-0a7b-870566b73da1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5579-987e-93d6-2545ec8de9ff	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5579-987e-b24d-a029727ddfda	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5579-987e-dbcb-bca54a4b7d4a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5579-987e-893a-584358cb01f4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 6972888)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 6972691)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5579-987f-b9dc-2329120b0d60	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5579-987e-a692-35f08f235345
000d0000-5579-987f-1b70-9f30dd5dc642	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-987e-a692-35f08f235345
000d0000-5579-987f-58e5-966e71beb9ff	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5579-987e-e0c9-9c8ca369efda
000d0000-5579-987f-e753-8944d63c8cc0	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5579-987e-1558-ed11b9dfda4f
000d0000-5579-987f-11b4-b173fa5985cd	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5579-987e-1558-ed11b9dfda4f
000d0000-5579-987f-957c-ae8872addef9	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5579-987e-1558-ed11b9dfda4f
000d0000-5579-987f-5e57-d008d7178a2f	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5579-987e-a692-35f08f235345
\.


--
-- TOC entry 2839 (class 0 OID 6972511)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 6972559)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6972491)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5579-987f-1b3a-92f76e39de89	00080000-5579-987f-203d-fc2cc44cb0e8	00090000-5579-987f-47ae-c566a712bfc2	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 6972608)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 6972633)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 6972448)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5579-987e-de92-0ea93dc6dcd9	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5579-987e-d77d-a1592de33cee	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5579-987e-77d2-aa5223fdfbf3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5579-987e-1207-90f6f4beb844	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5579-987e-1046-9367f879150c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5579-987e-faeb-d35b90d03dd4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5579-987e-0313-ab6c346e03ac	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5579-987e-fa88-cf6bf78936a6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5579-987e-a586-606c2ae65a6a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5579-987e-890b-016fc59faf81	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5579-987e-7a2b-2c8813f89e0f	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5579-987e-7c7c-fd14300ec22e	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5579-987e-ccb9-8ee49da1f0ee	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-987e-3e54-088182c17716	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5579-987e-7b5d-4a415eab00dd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5579-987e-f102-13dc27ece9d5	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 6972361)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5579-987e-a80a-b1977b9698d0	00000000-5579-987e-1046-9367f879150c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5579-987e-cf72-cdf62540d76f	00000000-5579-987e-1046-9367f879150c	00010000-5579-987e-d395-ddd5b6c6605f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5579-987e-e6ae-11ef77acb6c3	00000000-5579-987e-faeb-d35b90d03dd4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 6972372)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5579-987f-ca24-e2dd97a0a0cd	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5579-987f-daa9-f8b7bf0a88c8	00010000-5579-987f-1a80-6d9923702473	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5579-987f-05ed-eca2d69629db	00010000-5579-987f-8d72-8557366e88b8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5579-987f-22b8-a0f6c57db2fd	00010000-5579-987f-689d-48c0b9e293b8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5579-987f-8885-acc82508bb0f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5579-987f-8e70-3180dc9f56f5	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5579-987f-21f2-ed615121dc84	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5579-987f-4751-d69fb37fe072	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5579-987f-47ae-c566a712bfc2	00010000-5579-987f-f517-701526ba8f7c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5579-987f-8026-2130cfbb742f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5579-987f-83f6-621f150717cd	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5579-987f-586f-44a28e3a5730	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5579-987f-0629-a010b31a9247	00010000-5579-987f-5c39-e8fd0791ba78	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6972326)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5579-987e-1057-40d41cdaf6a1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5579-987e-48f4-e58aedc7aecf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5579-987e-7e1b-28b58901eccf	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5579-987e-19f0-62868838a9cd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5579-987e-2e6b-3ee96e7120c9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5579-987e-febf-3a018ad1f2b5	Abonma-read	Abonma - branje	f
00030000-5579-987e-158a-a0d169f1a044	Abonma-write	Abonma - spreminjanje	f
00030000-5579-987e-aaae-094ce78cadcb	Alternacija-read	Alternacija - branje	f
00030000-5579-987e-b83b-705fcd35f88f	Alternacija-write	Alternacija - spreminjanje	f
00030000-5579-987e-77a7-f958d7e73f5d	Arhivalija-read	Arhivalija - branje	f
00030000-5579-987e-d7da-a99eecc560b2	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5579-987e-68cf-2acaacd355fd	Besedilo-read	Besedilo - branje	f
00030000-5579-987e-00d6-4827636d5da3	Besedilo-write	Besedilo - spreminjanje	f
00030000-5579-987e-d72b-5750c010b3af	DogodekIzven-read	DogodekIzven - branje	f
00030000-5579-987e-c781-c0d4375bb51c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5579-987e-c715-66f7c0df1047	Dogodek-read	Dogodek - branje	f
00030000-5579-987e-c42a-365ec90ef062	Dogodek-write	Dogodek - spreminjanje	f
00030000-5579-987e-2df9-f0ac8a00f3a1	Drzava-read	Drzava - branje	f
00030000-5579-987e-22bd-da2be7114d90	Drzava-write	Drzava - spreminjanje	f
00030000-5579-987e-e92d-af6f99acd364	Funkcija-read	Funkcija - branje	f
00030000-5579-987e-ae7d-65e2a36a19cd	Funkcija-write	Funkcija - spreminjanje	f
00030000-5579-987e-16c0-a96f79021e0b	Gostovanje-read	Gostovanje - branje	f
00030000-5579-987e-1c4f-020ef5eb88ba	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5579-987e-f01e-62f28606ad03	Gostujoca-read	Gostujoca - branje	f
00030000-5579-987e-6b5e-bfeb7cccf6f1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5579-987e-76f2-3ee7d352bf04	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5579-987e-e072-d3c94323ec9e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5579-987e-cafb-3ef7bda0df8c	Kupec-read	Kupec - branje	f
00030000-5579-987e-ceef-8c99e7d01446	Kupec-write	Kupec - spreminjanje	f
00030000-5579-987e-d494-3bc834568fef	NacinPlacina-read	NacinPlacina - branje	f
00030000-5579-987e-4714-5abe7096abba	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5579-987e-3989-f2c687605e68	Option-read	Option - branje	f
00030000-5579-987e-fdc2-be2ac010200c	Option-write	Option - spreminjanje	f
00030000-5579-987e-e47f-9dab0ff23257	OptionValue-read	OptionValue - branje	f
00030000-5579-987e-7830-f5407ee87fc2	OptionValue-write	OptionValue - spreminjanje	f
00030000-5579-987e-ff27-e103e4a61985	Oseba-read	Oseba - branje	f
00030000-5579-987e-6b2b-74f857b0177c	Oseba-write	Oseba - spreminjanje	f
00030000-5579-987e-da69-5e381fab40c5	Permission-read	Permission - branje	f
00030000-5579-987e-41b1-aa94371cc3fc	Permission-write	Permission - spreminjanje	f
00030000-5579-987e-7ffe-e59738aef092	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5579-987e-a323-0239bfc427fb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5579-987e-31f3-72651bcce9a1	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5579-987e-b428-6e3f97dfde98	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5579-987e-f4f4-eeab91c882d6	Pogodba-read	Pogodba - branje	f
00030000-5579-987e-bb51-ed92b506b9c3	Pogodba-write	Pogodba - spreminjanje	f
00030000-5579-987e-d2df-aaaab307f411	Popa-read	Popa - branje	f
00030000-5579-987e-8726-42e73e8b53b2	Popa-write	Popa - spreminjanje	f
00030000-5579-987e-0701-f2f74502c815	Posta-read	Posta - branje	f
00030000-5579-987e-3ba0-1ab2aafd6bcc	Posta-write	Posta - spreminjanje	f
00030000-5579-987e-bdb3-52c2fb68e0a1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5579-987e-9d28-da5ce975cd2a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5579-987e-41ac-e9e0a6a6f656	PostniNaslov-read	PostniNaslov - branje	f
00030000-5579-987e-ef43-e0a52400e402	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5579-987e-dfc6-f8509c709a50	Predstava-read	Predstava - branje	f
00030000-5579-987e-c0d1-8952b589e53e	Predstava-write	Predstava - spreminjanje	f
00030000-5579-987e-7f03-1b1e977c3169	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5579-987e-b39a-15c72d36f3e9	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5579-987e-474f-89ce8f63d64a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5579-987e-92b3-d38fccf088e0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5579-987e-7eac-ad52719b5c27	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5579-987e-1a90-ef0e9add6f60	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5579-987e-21dc-40f9e598bce2	ProgramDela-read	ProgramDela - branje	f
00030000-5579-987e-340c-8768948954dc	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5579-987e-a34c-3ea7d620ba8a	ProgramFestival-read	ProgramFestival - branje	f
00030000-5579-987e-636b-2113d603fed8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5579-987e-8bb1-49ebb1a3cbab	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5579-987e-edc0-85d05d447d64	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5579-987e-23e3-f8ccf5471a7d	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5579-987e-71db-7b63346b1ee3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5579-987e-78c8-37faec0b4736	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5579-987e-4bd9-f1c1c3a797ca	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5579-987e-bdbd-a8218494079b	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5579-987e-5410-85f6d2a2fc97	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5579-987e-04db-dd061d5b1719	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5579-987e-1297-afc059b485ca	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5579-987e-fa24-a13a35a9d8ff	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5579-987e-d8cb-4a9d3a7d23d8	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5579-987e-1132-a551c9552490	ProgramRazno-read	ProgramRazno - branje	f
00030000-5579-987e-f466-a94d8e6dbd7b	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5579-987e-04a5-d191adf9d48f	Prostor-read	Prostor - branje	f
00030000-5579-987e-19fa-b83765bad03a	Prostor-write	Prostor - spreminjanje	f
00030000-5579-987e-928e-f4ed191390a7	Racun-read	Racun - branje	f
00030000-5579-987e-7fa0-a899e646f045	Racun-write	Racun - spreminjanje	f
00030000-5579-987e-c746-83faa5f10b07	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5579-987e-2bcf-bd7c9425e30e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5579-987e-0a28-458a189e4b51	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5579-987e-220a-12be750ef07c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5579-987e-52cc-1bf83f4b4de8	Rekvizit-read	Rekvizit - branje	f
00030000-5579-987e-fb46-5650459ef06d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5579-987e-10e6-20c7b1138f21	Revizija-read	Revizija - branje	f
00030000-5579-987e-bfbb-7ddea8633fb4	Revizija-write	Revizija - spreminjanje	f
00030000-5579-987e-6a01-13941da3a8de	Rezervacija-read	Rezervacija - branje	f
00030000-5579-987e-a08d-08ac873b5458	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5579-987e-0567-352ed9ea1b54	Role-read	Role - branje	f
00030000-5579-987e-bf05-8b1c1fda60da	Role-write	Role - spreminjanje	f
00030000-5579-987e-3b5c-360524c76ba8	SedezniRed-read	SedezniRed - branje	f
00030000-5579-987e-1abb-88723f263b07	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5579-987e-c05b-b86dffc4a929	Sedez-read	Sedez - branje	f
00030000-5579-987e-a129-07804e27b8b0	Sedez-write	Sedez - spreminjanje	f
00030000-5579-987e-0294-d338b33b1653	Sezona-read	Sezona - branje	f
00030000-5579-987e-ef12-6510d97925ef	Sezona-write	Sezona - spreminjanje	f
00030000-5579-987e-8068-4d22e508e794	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5579-987e-adb8-296e17937c1b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5579-987e-8a4b-b3e8be896cc3	Stevilcenje-read	Stevilcenje - branje	f
00030000-5579-987e-c517-026606c13ae6	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5579-987e-fd5b-a657b141e762	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5579-987e-129c-8ad4f66117e1	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5579-987e-aa0d-7ad1ff2e2c51	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5579-987e-d2a8-e5256c47f8ab	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5579-987e-63c4-5b93ab6e3be4	Telefonska-read	Telefonska - branje	f
00030000-5579-987e-c222-f5ce53134cca	Telefonska-write	Telefonska - spreminjanje	f
00030000-5579-987e-b19c-06a9b26ea4bf	TerminStoritve-read	TerminStoritve - branje	f
00030000-5579-987e-6d9a-dcd5cab45b4f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5579-987e-37b5-52d82aec1a44	TipFunkcije-read	TipFunkcije - branje	f
00030000-5579-987e-2aea-259d7a1d0021	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5579-987e-6209-a0dc8fd76af4	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5579-987e-2bd2-a384fd223c34	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5579-987e-dafe-b41916f4f729	Trr-read	Trr - branje	f
00030000-5579-987e-b342-3a701257e27d	Trr-write	Trr - spreminjanje	f
00030000-5579-987e-e3c7-855f06fd2d6e	Uprizoritev-read	Uprizoritev - branje	f
00030000-5579-987e-79ce-6872a681d7ef	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5579-987e-e4bf-ad9461f24ff1	User-read	User - branje	f
00030000-5579-987e-3709-23f109e85c9f	User-write	User - spreminjanje	f
00030000-5579-987e-4938-93009258af4d	Vaja-read	Vaja - branje	f
00030000-5579-987e-9eef-53824f1bb8d3	Vaja-write	Vaja - spreminjanje	f
00030000-5579-987e-5378-ccf99ba54fff	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5579-987e-09c6-282f16f0ffdd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5579-987e-18f7-4766abece41e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5579-987e-bf57-f8e8e71282a6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5579-987e-d82b-9d46c48e2fe4	Zasedenost-read	Zasedenost - branje	f
00030000-5579-987e-f502-9f523804fd81	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5579-987e-f176-a49dd57d24bf	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5579-987e-a830-29bc114b81a6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5579-987e-5468-396580c67555	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5579-987e-9887-0fc218f44f34	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 6972345)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5579-987e-f69c-30e87e5e9abe	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-febf-3a018ad1f2b5
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-158a-a0d169f1a044
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-aaae-094ce78cadcb
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-b83b-705fcd35f88f
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-77a7-f958d7e73f5d
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-c715-66f7c0df1047
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-19f0-62868838a9cd
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-c42a-365ec90ef062
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-22bd-da2be7114d90
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-e92d-af6f99acd364
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-ae7d-65e2a36a19cd
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-16c0-a96f79021e0b
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-1c4f-020ef5eb88ba
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-f01e-62f28606ad03
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-6b5e-bfeb7cccf6f1
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-76f2-3ee7d352bf04
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-e072-d3c94323ec9e
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-3989-f2c687605e68
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-e47f-9dab0ff23257
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-ff27-e103e4a61985
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-6b2b-74f857b0177c
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-d2df-aaaab307f411
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-8726-42e73e8b53b2
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-0701-f2f74502c815
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-3ba0-1ab2aafd6bcc
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-41ac-e9e0a6a6f656
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-ef43-e0a52400e402
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-dfc6-f8509c709a50
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-c0d1-8952b589e53e
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-7eac-ad52719b5c27
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-1a90-ef0e9add6f60
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-04a5-d191adf9d48f
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-19fa-b83765bad03a
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-0a28-458a189e4b51
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-220a-12be750ef07c
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-52cc-1bf83f4b4de8
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-fb46-5650459ef06d
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-0294-d338b33b1653
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-ef12-6510d97925ef
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-37b5-52d82aec1a44
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-e3c7-855f06fd2d6e
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-79ce-6872a681d7ef
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-4938-93009258af4d
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-9eef-53824f1bb8d3
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-d82b-9d46c48e2fe4
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-f502-9f523804fd81
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-f176-a49dd57d24bf
00020000-5579-987e-81c0-e1c502614277	00030000-5579-987e-5468-396580c67555
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-febf-3a018ad1f2b5
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-77a7-f958d7e73f5d
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-c715-66f7c0df1047
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-16c0-a96f79021e0b
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-f01e-62f28606ad03
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-76f2-3ee7d352bf04
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-e072-d3c94323ec9e
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-3989-f2c687605e68
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-e47f-9dab0ff23257
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-ff27-e103e4a61985
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-6b2b-74f857b0177c
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-d2df-aaaab307f411
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-0701-f2f74502c815
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-41ac-e9e0a6a6f656
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-ef43-e0a52400e402
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-dfc6-f8509c709a50
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-04a5-d191adf9d48f
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-0a28-458a189e4b51
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-52cc-1bf83f4b4de8
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-0294-d338b33b1653
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-63c4-5b93ab6e3be4
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-c222-f5ce53134cca
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-dafe-b41916f4f729
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-b342-3a701257e27d
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-18f7-4766abece41e
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-bf57-f8e8e71282a6
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-f176-a49dd57d24bf
00020000-5579-987e-1a2e-fdd85aeeffa2	00030000-5579-987e-5468-396580c67555
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-febf-3a018ad1f2b5
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-aaae-094ce78cadcb
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-77a7-f958d7e73f5d
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-d7da-a99eecc560b2
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-68cf-2acaacd355fd
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-d72b-5750c010b3af
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-c715-66f7c0df1047
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-e92d-af6f99acd364
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-16c0-a96f79021e0b
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-f01e-62f28606ad03
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-76f2-3ee7d352bf04
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-3989-f2c687605e68
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-e47f-9dab0ff23257
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-ff27-e103e4a61985
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-d2df-aaaab307f411
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-0701-f2f74502c815
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-dfc6-f8509c709a50
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-7eac-ad52719b5c27
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-04a5-d191adf9d48f
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-0a28-458a189e4b51
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-52cc-1bf83f4b4de8
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-0294-d338b33b1653
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-37b5-52d82aec1a44
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-4938-93009258af4d
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-d82b-9d46c48e2fe4
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-f176-a49dd57d24bf
00020000-5579-987e-ad67-114f9fb9a58d	00030000-5579-987e-5468-396580c67555
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-febf-3a018ad1f2b5
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-158a-a0d169f1a044
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-b83b-705fcd35f88f
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-77a7-f958d7e73f5d
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-c715-66f7c0df1047
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-16c0-a96f79021e0b
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-f01e-62f28606ad03
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-3989-f2c687605e68
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-e47f-9dab0ff23257
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-d2df-aaaab307f411
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-0701-f2f74502c815
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-dfc6-f8509c709a50
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-04a5-d191adf9d48f
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-0a28-458a189e4b51
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-52cc-1bf83f4b4de8
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-0294-d338b33b1653
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-37b5-52d82aec1a44
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-f176-a49dd57d24bf
00020000-5579-987e-e4ca-58e095fc3fdf	00030000-5579-987e-5468-396580c67555
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-febf-3a018ad1f2b5
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-77a7-f958d7e73f5d
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-c715-66f7c0df1047
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-2df9-f0ac8a00f3a1
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-16c0-a96f79021e0b
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-f01e-62f28606ad03
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-3989-f2c687605e68
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-e47f-9dab0ff23257
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-d2df-aaaab307f411
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-0701-f2f74502c815
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-dfc6-f8509c709a50
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-04a5-d191adf9d48f
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-0a28-458a189e4b51
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-52cc-1bf83f4b4de8
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-0294-d338b33b1653
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-b19c-06a9b26ea4bf
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-7e1b-28b58901eccf
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-37b5-52d82aec1a44
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-f176-a49dd57d24bf
00020000-5579-987e-3bb9-4ed14380d994	00030000-5579-987e-5468-396580c67555
\.


--
-- TOC entry 2854 (class 0 OID 6972640)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 6972671)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 6972807)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6972405)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5579-987f-203d-fc2cc44cb0e8	00040000-5579-987e-c86d-c61b43337299	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-987f-eb31-5fed38d72ca9	00040000-5579-987e-c86d-c61b43337299	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-987f-2996-6c70633fd1ac	00040000-5579-987e-c86d-c61b43337299	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5579-987f-d5e4-1e215da4b7f5	00040000-5579-987e-c86d-c61b43337299	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 6972440)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5579-987d-6195-62ab6afc0179	8341	Adlešiči
00050000-5579-987d-7beb-83fd21a7ab98	5270	Ajdovščina
00050000-5579-987d-b403-9cd0c1ab355d	6280	Ankaran/Ancarano
00050000-5579-987d-de1f-f9263e46e3f2	9253	Apače
00050000-5579-987d-010a-d0d089a4a41b	8253	Artiče
00050000-5579-987d-89df-b8c4377a0e48	4275	Begunje na Gorenjskem
00050000-5579-987d-f45f-fe44a140f403	1382	Begunje pri Cerknici
00050000-5579-987d-0419-a1711157c0ae	9231	Beltinci
00050000-5579-987d-7c9c-b98b4bcaa6af	2234	Benedikt
00050000-5579-987d-6603-caaeab0dfdd6	2345	Bistrica ob Dravi
00050000-5579-987d-f9d1-c173f7962488	3256	Bistrica ob Sotli
00050000-5579-987d-702b-21917fe54579	8259	Bizeljsko
00050000-5579-987d-6c44-da53bb3daf0b	1223	Blagovica
00050000-5579-987d-0272-bafef28ed6fa	8283	Blanca
00050000-5579-987d-67e8-22466c91198a	4260	Bled
00050000-5579-987d-8cf4-21e708b624e5	4273	Blejska Dobrava
00050000-5579-987d-7a73-cb01a47a88ce	9265	Bodonci
00050000-5579-987d-9cc6-96a0f8dddd99	9222	Bogojina
00050000-5579-987d-22b5-3d7d437b987b	4263	Bohinjska Bela
00050000-5579-987d-0da5-d20b6999b852	4264	Bohinjska Bistrica
00050000-5579-987d-92fd-0a3685271c2c	4265	Bohinjsko jezero
00050000-5579-987d-b796-3518d3689b57	1353	Borovnica
00050000-5579-987d-53a8-2c76e1fde139	8294	Boštanj
00050000-5579-987d-bac4-3ec388110ec8	5230	Bovec
00050000-5579-987d-ec56-fe32981fd0e4	5295	Branik
00050000-5579-987d-7fc2-652c0e35bcee	3314	Braslovče
00050000-5579-987d-2d5a-a74b3d855a59	5223	Breginj
00050000-5579-987d-bc2c-a463f90ec9ac	8280	Brestanica
00050000-5579-987d-bc77-8fa5532da702	2354	Bresternica
00050000-5579-987d-1133-bed13ab91585	4243	Brezje
00050000-5579-987d-7f29-80f9ba6c1054	1351	Brezovica pri Ljubljani
00050000-5579-987d-3c0e-9e7ba1629dd0	8250	Brežice
00050000-5579-987d-6e69-f6d2614cb491	4210	Brnik - Aerodrom
00050000-5579-987d-56d5-523e0b77920a	8321	Brusnice
00050000-5579-987d-f4e2-e43146705c9d	3255	Buče
00050000-5579-987d-b173-c51ee6d501f9	8276	Bučka 
00050000-5579-987d-8efd-643cd385ebd4	9261	Cankova
00050000-5579-987d-2f7f-a8b494f79373	3000	Celje 
00050000-5579-987d-61ee-ddb15420180e	3001	Celje - poštni predali
00050000-5579-987d-ed86-23b44959502a	4207	Cerklje na Gorenjskem
00050000-5579-987d-34b0-51fa8a33b88e	8263	Cerklje ob Krki
00050000-5579-987d-eaeb-56cf38097c11	1380	Cerknica
00050000-5579-987d-f0e6-80bb4175de80	5282	Cerkno
00050000-5579-987d-0389-efcc9c5399a7	2236	Cerkvenjak
00050000-5579-987d-da84-10d4ba1b799b	2215	Ceršak
00050000-5579-987d-2947-63c0d26e595a	2326	Cirkovce
00050000-5579-987d-6e71-4c93f6acc64e	2282	Cirkulane
00050000-5579-987d-dfa6-6ce1971bb705	5273	Col
00050000-5579-987d-6e3b-f4a17ca7a246	8251	Čatež ob Savi
00050000-5579-987d-2fa9-1db697eb38b5	1413	Čemšenik
00050000-5579-987d-81fa-64a5ddaa6d1d	5253	Čepovan
00050000-5579-987d-ced6-141112f19cb1	9232	Črenšovci
00050000-5579-987d-8b44-81c1351c31ca	2393	Črna na Koroškem
00050000-5579-987d-ba8c-8bd2656f7218	6275	Črni Kal
00050000-5579-987d-65b9-d173ef21cd87	5274	Črni Vrh nad Idrijo
00050000-5579-987d-b687-3551c2aae1ad	5262	Črniče
00050000-5579-987d-221c-a3ada13024a7	8340	Črnomelj
00050000-5579-987d-b6a5-4cb887d6a3c4	6271	Dekani
00050000-5579-987d-cc27-eebca77d8ca1	5210	Deskle
00050000-5579-987d-194f-1e8ea9a9a6e8	2253	Destrnik
00050000-5579-987d-cf53-9bf43cc6efbe	6215	Divača
00050000-5579-987d-b344-ae874d8846d3	1233	Dob
00050000-5579-987d-e4db-27d264ec2c07	3224	Dobje pri Planini
00050000-5579-987d-1764-053e38dfaa9f	8257	Dobova
00050000-5579-987d-edbb-f55c4d31cf32	1423	Dobovec
00050000-5579-987d-a998-95d0701081eb	5263	Dobravlje
00050000-5579-987d-ab02-29c4278d0694	3204	Dobrna
00050000-5579-987d-b8bb-c31cc94de2f3	8211	Dobrnič
00050000-5579-987d-0497-51f7b7d4f4e0	1356	Dobrova
00050000-5579-987d-52ad-fb16e5545229	9223	Dobrovnik/Dobronak 
00050000-5579-987d-59fa-1562d3c68c47	5212	Dobrovo v Brdih
00050000-5579-987d-1fe6-2cee9dc7d4de	1431	Dol pri Hrastniku
00050000-5579-987d-e8d4-93b1af80a026	1262	Dol pri Ljubljani
00050000-5579-987d-3dc1-55a8cb0d0a98	1273	Dole pri Litiji
00050000-5579-987d-96f6-fe4bd2cf2aa1	1331	Dolenja vas
00050000-5579-987d-7236-5a575979a270	8350	Dolenjske Toplice
00050000-5579-987d-87ab-09ac4fbf464d	1230	Domžale
00050000-5579-987d-1437-42cadfdb6815	2252	Dornava
00050000-5579-987d-e4a1-3e583999a371	5294	Dornberk
00050000-5579-987d-c43e-18a69095ef7c	1319	Draga
00050000-5579-987d-8e88-da2c12306bb0	8343	Dragatuš
00050000-5579-987d-5d08-6b85d32f516d	3222	Dramlje
00050000-5579-987d-480a-02552afda2fd	2370	Dravograd
00050000-5579-987d-de68-aa030fa9bb27	4203	Duplje
00050000-5579-987d-9968-93ba9821127f	6221	Dutovlje
00050000-5579-987d-e0ca-26db919d9db5	8361	Dvor
00050000-5579-987d-910e-ee0eacc3f9b4	2343	Fala
00050000-5579-987d-723c-805d432309ae	9208	Fokovci
00050000-5579-987d-dd91-b7433f4d0056	2313	Fram
00050000-5579-987d-def3-6de5895ce8a4	3213	Frankolovo
00050000-5579-987d-d680-0383379c7b35	1274	Gabrovka
00050000-5579-987d-8120-303aca94b1fd	8254	Globoko
00050000-5579-987d-7881-d930f33b1fa1	5275	Godovič
00050000-5579-987d-8979-6a8f0b40f009	4204	Golnik
00050000-5579-987d-6747-995b0444c425	3303	Gomilsko
00050000-5579-987d-ac7f-c7db17f375e8	4224	Gorenja vas
00050000-5579-987d-ef98-7ad16bf63efa	3263	Gorica pri Slivnici
00050000-5579-987d-e975-55f993b70d66	2272	Gorišnica
00050000-5579-987d-a416-cda10f1ed581	9250	Gornja Radgona
00050000-5579-987d-7513-71282c213a9b	3342	Gornji Grad
00050000-5579-987d-bd6c-f6372d37c99c	4282	Gozd Martuljek
00050000-5579-987d-2808-b473cdf981c3	6272	Gračišče
00050000-5579-987d-16fe-d55baa204251	9264	Grad
00050000-5579-987d-78c0-ae86dedbeec3	8332	Gradac
00050000-5579-987d-54f1-0562c4d5a735	1384	Grahovo
00050000-5579-987d-878a-ded4e5d37d17	5242	Grahovo ob Bači
00050000-5579-987d-22fc-510f036e32a8	5251	Grgar
00050000-5579-987d-bf30-82d0aa1bb2be	3302	Griže
00050000-5579-987d-e23a-d941e542a0b6	3231	Grobelno
00050000-5579-987d-f5f8-520ad43ededa	1290	Grosuplje
00050000-5579-987d-a856-16069730c040	2288	Hajdina
00050000-5579-987d-01c5-009cc87d08d4	8362	Hinje
00050000-5579-987d-ee15-03c881f08ea7	2311	Hoče
00050000-5579-987d-5ff8-a1f53fc9c36b	9205	Hodoš/Hodos
00050000-5579-987d-1869-43888854866f	1354	Horjul
00050000-5579-987d-7250-02d8e1c4a15a	1372	Hotedršica
00050000-5579-987d-c43d-c6d85fc1dcd5	1430	Hrastnik
00050000-5579-987d-e2fa-f3352bb0be65	6225	Hruševje
00050000-5579-987d-672c-5607999670bf	4276	Hrušica
00050000-5579-987d-60ce-fb5b25fb9f38	5280	Idrija
00050000-5579-987d-4283-7b023d143549	1292	Ig
00050000-5579-987d-a116-f093069113aa	6250	Ilirska Bistrica
00050000-5579-987d-acbf-e22898e83221	6251	Ilirska Bistrica-Trnovo
00050000-5579-987d-e9d4-2e0f9eb32d34	1295	Ivančna Gorica
00050000-5579-987d-e168-367a7a1d0db8	2259	Ivanjkovci
00050000-5579-987d-62bb-4b7e6201e2e2	1411	Izlake
00050000-5579-987d-780f-9bd057026723	6310	Izola/Isola
00050000-5579-987d-0913-4bb33d539e34	2222	Jakobski Dol
00050000-5579-987d-0d11-3eb5729de1c9	2221	Jarenina
00050000-5579-987d-3084-fc75458cf6a2	6254	Jelšane
00050000-5579-987d-d8ab-c138248f0cb3	4270	Jesenice
00050000-5579-987d-1a57-290421e319b4	8261	Jesenice na Dolenjskem
00050000-5579-987d-0360-82886e1f1da6	3273	Jurklošter
00050000-5579-987d-ae7f-7a758c40c781	2223	Jurovski Dol
00050000-5579-987d-5208-41f33ea72901	2256	Juršinci
00050000-5579-987d-9663-d11a0e384b7d	5214	Kal nad Kanalom
00050000-5579-987d-3f2a-5e4122952646	3233	Kalobje
00050000-5579-987d-511d-16be832b9922	4246	Kamna Gorica
00050000-5579-987d-387b-9bc487d84b84	2351	Kamnica
00050000-5579-987d-7207-45123d095a3d	1241	Kamnik
00050000-5579-987d-9d94-9da441ae2cfd	5213	Kanal
00050000-5579-987d-c236-9b054e33653d	8258	Kapele
00050000-5579-987d-aef3-b3f961b12c7c	2362	Kapla
00050000-5579-987d-f838-d04e2956a3f5	2325	Kidričevo
00050000-5579-987d-d776-1064beb56138	1412	Kisovec
00050000-5579-987d-b63c-e761475a6eef	6253	Knežak
00050000-5579-987d-eeba-dd0a933416b2	5222	Kobarid
00050000-5579-987d-f2de-1b23e2b96dd1	9227	Kobilje
00050000-5579-987d-f794-46e932ad7e54	1330	Kočevje
00050000-5579-987d-72f3-6537dccf46c7	1338	Kočevska Reka
00050000-5579-987d-0021-7124a4bf7bcc	2276	Kog
00050000-5579-987d-c336-3a7412fb3c4f	5211	Kojsko
00050000-5579-987d-6d67-f5e8288e9d8b	6223	Komen
00050000-5579-987d-9fdf-75bd143254a2	1218	Komenda
00050000-5579-987d-8451-a09a1a10b82c	6000	Koper/Capodistria 
00050000-5579-987d-975b-a71779ca90ae	6001	Koper/Capodistria - poštni predali
00050000-5579-987d-2493-5fbb8993d568	8282	Koprivnica
00050000-5579-987d-a4af-02767d57ffbe	5296	Kostanjevica na Krasu
00050000-5579-987d-a42c-1c30f3611612	8311	Kostanjevica na Krki
00050000-5579-987d-6d26-59ea5a156c51	1336	Kostel
00050000-5579-987d-148a-eb153bd91c26	6256	Košana
00050000-5579-987d-b5e8-854a90656081	2394	Kotlje
00050000-5579-987d-6f07-ea3500bd657a	6240	Kozina
00050000-5579-987d-b3b7-69453c9d1725	3260	Kozje
00050000-5579-987d-9f46-d96ef2f95cf4	4000	Kranj 
00050000-5579-987d-a702-37aabdc65bc5	4001	Kranj - poštni predali
00050000-5579-987d-f1dc-45a573cf2146	4280	Kranjska Gora
00050000-5579-987d-e41b-27192649cf49	1281	Kresnice
00050000-5579-987d-9d55-abda95b167f8	4294	Križe
00050000-5579-987d-41fe-8dd1a2cf0e8a	9206	Križevci
00050000-5579-987d-8159-e47195021ce0	9242	Križevci pri Ljutomeru
00050000-5579-987d-aa7c-4a30da9f672f	1301	Krka
00050000-5579-987d-fd48-33db457d6a3c	8296	Krmelj
00050000-5579-987d-932e-492fbd633f18	4245	Kropa
00050000-5579-987d-f089-cc74aed39b2f	8262	Krška vas
00050000-5579-987d-e115-cc361e0fb846	8270	Krško
00050000-5579-987d-98bd-d54bd66c4739	9263	Kuzma
00050000-5579-987d-4ad1-3c3f12bc8bad	2318	Laporje
00050000-5579-987d-2fd4-a37a4a13e027	3270	Laško
00050000-5579-987d-ab8d-ba2be0f6d6d0	1219	Laze v Tuhinju
00050000-5579-987d-1e83-f70fbfde3836	2230	Lenart v Slovenskih goricah
00050000-5579-987d-b89e-118c9cc355b0	9220	Lendava/Lendva
00050000-5579-987d-b8a4-79a8c0986f20	4248	Lesce
00050000-5579-987d-0b1b-6101fd3f7ebe	3261	Lesično
00050000-5579-987d-7ad7-205cd47373ba	8273	Leskovec pri Krškem
00050000-5579-987d-4cde-29203e80b34a	2372	Libeliče
00050000-5579-987d-3c00-fb9d10efdf73	2341	Limbuš
00050000-5579-987d-7f7f-9a9b5f5c349b	1270	Litija
00050000-5579-987d-7194-703f09f2d760	3202	Ljubečna
00050000-5579-987d-8cbf-a81389d6a87e	1000	Ljubljana 
00050000-5579-987d-3520-f53d6a0393b2	1001	Ljubljana - poštni predali
00050000-5579-987d-341a-014461d95720	1231	Ljubljana - Črnuče
00050000-5579-987d-ba0f-f151411efd96	1261	Ljubljana - Dobrunje
00050000-5579-987d-caa2-857269d909d0	1260	Ljubljana - Polje
00050000-5579-987d-463c-eff9dfae0de8	1210	Ljubljana - Šentvid
00050000-5579-987d-76a9-11a48d4fa709	1211	Ljubljana - Šmartno
00050000-5579-987d-7ba0-dde5a679c068	3333	Ljubno ob Savinji
00050000-5579-987d-bde4-ef562efddc49	9240	Ljutomer
00050000-5579-987d-c9bd-e70cf9cca89a	3215	Loče
00050000-5579-987d-b892-5c9ed82d190f	5231	Log pod Mangartom
00050000-5579-987d-78e4-929837259fd2	1358	Log pri Brezovici
00050000-5579-987d-587b-8ef7249e71fd	1370	Logatec
00050000-5579-987d-8c5f-5c2a5978e53a	1371	Logatec
00050000-5579-987d-6915-8985a956ea45	1434	Loka pri Zidanem Mostu
00050000-5579-987d-29a7-2358b7c47c2e	3223	Loka pri Žusmu
00050000-5579-987d-78a3-ef456fced249	6219	Lokev
00050000-5579-987d-6f33-4ac21b000aac	1318	Loški Potok
00050000-5579-987d-0636-81f7d76489ac	2324	Lovrenc na Dravskem polju
00050000-5579-987d-ecfa-2e5c9d0a975d	2344	Lovrenc na Pohorju
00050000-5579-987d-baf9-9506871b51be	3334	Luče
00050000-5579-987d-66a3-b54e37240704	1225	Lukovica
00050000-5579-987d-86c3-bb8adef79f98	9202	Mačkovci
00050000-5579-987d-dc89-20bd3cfba646	2322	Majšperk
00050000-5579-987d-80c2-fb499ef0cc79	2321	Makole
00050000-5579-987d-f80a-13fd6e6c37a6	9243	Mala Nedelja
00050000-5579-987d-9704-2cfef4106288	2229	Malečnik
00050000-5579-987d-6de7-02f8be64ac17	6273	Marezige
00050000-5579-987d-842d-817738246373	2000	Maribor 
00050000-5579-987d-368e-f318e7f4c9d5	2001	Maribor - poštni predali
00050000-5579-987d-4c6d-66d71aee97dc	2206	Marjeta na Dravskem polju
00050000-5579-987d-1200-da4902dd3a46	2281	Markovci
00050000-5579-987d-3f26-c7ab5baad76d	9221	Martjanci
00050000-5579-987d-41fc-d010ff99a152	6242	Materija
00050000-5579-987d-ef1e-08497be43f0e	4211	Mavčiče
00050000-5579-987d-b191-c2fca89e2e98	1215	Medvode
00050000-5579-987d-ab40-210a57c0ba7b	1234	Mengeš
00050000-5579-987d-43f8-6164ef157145	8330	Metlika
00050000-5579-987d-678e-ea152263d44b	2392	Mežica
00050000-5579-987d-f2ed-cb5d8c4406c0	2204	Miklavž na Dravskem polju
00050000-5579-987d-23ed-055c061a1e0a	2275	Miklavž pri Ormožu
00050000-5579-987d-b2d9-1d0c7735f670	5291	Miren
00050000-5579-987d-fa38-ae36d995227d	8233	Mirna
00050000-5579-987d-0860-1b0af6878154	8216	Mirna Peč
00050000-5579-987d-351f-8c327e09b3a0	2382	Mislinja
00050000-5579-987d-6fd0-296e860cf009	4281	Mojstrana
00050000-5579-987d-1bf7-80f9433e5947	8230	Mokronog
00050000-5579-987d-b9fb-843cd94a44c8	1251	Moravče
00050000-5579-987d-d641-fe98176c2358	9226	Moravske Toplice
00050000-5579-987d-0cc4-ea54e2ebb691	5216	Most na Soči
00050000-5579-987d-9325-cc34784889d7	1221	Motnik
00050000-5579-987d-0322-cfdfeb673445	3330	Mozirje
00050000-5579-987d-88cd-fa0dea721215	9000	Murska Sobota 
00050000-5579-987d-8d54-67ec3ccf9c21	9001	Murska Sobota - poštni predali
00050000-5579-987d-dae3-adbdc813f739	2366	Muta
00050000-5579-987d-7277-4f42b246b4b7	4202	Naklo
00050000-5579-987d-0911-abeba82f8607	3331	Nazarje
00050000-5579-987d-e6aa-bbc1998973a6	1357	Notranje Gorice
00050000-5579-987d-b70b-00bf2c51c065	3203	Nova Cerkev
00050000-5579-987d-8229-47f32231f4a3	5000	Nova Gorica 
00050000-5579-987d-40f5-699f43c7a5c4	5001	Nova Gorica - poštni predali
00050000-5579-987d-ea13-08872670034b	1385	Nova vas
00050000-5579-987d-2712-661c0364cc02	8000	Novo mesto
00050000-5579-987d-66a1-895ef517fe18	8001	Novo mesto - poštni predali
00050000-5579-987d-e090-74686f135ebd	6243	Obrov
00050000-5579-987d-9641-a98a1b29d46c	9233	Odranci
00050000-5579-987d-0557-001ee65cdf00	2317	Oplotnica
00050000-5579-987d-b663-74fe8e93350e	2312	Orehova vas
00050000-5579-987d-2a92-8fcfd1de4430	2270	Ormož
00050000-5579-987d-b03e-93f2d5f4cd87	1316	Ortnek
00050000-5579-987d-1570-efc4697af40a	1337	Osilnica
00050000-5579-987d-c275-fb7bb26e4abb	8222	Otočec
00050000-5579-987d-c5ac-0c3a3ede91e0	2361	Ožbalt
00050000-5579-987d-f915-daf55d5a69d4	2231	Pernica
00050000-5579-987d-6bcc-27d116be60ea	2211	Pesnica pri Mariboru
00050000-5579-987d-9e8d-3a686ff404d3	9203	Petrovci
00050000-5579-987d-afd1-befac625dc9b	3301	Petrovče
00050000-5579-987d-dcb9-b0e5a1b5373f	6330	Piran/Pirano
00050000-5579-987d-1dfd-789a9680177c	8255	Pišece
00050000-5579-987d-abb3-1506b582311b	6257	Pivka
00050000-5579-987d-b573-3e049264587c	6232	Planina
00050000-5579-987d-6b2b-6f92038bba28	3225	Planina pri Sevnici
00050000-5579-987d-5ae8-407ba6df8933	6276	Pobegi
00050000-5579-987d-f6ad-0c85a040fe40	8312	Podbočje
00050000-5579-987d-369a-ce30bd5e6dc6	5243	Podbrdo
00050000-5579-987d-cd19-34b669c8243b	3254	Podčetrtek
00050000-5579-987d-8ded-8f1fc6214dcc	2273	Podgorci
00050000-5579-987d-1cea-3b663930b6aa	6216	Podgorje
00050000-5579-987d-a096-a8f5d35da493	2381	Podgorje pri Slovenj Gradcu
00050000-5579-987d-be4a-646c6a75edec	6244	Podgrad
00050000-5579-987d-6609-e6a9ca32e72e	1414	Podkum
00050000-5579-987d-8ed6-84ab368eec72	2286	Podlehnik
00050000-5579-987d-a885-dd2a617695cf	5272	Podnanos
00050000-5579-987d-cd12-b8ba6270947f	4244	Podnart
00050000-5579-987d-7f27-f8f09f0be454	3241	Podplat
00050000-5579-987d-b49a-0d18102acafc	3257	Podsreda
00050000-5579-987d-483e-7d993d6d6e6b	2363	Podvelka
00050000-5579-987d-5006-8b485d0b6652	2208	Pohorje
00050000-5579-987d-f68d-68e037526708	2257	Polenšak
00050000-5579-987d-29ba-4ab3ae2a451f	1355	Polhov Gradec
00050000-5579-987d-523b-7d9671d0210f	4223	Poljane nad Škofjo Loko
00050000-5579-987d-c477-2f22cce92171	2319	Poljčane
00050000-5579-987d-f45e-420bbd90ee09	1272	Polšnik
00050000-5579-987d-d0c7-37a906cdd17a	3313	Polzela
00050000-5579-987d-9c6b-140b42e7b739	3232	Ponikva
00050000-5579-987d-4ba7-807af4e6c82a	6320	Portorož/Portorose
00050000-5579-987d-4f12-83c4fcec0f02	6230	Postojna
00050000-5579-987d-cbf5-9ebaa35ed46b	2331	Pragersko
00050000-5579-987d-af97-20aea84052a2	3312	Prebold
00050000-5579-987d-563c-fa5d48942753	4205	Preddvor
00050000-5579-987d-2135-beed3efff6fd	6255	Prem
00050000-5579-987d-eda7-77a597b5eb27	1352	Preserje
00050000-5579-987d-086f-78e172cc3a76	6258	Prestranek
00050000-5579-987d-0a9a-1cab72c95c73	2391	Prevalje
00050000-5579-987d-ab80-03726384aba9	3262	Prevorje
00050000-5579-987d-f9af-97d9265d36d6	1276	Primskovo 
00050000-5579-987d-242c-992e50b4ff57	3253	Pristava pri Mestinju
00050000-5579-987d-5722-83b0bb517bdd	9207	Prosenjakovci/Partosfalva
00050000-5579-987d-9316-a942dad013b3	5297	Prvačina
00050000-5579-987d-c4b2-717b2dfacfde	2250	Ptuj
00050000-5579-987d-5a1d-543704e3747d	2323	Ptujska Gora
00050000-5579-987d-a849-ffd4efebcfb1	9201	Puconci
00050000-5579-987d-2d8f-8fced4bb74f3	2327	Rače
00050000-5579-987d-0664-b1cf6ac78d52	1433	Radeče
00050000-5579-987d-d201-360d64c124f9	9252	Radenci
00050000-5579-987d-900e-cd0e8ffbd9eb	2360	Radlje ob Dravi
00050000-5579-987d-a3aa-72a09fdd3f04	1235	Radomlje
00050000-5579-987d-6221-818bb70bcb1c	4240	Radovljica
00050000-5579-987d-ccc2-98e9e7c33407	8274	Raka
00050000-5579-987d-f29b-af9e3510df94	1381	Rakek
00050000-5579-987d-8d4c-a6061cca5892	4283	Rateče - Planica
00050000-5579-987d-7339-25e5a40c4a09	2390	Ravne na Koroškem
00050000-5579-987d-941f-a06f477e693e	9246	Razkrižje
00050000-5579-987d-6c92-028245f668ae	3332	Rečica ob Savinji
00050000-5579-987d-6a9e-ad08988e9186	5292	Renče
00050000-5579-987d-db2e-a63593888724	1310	Ribnica
00050000-5579-987d-47bf-072db8de1303	2364	Ribnica na Pohorju
00050000-5579-987d-255f-5fff79b9f42e	3272	Rimske Toplice
00050000-5579-987d-b540-cbe9c95b2390	1314	Rob
00050000-5579-987d-cb32-f3e8a04da24a	5215	Ročinj
00050000-5579-987d-f22c-0bd373ee058e	3250	Rogaška Slatina
00050000-5579-987d-de08-86242d11405c	9262	Rogašovci
00050000-5579-987d-8b5e-15c68996923e	3252	Rogatec
00050000-5579-987d-4eab-8a52b1891a7f	1373	Rovte
00050000-5579-987d-9944-dcc427a7e486	2342	Ruše
00050000-5579-987d-21c8-874cf3817575	1282	Sava
00050000-5579-987d-2779-8a1635646e94	6333	Sečovlje/Sicciole
00050000-5579-987d-c70c-11d973d71521	4227	Selca
00050000-5579-987d-d8aa-fbfb91a8902a	2352	Selnica ob Dravi
00050000-5579-987d-1f07-172fec192e67	8333	Semič
00050000-5579-987d-1456-7eb7b5aa7b9f	8281	Senovo
00050000-5579-987d-e704-45dc15056fe8	6224	Senožeče
00050000-5579-987d-feac-69d75f2e4b92	8290	Sevnica
00050000-5579-987d-d72b-f5a609682217	6210	Sežana
00050000-5579-987d-b9ff-80b899f5c207	2214	Sladki Vrh
00050000-5579-987d-43c0-0e71338cf0c8	5283	Slap ob Idrijci
00050000-5579-987d-4661-277d5bb2734c	2380	Slovenj Gradec
00050000-5579-987d-f6ca-4bc19dfc3abc	2310	Slovenska Bistrica
00050000-5579-987d-d540-a263410deeb7	3210	Slovenske Konjice
00050000-5579-987d-381c-e8833014468b	1216	Smlednik
00050000-5579-987d-33dc-74fb31faaf4d	5232	Soča
00050000-5579-987d-78c5-22c61173379a	1317	Sodražica
00050000-5579-987d-29b4-86ba74684dbb	3335	Solčava
00050000-5579-987d-597d-d603271686a5	5250	Solkan
00050000-5579-987d-1b57-ba4c807e88d9	4229	Sorica
00050000-5579-987d-5acc-5d98e350c404	4225	Sovodenj
00050000-5579-987d-7a38-6aa67a309ffa	5281	Spodnja Idrija
00050000-5579-987d-be56-2950a99edea6	2241	Spodnji Duplek
00050000-5579-987d-b583-69c6f3a2175a	9245	Spodnji Ivanjci
00050000-5579-987d-bc41-41f7c85f63ae	2277	Središče ob Dravi
00050000-5579-987d-761f-56dbd4f287cc	4267	Srednja vas v Bohinju
00050000-5579-987d-4cf9-f073794fb967	8256	Sromlje 
00050000-5579-987d-a08a-2c65fdf85950	5224	Srpenica
00050000-5579-987d-d13d-19a010b4c68e	1242	Stahovica
00050000-5579-987d-87ec-a4eb8cdc7bc2	1332	Stara Cerkev
00050000-5579-987d-4dd6-15597a16aeaa	8342	Stari trg ob Kolpi
00050000-5579-987d-4d09-f5ab4490ce1d	1386	Stari trg pri Ložu
00050000-5579-987d-a97b-d2c38edadf65	2205	Starše
00050000-5579-987d-3627-3733ed81876b	2289	Stoperce
00050000-5579-987d-32a2-e80f1107a0df	8322	Stopiče
00050000-5579-987d-f198-a3eafe5e0f54	3206	Stranice
00050000-5579-987d-045a-e893d9f83ee5	8351	Straža
00050000-5579-987d-895a-50adcaec1ae2	1313	Struge
00050000-5579-987d-fb9e-e209e851c461	8293	Studenec
00050000-5579-987d-fc15-250f860e1b29	8331	Suhor
00050000-5579-987d-f118-205fac59ba56	2233	Sv. Ana v Slovenskih goricah
00050000-5579-987d-2f69-03d95b080961	2235	Sv. Trojica v Slovenskih goricah
00050000-5579-987d-112e-502ff0830a0b	2353	Sveti Duh na Ostrem Vrhu
00050000-5579-987d-6cb7-2a36abbfe728	9244	Sveti Jurij ob Ščavnici
00050000-5579-987d-029a-86d033599bfa	3264	Sveti Štefan
00050000-5579-987d-2ad5-763486693001	2258	Sveti Tomaž
00050000-5579-987d-03ae-add0352a42f5	9204	Šalovci
00050000-5579-987d-4399-ccc2df1dbc12	5261	Šempas
00050000-5579-987d-4581-0754f5bbaffa	5290	Šempeter pri Gorici
00050000-5579-987d-6c55-3e9c16c914ab	3311	Šempeter v Savinjski dolini
00050000-5579-987d-667a-fe52ef920b23	4208	Šenčur
00050000-5579-987d-df40-272dc00247a9	2212	Šentilj v Slovenskih goricah
00050000-5579-987d-6080-f5012e763181	8297	Šentjanž
00050000-5579-987d-4bd9-39db534ad4d8	2373	Šentjanž pri Dravogradu
00050000-5579-987d-e07a-92fc9a0e272b	8310	Šentjernej
00050000-5579-987d-13cc-9bfafd314a37	3230	Šentjur
00050000-5579-987d-545f-0e81477b112e	3271	Šentrupert
00050000-5579-987d-65de-1402e8c2abdb	8232	Šentrupert
00050000-5579-987d-ce56-89ba94ac1de4	1296	Šentvid pri Stični
00050000-5579-987d-aa72-b8d74cfd060b	8275	Škocjan
00050000-5579-987d-94f7-0193396b3e7d	6281	Škofije
00050000-5579-987d-20be-8b256b5c09b2	4220	Škofja Loka
00050000-5579-987d-e86f-51181836b297	3211	Škofja vas
00050000-5579-987d-3de8-9193f9094a06	1291	Škofljica
00050000-5579-987d-9037-31f841f4df9c	6274	Šmarje
00050000-5579-987d-7792-93176cf1d306	1293	Šmarje - Sap
00050000-5579-987d-baf5-e51cc16502a6	3240	Šmarje pri Jelšah
00050000-5579-987d-b27d-cc6ffe3dbc3a	8220	Šmarješke Toplice
00050000-5579-987d-6f31-e83befe15719	2315	Šmartno na Pohorju
00050000-5579-987d-28ea-9a2c5d30ea8c	3341	Šmartno ob Dreti
00050000-5579-987d-a70a-8c4d043cc49b	3327	Šmartno ob Paki
00050000-5579-987d-8d36-51ecd8a3ea3e	1275	Šmartno pri Litiji
00050000-5579-987d-d069-44d6150d7832	2383	Šmartno pri Slovenj Gradcu
00050000-5579-987d-7b17-52690b16d1a8	3201	Šmartno v Rožni dolini
00050000-5579-987d-a8ef-a705c94486c9	3325	Šoštanj
00050000-5579-987d-b478-b6b83c0134ac	6222	Štanjel
00050000-5579-987d-1652-e58f280d57be	3220	Štore
00050000-5579-987d-c346-74ba12c652b7	3304	Tabor
00050000-5579-987d-051b-0d0b50a2affd	3221	Teharje
00050000-5579-987d-4e39-e7bbb75d4d98	9251	Tišina
00050000-5579-987d-3e90-1d429afb0fda	5220	Tolmin
00050000-5579-987d-07c5-73d3426ae3f0	3326	Topolšica
00050000-5579-987d-0e36-97d990df3b46	2371	Trbonje
00050000-5579-987d-31d8-e6e06aff2e8b	1420	Trbovlje
00050000-5579-987d-1de2-152f9a229e2e	8231	Trebelno 
00050000-5579-987d-0df5-ecef2d25c371	8210	Trebnje
00050000-5579-987d-0119-61d2e7a27339	5252	Trnovo pri Gorici
00050000-5579-987d-d859-61b3de9e07b6	2254	Trnovska vas
00050000-5579-987d-8f96-f999d3cc7575	1222	Trojane
00050000-5579-987d-8666-7756c685306b	1236	Trzin
00050000-5579-987d-c94c-e409b77a6a10	4290	Tržič
00050000-5579-987d-3f3a-cd0e9cd9a284	8295	Tržišče
00050000-5579-987d-aeee-a16aae2578fd	1311	Turjak
00050000-5579-987d-e7f1-3f7081459fcb	9224	Turnišče
00050000-5579-987d-cdf8-c0daa9e80ecf	8323	Uršna sela
00050000-5579-987d-241e-7661963fa10d	1252	Vače
00050000-5579-987d-d3e6-dcee80841e58	3320	Velenje 
00050000-5579-987d-2be3-3b54927ba61e	3322	Velenje - poštni predali
00050000-5579-987d-2cf7-6ec46d3af75b	8212	Velika Loka
00050000-5579-987d-f178-ff1964671eab	2274	Velika Nedelja
00050000-5579-987d-b08d-0e99d2e98a27	9225	Velika Polana
00050000-5579-987d-f47a-525d9de34fc4	1315	Velike Lašče
00050000-5579-987d-6707-bac6df61f413	8213	Veliki Gaber
00050000-5579-987d-012f-a6131ddc0e61	9241	Veržej
00050000-5579-987d-0c53-08280a89b38a	1312	Videm - Dobrepolje
00050000-5579-987d-aae9-fbb662b96da0	2284	Videm pri Ptuju
00050000-5579-987d-8474-111b190c5423	8344	Vinica
00050000-5579-987d-90e8-9dfb3b9c6084	5271	Vipava
00050000-5579-987d-e843-a78e76c5cd60	4212	Visoko
00050000-5579-987d-a274-336dbac9428f	1294	Višnja Gora
00050000-5579-987d-dc08-eeea00b66f85	3205	Vitanje
00050000-5579-987d-14c4-8a6d4b8e9ff9	2255	Vitomarci
00050000-5579-987d-2c41-f27652b2ef21	1217	Vodice
00050000-5579-987d-b8ff-9d1a44346dd3	3212	Vojnik\t
00050000-5579-987d-52f6-a069705d4dfc	5293	Volčja Draga
00050000-5579-987d-7647-5f99fa808ec0	2232	Voličina
00050000-5579-987d-28ae-acfc07acb72f	3305	Vransko
00050000-5579-987d-282d-dafaeba49c9e	6217	Vremski Britof
00050000-5579-987d-1365-b202c032e268	1360	Vrhnika
00050000-5579-987d-106a-a09039434afc	2365	Vuhred
00050000-5579-987d-d433-f7a9fe7e94a1	2367	Vuzenica
00050000-5579-987d-197b-1aeeddf4d12e	8292	Zabukovje 
00050000-5579-987d-1d51-785749e6f021	1410	Zagorje ob Savi
00050000-5579-987d-3e5d-78e776b534ee	1303	Zagradec
00050000-5579-987d-9cf5-6a573512dd44	2283	Zavrč
00050000-5579-987d-c6df-6c203905d35b	8272	Zdole 
00050000-5579-987d-c6d4-f3b13299545f	4201	Zgornja Besnica
00050000-5579-987d-4e51-24eaec1e6185	2242	Zgornja Korena
00050000-5579-987d-4bdf-26137e22b2ab	2201	Zgornja Kungota
00050000-5579-987d-207e-67a15d7d99a5	2316	Zgornja Ložnica
00050000-5579-987d-2d37-afe3fe197486	2314	Zgornja Polskava
00050000-5579-987d-83ce-444b458d97f9	2213	Zgornja Velka
00050000-5579-987d-8eca-409447270873	4247	Zgornje Gorje
00050000-5579-987d-62ef-66ae406ba7e2	4206	Zgornje Jezersko
00050000-5579-987d-2352-3384cc4333d2	2285	Zgornji Leskovec
00050000-5579-987d-f6d7-b6fdba829e1b	1432	Zidani Most
00050000-5579-987d-875c-9de6998e7435	3214	Zreče
00050000-5579-987d-b893-c449194482ec	4209	Žabnica
00050000-5579-987d-4fed-b06272adda63	3310	Žalec
00050000-5579-987d-37b6-b9c2ed49ae92	4228	Železniki
00050000-5579-987d-5459-fdbf1ea88efa	2287	Žetale
00050000-5579-987d-4c4d-238c59c2f84a	4226	Žiri
00050000-5579-987d-87e6-5601e3b6257e	4274	Žirovnica
00050000-5579-987d-196b-f86c65d33820	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 6972614)
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
-- TOC entry 2832 (class 0 OID 6972425)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6972503)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 6972626)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 6972746)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 6972799)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5579-987f-82b1-85f7bd0e252e	00080000-5579-987f-2996-6c70633fd1ac	0987	A
00190000-5579-987f-48ba-eb3f18fb1118	00080000-5579-987f-eb31-5fed38d72ca9	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 6972914)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 6972977)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 6972927)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 6972946)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 6972655)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5579-987f-6077-f460fe99f24f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5579-987f-d8b6-f40ebe023cd1	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5579-987f-ab75-4bcf08692adb	0003	Kazinska	t	84	Kazinska dvorana
00220000-5579-987f-54bb-ec477a824eb4	0004	Mali oder	t	24	Mali oder 
00220000-5579-987f-5679-894c63a721f4	0005	Komorni oder	t	15	Komorni oder
00220000-5579-987f-490c-689f3f63a637	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5579-987f-8823-e1418572a249	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 6972599)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 6972589)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 6972788)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 6972723)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6972297)
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
-- TOC entry 2857 (class 0 OID 6972665)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6972335)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5579-987e-d849-f93a49fa414c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5579-987e-f69c-30e87e5e9abe	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5579-987e-240c-3698a3ca0fb1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5579-987e-9201-b5f564a650d2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5579-987e-81c0-e1c502614277	planer	Planer dogodkov v koledarju	t
00020000-5579-987e-1a2e-fdd85aeeffa2	kadrovska	Kadrovska služba	t
00020000-5579-987e-ad67-114f9fb9a58d	arhivar	Ažuriranje arhivalij	t
00020000-5579-987e-e4ca-58e095fc3fdf	igralec	Igralec	t
00020000-5579-987e-3bb9-4ed14380d994	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 6972319)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5579-987e-d395-ddd5b6c6605f	00020000-5579-987e-240c-3698a3ca0fb1
00010000-5579-987e-aade-d79175545c84	00020000-5579-987e-240c-3698a3ca0fb1
\.


--
-- TOC entry 2859 (class 0 OID 6972679)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 6972620)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 6972570)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 6973010)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5579-987e-beab-c7b4354b6497	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5579-987e-65c4-642f54fb9904	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5579-987e-9cab-49224305e9a9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5579-987e-b46b-d2352b99e596	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5579-987e-3c4a-1ce9c2d2c1ba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 6973002)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5579-987e-7952-d4a1f4454919	00230000-5579-987e-b46b-d2352b99e596	popa
00240000-5579-987e-e9ee-241dc963080a	00230000-5579-987e-b46b-d2352b99e596	oseba
00240000-5579-987e-1172-3d4b393346a0	00230000-5579-987e-65c4-642f54fb9904	prostor
00240000-5579-987e-51db-6323a55bb767	00230000-5579-987e-b46b-d2352b99e596	besedilo
00240000-5579-987e-4502-ffb828ab778f	00230000-5579-987e-b46b-d2352b99e596	uprizoritev
00240000-5579-987e-93a2-c7e725c1e6fa	00230000-5579-987e-b46b-d2352b99e596	funkcija
00240000-5579-987e-5818-226094d98d91	00230000-5579-987e-b46b-d2352b99e596	tipfunkcije
00240000-5579-987e-b7b1-766f37d8bb2e	00230000-5579-987e-b46b-d2352b99e596	alternacija
00240000-5579-987e-f7a0-858bb380322a	00230000-5579-987e-beab-c7b4354b6497	pogodba
00240000-5579-987e-68b7-631e3d78dd2a	00230000-5579-987e-b46b-d2352b99e596	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 6972997)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 6972733)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6972397)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 6972576)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5579-987f-aa61-7c664937b8e7	00180000-5579-987f-39e1-f6c0fa1c1ab7	000c0000-5579-987f-5cdc-3f117dd964f9	00090000-5579-987f-47ae-c566a712bfc2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-987f-fdec-82ea6d98ec7d	00180000-5579-987f-39e1-f6c0fa1c1ab7	000c0000-5579-987f-7a5e-a04cbad3cb4a	00090000-5579-987f-8026-2130cfbb742f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-987f-2086-e26e4fdcd217	00180000-5579-987f-39e1-f6c0fa1c1ab7	000c0000-5579-987f-b447-04612d7524ca	00090000-5579-987f-05ed-eca2d69629db	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-987f-60ad-82b500e6014c	00180000-5579-987f-39e1-f6c0fa1c1ab7	000c0000-5579-987f-a9db-cd5aa4381edf	00090000-5579-987f-daa9-f8b7bf0a88c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-987f-db14-e0811bed6175	00180000-5579-987f-39e1-f6c0fa1c1ab7	000c0000-5579-987f-b88e-121bb1ce8d98	00090000-5579-987f-586f-44a28e3a5730	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5579-987f-abc6-ca44c93794bd	00180000-5579-987f-823d-7bfff35d204b	\N	00090000-5579-987f-586f-44a28e3a5730	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 6972777)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5579-987e-a692-35f08f235345	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5579-987e-b1f8-a6d102c6ed6f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5579-987e-1e8d-75f25661f90e	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5579-987e-e0c9-9c8ca369efda	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5579-987e-f2a3-a4dc5670ceaf	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5579-987e-e4e0-cb79a144cd67	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5579-987e-d8f8-a8923850493c	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5579-987e-76e7-e72c8d20330d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5579-987e-ec6c-b8feb5a3c526	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5579-987e-4456-0baddec08200	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5579-987e-3a96-f783b7c95ae6	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5579-987e-8404-71be3731818a	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5579-987e-9d3a-705e446342bb	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5579-987e-2424-b4eaedd3a78e	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5579-987e-8f4e-90671ea24f57	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5579-987e-1558-ed11b9dfda4f	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 6972966)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5579-987e-fa50-a89ef6b88cc1	01	Velika predstava	f	1.00	1.00
002b0000-5579-987e-b94a-c6a110d57b77	02	Mala predstava	f	0.50	0.50
002b0000-5579-987e-0b74-c5399c25c986	03	Mala koprodukcija	t	0.40	1.00
002b0000-5579-987e-8cb7-b5e5d4772fc3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5579-987e-ecd7-44af459c45a6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 6972460)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6972306)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5579-987e-aade-d79175545c84	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODwL8WMyNW7P9RcN7QPpN501kDQVoqyq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5579-987f-8d72-8557366e88b8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5579-987f-1a80-6d9923702473	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5579-987f-f517-701526ba8f7c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5579-987f-5c39-e8fd0791ba78	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5579-987f-689d-48c0b9e293b8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5579-987f-0e78-efe5d14599bd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5579-987e-d395-ddd5b6c6605f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 6972834)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5579-987f-df1f-81d50e67b845	00160000-5579-987f-22c0-528f4f48f684	00150000-5579-987e-9f7b-393feb095323	00140000-5579-987e-3a05-b8e017886e90	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5579-987f-5679-894c63a721f4
000e0000-5579-987f-cb5f-8ab7a8ac3eaf	00160000-5579-987f-82fa-0696ba610093	00150000-5579-987e-6229-87ef509081cf	00140000-5579-987e-09b0-df6f68a7d00e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5579-987f-490c-689f3f63a637
000e0000-5579-987f-42e8-b22d27237419	\N	00150000-5579-987e-6229-87ef509081cf	00140000-5579-987e-09b0-df6f68a7d00e	00190000-5579-987f-82b1-85f7bd0e252e	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5579-987f-5679-894c63a721f4
000e0000-5579-987f-da99-f01bcdd302bb	\N	00150000-5579-987e-6229-87ef509081cf	00140000-5579-987e-09b0-df6f68a7d00e	00190000-5579-987f-82b1-85f7bd0e252e	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5579-987f-5679-894c63a721f4
\.


--
-- TOC entry 2840 (class 0 OID 6972522)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5579-987f-a931-aa03bcf75290	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	1	
00200000-5579-987f-ee93-41b32e75e874	000e0000-5579-987f-cb5f-8ab7a8ac3eaf	2	
\.


--
-- TOC entry 2855 (class 0 OID 6972647)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 6972716)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 6972554)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 6972824)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5579-987e-3a05-b8e017886e90	01	Drama	drama (SURS 01)
00140000-5579-987e-03e3-d759f3d8877e	02	Opera	opera (SURS 02)
00140000-5579-987e-6ec7-0f26ebd16c8b	03	Balet	balet (SURS 03)
00140000-5579-987e-896c-51a898c1a2ce	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5579-987e-d084-86b75c08f01f	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5579-987e-09b0-df6f68a7d00e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5579-987e-32f5-ac569c00c495	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 6972706)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5579-987e-deaa-2f37a6eeff07	01	Opera	opera
00150000-5579-987e-176d-f4a1c8dc3a08	02	Opereta	opereta
00150000-5579-987e-da7b-b2a9448a70b8	03	Balet	balet
00150000-5579-987e-8d72-120ae76285c9	04	Plesne prireditve	plesne prireditve
00150000-5579-987e-4405-709ed95a1344	05	Lutkovno gledališče	lutkovno gledališče
00150000-5579-987e-6975-1b64dc1feb0d	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5579-987e-02e6-8c7249d6ff9a	07	Biografska drama	biografska drama
00150000-5579-987e-9f7b-393feb095323	08	Komedija	komedija
00150000-5579-987e-dd60-52c57f8d3a19	09	Črna komedija	črna komedija
00150000-5579-987e-ff1f-6a532c42d981	10	E-igra	E-igra
00150000-5579-987e-6229-87ef509081cf	11	Kriminalka	kriminalka
00150000-5579-987e-7b0e-6d639ec7ac28	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 6972360)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 6972881)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6972871)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 6972776)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 6972544)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6972569)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6972486)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 6972910)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 6972702)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 6972520)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6972563)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6972500)
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
-- TOC entry 2495 (class 2606 OID 6972612)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6972639)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6972458)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 6972369)
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
-- TOC entry 2410 (class 2606 OID 6972393)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 6972349)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 6972334)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6972645)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6972678)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6972819)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6972422)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6972446)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 6972618)
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
-- TOC entry 2425 (class 2606 OID 6972436)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6972507)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6972630)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6972758)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6972804)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 6972925)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 6972995)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 6972942)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 6972963)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6972662)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 6972603)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6972594)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 6972798)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 6972730)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6972305)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6972669)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6972323)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 6972343)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6972687)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 6972625)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6972575)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 6973019)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 6973007)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 6973001)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6972743)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 6972402)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6972585)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 6972787)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 6972976)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6972471)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6972318)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6972850)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6972529)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6972653)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6972721)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6972558)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6972832)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6972714)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 6972551)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 6972744)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 6972745)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 6972424)
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
-- TOC entry 2508 (class 1259 OID 6972646)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 6972632)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 6972631)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 6972530)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 6972703)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 6972705)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 6972704)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 6972502)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 6972501)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 6972821)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 6972822)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 6972823)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 6972965)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 6972964)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 6972855)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 6972852)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 6972856)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 6972854)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 6972853)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 6972473)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 6972472)
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
-- TOC entry 2408 (class 1259 OID 6972396)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 6972670)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 6972564)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 6972350)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 6972351)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 6972690)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 6972689)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 6972688)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 6972508)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 6972510)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 6972509)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 6973009)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 6972598)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 6972596)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 6972595)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 6972597)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 6972324)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 6972325)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 6972654)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 6972619)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 6972731)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 6972732)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 6972911)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 6972912)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 6972913)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6972438)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 6972437)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 6972439)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 6972996)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 6972759)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6972760)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 6972885)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 6972887)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 6972883)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 6972886)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 6972884)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 6972722)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 6972607)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 6972606)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 6972604)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 6972605)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 6972873)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 6972872)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 6972926)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 6972521)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 6972371)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 6972370)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 6972403)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 6972404)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 6972588)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 6972587)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 6972586)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 6972945)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 6972943)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 6972944)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 6972553)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 6972549)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 6972546)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 6972547)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 6972545)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 6972550)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 6972548)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 6972423)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 6972487)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 6972489)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 6972488)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 6972490)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 6972613)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 6972820)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 6972851)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 6972394)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 6972395)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 6972715)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 6973020)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 6972459)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 6973008)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 6972664)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 6972663)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 6972882)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 6972447)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 6972833)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 6972805)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 6972806)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 6972344)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 6972552)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 6973156)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 6973141)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 6973146)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 6973166)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 6973136)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 6973161)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 6973151)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 6973311)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 6973316)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 6973071)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6973251)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 6973246)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 6973241)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 6973131)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 6973281)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 6973291)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 6973286)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 6973106)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6973101)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 6973231)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 6973336)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 6973341)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 6973346)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 6973451)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 6973446)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 6973366)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 6973351)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 6973371)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 6973361)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 6973356)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 6973096)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 6973091)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 6973056)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 6973051)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 6973261)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 6973171)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 6973031)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 6973036)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 6973276)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 6973271)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 6973266)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 6973111)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 6973121)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 6973116)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 6973461)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 6973206)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 6973196)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 6973191)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 6973201)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 6973021)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 6973026)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 6973256)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 6973236)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 6973301)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 6973306)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 6973411)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 6973416)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 6973421)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 6973081)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 6973076)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 6973086)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 6973456)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 6973321)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 6973326)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 6973396)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 6973406)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 6973386)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 6973401)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 6973391)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 6973296)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 6973226)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 6973221)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 6973211)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 6973216)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 6973381)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 6973376)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 6973426)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 6973126)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 6973331)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 6973046)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 6973041)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 6973061)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 6973066)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 6973186)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 6973181)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 6973176)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 6973441)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 6973431)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 6973436)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-11 16:17:36 CEST

--
-- PostgreSQL database dump complete
--

