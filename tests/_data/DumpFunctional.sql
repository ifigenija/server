--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-17 17:00:02 CEST

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
-- TOC entry 180 (class 1259 OID 7620839)
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
-- TOC entry 227 (class 1259 OID 7621361)
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
-- TOC entry 226 (class 1259 OID 7621344)
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
-- TOC entry 219 (class 1259 OID 7621248)
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
-- TOC entry 194 (class 1259 OID 7621018)
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
-- TOC entry 197 (class 1259 OID 7621052)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7620961)
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
-- TOC entry 228 (class 1259 OID 7621375)
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
-- TOC entry 213 (class 1259 OID 7621178)
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
-- TOC entry 192 (class 1259 OID 7620998)
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
-- TOC entry 196 (class 1259 OID 7621046)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7620978)
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
-- TOC entry 202 (class 1259 OID 7621095)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7621120)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7620935)
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
-- TOC entry 181 (class 1259 OID 7620848)
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
-- TOC entry 182 (class 1259 OID 7620859)
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
-- TOC entry 177 (class 1259 OID 7620813)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7620832)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7621127)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7621158)
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
-- TOC entry 223 (class 1259 OID 7621294)
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
-- TOC entry 184 (class 1259 OID 7620892)
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
-- TOC entry 186 (class 1259 OID 7620927)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7621101)
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
-- TOC entry 185 (class 1259 OID 7620912)
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
-- TOC entry 191 (class 1259 OID 7620990)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7621113)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7621233)
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
-- TOC entry 222 (class 1259 OID 7621286)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7621405)
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
-- TOC entry 233 (class 1259 OID 7621468)
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
-- TOC entry 230 (class 1259 OID 7621418)
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
-- TOC entry 231 (class 1259 OID 7621437)
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
-- TOC entry 209 (class 1259 OID 7621142)
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
-- TOC entry 201 (class 1259 OID 7621086)
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
-- TOC entry 200 (class 1259 OID 7621076)
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
-- TOC entry 221 (class 1259 OID 7621275)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7621210)
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
-- TOC entry 174 (class 1259 OID 7620784)
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
-- TOC entry 173 (class 1259 OID 7620782)
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
-- TOC entry 210 (class 1259 OID 7621152)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7620822)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7620806)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7621166)
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
-- TOC entry 204 (class 1259 OID 7621107)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7621057)
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
-- TOC entry 236 (class 1259 OID 7621501)
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
-- TOC entry 235 (class 1259 OID 7621493)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7621488)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7621220)
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
-- TOC entry 183 (class 1259 OID 7620884)
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
-- TOC entry 199 (class 1259 OID 7621063)
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
-- TOC entry 220 (class 1259 OID 7621264)
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
-- TOC entry 232 (class 1259 OID 7621457)
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
-- TOC entry 188 (class 1259 OID 7620947)
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
-- TOC entry 175 (class 1259 OID 7620793)
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
-- TOC entry 225 (class 1259 OID 7621321)
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
-- TOC entry 193 (class 1259 OID 7621009)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7621134)
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
-- TOC entry 215 (class 1259 OID 7621203)
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
-- TOC entry 195 (class 1259 OID 7621041)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7621311)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7621193)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7620787)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2831 (class 0 OID 7620839)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7621361)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5581-8b71-68b2-e7352edf2006	000d0000-5581-8b71-02a0-175813605f4d	\N	00090000-5581-8b71-420f-027040db137a	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-8b71-d432-9272d939adde	000d0000-5581-8b71-c6fb-4d0a56d1cb96	\N	00090000-5581-8b71-3339-d77ec0d04c78	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-8b71-f986-17c65556740a	000d0000-5581-8b71-473c-8d4d00b2623e	\N	00090000-5581-8b71-6623-5b3ccaf5d014	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-8b71-d49c-4c73a6e7c7ce	000d0000-5581-8b71-ed1f-ccb1abed5bb1	\N	00090000-5581-8b71-f036-d28e28bb687b	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-8b71-3bcc-d2d832bffe8f	000d0000-5581-8b71-82f6-677116051957	\N	00090000-5581-8b71-e77c-77abf53e0c61	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5581-8b71-360e-5a67331eebae	000d0000-5581-8b71-f8b9-50973368e8f0	\N	00090000-5581-8b71-3339-d77ec0d04c78	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2877 (class 0 OID 7621344)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7621248)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5581-8b71-92bc-d5eb3b7a97e3	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5581-8b71-eaef-7e1c3f473a90	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5581-8b71-c09c-a6207420323e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2845 (class 0 OID 7621018)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5581-8b71-6cb4-5bee24fa54a1	\N	\N	00200000-5581-8b71-eede-7f79f2ece269	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5581-8b71-6abe-67523e7d168f	\N	\N	00200000-5581-8b71-cad9-5ca970787bb6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5581-8b71-955e-4babd11119ab	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5581-8b71-b682-5a7a53d1c54a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5581-8b71-5fd6-74ad66e6b410	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2848 (class 0 OID 7621052)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7620961)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5581-8b70-1bbb-829c490b5b9a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5581-8b70-2be4-72807b1106b7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5581-8b70-450c-94e8f99b5a59	AL	ALB	008	Albania 	Albanija	\N
00040000-5581-8b70-e785-4f555f2b8f94	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5581-8b70-bf2b-e1a55837be41	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5581-8b70-f204-a901d1f7e5e0	AD	AND	020	Andorra 	Andora	\N
00040000-5581-8b70-e19a-9f8d7dc4cf0d	AO	AGO	024	Angola 	Angola	\N
00040000-5581-8b70-5b46-f164fd59f0ea	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5581-8b70-62f9-5f7836e5eba8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5581-8b70-0b96-894fa6ae754c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5581-8b70-1d8f-a1413a4fd8ae	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5581-8b70-14c0-0e893b0db626	AM	ARM	051	Armenia 	Armenija	\N
00040000-5581-8b70-2b3d-e71aaebf4e9a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5581-8b70-107c-abb182e05751	AU	AUS	036	Australia 	Avstralija	\N
00040000-5581-8b70-1dba-01f789529216	AT	AUT	040	Austria 	Avstrija	\N
00040000-5581-8b70-e463-e9abee2bc574	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5581-8b70-daf5-ed9231eb0cb5	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5581-8b70-63a5-44bc420bcdd3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5581-8b70-8fa9-bb55a2720d26	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5581-8b70-d1c9-feff83572ffa	BB	BRB	052	Barbados 	Barbados	\N
00040000-5581-8b70-5b04-ded17ef5668e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5581-8b70-42e2-d1b48e9f6c65	BE	BEL	056	Belgium 	Belgija	\N
00040000-5581-8b70-ad27-101f527cc1a9	BZ	BLZ	084	Belize 	Belize	\N
00040000-5581-8b70-62d8-cf161c1bdf68	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5581-8b70-651f-5e4a3a9145aa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5581-8b70-5634-8001bde5c537	BT	BTN	064	Bhutan 	Butan	\N
00040000-5581-8b70-dd84-a7c1c41012f2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5581-8b70-a9b3-9ada9ca13164	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5581-8b70-bba0-a5dd53ac0205	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5581-8b70-ff83-582cb71667b7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5581-8b70-eb8c-1156d9575a05	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5581-8b70-b659-5b7418b478f5	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5581-8b70-64d2-353c1336e776	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5581-8b70-b91b-33bdac2a9472	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5581-8b70-261e-ce1f31d9e3dc	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5581-8b70-9b58-8accff9dca6d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5581-8b70-7391-b89aea5c9deb	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5581-8b70-32c0-18bef1369fef	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5581-8b70-86dc-56a241da2120	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5581-8b70-c9e7-abba4790cb95	CA	CAN	124	Canada 	Kanada	\N
00040000-5581-8b70-b43f-8792b305f3d2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5581-8b70-3be7-33fa976a45f7	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5581-8b70-2612-e7694db26cb0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5581-8b70-2fca-d9998a6f6346	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5581-8b70-67b9-a2d06f569b5d	CL	CHL	152	Chile 	Čile	\N
00040000-5581-8b70-2848-90a0fe208aa5	CN	CHN	156	China 	Kitajska	\N
00040000-5581-8b70-304d-862f2f88cf48	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5581-8b70-a7d6-6531cbe4cf03	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5581-8b70-8699-22afc3b72655	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5581-8b70-5fd1-12fdac8a3bf7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5581-8b70-d3e1-3441c8209a63	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5581-8b70-5569-4cbac493df82	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5581-8b70-8e3c-0003a32c393c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5581-8b70-51f1-2d7350f39bd9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5581-8b70-fcdf-b718c1479952	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5581-8b70-134f-1c71bdaf1e7b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5581-8b70-3291-ffcd6e2b0acd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5581-8b70-0d06-db3f84bcdc5e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5581-8b70-0196-b806bf0e6bcc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5581-8b70-b442-7f768e2616b3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5581-8b70-3636-8bd0430f7de6	DK	DNK	208	Denmark 	Danska	\N
00040000-5581-8b70-38c5-abf7d0eb4b9e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5581-8b70-3a3a-16e41171fe97	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5581-8b70-5bc8-07a1b7fe27f2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5581-8b70-0c44-1271c2e89f62	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5581-8b70-a019-ea124e91f02a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5581-8b70-adbd-e1ef421f760e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5581-8b70-bb6e-01da38527044	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5581-8b70-b2f0-6cc41358c146	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5581-8b70-9374-52a534d6328b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5581-8b70-3292-9d5b80161faf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5581-8b70-c01c-bd7f1193961d	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5581-8b70-7476-4ad527a5ec15	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5581-8b70-f861-2a8858c9aca6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5581-8b70-20ab-5adba593fc8f	FI	FIN	246	Finland 	Finska	\N
00040000-5581-8b70-0240-08d60fbbdca6	FR	FRA	250	France 	Francija	\N
00040000-5581-8b70-af95-935b42a6fb4c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5581-8b70-4267-eefa7b2a6b96	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5581-8b70-7205-717711fab67e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5581-8b70-95f0-3c768c70817f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5581-8b70-a759-63ec0af8f9c6	GA	GAB	266	Gabon 	Gabon	\N
00040000-5581-8b70-dd0d-9dcb6540a759	GM	GMB	270	Gambia 	Gambija	\N
00040000-5581-8b70-2fe6-f72a545e2e8a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5581-8b70-9f69-e2584478b1d1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5581-8b70-f141-9685523610d6	GH	GHA	288	Ghana 	Gana	\N
00040000-5581-8b70-9fa8-2d6e968cb6d1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5581-8b70-cffd-8cf7f62de5bf	GR	GRC	300	Greece 	Grčija	\N
00040000-5581-8b70-3b47-fc9f1d487e92	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5581-8b70-fdc4-ef56f2b789aa	GD	GRD	308	Grenada 	Grenada	\N
00040000-5581-8b70-9cf9-7f58a0ad4e76	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5581-8b70-767a-0e1a350ab4a1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5581-8b70-09dc-e68663bc2f53	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5581-8b70-14eb-4f91faef882d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5581-8b70-a276-3c511055fb24	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5581-8b70-6d66-94b675ee0ac9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5581-8b70-6a01-1355ced46a76	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5581-8b70-ca14-d001c28a21ef	HT	HTI	332	Haiti 	Haiti	\N
00040000-5581-8b70-b78f-172a60df73e3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5581-8b70-7583-43910a247ba0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5581-8b70-b43c-f70887c4a5d9	HN	HND	340	Honduras 	Honduras	\N
00040000-5581-8b70-3a1f-57b313e541d5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5581-8b70-4826-4823bb7b6f0d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5581-8b70-f9aa-d936510bfb7a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5581-8b70-cc87-5330469581fa	IN	IND	356	India 	Indija	\N
00040000-5581-8b70-911d-0cabad7bb792	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5581-8b70-0ac2-47d7f7b67957	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5581-8b70-583a-c4dc1f4e231f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5581-8b70-44b6-764533136235	IE	IRL	372	Ireland 	Irska	\N
00040000-5581-8b70-e2c7-1286de838125	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5581-8b70-866f-4311e2526057	IL	ISR	376	Israel 	Izrael	\N
00040000-5581-8b70-f118-a4db954c945d	IT	ITA	380	Italy 	Italija	\N
00040000-5581-8b70-412a-70368a60efa0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5581-8b70-45d5-70063e3318bf	JP	JPN	392	Japan 	Japonska	\N
00040000-5581-8b70-d2d3-792ca0bb889d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5581-8b70-bdd2-230cc303232c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5581-8b70-fdad-c99f1b8f3472	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5581-8b70-c08a-06f6ef4f1097	KE	KEN	404	Kenya 	Kenija	\N
00040000-5581-8b70-2989-f321f4dda5e6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5581-8b70-1883-c50e5d797f36	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5581-8b70-fdea-d47ab8067176	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5581-8b70-f11f-c705071c909f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5581-8b70-54a7-f9d88d26ad1b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5581-8b70-3e70-ffa56635b1f5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5581-8b70-848a-581843952527	LV	LVA	428	Latvia 	Latvija	\N
00040000-5581-8b70-ecf2-41f4cfdbcb93	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5581-8b70-cc52-08e84a99dd9b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5581-8b70-19b0-3657610189f7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5581-8b70-4613-b2598811d3d2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5581-8b70-a664-415412056a7f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5581-8b70-7415-e66d541f703f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5581-8b70-3d2a-6dd59ccc146a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5581-8b70-74d1-77ebdd383d1e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5581-8b70-2062-c957fac6deb8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5581-8b70-32d4-2bbe6615d694	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5581-8b70-2f5a-db5ea377eb62	MW	MWI	454	Malawi 	Malavi	\N
00040000-5581-8b70-aa88-ccde82379fe4	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5581-8b70-f9d0-c02c8c5074d9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5581-8b70-5449-fb5d52d66db1	ML	MLI	466	Mali 	Mali	\N
00040000-5581-8b70-1cf6-8964a4c4b1a7	MT	MLT	470	Malta 	Malta	\N
00040000-5581-8b70-6399-27618c6e1f7b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5581-8b70-3e6f-5b96c92150bc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5581-8b70-45c7-05346ad8b24e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5581-8b70-5501-e89ef13c2914	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5581-8b70-4b57-265507ef6942	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5581-8b70-30d3-09d2e4ac4aa2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5581-8b70-6b26-a8879bf04024	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5581-8b70-9080-a8ff78d1feba	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5581-8b70-3fe2-d3b29b679132	MC	MCO	492	Monaco 	Monako	\N
00040000-5581-8b70-825e-00bbc4ac0f8b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5581-8b70-160f-54031a07835c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5581-8b70-4e0e-d7e675b7c641	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5581-8b70-6cce-40e37f0f84c8	MA	MAR	504	Morocco 	Maroko	\N
00040000-5581-8b70-415b-704ce3ecb307	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5581-8b70-5ec4-47367b5397ea	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5581-8b70-783c-c72c58bc23f5	NA	NAM	516	Namibia 	Namibija	\N
00040000-5581-8b70-44fd-f94baad7d343	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5581-8b70-9ad7-f2729d74bbb7	NP	NPL	524	Nepal 	Nepal	\N
00040000-5581-8b70-79e3-9b0436089e7d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5581-8b70-c63f-a3627aa4377f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5581-8b70-4b88-a455e5b9158c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5581-8b70-fb21-f97658846107	NE	NER	562	Niger 	Niger 	\N
00040000-5581-8b70-a8e0-9f0edd30760f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5581-8b70-1ec9-500636b93af2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5581-8b70-e6ab-a6070b44a560	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5581-8b70-6794-4ad804b5cbc0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5581-8b70-7482-aa143c400fd8	NO	NOR	578	Norway 	Norveška	\N
00040000-5581-8b70-9f39-77c3bc9e6a43	OM	OMN	512	Oman 	Oman	\N
00040000-5581-8b70-06be-fe2689f92933	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5581-8b70-81ce-072bb3411438	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5581-8b70-e18d-ee8a3b493745	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5581-8b70-0fc7-f4e5816813c0	PA	PAN	591	Panama 	Panama	\N
00040000-5581-8b70-9462-4e33c1143eed	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5581-8b70-b300-014a360711fb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5581-8b70-5d5b-d74380f4c031	PE	PER	604	Peru 	Peru	\N
00040000-5581-8b70-4ece-6c046eae2e86	PH	PHL	608	Philippines 	Filipini	\N
00040000-5581-8b70-86e4-f79e15172d75	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5581-8b70-30c7-37ef310f5f8c	PL	POL	616	Poland 	Poljska	\N
00040000-5581-8b70-6b2a-a5a3e20adf0b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5581-8b70-433e-9e4d22c3829c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5581-8b70-1589-1ab4e4c9c5d4	QA	QAT	634	Qatar 	Katar	\N
00040000-5581-8b70-42bc-3c92313584de	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5581-8b70-3122-8b2ffcb922b6	RO	ROU	642	Romania 	Romunija	\N
00040000-5581-8b70-c731-ec7a03e021bf	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5581-8b70-95db-6d2451d26a5e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5581-8b70-de5f-6ed3c100d1f9	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5581-8b70-1c9c-fa33197a2b1b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5581-8b70-4706-437f22dc6c60	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5581-8b70-a57e-8e1088dc9c03	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5581-8b70-62f7-3813ec559db7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5581-8b70-fd36-bd7e07323807	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5581-8b70-9756-2fcb968bf554	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5581-8b70-5947-f55183de507b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5581-8b70-aac9-75f92ae82a65	SM	SMR	674	San Marino 	San Marino	\N
00040000-5581-8b70-bbad-c4b450727a4e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5581-8b70-e3bd-1957a421a253	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5581-8b70-558f-bb8d1c108a6d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5581-8b70-5399-4975dbfb192f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5581-8b70-f686-b310d408336a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5581-8b70-1e6b-f4fe0e6af7e3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5581-8b70-486f-f05bc5cf7ac3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5581-8b70-8df2-282235200d85	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5581-8b70-fe65-680f511d8df3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5581-8b70-28aa-7d1d76e617c7	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5581-8b70-1f0e-1781abc63a19	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5581-8b70-d7f6-6971bd715675	SO	SOM	706	Somalia 	Somalija	\N
00040000-5581-8b70-7266-5cdd90efb938	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5581-8b70-e22b-62af4c1edc71	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5581-8b70-32af-8c7e0f6441fa	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5581-8b70-f558-c304f4de1b4c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5581-8b70-dc59-a5c0d76fd81b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5581-8b70-06f4-d0c23c840716	SD	SDN	729	Sudan 	Sudan	\N
00040000-5581-8b70-6241-29ea785e7582	SR	SUR	740	Suriname 	Surinam	\N
00040000-5581-8b70-4c69-4b8c4cab72d6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5581-8b70-1007-5860de622043	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5581-8b70-ed5a-12c977b30921	SE	SWE	752	Sweden 	Švedska	\N
00040000-5581-8b70-f89f-caaba1f9aab3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5581-8b70-d394-d8201c21bf44	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5581-8b70-aa81-358177ff7dae	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5581-8b70-f630-9c80136b366a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5581-8b70-011f-dd0bf71ae206	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5581-8b70-3c65-9aa8cb17f876	TH	THA	764	Thailand 	Tajska	\N
00040000-5581-8b70-b276-7890ce0a6646	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5581-8b70-4edb-616d2cbb74c3	TG	TGO	768	Togo 	Togo	\N
00040000-5581-8b70-9f9c-952ad8fd0ee9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5581-8b70-25dd-0bfb97c6c528	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5581-8b70-2d8e-6c993878d709	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5581-8b70-f864-381d10312f14	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5581-8b70-0f8f-c630b3a14edd	TR	TUR	792	Turkey 	Turčija	\N
00040000-5581-8b70-6ca3-0c911401bbf3	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5581-8b70-d826-d76d492e6b37	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5581-8b70-ae32-3e34604dd913	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5581-8b70-61e5-f5241d88f97e	UG	UGA	800	Uganda 	Uganda	\N
00040000-5581-8b70-1066-cee0d616a143	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5581-8b70-c4f0-a978df3e69c1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5581-8b70-cbe6-bdb39e99255c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5581-8b70-655e-4d270815dd5d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5581-8b70-ecfa-8d68dec5ba4e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5581-8b70-c4d3-6c1063f9443e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5581-8b70-de75-b28928066f3c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5581-8b70-ed8c-acf6daf5a1df	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5581-8b70-ad92-718923c4320d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5581-8b70-0b74-98840ff60ea4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5581-8b70-7c64-27f77bdbd414	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5581-8b70-4603-87fcdcb72192	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5581-8b70-e067-4442ef563545	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5581-8b70-9dc1-f68dd3549850	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5581-8b70-5d5c-db4e65cab8c3	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5581-8b70-7aff-ab295c92f1b9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5581-8b70-47b8-b3da4be8bc1b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2879 (class 0 OID 7621375)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7621178)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5581-8b71-3a08-b801d9419ef2	000e0000-5581-8b71-a1b8-699f2245aea9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5581-8b70-925c-cbf8130cfc9b
000d0000-5581-8b71-02a0-175813605f4d	000e0000-5581-8b71-a1b8-699f2245aea9	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5581-8b70-925c-cbf8130cfc9b
000d0000-5581-8b71-c6fb-4d0a56d1cb96	000e0000-5581-8b71-a1b8-699f2245aea9	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5581-8b70-cc36-1b563adbd31a
000d0000-5581-8b71-473c-8d4d00b2623e	000e0000-5581-8b71-a1b8-699f2245aea9	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5581-8b70-2b8f-8f113f93c0a0
000d0000-5581-8b71-ed1f-ccb1abed5bb1	000e0000-5581-8b71-a1b8-699f2245aea9	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5581-8b70-2b8f-8f113f93c0a0
000d0000-5581-8b71-82f6-677116051957	000e0000-5581-8b71-a1b8-699f2245aea9	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5581-8b70-2b8f-8f113f93c0a0
000d0000-5581-8b71-f8b9-50973368e8f0	000e0000-5581-8b71-a1b8-699f2245aea9	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5581-8b70-925c-cbf8130cfc9b
\.


--
-- TOC entry 2843 (class 0 OID 7620998)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7621046)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7620978)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5581-8b71-8ad1-f08d9f0322e4	00080000-5581-8b71-2373-bb36287e2b92	00090000-5581-8b71-420f-027040db137a	AK		
\.


--
-- TOC entry 2821 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7621095)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7621120)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7620935)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5581-8b70-891f-f31d13ecc41f	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5581-8b70-65a2-3fddcbeaeccc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5581-8b70-df3c-5d35f79d6312	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5581-8b70-f90c-f5031c96c168	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5581-8b70-293e-d146eda40328	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5581-8b70-4d10-8901d5d95fae	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5581-8b70-9ddc-191bfbbf0027	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5581-8b70-8dcd-07f7be8707b2	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5581-8b70-0d4b-40125f8979f5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5581-8b70-2024-6dd87f840415	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5581-8b70-1c84-39d7a2306314	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5581-8b71-6ce4-f05fc3bfea9c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5581-8b71-02cf-1cafebfe78c5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5581-8b71-5e70-187bb7c93704	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5581-8b71-e8bb-8a59ff1ccf5f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5581-8b71-4d45-d7af00483475	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2832 (class 0 OID 7620848)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5581-8b71-e9af-e52c57eb5eb6	00000000-5581-8b71-6ce4-f05fc3bfea9c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5581-8b71-9541-7fec30e005d3	00000000-5581-8b71-6ce4-f05fc3bfea9c	00010000-5581-8b70-6033-0f5410e100d2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5581-8b71-1150-bae60a10ec5f	00000000-5581-8b71-02cf-1cafebfe78c5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2833 (class 0 OID 7620859)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5581-8b71-c4e4-24d0010d9d7a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5581-8b71-f036-d28e28bb687b	00010000-5581-8b71-65c3-8fcb0e0f494f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5581-8b71-6623-5b3ccaf5d014	00010000-5581-8b71-cb1d-6bcf2cf6aa99	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5581-8b71-84b6-c0cd88358c72	00010000-5581-8b71-9e78-337ce41e77c2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5581-8b71-a99e-f15cc774014e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5581-8b71-6862-a6a192f5df1d	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5581-8b71-cc45-e1dc625ffda3	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5581-8b71-ed84-c53e53aec4ac	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5581-8b71-420f-027040db137a	00010000-5581-8b71-3793-e379c719fb3b	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5581-8b71-3339-d77ec0d04c78	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5581-8b71-21de-9759861941dd	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5581-8b71-e77c-77abf53e0c61	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5581-8b71-8c6f-d4db9e0d6b67	00010000-5581-8b71-7ad5-612fdc1a037b	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2823 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 7620813)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5581-8b70-50ec-c91a09faa384	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5581-8b70-5bcd-18f75964c2ad	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5581-8b70-8cfd-de12d85405b9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5581-8b70-ce8f-8ea6f9d1ed1b	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5581-8b70-438e-4f21c5fc6bf2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5581-8b70-6a6f-32da0cc133d7	Abonma-read	Abonma - branje	f
00030000-5581-8b70-5409-0b92f885b01c	Abonma-write	Abonma - spreminjanje	f
00030000-5581-8b70-930e-4627d545ac33	Alternacija-read	Alternacija - branje	f
00030000-5581-8b70-a087-c8b9916c8b89	Alternacija-write	Alternacija - spreminjanje	f
00030000-5581-8b70-d6fe-b3551f706c84	Arhivalija-read	Arhivalija - branje	f
00030000-5581-8b70-3c58-034c885d198b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5581-8b70-8a73-8cbe0d073423	Besedilo-read	Besedilo - branje	f
00030000-5581-8b70-b212-ea406d0eb377	Besedilo-write	Besedilo - spreminjanje	f
00030000-5581-8b70-9c11-13d22cd809a1	DogodekIzven-read	DogodekIzven - branje	f
00030000-5581-8b70-58a0-b4caf1c088e0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5581-8b70-4db4-6fb426fb3231	Dogodek-read	Dogodek - branje	f
00030000-5581-8b70-c8f3-2f1d2c519e44	Dogodek-write	Dogodek - spreminjanje	f
00030000-5581-8b70-9dab-f4725015d10c	Drzava-read	Drzava - branje	f
00030000-5581-8b70-5786-e676d8903dd6	Drzava-write	Drzava - spreminjanje	f
00030000-5581-8b70-1a30-8aecb2748848	Funkcija-read	Funkcija - branje	f
00030000-5581-8b70-c191-73e08e8a080e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5581-8b70-c594-cb1f817047b4	Gostovanje-read	Gostovanje - branje	f
00030000-5581-8b70-ccf1-e6e3e11bf04e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5581-8b70-7931-973341cc4832	Gostujoca-read	Gostujoca - branje	f
00030000-5581-8b70-8111-e89222fde564	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5581-8b70-071e-d192a346d66d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5581-8b70-158c-c29153a7e996	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5581-8b70-aad7-d2e59af154a9	Kupec-read	Kupec - branje	f
00030000-5581-8b70-ad36-c9fbc528573e	Kupec-write	Kupec - spreminjanje	f
00030000-5581-8b70-34d3-7ce2d20c5531	NacinPlacina-read	NacinPlacina - branje	f
00030000-5581-8b70-f750-23f852cc2498	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5581-8b70-b277-8a87432cd9d0	Option-read	Option - branje	f
00030000-5581-8b70-e26f-6d22204c4f15	Option-write	Option - spreminjanje	f
00030000-5581-8b70-f26a-a9638d065663	OptionValue-read	OptionValue - branje	f
00030000-5581-8b70-34d2-2bc572473d31	OptionValue-write	OptionValue - spreminjanje	f
00030000-5581-8b70-e1ee-56974d9bcccf	Oseba-read	Oseba - branje	f
00030000-5581-8b70-b247-9e7caa19ab52	Oseba-write	Oseba - spreminjanje	f
00030000-5581-8b70-2da4-040b2f355d0d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5581-8b70-5a82-84fc9298703e	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5581-8b70-35ee-568133d7d41f	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5581-8b70-68dc-95a1916e8dda	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5581-8b70-ee25-586607b832ec	Pogodba-read	Pogodba - branje	f
00030000-5581-8b70-9fb3-db3a03ab367b	Pogodba-write	Pogodba - spreminjanje	f
00030000-5581-8b70-bcab-872c0dc123d6	Popa-read	Popa - branje	f
00030000-5581-8b70-f677-7dd94a1e9779	Popa-write	Popa - spreminjanje	f
00030000-5581-8b70-6a16-44536fad1f14	Posta-read	Posta - branje	f
00030000-5581-8b70-3b7a-ed07595dbc9b	Posta-write	Posta - spreminjanje	f
00030000-5581-8b70-377d-845c7f351521	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5581-8b70-b2ec-b6ab2f1938bd	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5581-8b70-501a-296cb4f7a025	PostniNaslov-read	PostniNaslov - branje	f
00030000-5581-8b70-46d1-585fc94c6e93	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5581-8b70-0709-dac4225b357d	Predstava-read	Predstava - branje	f
00030000-5581-8b70-ad20-6a49b6d51ed8	Predstava-write	Predstava - spreminjanje	f
00030000-5581-8b70-6d47-0c1ba72a1bf8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5581-8b70-7eef-62f3c91589cf	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5581-8b70-1080-38be514fa3e1	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5581-8b70-ccce-4721394e9d42	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5581-8b70-6f6a-51dd78294a7b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5581-8b70-9260-654157d97511	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5581-8b70-6457-9e521822a201	ProgramDela-read	ProgramDela - branje	f
00030000-5581-8b70-b0da-8a1af4337ca9	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5581-8b70-29a8-34a5f0ec9042	ProgramFestival-read	ProgramFestival - branje	f
00030000-5581-8b70-1f1e-82cdb7b23253	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5581-8b70-3843-e9d6ec3ac8fa	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5581-8b70-bee0-580484ebc0db	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5581-8b70-5032-99807d3abfcb	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5581-8b70-eb61-e2eaec1befcd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5581-8b70-d93c-f5dfd6cdee08	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5581-8b70-b710-0aaeaf5b9265	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5581-8b70-882a-192fa7a623b6	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5581-8b70-f7be-6a4f22dbdc7b	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5581-8b70-135e-47b91d19cdf7	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5581-8b70-c2c2-a2c2c1b22b4b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5581-8b70-708a-3a27570f2bf0	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5581-8b70-e730-b3f8f6258496	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5581-8b70-6023-6a2e199ab9ff	ProgramRazno-read	ProgramRazno - branje	f
00030000-5581-8b70-0021-b9f531d487ba	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5581-8b70-25d5-2de81072ded4	Prostor-read	Prostor - branje	f
00030000-5581-8b70-6363-c89e820a7c2c	Prostor-write	Prostor - spreminjanje	f
00030000-5581-8b70-0102-fa8bf2dc4698	Racun-read	Racun - branje	f
00030000-5581-8b70-6b48-b3e48bc82e51	Racun-write	Racun - spreminjanje	f
00030000-5581-8b70-dfd8-12153ce84824	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5581-8b70-4518-bf3e9653d599	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5581-8b70-603e-7ec4afc727dd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5581-8b70-70fe-cf4811ed93ff	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5581-8b70-9689-8e9f8e7e57a4	Rekvizit-read	Rekvizit - branje	f
00030000-5581-8b70-eae0-57a3c1b877cc	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5581-8b70-bc41-93a9b32913a5	Revizija-read	Revizija - branje	f
00030000-5581-8b70-b6be-a982553a8517	Revizija-write	Revizija - spreminjanje	f
00030000-5581-8b70-9cb9-5851fc785704	Rezervacija-read	Rezervacija - branje	f
00030000-5581-8b70-7287-31d558139215	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5581-8b70-e8c4-4e56bd5cb3f4	SedezniRed-read	SedezniRed - branje	f
00030000-5581-8b70-d9c8-2453c9328a3e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5581-8b70-f28c-685dca5c14cd	Sedez-read	Sedez - branje	f
00030000-5581-8b70-1716-29a85fca50d5	Sedez-write	Sedez - spreminjanje	f
00030000-5581-8b70-f1c0-198468ea2ce8	Sezona-read	Sezona - branje	f
00030000-5581-8b70-9147-c9fa6ba31aea	Sezona-write	Sezona - spreminjanje	f
00030000-5581-8b70-a44e-0474bea1300e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5581-8b70-0a63-1a44cb7541f1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5581-8b70-ff4c-2358e44dae88	Stevilcenje-read	Stevilcenje - branje	f
00030000-5581-8b70-4c6c-cdf550654e8a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5581-8b70-cb66-6b1fb82c98c6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5581-8b70-48c5-6a8eee610426	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5581-8b70-b562-f432cbd09d26	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5581-8b70-2e36-fb0b4e6658a8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5581-8b70-1a9e-acab80329bcc	Telefonska-read	Telefonska - branje	f
00030000-5581-8b70-93e7-25274c932b5d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5581-8b70-7b29-67d985f4ef4f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5581-8b70-46f6-83528116ebbb	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5581-8b70-4e2b-60a03fdaaa40	TipFunkcije-read	TipFunkcije - branje	f
00030000-5581-8b70-361a-e8b366a79385	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5581-8b70-b4c8-c34f0b11dbc9	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5581-8b70-e632-eb314478bf14	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5581-8b70-294f-d3e12fd95c33	Trr-read	Trr - branje	f
00030000-5581-8b70-0a36-2bdedf8b93c8	Trr-write	Trr - spreminjanje	f
00030000-5581-8b70-5282-8b261e1044b8	Uprizoritev-read	Uprizoritev - branje	f
00030000-5581-8b70-b2aa-d5bc45cf4468	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5581-8b70-6811-470b02ad8e00	Vaja-read	Vaja - branje	f
00030000-5581-8b70-1261-70a87d91f04a	Vaja-write	Vaja - spreminjanje	f
00030000-5581-8b70-f6c4-096561ad87a4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5581-8b70-f807-a98f7b7d3598	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5581-8b70-677b-04d8b8839a8f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5581-8b70-750d-279f73060fcb	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5581-8b70-9856-ce16ed836657	Zasedenost-read	Zasedenost - branje	f
00030000-5581-8b70-e60a-8e42b0f164ac	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5581-8b70-657d-00b0c33cb3df	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5581-8b70-fddc-2e13864add61	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5581-8b70-1851-e983ad114557	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5581-8b70-4304-3ddd48e80b29	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2830 (class 0 OID 7620832)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5581-8b70-8036-366875176b12	00030000-5581-8b70-5bcd-18f75964c2ad
00020000-5581-8b70-df67-bbd3224a8f32	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-6a6f-32da0cc133d7
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-5409-0b92f885b01c
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-930e-4627d545ac33
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-a087-c8b9916c8b89
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-d6fe-b3551f706c84
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-4db4-6fb426fb3231
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-ce8f-8ea6f9d1ed1b
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-c8f3-2f1d2c519e44
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-5786-e676d8903dd6
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-1a30-8aecb2748848
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-c191-73e08e8a080e
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-c594-cb1f817047b4
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-ccf1-e6e3e11bf04e
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-7931-973341cc4832
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-8111-e89222fde564
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-071e-d192a346d66d
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-158c-c29153a7e996
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-b277-8a87432cd9d0
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-f26a-a9638d065663
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-e1ee-56974d9bcccf
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-b247-9e7caa19ab52
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-bcab-872c0dc123d6
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-f677-7dd94a1e9779
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-6a16-44536fad1f14
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-3b7a-ed07595dbc9b
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-501a-296cb4f7a025
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-46d1-585fc94c6e93
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-0709-dac4225b357d
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-ad20-6a49b6d51ed8
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-6f6a-51dd78294a7b
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-9260-654157d97511
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-25d5-2de81072ded4
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-6363-c89e820a7c2c
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-603e-7ec4afc727dd
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-70fe-cf4811ed93ff
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-9689-8e9f8e7e57a4
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-eae0-57a3c1b877cc
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-f1c0-198468ea2ce8
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-9147-c9fa6ba31aea
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-4e2b-60a03fdaaa40
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-5282-8b261e1044b8
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-b2aa-d5bc45cf4468
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-6811-470b02ad8e00
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-1261-70a87d91f04a
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-9856-ce16ed836657
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-e60a-8e42b0f164ac
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-657d-00b0c33cb3df
00020000-5581-8b70-f9ea-253ffcc76536	00030000-5581-8b70-1851-e983ad114557
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-6a6f-32da0cc133d7
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-d6fe-b3551f706c84
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-4db4-6fb426fb3231
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-c594-cb1f817047b4
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-7931-973341cc4832
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-071e-d192a346d66d
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-158c-c29153a7e996
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-b277-8a87432cd9d0
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-f26a-a9638d065663
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-e1ee-56974d9bcccf
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-b247-9e7caa19ab52
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-bcab-872c0dc123d6
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-6a16-44536fad1f14
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-501a-296cb4f7a025
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-46d1-585fc94c6e93
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-0709-dac4225b357d
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-25d5-2de81072ded4
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-603e-7ec4afc727dd
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-9689-8e9f8e7e57a4
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-f1c0-198468ea2ce8
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-1a9e-acab80329bcc
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-93e7-25274c932b5d
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-294f-d3e12fd95c33
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-0a36-2bdedf8b93c8
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-677b-04d8b8839a8f
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-750d-279f73060fcb
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-657d-00b0c33cb3df
00020000-5581-8b70-a45d-f25d61eb5f1d	00030000-5581-8b70-1851-e983ad114557
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-6a6f-32da0cc133d7
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-930e-4627d545ac33
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-d6fe-b3551f706c84
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-3c58-034c885d198b
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-8a73-8cbe0d073423
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-9c11-13d22cd809a1
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-4db4-6fb426fb3231
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-1a30-8aecb2748848
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-c594-cb1f817047b4
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-7931-973341cc4832
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-071e-d192a346d66d
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-b277-8a87432cd9d0
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-f26a-a9638d065663
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-e1ee-56974d9bcccf
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-bcab-872c0dc123d6
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-6a16-44536fad1f14
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-0709-dac4225b357d
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-6f6a-51dd78294a7b
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-25d5-2de81072ded4
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-603e-7ec4afc727dd
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-9689-8e9f8e7e57a4
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-f1c0-198468ea2ce8
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-4e2b-60a03fdaaa40
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-6811-470b02ad8e00
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-9856-ce16ed836657
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-657d-00b0c33cb3df
00020000-5581-8b70-4361-ff914234884f	00030000-5581-8b70-1851-e983ad114557
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-6a6f-32da0cc133d7
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-5409-0b92f885b01c
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-a087-c8b9916c8b89
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-d6fe-b3551f706c84
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-4db4-6fb426fb3231
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-c594-cb1f817047b4
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-7931-973341cc4832
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-b277-8a87432cd9d0
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-f26a-a9638d065663
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-bcab-872c0dc123d6
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-6a16-44536fad1f14
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-0709-dac4225b357d
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-25d5-2de81072ded4
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-603e-7ec4afc727dd
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-9689-8e9f8e7e57a4
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-f1c0-198468ea2ce8
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-4e2b-60a03fdaaa40
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-657d-00b0c33cb3df
00020000-5581-8b70-561e-70b3179d0eee	00030000-5581-8b70-1851-e983ad114557
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-6a6f-32da0cc133d7
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-d6fe-b3551f706c84
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-4db4-6fb426fb3231
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-9dab-f4725015d10c
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-c594-cb1f817047b4
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-7931-973341cc4832
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-b277-8a87432cd9d0
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-f26a-a9638d065663
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-bcab-872c0dc123d6
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-6a16-44536fad1f14
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-0709-dac4225b357d
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-25d5-2de81072ded4
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-603e-7ec4afc727dd
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-9689-8e9f8e7e57a4
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-f1c0-198468ea2ce8
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-7b29-67d985f4ef4f
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-8cfd-de12d85405b9
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-4e2b-60a03fdaaa40
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-657d-00b0c33cb3df
00020000-5581-8b70-4432-bb294a4d2efc	00030000-5581-8b70-1851-e983ad114557
\.


--
-- TOC entry 2858 (class 0 OID 7621127)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7621158)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7621294)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 7620892)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5581-8b71-2373-bb36287e2b92	00040000-5581-8b70-1bbb-829c490b5b9a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-8b71-8a8b-c05e2ab626c6	00040000-5581-8b70-1bbb-829c490b5b9a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-8b71-7d93-220ae7614ca7	00040000-5581-8b70-1bbb-829c490b5b9a	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5581-8b71-6778-dec3e9e3423b	00040000-5581-8b70-1bbb-829c490b5b9a	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2837 (class 0 OID 7620927)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5581-8b6f-cd3a-e458e66548f6	8341	Adlešiči
00050000-5581-8b6f-0e22-69b37e42b670	5270	Ajdovščina
00050000-5581-8b6f-6c1e-343eacafc0b6	6280	Ankaran/Ancarano
00050000-5581-8b6f-a1aa-3acc1128549e	9253	Apače
00050000-5581-8b6f-5003-1f0932afbcaf	8253	Artiče
00050000-5581-8b6f-b1da-29d2ac894de1	4275	Begunje na Gorenjskem
00050000-5581-8b6f-f7e4-12bfd23a7820	1382	Begunje pri Cerknici
00050000-5581-8b6f-aeb1-4c23f104ce85	9231	Beltinci
00050000-5581-8b6f-2eca-79fe35dd1456	2234	Benedikt
00050000-5581-8b6f-a105-90ee9f421af1	2345	Bistrica ob Dravi
00050000-5581-8b6f-b8a1-ce1e6ff3b1cc	3256	Bistrica ob Sotli
00050000-5581-8b6f-9eb9-3a7cb36a297f	8259	Bizeljsko
00050000-5581-8b6f-ba21-055c6db73149	1223	Blagovica
00050000-5581-8b6f-dd71-a18e16c9a692	8283	Blanca
00050000-5581-8b6f-b0e0-ac2cfeec9450	4260	Bled
00050000-5581-8b6f-7548-3d26d7ae4f06	4273	Blejska Dobrava
00050000-5581-8b6f-8cdc-95b1f5a4cbe1	9265	Bodonci
00050000-5581-8b6f-e7a7-1c5b5debacf1	9222	Bogojina
00050000-5581-8b6f-46f9-e7e3522eb873	4263	Bohinjska Bela
00050000-5581-8b6f-b9f1-e193279f30b6	4264	Bohinjska Bistrica
00050000-5581-8b6f-c120-8c98142c74e4	4265	Bohinjsko jezero
00050000-5581-8b6f-d919-4b31ab009668	1353	Borovnica
00050000-5581-8b6f-fb87-50f4799ac599	8294	Boštanj
00050000-5581-8b6f-eedb-3c793ddaa58e	5230	Bovec
00050000-5581-8b6f-b08f-c0df806b46fa	5295	Branik
00050000-5581-8b6f-f677-749e12e6b36d	3314	Braslovče
00050000-5581-8b6f-07fd-3da96f690e04	5223	Breginj
00050000-5581-8b6f-823d-b94f72e1b6e5	8280	Brestanica
00050000-5581-8b6f-86c1-d4b513d73a15	2354	Bresternica
00050000-5581-8b6f-788a-8d6e7a5fb572	4243	Brezje
00050000-5581-8b6f-bdf6-916eea53b989	1351	Brezovica pri Ljubljani
00050000-5581-8b6f-9390-50f107d803e9	8250	Brežice
00050000-5581-8b6f-b037-893ad288503a	4210	Brnik - Aerodrom
00050000-5581-8b6f-8922-61c7535990eb	8321	Brusnice
00050000-5581-8b6f-ce1e-35a1eb649a2a	3255	Buče
00050000-5581-8b6f-ef14-eec1f6b16565	8276	Bučka 
00050000-5581-8b6f-938a-6e232513c68e	9261	Cankova
00050000-5581-8b6f-2b68-cb161fe65490	3000	Celje 
00050000-5581-8b6f-5d2e-f068bb20f8bb	3001	Celje - poštni predali
00050000-5581-8b6f-21de-7c2c6b65f610	4207	Cerklje na Gorenjskem
00050000-5581-8b6f-bd5a-8c5de67bc779	8263	Cerklje ob Krki
00050000-5581-8b6f-bd4b-723978e55b99	1380	Cerknica
00050000-5581-8b6f-23b9-58f26968f2d9	5282	Cerkno
00050000-5581-8b6f-27be-4ba106fdf9aa	2236	Cerkvenjak
00050000-5581-8b6f-a4f9-1121b43f3d50	2215	Ceršak
00050000-5581-8b6f-3fa2-a00567a271fd	2326	Cirkovce
00050000-5581-8b6f-d1ca-6aed19716b74	2282	Cirkulane
00050000-5581-8b6f-c1ed-b0b59f67a653	5273	Col
00050000-5581-8b6f-b8c9-0ae64cc89bdd	8251	Čatež ob Savi
00050000-5581-8b6f-101b-b910c52d0a94	1413	Čemšenik
00050000-5581-8b6f-4eb1-40f12ae0cb51	5253	Čepovan
00050000-5581-8b6f-ae2c-d05f10dec409	9232	Črenšovci
00050000-5581-8b6f-9c77-4c3828c940a0	2393	Črna na Koroškem
00050000-5581-8b6f-a922-f46fdd97c64e	6275	Črni Kal
00050000-5581-8b6f-8328-a3252d791723	5274	Črni Vrh nad Idrijo
00050000-5581-8b6f-4a5d-81f034b80cf9	5262	Črniče
00050000-5581-8b6f-45c4-e473c1680cb4	8340	Črnomelj
00050000-5581-8b6f-9bec-e11d97897c4e	6271	Dekani
00050000-5581-8b6f-3258-a2501642ef6e	5210	Deskle
00050000-5581-8b6f-9160-c04de0ab3886	2253	Destrnik
00050000-5581-8b6f-067a-8430dc6ceb61	6215	Divača
00050000-5581-8b6f-ddcb-189267e76f9e	1233	Dob
00050000-5581-8b6f-000b-32977b7b26f5	3224	Dobje pri Planini
00050000-5581-8b6f-eef1-51bdd5108d70	8257	Dobova
00050000-5581-8b6f-850e-3c02a910c653	1423	Dobovec
00050000-5581-8b6f-aa0e-808b3c4a6c48	5263	Dobravlje
00050000-5581-8b6f-8c19-f0cff6913962	3204	Dobrna
00050000-5581-8b6f-01a0-357ee9a950ad	8211	Dobrnič
00050000-5581-8b6f-fa4b-d0eca6e3d8d0	1356	Dobrova
00050000-5581-8b6f-95e8-714d120615c5	9223	Dobrovnik/Dobronak 
00050000-5581-8b6f-9f05-b83508c0f3cf	5212	Dobrovo v Brdih
00050000-5581-8b6f-0c3b-7af3bde29a84	1431	Dol pri Hrastniku
00050000-5581-8b6f-7ff9-ec44e7a56de2	1262	Dol pri Ljubljani
00050000-5581-8b6f-7e66-6215baa52499	1273	Dole pri Litiji
00050000-5581-8b6f-3efc-847c35293e92	1331	Dolenja vas
00050000-5581-8b6f-f2ed-a103729ec784	8350	Dolenjske Toplice
00050000-5581-8b6f-f830-80b2996c3760	1230	Domžale
00050000-5581-8b6f-1934-385b88d5d263	2252	Dornava
00050000-5581-8b6f-6f31-d8deac94451a	5294	Dornberk
00050000-5581-8b6f-41be-e963ca9d2ca2	1319	Draga
00050000-5581-8b6f-e4c5-81ad8d7c46b8	8343	Dragatuš
00050000-5581-8b6f-f593-3c5df851cb4e	3222	Dramlje
00050000-5581-8b6f-13f5-28a0b9650182	2370	Dravograd
00050000-5581-8b6f-3eab-4daa48d51588	4203	Duplje
00050000-5581-8b6f-a29e-864ea1629911	6221	Dutovlje
00050000-5581-8b6f-bd54-a421e8191a62	8361	Dvor
00050000-5581-8b6f-750b-46e5f3fc7ffb	2343	Fala
00050000-5581-8b6f-21e2-e1d0a7860d77	9208	Fokovci
00050000-5581-8b6f-84a3-767a912f3c35	2313	Fram
00050000-5581-8b6f-2bea-7ea38ca05163	3213	Frankolovo
00050000-5581-8b6f-ed1a-768958673063	1274	Gabrovka
00050000-5581-8b6f-3218-a6b822daca39	8254	Globoko
00050000-5581-8b6f-08a1-cd5d2277ff83	5275	Godovič
00050000-5581-8b6f-ce07-091fac09a806	4204	Golnik
00050000-5581-8b6f-7bcd-d000fabbb58f	3303	Gomilsko
00050000-5581-8b6f-9c18-9f6a37d5d5c8	4224	Gorenja vas
00050000-5581-8b6f-6d5a-cc14f8cf4a50	3263	Gorica pri Slivnici
00050000-5581-8b6f-ad06-673245120031	2272	Gorišnica
00050000-5581-8b6f-c90a-f75a690185fb	9250	Gornja Radgona
00050000-5581-8b6f-7c0c-d267bbe0d053	3342	Gornji Grad
00050000-5581-8b6f-a18d-338fae3c03b9	4282	Gozd Martuljek
00050000-5581-8b6f-ab34-66cb142d821b	6272	Gračišče
00050000-5581-8b6f-b274-d1e868c9cfd0	9264	Grad
00050000-5581-8b6f-df0a-eb528f6eb031	8332	Gradac
00050000-5581-8b6f-9e19-97e8a5140c5a	1384	Grahovo
00050000-5581-8b6f-8a33-820026605ba1	5242	Grahovo ob Bači
00050000-5581-8b6f-2edb-7dada1285f9a	5251	Grgar
00050000-5581-8b6f-e870-5e6a34a4c426	3302	Griže
00050000-5581-8b6f-21a9-49501b66554b	3231	Grobelno
00050000-5581-8b6f-2dec-4813fc20d6e4	1290	Grosuplje
00050000-5581-8b6f-e5b0-11bdd849af88	2288	Hajdina
00050000-5581-8b6f-47b6-1184f0588541	8362	Hinje
00050000-5581-8b6f-a2ad-c727385eda80	2311	Hoče
00050000-5581-8b6f-93dd-8616d9a30598	9205	Hodoš/Hodos
00050000-5581-8b6f-27a9-f5034abd8af2	1354	Horjul
00050000-5581-8b6f-0b06-1cdef362a740	1372	Hotedršica
00050000-5581-8b6f-b7d4-e23e3210d016	1430	Hrastnik
00050000-5581-8b6f-4ac9-024570cec0d6	6225	Hruševje
00050000-5581-8b6f-649e-390ea7d018f0	4276	Hrušica
00050000-5581-8b6f-7d03-1f73100b1dfd	5280	Idrija
00050000-5581-8b6f-223b-01d3d4162c1f	1292	Ig
00050000-5581-8b6f-5687-6677738cb5ce	6250	Ilirska Bistrica
00050000-5581-8b6f-a023-072335f0601b	6251	Ilirska Bistrica-Trnovo
00050000-5581-8b6f-3ee0-de36596b3536	1295	Ivančna Gorica
00050000-5581-8b6f-b850-afb72b4fff84	2259	Ivanjkovci
00050000-5581-8b6f-7939-a282e560084c	1411	Izlake
00050000-5581-8b6f-370b-0ce31f3817a2	6310	Izola/Isola
00050000-5581-8b6f-849b-65fcbd962467	2222	Jakobski Dol
00050000-5581-8b6f-3956-3b9c7f42c908	2221	Jarenina
00050000-5581-8b6f-c2e6-b3a182b2f021	6254	Jelšane
00050000-5581-8b6f-fc1c-ecffb5945ebb	4270	Jesenice
00050000-5581-8b6f-e1ce-c091597b8205	8261	Jesenice na Dolenjskem
00050000-5581-8b6f-852f-706de733fc13	3273	Jurklošter
00050000-5581-8b6f-3b28-792c6e057d96	2223	Jurovski Dol
00050000-5581-8b6f-1542-152943f63111	2256	Juršinci
00050000-5581-8b6f-2b1b-5a6903112704	5214	Kal nad Kanalom
00050000-5581-8b6f-5426-7f2e0e4804e4	3233	Kalobje
00050000-5581-8b6f-c302-64e566d35ad7	4246	Kamna Gorica
00050000-5581-8b6f-5b67-80c0a933d15f	2351	Kamnica
00050000-5581-8b6f-20b0-e4b75c1b22af	1241	Kamnik
00050000-5581-8b6f-3c60-e32a385ccd0b	5213	Kanal
00050000-5581-8b6f-6367-640fd3331161	8258	Kapele
00050000-5581-8b6f-46ca-b146954eef70	2362	Kapla
00050000-5581-8b6f-8943-6b5a0ff2bcdc	2325	Kidričevo
00050000-5581-8b6f-cda2-aae56d2f1702	1412	Kisovec
00050000-5581-8b6f-58ad-961bbb7a3ff9	6253	Knežak
00050000-5581-8b6f-61a4-4d460885627e	5222	Kobarid
00050000-5581-8b6f-da74-325519aa4d8a	9227	Kobilje
00050000-5581-8b6f-e307-e54c403b055d	1330	Kočevje
00050000-5581-8b6f-d49a-71781da43e19	1338	Kočevska Reka
00050000-5581-8b6f-686d-bae0729ab01e	2276	Kog
00050000-5581-8b6f-8943-4967a3c4a6e8	5211	Kojsko
00050000-5581-8b6f-ddf2-6c348dc245c5	6223	Komen
00050000-5581-8b6f-1661-a708f51220f4	1218	Komenda
00050000-5581-8b6f-34ad-799f0fb5e4c3	6000	Koper/Capodistria 
00050000-5581-8b6f-eae8-130e99c94598	6001	Koper/Capodistria - poštni predali
00050000-5581-8b6f-9927-618dca41b80b	8282	Koprivnica
00050000-5581-8b6f-1a30-fd748d822f00	5296	Kostanjevica na Krasu
00050000-5581-8b6f-0a49-d845d0d3ee43	8311	Kostanjevica na Krki
00050000-5581-8b6f-bf6d-5d09deb558e9	1336	Kostel
00050000-5581-8b6f-3b98-45b1ba7d6a10	6256	Košana
00050000-5581-8b6f-3a4d-f3301065a885	2394	Kotlje
00050000-5581-8b6f-4e17-61071959f892	6240	Kozina
00050000-5581-8b6f-b296-b51adcb29ab5	3260	Kozje
00050000-5581-8b6f-dca1-2d144dc5c0fb	4000	Kranj 
00050000-5581-8b6f-83fc-d14035f3b4c8	4001	Kranj - poštni predali
00050000-5581-8b6f-3e0a-1cce27d04b88	4280	Kranjska Gora
00050000-5581-8b6f-ad72-6f70e920dcc3	1281	Kresnice
00050000-5581-8b6f-a3cb-486ffd9393b3	4294	Križe
00050000-5581-8b6f-e9fe-786fd79fcb9e	9206	Križevci
00050000-5581-8b6f-9a6b-e31b0d891e6e	9242	Križevci pri Ljutomeru
00050000-5581-8b6f-ff3a-70712a22a14d	1301	Krka
00050000-5581-8b6f-b511-d8532ef1290f	8296	Krmelj
00050000-5581-8b6f-ce8a-8bf4f5ce645a	4245	Kropa
00050000-5581-8b6f-b433-0f4ec95ba7e3	8262	Krška vas
00050000-5581-8b6f-7054-ea94da3f000a	8270	Krško
00050000-5581-8b6f-5b57-75c083dbaeeb	9263	Kuzma
00050000-5581-8b6f-00ba-bc2861087fa1	2318	Laporje
00050000-5581-8b6f-31a8-16fe79bf9469	3270	Laško
00050000-5581-8b6f-e5b4-16016afbb6b3	1219	Laze v Tuhinju
00050000-5581-8b6f-13cd-ceb6e2138e53	2230	Lenart v Slovenskih goricah
00050000-5581-8b6f-b6ae-ec7e0d3d7b03	9220	Lendava/Lendva
00050000-5581-8b6f-127a-50c1b081c15d	4248	Lesce
00050000-5581-8b70-7535-035dbe663570	3261	Lesično
00050000-5581-8b70-e8f9-3149ff362191	8273	Leskovec pri Krškem
00050000-5581-8b70-294f-d83888387100	2372	Libeliče
00050000-5581-8b70-d552-157ed8621958	2341	Limbuš
00050000-5581-8b70-6861-3ebbb7fc72b5	1270	Litija
00050000-5581-8b70-006c-9d445bbe6409	3202	Ljubečna
00050000-5581-8b70-3205-8cb3686618a9	1000	Ljubljana 
00050000-5581-8b70-ecb0-2f57edbbb7f8	1001	Ljubljana - poštni predali
00050000-5581-8b70-432a-c37b2960cb29	1231	Ljubljana - Črnuče
00050000-5581-8b70-139e-f55ec6438722	1261	Ljubljana - Dobrunje
00050000-5581-8b70-b0b7-fdaa1ae1dda8	1260	Ljubljana - Polje
00050000-5581-8b70-73d9-cc52f9d092eb	1210	Ljubljana - Šentvid
00050000-5581-8b70-1bcf-bdab0bac731a	1211	Ljubljana - Šmartno
00050000-5581-8b70-f2ba-63b753ce5d10	3333	Ljubno ob Savinji
00050000-5581-8b70-d734-b6613fd5b1ae	9240	Ljutomer
00050000-5581-8b70-8c85-e4695f3771b1	3215	Loče
00050000-5581-8b70-e8cc-15ce8972cb81	5231	Log pod Mangartom
00050000-5581-8b70-d023-86b31f9cc03e	1358	Log pri Brezovici
00050000-5581-8b70-fd2f-52b639be2bea	1370	Logatec
00050000-5581-8b70-79d7-e21875c0b55a	1371	Logatec
00050000-5581-8b70-32bb-7b7697d7af01	1434	Loka pri Zidanem Mostu
00050000-5581-8b70-34ed-4cb33d40f60e	3223	Loka pri Žusmu
00050000-5581-8b70-e73f-ed98505555f0	6219	Lokev
00050000-5581-8b70-0cf7-6604b621ec27	1318	Loški Potok
00050000-5581-8b70-0e3f-6678a9049637	2324	Lovrenc na Dravskem polju
00050000-5581-8b70-5783-1d01fb2cddd4	2344	Lovrenc na Pohorju
00050000-5581-8b70-f5ae-86795ccdb9d9	3334	Luče
00050000-5581-8b70-d8d7-de8c415a88cd	1225	Lukovica
00050000-5581-8b70-1b77-b816415abc37	9202	Mačkovci
00050000-5581-8b70-f2a2-3ccadd4af2ed	2322	Majšperk
00050000-5581-8b70-ffdb-3dc9dc652155	2321	Makole
00050000-5581-8b70-9080-dafa716539cc	9243	Mala Nedelja
00050000-5581-8b70-805b-c6fb88a0b865	2229	Malečnik
00050000-5581-8b70-ca80-ccd00140a6c0	6273	Marezige
00050000-5581-8b70-8e1e-17df7f4099b0	2000	Maribor 
00050000-5581-8b70-acd9-bf0b41b94acf	2001	Maribor - poštni predali
00050000-5581-8b70-f8d1-2c185928b4ca	2206	Marjeta na Dravskem polju
00050000-5581-8b70-4ffe-1f1e45e1b02d	2281	Markovci
00050000-5581-8b70-be35-f2b79e31251e	9221	Martjanci
00050000-5581-8b70-b44d-026e3b1ea19f	6242	Materija
00050000-5581-8b70-2b61-c8ea1bdb4ff6	4211	Mavčiče
00050000-5581-8b70-f9ed-bfc13c334deb	1215	Medvode
00050000-5581-8b70-9dd8-240470771f69	1234	Mengeš
00050000-5581-8b70-f367-66c997cdd4ff	8330	Metlika
00050000-5581-8b70-0308-b4c1233a2107	2392	Mežica
00050000-5581-8b70-9b4a-5b8e8d60590b	2204	Miklavž na Dravskem polju
00050000-5581-8b70-5207-fb143939868a	2275	Miklavž pri Ormožu
00050000-5581-8b70-6099-3a3609ea548c	5291	Miren
00050000-5581-8b70-340a-2da1357a234a	8233	Mirna
00050000-5581-8b70-57f8-cb69eb3e5c97	8216	Mirna Peč
00050000-5581-8b70-568a-0903c3894a10	2382	Mislinja
00050000-5581-8b70-52ea-610b645b9a6a	4281	Mojstrana
00050000-5581-8b70-126b-a9bd5f52de7e	8230	Mokronog
00050000-5581-8b70-169e-7eca9e971965	1251	Moravče
00050000-5581-8b70-4820-280be8a99f0b	9226	Moravske Toplice
00050000-5581-8b70-e1c6-f1d439a234fc	5216	Most na Soči
00050000-5581-8b70-54e6-260914c99502	1221	Motnik
00050000-5581-8b70-f48c-5efe2f904aea	3330	Mozirje
00050000-5581-8b70-a124-a98914b37c35	9000	Murska Sobota 
00050000-5581-8b70-dca2-99f1ab00b4f4	9001	Murska Sobota - poštni predali
00050000-5581-8b70-4f78-1f86be9532e5	2366	Muta
00050000-5581-8b70-d860-377bb00b461a	4202	Naklo
00050000-5581-8b70-63b1-815facae35a8	3331	Nazarje
00050000-5581-8b70-9c21-eac3575008bb	1357	Notranje Gorice
00050000-5581-8b70-9b09-e5a3509f492e	3203	Nova Cerkev
00050000-5581-8b70-ba0b-d6eb67711d44	5000	Nova Gorica 
00050000-5581-8b70-d64b-bf03c383082d	5001	Nova Gorica - poštni predali
00050000-5581-8b70-b9db-dc3bcba049e5	1385	Nova vas
00050000-5581-8b70-72fb-bdf3b1bed07e	8000	Novo mesto
00050000-5581-8b70-6402-2ea0ce44c9ce	8001	Novo mesto - poštni predali
00050000-5581-8b70-a590-e3eea92e2e02	6243	Obrov
00050000-5581-8b70-4142-870a20b90e15	9233	Odranci
00050000-5581-8b70-6178-36a437b8a090	2317	Oplotnica
00050000-5581-8b70-1480-1e1ad29e72ea	2312	Orehova vas
00050000-5581-8b70-4c52-eaca2a937da3	2270	Ormož
00050000-5581-8b70-a2d2-3c401fa50a2c	1316	Ortnek
00050000-5581-8b70-1ace-944ba9efd004	1337	Osilnica
00050000-5581-8b70-627c-aba4cfa1e2d4	8222	Otočec
00050000-5581-8b70-0e0f-d647e9340259	2361	Ožbalt
00050000-5581-8b70-6cb5-200d068b331e	2231	Pernica
00050000-5581-8b70-1174-bbfe9ee3557d	2211	Pesnica pri Mariboru
00050000-5581-8b70-8ae5-e9cd33f688e8	9203	Petrovci
00050000-5581-8b70-2f68-a58c91335a44	3301	Petrovče
00050000-5581-8b70-86cf-81b027d3b119	6330	Piran/Pirano
00050000-5581-8b70-21ba-3debf9981f8d	8255	Pišece
00050000-5581-8b70-d85b-a3aca6727fd8	6257	Pivka
00050000-5581-8b70-536b-20e18801b0f8	6232	Planina
00050000-5581-8b70-5e63-f09a3bb8e9ec	3225	Planina pri Sevnici
00050000-5581-8b70-ba20-f61447c01865	6276	Pobegi
00050000-5581-8b70-5259-112a5fa32f10	8312	Podbočje
00050000-5581-8b70-81c0-bc3b26f59f4a	5243	Podbrdo
00050000-5581-8b70-9179-3e783f5048ec	3254	Podčetrtek
00050000-5581-8b70-f24b-4e06f30d5f2b	2273	Podgorci
00050000-5581-8b70-65ad-11b34ff90ef9	6216	Podgorje
00050000-5581-8b70-c838-904526fdb13a	2381	Podgorje pri Slovenj Gradcu
00050000-5581-8b70-9fe8-c37477a7f771	6244	Podgrad
00050000-5581-8b70-5698-fdcc540b44c8	1414	Podkum
00050000-5581-8b70-1fe1-d7984a738009	2286	Podlehnik
00050000-5581-8b70-de01-f0955e06bab0	5272	Podnanos
00050000-5581-8b70-9a17-71a58bfd0c9c	4244	Podnart
00050000-5581-8b70-5e9a-ee9a642c70c0	3241	Podplat
00050000-5581-8b70-d8f2-ba8efcc5f827	3257	Podsreda
00050000-5581-8b70-a9b3-fa58b8ae1efa	2363	Podvelka
00050000-5581-8b70-71bb-70f3c1545819	2208	Pohorje
00050000-5581-8b70-4427-171159081edd	2257	Polenšak
00050000-5581-8b70-d384-22978e56be94	1355	Polhov Gradec
00050000-5581-8b70-2aa2-5b46adda52fe	4223	Poljane nad Škofjo Loko
00050000-5581-8b70-2cd4-7aab2a30ce77	2319	Poljčane
00050000-5581-8b70-cb03-0f9f2f0ba87c	1272	Polšnik
00050000-5581-8b70-5bfb-6e9bdf818c58	3313	Polzela
00050000-5581-8b70-6a4d-c9273ce284a7	3232	Ponikva
00050000-5581-8b70-9e71-b2209649217a	6320	Portorož/Portorose
00050000-5581-8b70-12ef-e059de132e4e	6230	Postojna
00050000-5581-8b70-68bd-37b7fe34ab70	2331	Pragersko
00050000-5581-8b70-fc04-35315f28b012	3312	Prebold
00050000-5581-8b70-ebe8-65d6b46c85e5	4205	Preddvor
00050000-5581-8b70-31eb-573a02dd1045	6255	Prem
00050000-5581-8b70-4478-bb7d6d8db2e0	1352	Preserje
00050000-5581-8b70-e99b-8774a5ba4303	6258	Prestranek
00050000-5581-8b70-2f0a-faf385faed86	2391	Prevalje
00050000-5581-8b70-16f4-bb225de0d9c6	3262	Prevorje
00050000-5581-8b70-deb5-57a95b517119	1276	Primskovo 
00050000-5581-8b70-f9db-9403c0780bdb	3253	Pristava pri Mestinju
00050000-5581-8b70-8c09-c16ad8b1ed10	9207	Prosenjakovci/Partosfalva
00050000-5581-8b70-92bc-5636df757c44	5297	Prvačina
00050000-5581-8b70-9f09-d6c691d9b185	2250	Ptuj
00050000-5581-8b70-dcab-55ec4e1e7057	2323	Ptujska Gora
00050000-5581-8b70-951d-76491a36606a	9201	Puconci
00050000-5581-8b70-d810-a8416d472ac4	2327	Rače
00050000-5581-8b70-077e-17b98ecadcc2	1433	Radeče
00050000-5581-8b70-8848-54447d049e92	9252	Radenci
00050000-5581-8b70-0197-8e28cf107267	2360	Radlje ob Dravi
00050000-5581-8b70-8ad8-403cf58cbe6c	1235	Radomlje
00050000-5581-8b70-0d0f-64c499b3f471	4240	Radovljica
00050000-5581-8b70-60cf-273d2e8f74e8	8274	Raka
00050000-5581-8b70-c5b4-382900e9ec57	1381	Rakek
00050000-5581-8b70-e62b-d0df9925d51c	4283	Rateče - Planica
00050000-5581-8b70-9a69-c5f79e6b3a4e	2390	Ravne na Koroškem
00050000-5581-8b70-87d1-ec8ce6959fc2	9246	Razkrižje
00050000-5581-8b70-13ee-4f8b1d9b8812	3332	Rečica ob Savinji
00050000-5581-8b70-abfc-28a205b6dbaa	5292	Renče
00050000-5581-8b70-034f-b50da30d251d	1310	Ribnica
00050000-5581-8b70-8392-08c776561917	2364	Ribnica na Pohorju
00050000-5581-8b70-35e5-d5a77c4fa442	3272	Rimske Toplice
00050000-5581-8b70-751d-5a0b885c04c5	1314	Rob
00050000-5581-8b70-a4d9-1b6c2f749fe5	5215	Ročinj
00050000-5581-8b70-e9ed-bb501ac3b015	3250	Rogaška Slatina
00050000-5581-8b70-acde-15be91138f35	9262	Rogašovci
00050000-5581-8b70-c482-24ddaad6e235	3252	Rogatec
00050000-5581-8b70-01d7-d8d85d955485	1373	Rovte
00050000-5581-8b70-a6c0-158cd4be1ad3	2342	Ruše
00050000-5581-8b70-9888-a48db82ce766	1282	Sava
00050000-5581-8b70-0aa9-fd77db07df94	6333	Sečovlje/Sicciole
00050000-5581-8b70-43e1-b0d100854624	4227	Selca
00050000-5581-8b70-3328-a4766f2141a3	2352	Selnica ob Dravi
00050000-5581-8b70-301e-490ecb5b9254	8333	Semič
00050000-5581-8b70-bb91-dd51760812ad	8281	Senovo
00050000-5581-8b70-36ce-d811d9c81cdb	6224	Senožeče
00050000-5581-8b70-8082-c6d4e991b0be	8290	Sevnica
00050000-5581-8b70-1a7d-06aa85ce6222	6210	Sežana
00050000-5581-8b70-0e10-f02c946c2227	2214	Sladki Vrh
00050000-5581-8b70-2d23-a3e14df439d7	5283	Slap ob Idrijci
00050000-5581-8b70-f80f-9184fb20cfb6	2380	Slovenj Gradec
00050000-5581-8b70-d553-e6c7e5d4eaf2	2310	Slovenska Bistrica
00050000-5581-8b70-5374-259479b0e5d2	3210	Slovenske Konjice
00050000-5581-8b70-bedb-359a123f9d16	1216	Smlednik
00050000-5581-8b70-9c13-ec362863e4ee	5232	Soča
00050000-5581-8b70-263f-d93f06c8e5e9	1317	Sodražica
00050000-5581-8b70-faf0-8a78b59ecca8	3335	Solčava
00050000-5581-8b70-548d-38c0023dde27	5250	Solkan
00050000-5581-8b70-1d24-d746cd00fa56	4229	Sorica
00050000-5581-8b70-3cce-b445fb2c1fe1	4225	Sovodenj
00050000-5581-8b70-482e-6940a8bc4bf4	5281	Spodnja Idrija
00050000-5581-8b70-f765-d91c998b67a8	2241	Spodnji Duplek
00050000-5581-8b70-3f20-50b73c43d767	9245	Spodnji Ivanjci
00050000-5581-8b70-0ef8-14ab1f450836	2277	Središče ob Dravi
00050000-5581-8b70-23bb-227262c0967f	4267	Srednja vas v Bohinju
00050000-5581-8b70-c314-154ad0f9e928	8256	Sromlje 
00050000-5581-8b70-4ca8-271d2331df34	5224	Srpenica
00050000-5581-8b70-5765-c118665fd5f7	1242	Stahovica
00050000-5581-8b70-4423-76b98563391a	1332	Stara Cerkev
00050000-5581-8b70-b348-1475cfbc6f6f	8342	Stari trg ob Kolpi
00050000-5581-8b70-f88e-5a4625e057ae	1386	Stari trg pri Ložu
00050000-5581-8b70-770d-c195823e9727	2205	Starše
00050000-5581-8b70-39f5-e0734dde5736	2289	Stoperce
00050000-5581-8b70-f9a1-4fb61a2e56f0	8322	Stopiče
00050000-5581-8b70-7350-7d9464fdb9ab	3206	Stranice
00050000-5581-8b70-ed80-0f487f7e30d9	8351	Straža
00050000-5581-8b70-13b8-c7696ec83790	1313	Struge
00050000-5581-8b70-2cc1-8e37ceae2bbb	8293	Studenec
00050000-5581-8b70-a0a4-525dc438f972	8331	Suhor
00050000-5581-8b70-e7cb-06ed65a6deb1	2233	Sv. Ana v Slovenskih goricah
00050000-5581-8b70-f025-473a6df10e29	2235	Sv. Trojica v Slovenskih goricah
00050000-5581-8b70-61df-259f89da562c	2353	Sveti Duh na Ostrem Vrhu
00050000-5581-8b70-264c-8fd4467cc915	9244	Sveti Jurij ob Ščavnici
00050000-5581-8b70-cbb8-093d405cfaa0	3264	Sveti Štefan
00050000-5581-8b70-e665-2d23a4fcc5fb	2258	Sveti Tomaž
00050000-5581-8b70-cc11-6faf877c5f75	9204	Šalovci
00050000-5581-8b70-38dc-c5fbd4493313	5261	Šempas
00050000-5581-8b70-dbe0-fceaca5782ba	5290	Šempeter pri Gorici
00050000-5581-8b70-67c2-4debdddce7c7	3311	Šempeter v Savinjski dolini
00050000-5581-8b70-2776-37c22dbe4388	4208	Šenčur
00050000-5581-8b70-201d-d3efca763044	2212	Šentilj v Slovenskih goricah
00050000-5581-8b70-25c9-f0157118bf67	8297	Šentjanž
00050000-5581-8b70-3d50-88cc42c5c363	2373	Šentjanž pri Dravogradu
00050000-5581-8b70-3783-28190e987b10	8310	Šentjernej
00050000-5581-8b70-5581-ab0e5aefd292	3230	Šentjur
00050000-5581-8b70-161b-ea1e274a3750	3271	Šentrupert
00050000-5581-8b70-5750-b0c1c2e43577	8232	Šentrupert
00050000-5581-8b70-e93b-dac5f1e9def6	1296	Šentvid pri Stični
00050000-5581-8b70-4296-cf1e28416d34	8275	Škocjan
00050000-5581-8b70-c477-6c3af7232b0f	6281	Škofije
00050000-5581-8b70-84b6-774b68c7d95d	4220	Škofja Loka
00050000-5581-8b70-9b80-2665973ba86b	3211	Škofja vas
00050000-5581-8b70-f278-4066e23ec1b7	1291	Škofljica
00050000-5581-8b70-ff51-785ade683197	6274	Šmarje
00050000-5581-8b70-bad0-1a7aff28d4a9	1293	Šmarje - Sap
00050000-5581-8b70-777a-ee2b48470fdf	3240	Šmarje pri Jelšah
00050000-5581-8b70-8e65-f9dfc238d62d	8220	Šmarješke Toplice
00050000-5581-8b70-0104-1cecd147aa5e	2315	Šmartno na Pohorju
00050000-5581-8b70-a2fe-5698c14dd25d	3341	Šmartno ob Dreti
00050000-5581-8b70-b076-6530d496ff1c	3327	Šmartno ob Paki
00050000-5581-8b70-cf1f-8cab703a26eb	1275	Šmartno pri Litiji
00050000-5581-8b70-e62a-f69bf379231f	2383	Šmartno pri Slovenj Gradcu
00050000-5581-8b70-7dff-4f980ec96959	3201	Šmartno v Rožni dolini
00050000-5581-8b70-c8c1-8ae11c0e7c77	3325	Šoštanj
00050000-5581-8b70-c141-f75552e82324	6222	Štanjel
00050000-5581-8b70-8194-dc7b5e316773	3220	Štore
00050000-5581-8b70-2bbb-80d223a1058e	3304	Tabor
00050000-5581-8b70-14f0-816b4b4f41cc	3221	Teharje
00050000-5581-8b70-8fc2-6e1621e31d9f	9251	Tišina
00050000-5581-8b70-13a1-e4c9b911883b	5220	Tolmin
00050000-5581-8b70-079d-c8666051be90	3326	Topolšica
00050000-5581-8b70-60c6-f33f6a8a80bb	2371	Trbonje
00050000-5581-8b70-fd94-cfa90b8e701f	1420	Trbovlje
00050000-5581-8b70-50b3-f111a515c282	8231	Trebelno 
00050000-5581-8b70-3289-214cbd574872	8210	Trebnje
00050000-5581-8b70-6c3a-0b3d289c04de	5252	Trnovo pri Gorici
00050000-5581-8b70-2c40-aa017c7c2e9d	2254	Trnovska vas
00050000-5581-8b70-b98f-7de612d84a31	1222	Trojane
00050000-5581-8b70-2bc4-48cdec991cfd	1236	Trzin
00050000-5581-8b70-7013-972d7341553a	4290	Tržič
00050000-5581-8b70-f1d8-dd8819f0ced5	8295	Tržišče
00050000-5581-8b70-121a-65b5713f2a55	1311	Turjak
00050000-5581-8b70-672d-d0756769f189	9224	Turnišče
00050000-5581-8b70-af86-bd78dbdea094	8323	Uršna sela
00050000-5581-8b70-9ce8-4ba66681921f	1252	Vače
00050000-5581-8b70-fa4c-f2f5147202d3	3320	Velenje 
00050000-5581-8b70-deec-4c978839892a	3322	Velenje - poštni predali
00050000-5581-8b70-fd90-0807b8d35c59	8212	Velika Loka
00050000-5581-8b70-71e9-45697d98d5f5	2274	Velika Nedelja
00050000-5581-8b70-ecd1-c7838d7902b0	9225	Velika Polana
00050000-5581-8b70-555e-b7a7cd83ea9f	1315	Velike Lašče
00050000-5581-8b70-563a-2807c1923832	8213	Veliki Gaber
00050000-5581-8b70-0548-e3fb9514c6e0	9241	Veržej
00050000-5581-8b70-1dd8-0573b1fff668	1312	Videm - Dobrepolje
00050000-5581-8b70-4249-44d9479422b8	2284	Videm pri Ptuju
00050000-5581-8b70-5023-a1a88ce20dba	8344	Vinica
00050000-5581-8b70-8c58-1925d7218e9c	5271	Vipava
00050000-5581-8b70-8c07-8ecd120b010e	4212	Visoko
00050000-5581-8b70-39cf-233befdce34f	1294	Višnja Gora
00050000-5581-8b70-e38e-39088673e54b	3205	Vitanje
00050000-5581-8b70-5b62-12824f026f54	2255	Vitomarci
00050000-5581-8b70-6ff9-52d4e07b183c	1217	Vodice
00050000-5581-8b70-21ff-fb6046da01df	3212	Vojnik\t
00050000-5581-8b70-7ecb-1183a5d46984	5293	Volčja Draga
00050000-5581-8b70-ea38-c043d6eefc4f	2232	Voličina
00050000-5581-8b70-063d-fbfe941571a5	3305	Vransko
00050000-5581-8b70-c77a-dbcbab33dbfb	6217	Vremski Britof
00050000-5581-8b70-65f7-0d25d0d989e9	1360	Vrhnika
00050000-5581-8b70-d685-6ad8614e069c	2365	Vuhred
00050000-5581-8b70-986f-dde5c1287b11	2367	Vuzenica
00050000-5581-8b70-c44a-68fe026705b1	8292	Zabukovje 
00050000-5581-8b70-959f-497d5b98c086	1410	Zagorje ob Savi
00050000-5581-8b70-06d5-02dbf34c69f1	1303	Zagradec
00050000-5581-8b70-beb6-d4d8b3d944da	2283	Zavrč
00050000-5581-8b70-f4f8-19b1ce568f8f	8272	Zdole 
00050000-5581-8b70-e151-abdc317c00c5	4201	Zgornja Besnica
00050000-5581-8b70-e467-98781943bd1f	2242	Zgornja Korena
00050000-5581-8b70-c16c-f5958c353932	2201	Zgornja Kungota
00050000-5581-8b70-378c-aa4196be04ba	2316	Zgornja Ložnica
00050000-5581-8b70-af96-a1ce7408bec4	2314	Zgornja Polskava
00050000-5581-8b70-20e1-e08dc5dfd3c8	2213	Zgornja Velka
00050000-5581-8b70-163c-0a3cda90d604	4247	Zgornje Gorje
00050000-5581-8b70-8cc3-16a1a5bfc518	4206	Zgornje Jezersko
00050000-5581-8b70-d3da-b066ea2c162a	2285	Zgornji Leskovec
00050000-5581-8b70-f741-733b5853d2e3	1432	Zidani Most
00050000-5581-8b70-a9cc-9059440b7ac3	3214	Zreče
00050000-5581-8b70-59aa-ce7215b6d4c2	4209	Žabnica
00050000-5581-8b70-a621-615391c0504d	3310	Žalec
00050000-5581-8b70-e542-acb3d9666158	4228	Železniki
00050000-5581-8b70-bac6-dbb1fa1dde5a	2287	Žetale
00050000-5581-8b70-f9af-35446c5b7fbc	4226	Žiri
00050000-5581-8b70-ba28-2bc5ad319179	4274	Žirovnica
00050000-5581-8b70-6a26-02d9c3782ae0	8360	Žužemberk
\.


--
-- TOC entry 2854 (class 0 OID 7621101)
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
-- TOC entry 2836 (class 0 OID 7620912)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7620990)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7621113)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7621233)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7621286)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5581-8b71-8ced-ce0713805856	00080000-5581-8b71-7d93-220ae7614ca7	0987	A
00190000-5581-8b71-5854-bc3687576f41	00080000-5581-8b71-8a8b-c05e2ab626c6	0989	A
\.


--
-- TOC entry 2880 (class 0 OID 7621405)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7621468)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7621418)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7621437)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7621142)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5581-8b71-e6d7-465a4e73f1a9	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5581-8b71-6909-b51f1a316318	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5581-8b71-0228-041d5db77c1c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5581-8b71-7680-c83215d33e13	0004	Mali oder	t	24	Mali oder 
00220000-5581-8b71-1e11-c3fd57fd0a19	0005	Komorni oder	t	15	Komorni oder
00220000-5581-8b71-61c5-c4edaba19399	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5581-8b71-8887-29bdd4c12c87	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2852 (class 0 OID 7621086)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7621076)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7621275)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 7621210)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7620784)
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
-- TOC entry 2861 (class 0 OID 7621152)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7620822)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5581-8b70-8036-366875176b12	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5581-8b70-df67-bbd3224a8f32	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5581-8b70-27db-8280c2c09f2c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5581-8b70-073d-fe61ed2f6d8e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5581-8b70-f9ea-253ffcc76536	planer	Planer dogodkov v koledarju	t
00020000-5581-8b70-a45d-f25d61eb5f1d	kadrovska	Kadrovska služba	t
00020000-5581-8b70-4361-ff914234884f	arhivar	Ažuriranje arhivalij	t
00020000-5581-8b70-561e-70b3179d0eee	igralec	Igralec	t
00020000-5581-8b70-4432-bb294a4d2efc	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2827 (class 0 OID 7620806)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5581-8b70-6033-0f5410e100d2	00020000-5581-8b70-27db-8280c2c09f2c
00010000-5581-8b70-5c97-917e4c0141a6	00020000-5581-8b70-27db-8280c2c09f2c
\.


--
-- TOC entry 2863 (class 0 OID 7621166)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7621107)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7621057)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7621501)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5581-8b70-4d68-55b5a021cabc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5581-8b70-4ec0-4d2d4eab63ad	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5581-8b70-64ee-55947cb27605	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5581-8b70-e9f9-2292fa59ebac	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5581-8b70-f5dd-f6d7b1d39ae8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2886 (class 0 OID 7621493)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5581-8b70-2e8d-39ae4fd81c93	00230000-5581-8b70-e9f9-2292fa59ebac	popa
00240000-5581-8b70-6cf2-41107a059b97	00230000-5581-8b70-e9f9-2292fa59ebac	oseba
00240000-5581-8b70-33af-7da7e6259cd2	00230000-5581-8b70-4ec0-4d2d4eab63ad	prostor
00240000-5581-8b70-80ce-9529e4e4da42	00230000-5581-8b70-e9f9-2292fa59ebac	besedilo
00240000-5581-8b70-289a-d6f2a6921b16	00230000-5581-8b70-e9f9-2292fa59ebac	uprizoritev
00240000-5581-8b70-69a9-6d44e92f4e0e	00230000-5581-8b70-e9f9-2292fa59ebac	funkcija
00240000-5581-8b70-c9a3-f309332d0c55	00230000-5581-8b70-e9f9-2292fa59ebac	tipfunkcije
00240000-5581-8b70-84ea-4d28e2084843	00230000-5581-8b70-e9f9-2292fa59ebac	alternacija
00240000-5581-8b70-0c34-d0600057c06b	00230000-5581-8b70-4d68-55b5a021cabc	pogodba
00240000-5581-8b70-770f-da0b08a8e1cb	00230000-5581-8b70-e9f9-2292fa59ebac	zaposlitev
\.


--
-- TOC entry 2885 (class 0 OID 7621488)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7621220)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7620884)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7621063)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5581-8b71-443b-724ffb360c12	00180000-5581-8b71-6cb4-5bee24fa54a1	000c0000-5581-8b71-68b2-e7352edf2006	00090000-5581-8b71-420f-027040db137a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-8b71-a2ef-8383995b04f5	00180000-5581-8b71-6cb4-5bee24fa54a1	000c0000-5581-8b71-d432-9272d939adde	00090000-5581-8b71-3339-d77ec0d04c78	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-8b71-119f-153ec3222195	00180000-5581-8b71-6cb4-5bee24fa54a1	000c0000-5581-8b71-f986-17c65556740a	00090000-5581-8b71-6623-5b3ccaf5d014	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-8b71-6dd7-62161571da36	00180000-5581-8b71-6cb4-5bee24fa54a1	000c0000-5581-8b71-d49c-4c73a6e7c7ce	00090000-5581-8b71-f036-d28e28bb687b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-8b71-1efb-168edd8fce76	00180000-5581-8b71-6cb4-5bee24fa54a1	000c0000-5581-8b71-3bcc-d2d832bffe8f	00090000-5581-8b71-e77c-77abf53e0c61	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5581-8b71-9c13-60a11c02655b	00180000-5581-8b71-955e-4babd11119ab	\N	00090000-5581-8b71-e77c-77abf53e0c61	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2871 (class 0 OID 7621264)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5581-8b70-925c-cbf8130cfc9b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5581-8b70-6250-385a9a69f9e1	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5581-8b70-b0a2-5aa665d50a7f	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5581-8b70-cc36-1b563adbd31a	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5581-8b70-f8a9-65b24a705be0	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5581-8b70-8ea9-27aa9f04ff43	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5581-8b70-4cea-b368b9a7403c	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5581-8b70-ada2-f55d43e5afa0	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5581-8b70-9938-80b8879a4f46	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5581-8b70-a488-207e981a6c2b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5581-8b70-7d93-cd431c07e751	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5581-8b70-dc40-32286bee3d4d	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5581-8b70-9f65-8758b422af6a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5581-8b70-428d-a294d7778297	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5581-8b70-df3f-de8cf293b5b8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5581-8b70-2b8f-8f113f93c0a0	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2883 (class 0 OID 7621457)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5581-8b70-fe23-8d90aca25f37	01	Velika predstava	f	1.00	1.00
002b0000-5581-8b70-7dd8-bd280b75d7ce	02	Mala predstava	f	0.50	0.50
002b0000-5581-8b70-c466-54558110dfbe	03	Mala koprodukcija	t	0.40	1.00
002b0000-5581-8b70-0372-1305bd9c49c9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5581-8b70-2164-fad799c0d902	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2839 (class 0 OID 7620947)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 7620793)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5581-8b70-5c97-917e4c0141a6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROrMHlJDo5BXK7oN.mOO/d1oPrxdQPPPy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5581-8b71-cb1d-6bcf2cf6aa99	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5581-8b71-65c3-8fcb0e0f494f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5581-8b71-3793-e379c719fb3b	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5581-8b71-7ad5-612fdc1a037b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5581-8b71-9e78-337ce41e77c2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5581-8b71-48bd-ed49284aea57	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5581-8b71-f680-94cc7b68fade	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N			ali@ifigenija.si	\N	\N	\N
00010000-5581-8b71-965f-04ddec738ae5	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N			berta@ifigenija.si	\N	\N	\N
00010000-5581-8b71-b769-c7ade43326fb	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N			aaron@ifigenija.si	\N	\N	\N
00010000-5581-8b70-6033-0f5410e100d2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2876 (class 0 OID 7621321)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5581-8b71-0544-80442ef156df	00160000-5581-8b71-92bc-d5eb3b7a97e3	00150000-5581-8b70-7cfc-b1cb6e1acd35	00140000-5581-8b70-e224-e59657516623	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5581-8b71-1e11-c3fd57fd0a19
000e0000-5581-8b71-a1b8-699f2245aea9	00160000-5581-8b71-c09c-a6207420323e	00150000-5581-8b70-af15-1530112e93cc	00140000-5581-8b70-50b1-bfbf70583b64	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5581-8b71-61c5-c4edaba19399
000e0000-5581-8b71-3daa-c87d3676c149	\N	00150000-5581-8b70-af15-1530112e93cc	00140000-5581-8b70-50b1-bfbf70583b64	00190000-5581-8b71-8ced-ce0713805856	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5581-8b71-1e11-c3fd57fd0a19
000e0000-5581-8b71-57a8-c203268296f1	\N	00150000-5581-8b70-af15-1530112e93cc	00140000-5581-8b70-50b1-bfbf70583b64	00190000-5581-8b71-8ced-ce0713805856	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5581-8b71-1e11-c3fd57fd0a19
\.


--
-- TOC entry 2844 (class 0 OID 7621009)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5581-8b71-eede-7f79f2ece269	000e0000-5581-8b71-a1b8-699f2245aea9	1	
00200000-5581-8b71-cad9-5ca970787bb6	000e0000-5581-8b71-a1b8-699f2245aea9	2	
\.


--
-- TOC entry 2859 (class 0 OID 7621134)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7621203)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7621041)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7621311)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5581-8b70-e224-e59657516623	01	Drama	drama (SURS 01)
00140000-5581-8b70-5f9b-10f18f9ac629	02	Opera	opera (SURS 02)
00140000-5581-8b70-dbbd-a9ad38236e25	03	Balet	balet (SURS 03)
00140000-5581-8b70-da31-300ef90ca4c1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5581-8b70-f7d8-2015a6fc202c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5581-8b70-50b1-bfbf70583b64	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5581-8b70-10df-24b886fa0195	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2865 (class 0 OID 7621193)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5581-8b70-a0d5-01798087ae12	01	Opera	opera
00150000-5581-8b70-2b46-83e3fa6afbaf	02	Opereta	opereta
00150000-5581-8b70-4e1d-a3c41317dade	03	Balet	balet
00150000-5581-8b70-3045-cdecbf87ffe9	04	Plesne prireditve	plesne prireditve
00150000-5581-8b70-1d69-b92bbf599ac8	05	Lutkovno gledališče	lutkovno gledališče
00150000-5581-8b70-ee9d-eaf97d178889	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5581-8b70-7f64-2f520c2e5877	07	Biografska drama	biografska drama
00150000-5581-8b70-7cfc-b1cb6e1acd35	08	Komedija	komedija
00150000-5581-8b70-1d02-72b6c9015eff	09	Črna komedija	črna komedija
00150000-5581-8b70-e0fe-8e52ae12a1fb	10	E-igra	E-igra
00150000-5581-8b70-af15-1530112e93cc	11	Kriminalka	kriminalka
00150000-5581-8b70-b9c2-3c9916ea6ee4	12	Musical	musical
\.


--
-- TOC entry 2407 (class 2606 OID 7620847)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 7621368)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7621358)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7621263)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7621031)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 7621056)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 7620973)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 7621401)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7621189)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7621007)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 7621050)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 7620987)
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
-- TOC entry 2499 (class 2606 OID 7621099)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 7621126)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 7620945)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 7620856)
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
-- TOC entry 2414 (class 2606 OID 7620880)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7620836)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2398 (class 2606 OID 7620821)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7621132)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7621165)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7621306)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 7620909)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 7620933)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7621105)
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
-- TOC entry 2429 (class 2606 OID 7620923)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 7620994)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 7621117)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7621245)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 7621291)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7621416)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7621486)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7621433)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 7621454)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7621149)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 7621090)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 7621081)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 7621285)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7621217)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 7620792)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 7621156)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 7620810)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2400 (class 2606 OID 7620830)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7621174)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7621112)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 7621062)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7621510)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7621498)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7621492)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7621230)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7620889)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 7621072)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7621274)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 7621467)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7620958)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7620805)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 7621337)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 7621016)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 7621140)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7621208)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 7621045)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 7621319)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7621201)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 1259 OID 7621038)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2547 (class 1259 OID 7621231)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7621232)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7620911)
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
-- TOC entry 2512 (class 1259 OID 7621133)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2506 (class 1259 OID 7621119)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2507 (class 1259 OID 7621118)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2458 (class 1259 OID 7621017)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2534 (class 1259 OID 7621190)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2535 (class 1259 OID 7621192)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2536 (class 1259 OID 7621191)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 7620989)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 7620988)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 7621308)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2566 (class 1259 OID 7621309)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2567 (class 1259 OID 7621310)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2607 (class 1259 OID 7621456)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2608 (class 1259 OID 7621455)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2574 (class 1259 OID 7621342)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2575 (class 1259 OID 7621339)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2576 (class 1259 OID 7621343)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2577 (class 1259 OID 7621341)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2578 (class 1259 OID 7621340)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2436 (class 1259 OID 7620960)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2437 (class 1259 OID 7620959)
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
-- TOC entry 2412 (class 1259 OID 7620883)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2522 (class 1259 OID 7621157)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 7621051)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 7620837)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2403 (class 1259 OID 7620838)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2527 (class 1259 OID 7621177)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2528 (class 1259 OID 7621176)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 7621175)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2450 (class 1259 OID 7620995)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2451 (class 1259 OID 7620997)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2452 (class 1259 OID 7620996)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2618 (class 1259 OID 7621500)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2486 (class 1259 OID 7621085)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2487 (class 1259 OID 7621083)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2488 (class 1259 OID 7621082)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2489 (class 1259 OID 7621084)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2393 (class 1259 OID 7620811)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2394 (class 1259 OID 7620812)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2515 (class 1259 OID 7621141)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2501 (class 1259 OID 7621106)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2543 (class 1259 OID 7621218)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2544 (class 1259 OID 7621219)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2596 (class 1259 OID 7621402)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2597 (class 1259 OID 7621403)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2598 (class 1259 OID 7621404)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2425 (class 1259 OID 7620925)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 7620924)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2427 (class 1259 OID 7620926)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2613 (class 1259 OID 7621487)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2551 (class 1259 OID 7621246)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 7621247)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2588 (class 1259 OID 7621372)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2589 (class 1259 OID 7621374)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2590 (class 1259 OID 7621370)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2591 (class 1259 OID 7621373)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2592 (class 1259 OID 7621371)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2540 (class 1259 OID 7621209)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 7621094)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2493 (class 1259 OID 7621093)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2494 (class 1259 OID 7621091)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2495 (class 1259 OID 7621092)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2376 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2584 (class 1259 OID 7621360)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2585 (class 1259 OID 7621359)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2599 (class 1259 OID 7621417)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2457 (class 1259 OID 7621008)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2408 (class 1259 OID 7620858)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2409 (class 1259 OID 7620857)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2417 (class 1259 OID 7620890)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2418 (class 1259 OID 7620891)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2481 (class 1259 OID 7621075)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2482 (class 1259 OID 7621074)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2483 (class 1259 OID 7621073)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2602 (class 1259 OID 7621436)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2603 (class 1259 OID 7621434)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2604 (class 1259 OID 7621435)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2464 (class 1259 OID 7621040)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2465 (class 1259 OID 7621036)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2466 (class 1259 OID 7621033)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2467 (class 1259 OID 7621034)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2468 (class 1259 OID 7621032)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2469 (class 1259 OID 7621037)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2470 (class 1259 OID 7621035)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2424 (class 1259 OID 7620910)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2442 (class 1259 OID 7620974)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7620976)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2444 (class 1259 OID 7620975)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2445 (class 1259 OID 7620977)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2500 (class 1259 OID 7621100)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 7621307)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 7621338)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2415 (class 1259 OID 7620881)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2416 (class 1259 OID 7620882)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2537 (class 1259 OID 7621202)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 7621511)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2435 (class 1259 OID 7620946)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2621 (class 1259 OID 7621499)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2520 (class 1259 OID 7621151)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2521 (class 1259 OID 7621150)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 7621369)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2432 (class 1259 OID 7620934)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2571 (class 1259 OID 7621320)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 7621292)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 7621293)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 7620831)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2471 (class 1259 OID 7621039)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2650 (class 2606 OID 7621647)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2653 (class 2606 OID 7621632)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 7621637)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2648 (class 2606 OID 7621657)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2654 (class 2606 OID 7621627)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2649 (class 2606 OID 7621652)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 7621642)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2684 (class 2606 OID 7621802)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2683 (class 2606 OID 7621807)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7621562)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2671 (class 2606 OID 7621742)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2669 (class 2606 OID 7621737)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 7621732)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2647 (class 2606 OID 7621622)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7621772)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2677 (class 2606 OID 7621782)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2678 (class 2606 OID 7621777)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2641 (class 2606 OID 7621597)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2642 (class 2606 OID 7621592)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2667 (class 2606 OID 7621722)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2690 (class 2606 OID 7621827)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2689 (class 2606 OID 7621832)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2688 (class 2606 OID 7621837)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2710 (class 2606 OID 7621942)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2711 (class 2606 OID 7621937)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2692 (class 2606 OID 7621857)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2695 (class 2606 OID 7621842)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2691 (class 2606 OID 7621862)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2693 (class 2606 OID 7621852)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2694 (class 2606 OID 7621847)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2639 (class 2606 OID 7621587)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2640 (class 2606 OID 7621582)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7621547)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2632 (class 2606 OID 7621542)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2673 (class 2606 OID 7621752)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 7621662)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 7621522)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2627 (class 2606 OID 7621527)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2674 (class 2606 OID 7621767)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2675 (class 2606 OID 7621762)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2676 (class 2606 OID 7621757)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2645 (class 2606 OID 7621602)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 7621612)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2644 (class 2606 OID 7621607)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2713 (class 2606 OID 7621952)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2659 (class 2606 OID 7621697)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2661 (class 2606 OID 7621687)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2662 (class 2606 OID 7621682)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2660 (class 2606 OID 7621692)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2626 (class 2606 OID 7621512)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2625 (class 2606 OID 7621517)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2672 (class 2606 OID 7621747)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 7621727)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2682 (class 2606 OID 7621792)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2681 (class 2606 OID 7621797)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2705 (class 2606 OID 7621902)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7621907)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2703 (class 2606 OID 7621912)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2637 (class 2606 OID 7621572)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7621567)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2636 (class 2606 OID 7621577)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 7621947)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2686 (class 2606 OID 7621812)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2685 (class 2606 OID 7621817)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2700 (class 2606 OID 7621887)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2698 (class 2606 OID 7621897)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2702 (class 2606 OID 7621877)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2699 (class 2606 OID 7621892)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2701 (class 2606 OID 7621882)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2680 (class 2606 OID 7621787)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 7621717)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2664 (class 2606 OID 7621712)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2666 (class 2606 OID 7621702)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2665 (class 2606 OID 7621707)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2696 (class 2606 OID 7621872)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2697 (class 2606 OID 7621867)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2706 (class 2606 OID 7621917)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2646 (class 2606 OID 7621617)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2687 (class 2606 OID 7621822)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2629 (class 2606 OID 7621537)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 7621532)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2634 (class 2606 OID 7621552)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2633 (class 2606 OID 7621557)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 7621677)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2657 (class 2606 OID 7621672)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2658 (class 2606 OID 7621667)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2707 (class 2606 OID 7621932)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2709 (class 2606 OID 7621922)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 7621927)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-17 17:00:02 CEST

--
-- PostgreSQL database dump complete
--

