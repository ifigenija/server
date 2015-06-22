--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-22 14:32:42 CEST

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
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 7923621)
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
-- TOC entry 228 (class 1259 OID 7924143)
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
-- TOC entry 227 (class 1259 OID 7924126)
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
-- TOC entry 220 (class 1259 OID 7924030)
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
-- TOC entry 195 (class 1259 OID 7923800)
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
-- TOC entry 198 (class 1259 OID 7923834)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 190 (class 1259 OID 7923743)
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
-- TOC entry 229 (class 1259 OID 7924157)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    program_dela_id uuid,
    gostitelj_id uuid,
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
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    odkup numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 214 (class 1259 OID 7923960)
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
-- TOC entry 193 (class 1259 OID 7923780)
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
-- TOC entry 197 (class 1259 OID 7923828)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 191 (class 1259 OID 7923760)
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
-- TOC entry 203 (class 1259 OID 7923877)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 207 (class 1259 OID 7923902)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 7923717)
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
-- TOC entry 182 (class 1259 OID 7923630)
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
-- TOC entry 183 (class 1259 OID 7923641)
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
-- TOC entry 178 (class 1259 OID 7923595)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 7923614)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 7923909)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 212 (class 1259 OID 7923940)
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
-- TOC entry 224 (class 1259 OID 7924076)
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
-- TOC entry 185 (class 1259 OID 7923674)
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
-- TOC entry 187 (class 1259 OID 7923709)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 204 (class 1259 OID 7923883)
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
-- TOC entry 186 (class 1259 OID 7923694)
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
-- TOC entry 192 (class 1259 OID 7923772)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 206 (class 1259 OID 7923895)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 7924015)
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
-- TOC entry 223 (class 1259 OID 7924068)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 7924192)
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
-- TOC entry 233 (class 1259 OID 7924236)
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
-- TOC entry 173 (class 1259 OID 7899147)
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
-- TOC entry 231 (class 1259 OID 7924205)
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
-- TOC entry 210 (class 1259 OID 7923924)
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
-- TOC entry 202 (class 1259 OID 7923868)
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
-- TOC entry 201 (class 1259 OID 7923858)
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
-- TOC entry 222 (class 1259 OID 7924057)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 217 (class 1259 OID 7923992)
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
-- TOC entry 175 (class 1259 OID 7923566)
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
-- TOC entry 174 (class 1259 OID 7923564)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 211 (class 1259 OID 7923934)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 7923604)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 7923588)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 7923948)
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
-- TOC entry 205 (class 1259 OID 7923889)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 7923839)
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
-- TOC entry 236 (class 1259 OID 7924269)
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
-- TOC entry 235 (class 1259 OID 7924261)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7924256)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 218 (class 1259 OID 7924002)
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
-- TOC entry 184 (class 1259 OID 7923666)
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
-- TOC entry 200 (class 1259 OID 7923845)
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
-- TOC entry 221 (class 1259 OID 7924046)
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
-- TOC entry 232 (class 1259 OID 7924225)
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
-- TOC entry 189 (class 1259 OID 7923729)
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
-- TOC entry 176 (class 1259 OID 7923575)
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
-- TOC entry 226 (class 1259 OID 7924103)
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
-- TOC entry 194 (class 1259 OID 7923791)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 209 (class 1259 OID 7923916)
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
-- TOC entry 216 (class 1259 OID 7923985)
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
-- TOC entry 196 (class 1259 OID 7923823)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 7924093)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 215 (class 1259 OID 7923975)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2183 (class 2604 OID 7923569)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2835 (class 0 OID 7923621)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7924143)
-- Dependencies: 228
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5588-0069-f1ca-e2e0b5ddc29a	000d0000-5588-0069-fc7e-048128f48901	\N	00090000-5588-0069-9079-43781c81ba7c	\N	000b0000-5588-0069-55cc-c410d2468f77	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-0069-dfe3-cee9c2fd895a	000d0000-5588-0069-8089-c0a3020d3f31	\N	00090000-5588-0069-3d54-e3a58a56b3a2	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-0069-3e26-75f6b3c35eaa	000d0000-5588-0069-07c2-693e144acee9	\N	00090000-5588-0069-c432-4dbe684d4a30	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-0069-1efd-46839b5a55bc	000d0000-5588-0069-02f0-3a9a58ba9cb2	\N	00090000-5588-0069-490a-d12ba4594b1b	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-0069-514e-a0a83fdcae83	000d0000-5588-0069-e7a5-7b9d26d8e412	\N	00090000-5588-0069-f3b8-748947ce7264	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-0069-dd6e-df7ac297e6c8	000d0000-5588-0069-2aaa-e0375fe2e814	\N	00090000-5588-0069-3d54-e3a58a56b3a2	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2881 (class 0 OID 7924126)
-- Dependencies: 227
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 7924030)
-- Dependencies: 220
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5588-0069-535d-f904662e1067	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5588-0069-8f68-c2ccf7c847b6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5588-0069-e79b-d82d19e68633	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2849 (class 0 OID 7923800)
-- Dependencies: 195
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5588-0069-cf67-5f0ba8188a6d	\N	\N	00200000-5588-0069-5d76-8735ad9b8822	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5588-0069-0e4a-dffb17420214	\N	\N	00200000-5588-0069-c5c2-aec7161082aa	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5588-0069-84d4-319279b6a03b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5588-0069-a30d-c506ec2a5dac	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5588-0069-77e0-c8178882fdf4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2852 (class 0 OID 7923834)
-- Dependencies: 198
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7923743)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5588-0067-3a3c-b4fb5bc8f3cf	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5588-0067-39fa-3e5c6fa18929	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5588-0067-a4a3-1231ae87d39d	AL	ALB	008	Albania 	Albanija	\N
00040000-5588-0067-b510-9801c6f8585e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5588-0067-479a-269a4cd38f4e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5588-0067-6fe9-d9541e131e2d	AD	AND	020	Andorra 	Andora	\N
00040000-5588-0067-0584-ffd0ef382d4b	AO	AGO	024	Angola 	Angola	\N
00040000-5588-0067-c8e2-269fc45cea3e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5588-0067-20e1-5a3207b70e4c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5588-0067-473c-167780b44585	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-0067-b47a-b72d8a1f915e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5588-0067-8374-5b770c2ae71a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5588-0067-9dc6-94f44c83580a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5588-0067-2b00-4b6fb8a485e1	AU	AUS	036	Australia 	Avstralija	\N
00040000-5588-0067-727a-d6c1ea12caa0	AT	AUT	040	Austria 	Avstrija	\N
00040000-5588-0067-b373-23b2dd899fe6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5588-0067-028b-b53d086dac8c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5588-0067-cce0-05cc00ebf5ab	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5588-0067-c619-b9e10e1e7aae	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5588-0067-9e2c-d4009d610ec4	BB	BRB	052	Barbados 	Barbados	\N
00040000-5588-0067-6a3f-9b69da43b18e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5588-0067-5257-43ae22c5e669	BE	BEL	056	Belgium 	Belgija	\N
00040000-5588-0067-6cf1-ce6bf29d2485	BZ	BLZ	084	Belize 	Belize	\N
00040000-5588-0067-dc99-4a5d9e4ea726	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5588-0067-bd2f-dad10dd9fd77	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5588-0067-6c07-85f29aeccba3	BT	BTN	064	Bhutan 	Butan	\N
00040000-5588-0067-0571-f58681d7c22c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5588-0067-13b4-0957dfec18cd	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5588-0067-4330-29fb4978045e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5588-0067-b755-099ecda3dcf3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5588-0067-9a7c-1495f26b3b2f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5588-0067-f43a-09e7533fe57b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5588-0067-1c89-2c1768c9c10c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5588-0067-e842-1db325277c86	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5588-0067-a811-201cb321bb5f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5588-0067-0def-6dc0ee1c9032	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5588-0067-010e-2d39791becb5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5588-0067-28b3-34513c4701a6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5588-0067-964f-4306dd065da4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5588-0067-be50-73236809315d	CA	CAN	124	Canada 	Kanada	\N
00040000-5588-0067-9923-6495beb7f4c8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5588-0067-9010-cd6d3fae5099	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5588-0067-a5a0-76e12bc7c0fa	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5588-0067-752e-65ee708304da	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5588-0067-94c6-87e939d42f7f	CL	CHL	152	Chile 	Čile	\N
00040000-5588-0067-fa59-39be07a7ea97	CN	CHN	156	China 	Kitajska	\N
00040000-5588-0067-8445-4b70685ff9ca	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5588-0067-5045-95887d59f11c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5588-0067-997d-1aaf82d7bdf5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5588-0067-ebac-970e1809a20e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5588-0067-55aa-cdefc340fba7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5588-0067-352c-202c786549c8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5588-0067-2770-0824733026ec	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5588-0067-8a4f-c91806722f21	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5588-0067-6dc2-7556786f4e40	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5588-0067-6769-58386e1dcd4c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5588-0067-3257-9a1800753fec	CU	CUB	192	Cuba 	Kuba	\N
00040000-5588-0067-d1ab-1f98ccb98937	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5588-0067-1916-ebdd48c84ee9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5588-0067-9e8c-a0e8f350ecaf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5588-0067-0d17-894a8f0ceb17	DK	DNK	208	Denmark 	Danska	\N
00040000-5588-0067-2f7a-e500eafeae08	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5588-0067-e46d-e8f0ab910475	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-0067-d23a-7db9a5edd11d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5588-0067-df0b-336c8800fe8b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5588-0067-c28d-217e19ac8a2a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5588-0067-2070-fe7b94ba9833	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5588-0067-6e28-8f86f9c8555f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5588-0067-26ce-964984a1ba17	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5588-0067-0e48-9f8690b161d4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5588-0067-712e-06293aadb39f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5588-0067-2460-e76b1e6b54c1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5588-0067-928e-637731ecf6a4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5588-0067-0cb9-4ca62f813503	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5588-0067-f5ad-61da04752736	FI	FIN	246	Finland 	Finska	\N
00040000-5588-0067-96b7-fc0f98a7fd00	FR	FRA	250	France 	Francija	\N
00040000-5588-0067-396f-4bfac9246efa	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5588-0067-33cb-ed6d3808b99a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5588-0067-f152-10accdde6916	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5588-0067-a343-7265dc1ec9b4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5588-0067-32e6-1882b4be6f94	GA	GAB	266	Gabon 	Gabon	\N
00040000-5588-0067-0637-9407d9bbbcab	GM	GMB	270	Gambia 	Gambija	\N
00040000-5588-0067-f0d5-ed83276dcd86	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5588-0067-82c9-12c1955f529f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5588-0067-64b5-b424a502c668	GH	GHA	288	Ghana 	Gana	\N
00040000-5588-0067-4b7b-c4d5dc575dea	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5588-0067-b4aa-6bb3fe9ede33	GR	GRC	300	Greece 	Grčija	\N
00040000-5588-0067-a9ee-6b4a2289d1fa	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5588-0067-fe78-4cd24b029d3d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5588-0067-29d3-d41b8ebc5a78	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5588-0067-e50d-2c503b459f6f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5588-0067-85bb-391f900edb89	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5588-0067-6f45-dad9c4380b95	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5588-0067-def5-13dfe0b589b7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5588-0067-3537-380bef42db0b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5588-0067-5d48-ef007c49a380	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5588-0067-4bf2-4a5b4ea39396	HT	HTI	332	Haiti 	Haiti	\N
00040000-5588-0067-956c-1f665e0a441b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5588-0067-007c-1a34cb8c728f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5588-0067-b24e-be236cff4315	HN	HND	340	Honduras 	Honduras	\N
00040000-5588-0067-b19c-e4595d1a71ec	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5588-0067-b243-0aa832df56a4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5588-0067-1c5c-7beadda7d04b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5588-0067-e9d9-e3cbd6c284fb	IN	IND	356	India 	Indija	\N
00040000-5588-0067-076d-1b8bc1c86d09	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5588-0067-cb94-3aa033d5caa4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5588-0067-fb22-d5495254bbc1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5588-0067-5dad-27ba27708394	IE	IRL	372	Ireland 	Irska	\N
00040000-5588-0067-8e88-4d1cc1a557e9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5588-0067-5007-e3e23cbdc2a7	IL	ISR	376	Israel 	Izrael	\N
00040000-5588-0067-e060-ed700c7eeb97	IT	ITA	380	Italy 	Italija	\N
00040000-5588-0067-d65f-bdd1fe278995	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5588-0067-77af-619888f43c9d	JP	JPN	392	Japan 	Japonska	\N
00040000-5588-0067-a9c8-6d0bf48e945f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5588-0067-6867-1c192a5f4bd4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5588-0067-56ce-81f5e354470a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5588-0067-446c-a5279a6a470d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5588-0067-5cba-c08c7f91ecfe	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5588-0067-2ec0-35db98b296ce	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5588-0067-252f-0bbdd0360795	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5588-0067-f7b1-d2fb8e11fc71	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5588-0067-f542-89168de70183	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5588-0067-c433-57d522b1a28b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5588-0067-4876-223895e19ab3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5588-0067-7984-db9d4c8c10a9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5588-0067-f05f-a24449d45f97	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5588-0067-311d-e4a376467546	LR	LBR	430	Liberia 	Liberija	\N
00040000-5588-0067-6996-4327a47ad3bb	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5588-0067-aace-9ab16c0347b3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5588-0067-2ea9-8eb3c673bcb3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5588-0067-78e1-a75e71b8010f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5588-0067-ded6-cdc4a909d702	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5588-0067-c6b5-cca5f5aa56b1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5588-0067-80d2-a5308a1b1b8b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5588-0067-5d4c-6c0299094f0d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5588-0067-43b0-566ffbfe3227	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5588-0067-28c7-f37637c0f368	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5588-0067-609e-9360bf0adc55	ML	MLI	466	Mali 	Mali	\N
00040000-5588-0067-924c-834c0581bee5	MT	MLT	470	Malta 	Malta	\N
00040000-5588-0067-600a-d90e8afd0d5e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5588-0067-dc53-4dbcca0dd8f4	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5588-0067-da49-6dd66d63d440	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5588-0067-c348-f0e3aeeadcbe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5588-0067-3369-fca1395b0e22	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5588-0067-6721-738708fe54d3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5588-0067-8ffc-be96deb7cc49	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5588-0067-c1ea-77910c08e4df	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5588-0067-b598-bd38226f573e	MC	MCO	492	Monaco 	Monako	\N
00040000-5588-0067-082d-98ec0ced2723	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5588-0067-759b-b7dcd53dfc75	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5588-0067-82e0-ce5d0c7e3e8d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5588-0067-a226-bf9e1cc18e23	MA	MAR	504	Morocco 	Maroko	\N
00040000-5588-0067-cbbb-e0c493bb9286	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5588-0067-0122-bb82ed1c1cf7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5588-0067-0911-9dbbc4ecfd12	NA	NAM	516	Namibia 	Namibija	\N
00040000-5588-0067-ffad-77fca5daf1c5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5588-0067-2e68-4783755bd184	NP	NPL	524	Nepal 	Nepal	\N
00040000-5588-0067-9231-bc94bfc0591e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5588-0067-17c6-7572be853e1f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5588-0067-f244-bf186bff62ee	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5588-0067-f89e-460ff3a32f0d	NE	NER	562	Niger 	Niger 	\N
00040000-5588-0067-c9b3-846490c69e9b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5588-0067-d0cb-5adab6a793a0	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5588-0067-37db-7c6e55a65b54	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5588-0067-5aad-91f051bc4604	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5588-0067-07fe-70e5ce39653d	NO	NOR	578	Norway 	Norveška	\N
00040000-5588-0067-11c5-8832385cb9d5	OM	OMN	512	Oman 	Oman	\N
00040000-5588-0067-de47-3f1eae1691ee	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5588-0067-467c-74cfbf07f6fb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5588-0067-96d2-c5049a9b5e19	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5588-0067-4bd1-1608b7df674b	PA	PAN	591	Panama 	Panama	\N
00040000-5588-0067-3cf7-514733243c01	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5588-0067-80aa-615576acda7e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5588-0067-6183-1aa64c1ea546	PE	PER	604	Peru 	Peru	\N
00040000-5588-0067-4c0a-f8fd183e1c7f	PH	PHL	608	Philippines 	Filipini	\N
00040000-5588-0067-cb48-88c736401684	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5588-0067-ca3a-3d6b71ac16ea	PL	POL	616	Poland 	Poljska	\N
00040000-5588-0067-53a9-c5f90713fd61	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5588-0067-5189-0029fe5a7aaa	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5588-0067-e236-4e3c580a00fc	QA	QAT	634	Qatar 	Katar	\N
00040000-5588-0067-4afa-d035309f81cd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5588-0067-c94d-8e24acf3bd56	RO	ROU	642	Romania 	Romunija	\N
00040000-5588-0067-c4d1-be98cebeeb1b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5588-0067-29a4-24dc3a8ed3e3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5588-0067-fa90-c776e2d1b198	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5588-0067-569b-1ded2a71f24b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5588-0067-bbf7-c18585b4ada6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5588-0067-62bd-a1da3051c1d3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5588-0067-8f75-0ce1799c327c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5588-0067-9977-26d5ecfc89c0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5588-0067-3428-598917f42b81	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5588-0067-7240-6400ce8d4d71	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5588-0067-9bcb-6d4c2f8cd4f7	SM	SMR	674	San Marino 	San Marino	\N
00040000-5588-0067-022a-191bd5f0fad0	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5588-0067-f1c4-cbc94e2b6769	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5588-0067-829a-edc50cc1a016	SN	SEN	686	Senegal 	Senegal	\N
00040000-5588-0067-d693-efce416461f3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5588-0067-3d12-d5c1a64e72c8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5588-0067-08b2-0d2a2b53b3f8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5588-0067-958a-31e029b8e465	SG	SGP	702	Singapore 	Singapur	\N
00040000-5588-0067-d19c-d909fca69dc6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5588-0067-d4e6-0531c867b289	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5588-0067-a55a-e91891cad2ab	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5588-0067-3d9d-76fed9245d77	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5588-0067-afcf-330cec81bd84	SO	SOM	706	Somalia 	Somalija	\N
00040000-5588-0067-f272-7ce509ce9dac	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5588-0067-8fdb-7406fa73d899	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5588-0067-618d-518d80395700	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5588-0067-1e08-0a05c7692d83	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5588-0067-c933-328dd459bebb	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5588-0067-7035-056fc6da9c48	SD	SDN	729	Sudan 	Sudan	\N
00040000-5588-0067-eabe-51c9b9b79bfe	SR	SUR	740	Suriname 	Surinam	\N
00040000-5588-0067-c0b7-0c0864f466c9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5588-0067-aca8-cdacea2fcc5b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5588-0067-80e0-e06576870452	SE	SWE	752	Sweden 	Švedska	\N
00040000-5588-0067-e02b-0bee10f3e971	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5588-0067-7cae-89417a13e817	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5588-0067-cf3f-4c69aafe946a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5588-0067-6813-4349d9f5de44	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5588-0067-b8e7-9f44bf9aef43	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5588-0067-78d6-11c3cda01d73	TH	THA	764	Thailand 	Tajska	\N
00040000-5588-0067-202c-7ac7ddf901a7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5588-0067-77cb-84f51dba0321	TG	TGO	768	Togo 	Togo	\N
00040000-5588-0067-ff8d-7a62697f54f0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5588-0067-43ae-edcd1b53b2fe	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5588-0067-f17b-e4522d69cf83	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5588-0067-0a5f-75f712e70dfd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5588-0067-5312-9a264d43faa7	TR	TUR	792	Turkey 	Turčija	\N
00040000-5588-0067-0020-973a600e42cc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5588-0067-7694-eecf776e6831	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-0067-7231-4e2dc714a259	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5588-0067-9aca-07ce4cb5af78	UG	UGA	800	Uganda 	Uganda	\N
00040000-5588-0067-2035-be53dfb6625a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5588-0067-fdcd-29e0f24c6a18	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5588-0067-b6a8-771ee19334c5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5588-0067-59ee-f4d00301823c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5588-0067-09ca-80afd4b75fc3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5588-0067-11c8-3a676fcde528	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5588-0067-1d1b-4c5796cf6849	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5588-0067-59c6-47d80de40415	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5588-0067-e064-4456df6eac36	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5588-0067-46bb-cd5147e7a9a3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5588-0067-f70b-a4b8da05ccbb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-0067-949c-96334af9eca9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5588-0067-0cde-b3731435caba	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5588-0067-4bcb-aca658194b74	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5588-0067-93c6-28f42ed4848c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5588-0067-5ac7-51f7d262fa68	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5588-0067-eb59-20704b130c10	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2883 (class 0 OID 7924157)
-- Dependencies: 229
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7923960)
-- Dependencies: 214
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5588-0069-5010-be1182da68b1	000e0000-5588-0069-54c2-daf25cd70ee5	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5588-0068-4454-2a0fa28fc304
000d0000-5588-0069-fc7e-048128f48901	000e0000-5588-0069-54c2-daf25cd70ee5	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-0068-4454-2a0fa28fc304
000d0000-5588-0069-8089-c0a3020d3f31	000e0000-5588-0069-54c2-daf25cd70ee5	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5588-0068-443a-3ae2d61d5a42
000d0000-5588-0069-07c2-693e144acee9	000e0000-5588-0069-54c2-daf25cd70ee5	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5588-0068-8e66-fe72cb4db1ff
000d0000-5588-0069-02f0-3a9a58ba9cb2	000e0000-5588-0069-54c2-daf25cd70ee5	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5588-0068-8e66-fe72cb4db1ff
000d0000-5588-0069-e7a5-7b9d26d8e412	000e0000-5588-0069-54c2-daf25cd70ee5	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5588-0068-8e66-fe72cb4db1ff
000d0000-5588-0069-2aaa-e0375fe2e814	000e0000-5588-0069-54c2-daf25cd70ee5	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-0068-4454-2a0fa28fc304
\.


--
-- TOC entry 2847 (class 0 OID 7923780)
-- Dependencies: 193
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7923828)
-- Dependencies: 197
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7923760)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5588-0069-38d9-fbd554b5e885	00080000-5588-0069-343b-fc1f770631e2	00090000-5588-0069-9079-43781c81ba7c	AK		
\.


--
-- TOC entry 2824 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7923877)
-- Dependencies: 203
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7923902)
-- Dependencies: 207
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 7923717)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5588-0068-c2b4-8605729e7c86	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5588-0068-87d8-ddeb0319783c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5588-0068-0ed2-8178333eae44	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5588-0068-9f45-ed495d672e3e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5588-0068-5dca-2cf96f9924e8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5588-0068-3d13-ba4c858c9269	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5588-0068-fb88-86a5a4e28aab	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5588-0068-0bd4-2f839f39e841	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-0068-b83d-dd2a39342df7	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-0068-09c9-73996b8ebf49	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5588-0068-ed2a-4d50ac57a61c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5588-0068-09f7-90c730269b51	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5588-0068-8a6f-59f89f7c0165	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5588-0069-c711-73e6ff632dd8	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5588-0069-8167-7bba6faade0d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5588-0069-91d1-598b9035e0e0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5588-0069-144e-932b9e8b0e9e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5588-0069-d773-ea974b35afeb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5588-0069-aa0a-f12d76b99d8e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2836 (class 0 OID 7923630)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5588-0069-3f31-bf7b646236cd	00000000-5588-0069-8167-7bba6faade0d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5588-0069-91bc-4e8da931e00d	00000000-5588-0069-8167-7bba6faade0d	00010000-5588-0068-a795-a9634a6cc298	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5588-0069-bda4-ef2c45d8f6d6	00000000-5588-0069-91d1-598b9035e0e0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2837 (class 0 OID 7923641)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5588-0069-eda7-1dcb04747685	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5588-0069-490a-d12ba4594b1b	00010000-5588-0069-66a8-a57d4d3c83ef	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5588-0069-c432-4dbe684d4a30	00010000-5588-0069-8078-5f3fe84cc9f1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5588-0069-de0b-bafc7457268b	00010000-5588-0069-a651-15199c89b849	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5588-0069-ff1f-fe2ad2e2e1b8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5588-0069-34f7-28b0ed0d5638	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5588-0069-b402-dbf3d65f97cf	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5588-0069-e770-2144f2f89675	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5588-0069-9079-43781c81ba7c	00010000-5588-0069-a813-619e82207b93	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5588-0069-3d54-e3a58a56b3a2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5588-0069-6792-eef241ed1586	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5588-0069-f3b8-748947ce7264	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5588-0069-95df-01d4c4bb763a	00010000-5588-0069-a265-f01c4da0a65c	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2826 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 7923595)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5588-0067-3fc3-9efb7c1236fb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5588-0067-9395-db684dd28f5c	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5588-0067-793e-0927eb768afe	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5588-0067-c5e2-61806d5fd8cd	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5588-0067-55ee-b36b9c5cc756	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5588-0067-c239-3bde7ff19221	Abonma-read	Abonma - branje	f
00030000-5588-0067-3b2a-35e843941314	Abonma-write	Abonma - spreminjanje	f
00030000-5588-0067-8551-0f7dd6042ee1	Alternacija-read	Alternacija - branje	f
00030000-5588-0067-3221-64b5d0526657	Alternacija-write	Alternacija - spreminjanje	f
00030000-5588-0067-7550-1377ea0ffd46	Arhivalija-read	Arhivalija - branje	f
00030000-5588-0067-9855-887c9bc00000	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5588-0067-89a3-5ee2ee8c6c0f	Besedilo-read	Besedilo - branje	f
00030000-5588-0067-7057-f4ad650598d7	Besedilo-write	Besedilo - spreminjanje	f
00030000-5588-0067-658c-b70fe3e02d2e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5588-0067-dbdd-3c9a896eabad	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5588-0067-c10b-53962215de9b	Dogodek-read	Dogodek - branje	f
00030000-5588-0067-5025-9f8634392462	Dogodek-write	Dogodek - spreminjanje	f
00030000-5588-0067-bc05-cc45914cde38	Drzava-read	Drzava - branje	f
00030000-5588-0067-0330-311aa171a4e4	Drzava-write	Drzava - spreminjanje	f
00030000-5588-0067-c80f-8127cc0e5033	Funkcija-read	Funkcija - branje	f
00030000-5588-0067-a9dc-54da2c469f81	Funkcija-write	Funkcija - spreminjanje	f
00030000-5588-0067-49ba-0f9a648c87c9	Gostovanje-read	Gostovanje - branje	f
00030000-5588-0067-6eae-39e659c6e774	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5588-0067-ac97-07eb3b0457e4	Gostujoca-read	Gostujoca - branje	f
00030000-5588-0067-5189-43309b811e95	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5588-0067-9fb7-b9e713bfe4cd	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5588-0067-aa4d-a748ed6d03d0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5588-0067-a894-82e35a8f9d2b	Kupec-read	Kupec - branje	f
00030000-5588-0067-0680-11c2347ae04a	Kupec-write	Kupec - spreminjanje	f
00030000-5588-0067-4a27-5a6def6cfb9a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5588-0067-778e-b61f3dbfe91e	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5588-0067-87ec-03299644db01	Option-read	Option - branje	f
00030000-5588-0067-dc00-accba54c8dfe	Option-write	Option - spreminjanje	f
00030000-5588-0067-0953-598066ec8a0f	OptionValue-read	OptionValue - branje	f
00030000-5588-0067-141e-c76bb61691d2	OptionValue-write	OptionValue - spreminjanje	f
00030000-5588-0067-7ee7-af257e10ad69	Oseba-read	Oseba - branje	f
00030000-5588-0067-ea16-629f7a01aad7	Oseba-write	Oseba - spreminjanje	f
00030000-5588-0067-2f8e-3dae69d308fa	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5588-0067-7bae-02549c1ae2ed	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5588-0067-ab77-7c60ba86554b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5588-0067-5d77-1c9605428657	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5588-0067-ed2d-143a2b5c8bb8	Pogodba-read	Pogodba - branje	f
00030000-5588-0067-6998-fdde2e62b153	Pogodba-write	Pogodba - spreminjanje	f
00030000-5588-0067-8f0e-7341e3cdc4f3	Popa-read	Popa - branje	f
00030000-5588-0067-3439-c60de73e9ecd	Popa-write	Popa - spreminjanje	f
00030000-5588-0067-a98f-7daa44a451a6	Posta-read	Posta - branje	f
00030000-5588-0067-370e-4cca19b29951	Posta-write	Posta - spreminjanje	f
00030000-5588-0067-5a26-7dd24d16c01f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5588-0067-2dcb-5154c4ef9863	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5588-0067-0cbb-7e47fb52655e	PostniNaslov-read	PostniNaslov - branje	f
00030000-5588-0067-4009-5b3e1a04767f	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5588-0067-da7d-ad73b1ef8976	Predstava-read	Predstava - branje	f
00030000-5588-0067-e188-a449d58bcdfe	Predstava-write	Predstava - spreminjanje	f
00030000-5588-0067-bc46-90c0bac1f577	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5588-0067-1f41-1c31d8bc1389	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5588-0067-cc0a-02d64e11abc6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5588-0067-5575-3aefec695d16	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5588-0067-cf9c-025f9b999b76	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5588-0067-07e5-5495102b7548	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5588-0067-1592-51c7f858967e	ProgramDela-read	ProgramDela - branje	f
00030000-5588-0067-bfee-16ca8c5a4e36	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5588-0067-9b9b-224f6b14df72	ProgramFestival-read	ProgramFestival - branje	f
00030000-5588-0067-69d9-ad610b00d5a4	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5588-0067-4df3-5305e2bb95ba	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5588-0067-409b-2ab5460da61c	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5588-0067-0ad5-bf010430f655	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5588-0067-40d3-5607af619056	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5588-0067-b9b3-b6e80f8aec6f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5588-0067-a67f-114900dfb25e	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5588-0067-d97e-7c744bae1c38	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5588-0067-4ae7-3406e25bd8f4	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5588-0067-2c78-c14b9725550c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5588-0067-909e-1d750345fd95	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5588-0067-31ce-a29d07410ff2	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5588-0067-d29b-f2354b2d3ff7	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5588-0067-bf82-1de4a4bd34e9	ProgramRazno-read	ProgramRazno - branje	f
00030000-5588-0067-47b3-293d7e391732	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5588-0067-f528-60285f351ff8	Prostor-read	Prostor - branje	f
00030000-5588-0067-e63d-ba9c9a173965	Prostor-write	Prostor - spreminjanje	f
00030000-5588-0067-f24f-0817862e5c63	Racun-read	Racun - branje	f
00030000-5588-0067-ee00-01360fa303e4	Racun-write	Racun - spreminjanje	f
00030000-5588-0067-83e5-83141f165699	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5588-0067-85cc-c6a9c8e29aff	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5588-0067-1141-d6ecc2593559	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5588-0067-1880-95c8f3521edb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5588-0067-7429-4aabc931825a	Rekvizit-read	Rekvizit - branje	f
00030000-5588-0067-a22d-f4bfa51c0316	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5588-0067-1b3b-715c78bedb6c	Revizija-read	Revizija - branje	f
00030000-5588-0067-3857-3b264e96a833	Revizija-write	Revizija - spreminjanje	f
00030000-5588-0067-b892-7f69fe4804d5	Rezervacija-read	Rezervacija - branje	f
00030000-5588-0067-eeae-67f1e1c63640	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5588-0067-80ea-bd548628c75e	SedezniRed-read	SedezniRed - branje	f
00030000-5588-0067-733f-b71781aafae2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5588-0067-1ae9-abeb9404beeb	Sedez-read	Sedez - branje	f
00030000-5588-0067-c265-6e0037b3fb98	Sedez-write	Sedez - spreminjanje	f
00030000-5588-0067-cad6-ac4c75446360	Sezona-read	Sezona - branje	f
00030000-5588-0067-c07a-3900c50cbb4c	Sezona-write	Sezona - spreminjanje	f
00030000-5588-0067-6fcb-ab7a29685f53	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5588-0067-1f65-722bd85f7e18	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5588-0067-8343-9671518b83eb	Stevilcenje-read	Stevilcenje - branje	f
00030000-5588-0067-4840-d51ba252c66e	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5588-0067-555c-d92db21be52b	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5588-0067-7ef1-c98e308078a5	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5588-0067-c7b5-ba588fe8bc8a	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5588-0067-272a-469b71bf891d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5588-0067-e189-4442fc13cd66	Telefonska-read	Telefonska - branje	f
00030000-5588-0067-6d80-5131293c880c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5588-0067-09bf-99a4b10f176d	TerminStoritve-read	TerminStoritve - branje	f
00030000-5588-0067-9027-4f960d934bc8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5588-0067-5f16-4417f13b1713	TipFunkcije-read	TipFunkcije - branje	f
00030000-5588-0067-8c0f-5493e6a2c910	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5588-0067-002e-73568c5b34b8	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5588-0067-b1ea-4f1438135989	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5588-0067-59d8-8d676cf0f331	Trr-read	Trr - branje	f
00030000-5588-0067-351c-4babb406a2d4	Trr-write	Trr - spreminjanje	f
00030000-5588-0067-36b6-ee2700e0b2b6	Uprizoritev-read	Uprizoritev - branje	f
00030000-5588-0067-d629-10116e8633de	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5588-0067-621e-9dcb1ec92a52	Vaja-read	Vaja - branje	f
00030000-5588-0067-c0bf-8736e7a6934c	Vaja-write	Vaja - spreminjanje	f
00030000-5588-0067-95ac-80fa08cca2c9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5588-0067-188d-2aa6719b1b29	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5588-0067-c0ca-fea3758c87c7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5588-0067-e8d0-dbd405f16ba6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5588-0067-8de2-30467ac48711	Zasedenost-read	Zasedenost - branje	f
00030000-5588-0067-eaf2-72572975a581	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5588-0067-2f9e-fe268aa8e737	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5588-0067-a3b5-cdb12fd6765a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5588-0067-10a0-220f997d727a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5588-0067-eceb-dfe8edc6628b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2834 (class 0 OID 7923614)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5588-0067-cd25-ab5367194318	00030000-5588-0067-9395-db684dd28f5c
00020000-5588-0067-4ef2-242ab5e81ec0	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-3b2a-35e843941314
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-8551-0f7dd6042ee1
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-3221-64b5d0526657
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c5e2-61806d5fd8cd
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-5025-9f8634392462
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-0330-311aa171a4e4
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c80f-8127cc0e5033
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-a9dc-54da2c469f81
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-6eae-39e659c6e774
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-5189-43309b811e95
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-9fb7-b9e713bfe4cd
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-aa4d-a748ed6d03d0
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-87ec-03299644db01
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-7ee7-af257e10ad69
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-ea16-629f7a01aad7
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-3439-c60de73e9ecd
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-370e-4cca19b29951
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-0cbb-7e47fb52655e
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-4009-5b3e1a04767f
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-e188-a449d58bcdfe
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-cf9c-025f9b999b76
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-07e5-5495102b7548
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-e63d-ba9c9a173965
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-1880-95c8f3521edb
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-a22d-f4bfa51c0316
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c07a-3900c50cbb4c
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-5f16-4417f13b1713
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-36b6-ee2700e0b2b6
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-d629-10116e8633de
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-621e-9dcb1ec92a52
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-c0bf-8736e7a6934c
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-8de2-30467ac48711
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-eaf2-72572975a581
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0068-0c33-f6e7cdc8ba13	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-9fb7-b9e713bfe4cd
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-aa4d-a748ed6d03d0
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-87ec-03299644db01
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-7ee7-af257e10ad69
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-ea16-629f7a01aad7
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-0cbb-7e47fb52655e
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-4009-5b3e1a04767f
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-e189-4442fc13cd66
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-6d80-5131293c880c
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-59d8-8d676cf0f331
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-351c-4babb406a2d4
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-c0ca-fea3758c87c7
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-e8d0-dbd405f16ba6
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0068-d698-c4165488a88e	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-8551-0f7dd6042ee1
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-9855-887c9bc00000
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-89a3-5ee2ee8c6c0f
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-658c-b70fe3e02d2e
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-c80f-8127cc0e5033
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-9fb7-b9e713bfe4cd
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-87ec-03299644db01
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-7ee7-af257e10ad69
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-cf9c-025f9b999b76
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-5f16-4417f13b1713
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-621e-9dcb1ec92a52
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-8de2-30467ac48711
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0068-bac6-871e95b5ca2f	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-3b2a-35e843941314
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-3221-64b5d0526657
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-87ec-03299644db01
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-5f16-4417f13b1713
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0068-0640-3ebb84f8e55a	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-87ec-03299644db01
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-09bf-99a4b10f176d
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-793e-0927eb768afe
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-5f16-4417f13b1713
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0068-4e63-480d0261c0c9	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-3fc3-9efb7c1236fb
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-9395-db684dd28f5c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-793e-0927eb768afe
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c5e2-61806d5fd8cd
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-55ee-b36b9c5cc756
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c239-3bde7ff19221
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-3b2a-35e843941314
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-8551-0f7dd6042ee1
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-3221-64b5d0526657
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7550-1377ea0ffd46
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-9855-887c9bc00000
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-89a3-5ee2ee8c6c0f
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7057-f4ad650598d7
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-658c-b70fe3e02d2e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-dbdd-3c9a896eabad
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c10b-53962215de9b
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5025-9f8634392462
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-bc05-cc45914cde38
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-0330-311aa171a4e4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c80f-8127cc0e5033
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a9dc-54da2c469f81
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-49ba-0f9a648c87c9
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-6eae-39e659c6e774
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-ac97-07eb3b0457e4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5189-43309b811e95
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-9fb7-b9e713bfe4cd
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-aa4d-a748ed6d03d0
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a894-82e35a8f9d2b
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-0680-11c2347ae04a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-4a27-5a6def6cfb9a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-778e-b61f3dbfe91e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-87ec-03299644db01
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-dc00-accba54c8dfe
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-0953-598066ec8a0f
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-141e-c76bb61691d2
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7ee7-af257e10ad69
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-ea16-629f7a01aad7
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-2f8e-3dae69d308fa
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7bae-02549c1ae2ed
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-ab77-7c60ba86554b
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5d77-1c9605428657
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-ed2d-143a2b5c8bb8
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-6998-fdde2e62b153
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-8f0e-7341e3cdc4f3
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-3439-c60de73e9ecd
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a98f-7daa44a451a6
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-370e-4cca19b29951
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5a26-7dd24d16c01f
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-2dcb-5154c4ef9863
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-0cbb-7e47fb52655e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-4009-5b3e1a04767f
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-da7d-ad73b1ef8976
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-e188-a449d58bcdfe
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-bc46-90c0bac1f577
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1f41-1c31d8bc1389
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-cc0a-02d64e11abc6
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5575-3aefec695d16
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-cf9c-025f9b999b76
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-07e5-5495102b7548
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1592-51c7f858967e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-bfee-16ca8c5a4e36
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-9b9b-224f6b14df72
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-69d9-ad610b00d5a4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-4df3-5305e2bb95ba
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-409b-2ab5460da61c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-0ad5-bf010430f655
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-40d3-5607af619056
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-b9b3-b6e80f8aec6f
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a67f-114900dfb25e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-d97e-7c744bae1c38
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-4ae7-3406e25bd8f4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-2c78-c14b9725550c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-909e-1d750345fd95
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-31ce-a29d07410ff2
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-d29b-f2354b2d3ff7
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-bf82-1de4a4bd34e9
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-47b3-293d7e391732
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-f528-60285f351ff8
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-e63d-ba9c9a173965
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-f24f-0817862e5c63
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-ee00-01360fa303e4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-83e5-83141f165699
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-85cc-c6a9c8e29aff
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1141-d6ecc2593559
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1880-95c8f3521edb
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7429-4aabc931825a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a22d-f4bfa51c0316
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1b3b-715c78bedb6c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-3857-3b264e96a833
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-b892-7f69fe4804d5
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-eeae-67f1e1c63640
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-80ea-bd548628c75e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-733f-b71781aafae2
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1ae9-abeb9404beeb
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c265-6e0037b3fb98
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-cad6-ac4c75446360
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c07a-3900c50cbb4c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-6fcb-ab7a29685f53
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-1f65-722bd85f7e18
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-8343-9671518b83eb
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-4840-d51ba252c66e
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-555c-d92db21be52b
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-7ef1-c98e308078a5
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c7b5-ba588fe8bc8a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-272a-469b71bf891d
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-e189-4442fc13cd66
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-6d80-5131293c880c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-09bf-99a4b10f176d
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-9027-4f960d934bc8
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-5f16-4417f13b1713
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-8c0f-5493e6a2c910
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-002e-73568c5b34b8
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-b1ea-4f1438135989
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-59d8-8d676cf0f331
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-351c-4babb406a2d4
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-36b6-ee2700e0b2b6
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-d629-10116e8633de
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-621e-9dcb1ec92a52
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c0bf-8736e7a6934c
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-95ac-80fa08cca2c9
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-188d-2aa6719b1b29
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-c0ca-fea3758c87c7
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-e8d0-dbd405f16ba6
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-8de2-30467ac48711
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-eaf2-72572975a581
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-2f9e-fe268aa8e737
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-a3b5-cdb12fd6765a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-10a0-220f997d727a
00020000-5588-0069-5506-8bfebff14549	00030000-5588-0067-eceb-dfe8edc6628b
\.


--
-- TOC entry 2862 (class 0 OID 7923909)
-- Dependencies: 208
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7923940)
-- Dependencies: 212
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 7924076)
-- Dependencies: 224
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5588-0069-55cc-c410d2468f77	00090000-5588-0069-eda7-1dcb04747685	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2839 (class 0 OID 7923674)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5588-0069-343b-fc1f770631e2	00040000-5588-0067-3a3c-b4fb5bc8f3cf	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-0069-f0ba-c7269cfd8ced	00040000-5588-0067-3a3c-b4fb5bc8f3cf	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-0069-ce57-99ecd136bb4a	00040000-5588-0067-3a3c-b4fb5bc8f3cf	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-0069-37bb-eefd095b9ffb	00040000-5588-0067-3a3c-b4fb5bc8f3cf	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-0069-19d9-e2bd0b4ccdab	00040000-5588-0067-3a3c-b4fb5bc8f3cf	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-0069-1daf-2e84c904e3db	00040000-5588-0067-a55a-e91891cad2ab	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2841 (class 0 OID 7923709)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5588-0068-4d04-a380b31828b4	8341	Adlešiči
00050000-5588-0068-c7aa-30f0d016c3b8	5270	Ajdovščina
00050000-5588-0068-d803-b1e92ea435b3	6280	Ankaran/Ancarano
00050000-5588-0068-4464-a1f4251465b0	9253	Apače
00050000-5588-0068-c5d8-5a3b5c4f8065	8253	Artiče
00050000-5588-0068-1b04-8960f653998a	4275	Begunje na Gorenjskem
00050000-5588-0068-78f0-5b7c170b3272	1382	Begunje pri Cerknici
00050000-5588-0068-4f14-bd091483a276	9231	Beltinci
00050000-5588-0068-333e-3a8af0e291e7	2234	Benedikt
00050000-5588-0068-3c5a-ae9159003d0b	2345	Bistrica ob Dravi
00050000-5588-0068-97be-8c237b7ba653	3256	Bistrica ob Sotli
00050000-5588-0068-af29-d6fea37f2ae5	8259	Bizeljsko
00050000-5588-0068-cafd-9877f0e6baf1	1223	Blagovica
00050000-5588-0068-1749-1fec7b692599	8283	Blanca
00050000-5588-0068-9997-d19bc1a6d2aa	4260	Bled
00050000-5588-0068-1381-d59cbb062eff	4273	Blejska Dobrava
00050000-5588-0068-292c-9c8456396865	9265	Bodonci
00050000-5588-0068-56d4-62aff38bf78b	9222	Bogojina
00050000-5588-0068-9acd-54245d875f77	4263	Bohinjska Bela
00050000-5588-0068-ff7a-8faeedeeb49f	4264	Bohinjska Bistrica
00050000-5588-0068-4652-e1d276e7bece	4265	Bohinjsko jezero
00050000-5588-0068-40c8-145a14787d05	1353	Borovnica
00050000-5588-0068-233e-1744984634f7	8294	Boštanj
00050000-5588-0068-d388-602f6f91b4c0	5230	Bovec
00050000-5588-0068-0fb0-16bfaeed298f	5295	Branik
00050000-5588-0068-a34d-67d6350e686d	3314	Braslovče
00050000-5588-0068-b1c1-0993d148c054	5223	Breginj
00050000-5588-0068-ab21-afc991dd9839	8280	Brestanica
00050000-5588-0068-3fe7-5ee3208403c4	2354	Bresternica
00050000-5588-0068-5210-bfbb917b2605	4243	Brezje
00050000-5588-0068-a29a-f74baa8331a0	1351	Brezovica pri Ljubljani
00050000-5588-0068-b0ce-e392174a64f8	8250	Brežice
00050000-5588-0068-7bf4-5360981c1c7a	4210	Brnik - Aerodrom
00050000-5588-0068-b8b9-6bb1fc8317a8	8321	Brusnice
00050000-5588-0068-52ae-bd1de8377c79	3255	Buče
00050000-5588-0068-a83e-1693583853d3	8276	Bučka 
00050000-5588-0068-6ed7-2462cc93d34b	9261	Cankova
00050000-5588-0068-0ca6-96b8f9ab3bd8	3000	Celje 
00050000-5588-0068-b70e-133a34e0cbed	3001	Celje - poštni predali
00050000-5588-0068-1f8a-fd648916e91a	4207	Cerklje na Gorenjskem
00050000-5588-0068-13d3-e114035374f3	8263	Cerklje ob Krki
00050000-5588-0068-89f3-1aba3ab7b022	1380	Cerknica
00050000-5588-0068-f747-225f6a96faa2	5282	Cerkno
00050000-5588-0068-f59f-9e9153237524	2236	Cerkvenjak
00050000-5588-0068-e2a2-ca775a3894bd	2215	Ceršak
00050000-5588-0068-05ef-44fb68ca3d42	2326	Cirkovce
00050000-5588-0068-ef46-0d2fabf1584e	2282	Cirkulane
00050000-5588-0068-a4dc-cd7c3fc1f035	5273	Col
00050000-5588-0068-a6ee-18094e9ead0d	8251	Čatež ob Savi
00050000-5588-0068-0e5e-96cc6cdd1f37	1413	Čemšenik
00050000-5588-0068-94aa-79a61f2aa8b7	5253	Čepovan
00050000-5588-0068-01f9-0a360d85ba6e	9232	Črenšovci
00050000-5588-0068-0173-2a8851a05998	2393	Črna na Koroškem
00050000-5588-0068-90ca-7c0ef270a749	6275	Črni Kal
00050000-5588-0068-b387-b9eccbbd3b3a	5274	Črni Vrh nad Idrijo
00050000-5588-0068-2881-996c977c968d	5262	Črniče
00050000-5588-0068-9829-6a7c4f2da7d2	8340	Črnomelj
00050000-5588-0068-24ea-98bc8e3b7cc8	6271	Dekani
00050000-5588-0068-60b1-70bee29d0142	5210	Deskle
00050000-5588-0068-c5e0-986f24bfdb53	2253	Destrnik
00050000-5588-0068-f568-ee730777c042	6215	Divača
00050000-5588-0068-1452-af19da0b820d	1233	Dob
00050000-5588-0068-c480-cd97df12ec42	3224	Dobje pri Planini
00050000-5588-0068-d97c-8689dbd61823	8257	Dobova
00050000-5588-0068-616c-46cccbeb2a2e	1423	Dobovec
00050000-5588-0068-6bfa-6706dbe02862	5263	Dobravlje
00050000-5588-0068-a5d9-fd7a5770778e	3204	Dobrna
00050000-5588-0068-8e23-1c49a9902efc	8211	Dobrnič
00050000-5588-0068-9cec-4aa9fb4e28c5	1356	Dobrova
00050000-5588-0068-5e4d-17022c4893fe	9223	Dobrovnik/Dobronak 
00050000-5588-0068-3764-397781d350f4	5212	Dobrovo v Brdih
00050000-5588-0068-25ee-ed379bde563e	1431	Dol pri Hrastniku
00050000-5588-0068-b713-9c0fe6157b00	1262	Dol pri Ljubljani
00050000-5588-0068-ac5b-26b5fa3e179f	1273	Dole pri Litiji
00050000-5588-0068-446e-8e2b403cf700	1331	Dolenja vas
00050000-5588-0068-b4aa-d30c0253888b	8350	Dolenjske Toplice
00050000-5588-0068-967c-8288d44531c5	1230	Domžale
00050000-5588-0068-736b-277f5b43a360	2252	Dornava
00050000-5588-0068-0e58-e2b3f0b71f42	5294	Dornberk
00050000-5588-0068-bed3-2566a46b565e	1319	Draga
00050000-5588-0068-2184-cd080b9ff909	8343	Dragatuš
00050000-5588-0068-6f5e-0780132a0424	3222	Dramlje
00050000-5588-0068-2153-8441db0aed94	2370	Dravograd
00050000-5588-0068-2960-e328a80446b4	4203	Duplje
00050000-5588-0068-0413-25fd92004caa	6221	Dutovlje
00050000-5588-0068-a3f8-f5427080802e	8361	Dvor
00050000-5588-0068-3d90-e94e119efd9b	2343	Fala
00050000-5588-0068-89fe-8977f78aab5b	9208	Fokovci
00050000-5588-0068-1d24-c384a108cd6c	2313	Fram
00050000-5588-0068-8aa1-3eb3a8002cfa	3213	Frankolovo
00050000-5588-0068-4e5e-005a55a2fc95	1274	Gabrovka
00050000-5588-0068-6255-e04d83c29f30	8254	Globoko
00050000-5588-0068-54de-3b9e55c7a5a2	5275	Godovič
00050000-5588-0068-cb47-2b5f65985bdd	4204	Golnik
00050000-5588-0068-7561-6fe3384ea45e	3303	Gomilsko
00050000-5588-0068-877f-aff8d91d5ac3	4224	Gorenja vas
00050000-5588-0068-4ac2-29b2b0b4bb2a	3263	Gorica pri Slivnici
00050000-5588-0068-d811-ffc5769d979e	2272	Gorišnica
00050000-5588-0068-980f-6f0ac0b2c447	9250	Gornja Radgona
00050000-5588-0068-7f74-c5314b7dee48	3342	Gornji Grad
00050000-5588-0068-e5c2-3cca69bc2ce7	4282	Gozd Martuljek
00050000-5588-0068-ef6f-109b629c1870	6272	Gračišče
00050000-5588-0068-a308-bb3ac28b6ceb	9264	Grad
00050000-5588-0068-b1d2-c622787d0c65	8332	Gradac
00050000-5588-0068-b900-4bc9196cb94e	1384	Grahovo
00050000-5588-0068-1082-c55b266bb3cb	5242	Grahovo ob Bači
00050000-5588-0068-4744-5056a3e15bd9	5251	Grgar
00050000-5588-0068-cd22-dd9d4e50aa2f	3302	Griže
00050000-5588-0068-9215-59961d973e9a	3231	Grobelno
00050000-5588-0068-0e2c-aee6355b6887	1290	Grosuplje
00050000-5588-0068-d817-c23b16371386	2288	Hajdina
00050000-5588-0068-8220-1e546b8f7cc5	8362	Hinje
00050000-5588-0068-2a59-d99773cf04bc	2311	Hoče
00050000-5588-0068-19b3-15e5a99e9987	9205	Hodoš/Hodos
00050000-5588-0068-be93-b15e33b40e7d	1354	Horjul
00050000-5588-0068-7c24-f2926941d336	1372	Hotedršica
00050000-5588-0068-bd12-9338d868aa61	1430	Hrastnik
00050000-5588-0068-6aa0-f475a1b524e8	6225	Hruševje
00050000-5588-0068-4133-ad08dee31167	4276	Hrušica
00050000-5588-0068-a2ba-a1a5047b00a4	5280	Idrija
00050000-5588-0068-85c1-c9a5bc6376dc	1292	Ig
00050000-5588-0068-107f-48ad72ff65fd	6250	Ilirska Bistrica
00050000-5588-0068-93f6-6559fcc05edf	6251	Ilirska Bistrica-Trnovo
00050000-5588-0068-f9db-91709d0f7f56	1295	Ivančna Gorica
00050000-5588-0068-bd6b-a5d63621afce	2259	Ivanjkovci
00050000-5588-0068-5ce8-6589190117c8	1411	Izlake
00050000-5588-0068-e736-84d84522617e	6310	Izola/Isola
00050000-5588-0068-8fb1-7714021b0538	2222	Jakobski Dol
00050000-5588-0068-4f3b-d83cd7711497	2221	Jarenina
00050000-5588-0068-b834-761d104067f2	6254	Jelšane
00050000-5588-0068-b47e-e1d3fdd51eac	4270	Jesenice
00050000-5588-0068-beb1-fb7293c405a9	8261	Jesenice na Dolenjskem
00050000-5588-0068-e05d-208bf0bf4872	3273	Jurklošter
00050000-5588-0068-5cd9-8f270bcb3ff7	2223	Jurovski Dol
00050000-5588-0068-095a-fa3bbdcba74e	2256	Juršinci
00050000-5588-0068-fdd9-8a23759aff88	5214	Kal nad Kanalom
00050000-5588-0068-95df-303b5f39c200	3233	Kalobje
00050000-5588-0068-bc94-70f8f5e42eeb	4246	Kamna Gorica
00050000-5588-0068-4b19-263402f11026	2351	Kamnica
00050000-5588-0068-c29f-f4a8215488d8	1241	Kamnik
00050000-5588-0068-01ab-beb1bf0d23d3	5213	Kanal
00050000-5588-0068-2599-5d22d6cf14c3	8258	Kapele
00050000-5588-0068-1930-7c6fe304d5da	2362	Kapla
00050000-5588-0068-3fd1-b8e1f7091bad	2325	Kidričevo
00050000-5588-0068-be13-063d06ca8cd0	1412	Kisovec
00050000-5588-0068-21e9-60df5a5704cc	6253	Knežak
00050000-5588-0068-00e0-3b5754290820	5222	Kobarid
00050000-5588-0068-3321-02be718a1d50	9227	Kobilje
00050000-5588-0068-ac9c-f88aec120888	1330	Kočevje
00050000-5588-0068-d0a5-8d01d51890a2	1338	Kočevska Reka
00050000-5588-0068-6fb2-48265ce6a9ad	2276	Kog
00050000-5588-0068-ca4c-c7b5f1dd48bb	5211	Kojsko
00050000-5588-0068-f088-80d0dd04e211	6223	Komen
00050000-5588-0068-7b3d-a8a00b8ca080	1218	Komenda
00050000-5588-0068-5dc6-8a6ead55b17b	6000	Koper/Capodistria 
00050000-5588-0068-8c19-8ff1bcfcf5c4	6001	Koper/Capodistria - poštni predali
00050000-5588-0068-7296-339c786b74c4	8282	Koprivnica
00050000-5588-0068-e910-7d492aa79aca	5296	Kostanjevica na Krasu
00050000-5588-0068-6b5d-ae256a8765bf	8311	Kostanjevica na Krki
00050000-5588-0068-9286-6024a731ee86	1336	Kostel
00050000-5588-0068-e2c3-1c4e016d65c1	6256	Košana
00050000-5588-0068-0d58-619a0fdf4bfe	2394	Kotlje
00050000-5588-0068-9372-f7139f7c288f	6240	Kozina
00050000-5588-0068-462f-0c3c74a16bb0	3260	Kozje
00050000-5588-0068-238b-85e68d9b68ee	4000	Kranj 
00050000-5588-0068-7f4e-bdaa9ecdb5b2	4001	Kranj - poštni predali
00050000-5588-0068-4765-9be477d2de5f	4280	Kranjska Gora
00050000-5588-0068-363c-10fb16dc1153	1281	Kresnice
00050000-5588-0068-93be-4be8a75203f8	4294	Križe
00050000-5588-0068-3678-2e39335190eb	9206	Križevci
00050000-5588-0068-2f52-b8504d6b3fe0	9242	Križevci pri Ljutomeru
00050000-5588-0068-78a3-e1dfb52504e7	1301	Krka
00050000-5588-0068-f1a3-ed0955682a99	8296	Krmelj
00050000-5588-0068-fe25-2a0d9dffebb8	4245	Kropa
00050000-5588-0068-5365-f680d6355b30	8262	Krška vas
00050000-5588-0068-8fb1-83957c8a564b	8270	Krško
00050000-5588-0068-4bd0-a2336721ab0b	9263	Kuzma
00050000-5588-0068-a968-7f3898def284	2318	Laporje
00050000-5588-0068-93fe-b8204ae22d1e	3270	Laško
00050000-5588-0068-ec1e-f132b9ed5c3c	1219	Laze v Tuhinju
00050000-5588-0068-3042-b4eb6dd8a5ae	2230	Lenart v Slovenskih goricah
00050000-5588-0068-674a-3772162d2f84	9220	Lendava/Lendva
00050000-5588-0068-718e-3aa7463ce83d	4248	Lesce
00050000-5588-0068-97d5-096506c05ba3	3261	Lesično
00050000-5588-0068-57b0-8b9ce4fcd0d1	8273	Leskovec pri Krškem
00050000-5588-0068-737f-7be3d7afb86c	2372	Libeliče
00050000-5588-0068-f478-ad2fd5c5fa82	2341	Limbuš
00050000-5588-0068-f5de-e898ceba029d	1270	Litija
00050000-5588-0068-ad72-cd21b1b4f13c	3202	Ljubečna
00050000-5588-0068-dc9b-e702b098cadb	1000	Ljubljana 
00050000-5588-0068-ea90-f0ed638e3858	1001	Ljubljana - poštni predali
00050000-5588-0068-13e7-556317c5dfa6	1231	Ljubljana - Črnuče
00050000-5588-0068-e02c-1f6998576fd0	1261	Ljubljana - Dobrunje
00050000-5588-0068-5179-fe272494bad9	1260	Ljubljana - Polje
00050000-5588-0068-a035-d46db19065b9	1210	Ljubljana - Šentvid
00050000-5588-0068-dd4a-fe6cb18c3a8a	1211	Ljubljana - Šmartno
00050000-5588-0068-0859-fcd34e16c2a6	3333	Ljubno ob Savinji
00050000-5588-0068-b0de-7a3bb3af43c9	9240	Ljutomer
00050000-5588-0068-60d4-67d3c3d34563	3215	Loče
00050000-5588-0068-78d5-40e185f62ea4	5231	Log pod Mangartom
00050000-5588-0068-0628-495013fb7439	1358	Log pri Brezovici
00050000-5588-0068-0e01-423de3dd64f9	1370	Logatec
00050000-5588-0068-9806-0d081e5bf360	1371	Logatec
00050000-5588-0068-6020-47ad02f1fd59	1434	Loka pri Zidanem Mostu
00050000-5588-0068-f81e-89733101eefe	3223	Loka pri Žusmu
00050000-5588-0068-29b2-a266ed803d8d	6219	Lokev
00050000-5588-0068-d124-62676ff5b99c	1318	Loški Potok
00050000-5588-0068-e4fe-eedb532bb62e	2324	Lovrenc na Dravskem polju
00050000-5588-0068-b726-65439cace6e6	2344	Lovrenc na Pohorju
00050000-5588-0068-cf9a-aa97c3111fac	3334	Luče
00050000-5588-0068-6b37-8b8e8aacb8d0	1225	Lukovica
00050000-5588-0068-eace-6e80791a93fe	9202	Mačkovci
00050000-5588-0068-4c9d-159875a5b69b	2322	Majšperk
00050000-5588-0068-0d50-4ae32d51f821	2321	Makole
00050000-5588-0068-5a15-c9f89ce16d78	9243	Mala Nedelja
00050000-5588-0068-36ea-1a18b48ee107	2229	Malečnik
00050000-5588-0068-500b-0bcafc845bd1	6273	Marezige
00050000-5588-0068-f877-799cf03ca1be	2000	Maribor 
00050000-5588-0068-75e6-1dc8367cffe4	2001	Maribor - poštni predali
00050000-5588-0068-da70-4dd603421c32	2206	Marjeta na Dravskem polju
00050000-5588-0068-1e4f-e34e80cec8ec	2281	Markovci
00050000-5588-0068-399a-3431eb677145	9221	Martjanci
00050000-5588-0068-1090-7289a9294af5	6242	Materija
00050000-5588-0068-efec-2ad21b5d25c7	4211	Mavčiče
00050000-5588-0068-e805-20dd642ba14b	1215	Medvode
00050000-5588-0068-c3c8-cc0089475b02	1234	Mengeš
00050000-5588-0068-9c32-48948bc425ec	8330	Metlika
00050000-5588-0068-5061-ed9506a3b99b	2392	Mežica
00050000-5588-0068-5695-d0613316a8fb	2204	Miklavž na Dravskem polju
00050000-5588-0068-eb74-fd6fb7daf21b	2275	Miklavž pri Ormožu
00050000-5588-0068-01be-eb60eee29a2c	5291	Miren
00050000-5588-0068-3b81-7e8dae3e8486	8233	Mirna
00050000-5588-0068-f039-a2265a634fef	8216	Mirna Peč
00050000-5588-0068-5baf-869ca88fccc3	2382	Mislinja
00050000-5588-0068-be92-8adaa0bb5227	4281	Mojstrana
00050000-5588-0068-fa55-a924c2818c35	8230	Mokronog
00050000-5588-0068-b376-33c6053ca4a9	1251	Moravče
00050000-5588-0068-a8c6-0ec39a1b20b8	9226	Moravske Toplice
00050000-5588-0068-574e-a1ba72832b34	5216	Most na Soči
00050000-5588-0068-7270-3f94e2920eae	1221	Motnik
00050000-5588-0068-9ed2-831fa4a68dc5	3330	Mozirje
00050000-5588-0068-7795-eb0496c47cf9	9000	Murska Sobota 
00050000-5588-0068-f393-8c1108505d8e	9001	Murska Sobota - poštni predali
00050000-5588-0068-3397-cde9b5aa1750	2366	Muta
00050000-5588-0068-c00d-4bab6d286591	4202	Naklo
00050000-5588-0068-bee3-a34c1de01419	3331	Nazarje
00050000-5588-0068-b9d7-250bc016d9f1	1357	Notranje Gorice
00050000-5588-0068-9e49-69230c4807bc	3203	Nova Cerkev
00050000-5588-0068-1c51-afd17c836221	5000	Nova Gorica 
00050000-5588-0068-cef7-b4e3a0bd8d96	5001	Nova Gorica - poštni predali
00050000-5588-0068-c724-93e26b46585c	1385	Nova vas
00050000-5588-0068-a68c-c6637e52ced8	8000	Novo mesto
00050000-5588-0068-a84d-21b3aee7a8e5	8001	Novo mesto - poštni predali
00050000-5588-0068-a3ae-ae810cf189e8	6243	Obrov
00050000-5588-0068-e521-650d9e038dbd	9233	Odranci
00050000-5588-0068-d3c2-a86488823bde	2317	Oplotnica
00050000-5588-0068-d638-821b31e15544	2312	Orehova vas
00050000-5588-0068-ded3-eff8ef32cfeb	2270	Ormož
00050000-5588-0068-d724-5bf060849173	1316	Ortnek
00050000-5588-0068-26bc-7006f87d57a9	1337	Osilnica
00050000-5588-0068-2331-ce108e885fa4	8222	Otočec
00050000-5588-0068-06f3-28e0d606450f	2361	Ožbalt
00050000-5588-0068-6e95-a30e08a9d491	2231	Pernica
00050000-5588-0068-2bb3-cabbe7f14f46	2211	Pesnica pri Mariboru
00050000-5588-0068-c129-26392b72be4a	9203	Petrovci
00050000-5588-0068-3b34-f74650acac4e	3301	Petrovče
00050000-5588-0068-a20b-d35adf7c82da	6330	Piran/Pirano
00050000-5588-0068-9e06-1e9de1b1c09e	8255	Pišece
00050000-5588-0068-dc41-a4b68df8cdb0	6257	Pivka
00050000-5588-0068-a1f1-e4a766765e90	6232	Planina
00050000-5588-0068-11bb-e5f6515f98a6	3225	Planina pri Sevnici
00050000-5588-0068-6b56-73d03b9350ba	6276	Pobegi
00050000-5588-0068-0aff-912bb01aff90	8312	Podbočje
00050000-5588-0068-ee1d-bb5cdbc71bf6	5243	Podbrdo
00050000-5588-0068-852a-6a68cc17c655	3254	Podčetrtek
00050000-5588-0068-13b9-6a6c46415dc2	2273	Podgorci
00050000-5588-0068-3f3e-622c399c6bb4	6216	Podgorje
00050000-5588-0068-2ce5-483618b5b065	2381	Podgorje pri Slovenj Gradcu
00050000-5588-0068-4ad8-a97225713144	6244	Podgrad
00050000-5588-0068-9dbb-42bd9f916cf3	1414	Podkum
00050000-5588-0068-dc9a-66450c902e6a	2286	Podlehnik
00050000-5588-0068-42df-2ebeb51c0ed1	5272	Podnanos
00050000-5588-0068-c16e-dd8182e6ed82	4244	Podnart
00050000-5588-0068-b04c-786bb290ca40	3241	Podplat
00050000-5588-0068-78cb-91e6d34ddec3	3257	Podsreda
00050000-5588-0068-0ec9-d0f53fd2ba71	2363	Podvelka
00050000-5588-0068-bdd7-e3943891b0f6	2208	Pohorje
00050000-5588-0068-d519-43bdac5bb099	2257	Polenšak
00050000-5588-0068-aed3-13e315a6bfd4	1355	Polhov Gradec
00050000-5588-0068-da79-ee55efc15aad	4223	Poljane nad Škofjo Loko
00050000-5588-0068-bcee-be31c8f2b809	2319	Poljčane
00050000-5588-0068-a591-d46e580fbd77	1272	Polšnik
00050000-5588-0068-0a26-dee027a7c13a	3313	Polzela
00050000-5588-0068-4888-b65c43b2b87a	3232	Ponikva
00050000-5588-0068-e52d-e16ebfb8b6eb	6320	Portorož/Portorose
00050000-5588-0068-0c31-176cecbba3d7	6230	Postojna
00050000-5588-0068-19cd-c9f5dc39aa19	2331	Pragersko
00050000-5588-0068-31ee-3de00da15821	3312	Prebold
00050000-5588-0068-c2bc-84822f457190	4205	Preddvor
00050000-5588-0068-3f45-7ff4545b1c6d	6255	Prem
00050000-5588-0068-17c1-0f5a1570c424	1352	Preserje
00050000-5588-0068-d0bf-a1c1ef526788	6258	Prestranek
00050000-5588-0068-cd26-734439d859ec	2391	Prevalje
00050000-5588-0068-3d7d-cba82a010fa9	3262	Prevorje
00050000-5588-0068-d5c1-c14a05333e94	1276	Primskovo 
00050000-5588-0068-cdec-929cfb1dbffc	3253	Pristava pri Mestinju
00050000-5588-0068-bf96-7710ed50d135	9207	Prosenjakovci/Partosfalva
00050000-5588-0068-14a3-b5540c6d2d0d	5297	Prvačina
00050000-5588-0068-e18e-9006afd17ec0	2250	Ptuj
00050000-5588-0068-91bb-c1245afbb6af	2323	Ptujska Gora
00050000-5588-0068-66f2-3221dcc0b18e	9201	Puconci
00050000-5588-0068-412d-9ddaad277c56	2327	Rače
00050000-5588-0068-5261-91993708a84a	1433	Radeče
00050000-5588-0068-4809-737de3463bac	9252	Radenci
00050000-5588-0068-6895-381ff47785e8	2360	Radlje ob Dravi
00050000-5588-0068-b56d-e3a0bbc2d6fe	1235	Radomlje
00050000-5588-0068-0e3b-754606214724	4240	Radovljica
00050000-5588-0068-52c1-6cd91599f449	8274	Raka
00050000-5588-0068-e5ef-3907e4a232d4	1381	Rakek
00050000-5588-0068-b7fe-c1a5dc45a4fd	4283	Rateče - Planica
00050000-5588-0068-fc65-5ef59685f3ff	2390	Ravne na Koroškem
00050000-5588-0068-e426-d337246b6a14	9246	Razkrižje
00050000-5588-0068-5816-fc0f15fadbf2	3332	Rečica ob Savinji
00050000-5588-0068-0163-bb3ff0cef924	5292	Renče
00050000-5588-0068-a1c6-0d835254b988	1310	Ribnica
00050000-5588-0068-1dc1-16c8badfb59c	2364	Ribnica na Pohorju
00050000-5588-0068-0cf5-b0193bd6b7fb	3272	Rimske Toplice
00050000-5588-0068-6bc6-7c98d9a50a19	1314	Rob
00050000-5588-0068-82fa-8471f1af605e	5215	Ročinj
00050000-5588-0068-6a02-1ac1e5008657	3250	Rogaška Slatina
00050000-5588-0068-9e21-3bf9f0d6e107	9262	Rogašovci
00050000-5588-0068-ddfc-da598ab146ee	3252	Rogatec
00050000-5588-0068-4df3-0abb57c766a8	1373	Rovte
00050000-5588-0068-5d1f-715499fd88d0	2342	Ruše
00050000-5588-0068-4587-d007ecf1f069	1282	Sava
00050000-5588-0068-e48a-16d3821dd0a6	6333	Sečovlje/Sicciole
00050000-5588-0068-468a-bc2edfd13882	4227	Selca
00050000-5588-0068-0b46-5aabdb781551	2352	Selnica ob Dravi
00050000-5588-0068-06ef-06ef3f6c850e	8333	Semič
00050000-5588-0068-6949-8f048572981c	8281	Senovo
00050000-5588-0068-c2a0-a6a3b0c19b22	6224	Senožeče
00050000-5588-0068-3d7a-3aa445a52beb	8290	Sevnica
00050000-5588-0068-bef4-ffeb7dcd78f9	6210	Sežana
00050000-5588-0068-d25c-8b166e557d85	2214	Sladki Vrh
00050000-5588-0068-eea9-5dc8e8d32446	5283	Slap ob Idrijci
00050000-5588-0068-38c3-344997301339	2380	Slovenj Gradec
00050000-5588-0068-1dda-f3ad8c149aa5	2310	Slovenska Bistrica
00050000-5588-0068-2592-c65b0a4e3a2b	3210	Slovenske Konjice
00050000-5588-0068-8d63-f0830a13cf26	1216	Smlednik
00050000-5588-0068-165f-66f5bcf0c1ca	5232	Soča
00050000-5588-0068-a4ea-938eb0193600	1317	Sodražica
00050000-5588-0068-8326-e1e06c7377ae	3335	Solčava
00050000-5588-0068-ff31-2f034178cb7e	5250	Solkan
00050000-5588-0068-f910-012c43bb4b9c	4229	Sorica
00050000-5588-0068-4790-a1c5c93b2011	4225	Sovodenj
00050000-5588-0068-61e4-ca0988d1c2e5	5281	Spodnja Idrija
00050000-5588-0068-e10b-4a00d1dcdac6	2241	Spodnji Duplek
00050000-5588-0068-e5f5-336273ff0da4	9245	Spodnji Ivanjci
00050000-5588-0068-22a8-39e87ef060ef	2277	Središče ob Dravi
00050000-5588-0068-bdbf-90c123708897	4267	Srednja vas v Bohinju
00050000-5588-0068-5079-8be6a452d71e	8256	Sromlje 
00050000-5588-0068-ffff-74f538db80d5	5224	Srpenica
00050000-5588-0068-03bb-41d88424c0c6	1242	Stahovica
00050000-5588-0068-629c-f335a76f5032	1332	Stara Cerkev
00050000-5588-0068-f801-84cdce37decc	8342	Stari trg ob Kolpi
00050000-5588-0068-5011-d8849065f917	1386	Stari trg pri Ložu
00050000-5588-0068-ab0f-1e11ea0cb1fd	2205	Starše
00050000-5588-0068-95ea-6dab274bfb2c	2289	Stoperce
00050000-5588-0068-35f8-c01182b9d867	8322	Stopiče
00050000-5588-0068-6097-369fba5efe36	3206	Stranice
00050000-5588-0068-6138-c345685dd50c	8351	Straža
00050000-5588-0068-84dc-7decc92e9b0e	1313	Struge
00050000-5588-0068-cb16-235b41925018	8293	Studenec
00050000-5588-0068-e300-71cf479a68fd	8331	Suhor
00050000-5588-0068-d239-44a7f0bc8215	2233	Sv. Ana v Slovenskih goricah
00050000-5588-0068-2043-d6c80aaed950	2235	Sv. Trojica v Slovenskih goricah
00050000-5588-0068-7e82-0ab21791b86f	2353	Sveti Duh na Ostrem Vrhu
00050000-5588-0068-8b0e-218df53bce7e	9244	Sveti Jurij ob Ščavnici
00050000-5588-0068-d3ab-4c53589283c7	3264	Sveti Štefan
00050000-5588-0068-e05c-746caef0535d	2258	Sveti Tomaž
00050000-5588-0068-e477-62e85176ebd2	9204	Šalovci
00050000-5588-0068-1d13-8a209d32dab3	5261	Šempas
00050000-5588-0068-464a-6af3fe9b8f02	5290	Šempeter pri Gorici
00050000-5588-0068-3c25-3a5472459961	3311	Šempeter v Savinjski dolini
00050000-5588-0068-2bf1-acb76be06581	4208	Šenčur
00050000-5588-0068-eb4b-38232f50cdfc	2212	Šentilj v Slovenskih goricah
00050000-5588-0068-b056-1eeb1c688ef1	8297	Šentjanž
00050000-5588-0068-db4d-cf55326a0c68	2373	Šentjanž pri Dravogradu
00050000-5588-0068-ea99-1e1c0f38e1a7	8310	Šentjernej
00050000-5588-0068-136f-ee97774dac08	3230	Šentjur
00050000-5588-0068-7030-a7aeb3a4ac2a	3271	Šentrupert
00050000-5588-0068-a5b8-85a6c0debc98	8232	Šentrupert
00050000-5588-0068-467d-d01377968c04	1296	Šentvid pri Stični
00050000-5588-0068-0ab7-3c1b2ae4ba5f	8275	Škocjan
00050000-5588-0068-a814-1a70c68aa494	6281	Škofije
00050000-5588-0068-493b-5a92c200f684	4220	Škofja Loka
00050000-5588-0068-2930-da6670f9bbf6	3211	Škofja vas
00050000-5588-0068-7085-209404a24c05	1291	Škofljica
00050000-5588-0068-f93b-a78996954a01	6274	Šmarje
00050000-5588-0068-2c0a-59044dbc1ea1	1293	Šmarje - Sap
00050000-5588-0068-8796-2f676552ec1a	3240	Šmarje pri Jelšah
00050000-5588-0068-025c-dd9f9264f5a5	8220	Šmarješke Toplice
00050000-5588-0068-8a3f-2bad3614ce66	2315	Šmartno na Pohorju
00050000-5588-0068-46fb-87db1e218dca	3341	Šmartno ob Dreti
00050000-5588-0068-e8b4-6484da820e88	3327	Šmartno ob Paki
00050000-5588-0068-e1e2-f5c00ab015ee	1275	Šmartno pri Litiji
00050000-5588-0068-ff06-6a718e83b0c2	2383	Šmartno pri Slovenj Gradcu
00050000-5588-0068-a695-e60c0db81150	3201	Šmartno v Rožni dolini
00050000-5588-0068-aec3-b27185006f42	3325	Šoštanj
00050000-5588-0068-95f2-b07e97dd279d	6222	Štanjel
00050000-5588-0068-1834-370a32f23ec3	3220	Štore
00050000-5588-0068-5310-8ed2b9320071	3304	Tabor
00050000-5588-0068-395d-1b5c7891f224	3221	Teharje
00050000-5588-0068-c12d-fc22d0160451	9251	Tišina
00050000-5588-0068-c920-19c0e706a149	5220	Tolmin
00050000-5588-0068-71bf-fbf26916f105	3326	Topolšica
00050000-5588-0068-9443-c8d92ff1596c	2371	Trbonje
00050000-5588-0068-5460-1add6dda97aa	1420	Trbovlje
00050000-5588-0068-00e8-3a5529c939e4	8231	Trebelno 
00050000-5588-0068-d70f-ab05178e177a	8210	Trebnje
00050000-5588-0068-142f-d89221a6ad3b	5252	Trnovo pri Gorici
00050000-5588-0068-6a31-cf969025d088	2254	Trnovska vas
00050000-5588-0068-583b-3eace2d9ee38	1222	Trojane
00050000-5588-0068-0f41-23db216698b1	1236	Trzin
00050000-5588-0068-3c39-462ede379a72	4290	Tržič
00050000-5588-0068-16c9-3347abe958d9	8295	Tržišče
00050000-5588-0068-5ca1-73d387e0ea51	1311	Turjak
00050000-5588-0068-a5f4-db894f6e4e92	9224	Turnišče
00050000-5588-0068-3eaf-f49b15910f41	8323	Uršna sela
00050000-5588-0068-9b96-6b504895782f	1252	Vače
00050000-5588-0068-5a9a-8933371410d6	3320	Velenje 
00050000-5588-0068-e7ba-8f1a1cb60b49	3322	Velenje - poštni predali
00050000-5588-0068-7eac-45efa8ab32cb	8212	Velika Loka
00050000-5588-0068-1364-ced695d74cc9	2274	Velika Nedelja
00050000-5588-0068-1656-e6ddfe692151	9225	Velika Polana
00050000-5588-0068-dfb3-36feab2f0ddc	1315	Velike Lašče
00050000-5588-0068-0c70-8ce042afc179	8213	Veliki Gaber
00050000-5588-0068-f7e4-8496d4f736b0	9241	Veržej
00050000-5588-0068-a438-f36c8ea40d8b	1312	Videm - Dobrepolje
00050000-5588-0068-e48d-68c7b8f4eaa3	2284	Videm pri Ptuju
00050000-5588-0068-97c8-37d418d94e88	8344	Vinica
00050000-5588-0068-af4c-631e1bb7e208	5271	Vipava
00050000-5588-0068-fbc7-82fe3fb4ac5d	4212	Visoko
00050000-5588-0068-1001-617517298f68	1294	Višnja Gora
00050000-5588-0068-fa17-5dbf16872a59	3205	Vitanje
00050000-5588-0068-9850-66112e310b01	2255	Vitomarci
00050000-5588-0068-280e-00344338c988	1217	Vodice
00050000-5588-0068-4455-8c0f5d5de319	3212	Vojnik\t
00050000-5588-0068-ecf3-72e1ea05666b	5293	Volčja Draga
00050000-5588-0068-e976-94507040be17	2232	Voličina
00050000-5588-0068-0eb0-a80c431d5c52	3305	Vransko
00050000-5588-0068-36d2-2fa012ebf519	6217	Vremski Britof
00050000-5588-0068-dc79-701747e39a8e	1360	Vrhnika
00050000-5588-0068-3aca-6813fdd0f29f	2365	Vuhred
00050000-5588-0068-f3b4-f0fab4f6ed17	2367	Vuzenica
00050000-5588-0068-ec45-3be08fe4f5d6	8292	Zabukovje 
00050000-5588-0068-d5dc-dddd374161b8	1410	Zagorje ob Savi
00050000-5588-0068-9c9b-3d60345f938c	1303	Zagradec
00050000-5588-0068-9b7d-44250443206a	2283	Zavrč
00050000-5588-0068-4b7a-8843857ca805	8272	Zdole 
00050000-5588-0068-4ba1-a45eb0d116d5	4201	Zgornja Besnica
00050000-5588-0068-2dc7-911ce6c66dfe	2242	Zgornja Korena
00050000-5588-0068-08d2-c5ca93bb0558	2201	Zgornja Kungota
00050000-5588-0068-f31b-68bfeba30854	2316	Zgornja Ložnica
00050000-5588-0068-6a44-10fc6f290d6b	2314	Zgornja Polskava
00050000-5588-0068-f1e6-00bb562548cf	2213	Zgornja Velka
00050000-5588-0068-dab3-c8833cf7e44e	4247	Zgornje Gorje
00050000-5588-0068-4f5b-e0f512a143d3	4206	Zgornje Jezersko
00050000-5588-0068-acec-2a191d2f0cd4	2285	Zgornji Leskovec
00050000-5588-0068-3151-cd73dd22f0e4	1432	Zidani Most
00050000-5588-0068-122b-df95725900ba	3214	Zreče
00050000-5588-0068-210a-485a1e28f016	4209	Žabnica
00050000-5588-0068-5fd4-9900fc9cc15b	3310	Žalec
00050000-5588-0068-1f49-74881804b9fc	4228	Železniki
00050000-5588-0068-be6c-0b7017a5f671	2287	Žetale
00050000-5588-0068-647c-7f1bf97e9392	4226	Žiri
00050000-5588-0068-834c-5d0c754ce891	4274	Žirovnica
00050000-5588-0068-268f-9f1e59ced60a	8360	Žužemberk
\.


--
-- TOC entry 2858 (class 0 OID 7923883)
-- Dependencies: 204
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7923694)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7923772)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 7923895)
-- Dependencies: 206
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 7924015)
-- Dependencies: 219
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7924068)
-- Dependencies: 223
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5588-0069-e9a1-2f19a1eb9c6f	00080000-5588-0069-1daf-2e84c904e3db	0900	AK
00190000-5588-0069-684f-7e6a91b0e334	00080000-5588-0069-ce57-99ecd136bb4a	0987	A
00190000-5588-0069-d3fc-732ee80eed6b	00080000-5588-0069-f0ba-c7269cfd8ced	0989	A
\.


--
-- TOC entry 2884 (class 0 OID 7924192)
-- Dependencies: 230
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7924236)
-- Dependencies: 233
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7924205)
-- Dependencies: 231
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7923924)
-- Dependencies: 210
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5588-0069-9f9b-a1fe80a83c94	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5588-0069-fb43-699c080e4c75	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5588-0069-aea1-98702b4934e4	0003	Kazinska	t	84	Kazinska dvorana
00220000-5588-0069-0c5d-3492c9388377	0004	Mali oder	t	24	Mali oder 
00220000-5588-0069-b6c8-46e981d4973b	0005	Komorni oder	t	15	Komorni oder
00220000-5588-0069-6272-74ecb731b86d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5588-0069-ce2e-8d58571f8578	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2856 (class 0 OID 7923868)
-- Dependencies: 202
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7923858)
-- Dependencies: 201
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 7924057)
-- Dependencies: 222
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7923992)
-- Dependencies: 217
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 7923566)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2865 (class 0 OID 7923934)
-- Dependencies: 211
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 7923604)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5588-0067-cd25-ab5367194318	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5588-0067-4ef2-242ab5e81ec0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5588-0067-300c-1dc0bd827fe1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5588-0067-2aa6-643039b25d5f	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5588-0068-0c33-f6e7cdc8ba13	planer	Planer dogodkov v koledarju	t
00020000-5588-0068-d698-c4165488a88e	kadrovska	Kadrovska služba	t
00020000-5588-0068-bac6-871e95b5ca2f	arhivar	Ažuriranje arhivalij	t
00020000-5588-0068-0640-3ebb84f8e55a	igralec	Igralec	t
00020000-5588-0068-4e63-480d0261c0c9	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5588-0069-5506-8bfebff14549	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2831 (class 0 OID 7923588)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5588-0068-a795-a9634a6cc298	00020000-5588-0067-300c-1dc0bd827fe1
00010000-5588-0068-df8d-6259dc156976	00020000-5588-0067-300c-1dc0bd827fe1
00010000-5588-0069-15f0-1e295de878a8	00020000-5588-0069-5506-8bfebff14549
\.


--
-- TOC entry 2867 (class 0 OID 7923948)
-- Dependencies: 213
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 7923889)
-- Dependencies: 205
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7923839)
-- Dependencies: 199
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 7924269)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5588-0068-3f0a-d9e132ee0d40	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5588-0068-5429-28d666d6e93a	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5588-0068-a5e7-9a027f013e7e	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5588-0068-a9a8-bdc915e3a226	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5588-0068-cd25-18bfa684ddf1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2889 (class 0 OID 7924261)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5588-0068-fe41-236c16ae7927	00230000-5588-0068-a9a8-bdc915e3a226	popa
00240000-5588-0068-d28b-7f6f5fb0f626	00230000-5588-0068-a9a8-bdc915e3a226	oseba
00240000-5588-0068-bd83-7e5d57ea6126	00230000-5588-0068-5429-28d666d6e93a	prostor
00240000-5588-0068-81ba-dcc719b54cb6	00230000-5588-0068-a9a8-bdc915e3a226	besedilo
00240000-5588-0068-b688-67658b280176	00230000-5588-0068-a9a8-bdc915e3a226	uprizoritev
00240000-5588-0068-17e4-0eb5321ed052	00230000-5588-0068-a9a8-bdc915e3a226	funkcija
00240000-5588-0068-5b86-f3b4309be47e	00230000-5588-0068-a9a8-bdc915e3a226	tipfunkcije
00240000-5588-0068-4d00-c3af1b52ab65	00230000-5588-0068-a9a8-bdc915e3a226	alternacija
00240000-5588-0068-0a58-82a74ce82b07	00230000-5588-0068-3f0a-d9e132ee0d40	pogodba
00240000-5588-0068-e5bb-f90d1a9875d1	00230000-5588-0068-a9a8-bdc915e3a226	zaposlitev
\.


--
-- TOC entry 2888 (class 0 OID 7924256)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7924002)
-- Dependencies: 218
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5588-0069-c05d-7b8c4fa2fcd7	000e0000-5588-0069-54c2-daf25cd70ee5	00080000-5588-0069-343b-fc1f770631e2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5588-0069-d66a-ec66a8287d0a	000e0000-5588-0069-54c2-daf25cd70ee5	00080000-5588-0069-343b-fc1f770631e2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5588-0069-c21a-d78c48b1e15a	000e0000-5588-0069-54c2-daf25cd70ee5	00080000-5588-0069-19d9-e2bd0b4ccdab	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2838 (class 0 OID 7923666)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 7923845)
-- Dependencies: 200
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5588-0069-0c57-690a7ff86c26	00180000-5588-0069-cf67-5f0ba8188a6d	000c0000-5588-0069-f1ca-e2e0b5ddc29a	00090000-5588-0069-9079-43781c81ba7c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-0069-1c2b-f799d292ccde	00180000-5588-0069-cf67-5f0ba8188a6d	000c0000-5588-0069-dfe3-cee9c2fd895a	00090000-5588-0069-3d54-e3a58a56b3a2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-0069-d265-d166ebdda444	00180000-5588-0069-cf67-5f0ba8188a6d	000c0000-5588-0069-3e26-75f6b3c35eaa	00090000-5588-0069-c432-4dbe684d4a30	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-0069-53e4-4e559da2f4da	00180000-5588-0069-cf67-5f0ba8188a6d	000c0000-5588-0069-1efd-46839b5a55bc	00090000-5588-0069-490a-d12ba4594b1b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-0069-138e-640cab55ead3	00180000-5588-0069-cf67-5f0ba8188a6d	000c0000-5588-0069-514e-a0a83fdcae83	00090000-5588-0069-f3b8-748947ce7264	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-0069-baf0-84a1b123ef0b	00180000-5588-0069-84d4-319279b6a03b	\N	00090000-5588-0069-f3b8-748947ce7264	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2875 (class 0 OID 7924046)
-- Dependencies: 221
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5588-0068-4454-2a0fa28fc304	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5588-0068-f4a7-fcb986a29a8e	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5588-0068-ae7d-cb8b72354291	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5588-0068-443a-3ae2d61d5a42	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5588-0068-4771-6e67d54fe918	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5588-0068-08d7-76b1dd1e9009	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5588-0068-fabc-98dfee6c59e6	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5588-0068-b97a-99a990488b09	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5588-0068-b4ef-6c30c3893a06	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5588-0068-6100-457496c57ca8	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5588-0068-4db5-97fc02d9707c	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5588-0068-269c-1d579396e123	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5588-0068-a13b-beb999c6c985	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5588-0068-be79-bbdf8f173623	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5588-0068-c11e-24cf0e6437fa	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5588-0068-8e66-fe72cb4db1ff	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2886 (class 0 OID 7924225)
-- Dependencies: 232
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5588-0068-7e19-700aa839821b	01	Velika predstava	f	1.00	1.00
002b0000-5588-0068-7f27-15b5acde6074	02	Mala predstava	f	0.50	0.50
002b0000-5588-0068-0c11-18f373aff768	03	Mala koprodukcija	t	0.40	1.00
002b0000-5588-0068-cac6-7d457d154110	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5588-0068-9445-e3667f698c2c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2843 (class 0 OID 7923729)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 7923575)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5588-0068-df8d-6259dc156976	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROS62EC87ExsVJWoQurpmYrQCE3uC.WaW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5588-0069-8078-5f3fe84cc9f1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5588-0069-66a8-a57d4d3c83ef	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5588-0069-a813-619e82207b93	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5588-0069-a265-f01c4da0a65c	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5588-0069-a651-15199c89b849	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5588-0069-1386-abcd63785d51	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5588-0069-a66d-8e0ad0062468	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5588-0069-5b5c-a357fcacb000	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5588-0069-706d-29a79a417adc	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5588-0069-15f0-1e295de878a8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5588-0068-a795-a9634a6cc298	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2880 (class 0 OID 7924103)
-- Dependencies: 226
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5588-0069-cb8b-c59edbab3fb7	00160000-5588-0069-535d-f904662e1067	00150000-5588-0068-e894-44d637afc379	00140000-5588-0067-054b-22624b5d6f21	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5588-0069-b6c8-46e981d4973b
000e0000-5588-0069-54c2-daf25cd70ee5	00160000-5588-0069-e79b-d82d19e68633	00150000-5588-0068-7eb4-812e19461b50	00140000-5588-0067-2521-aa5a016237fe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5588-0069-6272-74ecb731b86d
000e0000-5588-0069-79ec-ed43b4b9a9a5	\N	00150000-5588-0068-7eb4-812e19461b50	00140000-5588-0067-2521-aa5a016237fe	00190000-5588-0069-684f-7e6a91b0e334	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5588-0069-b6c8-46e981d4973b
000e0000-5588-0069-bd69-bde5e8391f80	\N	00150000-5588-0068-7eb4-812e19461b50	00140000-5588-0067-2521-aa5a016237fe	00190000-5588-0069-684f-7e6a91b0e334	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5588-0069-b6c8-46e981d4973b
\.


--
-- TOC entry 2848 (class 0 OID 7923791)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5588-0069-5d76-8735ad9b8822	000e0000-5588-0069-54c2-daf25cd70ee5	1	
00200000-5588-0069-c5c2-aec7161082aa	000e0000-5588-0069-54c2-daf25cd70ee5	2	
\.


--
-- TOC entry 2863 (class 0 OID 7923916)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7923985)
-- Dependencies: 216
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 7923823)
-- Dependencies: 196
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7924093)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5588-0067-054b-22624b5d6f21	01	Drama	drama (SURS 01)
00140000-5588-0067-0e94-220af0aec0a7	02	Opera	opera (SURS 02)
00140000-5588-0067-1f82-042a33183e9e	03	Balet	balet (SURS 03)
00140000-5588-0067-570c-fd6b492b5ae4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5588-0067-38b7-8ba20db2e0da	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5588-0067-2521-aa5a016237fe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5588-0067-c117-95399a2734df	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2869 (class 0 OID 7923975)
-- Dependencies: 215
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5588-0068-d77c-fce3b68ca7ad	01	Opera	opera
00150000-5588-0068-ec9c-965261bd9d84	02	Opereta	opereta
00150000-5588-0068-bb19-548d4dd7502f	03	Balet	balet
00150000-5588-0068-4ed5-80ccf4000b42	04	Plesne prireditve	plesne prireditve
00150000-5588-0068-ce93-1b5b3dc94ee9	05	Lutkovno gledališče	lutkovno gledališče
00150000-5588-0068-9c3c-9d42de14bc6d	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5588-0068-9cac-9f647ae9555b	07	Biografska drama	biografska drama
00150000-5588-0068-e894-44d637afc379	08	Komedija	komedija
00150000-5588-0068-aab8-2d3823ad6994	09	Črna komedija	črna komedija
00150000-5588-0068-c447-23307eff0ddd	10	E-igra	E-igra
00150000-5588-0068-7eb4-812e19461b50	11	Kriminalka	kriminalka
00150000-5588-0068-ef8a-2f7f1a3ddf57	12	Musical	musical
\.


--
-- TOC entry 2416 (class 2606 OID 7923629)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 7924150)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 7924140)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 7924045)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 7923813)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 7923838)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 7923755)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 7924187)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7923971)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 7923789)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 7923832)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 7923769)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 7923881)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 7923908)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 7923727)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7923638)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2423 (class 2606 OID 7923662)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 7923618)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2407 (class 2606 OID 7923603)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 7923914)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 7923947)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 7924088)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 7923691)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 7923715)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 7923887)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 7923705)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 7923776)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 7923899)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 7924027)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 7924073)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7924203)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 7924254)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 7923931)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 7923872)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 7923863)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 7924067)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 7923999)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 7923574)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7923938)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 7923592)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2409 (class 2606 OID 7923612)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 7923956)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 7923894)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 7923844)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 7924278)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 7924266)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 7924260)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7924012)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 7923671)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 7923854)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 7924056)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 7924235)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 7923740)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 7923587)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 7924119)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7923798)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 7923922)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 7923990)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7923827)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7924101)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 7923983)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 1259 OID 7923820)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2556 (class 1259 OID 7924013)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2557 (class 1259 OID 7924014)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2430 (class 1259 OID 7923693)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2385 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2386 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2521 (class 1259 OID 7923915)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2515 (class 1259 OID 7923901)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2516 (class 1259 OID 7923900)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2467 (class 1259 OID 7923799)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2543 (class 1259 OID 7923972)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2544 (class 1259 OID 7923974)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2545 (class 1259 OID 7923973)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2455 (class 1259 OID 7923771)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 7923770)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2574 (class 1259 OID 7924090)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2575 (class 1259 OID 7924091)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2576 (class 1259 OID 7924092)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2612 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2613 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2583 (class 1259 OID 7924124)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2584 (class 1259 OID 7924121)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2585 (class 1259 OID 7924125)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2586 (class 1259 OID 7924123)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2587 (class 1259 OID 7924122)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2445 (class 1259 OID 7923742)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 7923741)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 7923665)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2531 (class 1259 OID 7923939)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 7923833)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 7923619)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2412 (class 1259 OID 7923620)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2536 (class 1259 OID 7923959)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2537 (class 1259 OID 7923958)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2538 (class 1259 OID 7923957)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2459 (class 1259 OID 7923777)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2460 (class 1259 OID 7923779)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2461 (class 1259 OID 7923778)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 7924268)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2495 (class 1259 OID 7923867)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2496 (class 1259 OID 7923865)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2497 (class 1259 OID 7923864)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2498 (class 1259 OID 7923866)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2402 (class 1259 OID 7923593)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2403 (class 1259 OID 7923594)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2524 (class 1259 OID 7923923)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2510 (class 1259 OID 7923888)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2552 (class 1259 OID 7924000)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2553 (class 1259 OID 7924001)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2605 (class 1259 OID 7924191)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2606 (class 1259 OID 7924188)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 7924189)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2608 (class 1259 OID 7924190)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2434 (class 1259 OID 7923707)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2435 (class 1259 OID 7923706)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2436 (class 1259 OID 7923708)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 7924255)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2560 (class 1259 OID 7924028)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 7924029)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2597 (class 1259 OID 7924154)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2598 (class 1259 OID 7924156)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2599 (class 1259 OID 7924152)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2600 (class 1259 OID 7924155)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2601 (class 1259 OID 7924153)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2549 (class 1259 OID 7923991)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2501 (class 1259 OID 7923876)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2502 (class 1259 OID 7923875)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2503 (class 1259 OID 7923873)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2504 (class 1259 OID 7923874)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2380 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2593 (class 1259 OID 7924142)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2594 (class 1259 OID 7924141)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2609 (class 1259 OID 7924204)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2466 (class 1259 OID 7923790)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2417 (class 1259 OID 7923640)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2418 (class 1259 OID 7923639)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2426 (class 1259 OID 7923672)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2427 (class 1259 OID 7923673)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2490 (class 1259 OID 7923857)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 7923856)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2492 (class 1259 OID 7923855)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2393 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2394 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2395 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2473 (class 1259 OID 7923822)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2474 (class 1259 OID 7923818)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2475 (class 1259 OID 7923815)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2476 (class 1259 OID 7923816)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2477 (class 1259 OID 7923814)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2478 (class 1259 OID 7923819)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2479 (class 1259 OID 7923817)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2433 (class 1259 OID 7923692)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2451 (class 1259 OID 7923756)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2452 (class 1259 OID 7923758)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2453 (class 1259 OID 7923757)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2454 (class 1259 OID 7923759)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2509 (class 1259 OID 7923882)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2579 (class 1259 OID 7924089)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 7924120)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 7923663)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2425 (class 1259 OID 7923664)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2546 (class 1259 OID 7923984)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 7924279)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 7923728)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2626 (class 1259 OID 7924267)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2529 (class 1259 OID 7923933)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2530 (class 1259 OID 7923932)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2602 (class 1259 OID 7924151)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2383 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2441 (class 1259 OID 7923716)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 7924102)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2572 (class 1259 OID 7924074)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2573 (class 1259 OID 7924075)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2410 (class 1259 OID 7923613)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2480 (class 1259 OID 7923821)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2657 (class 2606 OID 7924415)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2654 (class 2606 OID 7924400)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2655 (class 2606 OID 7924405)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2659 (class 2606 OID 7924425)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2653 (class 2606 OID 7924395)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2658 (class 2606 OID 7924420)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2656 (class 2606 OID 7924410)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2688 (class 2606 OID 7924570)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2689 (class 2606 OID 7924575)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2640 (class 2606 OID 7924330)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2676 (class 2606 OID 7924510)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2675 (class 2606 OID 7924505)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2674 (class 2606 OID 7924500)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2652 (class 2606 OID 7924390)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2682 (class 2606 OID 7924540)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2684 (class 2606 OID 7924550)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2683 (class 2606 OID 7924545)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2647 (class 2606 OID 7924365)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2646 (class 2606 OID 7924360)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2672 (class 2606 OID 7924490)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2693 (class 2606 OID 7924595)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2694 (class 2606 OID 7924600)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 7924605)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2714 (class 2606 OID 7924700)
-- Name: fk_308cd2524ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd2524ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 7924695)
-- Name: fk_308cd252771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT fk_308cd252771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2699 (class 2606 OID 7924625)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2696 (class 2606 OID 7924610)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2700 (class 2606 OID 7924630)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2698 (class 2606 OID 7924620)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2697 (class 2606 OID 7924615)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2645 (class 2606 OID 7924355)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2644 (class 2606 OID 7924350)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 7924315)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2636 (class 2606 OID 7924310)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2678 (class 2606 OID 7924520)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2660 (class 2606 OID 7924430)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 7924290)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2633 (class 2606 OID 7924295)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2681 (class 2606 OID 7924535)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2680 (class 2606 OID 7924530)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2679 (class 2606 OID 7924525)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2648 (class 2606 OID 7924370)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2650 (class 2606 OID 7924380)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2649 (class 2606 OID 7924375)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2716 (class 2606 OID 7924710)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2667 (class 2606 OID 7924465)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2665 (class 2606 OID 7924455)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2664 (class 2606 OID 7924450)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2666 (class 2606 OID 7924460)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2630 (class 2606 OID 7924280)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2631 (class 2606 OID 7924285)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2677 (class 2606 OID 7924515)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2673 (class 2606 OID 7924495)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2686 (class 2606 OID 7924560)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2687 (class 2606 OID 7924565)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2711 (class 2606 OID 7924685)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2708 (class 2606 OID 7924670)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 7924675)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2710 (class 2606 OID 7924680)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2642 (class 2606 OID 7924340)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2641 (class 2606 OID 7924335)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 7924345)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2715 (class 2606 OID 7924705)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2690 (class 2606 OID 7924580)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2691 (class 2606 OID 7924585)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2705 (class 2606 OID 7924655)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2707 (class 2606 OID 7924665)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2703 (class 2606 OID 7924645)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2706 (class 2606 OID 7924660)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2704 (class 2606 OID 7924650)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2685 (class 2606 OID 7924555)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2671 (class 2606 OID 7924485)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2670 (class 2606 OID 7924480)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2668 (class 2606 OID 7924470)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2669 (class 2606 OID 7924475)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2702 (class 2606 OID 7924640)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7924635)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2712 (class 2606 OID 7924690)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2651 (class 2606 OID 7924385)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2692 (class 2606 OID 7924590)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2635 (class 2606 OID 7924305)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2634 (class 2606 OID 7924300)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2638 (class 2606 OID 7924320)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2639 (class 2606 OID 7924325)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 7924445)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2662 (class 2606 OID 7924440)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2661 (class 2606 OID 7924435)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-22 14:32:42 CEST

--
-- PostgreSQL database dump complete
--

