--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-12 14:19:10 CEST

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
-- TOC entry 180 (class 1259 OID 7086902)
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
-- TOC entry 227 (class 1259 OID 7087424)
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
-- TOC entry 226 (class 1259 OID 7087407)
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
-- TOC entry 219 (class 1259 OID 7087311)
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
-- TOC entry 194 (class 1259 OID 7087081)
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
-- TOC entry 197 (class 1259 OID 7087115)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 7087024)
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
-- TOC entry 228 (class 1259 OID 7087438)
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
-- TOC entry 213 (class 1259 OID 7087241)
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
-- TOC entry 192 (class 1259 OID 7087061)
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
-- TOC entry 196 (class 1259 OID 7087109)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 7087041)
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
-- TOC entry 202 (class 1259 OID 7087158)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7087183)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 7086998)
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
-- TOC entry 181 (class 1259 OID 7086911)
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
-- TOC entry 182 (class 1259 OID 7086922)
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
-- TOC entry 177 (class 1259 OID 7086876)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7086895)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 7087190)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 7087221)
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
-- TOC entry 223 (class 1259 OID 7087357)
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
-- TOC entry 184 (class 1259 OID 7086955)
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
-- TOC entry 186 (class 1259 OID 7086990)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 7087164)
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
-- TOC entry 185 (class 1259 OID 7086975)
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
-- TOC entry 191 (class 1259 OID 7087053)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 7087176)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 7087296)
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
-- TOC entry 222 (class 1259 OID 7087349)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 7087464)
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
-- TOC entry 233 (class 1259 OID 7087527)
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
-- TOC entry 230 (class 1259 OID 7087477)
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
-- TOC entry 231 (class 1259 OID 7087496)
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
-- TOC entry 209 (class 1259 OID 7087205)
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
-- TOC entry 201 (class 1259 OID 7087149)
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
-- TOC entry 200 (class 1259 OID 7087139)
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
-- TOC entry 221 (class 1259 OID 7087338)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 7087273)
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
-- TOC entry 174 (class 1259 OID 7086847)
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
-- TOC entry 173 (class 1259 OID 7086845)
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
-- TOC entry 210 (class 1259 OID 7087215)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 7086885)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 7086869)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 7087229)
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
-- TOC entry 204 (class 1259 OID 7087170)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 7087120)
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
-- TOC entry 236 (class 1259 OID 7087560)
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
-- TOC entry 235 (class 1259 OID 7087552)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7087547)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 7087283)
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
-- TOC entry 183 (class 1259 OID 7086947)
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
-- TOC entry 199 (class 1259 OID 7087126)
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
-- TOC entry 220 (class 1259 OID 7087327)
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
-- TOC entry 232 (class 1259 OID 7087516)
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
-- TOC entry 188 (class 1259 OID 7087010)
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
-- TOC entry 175 (class 1259 OID 7086856)
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
-- TOC entry 225 (class 1259 OID 7087384)
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
-- TOC entry 193 (class 1259 OID 7087072)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 7087197)
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
-- TOC entry 215 (class 1259 OID 7087266)
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
-- TOC entry 195 (class 1259 OID 7087104)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 7087374)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 7087256)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2175 (class 2604 OID 7086850)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2827 (class 0 OID 7086902)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7087424)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-557a-ce3d-b354-d005a9564c64	000d0000-557a-ce3d-d879-d7799e124f21	\N	00090000-557a-ce3d-100d-f66e1b24e386	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-ce3d-45f0-618906bfdcaf	000d0000-557a-ce3d-f1a3-7b12d95a39d0	\N	00090000-557a-ce3d-4cc9-57e4d6ab62f4	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-ce3d-755f-b39549ef9e4c	000d0000-557a-ce3d-3992-250b1a60549b	\N	00090000-557a-ce3d-0fea-76781198a1e3	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-ce3d-b00b-4c37eb21f781	000d0000-557a-ce3d-e446-8cb7227ba017	\N	00090000-557a-ce3d-dd88-3555a4443683	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-ce3d-8e2b-76f718b2f728	000d0000-557a-ce3d-1144-502da9fdc789	\N	00090000-557a-ce3d-8271-40a32724dd11	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-557a-ce3d-13e2-d993b509a4f2	000d0000-557a-ce3d-da6e-9cec57778a54	\N	00090000-557a-ce3d-4cc9-57e4d6ab62f4	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2873 (class 0 OID 7087407)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7087311)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-557a-ce3d-95b4-4b69d37739ef	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-557a-ce3d-631b-8433589a8198	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-557a-ce3d-8d29-a424d5e53bde	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2841 (class 0 OID 7087081)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-557a-ce3d-8658-32c1722ba351	\N	\N	00200000-557a-ce3d-3b8c-452bd823e1d2	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-557a-ce3d-306f-ab056492d19c	\N	\N	00200000-557a-ce3d-6571-baad464becad	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-557a-ce3d-1edb-33cd2c38144d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-557a-ce3d-ef38-3cd3fc0bce8e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-557a-ce3d-1333-a974ae7d8125	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2844 (class 0 OID 7087115)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7087024)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-557a-ce3c-aa2b-3eadbcfcd37e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-557a-ce3c-61bf-bc2d68a01ee9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-557a-ce3c-dacf-1a38963c1012	AL	ALB	008	Albania 	Albanija	\N
00040000-557a-ce3c-0427-165a34445784	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-557a-ce3c-0907-e83a9d02623d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-557a-ce3c-71f4-73ea79619316	AD	AND	020	Andorra 	Andora	\N
00040000-557a-ce3c-b029-85f7992d500f	AO	AGO	024	Angola 	Angola	\N
00040000-557a-ce3c-112a-1f259dfda937	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-557a-ce3c-6cc7-f3292cd1426b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-557a-ce3c-cffb-9238b12eb21c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-ce3c-c06f-c30b4c83c446	AR	ARG	032	Argentina 	Argenitna	\N
00040000-557a-ce3c-e24d-fef2da8dd173	AM	ARM	051	Armenia 	Armenija	\N
00040000-557a-ce3c-c080-a13fcd0ec044	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-557a-ce3c-dcf7-d594f4a1223f	AU	AUS	036	Australia 	Avstralija	\N
00040000-557a-ce3c-6390-cbf7e046ec4c	AT	AUT	040	Austria 	Avstrija	\N
00040000-557a-ce3c-a59e-cdfc143193ee	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-557a-ce3c-658a-0d0d6dfc14c8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-557a-ce3c-9e07-fbcae58d4ca0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-557a-ce3c-f71c-c8aa42821ae6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-557a-ce3c-b417-f4ec69f68b29	BB	BRB	052	Barbados 	Barbados	\N
00040000-557a-ce3c-8dcb-e8143c5553c4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-557a-ce3c-11be-23c1755e52da	BE	BEL	056	Belgium 	Belgija	\N
00040000-557a-ce3c-064f-9c31340b85f2	BZ	BLZ	084	Belize 	Belize	\N
00040000-557a-ce3c-e979-41676928759e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-557a-ce3c-7826-008b5e674fd3	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-557a-ce3c-cdb1-5b0fee69b726	BT	BTN	064	Bhutan 	Butan	\N
00040000-557a-ce3c-d432-7d2b0a681c1f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-557a-ce3c-171a-90b89688526c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-557a-ce3c-1a26-ed6956f7eeb6	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-557a-ce3c-8907-eaa25d1d25e7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-557a-ce3c-3e4b-8b121571fd8b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-557a-ce3c-99ba-3815ca3e521b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-557a-ce3c-1691-a7f8aabce78e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-557a-ce3c-a5f1-b766b6a800fd	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-557a-ce3c-a163-a59051411e77	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-557a-ce3c-f9e8-c1ee2e3f9a90	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-557a-ce3c-4d94-fdc47c2c7349	BI	BDI	108	Burundi 	Burundi 	\N
00040000-557a-ce3c-bdd4-66efc0eaa55b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-557a-ce3c-4f32-035b707fb9e0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-557a-ce3c-54f3-ef435e359a21	CA	CAN	124	Canada 	Kanada	\N
00040000-557a-ce3c-a01c-1f6c5ffae4e1	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-557a-ce3c-55bc-4ba93985c2b4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-557a-ce3c-d93d-00c949d2c4c0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-557a-ce3c-1ca9-32ba971c2aca	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-557a-ce3c-eccc-884a471bb9b9	CL	CHL	152	Chile 	Čile	\N
00040000-557a-ce3c-8daa-335472de7221	CN	CHN	156	China 	Kitajska	\N
00040000-557a-ce3c-d5e5-212cc3f85fec	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-557a-ce3c-a289-e8bbc1be5c0e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-557a-ce3c-0127-f8fb9ea5bbde	CO	COL	170	Colombia 	Kolumbija	\N
00040000-557a-ce3c-f9ae-61001fbddd08	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-557a-ce3c-a900-e73f40cc9f04	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-557a-ce3c-411d-297d2e4a4647	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-557a-ce3c-3bb7-be19532aac51	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-557a-ce3c-eeb5-c56bb5aa576a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-557a-ce3c-4683-b250b9d72195	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-557a-ce3c-244d-e447c2d19f96	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-557a-ce3c-8875-9e1a063ccffc	CU	CUB	192	Cuba 	Kuba	\N
00040000-557a-ce3c-8215-36107f8aa16a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-557a-ce3c-6036-84873737dc49	CY	CYP	196	Cyprus 	Ciper	\N
00040000-557a-ce3c-a499-1a9c8f58c391	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-557a-ce3c-87f0-a205525a6365	DK	DNK	208	Denmark 	Danska	\N
00040000-557a-ce3c-6580-48aac5e2d12f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-557a-ce3c-b144-736900e1e857	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-557a-ce3c-0579-75e604d44936	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-557a-ce3c-1337-0a45e0c7b34b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-557a-ce3c-5f68-4a8d8d02cae8	EG	EGY	818	Egypt 	Egipt	\N
00040000-557a-ce3c-8d39-8a052400f821	SV	SLV	222	El Salvador 	Salvador	\N
00040000-557a-ce3c-509a-1aee78937686	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-557a-ce3c-202a-1341d08f17a5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-557a-ce3c-2ea8-f486d64dbc70	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-557a-ce3c-4f50-78de105d91f9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-557a-ce3c-103f-91b2ca5666d5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-557a-ce3c-8c4c-380697944a46	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-557a-ce3c-787e-ac77c79de2be	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-557a-ce3c-14f3-3ee994d9aaad	FI	FIN	246	Finland 	Finska	\N
00040000-557a-ce3c-facc-0ece2107228b	FR	FRA	250	France 	Francija	\N
00040000-557a-ce3c-6a16-62885ce07ac7	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-557a-ce3c-3a1b-b2229ab4c117	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-557a-ce3c-effd-b096f5798997	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-557a-ce3c-eb19-90c391b74b7b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-557a-ce3c-eac1-d265dd0dc7a6	GA	GAB	266	Gabon 	Gabon	\N
00040000-557a-ce3c-63a7-43b84ab5bc2b	GM	GMB	270	Gambia 	Gambija	\N
00040000-557a-ce3c-ede8-01754e0cd7c0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-557a-ce3c-c9a8-f9d7cb3c8143	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-557a-ce3c-57a0-5a511b5ee1ce	GH	GHA	288	Ghana 	Gana	\N
00040000-557a-ce3c-1583-d91fcc001778	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-557a-ce3c-9f46-fe5effa7d312	GR	GRC	300	Greece 	Grčija	\N
00040000-557a-ce3c-3e19-5d37a1c40f6b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-557a-ce3c-6bad-7b5eebed968d	GD	GRD	308	Grenada 	Grenada	\N
00040000-557a-ce3c-aaf1-25fc83b4a9af	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-557a-ce3c-25ca-ed4c5ba8316e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-557a-ce3c-8087-565f0b85ba8b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-557a-ce3c-aa04-61a1371db354	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-557a-ce3c-f376-d138d578b34b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-557a-ce3c-07b1-b2aef3589a64	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-557a-ce3c-7f41-ec1f34022d33	GY	GUY	328	Guyana 	Gvajana	\N
00040000-557a-ce3c-d21e-1311685be2b4	HT	HTI	332	Haiti 	Haiti	\N
00040000-557a-ce3c-3238-59169bbbdb5c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-557a-ce3c-67ef-f0a8c6457aab	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-557a-ce3c-d4aa-99d792376444	HN	HND	340	Honduras 	Honduras	\N
00040000-557a-ce3c-2bfd-d703def9143f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-557a-ce3c-6719-4823a4c1a80e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-557a-ce3c-51b7-a0d3fc9c59d3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-557a-ce3c-24cb-262a6d03b68b	IN	IND	356	India 	Indija	\N
00040000-557a-ce3c-fbc6-fe9ef5ff6310	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-557a-ce3c-8974-d45842c9f95a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-557a-ce3c-e4e5-2ab8e065b9a1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-557a-ce3c-e3a9-3b3e532c7fee	IE	IRL	372	Ireland 	Irska	\N
00040000-557a-ce3c-f4be-6237013d333a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-557a-ce3c-e572-2dc0920e8018	IL	ISR	376	Israel 	Izrael	\N
00040000-557a-ce3c-80cf-3c328a1d0386	IT	ITA	380	Italy 	Italija	\N
00040000-557a-ce3c-098f-4c78b31ad8b9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-557a-ce3c-010a-9e112807f31e	JP	JPN	392	Japan 	Japonska	\N
00040000-557a-ce3c-3b6f-ac71d73a409a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-557a-ce3c-4f0a-3d450f0bad19	JO	JOR	400	Jordan 	Jordanija	\N
00040000-557a-ce3c-f430-b75cd45984fd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-557a-ce3c-4422-41440ecfed05	KE	KEN	404	Kenya 	Kenija	\N
00040000-557a-ce3c-7613-5e498bf0f4dc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-557a-ce3c-0925-f0a42c3df955	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-557a-ce3c-6bbe-79448876a658	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-557a-ce3c-26bb-2e619ea859e0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-557a-ce3c-4b2c-e7f8488dfb6c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-557a-ce3c-0e8c-02f3c1b0d699	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-557a-ce3c-dcbe-49aff6af2e7e	LV	LVA	428	Latvia 	Latvija	\N
00040000-557a-ce3c-fa8f-1632753131cc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-557a-ce3c-242f-84c7375ff03a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-557a-ce3c-2bd1-e2891a77049c	LR	LBR	430	Liberia 	Liberija	\N
00040000-557a-ce3c-e225-2afffe199e2d	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-557a-ce3c-6d64-7f35b568abdc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-557a-ce3c-b1db-181da9c9e99e	LT	LTU	440	Lithuania 	Litva	\N
00040000-557a-ce3c-62d0-5582f3f91eed	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-557a-ce3c-cb18-4b33b257bd7c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-557a-ce3c-905b-5fb8f058c5ac	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-557a-ce3c-1460-9391c76a7d38	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-557a-ce3c-d235-4ae86ce74e2e	MW	MWI	454	Malawi 	Malavi	\N
00040000-557a-ce3c-56e1-86993b60c43c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-557a-ce3c-b6a5-5589671e354d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-557a-ce3c-7e63-1716f96f08c3	ML	MLI	466	Mali 	Mali	\N
00040000-557a-ce3c-9950-a725774f1c56	MT	MLT	470	Malta 	Malta	\N
00040000-557a-ce3c-3c45-2231f0e36ebc	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-557a-ce3c-f8d1-1f9ef13f94e1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-557a-ce3c-8507-0771250ecfb7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-557a-ce3c-cb6b-e1a643e0d6f9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-557a-ce3c-a47f-afa716c7c098	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-557a-ce3c-4395-99b3547082a2	MX	MEX	484	Mexico 	Mehika	\N
00040000-557a-ce3c-5c85-77827166f6fd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-557a-ce3c-a39e-1821317a2051	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-557a-ce3c-ea55-911c645a8ecc	MC	MCO	492	Monaco 	Monako	\N
00040000-557a-ce3c-ce50-f9dea51f94bb	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-557a-ce3c-6458-16b786d28e74	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-557a-ce3c-74ff-6db4d7573431	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-557a-ce3c-a5e6-e23b11af6d37	MA	MAR	504	Morocco 	Maroko	\N
00040000-557a-ce3c-a30d-e63d4c67cd9e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-557a-ce3c-f7f1-455729741ada	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-557a-ce3c-ea2c-d694da63ff22	NA	NAM	516	Namibia 	Namibija	\N
00040000-557a-ce3c-4f8d-3678108c8bd1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-557a-ce3c-2384-9471f0dbc3fc	NP	NPL	524	Nepal 	Nepal	\N
00040000-557a-ce3c-c628-0425a9ea6ce7	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-557a-ce3c-c328-b79fe914b5f7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-557a-ce3c-6276-17c09bf3884f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-557a-ce3c-a5be-15825a0dd9fb	NE	NER	562	Niger 	Niger 	\N
00040000-557a-ce3c-0c6c-ce753d58802e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-557a-ce3c-5ba2-ac3435ac52a3	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-557a-ce3c-44ca-97d8e4eb0396	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-557a-ce3c-6e3e-d10a8c8fc112	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-557a-ce3c-64da-f52ab5a39689	NO	NOR	578	Norway 	Norveška	\N
00040000-557a-ce3c-7009-4ff11dcac06f	OM	OMN	512	Oman 	Oman	\N
00040000-557a-ce3c-e638-1b9e8ae88d01	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-557a-ce3c-2b39-99964d4125a9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-557a-ce3c-3332-372cc663470d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-557a-ce3c-9c81-e517857933aa	PA	PAN	591	Panama 	Panama	\N
00040000-557a-ce3c-fa7d-bbde0ebe64d9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-557a-ce3c-275e-07171bd1d697	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-557a-ce3c-138e-8af566274f3f	PE	PER	604	Peru 	Peru	\N
00040000-557a-ce3c-c2ba-07c85e0359e3	PH	PHL	608	Philippines 	Filipini	\N
00040000-557a-ce3c-b442-4c751b732ba6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-557a-ce3c-b93e-4ff9e098fabb	PL	POL	616	Poland 	Poljska	\N
00040000-557a-ce3c-ef21-1e5e45ae5f4f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-557a-ce3c-da2b-45fea7f20532	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-557a-ce3c-c37a-bf66a7058f92	QA	QAT	634	Qatar 	Katar	\N
00040000-557a-ce3c-fba9-c508efcf9b6d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-557a-ce3c-9d51-f181c02b732f	RO	ROU	642	Romania 	Romunija	\N
00040000-557a-ce3c-0412-807a26388ed0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-557a-ce3c-532e-c6ea97b397e0	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-557a-ce3c-209e-89007d910340	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-557a-ce3c-61bf-b1a2a775c6f0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-557a-ce3c-c4f1-bf97163d94e9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-557a-ce3c-bb75-4f2600dacc71	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-557a-ce3c-acad-e69e2e35fee4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-557a-ce3c-55a2-656c0e00f833	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-557a-ce3c-5e18-a4905f1374a0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-557a-ce3c-9f04-05d6fa59d099	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-557a-ce3c-843d-cfe4a3640505	SM	SMR	674	San Marino 	San Marino	\N
00040000-557a-ce3c-31c9-e0622cd23418	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-557a-ce3c-87d2-37027d865166	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-557a-ce3c-f642-cd634dd2cb21	SN	SEN	686	Senegal 	Senegal	\N
00040000-557a-ce3c-8724-9a85758f2da9	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-557a-ce3c-e728-5e8898e494a7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-557a-ce3c-87e7-506c370e474e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-557a-ce3c-17bc-381d47618a3c	SG	SGP	702	Singapore 	Singapur	\N
00040000-557a-ce3c-700a-fdc7703e47df	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-557a-ce3c-82d9-b99b8ab0ac93	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-557a-ce3c-62fd-3d9ca838debc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-557a-ce3c-c589-b2b435b9ccae	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-557a-ce3c-ad29-43b41c265851	SO	SOM	706	Somalia 	Somalija	\N
00040000-557a-ce3c-931d-21bd1ee63968	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-557a-ce3c-14d1-228f9f1d95e2	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-557a-ce3c-98dc-8306094695c7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-557a-ce3c-fe3f-780ce5dfb0f3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-557a-ce3c-69ec-006194c00301	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-557a-ce3c-21b0-b7edb803151c	SD	SDN	729	Sudan 	Sudan	\N
00040000-557a-ce3c-cee8-cddb8843f18e	SR	SUR	740	Suriname 	Surinam	\N
00040000-557a-ce3c-e5a1-ec9f9f9b765a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-557a-ce3c-6add-4badfd4fa48e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-557a-ce3c-e612-f7e8ee916a91	SE	SWE	752	Sweden 	Švedska	\N
00040000-557a-ce3c-85a2-238112799530	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-557a-ce3c-d509-d4daf0cb1e27	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-557a-ce3c-30be-5bdfc8513dba	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-557a-ce3c-6e14-658d99649f00	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-557a-ce3c-42fa-9c73c860aa65	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-557a-ce3c-355f-dc1a406ac3b0	TH	THA	764	Thailand 	Tajska	\N
00040000-557a-ce3c-6c28-8b874303399e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-557a-ce3c-a89e-308368f7af08	TG	TGO	768	Togo 	Togo	\N
00040000-557a-ce3c-a249-2f147df0a0ff	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-557a-ce3c-78d7-05b86880b328	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-557a-ce3c-4e4d-089c998bb71b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-557a-ce3c-5fbb-65ddd7a3bb9c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-557a-ce3c-997a-ce4e0162cd47	TR	TUR	792	Turkey 	Turčija	\N
00040000-557a-ce3c-d961-8b3bad923390	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-557a-ce3c-09b8-1d475c07d2a4	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-ce3c-d3bf-f73600b43e68	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-557a-ce3c-580f-a63c4b8e8266	UG	UGA	800	Uganda 	Uganda	\N
00040000-557a-ce3c-e750-88788f72ef5c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-557a-ce3c-bdd7-cc78d311c990	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-557a-ce3c-25df-3184257d1fd9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-557a-ce3c-6cb1-4f44eba0f3b9	US	USA	840	United States 	Združene države Amerike	\N
00040000-557a-ce3c-7d95-04e366a195cb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-557a-ce3c-2772-cc72cefe4347	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-557a-ce3c-6b11-75f1e47d5f81	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-557a-ce3c-4897-407759c48d12	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-557a-ce3c-8f07-b63310b6a302	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-557a-ce3c-6744-ac7aabc9d9a2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-557a-ce3c-8ff0-26f9d054f279	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-557a-ce3c-b101-15b5469ef0e8	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-557a-ce3c-c0df-0d48db2c4441	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-557a-ce3c-7587-23454e332f0d	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-557a-ce3c-05c7-8dfa8a2b9b86	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-557a-ce3c-7e64-0c2a32e10239	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-557a-ce3c-159e-3eb6ba472188	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2875 (class 0 OID 7087438)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7087241)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-557a-ce3d-e45b-301019f8a634	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-557a-ce3b-6fc0-c56e6028b863
000d0000-557a-ce3d-d879-d7799e124f21	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-ce3b-6fc0-c56e6028b863
000d0000-557a-ce3d-f1a3-7b12d95a39d0	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-557a-ce3b-2e0a-25e2aae31a4f
000d0000-557a-ce3d-3992-250b1a60549b	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-557a-ce3b-e175-3d4c338f036b
000d0000-557a-ce3d-e446-8cb7227ba017	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-557a-ce3b-e175-3d4c338f036b
000d0000-557a-ce3d-1144-502da9fdc789	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-557a-ce3b-e175-3d4c338f036b
000d0000-557a-ce3d-da6e-9cec57778a54	000e0000-557a-ce3d-4a3a-15d2348cad43	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-557a-ce3b-6fc0-c56e6028b863
\.


--
-- TOC entry 2839 (class 0 OID 7087061)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7087109)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7087041)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-557a-ce3d-4f6c-36e6496833e5	00080000-557a-ce3d-cd68-a491fa45087b	00090000-557a-ce3d-100d-f66e1b24e386	AK		
\.


--
-- TOC entry 2817 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 7087158)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7087183)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 7086998)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-557a-ce3c-6790-d37d61c0f9dc	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-557a-ce3c-7bb8-9878d6ce0679	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-557a-ce3c-6343-c4d683fb6b03	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-557a-ce3c-a306-7de5563b2b37	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-557a-ce3c-7aca-17e42ff4ea77	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-557a-ce3c-3bc1-86ee07aecfbb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-557a-ce3c-5065-278c15c8986d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-557a-ce3c-7cf6-3c6306933903	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-557a-ce3c-abed-693febc6a2ef	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-557a-ce3c-b942-ee804c014416	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-557a-ce3c-5733-915f32a41b83	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-557a-ce3c-732c-42562f8ea49d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-557a-ce3c-3f96-8658e8b2d7c1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-ce3c-c424-eb2cb0396a94	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-557a-ce3c-9e67-dcea607d6ae5	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-557a-ce3c-803b-0e018b45866a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2828 (class 0 OID 7086911)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-557a-ce3c-d6e3-e267e84294b4	00000000-557a-ce3c-7aca-17e42ff4ea77	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-557a-ce3c-10f2-f7bd3c54786f	00000000-557a-ce3c-7aca-17e42ff4ea77	00010000-557a-ce3c-ad88-04dc8c847b2c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-557a-ce3c-4074-540530aa2acd	00000000-557a-ce3c-3bc1-86ee07aecfbb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2829 (class 0 OID 7086922)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-557a-ce3d-11b3-4a3c730768ed	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-557a-ce3d-dd88-3555a4443683	00010000-557a-ce3d-5df8-72903fe8fa1b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-557a-ce3d-0fea-76781198a1e3	00010000-557a-ce3d-0c83-e916d57817cb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-557a-ce3d-bb7f-682f9fb82376	00010000-557a-ce3d-a954-27302b572715	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-557a-ce3d-0906-234bfcf9e426	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-557a-ce3d-bbfb-2c6971573691	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-557a-ce3d-ab1a-4fa8ef34bb57	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-557a-ce3d-6972-07925244e8d9	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-557a-ce3d-100d-f66e1b24e386	00010000-557a-ce3d-d28f-0c3fdfe9a474	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-557a-ce3d-4cc9-57e4d6ab62f4	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-557a-ce3d-b5dd-d720c5178386	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-557a-ce3d-8271-40a32724dd11	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-557a-ce3d-1169-d22e0608e427	00010000-557a-ce3d-77a1-e44eb416a0df	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2819 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 7086876)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-557a-ce3c-16ac-52b126986e6f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-557a-ce3c-22e8-66700f7ce227	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-557a-ce3c-8454-9f021f113bfe	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-557a-ce3c-419b-4c4c3e3dc9f0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-557a-ce3c-4de4-03a8c3be0edb	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-557a-ce3c-2eff-9e4bc9525716	Abonma-read	Abonma - branje	f
00030000-557a-ce3c-04c8-0a282d421f52	Abonma-write	Abonma - spreminjanje	f
00030000-557a-ce3c-b42b-bb27bb8c01c6	Alternacija-read	Alternacija - branje	f
00030000-557a-ce3c-4112-352ccec6c409	Alternacija-write	Alternacija - spreminjanje	f
00030000-557a-ce3c-090e-0d763c5d03c1	Arhivalija-read	Arhivalija - branje	f
00030000-557a-ce3c-71c6-cde93d11db61	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-557a-ce3c-36fb-bec66b275907	Besedilo-read	Besedilo - branje	f
00030000-557a-ce3c-0f06-67d74fe4400b	Besedilo-write	Besedilo - spreminjanje	f
00030000-557a-ce3c-1a25-161fe4214c5b	DogodekIzven-read	DogodekIzven - branje	f
00030000-557a-ce3c-1971-f7322e32c986	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-557a-ce3c-2e83-a351efe069ae	Dogodek-read	Dogodek - branje	f
00030000-557a-ce3c-1303-c51eb5e05bd3	Dogodek-write	Dogodek - spreminjanje	f
00030000-557a-ce3c-a744-56ce984b05f1	Drzava-read	Drzava - branje	f
00030000-557a-ce3c-fd21-115af796a723	Drzava-write	Drzava - spreminjanje	f
00030000-557a-ce3c-9038-ad4fcc79f8c5	Funkcija-read	Funkcija - branje	f
00030000-557a-ce3c-d7d7-bf947ec44b15	Funkcija-write	Funkcija - spreminjanje	f
00030000-557a-ce3c-32d3-d613bc334df6	Gostovanje-read	Gostovanje - branje	f
00030000-557a-ce3c-dffb-88e43242939b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-557a-ce3c-dc89-b3579233cffc	Gostujoca-read	Gostujoca - branje	f
00030000-557a-ce3c-8930-e6d06522985f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-557a-ce3c-3c13-9d8c27655e78	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-557a-ce3c-cac5-193bbaa1c424	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-557a-ce3c-0e3d-7fdb96387878	Kupec-read	Kupec - branje	f
00030000-557a-ce3c-17dd-66de585722e1	Kupec-write	Kupec - spreminjanje	f
00030000-557a-ce3c-c437-0a19af60d64c	NacinPlacina-read	NacinPlacina - branje	f
00030000-557a-ce3c-c2ba-e2dc58c25751	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-557a-ce3c-8e4b-e9d088d1c257	Option-read	Option - branje	f
00030000-557a-ce3c-6b9a-59f491b857ae	Option-write	Option - spreminjanje	f
00030000-557a-ce3c-a303-7bdf62a511ae	OptionValue-read	OptionValue - branje	f
00030000-557a-ce3c-1c17-09f644748059	OptionValue-write	OptionValue - spreminjanje	f
00030000-557a-ce3c-02a0-3868c074a41a	Oseba-read	Oseba - branje	f
00030000-557a-ce3c-dbfb-cd467bbb4e31	Oseba-write	Oseba - spreminjanje	f
00030000-557a-ce3c-7a2f-dcc61a1c38ec	Permission-read	Permission - branje	f
00030000-557a-ce3c-3f92-96081da0db1c	Permission-write	Permission - spreminjanje	f
00030000-557a-ce3c-cb3d-dc0b631421dc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-557a-ce3c-e4b7-605a8ad1ca0f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-557a-ce3c-371e-a5b4c3c7975e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-557a-ce3c-9b7a-534784f9e398	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-557a-ce3c-024c-0d9768fafde2	Pogodba-read	Pogodba - branje	f
00030000-557a-ce3c-eb81-01a86568254b	Pogodba-write	Pogodba - spreminjanje	f
00030000-557a-ce3c-7e98-5eecaf668b05	Popa-read	Popa - branje	f
00030000-557a-ce3c-0153-70c7514a5a1f	Popa-write	Popa - spreminjanje	f
00030000-557a-ce3c-83f9-692d32ee4eba	Posta-read	Posta - branje	f
00030000-557a-ce3c-7da3-0d14d7a1d435	Posta-write	Posta - spreminjanje	f
00030000-557a-ce3c-f3e2-4919f2c96b5b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-557a-ce3c-0922-e18946affea4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-557a-ce3c-55c6-998699e84068	PostniNaslov-read	PostniNaslov - branje	f
00030000-557a-ce3c-456b-d1a29b6d2a14	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-557a-ce3c-1f3d-8a49e8d4bc21	Predstava-read	Predstava - branje	f
00030000-557a-ce3c-d4d8-f4e3895f0edf	Predstava-write	Predstava - spreminjanje	f
00030000-557a-ce3c-f620-f3fd957ac583	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-557a-ce3c-0f73-f966cd9dabc7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-557a-ce3c-6139-ea0814946675	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-557a-ce3c-b808-5a92c91d9cd1	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-557a-ce3c-fe46-0af580ff87f8	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-557a-ce3c-fe02-9dbf4f6a01c3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-557a-ce3c-1f5f-30f247d1e255	ProgramDela-read	ProgramDela - branje	f
00030000-557a-ce3c-17d3-e0cd0e2cf84d	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-557a-ce3c-efc1-126fd97e4ae1	ProgramFestival-read	ProgramFestival - branje	f
00030000-557a-ce3c-e84c-d9bfdd10b633	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-557a-ce3c-94fd-2c2fd8e44a95	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-557a-ce3c-c1de-497cc477d03a	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-557a-ce3c-1602-1c40c49226ed	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-557a-ce3c-8ef5-767be0e098c7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-557a-ce3c-771f-128b5e6879e2	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-557a-ce3c-453f-b2409f55279b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-557a-ce3c-5550-750cac97bc1a	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-557a-ce3c-a5a9-a821d42bc985	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-557a-ce3c-01fb-3cc6e2e66155	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-557a-ce3c-185f-5b9417f3faa3	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-557a-ce3c-8012-e65520d75448	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-557a-ce3c-c4c5-92f52e21854e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-557a-ce3c-4e80-1854c0b9e73f	ProgramRazno-read	ProgramRazno - branje	f
00030000-557a-ce3c-c71b-2939b2a1b125	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-557a-ce3c-ecc5-25038d3e2b03	Prostor-read	Prostor - branje	f
00030000-557a-ce3c-c544-5c662be144fe	Prostor-write	Prostor - spreminjanje	f
00030000-557a-ce3c-e125-ebab86e3445f	Racun-read	Racun - branje	f
00030000-557a-ce3c-4e4a-b020070894fa	Racun-write	Racun - spreminjanje	f
00030000-557a-ce3c-f487-3fe12a69007a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-557a-ce3c-7446-d5dae929d521	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-557a-ce3c-81d1-2e240266669c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-557a-ce3c-4ca6-6f89bdc1776d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-557a-ce3c-e50e-c036d182a7ce	Rekvizit-read	Rekvizit - branje	f
00030000-557a-ce3c-a274-5b5f7669f305	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-557a-ce3c-56d7-b628857f034c	Revizija-read	Revizija - branje	f
00030000-557a-ce3c-2155-1dad1088c547	Revizija-write	Revizija - spreminjanje	f
00030000-557a-ce3c-0e3a-b7dcf9762c7e	Rezervacija-read	Rezervacija - branje	f
00030000-557a-ce3c-d9f1-964145e81f33	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-557a-ce3c-49fe-276c4289d8db	Role-read	Role - branje	f
00030000-557a-ce3c-cb49-ee1b32bbea38	Role-write	Role - spreminjanje	f
00030000-557a-ce3c-5406-78562e7bffb5	SedezniRed-read	SedezniRed - branje	f
00030000-557a-ce3c-fe17-addd7a9e5d8d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-557a-ce3c-d6e3-0d38bee4ecf8	Sedez-read	Sedez - branje	f
00030000-557a-ce3c-9e94-38d3b9aa05dc	Sedez-write	Sedez - spreminjanje	f
00030000-557a-ce3c-7d71-aac784fd8002	Sezona-read	Sezona - branje	f
00030000-557a-ce3c-2f68-75a36c5b6e73	Sezona-write	Sezona - spreminjanje	f
00030000-557a-ce3c-3a67-b989603c0d6e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-557a-ce3c-95c2-42c268a3e5b5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-557a-ce3c-8697-a786a5ea0b6f	Stevilcenje-read	Stevilcenje - branje	f
00030000-557a-ce3c-6838-b9dfed4fd351	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-557a-ce3c-4be3-f9fb37228921	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-557a-ce3c-9fa7-b64455321904	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-557a-ce3c-e1f4-3a1b61efb913	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-557a-ce3c-48d7-5716a477493a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-557a-ce3c-f9e5-74ccba6c2335	Telefonska-read	Telefonska - branje	f
00030000-557a-ce3c-d8f8-a0d15c34c399	Telefonska-write	Telefonska - spreminjanje	f
00030000-557a-ce3c-0f44-7129afd7285b	TerminStoritve-read	TerminStoritve - branje	f
00030000-557a-ce3c-295f-8254e28b379b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-557a-ce3c-f570-35e6ecd104a0	TipFunkcije-read	TipFunkcije - branje	f
00030000-557a-ce3c-fcdd-23195e0e485c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-557a-ce3c-0c76-45f2dffb0d2a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-557a-ce3c-5015-f99443df23e2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-557a-ce3c-fdca-737a0b1ac692	Trr-read	Trr - branje	f
00030000-557a-ce3c-7659-7529f649d47e	Trr-write	Trr - spreminjanje	f
00030000-557a-ce3c-30ca-7c0f26a50669	Uprizoritev-read	Uprizoritev - branje	f
00030000-557a-ce3c-714b-9e2e83b1dfc6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-557a-ce3c-c87d-1246cd779973	User-read	User - branje	f
00030000-557a-ce3c-7554-9dd8bb436f8f	User-write	User - spreminjanje	f
00030000-557a-ce3c-1fb2-e6b0c6f06b41	Vaja-read	Vaja - branje	f
00030000-557a-ce3c-82c4-58a689150169	Vaja-write	Vaja - spreminjanje	f
00030000-557a-ce3c-34f1-850b7de0bdb9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-557a-ce3c-59ae-d0a84b204b46	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-557a-ce3c-86fe-3e2b2cb45826	Zaposlitev-read	Zaposlitev - branje	f
00030000-557a-ce3c-09f7-1ecdbb6d1e6f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-557a-ce3c-d4e8-3c972a52b29a	Zasedenost-read	Zasedenost - branje	f
00030000-557a-ce3c-c2f1-7132cf8a74ce	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-557a-ce3c-3f66-5ac0834ab68c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-557a-ce3c-2255-6e85711aa5a7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-557a-ce3c-18f8-f882eb8ace17	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-557a-ce3c-c530-729a127d6762	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2826 (class 0 OID 7086895)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-557a-ce3c-e724-b084cf872fd6	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-2eff-9e4bc9525716
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-04c8-0a282d421f52
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-b42b-bb27bb8c01c6
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-4112-352ccec6c409
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-090e-0d763c5d03c1
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-2e83-a351efe069ae
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-419b-4c4c3e3dc9f0
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-1303-c51eb5e05bd3
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-fd21-115af796a723
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-9038-ad4fcc79f8c5
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-d7d7-bf947ec44b15
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-32d3-d613bc334df6
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-dffb-88e43242939b
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-dc89-b3579233cffc
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-8930-e6d06522985f
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-3c13-9d8c27655e78
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-cac5-193bbaa1c424
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-8e4b-e9d088d1c257
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-a303-7bdf62a511ae
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-02a0-3868c074a41a
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-dbfb-cd467bbb4e31
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-7e98-5eecaf668b05
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-0153-70c7514a5a1f
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-83f9-692d32ee4eba
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-7da3-0d14d7a1d435
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-55c6-998699e84068
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-456b-d1a29b6d2a14
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-1f3d-8a49e8d4bc21
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-d4d8-f4e3895f0edf
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-fe46-0af580ff87f8
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-fe02-9dbf4f6a01c3
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-ecc5-25038d3e2b03
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-c544-5c662be144fe
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-81d1-2e240266669c
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-4ca6-6f89bdc1776d
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-e50e-c036d182a7ce
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-a274-5b5f7669f305
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-7d71-aac784fd8002
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-2f68-75a36c5b6e73
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-f570-35e6ecd104a0
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-30ca-7c0f26a50669
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-714b-9e2e83b1dfc6
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-1fb2-e6b0c6f06b41
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-82c4-58a689150169
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-d4e8-3c972a52b29a
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-c2f1-7132cf8a74ce
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-3f66-5ac0834ab68c
00020000-557a-ce3c-d028-17fe722d6ea4	00030000-557a-ce3c-18f8-f882eb8ace17
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-2eff-9e4bc9525716
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-090e-0d763c5d03c1
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-2e83-a351efe069ae
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-32d3-d613bc334df6
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-dc89-b3579233cffc
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-3c13-9d8c27655e78
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-cac5-193bbaa1c424
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-8e4b-e9d088d1c257
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-a303-7bdf62a511ae
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-02a0-3868c074a41a
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-dbfb-cd467bbb4e31
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-7e98-5eecaf668b05
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-83f9-692d32ee4eba
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-55c6-998699e84068
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-456b-d1a29b6d2a14
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-1f3d-8a49e8d4bc21
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-ecc5-25038d3e2b03
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-81d1-2e240266669c
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-e50e-c036d182a7ce
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-7d71-aac784fd8002
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-f9e5-74ccba6c2335
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-d8f8-a0d15c34c399
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-fdca-737a0b1ac692
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-7659-7529f649d47e
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-86fe-3e2b2cb45826
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-09f7-1ecdbb6d1e6f
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-3f66-5ac0834ab68c
00020000-557a-ce3c-ae54-58547981e1ab	00030000-557a-ce3c-18f8-f882eb8ace17
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-2eff-9e4bc9525716
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-b42b-bb27bb8c01c6
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-090e-0d763c5d03c1
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-71c6-cde93d11db61
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-36fb-bec66b275907
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-1a25-161fe4214c5b
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-2e83-a351efe069ae
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-9038-ad4fcc79f8c5
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-32d3-d613bc334df6
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-dc89-b3579233cffc
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-3c13-9d8c27655e78
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-8e4b-e9d088d1c257
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-a303-7bdf62a511ae
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-02a0-3868c074a41a
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-7e98-5eecaf668b05
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-83f9-692d32ee4eba
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-1f3d-8a49e8d4bc21
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-fe46-0af580ff87f8
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-ecc5-25038d3e2b03
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-81d1-2e240266669c
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-e50e-c036d182a7ce
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-7d71-aac784fd8002
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-f570-35e6ecd104a0
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-1fb2-e6b0c6f06b41
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-d4e8-3c972a52b29a
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-3f66-5ac0834ab68c
00020000-557a-ce3c-a0d0-a7044b7ff7be	00030000-557a-ce3c-18f8-f882eb8ace17
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-2eff-9e4bc9525716
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-04c8-0a282d421f52
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-4112-352ccec6c409
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-090e-0d763c5d03c1
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-2e83-a351efe069ae
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-32d3-d613bc334df6
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-dc89-b3579233cffc
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-8e4b-e9d088d1c257
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-a303-7bdf62a511ae
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-7e98-5eecaf668b05
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-83f9-692d32ee4eba
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-1f3d-8a49e8d4bc21
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-ecc5-25038d3e2b03
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-81d1-2e240266669c
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-e50e-c036d182a7ce
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-7d71-aac784fd8002
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-f570-35e6ecd104a0
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-3f66-5ac0834ab68c
00020000-557a-ce3c-5fb1-13097cb7f309	00030000-557a-ce3c-18f8-f882eb8ace17
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-2eff-9e4bc9525716
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-090e-0d763c5d03c1
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-2e83-a351efe069ae
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-a744-56ce984b05f1
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-32d3-d613bc334df6
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-dc89-b3579233cffc
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-8e4b-e9d088d1c257
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-a303-7bdf62a511ae
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-7e98-5eecaf668b05
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-83f9-692d32ee4eba
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-1f3d-8a49e8d4bc21
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-ecc5-25038d3e2b03
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-81d1-2e240266669c
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-e50e-c036d182a7ce
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-7d71-aac784fd8002
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-0f44-7129afd7285b
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-8454-9f021f113bfe
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-f570-35e6ecd104a0
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-3f66-5ac0834ab68c
00020000-557a-ce3c-68e8-969d285bf298	00030000-557a-ce3c-18f8-f882eb8ace17
\.


--
-- TOC entry 2854 (class 0 OID 7087190)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 7087221)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7087357)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 7086955)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-557a-ce3d-cd68-a491fa45087b	00040000-557a-ce3c-aa2b-3eadbcfcd37e	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-ce3d-a614-c6f8cf41830e	00040000-557a-ce3c-aa2b-3eadbcfcd37e	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-ce3d-fd4e-28ff33e3b6e3	00040000-557a-ce3c-aa2b-3eadbcfcd37e	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-557a-ce3d-cc0c-abc894575748	00040000-557a-ce3c-aa2b-3eadbcfcd37e	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2833 (class 0 OID 7086990)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-557a-ce3b-0a2e-7eb841392708	8341	Adlešiči
00050000-557a-ce3b-acb9-7445f83c5db2	5270	Ajdovščina
00050000-557a-ce3b-023c-2380b7bcbac8	6280	Ankaran/Ancarano
00050000-557a-ce3b-1b56-61dfa07241e1	9253	Apače
00050000-557a-ce3b-8901-e601c8c5769e	8253	Artiče
00050000-557a-ce3b-19d1-356ccb2b9f24	4275	Begunje na Gorenjskem
00050000-557a-ce3b-ce30-fd2c54707c5e	1382	Begunje pri Cerknici
00050000-557a-ce3b-f3d4-46b456d37c89	9231	Beltinci
00050000-557a-ce3b-67d7-635e05206c83	2234	Benedikt
00050000-557a-ce3b-26a7-d58cd9121d71	2345	Bistrica ob Dravi
00050000-557a-ce3b-a771-d6f0a05edfa1	3256	Bistrica ob Sotli
00050000-557a-ce3b-4c09-e21554bbd58e	8259	Bizeljsko
00050000-557a-ce3b-917d-28d4ba5934b7	1223	Blagovica
00050000-557a-ce3b-416f-440068d8b52d	8283	Blanca
00050000-557a-ce3b-12b3-36f69b6f36f4	4260	Bled
00050000-557a-ce3b-e866-ced22a35cb1b	4273	Blejska Dobrava
00050000-557a-ce3b-7495-8c458b11b237	9265	Bodonci
00050000-557a-ce3b-9526-8b1f0e86e46f	9222	Bogojina
00050000-557a-ce3b-15f8-c573ee52d490	4263	Bohinjska Bela
00050000-557a-ce3b-7266-ae86390e1a02	4264	Bohinjska Bistrica
00050000-557a-ce3b-52a8-f78c96c79717	4265	Bohinjsko jezero
00050000-557a-ce3b-036c-2b27718db9f1	1353	Borovnica
00050000-557a-ce3b-6207-09a6527faf63	8294	Boštanj
00050000-557a-ce3b-a654-d1d2dafc306f	5230	Bovec
00050000-557a-ce3b-3edc-197eeb87feee	5295	Branik
00050000-557a-ce3b-52c1-5498ba6d97d6	3314	Braslovče
00050000-557a-ce3b-3dc3-af2562937a73	5223	Breginj
00050000-557a-ce3b-1d34-42d2416733bf	8280	Brestanica
00050000-557a-ce3b-c836-734543391cc5	2354	Bresternica
00050000-557a-ce3b-5414-e8b6d9015ddf	4243	Brezje
00050000-557a-ce3b-cb9f-579a3dee5dc6	1351	Brezovica pri Ljubljani
00050000-557a-ce3b-a0f9-d3523340b4b7	8250	Brežice
00050000-557a-ce3b-2678-5f8af644c11f	4210	Brnik - Aerodrom
00050000-557a-ce3b-7e57-8c4277b929d2	8321	Brusnice
00050000-557a-ce3b-75a7-36cacf7b057b	3255	Buče
00050000-557a-ce3b-ab4b-89bf7eb7d831	8276	Bučka 
00050000-557a-ce3b-61bc-e33e1b7ceeb5	9261	Cankova
00050000-557a-ce3b-da12-4d2be385f886	3000	Celje 
00050000-557a-ce3b-7144-27f601022cb1	3001	Celje - poštni predali
00050000-557a-ce3b-3edb-45c6405d4433	4207	Cerklje na Gorenjskem
00050000-557a-ce3b-3647-4810cbc9fe69	8263	Cerklje ob Krki
00050000-557a-ce3b-6763-e644adb32773	1380	Cerknica
00050000-557a-ce3b-1193-20232b49aa2f	5282	Cerkno
00050000-557a-ce3b-cb3d-8620da3dafd5	2236	Cerkvenjak
00050000-557a-ce3b-4c5a-ce8859776862	2215	Ceršak
00050000-557a-ce3b-523a-826cfbbb8edf	2326	Cirkovce
00050000-557a-ce3b-bbb9-bb91cb7bb13d	2282	Cirkulane
00050000-557a-ce3b-8d8e-3cb269531f0a	5273	Col
00050000-557a-ce3b-0199-d2d1d6521304	8251	Čatež ob Savi
00050000-557a-ce3b-4844-cf3460d922b6	1413	Čemšenik
00050000-557a-ce3b-9ad5-5dd696a9da4c	5253	Čepovan
00050000-557a-ce3b-1c14-265d007b9744	9232	Črenšovci
00050000-557a-ce3b-390e-d2655c255b9d	2393	Črna na Koroškem
00050000-557a-ce3b-2b0b-12f486763633	6275	Črni Kal
00050000-557a-ce3b-0450-07b47535a7a9	5274	Črni Vrh nad Idrijo
00050000-557a-ce3b-ec27-a07763b8009e	5262	Črniče
00050000-557a-ce3b-7993-a504aa382bfa	8340	Črnomelj
00050000-557a-ce3b-d074-303ed88b19c7	6271	Dekani
00050000-557a-ce3b-8117-da393a058bce	5210	Deskle
00050000-557a-ce3b-aba5-f129ce74440c	2253	Destrnik
00050000-557a-ce3b-2ce3-b9c2bd9c5bbe	6215	Divača
00050000-557a-ce3b-a81b-9d061509b930	1233	Dob
00050000-557a-ce3b-5090-0f340763b5eb	3224	Dobje pri Planini
00050000-557a-ce3b-ffd8-a9af0537da24	8257	Dobova
00050000-557a-ce3b-321e-be6ddd24e948	1423	Dobovec
00050000-557a-ce3b-9d4c-b8c9676017b8	5263	Dobravlje
00050000-557a-ce3b-1e13-e20c886421b6	3204	Dobrna
00050000-557a-ce3b-7899-d6686432bbb9	8211	Dobrnič
00050000-557a-ce3b-858d-18bf2fd27a25	1356	Dobrova
00050000-557a-ce3b-3594-c2454047a83b	9223	Dobrovnik/Dobronak 
00050000-557a-ce3b-159c-f7e365d4f2ad	5212	Dobrovo v Brdih
00050000-557a-ce3b-31bd-282724f2a5d5	1431	Dol pri Hrastniku
00050000-557a-ce3b-de31-eb0846bb4749	1262	Dol pri Ljubljani
00050000-557a-ce3b-6226-806b64ac217b	1273	Dole pri Litiji
00050000-557a-ce3b-7f7e-f11977d5026c	1331	Dolenja vas
00050000-557a-ce3b-8616-68d387ae173c	8350	Dolenjske Toplice
00050000-557a-ce3b-8ac4-5698b40b9ab5	1230	Domžale
00050000-557a-ce3b-0e96-0d9f0e78f7da	2252	Dornava
00050000-557a-ce3b-9a2f-bd782e99f7bb	5294	Dornberk
00050000-557a-ce3b-4f77-fa52fc0e0de7	1319	Draga
00050000-557a-ce3b-ab72-d53d2e1e859c	8343	Dragatuš
00050000-557a-ce3b-55fe-50a40a82afef	3222	Dramlje
00050000-557a-ce3b-8d4d-82fcdb2161b7	2370	Dravograd
00050000-557a-ce3b-95d1-f80090c602e3	4203	Duplje
00050000-557a-ce3b-8ea0-2c6bbe3e57ad	6221	Dutovlje
00050000-557a-ce3b-9854-1a8a00485576	8361	Dvor
00050000-557a-ce3b-7fdc-0dcf0176d350	2343	Fala
00050000-557a-ce3b-261f-0f72ab137640	9208	Fokovci
00050000-557a-ce3b-98ad-08d53c7d0a99	2313	Fram
00050000-557a-ce3b-8f23-8352ecd5c7a2	3213	Frankolovo
00050000-557a-ce3b-8504-274bb60b9abf	1274	Gabrovka
00050000-557a-ce3b-edd0-072160759f9f	8254	Globoko
00050000-557a-ce3b-1003-2183b956e9e8	5275	Godovič
00050000-557a-ce3b-9eb4-941703959568	4204	Golnik
00050000-557a-ce3b-8e3a-48368e37a6b6	3303	Gomilsko
00050000-557a-ce3b-88c9-275764c254ac	4224	Gorenja vas
00050000-557a-ce3b-459a-73f995291e25	3263	Gorica pri Slivnici
00050000-557a-ce3b-d497-f741ee38bd61	2272	Gorišnica
00050000-557a-ce3b-b8ab-0969b15e7c30	9250	Gornja Radgona
00050000-557a-ce3b-8cc8-6c97b0201007	3342	Gornji Grad
00050000-557a-ce3b-7f20-b9167fafd192	4282	Gozd Martuljek
00050000-557a-ce3b-5752-3319623c331d	6272	Gračišče
00050000-557a-ce3b-b039-7e89bf4f1a6a	9264	Grad
00050000-557a-ce3b-9744-d3e16bead11f	8332	Gradac
00050000-557a-ce3b-bdf7-82a431d8c2ab	1384	Grahovo
00050000-557a-ce3b-43a4-44a63520c22a	5242	Grahovo ob Bači
00050000-557a-ce3b-7b3d-be7f38ee155e	5251	Grgar
00050000-557a-ce3b-69f7-78ed23ee9cac	3302	Griže
00050000-557a-ce3b-9d58-b952b6179a50	3231	Grobelno
00050000-557a-ce3b-b25c-d86ef97dbdb1	1290	Grosuplje
00050000-557a-ce3b-5a41-4a3e7900e8f7	2288	Hajdina
00050000-557a-ce3b-32d7-6d8e5f3d0b4f	8362	Hinje
00050000-557a-ce3b-0434-8c8e78c12fa8	2311	Hoče
00050000-557a-ce3b-968e-9928a77d015f	9205	Hodoš/Hodos
00050000-557a-ce3b-2136-861fbe1bd67d	1354	Horjul
00050000-557a-ce3b-ae14-76bf65ae3bbf	1372	Hotedršica
00050000-557a-ce3b-2ced-792fe27ced29	1430	Hrastnik
00050000-557a-ce3b-5dce-6e097118a1dd	6225	Hruševje
00050000-557a-ce3b-5ec9-3f0e954790c8	4276	Hrušica
00050000-557a-ce3b-44fe-a7ec7d6a9b76	5280	Idrija
00050000-557a-ce3b-5d00-7f5f1eb6b193	1292	Ig
00050000-557a-ce3b-8059-694d6e79cd85	6250	Ilirska Bistrica
00050000-557a-ce3b-9b6b-d6dca4749258	6251	Ilirska Bistrica-Trnovo
00050000-557a-ce3b-e2f6-b1c26eabc7a8	1295	Ivančna Gorica
00050000-557a-ce3b-fffd-3ca36191c4fa	2259	Ivanjkovci
00050000-557a-ce3b-35e4-3b4d6dfc8813	1411	Izlake
00050000-557a-ce3b-9ebf-d45f4289ac0d	6310	Izola/Isola
00050000-557a-ce3b-ea38-33f9539d93a2	2222	Jakobski Dol
00050000-557a-ce3b-816b-c7ca3faaf8e3	2221	Jarenina
00050000-557a-ce3b-9d45-26e12dc0319f	6254	Jelšane
00050000-557a-ce3b-3931-6dc97348781f	4270	Jesenice
00050000-557a-ce3b-1bec-982d23a19617	8261	Jesenice na Dolenjskem
00050000-557a-ce3b-a325-ed1bb2b155f4	3273	Jurklošter
00050000-557a-ce3b-76c9-33654cb80eb5	2223	Jurovski Dol
00050000-557a-ce3b-04b9-f8d64154bd82	2256	Juršinci
00050000-557a-ce3b-bc68-5ca227117623	5214	Kal nad Kanalom
00050000-557a-ce3b-510c-8718f1f41419	3233	Kalobje
00050000-557a-ce3b-3cf4-42252a125222	4246	Kamna Gorica
00050000-557a-ce3b-df07-0ecea34a83fa	2351	Kamnica
00050000-557a-ce3b-686f-edd7f235de81	1241	Kamnik
00050000-557a-ce3b-917a-dcc672bdc1ca	5213	Kanal
00050000-557a-ce3b-a8a4-51b9bc8af8fc	8258	Kapele
00050000-557a-ce3b-b966-f277399bda9d	2362	Kapla
00050000-557a-ce3b-bf02-c862d4d20d09	2325	Kidričevo
00050000-557a-ce3b-1275-523eb8409576	1412	Kisovec
00050000-557a-ce3b-f64e-32128511dd05	6253	Knežak
00050000-557a-ce3b-1b9c-79019e4457ea	5222	Kobarid
00050000-557a-ce3b-8484-282830677b39	9227	Kobilje
00050000-557a-ce3b-51e5-409ff806500a	1330	Kočevje
00050000-557a-ce3b-fccd-66f9d7f05dcf	1338	Kočevska Reka
00050000-557a-ce3b-e597-61d390649cc9	2276	Kog
00050000-557a-ce3b-acc6-199712d5978f	5211	Kojsko
00050000-557a-ce3b-4f15-5c8fd0ff3d22	6223	Komen
00050000-557a-ce3b-6240-871b0a532117	1218	Komenda
00050000-557a-ce3b-64c5-5036223be302	6000	Koper/Capodistria 
00050000-557a-ce3b-8134-3f79f7bbb40a	6001	Koper/Capodistria - poštni predali
00050000-557a-ce3b-a478-5edc51fa319b	8282	Koprivnica
00050000-557a-ce3b-b3ae-aa5c92a07bda	5296	Kostanjevica na Krasu
00050000-557a-ce3b-5a7b-50148a554ee8	8311	Kostanjevica na Krki
00050000-557a-ce3b-6ec2-1a2fa3812e84	1336	Kostel
00050000-557a-ce3b-4fb5-e27f53bd5f0c	6256	Košana
00050000-557a-ce3b-e105-9ae2ec3fb932	2394	Kotlje
00050000-557a-ce3b-f5c9-6d93c723f894	6240	Kozina
00050000-557a-ce3b-49a9-37aad93de521	3260	Kozje
00050000-557a-ce3b-0609-b97427b533ba	4000	Kranj 
00050000-557a-ce3b-c701-49403757ee64	4001	Kranj - poštni predali
00050000-557a-ce3b-8ad1-1b52f9bb4714	4280	Kranjska Gora
00050000-557a-ce3b-1146-e13ddf6c0aab	1281	Kresnice
00050000-557a-ce3b-46e5-d819b5d5f3fe	4294	Križe
00050000-557a-ce3b-1bd1-2de6e44009a8	9206	Križevci
00050000-557a-ce3b-f523-1a303bd00099	9242	Križevci pri Ljutomeru
00050000-557a-ce3b-8f5d-851e0ee46c42	1301	Krka
00050000-557a-ce3b-dcd0-3cd9f7c675e5	8296	Krmelj
00050000-557a-ce3b-437f-955bc0224a96	4245	Kropa
00050000-557a-ce3b-748f-2c7da4b95160	8262	Krška vas
00050000-557a-ce3b-a6f3-905a3cb4e4ae	8270	Krško
00050000-557a-ce3b-0558-b104b7c7674f	9263	Kuzma
00050000-557a-ce3b-3461-d613f9fd6732	2318	Laporje
00050000-557a-ce3b-ad50-e4b5f3aa805a	3270	Laško
00050000-557a-ce3b-47f8-f42dcd2e2e65	1219	Laze v Tuhinju
00050000-557a-ce3b-7dce-084b5928b24a	2230	Lenart v Slovenskih goricah
00050000-557a-ce3b-2b0c-e1f4a465b3de	9220	Lendava/Lendva
00050000-557a-ce3b-59e6-3ecc10aaf412	4248	Lesce
00050000-557a-ce3b-29b3-daa938124af9	3261	Lesično
00050000-557a-ce3b-8fe6-a2ca484a9b63	8273	Leskovec pri Krškem
00050000-557a-ce3b-87f2-fa3bc59bc599	2372	Libeliče
00050000-557a-ce3b-b946-9a3849272c0a	2341	Limbuš
00050000-557a-ce3b-1b45-7538c616e2f2	1270	Litija
00050000-557a-ce3b-00a8-d7c67806453e	3202	Ljubečna
00050000-557a-ce3b-0d3e-8e7ff393d44c	1000	Ljubljana 
00050000-557a-ce3b-6642-b9387f301ef3	1001	Ljubljana - poštni predali
00050000-557a-ce3b-c948-4aeb1a3bc695	1231	Ljubljana - Črnuče
00050000-557a-ce3b-eb2a-c9a28f9ac2a5	1261	Ljubljana - Dobrunje
00050000-557a-ce3b-10e5-37829cffbd20	1260	Ljubljana - Polje
00050000-557a-ce3b-67fc-ebfffed14e3f	1210	Ljubljana - Šentvid
00050000-557a-ce3b-a7b7-bf3761b2a3e8	1211	Ljubljana - Šmartno
00050000-557a-ce3b-dc86-94e082d33612	3333	Ljubno ob Savinji
00050000-557a-ce3b-ed16-38da89be3c88	9240	Ljutomer
00050000-557a-ce3b-7ec2-f51dd56408a0	3215	Loče
00050000-557a-ce3b-9dba-58ec1120675b	5231	Log pod Mangartom
00050000-557a-ce3b-4150-0f634baa66ce	1358	Log pri Brezovici
00050000-557a-ce3b-b7e2-ee1200ef0935	1370	Logatec
00050000-557a-ce3b-d551-683f4e9c280e	1371	Logatec
00050000-557a-ce3b-c3a5-fbfcb4e47f4e	1434	Loka pri Zidanem Mostu
00050000-557a-ce3b-2045-ee0b52069730	3223	Loka pri Žusmu
00050000-557a-ce3b-62f5-d3f105e27351	6219	Lokev
00050000-557a-ce3b-2c17-82239ef70b07	1318	Loški Potok
00050000-557a-ce3b-2ddc-b223dc2e56dd	2324	Lovrenc na Dravskem polju
00050000-557a-ce3b-0b21-e521d868e295	2344	Lovrenc na Pohorju
00050000-557a-ce3b-01dc-3efc9ae6e12b	3334	Luče
00050000-557a-ce3b-b1da-04426ac528d6	1225	Lukovica
00050000-557a-ce3b-2cdf-1d57ecce6ee2	9202	Mačkovci
00050000-557a-ce3b-df40-e15b5471bb34	2322	Majšperk
00050000-557a-ce3b-c2ac-b271b4a989a5	2321	Makole
00050000-557a-ce3b-8a11-ab554a2bec2f	9243	Mala Nedelja
00050000-557a-ce3b-3337-b020fdb8311f	2229	Malečnik
00050000-557a-ce3b-aef3-cf6a7cd5ba58	6273	Marezige
00050000-557a-ce3b-b414-694825e6bbd6	2000	Maribor 
00050000-557a-ce3b-62f9-674444102727	2001	Maribor - poštni predali
00050000-557a-ce3b-8d9d-1207fc52e5bf	2206	Marjeta na Dravskem polju
00050000-557a-ce3b-9590-e6e8978d2621	2281	Markovci
00050000-557a-ce3b-c6f2-9cafe496e45c	9221	Martjanci
00050000-557a-ce3b-f8f0-3f5679732009	6242	Materija
00050000-557a-ce3b-08e5-636213bd7a31	4211	Mavčiče
00050000-557a-ce3b-0f89-fb478b3cefee	1215	Medvode
00050000-557a-ce3b-2118-257f7c868019	1234	Mengeš
00050000-557a-ce3b-cf2a-62c07e9749c3	8330	Metlika
00050000-557a-ce3b-f271-24462fe37ba6	2392	Mežica
00050000-557a-ce3b-21ce-15369b3eb96e	2204	Miklavž na Dravskem polju
00050000-557a-ce3b-c514-e54702fc0304	2275	Miklavž pri Ormožu
00050000-557a-ce3b-25d2-5779a1239059	5291	Miren
00050000-557a-ce3b-83bf-7c115c50ea4e	8233	Mirna
00050000-557a-ce3b-2af1-7dc28e1c05eb	8216	Mirna Peč
00050000-557a-ce3b-81d9-63125abf8d20	2382	Mislinja
00050000-557a-ce3b-e82d-c3fedd239fdf	4281	Mojstrana
00050000-557a-ce3b-52f5-0e4a2de20002	8230	Mokronog
00050000-557a-ce3b-5b57-6eee71259b8f	1251	Moravče
00050000-557a-ce3b-89bb-00c036c7eed3	9226	Moravske Toplice
00050000-557a-ce3b-c3ac-6d80f3fd8bea	5216	Most na Soči
00050000-557a-ce3b-d09c-0ee46c8fdf8e	1221	Motnik
00050000-557a-ce3b-1031-05e60037ea4b	3330	Mozirje
00050000-557a-ce3b-a571-614a5d20a53c	9000	Murska Sobota 
00050000-557a-ce3b-86e1-8f9213cad898	9001	Murska Sobota - poštni predali
00050000-557a-ce3b-e3c3-84211f1333aa	2366	Muta
00050000-557a-ce3b-0c39-8b3485c75f0d	4202	Naklo
00050000-557a-ce3b-04d1-18d5bb6fb15b	3331	Nazarje
00050000-557a-ce3b-16bf-97a614b094ff	1357	Notranje Gorice
00050000-557a-ce3b-c796-3156ca5b17bc	3203	Nova Cerkev
00050000-557a-ce3b-bb77-070a2c407d61	5000	Nova Gorica 
00050000-557a-ce3b-a351-bae6f9cf4297	5001	Nova Gorica - poštni predali
00050000-557a-ce3b-dcef-7bf9f4267699	1385	Nova vas
00050000-557a-ce3b-8865-df820e096ccc	8000	Novo mesto
00050000-557a-ce3b-34dd-aabffb21a493	8001	Novo mesto - poštni predali
00050000-557a-ce3b-7c33-22bc9a7de09d	6243	Obrov
00050000-557a-ce3b-9c32-2b9ba4c306aa	9233	Odranci
00050000-557a-ce3b-0fef-b6d123393e0d	2317	Oplotnica
00050000-557a-ce3b-4736-647f3ccc294f	2312	Orehova vas
00050000-557a-ce3b-12c5-6afeebb39236	2270	Ormož
00050000-557a-ce3b-8fbe-018d2b609897	1316	Ortnek
00050000-557a-ce3b-c5d3-8b8eec047f91	1337	Osilnica
00050000-557a-ce3b-381d-73fe461615a3	8222	Otočec
00050000-557a-ce3b-9186-43bfb0e73f20	2361	Ožbalt
00050000-557a-ce3b-7bdb-fa68283ca857	2231	Pernica
00050000-557a-ce3b-f0cf-63758e0fdc1d	2211	Pesnica pri Mariboru
00050000-557a-ce3b-6ed0-fe374d31da10	9203	Petrovci
00050000-557a-ce3b-988e-638b23e0fdc9	3301	Petrovče
00050000-557a-ce3b-d088-3f755e6abd96	6330	Piran/Pirano
00050000-557a-ce3b-d588-d99649f8dc59	8255	Pišece
00050000-557a-ce3b-5608-8c040e04a1d8	6257	Pivka
00050000-557a-ce3b-a5b2-a47e3ce59a07	6232	Planina
00050000-557a-ce3b-5dd3-6740281df7ca	3225	Planina pri Sevnici
00050000-557a-ce3b-9abb-d372afb5dae7	6276	Pobegi
00050000-557a-ce3b-1e6a-6d4ce76b85a2	8312	Podbočje
00050000-557a-ce3b-ac4f-8a6c4fb07f47	5243	Podbrdo
00050000-557a-ce3b-b87f-39207b14f885	3254	Podčetrtek
00050000-557a-ce3b-40b9-fe6911d4b762	2273	Podgorci
00050000-557a-ce3b-6edc-e61e389769ff	6216	Podgorje
00050000-557a-ce3b-e02b-b039a3748612	2381	Podgorje pri Slovenj Gradcu
00050000-557a-ce3b-7583-7c6bdc86c524	6244	Podgrad
00050000-557a-ce3b-0bb4-b013f00371f7	1414	Podkum
00050000-557a-ce3b-0c27-580e5edb7320	2286	Podlehnik
00050000-557a-ce3b-f6d8-ff536eacc1bc	5272	Podnanos
00050000-557a-ce3b-f42f-71ef7b0f2f09	4244	Podnart
00050000-557a-ce3b-1ded-275c122f36aa	3241	Podplat
00050000-557a-ce3b-173a-98465b4b3df2	3257	Podsreda
00050000-557a-ce3b-1572-893ea1d2a2cf	2363	Podvelka
00050000-557a-ce3b-17d0-deb72f0a0ffa	2208	Pohorje
00050000-557a-ce3b-d7f5-8292e6f99278	2257	Polenšak
00050000-557a-ce3b-e118-c65af7a354c6	1355	Polhov Gradec
00050000-557a-ce3b-6034-5461a65f078d	4223	Poljane nad Škofjo Loko
00050000-557a-ce3b-8b40-ebcf48b7ae80	2319	Poljčane
00050000-557a-ce3b-dc4f-31e060c0d4fb	1272	Polšnik
00050000-557a-ce3b-5574-a62939435db3	3313	Polzela
00050000-557a-ce3b-cfa1-657e4fa00f7f	3232	Ponikva
00050000-557a-ce3b-b9ed-df1592e4266c	6320	Portorož/Portorose
00050000-557a-ce3b-4057-d5a8a5cf6c93	6230	Postojna
00050000-557a-ce3b-4544-131209a6d838	2331	Pragersko
00050000-557a-ce3b-645b-477bcdf8e319	3312	Prebold
00050000-557a-ce3b-e68c-e35e4c2c4b7a	4205	Preddvor
00050000-557a-ce3b-3ce3-28b5f814d96f	6255	Prem
00050000-557a-ce3b-17a6-505d0fec2f82	1352	Preserje
00050000-557a-ce3b-b40d-60efa2ea2f98	6258	Prestranek
00050000-557a-ce3b-cb8f-a016b01a8bb3	2391	Prevalje
00050000-557a-ce3b-c390-eaa0a9cd8df0	3262	Prevorje
00050000-557a-ce3b-9c7c-758c2151e506	1276	Primskovo 
00050000-557a-ce3b-dd7e-81c2473b2490	3253	Pristava pri Mestinju
00050000-557a-ce3b-3ad6-a69bf64fd0ee	9207	Prosenjakovci/Partosfalva
00050000-557a-ce3b-9279-b50aa2cb7b89	5297	Prvačina
00050000-557a-ce3b-f09a-021b47ec773e	2250	Ptuj
00050000-557a-ce3b-745d-1b438f008230	2323	Ptujska Gora
00050000-557a-ce3b-dfbc-b289d12da4b4	9201	Puconci
00050000-557a-ce3b-3103-05e5efe0a8d3	2327	Rače
00050000-557a-ce3b-1702-93a1bfe015e5	1433	Radeče
00050000-557a-ce3b-fec7-a21e18ef39bd	9252	Radenci
00050000-557a-ce3b-3dfe-77d14bd08f29	2360	Radlje ob Dravi
00050000-557a-ce3b-9e47-3930a113643c	1235	Radomlje
00050000-557a-ce3b-ad7c-de97758469c2	4240	Radovljica
00050000-557a-ce3b-d10d-97b020c9b38e	8274	Raka
00050000-557a-ce3b-1762-0bde687bddc8	1381	Rakek
00050000-557a-ce3b-634b-9f3cc4724079	4283	Rateče - Planica
00050000-557a-ce3b-19b4-50c76c6dda96	2390	Ravne na Koroškem
00050000-557a-ce3b-33b6-745006c43166	9246	Razkrižje
00050000-557a-ce3b-6287-43f0a2131c6a	3332	Rečica ob Savinji
00050000-557a-ce3b-2f0e-8f94639bc29a	5292	Renče
00050000-557a-ce3b-2cf0-9f6e7322212a	1310	Ribnica
00050000-557a-ce3b-7a1c-760f8acc7e99	2364	Ribnica na Pohorju
00050000-557a-ce3b-fae5-a77fede9d1f5	3272	Rimske Toplice
00050000-557a-ce3b-cbe8-3a220e2a3302	1314	Rob
00050000-557a-ce3b-e98d-fe5bb0775ff4	5215	Ročinj
00050000-557a-ce3b-797a-056d9684c338	3250	Rogaška Slatina
00050000-557a-ce3b-f43a-dcd7ccfe27aa	9262	Rogašovci
00050000-557a-ce3b-b5f0-5265dd4f20b6	3252	Rogatec
00050000-557a-ce3b-9615-cabe893b5175	1373	Rovte
00050000-557a-ce3b-2c66-f8722dffeddc	2342	Ruše
00050000-557a-ce3b-d705-74b8a1229b6a	1282	Sava
00050000-557a-ce3b-11df-f4622e8d0185	6333	Sečovlje/Sicciole
00050000-557a-ce3b-11b6-5e0cbb03e83e	4227	Selca
00050000-557a-ce3b-15cc-30a79ad688da	2352	Selnica ob Dravi
00050000-557a-ce3b-cb0c-4fbf3ba796df	8333	Semič
00050000-557a-ce3b-ecce-8403fde1d1f7	8281	Senovo
00050000-557a-ce3b-2225-ba4b57da5acc	6224	Senožeče
00050000-557a-ce3b-6fe9-09e619bafca8	8290	Sevnica
00050000-557a-ce3b-f1fa-4215a8d66605	6210	Sežana
00050000-557a-ce3b-56a2-24751c736eec	2214	Sladki Vrh
00050000-557a-ce3b-4b6f-a5fc2cdcce7e	5283	Slap ob Idrijci
00050000-557a-ce3b-ed00-c95beeec1e3a	2380	Slovenj Gradec
00050000-557a-ce3b-76eb-78fa28b1f77a	2310	Slovenska Bistrica
00050000-557a-ce3b-56db-c5de289c8eb6	3210	Slovenske Konjice
00050000-557a-ce3b-8617-52143c8875d6	1216	Smlednik
00050000-557a-ce3b-328b-d39e343577e2	5232	Soča
00050000-557a-ce3b-8e3a-126897b3d3ec	1317	Sodražica
00050000-557a-ce3b-fc97-9769155347d2	3335	Solčava
00050000-557a-ce3b-4f69-fff2a3e37df0	5250	Solkan
00050000-557a-ce3b-dc1b-e5e14de21f2f	4229	Sorica
00050000-557a-ce3b-7488-0b50739e05a7	4225	Sovodenj
00050000-557a-ce3b-87d3-75ac88112b1f	5281	Spodnja Idrija
00050000-557a-ce3b-d340-e67a381e389c	2241	Spodnji Duplek
00050000-557a-ce3b-a073-85eb27955598	9245	Spodnji Ivanjci
00050000-557a-ce3b-a320-ee357412be42	2277	Središče ob Dravi
00050000-557a-ce3b-238f-da2711dc2a50	4267	Srednja vas v Bohinju
00050000-557a-ce3b-4807-e3556ced5886	8256	Sromlje 
00050000-557a-ce3b-8296-3b9ff8736bd3	5224	Srpenica
00050000-557a-ce3b-ea84-aecfba64d38a	1242	Stahovica
00050000-557a-ce3b-bb04-4a0c5ddefa73	1332	Stara Cerkev
00050000-557a-ce3b-6401-caa327a40b65	8342	Stari trg ob Kolpi
00050000-557a-ce3b-8b62-c8db190fb325	1386	Stari trg pri Ložu
00050000-557a-ce3b-9838-ba50fd6f88f8	2205	Starše
00050000-557a-ce3b-1496-cca547f77033	2289	Stoperce
00050000-557a-ce3b-4dc5-a73f1450b9dc	8322	Stopiče
00050000-557a-ce3b-e6f1-46dbada0b412	3206	Stranice
00050000-557a-ce3b-4709-d45571b757dc	8351	Straža
00050000-557a-ce3b-2d71-9aa7abe0a2dc	1313	Struge
00050000-557a-ce3b-5569-130bd7859e8d	8293	Studenec
00050000-557a-ce3b-f793-b1f89c5d0ccb	8331	Suhor
00050000-557a-ce3b-7336-6b4f384393c0	2233	Sv. Ana v Slovenskih goricah
00050000-557a-ce3b-020c-109c73f430ed	2235	Sv. Trojica v Slovenskih goricah
00050000-557a-ce3b-a426-2615e2a8995b	2353	Sveti Duh na Ostrem Vrhu
00050000-557a-ce3b-3ddd-2ff88c9e4139	9244	Sveti Jurij ob Ščavnici
00050000-557a-ce3b-f365-1d2fa18d66ea	3264	Sveti Štefan
00050000-557a-ce3b-8c84-94c0b5a8add0	2258	Sveti Tomaž
00050000-557a-ce3b-f97a-5ecb4a86516a	9204	Šalovci
00050000-557a-ce3b-4168-ab6418f1eedf	5261	Šempas
00050000-557a-ce3b-6d58-830186ce6a33	5290	Šempeter pri Gorici
00050000-557a-ce3b-5ed0-53e050251c0d	3311	Šempeter v Savinjski dolini
00050000-557a-ce3b-78b2-422f4fafdd2c	4208	Šenčur
00050000-557a-ce3b-a57b-87e742c170eb	2212	Šentilj v Slovenskih goricah
00050000-557a-ce3b-084e-ad511867026b	8297	Šentjanž
00050000-557a-ce3b-c7ce-db07c994c55f	2373	Šentjanž pri Dravogradu
00050000-557a-ce3b-2a2a-5ea4e156c9c9	8310	Šentjernej
00050000-557a-ce3b-a496-831a5109a7ef	3230	Šentjur
00050000-557a-ce3b-286a-41751c9302a0	3271	Šentrupert
00050000-557a-ce3b-4dfb-81f801d0b61f	8232	Šentrupert
00050000-557a-ce3b-c2ad-ffd073075a08	1296	Šentvid pri Stični
00050000-557a-ce3b-b6af-f87a8f088596	8275	Škocjan
00050000-557a-ce3b-6fd0-ff0b161ee3de	6281	Škofije
00050000-557a-ce3b-771b-0e6ec0e15fc7	4220	Škofja Loka
00050000-557a-ce3b-eab5-1ee40e8a8032	3211	Škofja vas
00050000-557a-ce3b-c10d-2f9506cf0ea5	1291	Škofljica
00050000-557a-ce3b-87de-09d78cfb5811	6274	Šmarje
00050000-557a-ce3b-362d-9d8c753d38dd	1293	Šmarje - Sap
00050000-557a-ce3b-d1a6-018b53dfc71f	3240	Šmarje pri Jelšah
00050000-557a-ce3b-9b3a-b75d6ba8a620	8220	Šmarješke Toplice
00050000-557a-ce3b-52fd-d6441c10962f	2315	Šmartno na Pohorju
00050000-557a-ce3b-9dd5-8fdb38ed2cbc	3341	Šmartno ob Dreti
00050000-557a-ce3b-482a-40aa57350cb7	3327	Šmartno ob Paki
00050000-557a-ce3b-7f31-5a0815f4497c	1275	Šmartno pri Litiji
00050000-557a-ce3b-bbc5-ab80717cf62f	2383	Šmartno pri Slovenj Gradcu
00050000-557a-ce3b-9449-4efd057f686b	3201	Šmartno v Rožni dolini
00050000-557a-ce3b-25cb-d78d721ccc03	3325	Šoštanj
00050000-557a-ce3b-cc04-f49bc211905a	6222	Štanjel
00050000-557a-ce3b-7b94-cf4108ca0468	3220	Štore
00050000-557a-ce3b-ea85-8d453494058f	3304	Tabor
00050000-557a-ce3b-5b3a-f2ef48ebaec5	3221	Teharje
00050000-557a-ce3b-801b-2fdac532e145	9251	Tišina
00050000-557a-ce3b-ed92-49e86c530fb0	5220	Tolmin
00050000-557a-ce3b-85b6-52cb31662e6e	3326	Topolšica
00050000-557a-ce3b-db74-a4a5ec67b25d	2371	Trbonje
00050000-557a-ce3b-aed5-3b398a63b391	1420	Trbovlje
00050000-557a-ce3b-ce56-2a935906b7d9	8231	Trebelno 
00050000-557a-ce3b-7cfd-08a4a8f2a899	8210	Trebnje
00050000-557a-ce3b-bf84-57e64b366f57	5252	Trnovo pri Gorici
00050000-557a-ce3b-8d63-07071d644882	2254	Trnovska vas
00050000-557a-ce3b-8372-b3e08741510d	1222	Trojane
00050000-557a-ce3b-55b6-3eef59137366	1236	Trzin
00050000-557a-ce3b-0fa0-3df42912287e	4290	Tržič
00050000-557a-ce3b-fef9-5dfe1983d1ad	8295	Tržišče
00050000-557a-ce3b-0587-ddd9093f1b9b	1311	Turjak
00050000-557a-ce3b-1ef3-d2751dcbceb0	9224	Turnišče
00050000-557a-ce3b-65fc-82ef7a6d3057	8323	Uršna sela
00050000-557a-ce3b-0c92-014a470ca595	1252	Vače
00050000-557a-ce3b-c167-d2fc7c9f68b7	3320	Velenje 
00050000-557a-ce3b-b052-01a36b79477c	3322	Velenje - poštni predali
00050000-557a-ce3b-2c5b-3701bd9f363d	8212	Velika Loka
00050000-557a-ce3b-a748-1c4462c445ee	2274	Velika Nedelja
00050000-557a-ce3b-0626-fbbd4406d891	9225	Velika Polana
00050000-557a-ce3b-dc63-3327a6d43b97	1315	Velike Lašče
00050000-557a-ce3b-eebf-32d4ce14c1b4	8213	Veliki Gaber
00050000-557a-ce3b-f4a7-6c25bb54eb6f	9241	Veržej
00050000-557a-ce3b-2859-263b97d1a4b4	1312	Videm - Dobrepolje
00050000-557a-ce3b-c777-6b7609c38c00	2284	Videm pri Ptuju
00050000-557a-ce3b-2264-6ab1f59f6621	8344	Vinica
00050000-557a-ce3b-67c8-f15baf1d6b48	5271	Vipava
00050000-557a-ce3b-b744-0b49dcbfcf5c	4212	Visoko
00050000-557a-ce3b-e8a5-6439db95b450	1294	Višnja Gora
00050000-557a-ce3b-5675-3fb65421098e	3205	Vitanje
00050000-557a-ce3b-3803-7e8c7905ee0b	2255	Vitomarci
00050000-557a-ce3b-2164-1ddc83273d34	1217	Vodice
00050000-557a-ce3b-90fb-e336f979cd66	3212	Vojnik\t
00050000-557a-ce3b-79a6-373e6f756506	5293	Volčja Draga
00050000-557a-ce3b-7249-42e65fee3f40	2232	Voličina
00050000-557a-ce3b-14ed-e6afb6759632	3305	Vransko
00050000-557a-ce3b-5b26-a408e737d02a	6217	Vremski Britof
00050000-557a-ce3b-9bff-f7952eb26a9e	1360	Vrhnika
00050000-557a-ce3b-34c2-6481a2f4a955	2365	Vuhred
00050000-557a-ce3b-6f38-6358a8fee1b3	2367	Vuzenica
00050000-557a-ce3b-03c2-b3f600773ee4	8292	Zabukovje 
00050000-557a-ce3b-4152-326c3ae2c282	1410	Zagorje ob Savi
00050000-557a-ce3b-f7a9-48c3586f9931	1303	Zagradec
00050000-557a-ce3b-e583-e463833053d3	2283	Zavrč
00050000-557a-ce3b-1874-5f4b230807e6	8272	Zdole 
00050000-557a-ce3b-abea-f1bf5e3cd2e7	4201	Zgornja Besnica
00050000-557a-ce3b-6971-56e5ab34006c	2242	Zgornja Korena
00050000-557a-ce3b-c394-05765b635de5	2201	Zgornja Kungota
00050000-557a-ce3b-892e-bdb236ca20e8	2316	Zgornja Ložnica
00050000-557a-ce3b-5012-7e8e76730b16	2314	Zgornja Polskava
00050000-557a-ce3b-bf48-55ccc2a5f97e	2213	Zgornja Velka
00050000-557a-ce3b-49e2-9fa62bff5198	4247	Zgornje Gorje
00050000-557a-ce3b-d2ac-8f1dd9aadb33	4206	Zgornje Jezersko
00050000-557a-ce3b-84fb-873f0a7100b2	2285	Zgornji Leskovec
00050000-557a-ce3b-9624-dae286e320d5	1432	Zidani Most
00050000-557a-ce3b-b0ab-4d103ab86446	3214	Zreče
00050000-557a-ce3b-13c7-0b13f1a59f0d	4209	Žabnica
00050000-557a-ce3b-9799-8be13292f27f	3310	Žalec
00050000-557a-ce3b-6a54-e0ba74426f7e	4228	Železniki
00050000-557a-ce3b-d559-00c58f8ed53a	2287	Žetale
00050000-557a-ce3b-3b1e-2d639b0e706a	4226	Žiri
00050000-557a-ce3b-ffba-2e4407f20a22	4274	Žirovnica
00050000-557a-ce3b-54df-beca00ac137b	8360	Žužemberk
\.


--
-- TOC entry 2850 (class 0 OID 7087164)
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
-- TOC entry 2832 (class 0 OID 7086975)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7087053)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 7087176)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7087296)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 7087349)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-557a-ce3d-cdfd-07b06e80a4b7	00080000-557a-ce3d-fd4e-28ff33e3b6e3	0987	A
00190000-557a-ce3d-0b0a-e9eb4ae92c96	00080000-557a-ce3d-a614-c6f8cf41830e	0989	A
\.


--
-- TOC entry 2876 (class 0 OID 7087464)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 7087527)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7087477)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7087496)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7087205)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-557a-ce3d-e5cb-e2e230e55e6e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-557a-ce3d-106c-889876863fd5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-557a-ce3d-ad7b-003bb76bf05a	0003	Kazinska	t	84	Kazinska dvorana
00220000-557a-ce3d-e6ec-888c45b21683	0004	Mali oder	t	24	Mali oder 
00220000-557a-ce3d-a3eb-a8ea6c0fd6dc	0005	Komorni oder	t	15	Komorni oder
00220000-557a-ce3d-8dc4-79fc3e829ed0	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-557a-ce3d-2794-9c9aa9befcea	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2848 (class 0 OID 7087149)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 7087139)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7087338)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 7087273)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 7086847)
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
-- TOC entry 2857 (class 0 OID 7087215)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 7086885)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-557a-ce3c-1002-3b93935b368f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-557a-ce3c-e724-b084cf872fd6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-557a-ce3c-e0f0-7a24301f8b2b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-557a-ce3c-a8a6-c0199f8e1976	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-557a-ce3c-d028-17fe722d6ea4	planer	Planer dogodkov v koledarju	t
00020000-557a-ce3c-ae54-58547981e1ab	kadrovska	Kadrovska služba	t
00020000-557a-ce3c-a0d0-a7044b7ff7be	arhivar	Ažuriranje arhivalij	t
00020000-557a-ce3c-5fb1-13097cb7f309	igralec	Igralec	t
00020000-557a-ce3c-68e8-969d285bf298	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2823 (class 0 OID 7086869)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-557a-ce3c-ad88-04dc8c847b2c	00020000-557a-ce3c-e0f0-7a24301f8b2b
00010000-557a-ce3c-6181-9ca70682e227	00020000-557a-ce3c-e0f0-7a24301f8b2b
\.


--
-- TOC entry 2859 (class 0 OID 7087229)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7087170)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7087120)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7087560)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-557a-ce3b-08b9-32261039674a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-557a-ce3b-b0ab-28e64b6de38d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-557a-ce3b-d1fa-916c399a71d0	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-557a-ce3b-b619-0810383556c3	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-557a-ce3b-aff0-d985a4ee59a9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2882 (class 0 OID 7087552)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-557a-ce3b-7eb4-7480bde6c58c	00230000-557a-ce3b-b619-0810383556c3	popa
00240000-557a-ce3b-229f-bf211af1fdb1	00230000-557a-ce3b-b619-0810383556c3	oseba
00240000-557a-ce3b-1b83-17c1c07c5768	00230000-557a-ce3b-b0ab-28e64b6de38d	prostor
00240000-557a-ce3b-35bc-0fd29d095405	00230000-557a-ce3b-b619-0810383556c3	besedilo
00240000-557a-ce3b-b278-dfcdda5a2613	00230000-557a-ce3b-b619-0810383556c3	uprizoritev
00240000-557a-ce3b-7614-795974bf32cd	00230000-557a-ce3b-b619-0810383556c3	funkcija
00240000-557a-ce3b-6607-efd23d98c013	00230000-557a-ce3b-b619-0810383556c3	tipfunkcije
00240000-557a-ce3b-4486-eb33def8081d	00230000-557a-ce3b-b619-0810383556c3	alternacija
00240000-557a-ce3b-9c82-bccd1ca81546	00230000-557a-ce3b-08b9-32261039674a	pogodba
00240000-557a-ce3b-ccfb-6ab20cd7a171	00230000-557a-ce3b-b619-0810383556c3	zaposlitev
\.


--
-- TOC entry 2881 (class 0 OID 7087547)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7087283)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7086947)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7087126)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-557a-ce3d-12dc-3d29488847e1	00180000-557a-ce3d-8658-32c1722ba351	000c0000-557a-ce3d-b354-d005a9564c64	00090000-557a-ce3d-100d-f66e1b24e386	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-ce3d-75f1-41dab56d3821	00180000-557a-ce3d-8658-32c1722ba351	000c0000-557a-ce3d-45f0-618906bfdcaf	00090000-557a-ce3d-4cc9-57e4d6ab62f4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-ce3d-cd11-96a4ce1679f1	00180000-557a-ce3d-8658-32c1722ba351	000c0000-557a-ce3d-755f-b39549ef9e4c	00090000-557a-ce3d-0fea-76781198a1e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-ce3d-0cec-632e46714423	00180000-557a-ce3d-8658-32c1722ba351	000c0000-557a-ce3d-b00b-4c37eb21f781	00090000-557a-ce3d-dd88-3555a4443683	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-ce3d-3e41-ddb38462eedd	00180000-557a-ce3d-8658-32c1722ba351	000c0000-557a-ce3d-8e2b-76f718b2f728	00090000-557a-ce3d-8271-40a32724dd11	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-557a-ce3d-c68d-4d557381dea1	00180000-557a-ce3d-1edb-33cd2c38144d	\N	00090000-557a-ce3d-8271-40a32724dd11	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2867 (class 0 OID 7087327)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-557a-ce3b-6fc0-c56e6028b863	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-557a-ce3b-2a54-08f770ab9905	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-557a-ce3b-9f10-ca428ece820b	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-557a-ce3b-2e0a-25e2aae31a4f	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-557a-ce3b-9e3b-10ba4d833b55	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-557a-ce3b-0789-8bb978383d8d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-557a-ce3b-a3da-b9c31ebe45c5	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-557a-ce3b-3d7b-f570f75ff59f	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-557a-ce3b-2a7b-1345e34098c4	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-557a-ce3b-af58-50e693c50281	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-557a-ce3b-da23-d6e77e80ab02	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-557a-ce3b-a033-fd8859868ba0	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-557a-ce3b-7e1b-b181a78a0276	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-557a-ce3b-43d7-2853d5c39b90	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-557a-ce3b-1ef6-0f76bc0888dd	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-557a-ce3b-e175-3d4c338f036b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2879 (class 0 OID 7087516)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-557a-ce3b-88e4-52e193ececc5	01	Velika predstava	f	1.00	1.00
002b0000-557a-ce3b-7bdd-987fa3fa017d	02	Mala predstava	f	0.50	0.50
002b0000-557a-ce3b-db16-1ae5b9378c06	03	Mala koprodukcija	t	0.40	1.00
002b0000-557a-ce3b-19a0-5d06f91b578f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-557a-ce3b-83de-8030890bca07	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2835 (class 0 OID 7087010)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 7086856)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-557a-ce3c-6181-9ca70682e227	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROlLta/0/z7rXD8s3LsmKOOLM5f1iCUkC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-0c83-e916d57817cb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-5df8-72903fe8fa1b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-d28f-0c3fdfe9a474	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-77a1-e44eb416a0df	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-a954-27302b572715	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-557a-ce3d-22be-5bcd6e47a899	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-557a-ce3c-ad88-04dc8c847b2c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2872 (class 0 OID 7087384)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-557a-ce3d-23f5-1f40b53061ac	00160000-557a-ce3d-95b4-4b69d37739ef	00150000-557a-ce3b-0e6b-cbc7bea2f69f	00140000-557a-ce3b-9f6a-f2c9d6c89bc5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-557a-ce3d-a3eb-a8ea6c0fd6dc
000e0000-557a-ce3d-4a3a-15d2348cad43	00160000-557a-ce3d-8d29-a424d5e53bde	00150000-557a-ce3b-178c-157281538907	00140000-557a-ce3b-3c32-764e16a4443c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-557a-ce3d-8dc4-79fc3e829ed0
000e0000-557a-ce3d-720d-1ce9f25d5590	\N	00150000-557a-ce3b-178c-157281538907	00140000-557a-ce3b-3c32-764e16a4443c	00190000-557a-ce3d-cdfd-07b06e80a4b7	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-557a-ce3d-a3eb-a8ea6c0fd6dc
000e0000-557a-ce3d-59fc-42517e8ab07d	\N	00150000-557a-ce3b-178c-157281538907	00140000-557a-ce3b-3c32-764e16a4443c	00190000-557a-ce3d-cdfd-07b06e80a4b7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-557a-ce3d-a3eb-a8ea6c0fd6dc
\.


--
-- TOC entry 2840 (class 0 OID 7087072)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-557a-ce3d-3b8c-452bd823e1d2	000e0000-557a-ce3d-4a3a-15d2348cad43	1	
00200000-557a-ce3d-6571-baad464becad	000e0000-557a-ce3d-4a3a-15d2348cad43	2	
\.


--
-- TOC entry 2855 (class 0 OID 7087197)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7087266)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7087104)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7087374)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-557a-ce3b-9f6a-f2c9d6c89bc5	01	Drama	drama (SURS 01)
00140000-557a-ce3b-3eb7-d65ce07527f7	02	Opera	opera (SURS 02)
00140000-557a-ce3b-6153-72573a5aa413	03	Balet	balet (SURS 03)
00140000-557a-ce3b-a397-09fc11551ae9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-557a-ce3b-e253-0ef86e1ff99e	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-557a-ce3b-3c32-764e16a4443c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-557a-ce3b-38a6-440ade3e029e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2861 (class 0 OID 7087256)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-557a-ce3b-4c6b-941197b385d9	01	Opera	opera
00150000-557a-ce3b-567d-cd7f691864e6	02	Opereta	opereta
00150000-557a-ce3b-e7ab-355134f187e1	03	Balet	balet
00150000-557a-ce3b-5cb6-807a16479572	04	Plesne prireditve	plesne prireditve
00150000-557a-ce3b-b6a9-e1691b0b14b0	05	Lutkovno gledališče	lutkovno gledališče
00150000-557a-ce3b-0b45-e10286eb3b3f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-557a-ce3b-736b-1a983f38515d	07	Biografska drama	biografska drama
00150000-557a-ce3b-0e6b-cbc7bea2f69f	08	Komedija	komedija
00150000-557a-ce3b-e25f-da066bdc32fc	09	Črna komedija	črna komedija
00150000-557a-ce3b-3b05-e6679095c8b1	10	E-igra	E-igra
00150000-557a-ce3b-178c-157281538907	11	Kriminalka	kriminalka
00150000-557a-ce3b-dbd4-65117825fa1b	12	Musical	musical
\.


--
-- TOC entry 2403 (class 2606 OID 7086910)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 7087431)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 7087421)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7087326)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7087094)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 7087119)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 7087036)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 7087460)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 7087252)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 7087070)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7087113)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 7087050)
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
-- TOC entry 2495 (class 2606 OID 7087162)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 7087189)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 7087008)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 7086919)
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
-- TOC entry 2410 (class 2606 OID 7086943)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7086899)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2394 (class 2606 OID 7086884)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 7087195)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 7087228)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7087369)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7086972)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 7086996)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 7087168)
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
-- TOC entry 2425 (class 2606 OID 7086986)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7087057)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 7087180)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 7087308)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 7087354)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7087475)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7087545)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 7087492)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 7087513)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 7087212)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 7087153)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7087144)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 7087348)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7087280)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 7086855)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7087219)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 7086873)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2396 (class 2606 OID 7086893)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7087237)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7087175)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 7087125)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 7087569)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 7087557)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 7087551)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 7087293)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7086952)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 7087135)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7087337)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 7087526)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 7087021)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 7086868)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 7087400)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 7087079)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7087203)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 7087271)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7087108)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7087382)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7087264)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 1259 OID 7087101)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2543 (class 1259 OID 7087294)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7087295)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2417 (class 1259 OID 7086974)
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
-- TOC entry 2508 (class 1259 OID 7087196)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2502 (class 1259 OID 7087182)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2503 (class 1259 OID 7087181)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2454 (class 1259 OID 7087080)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2530 (class 1259 OID 7087253)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2531 (class 1259 OID 7087255)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2532 (class 1259 OID 7087254)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2442 (class 1259 OID 7087052)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 7087051)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2561 (class 1259 OID 7087371)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2562 (class 1259 OID 7087372)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2563 (class 1259 OID 7087373)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2603 (class 1259 OID 7087515)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2604 (class 1259 OID 7087514)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2570 (class 1259 OID 7087405)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2571 (class 1259 OID 7087402)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2572 (class 1259 OID 7087406)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2573 (class 1259 OID 7087404)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2574 (class 1259 OID 7087403)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2432 (class 1259 OID 7087023)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 7087022)
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
-- TOC entry 2408 (class 1259 OID 7086946)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2518 (class 1259 OID 7087220)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2472 (class 1259 OID 7087114)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 7086900)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2399 (class 1259 OID 7086901)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2523 (class 1259 OID 7087240)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2524 (class 1259 OID 7087239)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2525 (class 1259 OID 7087238)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2446 (class 1259 OID 7087058)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2447 (class 1259 OID 7087060)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2448 (class 1259 OID 7087059)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2614 (class 1259 OID 7087559)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2482 (class 1259 OID 7087148)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2483 (class 1259 OID 7087146)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2484 (class 1259 OID 7087145)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2485 (class 1259 OID 7087147)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2389 (class 1259 OID 7086874)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2390 (class 1259 OID 7086875)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2511 (class 1259 OID 7087204)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2497 (class 1259 OID 7087169)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2539 (class 1259 OID 7087281)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2540 (class 1259 OID 7087282)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2592 (class 1259 OID 7087461)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 7087462)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2594 (class 1259 OID 7087463)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 7086988)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2422 (class 1259 OID 7086987)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2423 (class 1259 OID 7086989)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2609 (class 1259 OID 7087546)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2547 (class 1259 OID 7087309)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 7087310)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2584 (class 1259 OID 7087435)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2585 (class 1259 OID 7087437)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2586 (class 1259 OID 7087433)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2587 (class 1259 OID 7087436)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2588 (class 1259 OID 7087434)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2536 (class 1259 OID 7087272)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2488 (class 1259 OID 7087157)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2489 (class 1259 OID 7087156)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2490 (class 1259 OID 7087154)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2491 (class 1259 OID 7087155)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2372 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2580 (class 1259 OID 7087423)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2581 (class 1259 OID 7087422)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2595 (class 1259 OID 7087476)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 7087071)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2404 (class 1259 OID 7086921)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2405 (class 1259 OID 7086920)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2413 (class 1259 OID 7086953)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2414 (class 1259 OID 7086954)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 7087138)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2478 (class 1259 OID 7087137)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2479 (class 1259 OID 7087136)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2598 (class 1259 OID 7087495)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2599 (class 1259 OID 7087493)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 7087494)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2460 (class 1259 OID 7087103)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2461 (class 1259 OID 7087099)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2462 (class 1259 OID 7087096)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2463 (class 1259 OID 7087097)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2464 (class 1259 OID 7087095)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2465 (class 1259 OID 7087100)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2466 (class 1259 OID 7087098)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2420 (class 1259 OID 7086973)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2438 (class 1259 OID 7087037)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2439 (class 1259 OID 7087039)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2440 (class 1259 OID 7087038)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2441 (class 1259 OID 7087040)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2496 (class 1259 OID 7087163)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2566 (class 1259 OID 7087370)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2575 (class 1259 OID 7087401)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2411 (class 1259 OID 7086944)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2412 (class 1259 OID 7086945)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2533 (class 1259 OID 7087265)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 7087570)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2431 (class 1259 OID 7087009)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2617 (class 1259 OID 7087558)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2516 (class 1259 OID 7087214)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2517 (class 1259 OID 7087213)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 7087432)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2375 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 7086997)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 7087383)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2559 (class 1259 OID 7087355)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 7087356)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2397 (class 1259 OID 7086894)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2467 (class 1259 OID 7087102)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2646 (class 2606 OID 7087706)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2649 (class 2606 OID 7087691)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2648 (class 2606 OID 7087696)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2644 (class 2606 OID 7087716)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 7087686)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2645 (class 2606 OID 7087711)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2647 (class 2606 OID 7087701)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2680 (class 2606 OID 7087861)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2679 (class 2606 OID 7087866)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2631 (class 2606 OID 7087621)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 7087801)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2665 (class 2606 OID 7087796)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 7087791)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2643 (class 2606 OID 7087681)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2675 (class 2606 OID 7087831)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2673 (class 2606 OID 7087841)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2674 (class 2606 OID 7087836)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2637 (class 2606 OID 7087656)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 7087651)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7087781)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2686 (class 2606 OID 7087886)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2685 (class 2606 OID 7087891)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7087896)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2706 (class 2606 OID 7088001)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7087996)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2688 (class 2606 OID 7087916)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2691 (class 2606 OID 7087901)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2687 (class 2606 OID 7087921)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2689 (class 2606 OID 7087911)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2690 (class 2606 OID 7087906)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2635 (class 2606 OID 7087646)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2636 (class 2606 OID 7087641)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2627 (class 2606 OID 7087606)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2628 (class 2606 OID 7087601)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2669 (class 2606 OID 7087811)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 7087721)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2624 (class 2606 OID 7087581)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2623 (class 2606 OID 7087586)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2670 (class 2606 OID 7087826)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2671 (class 2606 OID 7087821)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 7087816)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2641 (class 2606 OID 7087661)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2639 (class 2606 OID 7087671)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2640 (class 2606 OID 7087666)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 7088011)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2655 (class 2606 OID 7087756)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2657 (class 2606 OID 7087746)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2658 (class 2606 OID 7087741)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2656 (class 2606 OID 7087751)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2622 (class 2606 OID 7087571)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2621 (class 2606 OID 7087576)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2668 (class 2606 OID 7087806)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2664 (class 2606 OID 7087786)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2678 (class 2606 OID 7087851)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2677 (class 2606 OID 7087856)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7087961)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2700 (class 2606 OID 7087966)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2699 (class 2606 OID 7087971)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2633 (class 2606 OID 7087631)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2634 (class 2606 OID 7087626)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2632 (class 2606 OID 7087636)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2708 (class 2606 OID 7088006)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2682 (class 2606 OID 7087871)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2681 (class 2606 OID 7087876)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2696 (class 2606 OID 7087946)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7087956)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2698 (class 2606 OID 7087936)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2695 (class 2606 OID 7087951)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2697 (class 2606 OID 7087941)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2676 (class 2606 OID 7087846)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 7087776)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2660 (class 2606 OID 7087771)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2662 (class 2606 OID 7087761)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2661 (class 2606 OID 7087766)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2692 (class 2606 OID 7087931)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 7087926)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2702 (class 2606 OID 7087976)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2642 (class 2606 OID 7087676)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2683 (class 2606 OID 7087881)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 7087596)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2626 (class 2606 OID 7087591)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2630 (class 2606 OID 7087611)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2629 (class 2606 OID 7087616)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7087736)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7087731)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2654 (class 2606 OID 7087726)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2703 (class 2606 OID 7087991)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7087981)
-- Name: fk_ffeaf2ff62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 7087986)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-12 14:19:10 CEST

--
-- PostgreSQL database dump complete
--

