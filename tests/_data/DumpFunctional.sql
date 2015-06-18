--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-18 14:13:46 CEST

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
-- TOC entry 180 (class 1259 OID 7718885)
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
-- TOC entry 227 (class 1259 OID 7719407)
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
-- TOC entry 226 (class 1259 OID 7719390)
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
-- TOC entry 219 (class 1259 OID 7719294)
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
-- TOC entry 194 (class 1259 OID 7719064)
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
-- TOC entry 197 (class 1259 OID 7719098)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7719007)
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
-- TOC entry 228 (class 1259 OID 7719421)
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
-- TOC entry 213 (class 1259 OID 7719224)
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
-- TOC entry 192 (class 1259 OID 7719044)
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
-- TOC entry 196 (class 1259 OID 7719092)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7719024)
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
-- TOC entry 202 (class 1259 OID 7719141)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7719166)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7718981)
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
-- TOC entry 181 (class 1259 OID 7718894)
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
-- TOC entry 182 (class 1259 OID 7718905)
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
-- TOC entry 177 (class 1259 OID 7718859)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7718878)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7719173)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7719204)
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
-- TOC entry 223 (class 1259 OID 7719340)
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
-- TOC entry 184 (class 1259 OID 7718938)
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
-- TOC entry 186 (class 1259 OID 7718973)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7719147)
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
-- TOC entry 185 (class 1259 OID 7718958)
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
-- TOC entry 191 (class 1259 OID 7719036)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7719159)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7719279)
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
-- TOC entry 222 (class 1259 OID 7719332)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7719451)
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
-- TOC entry 233 (class 1259 OID 7719514)
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
-- TOC entry 230 (class 1259 OID 7719464)
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
-- TOC entry 231 (class 1259 OID 7719483)
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
-- TOC entry 209 (class 1259 OID 7719188)
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
-- TOC entry 201 (class 1259 OID 7719132)
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
-- TOC entry 200 (class 1259 OID 7719122)
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
-- TOC entry 221 (class 1259 OID 7719321)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7719256)
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
-- TOC entry 174 (class 1259 OID 7718830)
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
-- TOC entry 173 (class 1259 OID 7718828)
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
-- TOC entry 210 (class 1259 OID 7719198)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7718868)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7718852)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7719212)
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
-- TOC entry 204 (class 1259 OID 7719153)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7719103)
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
-- TOC entry 236 (class 1259 OID 7719547)
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
-- TOC entry 235 (class 1259 OID 7719539)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7719534)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7719266)
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
-- TOC entry 183 (class 1259 OID 7718930)
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
-- TOC entry 199 (class 1259 OID 7719109)
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
-- TOC entry 220 (class 1259 OID 7719310)
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
-- TOC entry 232 (class 1259 OID 7719503)
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
-- TOC entry 188 (class 1259 OID 7718993)
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
-- TOC entry 175 (class 1259 OID 7718839)
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
-- TOC entry 225 (class 1259 OID 7719367)
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
-- TOC entry 193 (class 1259 OID 7719055)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7719180)
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
-- TOC entry 215 (class 1259 OID 7719249)
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
-- TOC entry 195 (class 1259 OID 7719087)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7719357)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7719239)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7718833)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7718885)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7719407)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5582-b5f9-52d0-c6c07ccaec23	000d0000-5582-b5f9-39ba-cb2a5d9f41df	\N	00090000-5582-b5f9-7379-56fda3b83bc3	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-b5f9-8f5c-1e511389ebbd	000d0000-5582-b5f9-8426-b68b80520e7c	\N	00090000-5582-b5f9-18f6-97dcdfdb11fe	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-b5f9-daf7-3a0122332a72	000d0000-5582-b5f9-5fc6-06db9957fc4f	\N	00090000-5582-b5f9-2df9-6fd954630c87	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-b5f9-e420-924a2d6914d5	000d0000-5582-b5f9-0413-36d30165eb99	\N	00090000-5582-b5f9-b9d7-8a0055a0b87f	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-b5f9-6e67-d1d9cbd6d3b0	000d0000-5582-b5f9-ca95-f913cf67a667	\N	00090000-5582-b5f9-a39b-a0deac10c4a7	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5582-b5f9-e068-da29bc6c7a5e	000d0000-5582-b5f9-5fee-27af64c9b06c	\N	00090000-5582-b5f9-18f6-97dcdfdb11fe	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7719390)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7719294)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5582-b5f9-17fb-fd2a92288696	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5582-b5f9-8dc5-24195dca3a73	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5582-b5f9-e9a3-9a4c73bff4a3	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7719064)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5582-b5f9-cbbb-d4a490bd2bfa	\N	\N	00200000-5582-b5f9-b680-9b41bf56cd78	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5582-b5f9-cb4f-21cb9f3fce7f	\N	\N	00200000-5582-b5f9-ee4b-30e661b106f7	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5582-b5f9-5c44-7ddd02322309	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5582-b5f9-6699-6d956a0e8b2f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5582-b5f9-b66d-a4ffff6eb134	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7719098)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7719007)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5582-b5f7-59a2-e32549ddb4f7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5582-b5f7-a727-c5a18f88cc0f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5582-b5f7-4cfc-948f83ae3147	AL	ALB	008	Albania 	Albanija	\N
00040000-5582-b5f7-82d0-c32092bf47cc	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5582-b5f7-5739-296e5b33ad44	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5582-b5f7-b2f3-8b4f76f6a3f9	AD	AND	020	Andorra 	Andora	\N
00040000-5582-b5f7-e24f-9515c5ca8b67	AO	AGO	024	Angola 	Angola	\N
00040000-5582-b5f7-f32a-fdde84c4e48f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5582-b5f7-2a82-3a217d6db74a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5582-b5f7-e1f4-eff8e1b9f832	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-b5f7-b056-cf4c566dd107	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5582-b5f7-6bff-c4b35d328524	AM	ARM	051	Armenia 	Armenija	\N
00040000-5582-b5f7-3273-904ec3d8a8cc	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5582-b5f7-2ed2-28450b9752d9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5582-b5f7-b502-d24fdbd20de0	AT	AUT	040	Austria 	Avstrija	\N
00040000-5582-b5f7-b302-d629e12b97ad	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5582-b5f7-f75d-a7fec97ce177	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5582-b5f7-d733-ce914a1e6c58	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5582-b5f7-de8e-a7255d779560	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5582-b5f7-314a-0b63611824fd	BB	BRB	052	Barbados 	Barbados	\N
00040000-5582-b5f7-dd17-21ed3f4c97ec	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5582-b5f7-ff85-e67fc4cc718a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5582-b5f7-a696-6b69fe76e6e0	BZ	BLZ	084	Belize 	Belize	\N
00040000-5582-b5f7-5e70-90d4dfad6ac0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5582-b5f7-6fff-5a1293a228af	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5582-b5f7-dfe2-194777fcd147	BT	BTN	064	Bhutan 	Butan	\N
00040000-5582-b5f7-5b11-8c72163a480a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5582-b5f7-a7ed-9aa6016f671f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5582-b5f7-d02d-d7f0caa9a3bf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5582-b5f7-a2ac-ddc19b1ab0e0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5582-b5f7-cc47-a095a8a50367	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5582-b5f7-091c-7c4644963ad0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5582-b5f7-faab-eaebced7eb1d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5582-b5f7-32ab-643e50104f39	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5582-b5f7-ad89-6fc7b4dd48fa	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5582-b5f7-032b-dd0f9e089be3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5582-b5f7-8fc3-5dc4d6910956	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5582-b5f7-ce0d-92b0daad76ed	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5582-b5f7-0453-b993ed93cc5e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5582-b5f7-a04c-c85e0426350f	CA	CAN	124	Canada 	Kanada	\N
00040000-5582-b5f7-e16c-4ef31867f9cf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5582-b5f7-2301-b8436f278a49	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5582-b5f7-8632-436e932e6a69	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5582-b5f7-cdbd-3946700dc501	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5582-b5f7-949e-ec063c347369	CL	CHL	152	Chile 	Čile	\N
00040000-5582-b5f7-bae2-bc8eba3ff77d	CN	CHN	156	China 	Kitajska	\N
00040000-5582-b5f7-c002-8e70cdc21a58	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5582-b5f7-d9c2-7735683481c2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5582-b5f7-a894-2e2ec1d10c46	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5582-b5f7-e389-620ab6d32c9c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5582-b5f7-66cb-73e440fe9d47	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5582-b5f7-7196-02d65a983436	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5582-b5f7-20b4-f64fafb54901	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5582-b5f7-f54b-4b7c83a55def	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5582-b5f7-5e13-1fbc114c5414	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5582-b5f7-90f7-f8d433b1449b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5582-b5f7-f34b-bb7e84656893	CU	CUB	192	Cuba 	Kuba	\N
00040000-5582-b5f7-3793-df13d3f7ceb5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5582-b5f7-92ee-3c2cb09835c6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5582-b5f7-369d-083e94268cb9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5582-b5f7-689c-35d463362d3c	DK	DNK	208	Denmark 	Danska	\N
00040000-5582-b5f7-c3a1-8b4ef2f3437b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5582-b5f7-8dbd-46c94ab2bb02	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5582-b5f7-fca6-f8501c5fa22e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5582-b5f7-031b-6f08de7e7adc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5582-b5f7-ce8f-b1053193715c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5582-b5f7-5bed-a78696547e2c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5582-b5f7-aaf4-420eb1dc0006	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5582-b5f7-42d4-d56ab2363558	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5582-b5f7-15dc-7152da151399	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5582-b5f7-0366-80d700d68673	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5582-b5f7-d0b7-a540851d7a1d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5582-b5f7-47f8-df5eec8c281e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5582-b5f7-27cb-9be78a210a68	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5582-b5f7-97a7-c13c99ed7b39	FI	FIN	246	Finland 	Finska	\N
00040000-5582-b5f7-3249-0d99660dea25	FR	FRA	250	France 	Francija	\N
00040000-5582-b5f7-7996-4adb33f43f7e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5582-b5f7-c2ed-01b68454a23f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5582-b5f7-124a-d096a415bf24	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5582-b5f7-2319-7ed47bd6cd36	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5582-b5f7-c49d-fa16de93a90b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5582-b5f7-9de9-f9ef2ef8da9a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5582-b5f7-349e-c43d5256649f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5582-b5f7-9d0a-cd4075b9204d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5582-b5f7-7464-d275f4173e42	GH	GHA	288	Ghana 	Gana	\N
00040000-5582-b5f7-aa34-86cadab01a2e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5582-b5f7-449c-d6971142933d	GR	GRC	300	Greece 	Grčija	\N
00040000-5582-b5f7-a65d-ae77898892ca	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5582-b5f7-c45b-18861d9d8442	GD	GRD	308	Grenada 	Grenada	\N
00040000-5582-b5f7-0a32-c45a3435b958	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5582-b5f7-d340-49aa73e5bea3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5582-b5f7-ef8e-a21242249219	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5582-b5f7-63c8-cd41bbcee50a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5582-b5f7-3aad-93022fc444c3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5582-b5f7-cb74-11547885acd5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5582-b5f7-c737-ea676dcb820f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5582-b5f7-5944-53f30887ad41	HT	HTI	332	Haiti 	Haiti	\N
00040000-5582-b5f7-ab1a-ec2e8a38cc97	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5582-b5f7-0c48-96ae21f11341	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5582-b5f7-e509-2802c55b8ec0	HN	HND	340	Honduras 	Honduras	\N
00040000-5582-b5f7-899f-aeece85dc39f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5582-b5f7-f7b6-3d818992375a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5582-b5f7-06f1-109166f94278	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5582-b5f7-10dd-3a8bce9897c6	IN	IND	356	India 	Indija	\N
00040000-5582-b5f7-c111-883091d21967	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5582-b5f7-4e05-4b37f3160732	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5582-b5f7-9c6c-2bbce6b6cd00	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5582-b5f7-4679-865b25b18db7	IE	IRL	372	Ireland 	Irska	\N
00040000-5582-b5f7-583a-e773d3f71816	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5582-b5f7-594a-8bebdc33114e	IL	ISR	376	Israel 	Izrael	\N
00040000-5582-b5f7-6e12-551512c938f3	IT	ITA	380	Italy 	Italija	\N
00040000-5582-b5f7-7dea-bf92488a5c86	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5582-b5f7-c05c-6771349bcdd3	JP	JPN	392	Japan 	Japonska	\N
00040000-5582-b5f7-3dac-84a91a7b7555	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5582-b5f7-9712-f1dba1342bc0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5582-b5f7-4774-4f14704df802	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5582-b5f7-6871-8b59216088e9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5582-b5f7-ff0a-249e9feadf0d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5582-b5f7-dc7d-b9345cf04159	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5582-b5f7-9120-58a2b0dfa7ec	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5582-b5f7-9e4a-4866536c027c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5582-b5f7-339d-366e8bd5d786	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5582-b5f7-d930-2b2363f2ca84	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5582-b5f7-43de-3cd06b3ff16c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5582-b5f7-85ac-383a78ce5411	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5582-b5f7-89ad-750b56d1b8cd	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5582-b5f7-0f6b-77f4643b8b7d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5582-b5f7-a643-e3b7dfb7a665	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5582-b5f7-4ae6-15917461fc97	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5582-b5f7-be0d-68abcf7946cf	LT	LTU	440	Lithuania 	Litva	\N
00040000-5582-b5f7-2a40-4605b5be9908	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5582-b5f7-6e69-b16fa7710924	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5582-b5f7-9f43-fa0f83af3bcb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5582-b5f7-c976-c8abcc42adc3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5582-b5f7-7306-a40264ca0087	MW	MWI	454	Malawi 	Malavi	\N
00040000-5582-b5f7-ac01-b08b16c310d1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5582-b5f7-253a-ea1bc667e9aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5582-b5f7-6c4d-fddb303ed70c	ML	MLI	466	Mali 	Mali	\N
00040000-5582-b5f7-e7e5-332c660cd3bb	MT	MLT	470	Malta 	Malta	\N
00040000-5582-b5f7-05ec-419f1fbe85cc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5582-b5f7-e579-934a3cc0d787	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5582-b5f7-a3d1-a521f18995d9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5582-b5f7-b123-162c574c18c9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5582-b5f7-1b8f-4def5568e45c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5582-b5f7-5e37-aefac847b136	MX	MEX	484	Mexico 	Mehika	\N
00040000-5582-b5f7-fd2d-8e92a045b861	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5582-b5f7-23c6-5bb3c53319c9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5582-b5f7-cd0d-9dfe7c12c00d	MC	MCO	492	Monaco 	Monako	\N
00040000-5582-b5f7-50f4-5aa0d537f60c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5582-b5f7-5816-7366ea52a59c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5582-b5f7-fdf0-384787365529	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5582-b5f7-fe65-bcd52ce1f2df	MA	MAR	504	Morocco 	Maroko	\N
00040000-5582-b5f7-d167-8621a783c91a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5582-b5f7-1881-bdab3e097e47	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5582-b5f7-f03f-e342c033f020	NA	NAM	516	Namibia 	Namibija	\N
00040000-5582-b5f7-426d-8cd5c9baeec0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5582-b5f7-17d6-3caa017d060c	NP	NPL	524	Nepal 	Nepal	\N
00040000-5582-b5f7-ecd4-de470033f85a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5582-b5f7-a5c2-3f993fc7d601	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5582-b5f7-eeaa-76a489a3ad81	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5582-b5f7-34b0-c97b8279ed06	NE	NER	562	Niger 	Niger 	\N
00040000-5582-b5f7-da3d-a2bb2d416a54	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5582-b5f7-c89b-a11e884289d2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5582-b5f7-9246-656ba5602c95	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5582-b5f7-b96b-5252770b49ee	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5582-b5f7-14d5-56ed3dbfee96	NO	NOR	578	Norway 	Norveška	\N
00040000-5582-b5f7-c489-04b01d27ca92	OM	OMN	512	Oman 	Oman	\N
00040000-5582-b5f7-c967-282e1e09d9c4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5582-b5f7-754c-d3110d8db09f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5582-b5f7-f6b2-f97f0559931b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5582-b5f7-73f9-2d539bcc963f	PA	PAN	591	Panama 	Panama	\N
00040000-5582-b5f7-e69a-bd968465db4f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5582-b5f7-27d4-2c080b7e9471	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5582-b5f7-f28e-c3ca5ebd139a	PE	PER	604	Peru 	Peru	\N
00040000-5582-b5f7-532c-43a7337d56c4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5582-b5f7-dd53-882fd77aaa75	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5582-b5f7-5d76-25b0c0fc6d53	PL	POL	616	Poland 	Poljska	\N
00040000-5582-b5f7-39e3-18e57dd38960	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5582-b5f7-bdc6-86c005197751	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5582-b5f7-6f83-26a63c107e3e	QA	QAT	634	Qatar 	Katar	\N
00040000-5582-b5f7-a28e-5130051c80b8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5582-b5f7-4572-4d579c33ef81	RO	ROU	642	Romania 	Romunija	\N
00040000-5582-b5f7-7705-d0551c468d51	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5582-b5f7-b931-2fce2715226d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5582-b5f7-6af3-8a0f72a7c7e1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5582-b5f7-2f42-fec85b359375	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5582-b5f7-b7bb-0a9a887856aa	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5582-b5f7-c36a-6976ea9f94cb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5582-b5f7-dbf9-a35fd744c70a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5582-b5f7-c009-9d60cbd9c953	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5582-b5f7-47ed-fb4257f7ebae	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5582-b5f7-e936-0b8915ec7589	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5582-b5f7-24e3-681ce232d144	SM	SMR	674	San Marino 	San Marino	\N
00040000-5582-b5f7-ac52-01992bd24a78	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5582-b5f7-9561-95088606bd75	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5582-b5f7-48e5-0a9e36a80bdc	SN	SEN	686	Senegal 	Senegal	\N
00040000-5582-b5f7-2fd2-00b23a924273	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5582-b5f7-2434-8bf4e5bf2dfe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5582-b5f7-a17a-01ce20d4bcde	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5582-b5f7-60b5-9394abc1b228	SG	SGP	702	Singapore 	Singapur	\N
00040000-5582-b5f7-53dd-a24941e366ae	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5582-b5f7-6154-6df6b4464abd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5582-b5f7-ddba-a91af21800b5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5582-b5f7-0ae1-a641eabcffb2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5582-b5f7-bb70-01850e7a89f2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5582-b5f7-3e74-2fcda0f76b72	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5582-b5f7-2e83-84965dedcc0d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5582-b5f7-c382-701a15527af2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5582-b5f7-8ef3-f1d0619a7baf	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5582-b5f7-c111-5159fe66b317	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5582-b5f7-db02-d2c60daecc38	SD	SDN	729	Sudan 	Sudan	\N
00040000-5582-b5f7-def0-411d0620dc3a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5582-b5f7-5efc-606edec45a32	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5582-b5f7-6b35-64345476854b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5582-b5f7-4552-e7d8f7d42aaf	SE	SWE	752	Sweden 	Švedska	\N
00040000-5582-b5f7-b8fe-5a1e840c9881	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5582-b5f7-fe5a-06bbc6ec0a61	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5582-b5f7-9182-2ea40d1db630	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5582-b5f7-d258-df59b31b09dc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5582-b5f7-09a9-61f077841483	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5582-b5f7-963b-62b9312fa8c1	TH	THA	764	Thailand 	Tajska	\N
00040000-5582-b5f7-0047-4c6d06f43957	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5582-b5f7-a597-88657e990b56	TG	TGO	768	Togo 	Togo	\N
00040000-5582-b5f7-ae79-13d76659564a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5582-b5f7-cd96-1102082501df	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5582-b5f7-5d69-126d63d62cb6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5582-b5f7-76d8-95d14eeb5b29	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5582-b5f7-a5ee-85113c0273ae	TR	TUR	792	Turkey 	Turčija	\N
00040000-5582-b5f7-86b2-c3841895c54e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5582-b5f7-c4a2-f0080f345ea9	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-b5f7-a896-b48455bf1156	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5582-b5f7-e887-e5bdbba614b0	UG	UGA	800	Uganda 	Uganda	\N
00040000-5582-b5f7-4613-571e015bcdb6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5582-b5f7-427a-f4cd3664a0e3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5582-b5f7-92ec-d6a51afa9a83	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5582-b5f7-13c9-c3312522fd3d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5582-b5f7-00f4-b1cac96989d7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5582-b5f7-9073-12fb88c8ad20	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5582-b5f7-ea2f-e28fa7bdcdc0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5582-b5f7-571f-c3962a13fac7	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5582-b5f7-a15c-066ea8da29b6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5582-b5f7-fff9-5fd7677bff96	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5582-b5f7-1ef8-8069a5819988	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5582-b5f7-426b-19ac7a9d81db	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5582-b5f7-1f56-7b888dfaed02	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5582-b5f7-eda9-45a1d962ead8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5582-b5f7-3643-130bbebeeb60	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5582-b5f7-f561-b37f6c453da5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5582-b5f7-dd34-57c0d0dea661	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7719421)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7719224)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5582-b5f9-4a50-c7cc6bf9f4cd	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5582-b5f8-9772-a723a53f6520
000d0000-5582-b5f9-39ba-cb2a5d9f41df	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-b5f8-9772-a723a53f6520
000d0000-5582-b5f9-8426-b68b80520e7c	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5582-b5f8-fe66-c1739c3eb60e
000d0000-5582-b5f9-5fc6-06db9957fc4f	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5582-b5f8-b4a8-a306e139c5a3
000d0000-5582-b5f9-0413-36d30165eb99	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5582-b5f8-b4a8-a306e139c5a3
000d0000-5582-b5f9-ca95-f913cf67a667	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5582-b5f8-b4a8-a306e139c5a3
000d0000-5582-b5f9-5fee-27af64c9b06c	000e0000-5582-b5f9-8b1f-17a2cdec3c09	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5582-b5f8-9772-a723a53f6520
\.


--
-- TOC entry 2843 (class 0 OID 7719044)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7719092)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7719024)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5582-b5f9-be17-59db39797553	00080000-5582-b5f9-654a-08b9765fb528	00090000-5582-b5f9-7379-56fda3b83bc3	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7719141)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7719166)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7718981)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5582-b5f7-831c-0ac3ba331f92	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5582-b5f7-b1b2-5fa5ebd23017	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5582-b5f7-0b87-a6140c04462d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5582-b5f7-ed6b-0c6fa974cc93	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5582-b5f7-f9ae-26fdf68bfc5a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5582-b5f7-2fbd-8a492f875f70	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5582-b5f7-c7ae-0f267b90412f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5582-b5f7-51b1-f64effc775f9	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-b5f8-2de4-a35ae473854c	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5582-b5f8-72d2-2ef88cf84a8d	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5582-b5f8-a51b-3da11cf55509	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5582-b5f8-52e5-82e307309b70	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5582-b5f9-a8dc-f593420dbc8f	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5582-b5f9-a783-ce00a7d5d600	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5582-b5f9-1059-619c23fc1d66	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5582-b5f9-fe9a-b90dc2f44163	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5582-b5f9-3939-2d0c8dd08320	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5582-b5f9-f114-d0d68957c6f2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7718894)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5582-b5f9-1544-5ab366b74830	00000000-5582-b5f9-a783-ce00a7d5d600	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5582-b5f9-0e5a-d80e3391b38c	00000000-5582-b5f9-a783-ce00a7d5d600	00010000-5582-b5f7-15a1-ea887c20017d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5582-b5f9-068a-4f1c94850e4d	00000000-5582-b5f9-1059-619c23fc1d66	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7718905)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5582-b5f9-fa41-558b722d9cea	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5582-b5f9-b9d7-8a0055a0b87f	00010000-5582-b5f9-a44a-12942ba6ed35	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5582-b5f9-2df9-6fd954630c87	00010000-5582-b5f9-abd8-8b1cfc203ae1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5582-b5f9-b7e4-08eedcd3fc80	00010000-5582-b5f9-8e1a-b3953a044b62	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5582-b5f9-031e-502d3fb3f294	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5582-b5f9-ad95-1395f72b42cd	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5582-b5f9-3426-51bebcd5d6f9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5582-b5f9-4f60-742840fba73f	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5582-b5f9-7379-56fda3b83bc3	00010000-5582-b5f9-9e2f-ec61ad010f8c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5582-b5f9-18f6-97dcdfdb11fe	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5582-b5f9-1c9c-7ceae0548289	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5582-b5f9-a39b-a0deac10c4a7	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5582-b5f9-cdef-617553a569c8	00010000-5582-b5f9-ecf6-260361f2964c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7718859)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5582-b5f7-4092-acdea738c1cc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5582-b5f7-1cbe-fb13f76eab7f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5582-b5f7-b619-33bfcfde4808	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5582-b5f7-dc29-7ef2a74d2431	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5582-b5f7-f369-a31deaf0ce15	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5582-b5f7-13b9-5c27c19dacc2	Abonma-read	Abonma - branje	f
00030000-5582-b5f7-25ad-57242045ecb1	Abonma-write	Abonma - spreminjanje	f
00030000-5582-b5f7-3971-6f91ffaa48ff	Alternacija-read	Alternacija - branje	f
00030000-5582-b5f7-8492-499d74ddad75	Alternacija-write	Alternacija - spreminjanje	f
00030000-5582-b5f7-037e-f9215ca7871e	Arhivalija-read	Arhivalija - branje	f
00030000-5582-b5f7-d1c9-4e41d52c33d7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5582-b5f7-1087-5bfab25ef54d	Besedilo-read	Besedilo - branje	f
00030000-5582-b5f7-d8bf-89308b348b2d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5582-b5f7-ca87-337a94eca291	DogodekIzven-read	DogodekIzven - branje	f
00030000-5582-b5f7-ec6b-1ddd3521452d	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5582-b5f7-310f-84e49b0d1712	Dogodek-read	Dogodek - branje	f
00030000-5582-b5f7-8024-b67bbfbd257c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5582-b5f7-be31-064bffc7c286	Drzava-read	Drzava - branje	f
00030000-5582-b5f7-4f84-3621b00a6b68	Drzava-write	Drzava - spreminjanje	f
00030000-5582-b5f7-5a5d-2b3517d74bf9	Funkcija-read	Funkcija - branje	f
00030000-5582-b5f7-487c-2a4759123a48	Funkcija-write	Funkcija - spreminjanje	f
00030000-5582-b5f7-c1c7-3059ef2edde3	Gostovanje-read	Gostovanje - branje	f
00030000-5582-b5f7-a3b6-6d7b0f12430a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5582-b5f7-ea6f-116d3a535471	Gostujoca-read	Gostujoca - branje	f
00030000-5582-b5f7-d0e5-7f2d933a9cb8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5582-b5f7-66a3-7557c9ef7809	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5582-b5f7-6024-b91a504e44ca	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5582-b5f7-a759-9ecb7247905e	Kupec-read	Kupec - branje	f
00030000-5582-b5f7-b688-f4e6982cc329	Kupec-write	Kupec - spreminjanje	f
00030000-5582-b5f7-17dc-8f60fd500010	NacinPlacina-read	NacinPlacina - branje	f
00030000-5582-b5f7-492f-f6c06c4f3cde	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5582-b5f7-62e2-29192a6ad4ee	Option-read	Option - branje	f
00030000-5582-b5f7-1d5d-99768ea81c17	Option-write	Option - spreminjanje	f
00030000-5582-b5f7-1293-f305bdc95a12	OptionValue-read	OptionValue - branje	f
00030000-5582-b5f7-1412-19687392ac87	OptionValue-write	OptionValue - spreminjanje	f
00030000-5582-b5f7-3dd2-1ecd282c8060	Oseba-read	Oseba - branje	f
00030000-5582-b5f7-7e1d-e8e16a4b93d5	Oseba-write	Oseba - spreminjanje	f
00030000-5582-b5f7-ee31-818b4496f777	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5582-b5f7-9bab-adbb1143984e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5582-b5f7-afde-ae3ecd710457	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5582-b5f7-b8b7-40dc63b3b6ea	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5582-b5f7-2d33-45218c9ddf7f	Pogodba-read	Pogodba - branje	f
00030000-5582-b5f7-e665-9c96356b275f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5582-b5f7-0d42-e4ad79bc639d	Popa-read	Popa - branje	f
00030000-5582-b5f7-342e-78ff6ca5db71	Popa-write	Popa - spreminjanje	f
00030000-5582-b5f7-3e86-0f7270d80c2a	Posta-read	Posta - branje	f
00030000-5582-b5f7-17ed-8f74117a93ae	Posta-write	Posta - spreminjanje	f
00030000-5582-b5f7-cf1d-c2a0a608f247	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5582-b5f7-28cf-595c9e354594	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5582-b5f7-5994-d6bc66fcad3d	PostniNaslov-read	PostniNaslov - branje	f
00030000-5582-b5f7-b98e-e2267a7743ab	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5582-b5f7-0f22-d2c47c868434	Predstava-read	Predstava - branje	f
00030000-5582-b5f7-27fa-6e8c7108bd6e	Predstava-write	Predstava - spreminjanje	f
00030000-5582-b5f7-a53d-6bbd380f6947	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5582-b5f7-28d6-bb65bac01ea3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5582-b5f7-895a-259f03852823	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5582-b5f7-0aad-dc455420e382	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5582-b5f7-14f9-4617e488aee5	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5582-b5f7-574b-b28561873e88	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5582-b5f7-866a-5ccdb9958cdc	ProgramDela-read	ProgramDela - branje	f
00030000-5582-b5f7-8cd5-2bd4ec71f674	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5582-b5f7-14db-7f87e6be3be5	ProgramFestival-read	ProgramFestival - branje	f
00030000-5582-b5f7-420b-e884c5fb29ea	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5582-b5f7-0dcd-3904638d69a5	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5582-b5f7-007d-e4c8b1bb8e37	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5582-b5f7-da94-e539867a1741	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5582-b5f7-2cf5-dbb1695e44f0	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5582-b5f7-8c8b-006ad6054529	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5582-b5f7-a076-729f04d94d1a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5582-b5f7-feb6-091529cc96c3	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5582-b5f7-47d7-66b813c5aabd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5582-b5f7-dcf5-f72ee8ce7143	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5582-b5f7-6fb0-2aaa6374aca1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5582-b5f7-eb40-e25b38d30715	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5582-b5f7-4a29-ab830b398a95	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5582-b5f7-cac4-0c0f1f832540	ProgramRazno-read	ProgramRazno - branje	f
00030000-5582-b5f7-9bd6-a4a8c9691b7f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5582-b5f7-4759-12ea1daa1f8c	Prostor-read	Prostor - branje	f
00030000-5582-b5f7-ed72-20edba3f2649	Prostor-write	Prostor - spreminjanje	f
00030000-5582-b5f7-f0b7-89b97d5d89b8	Racun-read	Racun - branje	f
00030000-5582-b5f7-fbbb-2ebc65026d74	Racun-write	Racun - spreminjanje	f
00030000-5582-b5f7-806e-f88bd948d696	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5582-b5f7-3cc6-5708b0754a85	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5582-b5f7-5466-df36b748f0ab	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5582-b5f7-5705-3e265b9e60ae	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5582-b5f7-2820-5a9798954612	Rekvizit-read	Rekvizit - branje	f
00030000-5582-b5f7-684e-b6d3634d415e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5582-b5f7-b957-e311de7c0b44	Revizija-read	Revizija - branje	f
00030000-5582-b5f7-c501-ffbfb56f9edf	Revizija-write	Revizija - spreminjanje	f
00030000-5582-b5f7-279b-1ea13d181b59	Rezervacija-read	Rezervacija - branje	f
00030000-5582-b5f7-1ace-327455b2caa0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5582-b5f7-7eef-b6e5efe0582f	SedezniRed-read	SedezniRed - branje	f
00030000-5582-b5f7-cda3-d519cacbacac	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5582-b5f7-6736-9725cf911e49	Sedez-read	Sedez - branje	f
00030000-5582-b5f7-d36a-6af2f7343698	Sedez-write	Sedez - spreminjanje	f
00030000-5582-b5f7-7cac-c9f32e1ec58c	Sezona-read	Sezona - branje	f
00030000-5582-b5f7-b197-f6dbe52e8780	Sezona-write	Sezona - spreminjanje	f
00030000-5582-b5f7-6bd7-1834bccaf747	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5582-b5f7-8af9-436f07e9576e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5582-b5f7-f52b-f4d2e3a45b4f	Stevilcenje-read	Stevilcenje - branje	f
00030000-5582-b5f7-2367-de2cc8a81e6f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5582-b5f7-41a8-3eb71b95a940	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5582-b5f7-ed4a-826e5cb67f94	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5582-b5f7-77b7-e74919d862e1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5582-b5f7-c6b5-c052059070a7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5582-b5f7-df93-694455e25b29	Telefonska-read	Telefonska - branje	f
00030000-5582-b5f7-4b78-7f1f512f5ca4	Telefonska-write	Telefonska - spreminjanje	f
00030000-5582-b5f7-d925-7db12011d42e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5582-b5f7-5d62-5241e999845e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5582-b5f7-ded8-5276e5f6bd27	TipFunkcije-read	TipFunkcije - branje	f
00030000-5582-b5f7-4994-c85ce35c0da1	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5582-b5f7-dedd-a754a19974c9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5582-b5f7-8898-49d6c1958c08	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5582-b5f7-f755-8812e46bc38d	Trr-read	Trr - branje	f
00030000-5582-b5f7-12f4-fb2d5b604d0f	Trr-write	Trr - spreminjanje	f
00030000-5582-b5f7-5c65-07802368f4f5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5582-b5f7-df35-b4b979ac5023	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5582-b5f7-71c0-c4b0483ef0c4	Vaja-read	Vaja - branje	f
00030000-5582-b5f7-c3fa-ba94a36a04c4	Vaja-write	Vaja - spreminjanje	f
00030000-5582-b5f7-28c6-8cf2cf2b281f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5582-b5f7-4e14-cf7fbbbea05c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5582-b5f7-4a7f-621469dd2dd3	Zaposlitev-read	Zaposlitev - branje	f
00030000-5582-b5f7-a3bd-86ae800bb140	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5582-b5f7-b0ca-5ab60f5d9551	Zasedenost-read	Zasedenost - branje	f
00030000-5582-b5f7-04fe-dc6ec1ac1db7	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5582-b5f7-e27c-00d6b2f188ed	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5582-b5f7-09bc-8387d8ad8720	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5582-b5f7-f28f-2780d0d6d8ea	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5582-b5f7-4e4e-de4fd24f39a0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7718878)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5582-b5f7-982e-66660fc861b3	00030000-5582-b5f7-1cbe-fb13f76eab7f
00020000-5582-b5f7-34db-519c7df3f406	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-13b9-5c27c19dacc2
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-25ad-57242045ecb1
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-3971-6f91ffaa48ff
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-8492-499d74ddad75
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-037e-f9215ca7871e
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-310f-84e49b0d1712
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-dc29-7ef2a74d2431
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-8024-b67bbfbd257c
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-4f84-3621b00a6b68
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-5a5d-2b3517d74bf9
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-487c-2a4759123a48
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-c1c7-3059ef2edde3
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-a3b6-6d7b0f12430a
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-ea6f-116d3a535471
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-d0e5-7f2d933a9cb8
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-66a3-7557c9ef7809
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-6024-b91a504e44ca
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-62e2-29192a6ad4ee
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-1293-f305bdc95a12
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-3dd2-1ecd282c8060
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-7e1d-e8e16a4b93d5
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-0d42-e4ad79bc639d
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-342e-78ff6ca5db71
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-3e86-0f7270d80c2a
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-17ed-8f74117a93ae
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-5994-d6bc66fcad3d
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-b98e-e2267a7743ab
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-0f22-d2c47c868434
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-27fa-6e8c7108bd6e
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-14f9-4617e488aee5
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-574b-b28561873e88
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-4759-12ea1daa1f8c
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-ed72-20edba3f2649
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-5466-df36b748f0ab
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-5705-3e265b9e60ae
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-2820-5a9798954612
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-684e-b6d3634d415e
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-7cac-c9f32e1ec58c
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-b197-f6dbe52e8780
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-ded8-5276e5f6bd27
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-5c65-07802368f4f5
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-df35-b4b979ac5023
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-71c0-c4b0483ef0c4
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-c3fa-ba94a36a04c4
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-b0ca-5ab60f5d9551
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-04fe-dc6ec1ac1db7
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-e27c-00d6b2f188ed
00020000-5582-b5f7-bde3-7853f66034c2	00030000-5582-b5f7-f28f-2780d0d6d8ea
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-13b9-5c27c19dacc2
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-037e-f9215ca7871e
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-310f-84e49b0d1712
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-c1c7-3059ef2edde3
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-ea6f-116d3a535471
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-66a3-7557c9ef7809
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-6024-b91a504e44ca
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-62e2-29192a6ad4ee
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-1293-f305bdc95a12
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-3dd2-1ecd282c8060
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-7e1d-e8e16a4b93d5
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-0d42-e4ad79bc639d
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-3e86-0f7270d80c2a
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-5994-d6bc66fcad3d
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-b98e-e2267a7743ab
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-0f22-d2c47c868434
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-4759-12ea1daa1f8c
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-5466-df36b748f0ab
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-2820-5a9798954612
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-7cac-c9f32e1ec58c
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-df93-694455e25b29
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-4b78-7f1f512f5ca4
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-f755-8812e46bc38d
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-12f4-fb2d5b604d0f
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-4a7f-621469dd2dd3
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-a3bd-86ae800bb140
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-e27c-00d6b2f188ed
00020000-5582-b5f7-0222-f62bca18ab02	00030000-5582-b5f7-f28f-2780d0d6d8ea
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-13b9-5c27c19dacc2
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-3971-6f91ffaa48ff
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-037e-f9215ca7871e
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-d1c9-4e41d52c33d7
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-1087-5bfab25ef54d
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-ca87-337a94eca291
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-310f-84e49b0d1712
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-5a5d-2b3517d74bf9
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-c1c7-3059ef2edde3
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-ea6f-116d3a535471
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-66a3-7557c9ef7809
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-62e2-29192a6ad4ee
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-1293-f305bdc95a12
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-3dd2-1ecd282c8060
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-0d42-e4ad79bc639d
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-3e86-0f7270d80c2a
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-0f22-d2c47c868434
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-14f9-4617e488aee5
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-4759-12ea1daa1f8c
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-5466-df36b748f0ab
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-2820-5a9798954612
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-7cac-c9f32e1ec58c
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-ded8-5276e5f6bd27
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-71c0-c4b0483ef0c4
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-b0ca-5ab60f5d9551
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-e27c-00d6b2f188ed
00020000-5582-b5f7-5769-28f8bf56491c	00030000-5582-b5f7-f28f-2780d0d6d8ea
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-13b9-5c27c19dacc2
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-25ad-57242045ecb1
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-8492-499d74ddad75
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-037e-f9215ca7871e
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-310f-84e49b0d1712
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-c1c7-3059ef2edde3
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-ea6f-116d3a535471
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-62e2-29192a6ad4ee
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-1293-f305bdc95a12
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-0d42-e4ad79bc639d
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-3e86-0f7270d80c2a
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-0f22-d2c47c868434
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-4759-12ea1daa1f8c
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-5466-df36b748f0ab
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-2820-5a9798954612
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-7cac-c9f32e1ec58c
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-ded8-5276e5f6bd27
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-e27c-00d6b2f188ed
00020000-5582-b5f7-1683-bdd044535124	00030000-5582-b5f7-f28f-2780d0d6d8ea
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-13b9-5c27c19dacc2
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-037e-f9215ca7871e
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-310f-84e49b0d1712
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-be31-064bffc7c286
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-c1c7-3059ef2edde3
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-ea6f-116d3a535471
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-62e2-29192a6ad4ee
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-1293-f305bdc95a12
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-0d42-e4ad79bc639d
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-3e86-0f7270d80c2a
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-0f22-d2c47c868434
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-4759-12ea1daa1f8c
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-5466-df36b748f0ab
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-2820-5a9798954612
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-7cac-c9f32e1ec58c
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-d925-7db12011d42e
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-b619-33bfcfde4808
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-ded8-5276e5f6bd27
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-e27c-00d6b2f188ed
00020000-5582-b5f7-43e3-44636bcdffc9	00030000-5582-b5f7-f28f-2780d0d6d8ea
\.


--
-- TOC entry 2858 (class 0 OID 7719173)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7719204)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7719340)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7718938)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5582-b5f9-654a-08b9765fb528	00040000-5582-b5f7-59a2-e32549ddb4f7	0988	koproducent	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-b5f9-927a-8235e1ef7e81	00040000-5582-b5f7-59a2-e32549ddb4f7	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-b5f9-f7b4-5823135f0ef0	00040000-5582-b5f7-59a2-e32549ddb4f7	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-b5f9-e0e6-01e4dcf2f026	00040000-5582-b5f7-59a2-e32549ddb4f7	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5582-b5f9-5924-54db559987a4	00040000-5582-b5f7-ddba-a91af21800b5	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7718973)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5582-b5f8-1c64-bf5277716ec2	8341	Adlešiči
00050000-5582-b5f8-25c1-929c088efdce	5270	Ajdovščina
00050000-5582-b5f8-5e78-605102f3e02f	6280	Ankaran/Ancarano
00050000-5582-b5f8-eee1-95a258150f76	9253	Apače
00050000-5582-b5f8-925c-ff7775be4fec	8253	Artiče
00050000-5582-b5f8-cb83-fd0753e5e66d	4275	Begunje na Gorenjskem
00050000-5582-b5f8-d8c3-567228159092	1382	Begunje pri Cerknici
00050000-5582-b5f8-c941-2fefb32a6db7	9231	Beltinci
00050000-5582-b5f8-f267-01a871bf5de9	2234	Benedikt
00050000-5582-b5f8-e4e6-070f7f88439b	2345	Bistrica ob Dravi
00050000-5582-b5f8-6110-7a2865504e1f	3256	Bistrica ob Sotli
00050000-5582-b5f8-880f-6ded380d88d5	8259	Bizeljsko
00050000-5582-b5f8-f753-0c50b2f145f7	1223	Blagovica
00050000-5582-b5f8-a5d0-adc530b86ce2	8283	Blanca
00050000-5582-b5f8-7704-efc65f07f643	4260	Bled
00050000-5582-b5f8-21c0-cf8cdd11d89b	4273	Blejska Dobrava
00050000-5582-b5f8-49d1-e45bbd373f88	9265	Bodonci
00050000-5582-b5f8-4397-7ecc671820e4	9222	Bogojina
00050000-5582-b5f8-d4c6-8cb52e46b210	4263	Bohinjska Bela
00050000-5582-b5f8-b604-98429032caf5	4264	Bohinjska Bistrica
00050000-5582-b5f8-cad3-d20d815c3b9a	4265	Bohinjsko jezero
00050000-5582-b5f8-fbf4-995178f2f493	1353	Borovnica
00050000-5582-b5f8-859f-43b67c97f31a	8294	Boštanj
00050000-5582-b5f8-78e4-1978620ec344	5230	Bovec
00050000-5582-b5f8-9b57-499ad5f9001e	5295	Branik
00050000-5582-b5f8-337d-d061cabf62a3	3314	Braslovče
00050000-5582-b5f8-083d-70cf1d49f362	5223	Breginj
00050000-5582-b5f8-e65b-99b48a9ee27e	8280	Brestanica
00050000-5582-b5f8-3e3f-d7fcf4db07af	2354	Bresternica
00050000-5582-b5f8-0dac-cc299881594d	4243	Brezje
00050000-5582-b5f8-f77c-ba1b41bfd3d3	1351	Brezovica pri Ljubljani
00050000-5582-b5f8-c4fd-242866f4e089	8250	Brežice
00050000-5582-b5f8-655c-11c13ebfaece	4210	Brnik - Aerodrom
00050000-5582-b5f8-300f-69e2eab75525	8321	Brusnice
00050000-5582-b5f8-8eba-835c0dca37e8	3255	Buče
00050000-5582-b5f8-b367-1c313a44e109	8276	Bučka 
00050000-5582-b5f8-a96f-c831587c9568	9261	Cankova
00050000-5582-b5f8-60b2-5fa5e7e8293c	3000	Celje 
00050000-5582-b5f8-1421-fc22c32c7926	3001	Celje - poštni predali
00050000-5582-b5f8-0e80-13b8ad678506	4207	Cerklje na Gorenjskem
00050000-5582-b5f8-bbea-5cfb35648e04	8263	Cerklje ob Krki
00050000-5582-b5f8-d963-08b07c124e40	1380	Cerknica
00050000-5582-b5f8-3d77-9775baf0adeb	5282	Cerkno
00050000-5582-b5f8-c074-3d1475ad02f9	2236	Cerkvenjak
00050000-5582-b5f8-13a5-7965e1faaf2f	2215	Ceršak
00050000-5582-b5f8-dbbd-79904b8ca588	2326	Cirkovce
00050000-5582-b5f8-9d11-51df7f9fd23b	2282	Cirkulane
00050000-5582-b5f8-52dc-58a619d39484	5273	Col
00050000-5582-b5f8-4e4e-361adbb86d09	8251	Čatež ob Savi
00050000-5582-b5f8-d205-d3bf0a286044	1413	Čemšenik
00050000-5582-b5f8-ee28-a9b29182ef1f	5253	Čepovan
00050000-5582-b5f8-861f-d4cb2872809b	9232	Črenšovci
00050000-5582-b5f8-e67b-b9c2e8c4c049	2393	Črna na Koroškem
00050000-5582-b5f8-9aeb-a08bffcc1047	6275	Črni Kal
00050000-5582-b5f8-1988-891591e55d13	5274	Črni Vrh nad Idrijo
00050000-5582-b5f8-e946-7d94bd8f6a1b	5262	Črniče
00050000-5582-b5f8-d15d-15597b2264ac	8340	Črnomelj
00050000-5582-b5f8-5455-2d5bfe0067b7	6271	Dekani
00050000-5582-b5f8-a8bf-35bc3bdc692b	5210	Deskle
00050000-5582-b5f8-2cfa-4512cc4cec87	2253	Destrnik
00050000-5582-b5f8-b06f-91cc68083020	6215	Divača
00050000-5582-b5f8-db48-1b5d97c17337	1233	Dob
00050000-5582-b5f8-ef3c-6310a566b905	3224	Dobje pri Planini
00050000-5582-b5f8-b5fd-cbb20b16157a	8257	Dobova
00050000-5582-b5f8-1efe-ad2b8f6b4b7d	1423	Dobovec
00050000-5582-b5f8-fb5a-d794de69476f	5263	Dobravlje
00050000-5582-b5f8-6093-8ede136ac5f8	3204	Dobrna
00050000-5582-b5f8-7629-51862373a1a3	8211	Dobrnič
00050000-5582-b5f8-ef11-ac38c10cabab	1356	Dobrova
00050000-5582-b5f8-46ce-9ed5c02bc051	9223	Dobrovnik/Dobronak 
00050000-5582-b5f8-9eda-3b3f692f392a	5212	Dobrovo v Brdih
00050000-5582-b5f8-e155-326515811eea	1431	Dol pri Hrastniku
00050000-5582-b5f8-6efd-242484a7ad32	1262	Dol pri Ljubljani
00050000-5582-b5f8-c155-16419b1374f5	1273	Dole pri Litiji
00050000-5582-b5f8-a9f4-a220f5ae142c	1331	Dolenja vas
00050000-5582-b5f8-ab65-bcb5be6d1822	8350	Dolenjske Toplice
00050000-5582-b5f8-8a5a-fb36abad18f3	1230	Domžale
00050000-5582-b5f8-e785-2b2a40ccf9b3	2252	Dornava
00050000-5582-b5f8-7804-d1a19572c39d	5294	Dornberk
00050000-5582-b5f8-a309-8dab9d17f9a2	1319	Draga
00050000-5582-b5f8-eaf5-31295d7274b9	8343	Dragatuš
00050000-5582-b5f8-aa4e-0e1720d47e40	3222	Dramlje
00050000-5582-b5f8-3441-1c243ec60301	2370	Dravograd
00050000-5582-b5f8-0ad8-7d90ad5cd0cf	4203	Duplje
00050000-5582-b5f8-f76e-be58c5469ab8	6221	Dutovlje
00050000-5582-b5f8-e4d7-24d662533b87	8361	Dvor
00050000-5582-b5f8-1e10-3a058f616e10	2343	Fala
00050000-5582-b5f8-e966-fb1ad3faf897	9208	Fokovci
00050000-5582-b5f8-f183-7b78f86b79b5	2313	Fram
00050000-5582-b5f8-98ed-da3a7c3db64a	3213	Frankolovo
00050000-5582-b5f8-4f07-34610542bfd6	1274	Gabrovka
00050000-5582-b5f8-fe0f-8234e69d9ce2	8254	Globoko
00050000-5582-b5f8-db9f-7d03f4d42f6e	5275	Godovič
00050000-5582-b5f8-e4da-eeced8ecaaf0	4204	Golnik
00050000-5582-b5f8-7b25-bf4aabd79605	3303	Gomilsko
00050000-5582-b5f8-ed8e-6264421a8133	4224	Gorenja vas
00050000-5582-b5f8-7936-7b266fe63c96	3263	Gorica pri Slivnici
00050000-5582-b5f8-5df8-2e954bd2177c	2272	Gorišnica
00050000-5582-b5f8-72ca-af7c5ef64a4f	9250	Gornja Radgona
00050000-5582-b5f8-a43d-4f8c5a948511	3342	Gornji Grad
00050000-5582-b5f8-d176-075bf3864de0	4282	Gozd Martuljek
00050000-5582-b5f8-e9bf-ec6a02660111	6272	Gračišče
00050000-5582-b5f8-224a-44f72a5f676d	9264	Grad
00050000-5582-b5f8-13b1-a23453c60bcc	8332	Gradac
00050000-5582-b5f8-b4c7-c6eb0c623155	1384	Grahovo
00050000-5582-b5f8-e4e8-88e59c0743f3	5242	Grahovo ob Bači
00050000-5582-b5f8-1b0b-88331039b612	5251	Grgar
00050000-5582-b5f8-c741-18f21908b216	3302	Griže
00050000-5582-b5f8-ebc7-c6b04872cc7e	3231	Grobelno
00050000-5582-b5f8-9b9f-b6c954002e25	1290	Grosuplje
00050000-5582-b5f8-2e77-c6762b00afa6	2288	Hajdina
00050000-5582-b5f8-a996-16adbafd3f76	8362	Hinje
00050000-5582-b5f8-380d-6b57ed961c08	2311	Hoče
00050000-5582-b5f8-f3a5-fffe56f5d217	9205	Hodoš/Hodos
00050000-5582-b5f8-c00f-51c8a67f1ce2	1354	Horjul
00050000-5582-b5f8-d393-4d810f077b7a	1372	Hotedršica
00050000-5582-b5f8-52a7-9d6abe3ffcb1	1430	Hrastnik
00050000-5582-b5f8-7061-09baf7928493	6225	Hruševje
00050000-5582-b5f8-af2e-208f95182369	4276	Hrušica
00050000-5582-b5f8-2157-e1907379f9a5	5280	Idrija
00050000-5582-b5f8-e03d-98d976b5b472	1292	Ig
00050000-5582-b5f8-67aa-5bb0d40bd789	6250	Ilirska Bistrica
00050000-5582-b5f8-1c28-66945fb92039	6251	Ilirska Bistrica-Trnovo
00050000-5582-b5f8-c842-2bc045682726	1295	Ivančna Gorica
00050000-5582-b5f8-5ece-aabbd71d68db	2259	Ivanjkovci
00050000-5582-b5f8-b48a-afeb6d9ee87b	1411	Izlake
00050000-5582-b5f8-e571-696bc026a92b	6310	Izola/Isola
00050000-5582-b5f8-d019-91920b7cfb73	2222	Jakobski Dol
00050000-5582-b5f8-5fae-36969e19bd84	2221	Jarenina
00050000-5582-b5f8-4d27-cf1b7cf910cc	6254	Jelšane
00050000-5582-b5f8-2210-11966860d6a6	4270	Jesenice
00050000-5582-b5f8-9f10-b881e3a0ac95	8261	Jesenice na Dolenjskem
00050000-5582-b5f8-e11e-29586fc7075d	3273	Jurklošter
00050000-5582-b5f8-0e9b-924764b8ced4	2223	Jurovski Dol
00050000-5582-b5f8-dcb1-5c98af54c6a7	2256	Juršinci
00050000-5582-b5f8-e682-6f8d50bcc45a	5214	Kal nad Kanalom
00050000-5582-b5f8-5535-ab9bc0eefcf5	3233	Kalobje
00050000-5582-b5f8-3c1d-a7e6f9c4e873	4246	Kamna Gorica
00050000-5582-b5f8-8e18-6a505c49d70c	2351	Kamnica
00050000-5582-b5f8-8b7c-250bbbd5937f	1241	Kamnik
00050000-5582-b5f8-e552-9d1d31020f60	5213	Kanal
00050000-5582-b5f8-4005-807d63f7ddb2	8258	Kapele
00050000-5582-b5f8-708f-3fbd96d29c6a	2362	Kapla
00050000-5582-b5f8-0274-bf26f65b36bd	2325	Kidričevo
00050000-5582-b5f8-34c4-13c5c696060a	1412	Kisovec
00050000-5582-b5f8-f310-af168f43a583	6253	Knežak
00050000-5582-b5f8-5519-a99cbad90a93	5222	Kobarid
00050000-5582-b5f8-6742-c74a5fb4bf00	9227	Kobilje
00050000-5582-b5f8-c29f-6f4c580e8b0e	1330	Kočevje
00050000-5582-b5f8-33a6-2af7bbc55b39	1338	Kočevska Reka
00050000-5582-b5f8-79ea-59a2c1a61259	2276	Kog
00050000-5582-b5f8-19ec-7435c7dbe98e	5211	Kojsko
00050000-5582-b5f8-9371-8959bde9f07d	6223	Komen
00050000-5582-b5f8-c64b-d74f7c0dda30	1218	Komenda
00050000-5582-b5f8-8eec-dac0e8eeac83	6000	Koper/Capodistria 
00050000-5582-b5f8-8f97-899a9035675a	6001	Koper/Capodistria - poštni predali
00050000-5582-b5f8-438a-3b1a3a1ec46e	8282	Koprivnica
00050000-5582-b5f8-8b22-470170375185	5296	Kostanjevica na Krasu
00050000-5582-b5f8-7cba-69d811e265e6	8311	Kostanjevica na Krki
00050000-5582-b5f8-145f-467b2cf146c0	1336	Kostel
00050000-5582-b5f8-a900-3f09921609b3	6256	Košana
00050000-5582-b5f8-24d4-55f1e1870efa	2394	Kotlje
00050000-5582-b5f8-aebf-cfe0322c4ffe	6240	Kozina
00050000-5582-b5f8-9ab1-0ae7376effcf	3260	Kozje
00050000-5582-b5f8-bb04-f30bfa47506e	4000	Kranj 
00050000-5582-b5f8-fad4-1c7854af8b27	4001	Kranj - poštni predali
00050000-5582-b5f8-9cde-bf8ea9544156	4280	Kranjska Gora
00050000-5582-b5f8-393e-19179e2bacf3	1281	Kresnice
00050000-5582-b5f8-1920-398b65d9a5b4	4294	Križe
00050000-5582-b5f8-7923-a5e528822ce4	9206	Križevci
00050000-5582-b5f8-db4b-78448d2639b6	9242	Križevci pri Ljutomeru
00050000-5582-b5f8-dfba-7bf50c143c8e	1301	Krka
00050000-5582-b5f8-fd17-99c43e7d2c96	8296	Krmelj
00050000-5582-b5f8-b495-422572b6de19	4245	Kropa
00050000-5582-b5f8-ae51-440b7b19c429	8262	Krška vas
00050000-5582-b5f8-7625-073adf379bf4	8270	Krško
00050000-5582-b5f8-30d5-17a651279cd8	9263	Kuzma
00050000-5582-b5f8-990c-d390a76a57ca	2318	Laporje
00050000-5582-b5f8-22e8-72521266d971	3270	Laško
00050000-5582-b5f8-a594-9837d98dd7b3	1219	Laze v Tuhinju
00050000-5582-b5f8-ef59-07c560445212	2230	Lenart v Slovenskih goricah
00050000-5582-b5f8-0efd-9a32d2d2469f	9220	Lendava/Lendva
00050000-5582-b5f8-604e-f4f8d41fa04e	4248	Lesce
00050000-5582-b5f8-67d8-04fa4bf97b8f	3261	Lesično
00050000-5582-b5f8-f4b4-c92c70a4d13f	8273	Leskovec pri Krškem
00050000-5582-b5f8-e9b6-78f7a636e7d1	2372	Libeliče
00050000-5582-b5f8-710b-3120b06ae44c	2341	Limbuš
00050000-5582-b5f8-f8ed-a4d7d6d6dcab	1270	Litija
00050000-5582-b5f8-f564-b2818fada7c9	3202	Ljubečna
00050000-5582-b5f8-0af0-9de2cd571987	1000	Ljubljana 
00050000-5582-b5f8-8624-ae230151bab4	1001	Ljubljana - poštni predali
00050000-5582-b5f8-b963-d93e81d9fc13	1231	Ljubljana - Črnuče
00050000-5582-b5f8-3214-375a8e91baf3	1261	Ljubljana - Dobrunje
00050000-5582-b5f8-d795-b2338c37e043	1260	Ljubljana - Polje
00050000-5582-b5f8-83b9-300fdc1c68f5	1210	Ljubljana - Šentvid
00050000-5582-b5f8-f744-4b06b3137c98	1211	Ljubljana - Šmartno
00050000-5582-b5f8-ec30-2161961ebebe	3333	Ljubno ob Savinji
00050000-5582-b5f8-7005-b82298736bab	9240	Ljutomer
00050000-5582-b5f8-1780-e3e7900c6f7c	3215	Loče
00050000-5582-b5f8-bc0a-361e9ce9cea1	5231	Log pod Mangartom
00050000-5582-b5f8-2a97-159978f45f50	1358	Log pri Brezovici
00050000-5582-b5f8-5fa6-3d54aa8ffb5c	1370	Logatec
00050000-5582-b5f8-c7e0-df44e637ba2d	1371	Logatec
00050000-5582-b5f8-ade9-deaba668d51a	1434	Loka pri Zidanem Mostu
00050000-5582-b5f8-eb63-1d5accf40b4e	3223	Loka pri Žusmu
00050000-5582-b5f8-c6a7-c8c8670fd6ba	6219	Lokev
00050000-5582-b5f8-9c45-a69040f17495	1318	Loški Potok
00050000-5582-b5f8-fe1f-e31118392777	2324	Lovrenc na Dravskem polju
00050000-5582-b5f8-b3a2-9a14a2b4da18	2344	Lovrenc na Pohorju
00050000-5582-b5f8-628b-bff0c5b6d932	3334	Luče
00050000-5582-b5f8-7226-e3eb08105b55	1225	Lukovica
00050000-5582-b5f8-9eaf-c9cfe79b4865	9202	Mačkovci
00050000-5582-b5f8-6bcd-6a3a7cf04d10	2322	Majšperk
00050000-5582-b5f8-113f-3d5fb0cdfb5e	2321	Makole
00050000-5582-b5f8-2d8a-30ffe480ec7e	9243	Mala Nedelja
00050000-5582-b5f8-d87f-dfd840c95882	2229	Malečnik
00050000-5582-b5f8-7d3e-78805e0e3655	6273	Marezige
00050000-5582-b5f8-e73f-5f1805a5ce20	2000	Maribor 
00050000-5582-b5f8-87e4-af3d75c2ffa5	2001	Maribor - poštni predali
00050000-5582-b5f8-dbbb-3cc0e4568a25	2206	Marjeta na Dravskem polju
00050000-5582-b5f8-7bfa-7e9d116f4b2a	2281	Markovci
00050000-5582-b5f8-716b-c8d05ca20785	9221	Martjanci
00050000-5582-b5f8-2b31-cdc40f76ae4b	6242	Materija
00050000-5582-b5f8-b8cd-bdf944e33f7f	4211	Mavčiče
00050000-5582-b5f8-df97-90db9d96657d	1215	Medvode
00050000-5582-b5f8-35c7-3d1bbf70de54	1234	Mengeš
00050000-5582-b5f8-f5bc-e4598428a4af	8330	Metlika
00050000-5582-b5f8-8d44-de6a00b27e05	2392	Mežica
00050000-5582-b5f8-f717-f313c8fb48c5	2204	Miklavž na Dravskem polju
00050000-5582-b5f8-614d-6681c5e37165	2275	Miklavž pri Ormožu
00050000-5582-b5f8-d469-25b1bb5923f8	5291	Miren
00050000-5582-b5f8-22cf-a3046545113a	8233	Mirna
00050000-5582-b5f8-9858-c8caf1a61a3c	8216	Mirna Peč
00050000-5582-b5f8-fede-83f8bc696b6d	2382	Mislinja
00050000-5582-b5f8-d13f-149b2d352462	4281	Mojstrana
00050000-5582-b5f8-a06e-5d2be9442748	8230	Mokronog
00050000-5582-b5f8-c1ab-ae49cf26ab4e	1251	Moravče
00050000-5582-b5f8-d604-65e9fcf24d00	9226	Moravske Toplice
00050000-5582-b5f8-e465-4f2b71b37dcb	5216	Most na Soči
00050000-5582-b5f8-b333-f890993789ff	1221	Motnik
00050000-5582-b5f8-94fd-8e78dcedc2c4	3330	Mozirje
00050000-5582-b5f8-dfd2-b1c976ec6c29	9000	Murska Sobota 
00050000-5582-b5f8-9799-3c280b0a5bbf	9001	Murska Sobota - poštni predali
00050000-5582-b5f8-cf4f-c9a50d6d2ed0	2366	Muta
00050000-5582-b5f8-2e22-1f22ed4d0baf	4202	Naklo
00050000-5582-b5f8-d6cd-1f7c9b799331	3331	Nazarje
00050000-5582-b5f8-9d93-51fd45dda2f1	1357	Notranje Gorice
00050000-5582-b5f8-471a-2bde500c2372	3203	Nova Cerkev
00050000-5582-b5f8-ba65-1361e2143477	5000	Nova Gorica 
00050000-5582-b5f8-42c3-1a2d3014c1bf	5001	Nova Gorica - poštni predali
00050000-5582-b5f8-d5aa-6a3739aae771	1385	Nova vas
00050000-5582-b5f8-9e37-1ed5393ce32f	8000	Novo mesto
00050000-5582-b5f8-45bc-c79a4d8caab7	8001	Novo mesto - poštni predali
00050000-5582-b5f8-dcfe-04588372cb24	6243	Obrov
00050000-5582-b5f8-4777-b64906b084b2	9233	Odranci
00050000-5582-b5f8-da54-c48ee316892b	2317	Oplotnica
00050000-5582-b5f8-6b17-9c61274b8faf	2312	Orehova vas
00050000-5582-b5f8-6e73-31881cda6682	2270	Ormož
00050000-5582-b5f8-ac00-4db8f8f31593	1316	Ortnek
00050000-5582-b5f8-5dd0-9991436a4fd7	1337	Osilnica
00050000-5582-b5f8-0546-9938f4eb684c	8222	Otočec
00050000-5582-b5f8-78b0-aeffadf5235d	2361	Ožbalt
00050000-5582-b5f8-6750-c5a706d65e46	2231	Pernica
00050000-5582-b5f8-48a6-8c6d1aa13ca3	2211	Pesnica pri Mariboru
00050000-5582-b5f8-9e7e-c621e1f97db5	9203	Petrovci
00050000-5582-b5f8-0948-8296ffa41c09	3301	Petrovče
00050000-5582-b5f8-161e-6a08e9b462d9	6330	Piran/Pirano
00050000-5582-b5f8-9029-c32901944886	8255	Pišece
00050000-5582-b5f8-5307-b5d100c2b681	6257	Pivka
00050000-5582-b5f8-44ed-585aff5d8910	6232	Planina
00050000-5582-b5f8-b9cc-4fb1d2714736	3225	Planina pri Sevnici
00050000-5582-b5f8-ca1c-949d1b9f86c1	6276	Pobegi
00050000-5582-b5f8-800d-1ffb6280239e	8312	Podbočje
00050000-5582-b5f8-bcca-b9316f6f00a9	5243	Podbrdo
00050000-5582-b5f8-b7d6-748884191151	3254	Podčetrtek
00050000-5582-b5f8-a156-84d279768a17	2273	Podgorci
00050000-5582-b5f8-143f-3e915550c9ae	6216	Podgorje
00050000-5582-b5f8-5009-6edc68a8c827	2381	Podgorje pri Slovenj Gradcu
00050000-5582-b5f8-5a77-6a566eeb2850	6244	Podgrad
00050000-5582-b5f8-38d2-048c44ace1d5	1414	Podkum
00050000-5582-b5f8-b8ad-7d7ababf4d20	2286	Podlehnik
00050000-5582-b5f8-d836-22703998f290	5272	Podnanos
00050000-5582-b5f8-4059-902df8fc7a59	4244	Podnart
00050000-5582-b5f8-1599-74b2d6798884	3241	Podplat
00050000-5582-b5f8-f90c-10215c484f32	3257	Podsreda
00050000-5582-b5f8-8900-1fcab621dde5	2363	Podvelka
00050000-5582-b5f8-4006-f202b18613fa	2208	Pohorje
00050000-5582-b5f8-45fe-a4aa04e18e5d	2257	Polenšak
00050000-5582-b5f8-03ce-813da069ed7b	1355	Polhov Gradec
00050000-5582-b5f8-f165-b7fb90a04a1a	4223	Poljane nad Škofjo Loko
00050000-5582-b5f8-2fca-fc282b0d54db	2319	Poljčane
00050000-5582-b5f8-94c1-4130e52034c4	1272	Polšnik
00050000-5582-b5f8-d30e-04e162c0a9a3	3313	Polzela
00050000-5582-b5f8-0d9d-29deb08c0217	3232	Ponikva
00050000-5582-b5f8-f6e9-b2aad3406391	6320	Portorož/Portorose
00050000-5582-b5f8-1243-8ac72008750e	6230	Postojna
00050000-5582-b5f8-8f6c-31cfde019e00	2331	Pragersko
00050000-5582-b5f8-e8c0-3e131691d665	3312	Prebold
00050000-5582-b5f8-fa8e-ebafeb8dbdee	4205	Preddvor
00050000-5582-b5f8-9383-5251160da222	6255	Prem
00050000-5582-b5f8-bf05-1fd260e4efa5	1352	Preserje
00050000-5582-b5f8-21cb-cb395e14b352	6258	Prestranek
00050000-5582-b5f8-cc6b-6998f536f901	2391	Prevalje
00050000-5582-b5f8-b514-269b2035f4e9	3262	Prevorje
00050000-5582-b5f8-672c-7d01616861cb	1276	Primskovo 
00050000-5582-b5f8-8e50-b5a86e293b09	3253	Pristava pri Mestinju
00050000-5582-b5f8-6157-2c1332dec7aa	9207	Prosenjakovci/Partosfalva
00050000-5582-b5f8-e9c1-a73030c6ec20	5297	Prvačina
00050000-5582-b5f8-3f44-9c1bc3966ad4	2250	Ptuj
00050000-5582-b5f8-4b4c-4360f45bd4d5	2323	Ptujska Gora
00050000-5582-b5f8-998a-6c5c846a365c	9201	Puconci
00050000-5582-b5f8-babe-8f69a1c15334	2327	Rače
00050000-5582-b5f8-9276-b519b3436be0	1433	Radeče
00050000-5582-b5f8-24ba-0d931483ed1b	9252	Radenci
00050000-5582-b5f8-abd6-601f5d1b5027	2360	Radlje ob Dravi
00050000-5582-b5f8-1130-a9120ebbbd1b	1235	Radomlje
00050000-5582-b5f8-a188-92fcc4bab40b	4240	Radovljica
00050000-5582-b5f8-10c3-0b135f6f0049	8274	Raka
00050000-5582-b5f8-a319-4a80eb309893	1381	Rakek
00050000-5582-b5f8-9bcd-e4cea1ecf05c	4283	Rateče - Planica
00050000-5582-b5f8-376f-482da579de42	2390	Ravne na Koroškem
00050000-5582-b5f8-aaeb-3c4bd5de9e48	9246	Razkrižje
00050000-5582-b5f8-bcf5-e44e6d55c530	3332	Rečica ob Savinji
00050000-5582-b5f8-85eb-f245d4b8332b	5292	Renče
00050000-5582-b5f8-1985-d36f0914891d	1310	Ribnica
00050000-5582-b5f8-cc7f-195cd4efe010	2364	Ribnica na Pohorju
00050000-5582-b5f8-cbd8-dcc94f357508	3272	Rimske Toplice
00050000-5582-b5f8-d586-7bfa3a8fcf51	1314	Rob
00050000-5582-b5f8-053d-a1d66e74563c	5215	Ročinj
00050000-5582-b5f8-4880-9ff7400fa377	3250	Rogaška Slatina
00050000-5582-b5f8-65e6-c2e1c7474d9e	9262	Rogašovci
00050000-5582-b5f8-ddb9-71366f37916e	3252	Rogatec
00050000-5582-b5f8-c1e5-80e2a01d6575	1373	Rovte
00050000-5582-b5f8-b1ae-1b1ef7073ef2	2342	Ruše
00050000-5582-b5f8-8aa9-2384b53d450e	1282	Sava
00050000-5582-b5f8-520f-c4c6b50148cd	6333	Sečovlje/Sicciole
00050000-5582-b5f8-6ad5-355dcabc8855	4227	Selca
00050000-5582-b5f8-289e-073d314682ab	2352	Selnica ob Dravi
00050000-5582-b5f8-4463-cebbc294632a	8333	Semič
00050000-5582-b5f8-51c2-41df68b4c336	8281	Senovo
00050000-5582-b5f8-f611-39ba237450f7	6224	Senožeče
00050000-5582-b5f8-5d86-b15ee4ce4601	8290	Sevnica
00050000-5582-b5f8-734b-b719ccfe686d	6210	Sežana
00050000-5582-b5f8-59aa-62da12589aa7	2214	Sladki Vrh
00050000-5582-b5f8-c392-2bf648a24b6d	5283	Slap ob Idrijci
00050000-5582-b5f8-9290-fcebbb7e11d1	2380	Slovenj Gradec
00050000-5582-b5f8-a998-9f8c41522825	2310	Slovenska Bistrica
00050000-5582-b5f8-0c51-25a84a1862d8	3210	Slovenske Konjice
00050000-5582-b5f8-bbb0-466171d68966	1216	Smlednik
00050000-5582-b5f8-f871-a6b0fd150205	5232	Soča
00050000-5582-b5f8-8c81-60c23440fd9f	1317	Sodražica
00050000-5582-b5f8-a840-9da69039c359	3335	Solčava
00050000-5582-b5f8-89f3-549a10fd2405	5250	Solkan
00050000-5582-b5f8-ea06-9687d22220cc	4229	Sorica
00050000-5582-b5f8-58d4-e59ec1a4d757	4225	Sovodenj
00050000-5582-b5f8-0531-55721a887eb5	5281	Spodnja Idrija
00050000-5582-b5f8-d2e3-698a31160d34	2241	Spodnji Duplek
00050000-5582-b5f8-5617-67d660d69b6c	9245	Spodnji Ivanjci
00050000-5582-b5f8-70e2-43b63afc4c35	2277	Središče ob Dravi
00050000-5582-b5f8-9502-eae601089504	4267	Srednja vas v Bohinju
00050000-5582-b5f8-a11a-ad1097dbb4cb	8256	Sromlje 
00050000-5582-b5f8-f81b-a72e85eb1baa	5224	Srpenica
00050000-5582-b5f8-cba9-94a261a8d577	1242	Stahovica
00050000-5582-b5f8-236d-143bf75f0511	1332	Stara Cerkev
00050000-5582-b5f8-12e2-4ced71ee896d	8342	Stari trg ob Kolpi
00050000-5582-b5f8-95bf-b1e1921af716	1386	Stari trg pri Ložu
00050000-5582-b5f8-b0df-c56454d96640	2205	Starše
00050000-5582-b5f8-21cd-ceb7ac2c2b5b	2289	Stoperce
00050000-5582-b5f8-ffb4-24aecb5a9711	8322	Stopiče
00050000-5582-b5f8-28f2-5eb159a54872	3206	Stranice
00050000-5582-b5f8-7cad-978591de0109	8351	Straža
00050000-5582-b5f8-5262-d6570464993e	1313	Struge
00050000-5582-b5f8-679b-0c1ad76f6569	8293	Studenec
00050000-5582-b5f8-e1a2-1802b41f7e0e	8331	Suhor
00050000-5582-b5f8-c7bd-b68216f658f9	2233	Sv. Ana v Slovenskih goricah
00050000-5582-b5f8-b4a7-333ef4f00638	2235	Sv. Trojica v Slovenskih goricah
00050000-5582-b5f8-a67e-033182e0ddaa	2353	Sveti Duh na Ostrem Vrhu
00050000-5582-b5f8-a151-af663ca6887b	9244	Sveti Jurij ob Ščavnici
00050000-5582-b5f8-c8e9-793de6ab741e	3264	Sveti Štefan
00050000-5582-b5f8-4a1f-c70ee9950a1d	2258	Sveti Tomaž
00050000-5582-b5f8-18de-c2e627cce9b5	9204	Šalovci
00050000-5582-b5f8-fe8b-5b85724ee663	5261	Šempas
00050000-5582-b5f8-39cc-c4f0f1951e45	5290	Šempeter pri Gorici
00050000-5582-b5f8-b91a-c6876e180232	3311	Šempeter v Savinjski dolini
00050000-5582-b5f8-5e01-ef145c79ab48	4208	Šenčur
00050000-5582-b5f8-46e7-24164e677073	2212	Šentilj v Slovenskih goricah
00050000-5582-b5f8-f90a-b73184e12518	8297	Šentjanž
00050000-5582-b5f8-828f-0f114d2a4a69	2373	Šentjanž pri Dravogradu
00050000-5582-b5f8-3400-c77dc6ccd1a9	8310	Šentjernej
00050000-5582-b5f8-a5a5-82120661e72f	3230	Šentjur
00050000-5582-b5f8-e47f-fb2587792f13	3271	Šentrupert
00050000-5582-b5f8-ea8a-2f1b8dce9ea3	8232	Šentrupert
00050000-5582-b5f8-08a0-2737588967e1	1296	Šentvid pri Stični
00050000-5582-b5f8-8758-444ecad2538e	8275	Škocjan
00050000-5582-b5f8-afce-44f33e5c41ee	6281	Škofije
00050000-5582-b5f8-782e-f1d3ab5f1f6d	4220	Škofja Loka
00050000-5582-b5f8-914e-974be40fd899	3211	Škofja vas
00050000-5582-b5f8-19bc-c8382bc45f2f	1291	Škofljica
00050000-5582-b5f8-52b4-807b76439341	6274	Šmarje
00050000-5582-b5f8-9a9b-ed39753c74ba	1293	Šmarje - Sap
00050000-5582-b5f8-0b0f-d4200a01822d	3240	Šmarje pri Jelšah
00050000-5582-b5f8-18a2-20f5ec597ed8	8220	Šmarješke Toplice
00050000-5582-b5f8-25ae-ea03b6168f84	2315	Šmartno na Pohorju
00050000-5582-b5f8-31f3-7b9d9c6e030d	3341	Šmartno ob Dreti
00050000-5582-b5f8-ce9f-99d9b4974bde	3327	Šmartno ob Paki
00050000-5582-b5f8-b1ae-29225b4b2a48	1275	Šmartno pri Litiji
00050000-5582-b5f8-5038-6c446fe6ddc9	2383	Šmartno pri Slovenj Gradcu
00050000-5582-b5f8-b56c-323c34de8454	3201	Šmartno v Rožni dolini
00050000-5582-b5f8-f476-799cd95476a0	3325	Šoštanj
00050000-5582-b5f8-9740-fef0de9fe2f9	6222	Štanjel
00050000-5582-b5f8-5926-257936e5d425	3220	Štore
00050000-5582-b5f8-7092-ef1ddc0b1519	3304	Tabor
00050000-5582-b5f8-254a-280a2a4e785c	3221	Teharje
00050000-5582-b5f8-d503-60494523c160	9251	Tišina
00050000-5582-b5f8-d8ab-a836d345943b	5220	Tolmin
00050000-5582-b5f8-1f7f-a15f5a51cc78	3326	Topolšica
00050000-5582-b5f8-301d-f38c644d80b3	2371	Trbonje
00050000-5582-b5f8-83fc-a8fcd6e21592	1420	Trbovlje
00050000-5582-b5f8-6e73-0fc5c14f92ac	8231	Trebelno 
00050000-5582-b5f8-d2f6-e2a8fcbec0e2	8210	Trebnje
00050000-5582-b5f8-4076-260aa5563ab0	5252	Trnovo pri Gorici
00050000-5582-b5f8-b544-142cb852e082	2254	Trnovska vas
00050000-5582-b5f8-b663-b69910662f51	1222	Trojane
00050000-5582-b5f8-5d99-f34af8733699	1236	Trzin
00050000-5582-b5f8-bb21-cd8bf75b685e	4290	Tržič
00050000-5582-b5f8-6247-aec96c28a091	8295	Tržišče
00050000-5582-b5f8-5659-2b211d633a1f	1311	Turjak
00050000-5582-b5f8-3c17-52134e75cd00	9224	Turnišče
00050000-5582-b5f8-092e-25b3852bfcf6	8323	Uršna sela
00050000-5582-b5f8-0e0c-6c9ab07afa50	1252	Vače
00050000-5582-b5f8-d19b-c7ba596b159c	3320	Velenje 
00050000-5582-b5f8-4e1d-9aeb5302d679	3322	Velenje - poštni predali
00050000-5582-b5f8-a757-e8c4d6ac45a5	8212	Velika Loka
00050000-5582-b5f8-d99d-480898d08ef9	2274	Velika Nedelja
00050000-5582-b5f8-ec2c-f04b2a8abd91	9225	Velika Polana
00050000-5582-b5f8-bdab-46e424ed88cf	1315	Velike Lašče
00050000-5582-b5f8-67eb-2202f41febcc	8213	Veliki Gaber
00050000-5582-b5f8-5f57-177f9d1ed69d	9241	Veržej
00050000-5582-b5f8-8e59-0cc9eab5cb94	1312	Videm - Dobrepolje
00050000-5582-b5f8-b91e-376d77887043	2284	Videm pri Ptuju
00050000-5582-b5f8-395c-0d821123174f	8344	Vinica
00050000-5582-b5f8-f266-09d1db1148ca	5271	Vipava
00050000-5582-b5f8-9635-cfefd313f417	4212	Visoko
00050000-5582-b5f8-ca82-b40508a4a719	1294	Višnja Gora
00050000-5582-b5f8-c010-978d1b51f47a	3205	Vitanje
00050000-5582-b5f8-b47f-73e92df232cf	2255	Vitomarci
00050000-5582-b5f8-3f9c-0c4783b709ec	1217	Vodice
00050000-5582-b5f8-b3e0-6a5707fc5797	3212	Vojnik\t
00050000-5582-b5f8-e5d0-aa2736117c0b	5293	Volčja Draga
00050000-5582-b5f8-15f8-dcd24c955f7c	2232	Voličina
00050000-5582-b5f8-f4ac-a021785cd95d	3305	Vransko
00050000-5582-b5f8-a0b5-358ab8c86f7a	6217	Vremski Britof
00050000-5582-b5f8-3c72-b56ab085b6d8	1360	Vrhnika
00050000-5582-b5f8-bf66-91b30260d0b3	2365	Vuhred
00050000-5582-b5f8-801b-037640fe4a77	2367	Vuzenica
00050000-5582-b5f8-1802-66952d031b6e	8292	Zabukovje 
00050000-5582-b5f8-162b-6d69b0059bfa	1410	Zagorje ob Savi
00050000-5582-b5f8-ec01-2522163e5bc0	1303	Zagradec
00050000-5582-b5f8-fdd8-b80021cd2a62	2283	Zavrč
00050000-5582-b5f8-cf1f-e788fedaa56f	8272	Zdole 
00050000-5582-b5f8-dd05-117df3bd857d	4201	Zgornja Besnica
00050000-5582-b5f8-a1d2-f21240d04a91	2242	Zgornja Korena
00050000-5582-b5f8-805a-f6b085898e33	2201	Zgornja Kungota
00050000-5582-b5f8-656e-fe887590b3cc	2316	Zgornja Ložnica
00050000-5582-b5f8-85f9-2079e0fd92fb	2314	Zgornja Polskava
00050000-5582-b5f8-df30-c4fc9704280c	2213	Zgornja Velka
00050000-5582-b5f8-66cb-5219fb284626	4247	Zgornje Gorje
00050000-5582-b5f8-e0c2-d455c10470cc	4206	Zgornje Jezersko
00050000-5582-b5f8-dd6a-07565c267ccd	2285	Zgornji Leskovec
00050000-5582-b5f8-18b2-6b53d4f03951	1432	Zidani Most
00050000-5582-b5f8-9c03-6a035dc8db46	3214	Zreče
00050000-5582-b5f8-8108-7ee46cc10db4	4209	Žabnica
00050000-5582-b5f8-fdf4-4f3d855695d9	3310	Žalec
00050000-5582-b5f8-5359-0955dbfe6dd9	4228	Železniki
00050000-5582-b5f8-db35-f5c090642b3b	2287	Žetale
00050000-5582-b5f8-d98e-eb78395415d4	4226	Žiri
00050000-5582-b5f8-943c-2ec9b2781090	4274	Žirovnica
00050000-5582-b5f8-55fb-e3983642f664	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7719147)
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
-- TOC entry 2836 (class 0 OID 7718958)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7719036)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7719159)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7719279)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7719332)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5582-b5f9-18fb-8d539bc9328c	00080000-5582-b5f9-5924-54db559987a4	0900	AK
00190000-5582-b5f9-bd14-171142ce95e0	00080000-5582-b5f9-f7b4-5823135f0ef0	0987	A
00190000-5582-b5f9-e23c-16fae7912be0	00080000-5582-b5f9-927a-8235e1ef7e81	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7719451)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7719514)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7719464)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7719483)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7719188)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5582-b5f9-2885-fe6863433ee7	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5582-b5f9-1a9d-4431a2f1dea4	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5582-b5f9-ed09-185875524329	0003	Kazinska	t	84	Kazinska dvorana
00220000-5582-b5f9-5977-346109a1d976	0004	Mali oder	t	24	Mali oder 
00220000-5582-b5f9-958f-c55dce82c203	0005	Komorni oder	t	15	Komorni oder
00220000-5582-b5f9-484c-f80b6965a6db	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5582-b5f9-8d6e-0bd118961908	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7719132)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7719122)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7719321)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7719256)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7718830)
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
-- TOC entry 2861 (class 0 OID 7719198)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7718868)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5582-b5f7-982e-66660fc861b3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5582-b5f7-34db-519c7df3f406	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5582-b5f7-8307-1a8a9116a843	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5582-b5f7-4a1e-b6741f1ed066	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5582-b5f7-bde3-7853f66034c2	planer	Planer dogodkov v koledarju	t
00020000-5582-b5f7-0222-f62bca18ab02	kadrovska	Kadrovska služba	t
00020000-5582-b5f7-5769-28f8bf56491c	arhivar	Ažuriranje arhivalij	t
00020000-5582-b5f7-1683-bdd044535124	igralec	Igralec	t
00020000-5582-b5f7-43e3-44636bcdffc9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7718852)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5582-b5f7-15a1-ea887c20017d	00020000-5582-b5f7-8307-1a8a9116a843
00010000-5582-b5f7-f408-a979612141ae	00020000-5582-b5f7-8307-1a8a9116a843
\.


--
-- TOC entry 2863 (class 0 OID 7719212)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7719153)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7719103)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7719547)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5582-b5f8-55b9-1aa889f4f9f7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5582-b5f8-5a6d-e0e852bd273f	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5582-b5f8-c661-c53fcd80d2d8	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5582-b5f8-c99e-ef40d7076694	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5582-b5f8-adba-3e3791acdf07	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7719539)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5582-b5f8-3a4c-f6bdb42ead74	00230000-5582-b5f8-c99e-ef40d7076694	popa
00240000-5582-b5f8-d587-415bc7b1021d	00230000-5582-b5f8-c99e-ef40d7076694	oseba
00240000-5582-b5f8-359e-81c353626b57	00230000-5582-b5f8-5a6d-e0e852bd273f	prostor
00240000-5582-b5f8-731b-02e6c210203f	00230000-5582-b5f8-c99e-ef40d7076694	besedilo
00240000-5582-b5f8-4821-dbc40581942b	00230000-5582-b5f8-c99e-ef40d7076694	uprizoritev
00240000-5582-b5f8-af0e-5ef67540b821	00230000-5582-b5f8-c99e-ef40d7076694	funkcija
00240000-5582-b5f8-fbb6-e218b7a8dafe	00230000-5582-b5f8-c99e-ef40d7076694	tipfunkcije
00240000-5582-b5f8-5b77-85da1af9d1b4	00230000-5582-b5f8-c99e-ef40d7076694	alternacija
00240000-5582-b5f8-1ead-bfdd67c8f405	00230000-5582-b5f8-55b9-1aa889f4f9f7	pogodba
00240000-5582-b5f8-c673-1c46aa3dc81d	00230000-5582-b5f8-c99e-ef40d7076694	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7719534)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7719266)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7718930)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7719109)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5582-b5f9-1c67-1b63a3411404	00180000-5582-b5f9-cbbb-d4a490bd2bfa	000c0000-5582-b5f9-52d0-c6c07ccaec23	00090000-5582-b5f9-7379-56fda3b83bc3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-b5f9-e1be-00f2124dda18	00180000-5582-b5f9-cbbb-d4a490bd2bfa	000c0000-5582-b5f9-8f5c-1e511389ebbd	00090000-5582-b5f9-18f6-97dcdfdb11fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-b5f9-2714-c3aa43ebc205	00180000-5582-b5f9-cbbb-d4a490bd2bfa	000c0000-5582-b5f9-daf7-3a0122332a72	00090000-5582-b5f9-2df9-6fd954630c87	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-b5f9-97f2-d29adfa33664	00180000-5582-b5f9-cbbb-d4a490bd2bfa	000c0000-5582-b5f9-e420-924a2d6914d5	00090000-5582-b5f9-b9d7-8a0055a0b87f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-b5f9-8635-160804692e76	00180000-5582-b5f9-cbbb-d4a490bd2bfa	000c0000-5582-b5f9-6e67-d1d9cbd6d3b0	00090000-5582-b5f9-a39b-a0deac10c4a7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5582-b5f9-5968-243f9c671d83	00180000-5582-b5f9-5c44-7ddd02322309	\N	00090000-5582-b5f9-a39b-a0deac10c4a7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7719310)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5582-b5f8-9772-a723a53f6520	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5582-b5f8-0a65-70d738b6538b	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5582-b5f8-4fdc-b481ea73a1a5	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5582-b5f8-fe66-c1739c3eb60e	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5582-b5f8-dfb5-a90bf29b5d85	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5582-b5f8-26e0-b6ff06085545	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5582-b5f8-c012-bf0e05f6cd0a	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5582-b5f8-d272-ff3b277e0df0	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5582-b5f8-dfa4-2a2b6dbae027	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5582-b5f8-7fab-59a1e6e9d109	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5582-b5f8-68f3-81b44e5e870c	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5582-b5f8-b2e3-6a136bbf2ac9	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5582-b5f8-12e3-d2b6675f351a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5582-b5f8-6c29-4fa8e781daa5	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5582-b5f8-75be-d3ac2dba21ba	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5582-b5f8-b4a8-a306e139c5a3	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7719503)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5582-b5f8-4fb5-ad9fd637d69d	01	Velika predstava	f	1.00	1.00
002b0000-5582-b5f8-edbc-25984cb6a671	02	Mala predstava	f	0.50	0.50
002b0000-5582-b5f8-e9d0-605d0309d356	03	Mala koprodukcija	t	0.40	1.00
002b0000-5582-b5f8-adff-55b7313a1571	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5582-b5f8-c437-9e7daf928b28	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7718993)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7718839)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5582-b5f7-f408-a979612141ae	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRONq1VJPTvmEMJYUzJ/4ofhhf320algHu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-abd8-8b1cfc203ae1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-a44a-12942ba6ed35	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-9e2f-ec61ad010f8c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-ecf6-260361f2964c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-8e1a-b3953a044b62	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-ebcd-55a70e53ba5c	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-1314-f4d871e5c357	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-40ea-4772ecb55670	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5582-b5f9-42fe-faa645fb9c6d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5582-b5f7-15a1-ea887c20017d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7719367)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5582-b5f9-a36e-f36a972fa780	00160000-5582-b5f9-17fb-fd2a92288696	00150000-5582-b5f8-6672-9d8d18f2931c	00140000-5582-b5f7-c946-5ae83630f44d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5582-b5f9-958f-c55dce82c203
000e0000-5582-b5f9-8b1f-17a2cdec3c09	00160000-5582-b5f9-e9a3-9a4c73bff4a3	00150000-5582-b5f8-c6be-ecd2c2b39f2b	00140000-5582-b5f7-981c-5619ed95dcb3	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5582-b5f9-484c-f80b6965a6db
000e0000-5582-b5f9-5275-10655833fe3a	\N	00150000-5582-b5f8-c6be-ecd2c2b39f2b	00140000-5582-b5f7-981c-5619ed95dcb3	00190000-5582-b5f9-bd14-171142ce95e0	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5582-b5f9-958f-c55dce82c203
000e0000-5582-b5f9-a8f9-c467a953ce80	\N	00150000-5582-b5f8-c6be-ecd2c2b39f2b	00140000-5582-b5f7-981c-5619ed95dcb3	00190000-5582-b5f9-bd14-171142ce95e0	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5582-b5f9-958f-c55dce82c203
\.


--
-- TOC entry 2844 (class 0 OID 7719055)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5582-b5f9-b680-9b41bf56cd78	000e0000-5582-b5f9-8b1f-17a2cdec3c09	1	
00200000-5582-b5f9-ee4b-30e661b106f7	000e0000-5582-b5f9-8b1f-17a2cdec3c09	2	
\.


--
-- TOC entry 2859 (class 0 OID 7719180)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7719249)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7719087)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7719357)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5582-b5f7-c946-5ae83630f44d	01	Drama	drama (SURS 01)
00140000-5582-b5f7-0e62-cbcf41a2351c	02	Opera	opera (SURS 02)
00140000-5582-b5f7-954b-514f58a10b1e	03	Balet	balet (SURS 03)
00140000-5582-b5f7-8721-e22fd790ac17	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5582-b5f7-e6fb-4c69817618fb	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5582-b5f7-981c-5619ed95dcb3	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5582-b5f7-c9a6-a039f13fb6dc	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7719239)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5582-b5f8-cf9c-a8002df224f1	01	Opera	opera
00150000-5582-b5f8-2a47-2a5179441e83	02	Opereta	opereta
00150000-5582-b5f8-2ac1-5671719b2a1f	03	Balet	balet
00150000-5582-b5f8-6b3c-e7a0f326aa84	04	Plesne prireditve	plesne prireditve
00150000-5582-b5f8-18cb-96308b0700ea	05	Lutkovno gledališče	lutkovno gledališče
00150000-5582-b5f8-d71c-b04e946c1079	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5582-b5f8-d127-b37bfaa53c59	07	Biografska drama	biografska drama
00150000-5582-b5f8-6672-9d8d18f2931c	08	Komedija	komedija
00150000-5582-b5f8-5c3d-dbf4ed700544	09	Črna komedija	črna komedija
00150000-5582-b5f8-1730-52784d1507a3	10	E-igra	E-igra
00150000-5582-b5f8-c6be-ecd2c2b39f2b	11	Kriminalka	kriminalka
00150000-5582-b5f8-9127-b106798a18b9	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7718893)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7719414)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7719404)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7719309)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7719077)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7719102)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7719019)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7719447)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7719235)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7719053)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7719096)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7719033)
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
-- TOC entry 2499 (class 2606 OID 7719145)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7719172)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7718991)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7718902)
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
-- TOC entry 2414 (class 2606 OID 7718926)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7718882)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7718867)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7719178)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7719211)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7719352)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7718955)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7718979)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7719151)
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
-- TOC entry 2429 (class 2606 OID 7718969)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7719040)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7719163)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7719291)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7719337)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7719462)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7719532)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7719479)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7719500)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7719195)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7719136)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7719127)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7719331)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7719263)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7718838)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7719202)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7718856)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7718876)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7719220)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7719158)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7719108)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7719556)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7719544)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7719538)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7719276)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7718935)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7719118)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7719320)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7719513)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7719004)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7718851)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7719383)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7719062)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7719186)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7719254)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7719091)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7719365)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7719247)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7719084)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7719277)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7719278)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7718957)
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
-- TOC entry 2512 (class 1259 OID 7719179)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7719165)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7719164)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7719063)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7719236)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7719238)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7719237)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7719035)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7719034)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7719354)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7719355)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7719356)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7719502)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7719501)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7719388)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7719385)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7719389)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7719387)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7719386)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7719006)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7719005)
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
-- TOC entry 2412 (class 1259 OID 7718929)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7719203)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7719097)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7718883)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7718884)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7719223)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7719222)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7719221)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7719041)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7719043)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7719042)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7719546)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7719131)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7719129)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7719128)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7719130)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7718857)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7718858)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7719187)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7719152)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7719264)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7719265)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7719448)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7719449)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7719450)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7718971)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7718970)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7718972)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7719533)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7719292)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7719293)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7719418)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7719420)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7719416)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7719419)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7719417)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7719255)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7719140)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7719139)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7719137)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7719138)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7719406)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7719405)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7719463)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7719054)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7718904)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7718903)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7718936)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7718937)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7719121)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7719120)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7719119)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7719482)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7719480)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7719481)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7719086)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7719082)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7719079)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7719080)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7719078)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7719083)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7719081)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7718956)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7719020)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7719022)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7719021)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7719023)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7719146)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7719353)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7719384)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7718927)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7718928)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7719248)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7719557)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7718992)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7719545)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7719197)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7719196)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7719415)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7718980)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7719366)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7719338)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7719339)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7718877)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7719085)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7719693)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7719678)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7719683)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7719703)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7719673)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7719698)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7719688)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7719848)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7719853)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7719608)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7719788)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7719783)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7719778)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7719668)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7719818)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7719828)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7719823)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7719643)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7719638)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7719768)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7719873)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7719878)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7719883)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7719988)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7719983)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7719903)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7719888)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7719908)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7719898)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7719893)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7719633)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7719628)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7719593)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7719588)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7719798)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7719708)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7719568)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7719573)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7719813)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7719808)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7719803)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7719648)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7719658)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7719653)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7719998)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7719743)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7719733)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7719728)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7719738)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7719558)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7719563)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7719793)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7719773)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7719838)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7719843)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7719948)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7719953)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7719958)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7719618)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7719613)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7719623)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7719993)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7719858)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7719863)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7719933)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7719943)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7719923)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7719938)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7719928)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7719833)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7719763)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7719758)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7719748)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7719753)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7719918)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7719913)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7719963)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7719663)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7719868)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7719583)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7719578)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7719598)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7719603)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7719723)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7719718)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7719713)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7719978)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7719968)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7719973)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-18 14:13:46 CEST

--
-- PostgreSQL database dump complete
--

