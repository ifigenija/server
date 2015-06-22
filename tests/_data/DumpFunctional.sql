--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-22 16:46:45 CEST

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
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 237
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 7979212)
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
-- TOC entry 230 (class 1259 OID 7979734)
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
-- TOC entry 229 (class 1259 OID 7979717)
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
-- TOC entry 222 (class 1259 OID 7979621)
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
-- TOC entry 197 (class 1259 OID 7979391)
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
-- TOC entry 200 (class 1259 OID 7979425)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 7979334)
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
-- TOC entry 231 (class 1259 OID 7979748)
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
    naziv character varying(50) DEFAULT NULL::character varying,
    sort integer,
    tipprogramskeenote_id uuid,
    tip character varying(20) NOT NULL,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    odkup numeric(15,2) DEFAULT NULL::numeric,
    naslovpe character varying(255) DEFAULT NULL::character varying,
    avtorpe character varying(255) DEFAULT NULL::character varying,
    obsegpe character varying(255) DEFAULT NULL::character varying,
    mesecpe character varying(255) DEFAULT NULL::character varying,
    vrednostpe numeric(15,2) DEFAULT 0::numeric,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
    stpredstav integer,
    stpredavanj integer,
    stpredstavitev integer,
    stdelavnic integer,
    stdrugidogodki integer,
    opredelitevdrugidogodki text,
    stprodukcij integer,
    caspriprave character varying(255) DEFAULT NULL::character varying,
    casizvedbe character varying(255) DEFAULT NULL::character varying,
    prizorisca text,
    umetvodja character varying(255) DEFAULT NULL::character varying,
    programskotelo character varying(255) DEFAULT NULL::character varying,
    soorganizatorji text,
    sttujihselektorjev integer
);


--
-- TOC entry 216 (class 1259 OID 7979551)
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
-- TOC entry 195 (class 1259 OID 7979371)
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
-- TOC entry 199 (class 1259 OID 7979419)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 7979351)
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
-- TOC entry 205 (class 1259 OID 7979468)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 7979493)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 7979308)
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
-- TOC entry 184 (class 1259 OID 7979221)
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
-- TOC entry 185 (class 1259 OID 7979232)
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
-- TOC entry 180 (class 1259 OID 7979186)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 7979205)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 7979500)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 7979531)
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
-- TOC entry 226 (class 1259 OID 7979667)
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
-- TOC entry 187 (class 1259 OID 7979265)
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
-- TOC entry 189 (class 1259 OID 7979300)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 7979474)
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
-- TOC entry 188 (class 1259 OID 7979285)
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
-- TOC entry 194 (class 1259 OID 7979363)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 7979486)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 7979606)
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
-- TOC entry 225 (class 1259 OID 7979659)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 7979795)
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
-- TOC entry 175 (class 1259 OID 7936450)
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
-- TOC entry 174 (class 1259 OID 7924205)
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
-- TOC entry 212 (class 1259 OID 7979515)
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
-- TOC entry 204 (class 1259 OID 7979459)
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
-- TOC entry 203 (class 1259 OID 7979449)
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
-- TOC entry 224 (class 1259 OID 7979648)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 7979583)
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
-- TOC entry 177 (class 1259 OID 7979157)
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
-- TOC entry 176 (class 1259 OID 7979155)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 7979525)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 7979195)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 7979179)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 7979539)
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
-- TOC entry 207 (class 1259 OID 7979480)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 7979430)
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
-- TOC entry 236 (class 1259 OID 7979832)
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
-- TOC entry 235 (class 1259 OID 7979824)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 234 (class 1259 OID 7979819)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 7979593)
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
-- TOC entry 186 (class 1259 OID 7979257)
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
-- TOC entry 202 (class 1259 OID 7979436)
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
-- TOC entry 223 (class 1259 OID 7979637)
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
-- TOC entry 233 (class 1259 OID 7979808)
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
-- TOC entry 191 (class 1259 OID 7979320)
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
-- TOC entry 178 (class 1259 OID 7979166)
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
-- TOC entry 228 (class 1259 OID 7979694)
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
-- TOC entry 196 (class 1259 OID 7979382)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 7979507)
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
-- TOC entry 218 (class 1259 OID 7979576)
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
-- TOC entry 198 (class 1259 OID 7979414)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 7979684)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 7979566)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2204 (class 2604 OID 7979160)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2846 (class 0 OID 7979212)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 7979734)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5588-1fd4-a656-8bc80e5684f9	000d0000-5588-1fd4-cb59-7762775ec0ce	\N	00090000-5588-1fd4-79c0-c6227a9c8c6d	\N	000b0000-5588-1fd4-e2d1-5809fdff9199	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-1fd4-74cd-3a2c6fe70e10	000d0000-5588-1fd4-49f2-244008efa161	\N	00090000-5588-1fd4-f49b-d103d8bd325c	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-1fd4-c33b-059517077534	000d0000-5588-1fd4-9554-15bf1791c276	\N	00090000-5588-1fd4-4b6d-1be55049adef	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-1fd4-f38a-95ddc84b12e9	000d0000-5588-1fd4-9c48-5678167eb5ce	\N	00090000-5588-1fd4-1f5e-5f33f8a8c2a8	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-1fd4-03de-e239f6e3f4cb	000d0000-5588-1fd4-e2e4-9426ca58b2c8	\N	00090000-5588-1fd4-9d87-c07484b170a4	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5588-1fd4-adc8-b69f1a6fd86e	000d0000-5588-1fd4-e2ab-615142b870bc	\N	00090000-5588-1fd4-f49b-d103d8bd325c	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2892 (class 0 OID 7979717)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 7979621)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5588-1fd3-7369-520e1a0c9d52	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5588-1fd3-c324-f92be827e93e	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5588-1fd3-864d-2a6bc6290feb	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2860 (class 0 OID 7979391)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5588-1fd4-9e31-2ad38143094b	\N	\N	00200000-5588-1fd4-bfc1-01ec71a78d1b	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5588-1fd4-014d-b7b0aae904fb	\N	\N	00200000-5588-1fd4-fcdb-b6624c5a82ee	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5588-1fd4-6b51-0872d4150c99	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5588-1fd4-c51f-558783d781d6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5588-1fd4-d856-70c46c044dc1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2863 (class 0 OID 7979425)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 7979334)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5588-1fd2-bef6-a157e225b395	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5588-1fd2-5830-72a6b469fa1a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5588-1fd2-081d-cf8c68c78644	AL	ALB	008	Albania 	Albanija	\N
00040000-5588-1fd2-9275-1afee6da3502	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5588-1fd2-acba-c90ba402badd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5588-1fd2-8bdf-c9a0759bef43	AD	AND	020	Andorra 	Andora	\N
00040000-5588-1fd2-fd11-cbb37e9a0652	AO	AGO	024	Angola 	Angola	\N
00040000-5588-1fd2-0960-f2d596fa340f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5588-1fd2-b695-ea4997120110	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5588-1fd2-cad6-74c26f8f13e5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-1fd2-9115-b4f909d9f121	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5588-1fd2-d96c-b66e4396bc3f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5588-1fd2-acab-5beb17e0a1a5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5588-1fd2-8e24-cde7d2db7fcd	AU	AUS	036	Australia 	Avstralija	\N
00040000-5588-1fd2-1b59-c2b551d2d773	AT	AUT	040	Austria 	Avstrija	\N
00040000-5588-1fd2-4ca2-3ca92609ac27	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5588-1fd2-dd1e-0b401fe743d7	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5588-1fd2-cc2a-de9f7e4c8eaa	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5588-1fd2-9730-b73a070a1f1d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5588-1fd2-68ef-190811f955d1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5588-1fd2-9942-cce085280882	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5588-1fd2-4872-95b4ab931faf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5588-1fd2-9113-a3dd4a19ca0d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5588-1fd2-13a1-a15d6bdb2654	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5588-1fd2-0600-f50bcbd4463d	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5588-1fd2-6f4f-28b8f47cf5e5	BT	BTN	064	Bhutan 	Butan	\N
00040000-5588-1fd2-4d00-419855b83ad6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5588-1fd2-49c7-dffe9473bbd1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5588-1fd2-2caf-e4e726534bf2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5588-1fd2-6d2b-ff1ab6bcae49	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5588-1fd2-3b26-af6f3cdd39c6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5588-1fd2-528c-d3342d4de19d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5588-1fd2-664a-0b9373dc8acc	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5588-1fd2-30a9-0ba85a928606	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5588-1fd2-ec56-64dc0356a87f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5588-1fd2-c7b3-ae52aaf8badd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5588-1fd2-2bd7-1bbd8bf984f7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5588-1fd2-d84e-368d50a81734	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5588-1fd2-c16a-3185c4a4ad28	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5588-1fd2-d86c-fcfa1a9359e6	CA	CAN	124	Canada 	Kanada	\N
00040000-5588-1fd2-b69a-91ac55dee14c	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5588-1fd2-73c8-7e76eb841e44	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5588-1fd2-0ce8-c275cd0bddfe	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5588-1fd2-944b-f84f293bf052	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5588-1fd2-141b-0baffc8bb14d	CL	CHL	152	Chile 	Čile	\N
00040000-5588-1fd2-48c3-04037e29e597	CN	CHN	156	China 	Kitajska	\N
00040000-5588-1fd2-a515-bc9b0be49068	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5588-1fd2-865d-9a5a62893b6b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5588-1fd2-a665-45e6b1bcf227	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5588-1fd2-0a3a-37e446158bcc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5588-1fd2-65bc-9fb0014ea877	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5588-1fd2-5d03-cfbaf3a8ab11	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5588-1fd2-c5d8-0f77b8859d92	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5588-1fd2-e89f-84c5e197325c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5588-1fd2-6cb2-7ea353d07d43	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5588-1fd2-e5e6-87d725d634bb	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5588-1fd2-f71e-123b01de9e37	CU	CUB	192	Cuba 	Kuba	\N
00040000-5588-1fd2-2ed4-72d2c8019ac6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5588-1fd2-a0d4-da39bad7d440	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5588-1fd2-f4ea-546efa762e68	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5588-1fd2-be66-4f3c3a862ea2	DK	DNK	208	Denmark 	Danska	\N
00040000-5588-1fd2-12db-455d73d21ad1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5588-1fd2-fe83-7071917c48e3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5588-1fd2-0d6e-e395aa35f392	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5588-1fd2-ffcd-34cc4d61cbdb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5588-1fd2-bae2-9904c3acfae2	EG	EGY	818	Egypt 	Egipt	\N
00040000-5588-1fd2-5dd6-2ac21f567a50	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5588-1fd2-9973-79c937ff6497	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5588-1fd2-ce0a-44ff3d6d1c1d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5588-1fd2-29a7-f72c3a5ef5c3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5588-1fd2-6f40-f42bee8885a4	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5588-1fd2-01b1-715a498b4618	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5588-1fd2-26ff-c073a46428ce	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5588-1fd2-e438-c2fd8bccc264	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5588-1fd2-ca12-580e5d335b40	FI	FIN	246	Finland 	Finska	\N
00040000-5588-1fd2-cc3d-17361c1b5043	FR	FRA	250	France 	Francija	\N
00040000-5588-1fd2-513d-9e918f32f592	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5588-1fd2-b557-c1a7038bd42c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5588-1fd2-0450-5663806e3617	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5588-1fd2-fd2d-9980492a1baa	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5588-1fd2-39f2-d639946331a1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5588-1fd2-4f1e-836955890bdb	GM	GMB	270	Gambia 	Gambija	\N
00040000-5588-1fd2-c581-d16ff44e1b11	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5588-1fd2-2be6-a43d49ec1592	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5588-1fd2-d28d-91458b814bff	GH	GHA	288	Ghana 	Gana	\N
00040000-5588-1fd2-8882-d846750fd691	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5588-1fd2-3d81-d43fd3af7b89	GR	GRC	300	Greece 	Grčija	\N
00040000-5588-1fd2-f4e5-05f1ef711632	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5588-1fd2-0b31-bf2e99e20e1f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5588-1fd2-c3d2-840b1f6fa4fa	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5588-1fd2-cf1b-f4952b326088	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5588-1fd2-69a2-d7e3de284457	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5588-1fd2-cb28-e2ac35dc729d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5588-1fd2-d831-852b0c44cb66	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5588-1fd2-3132-863845f0c324	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5588-1fd2-59d2-50c7b9bc80e9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5588-1fd2-5c7c-4ed2f97a2069	HT	HTI	332	Haiti 	Haiti	\N
00040000-5588-1fd2-11c8-2a93a1c22765	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5588-1fd2-3890-493abc6640f1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5588-1fd2-ec15-8638003bac4a	HN	HND	340	Honduras 	Honduras	\N
00040000-5588-1fd2-05ac-2a2c0ee120b5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5588-1fd2-2458-cebce3e7bd14	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5588-1fd2-09a7-cae4b570295a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5588-1fd2-cbc9-87a174356aa0	IN	IND	356	India 	Indija	\N
00040000-5588-1fd2-8d03-6a966942b5ee	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5588-1fd2-7fbd-1c0e8c53e458	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5588-1fd2-6d70-f39393da5a44	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5588-1fd2-66f2-c99ba5fbbdc0	IE	IRL	372	Ireland 	Irska	\N
00040000-5588-1fd2-562d-0f8aae6142e2	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5588-1fd2-b656-ea57e0eedd94	IL	ISR	376	Israel 	Izrael	\N
00040000-5588-1fd2-f9b6-c4c7de9e187d	IT	ITA	380	Italy 	Italija	\N
00040000-5588-1fd2-a6f5-cc2bb2d02931	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5588-1fd2-451a-346626ab86f4	JP	JPN	392	Japan 	Japonska	\N
00040000-5588-1fd2-5fd2-85a643040681	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5588-1fd2-3365-8b9739ef4047	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5588-1fd2-90f6-2526deaa39f6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5588-1fd2-e919-d91629e6bb59	KE	KEN	404	Kenya 	Kenija	\N
00040000-5588-1fd2-75b9-dc865a012ead	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5588-1fd2-bfc9-f38404dbd84c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5588-1fd2-d9cb-66e2eba608da	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5588-1fd2-5f59-501bccd3a6b9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5588-1fd2-02eb-09ed31f1573f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5588-1fd2-2ebc-c1b3e903a945	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5588-1fd2-e105-b3b4898575ef	LV	LVA	428	Latvia 	Latvija	\N
00040000-5588-1fd2-6ba8-dcac88556aa3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5588-1fd2-810e-e133c385e9f3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5588-1fd2-9415-34a3c436685e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5588-1fd2-7187-f01116fb5226	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5588-1fd2-530b-5c5d7b2678c6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5588-1fd2-0ddc-5fc11304c5dc	LT	LTU	440	Lithuania 	Litva	\N
00040000-5588-1fd2-8bff-1a8be117dbbf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5588-1fd2-6275-ea8a10ae2271	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5588-1fd2-562f-3add2946f5b2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5588-1fd2-5750-5f24eb65fe54	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5588-1fd2-92e0-578ae5d64c61	MW	MWI	454	Malawi 	Malavi	\N
00040000-5588-1fd2-3ea3-139502e7376f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5588-1fd2-a9b7-54afcadb50d9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5588-1fd2-8006-1a0ccab7240e	ML	MLI	466	Mali 	Mali	\N
00040000-5588-1fd2-94eb-834fbcb5a99e	MT	MLT	470	Malta 	Malta	\N
00040000-5588-1fd2-8eb9-2e414d1d7e46	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5588-1fd2-eaed-61ad21a591e0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5588-1fd2-d7da-14c5e6a636bf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5588-1fd2-c214-7f8607916751	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5588-1fd2-6948-fe6e96b255a5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5588-1fd2-ca07-9d1b5964c438	MX	MEX	484	Mexico 	Mehika	\N
00040000-5588-1fd2-b941-7ae93e6feea9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5588-1fd2-b832-120052990bd4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5588-1fd2-256a-7da20c018c1c	MC	MCO	492	Monaco 	Monako	\N
00040000-5588-1fd2-a67a-9f363d190e9f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5588-1fd2-c8e1-910db6e0c7bc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5588-1fd2-9f0d-a7e754c7485a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5588-1fd2-c854-75891cd55ee7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5588-1fd2-2f8b-92aa241fd51a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5588-1fd2-e06d-de943e71c6a4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5588-1fd2-b4c5-84199d140803	NA	NAM	516	Namibia 	Namibija	\N
00040000-5588-1fd2-f001-b2b945411448	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5588-1fd2-fe97-becf5d30f247	NP	NPL	524	Nepal 	Nepal	\N
00040000-5588-1fd2-f704-9e8ee52b5e29	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5588-1fd2-edf0-3a0ab2b70014	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5588-1fd2-bbd7-b96e7a50843c	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5588-1fd2-1ed8-8354678c8327	NE	NER	562	Niger 	Niger 	\N
00040000-5588-1fd2-fae7-93e2bd136775	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5588-1fd2-38d2-6f9887977975	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5588-1fd2-a851-55cd40617008	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5588-1fd2-525b-eda6289347fc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5588-1fd2-2089-8068839d734f	NO	NOR	578	Norway 	Norveška	\N
00040000-5588-1fd2-f297-6f52f2476189	OM	OMN	512	Oman 	Oman	\N
00040000-5588-1fd2-67e9-c89e08d207bc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5588-1fd2-4b71-89b3d8f78124	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5588-1fd2-7db2-73f6822e0438	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5588-1fd2-70ed-edd2848e33c0	PA	PAN	591	Panama 	Panama	\N
00040000-5588-1fd2-b5a0-b5792b994c90	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5588-1fd2-4ea7-4874b656147b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5588-1fd2-b66e-dae91a57b144	PE	PER	604	Peru 	Peru	\N
00040000-5588-1fd2-eef1-11ee1dc2a7f4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5588-1fd2-0d98-62e697adddcd	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5588-1fd2-56bb-d07bc291a90c	PL	POL	616	Poland 	Poljska	\N
00040000-5588-1fd2-3781-d9c27eee59c0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5588-1fd2-cd25-6fb1de815874	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5588-1fd2-c85c-1bc37c9c3d28	QA	QAT	634	Qatar 	Katar	\N
00040000-5588-1fd2-542c-0350d6d2b8d4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5588-1fd2-beb9-d760105d4884	RO	ROU	642	Romania 	Romunija	\N
00040000-5588-1fd2-48a1-569ffa6bf308	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5588-1fd2-b7d3-6720b9e77611	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5588-1fd2-74db-efdc54cf620f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5588-1fd2-54b6-e46de6d20930	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5588-1fd2-8202-1ae95772e82b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5588-1fd2-355c-12575fd7b5fc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5588-1fd2-a821-3659a9eaa50d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5588-1fd2-fb93-b0ad5d909910	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5588-1fd2-3f06-91e1ea5590cd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5588-1fd2-47db-5a6525274fc9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5588-1fd2-cb65-4ffa75103755	SM	SMR	674	San Marino 	San Marino	\N
00040000-5588-1fd2-d91a-97cb53608748	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5588-1fd2-b3cb-7487610296d6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5588-1fd2-ea56-276645cb6a0b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5588-1fd2-c43f-e52d7aa85c8f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5588-1fd2-ab16-1de9324b2104	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5588-1fd2-5fe0-01b3c8b4ca2f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5588-1fd2-e675-6b2d8e4bda9f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5588-1fd2-0ba8-e1133fcae2b2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5588-1fd2-a94a-39a3e85b2d0c	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5588-1fd2-f484-08c1a20dd1ef	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5588-1fd2-7cd4-f4cd1bb4cfea	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5588-1fd2-e361-7655ddbbb0f0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5588-1fd2-ac5c-fd5d557261f7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5588-1fd2-5464-4e7d3cf6ddb5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5588-1fd2-6a96-a3dec2f1192a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5588-1fd2-67de-ce6b9e171b78	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5588-1fd2-e38d-18d540712acc	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5588-1fd2-8378-cf96d5615296	SD	SDN	729	Sudan 	Sudan	\N
00040000-5588-1fd2-17e6-af1b1752a1e7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5588-1fd2-0276-f7a21578a975	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5588-1fd2-2a66-aabbbb8782c0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5588-1fd2-5b73-7110935c0e14	SE	SWE	752	Sweden 	Švedska	\N
00040000-5588-1fd2-1e04-a64509f04b86	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5588-1fd2-41b6-9b1caf7887c8	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5588-1fd2-fafd-7598e3a44c46	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5588-1fd2-5e7d-8dde18c2cc69	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5588-1fd2-571b-22f0e8c9a17b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5588-1fd2-bfcf-4de0fc061f6b	TH	THA	764	Thailand 	Tajska	\N
00040000-5588-1fd2-b649-850f2f6b7253	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5588-1fd2-4751-5921411f4388	TG	TGO	768	Togo 	Togo	\N
00040000-5588-1fd2-64cb-00d62d320c2d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5588-1fd2-b149-6dd016818d47	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5588-1fd2-5ae1-a2f65b645ae0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5588-1fd2-a472-af13e8d6742b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5588-1fd2-0d80-d141b22fa755	TR	TUR	792	Turkey 	Turčija	\N
00040000-5588-1fd2-ee0a-5f20807b4ed9	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5588-1fd2-94d3-2718fd1e7fe1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-1fd2-ad86-161c558575ac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5588-1fd2-0dc6-51eb75413f8a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5588-1fd2-283a-2c944f7764cf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5588-1fd2-b89f-385d8a83287f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5588-1fd2-327b-df1edbbc7a3a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5588-1fd2-602a-28b3d34eef21	US	USA	840	United States 	Združene države Amerike	\N
00040000-5588-1fd2-98b7-253702fd1e44	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5588-1fd2-d949-fbbecf2f95dc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5588-1fd2-cfa1-0ec258a4d382	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5588-1fd2-9ce9-68ac70ea119f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5588-1fd2-fab8-7ed6d9cdc911	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5588-1fd2-c2d9-d8406fc64010	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5588-1fd2-8506-f3cd6fb15ab2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5588-1fd2-9ec0-67fa08198ce3	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5588-1fd2-6571-d8472aad950e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5588-1fd2-d503-527c9e4300a8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5588-1fd2-e614-b72667b78111	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5588-1fd2-7543-f66a84fd6fc1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5588-1fd2-3ce7-2dd4cbbac18e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2894 (class 0 OID 7979748)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, opredelitevdrugiviri, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 7979551)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5588-1fd4-1887-05ab0dae427e	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5588-1fd3-a7de-e4f56106205b
000d0000-5588-1fd4-cb59-7762775ec0ce	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-1fd3-a7de-e4f56106205b
000d0000-5588-1fd4-49f2-244008efa161	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5588-1fd3-4ab8-133032db441a
000d0000-5588-1fd4-9554-15bf1791c276	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5588-1fd3-8e4b-da308625ea2f
000d0000-5588-1fd4-9c48-5678167eb5ce	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5588-1fd3-8e4b-da308625ea2f
000d0000-5588-1fd4-e2e4-9426ca58b2c8	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5588-1fd3-8e4b-da308625ea2f
000d0000-5588-1fd4-e2ab-615142b870bc	000e0000-5588-1fd4-25a2-a9c0dda3189f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5588-1fd3-a7de-e4f56106205b
\.


--
-- TOC entry 2858 (class 0 OID 7979371)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 7979419)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 7979351)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5588-1fd4-4630-60dffd0ad36d	00080000-5588-1fd3-24d1-f9ab8c9ff17e	00090000-5588-1fd4-79c0-c6227a9c8c6d	AK		
\.


--
-- TOC entry 2833 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2868 (class 0 OID 7979468)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 7979493)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 7979308)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5588-1fd2-f90e-02b7dfbcca1c	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5588-1fd2-36aa-707cf07406b0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5588-1fd2-cd2d-bd6fdcdec4de	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5588-1fd2-3fa4-4a5e73dc8936	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5588-1fd2-143c-703c88698ed0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5588-1fd2-0ab3-cf0c2a4bdeb3	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5588-1fd2-9b10-4ea68691ccfd	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5588-1fd2-5ebe-57543747fb9c	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-1fd2-f3ca-8eccd00cc990	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5588-1fd2-5e0c-05711809f612	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5588-1fd2-49b9-530ff9a42168	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5588-1fd2-7ecf-50f81903a61f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5588-1fd2-7e7f-6b66cfbf7105	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5588-1fd3-f9b8-be60e79414a3	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5588-1fd3-05b6-37c7e5c5ec38	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5588-1fd3-ac07-265c9da0175c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5588-1fd3-14d1-fee17e2bdd53	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5588-1fd3-24a9-22d51e46bef6	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5588-1fd3-f069-79b6bcd27805	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2847 (class 0 OID 7979221)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5588-1fd3-c753-5c970e598ba1	00000000-5588-1fd3-05b6-37c7e5c5ec38	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5588-1fd3-d77c-95bba961054b	00000000-5588-1fd3-05b6-37c7e5c5ec38	00010000-5588-1fd2-bb19-3995efca6516	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5588-1fd3-ad42-cf701a84c395	00000000-5588-1fd3-ac07-265c9da0175c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2848 (class 0 OID 7979232)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5588-1fd4-fcb0-9803a4adb0cb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5588-1fd4-1f5e-5f33f8a8c2a8	00010000-5588-1fd4-ea75-b6509dbf9951	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5588-1fd4-4b6d-1be55049adef	00010000-5588-1fd4-1d7a-23c77c9dfc99	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5588-1fd4-d16a-9d30b4127b00	00010000-5588-1fd4-b967-798baed43399	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5588-1fd4-b347-77e3ee995156	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5588-1fd4-ca31-a3ec241551cb	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5588-1fd4-dddc-64161ad24483	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5588-1fd4-956e-f630d34fe6c4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5588-1fd4-79c0-c6227a9c8c6d	00010000-5588-1fd4-4541-7eacffb05564	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5588-1fd4-f49b-d103d8bd325c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5588-1fd4-e5a9-20798a1995de	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5588-1fd4-9d87-c07484b170a4	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5588-1fd4-d4ac-8bee7fd717bb	00010000-5588-1fd4-8b47-d6d2d1fc0070	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2835 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 7979186)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5588-1fd2-5b70-4c8760697f13	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5588-1fd2-39cb-bfbfe93e18bf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5588-1fd2-e4c5-c68be14cbc84	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5588-1fd2-0690-dfea81bc3476	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5588-1fd2-91df-844aad588834	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5588-1fd2-3b6d-ebd51f3f283d	Abonma-read	Abonma - branje	f
00030000-5588-1fd2-604e-0fd219bb4f32	Abonma-write	Abonma - spreminjanje	f
00030000-5588-1fd2-dfcc-2f2fc28723ea	Alternacija-read	Alternacija - branje	f
00030000-5588-1fd2-0030-21fb2bfe263e	Alternacija-write	Alternacija - spreminjanje	f
00030000-5588-1fd2-a239-2938cedc6f91	Arhivalija-read	Arhivalija - branje	f
00030000-5588-1fd2-fa58-ebc5627a3e9d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5588-1fd2-6714-1742808479cb	Besedilo-read	Besedilo - branje	f
00030000-5588-1fd2-daf3-b26f10fe0a3f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5588-1fd2-f626-2a15edd00744	DogodekIzven-read	DogodekIzven - branje	f
00030000-5588-1fd2-5d79-3d3fb77fd3f3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5588-1fd2-2cd3-24fb15c8c527	Dogodek-read	Dogodek - branje	f
00030000-5588-1fd2-1a54-ae379393db8a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5588-1fd2-5f8e-22fc6d6cda3a	Drzava-read	Drzava - branje	f
00030000-5588-1fd2-1f6c-17aca9379e61	Drzava-write	Drzava - spreminjanje	f
00030000-5588-1fd2-ffed-0fd140c1c164	Funkcija-read	Funkcija - branje	f
00030000-5588-1fd2-e085-daecbf883201	Funkcija-write	Funkcija - spreminjanje	f
00030000-5588-1fd2-3490-5c6bd426c5c0	Gostovanje-read	Gostovanje - branje	f
00030000-5588-1fd2-3ce3-603cce883c9a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5588-1fd2-3afd-ee516c04f09c	Gostujoca-read	Gostujoca - branje	f
00030000-5588-1fd2-9aac-0b199df9f648	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5588-1fd2-0ea6-5f8961559c7a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5588-1fd2-1bbe-75fe13b764e3	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5588-1fd2-c4f1-66081976c888	Kupec-read	Kupec - branje	f
00030000-5588-1fd2-5bfc-327e5e2fa7aa	Kupec-write	Kupec - spreminjanje	f
00030000-5588-1fd2-3fd5-44317d0ca2ed	NacinPlacina-read	NacinPlacina - branje	f
00030000-5588-1fd2-9ea1-083429beb6b5	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5588-1fd2-b560-e8afb8350eed	Option-read	Option - branje	f
00030000-5588-1fd2-b1be-c3444e1c815e	Option-write	Option - spreminjanje	f
00030000-5588-1fd2-1719-8a50fcacbb42	OptionValue-read	OptionValue - branje	f
00030000-5588-1fd2-7c2c-46e1736a1564	OptionValue-write	OptionValue - spreminjanje	f
00030000-5588-1fd2-48a3-2c31808cf097	Oseba-read	Oseba - branje	f
00030000-5588-1fd2-4ae3-28199d73c502	Oseba-write	Oseba - spreminjanje	f
00030000-5588-1fd2-de8d-2ef3882eda18	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5588-1fd2-66be-910a0d8361ca	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5588-1fd2-ef03-dabac09ffc4e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5588-1fd2-3a3b-731496c3017f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5588-1fd2-5036-5e319a5d6cac	Pogodba-read	Pogodba - branje	f
00030000-5588-1fd2-921d-9105c1ad1f60	Pogodba-write	Pogodba - spreminjanje	f
00030000-5588-1fd2-f00c-e7767d51db96	Popa-read	Popa - branje	f
00030000-5588-1fd2-74a6-5438872c6484	Popa-write	Popa - spreminjanje	f
00030000-5588-1fd2-c8a4-9cc52244f804	Posta-read	Posta - branje	f
00030000-5588-1fd2-24a4-bfc2bec4a021	Posta-write	Posta - spreminjanje	f
00030000-5588-1fd2-ee2c-814808b472c5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5588-1fd2-54d8-9dc3847aab73	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5588-1fd2-7a8d-d606dde38953	PostniNaslov-read	PostniNaslov - branje	f
00030000-5588-1fd2-4c45-caa14c26783e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5588-1fd2-8869-0759445723dd	Predstava-read	Predstava - branje	f
00030000-5588-1fd2-e3fc-8d48ae5263ba	Predstava-write	Predstava - spreminjanje	f
00030000-5588-1fd2-80f3-8ebdc990e8dc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5588-1fd2-6601-693a8fe46107	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5588-1fd2-a357-80dd7935e332	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5588-1fd2-0e0b-f6fe5b90cd49	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5588-1fd2-6f7c-508cb4407440	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5588-1fd2-6d79-2fe834c7ecfb	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5588-1fd2-619d-20825ce2d985	ProgramDela-read	ProgramDela - branje	f
00030000-5588-1fd2-217b-89fa1ccd5aa7	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5588-1fd2-686b-6446b2c54cb0	ProgramFestival-read	ProgramFestival - branje	f
00030000-5588-1fd2-f160-4f8138335f94	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5588-1fd2-f9aa-f958e1f2cb91	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5588-1fd2-fe90-4ce8479292fa	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5588-1fd2-8763-a4fc1aa907b4	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5588-1fd2-3c87-82c4d5f6e23d	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5588-1fd2-2aa8-18644d34bc78	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5588-1fd2-c114-826745f7c6f3	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5588-1fd2-bf8e-37baf343e758	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5588-1fd2-ec63-0bbb361191bc	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5588-1fd2-92eb-4b9ec029034a	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5588-1fd2-bfb4-a53c8b67fc57	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5588-1fd2-26e6-d900c3e87ce1	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5588-1fd2-db86-b8106e73530f	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5588-1fd2-7cbc-1c960ff5f549	ProgramRazno-read	ProgramRazno - branje	f
00030000-5588-1fd2-84d3-88c318623db0	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5588-1fd2-d278-5e7b8ec5bbab	Prostor-read	Prostor - branje	f
00030000-5588-1fd2-0bde-b431dffd1d09	Prostor-write	Prostor - spreminjanje	f
00030000-5588-1fd2-7aa0-812ca80f9640	Racun-read	Racun - branje	f
00030000-5588-1fd2-5945-679661381e05	Racun-write	Racun - spreminjanje	f
00030000-5588-1fd2-0069-9eba282202f6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5588-1fd2-7af7-a0fdd3a146cf	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5588-1fd2-2e07-0cefaccf7e2e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5588-1fd2-2ef3-09478697f721	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5588-1fd2-2313-5dc0687beec4	Rekvizit-read	Rekvizit - branje	f
00030000-5588-1fd2-691f-2d114e419d7a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5588-1fd2-d884-036ceaac69f0	Revizija-read	Revizija - branje	f
00030000-5588-1fd2-58c2-746eee7f4221	Revizija-write	Revizija - spreminjanje	f
00030000-5588-1fd2-0891-36a6415e2034	Rezervacija-read	Rezervacija - branje	f
00030000-5588-1fd2-5033-74c140cb7b81	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5588-1fd2-ef61-88127bb82eee	SedezniRed-read	SedezniRed - branje	f
00030000-5588-1fd2-b270-985511802785	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5588-1fd2-37c0-9b63fc483c66	Sedez-read	Sedez - branje	f
00030000-5588-1fd2-273a-3b3797455dc9	Sedez-write	Sedez - spreminjanje	f
00030000-5588-1fd2-190d-5c123b3f1f76	Sezona-read	Sezona - branje	f
00030000-5588-1fd2-fdd7-49ad531893b3	Sezona-write	Sezona - spreminjanje	f
00030000-5588-1fd2-68de-5cc40cdda0df	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5588-1fd2-b9b0-75709788d644	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5588-1fd2-3225-7dd97dffd5bf	Stevilcenje-read	Stevilcenje - branje	f
00030000-5588-1fd2-8954-03df5b16544f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5588-1fd2-2377-2d1aaba1f0f2	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5588-1fd2-9156-40f9800aed08	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5588-1fd2-a074-a65c1062d5ec	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5588-1fd2-f55e-2d06dabaa7e8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5588-1fd2-6b0d-ea3e53959d1e	Telefonska-read	Telefonska - branje	f
00030000-5588-1fd2-9d51-1b3f1f34c6c4	Telefonska-write	Telefonska - spreminjanje	f
00030000-5588-1fd2-02fd-6d6e8230701c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5588-1fd2-9390-899d2b1f156f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5588-1fd2-b0d7-a8feee5970f2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5588-1fd2-624f-6b4ff5040f94	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5588-1fd2-2bde-920596a0b17e	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5588-1fd2-c0b7-192ef898924f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5588-1fd2-14ea-721d9cf6bb00	Trr-read	Trr - branje	f
00030000-5588-1fd2-9d42-4078d570a365	Trr-write	Trr - spreminjanje	f
00030000-5588-1fd2-6a0c-f40ede80db74	Uprizoritev-read	Uprizoritev - branje	f
00030000-5588-1fd2-6a0b-22ce6952a68c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5588-1fd2-4b63-17210ff5dcf7	Vaja-read	Vaja - branje	f
00030000-5588-1fd2-0298-9a28c5818c9c	Vaja-write	Vaja - spreminjanje	f
00030000-5588-1fd2-f66f-046895f11ba7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5588-1fd2-a30e-b9704448d57d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5588-1fd2-98cc-13051d993c60	Zaposlitev-read	Zaposlitev - branje	f
00030000-5588-1fd2-d35b-11a16bd81ff8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5588-1fd2-d15d-cb83e342557a	Zasedenost-read	Zasedenost - branje	f
00030000-5588-1fd2-3bba-88fa9adaec0a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5588-1fd2-12a0-f417304c38e6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5588-1fd2-e5a6-777d145d629d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5588-1fd2-f0cc-0bb57fc09620	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5588-1fd2-f114-c68d4f918600	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2845 (class 0 OID 7979205)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5588-1fd2-b303-43bbf74d5594	00030000-5588-1fd2-39cb-bfbfe93e18bf
00020000-5588-1fd2-f5ab-2ef3e80ef9a3	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-604e-0fd219bb4f32
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-dfcc-2f2fc28723ea
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-0030-21fb2bfe263e
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-0690-dfea81bc3476
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-1a54-ae379393db8a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-1f6c-17aca9379e61
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-ffed-0fd140c1c164
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-e085-daecbf883201
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-3ce3-603cce883c9a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-9aac-0b199df9f648
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-0ea6-5f8961559c7a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-1bbe-75fe13b764e3
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-48a3-2c31808cf097
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-4ae3-28199d73c502
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-74a6-5438872c6484
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-24a4-bfc2bec4a021
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-7a8d-d606dde38953
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-4c45-caa14c26783e
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-e3fc-8d48ae5263ba
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-6f7c-508cb4407440
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-6d79-2fe834c7ecfb
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-0bde-b431dffd1d09
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-2ef3-09478697f721
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-691f-2d114e419d7a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-fdd7-49ad531893b3
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-b0d7-a8feee5970f2
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-6a0c-f40ede80db74
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-6a0b-22ce6952a68c
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-4b63-17210ff5dcf7
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-0298-9a28c5818c9c
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-d15d-cb83e342557a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-3bba-88fa9adaec0a
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd2-1b23-4dbed749d93c	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-0ea6-5f8961559c7a
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-1bbe-75fe13b764e3
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-48a3-2c31808cf097
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-4ae3-28199d73c502
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-7a8d-d606dde38953
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-4c45-caa14c26783e
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-6b0d-ea3e53959d1e
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-9d51-1b3f1f34c6c4
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-14ea-721d9cf6bb00
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-9d42-4078d570a365
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-98cc-13051d993c60
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-d35b-11a16bd81ff8
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd2-073f-4bfd87c1a631	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-dfcc-2f2fc28723ea
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-fa58-ebc5627a3e9d
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-6714-1742808479cb
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-f626-2a15edd00744
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-ffed-0fd140c1c164
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-0ea6-5f8961559c7a
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-48a3-2c31808cf097
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-6f7c-508cb4407440
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-b0d7-a8feee5970f2
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-4b63-17210ff5dcf7
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-d15d-cb83e342557a
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd2-afc2-4a2845ce8ec4	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-604e-0fd219bb4f32
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-0030-21fb2bfe263e
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-b0d7-a8feee5970f2
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd2-94f5-014a5f99b817	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-02fd-6d6e8230701c
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-e4c5-c68be14cbc84
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-b0d7-a8feee5970f2
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd2-1315-e01aa1f6c6c1	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5b70-4c8760697f13
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-39cb-bfbfe93e18bf
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-e4c5-c68be14cbc84
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0690-dfea81bc3476
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-91df-844aad588834
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3b6d-ebd51f3f283d
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-604e-0fd219bb4f32
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-dfcc-2f2fc28723ea
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0030-21fb2bfe263e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-a239-2938cedc6f91
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-fa58-ebc5627a3e9d
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6714-1742808479cb
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-daf3-b26f10fe0a3f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f626-2a15edd00744
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5d79-3d3fb77fd3f3
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2cd3-24fb15c8c527
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-1a54-ae379393db8a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5f8e-22fc6d6cda3a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-1f6c-17aca9379e61
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-ffed-0fd140c1c164
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-e085-daecbf883201
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3490-5c6bd426c5c0
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3ce3-603cce883c9a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3afd-ee516c04f09c
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9aac-0b199df9f648
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0ea6-5f8961559c7a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-1bbe-75fe13b764e3
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-c4f1-66081976c888
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5bfc-327e5e2fa7aa
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3fd5-44317d0ca2ed
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9ea1-083429beb6b5
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-b560-e8afb8350eed
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-b1be-c3444e1c815e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-1719-8a50fcacbb42
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-7c2c-46e1736a1564
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-48a3-2c31808cf097
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-4ae3-28199d73c502
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-de8d-2ef3882eda18
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-66be-910a0d8361ca
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-ef03-dabac09ffc4e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3a3b-731496c3017f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5036-5e319a5d6cac
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-921d-9105c1ad1f60
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f00c-e7767d51db96
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-74a6-5438872c6484
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-c8a4-9cc52244f804
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-24a4-bfc2bec4a021
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-ee2c-814808b472c5
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-54d8-9dc3847aab73
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-7a8d-d606dde38953
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-4c45-caa14c26783e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-8869-0759445723dd
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-e3fc-8d48ae5263ba
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-80f3-8ebdc990e8dc
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6601-693a8fe46107
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-a357-80dd7935e332
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0e0b-f6fe5b90cd49
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6f7c-508cb4407440
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6d79-2fe834c7ecfb
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-619d-20825ce2d985
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-217b-89fa1ccd5aa7
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-686b-6446b2c54cb0
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f160-4f8138335f94
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f9aa-f958e1f2cb91
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-fe90-4ce8479292fa
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-8763-a4fc1aa907b4
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3c87-82c4d5f6e23d
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2aa8-18644d34bc78
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-c114-826745f7c6f3
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-bf8e-37baf343e758
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-ec63-0bbb361191bc
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-92eb-4b9ec029034a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-bfb4-a53c8b67fc57
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-26e6-d900c3e87ce1
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-db86-b8106e73530f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-7cbc-1c960ff5f549
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-84d3-88c318623db0
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-d278-5e7b8ec5bbab
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0bde-b431dffd1d09
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-7aa0-812ca80f9640
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5945-679661381e05
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0069-9eba282202f6
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-7af7-a0fdd3a146cf
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2e07-0cefaccf7e2e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2ef3-09478697f721
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2313-5dc0687beec4
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-691f-2d114e419d7a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-d884-036ceaac69f0
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-58c2-746eee7f4221
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0891-36a6415e2034
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-5033-74c140cb7b81
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-ef61-88127bb82eee
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-b270-985511802785
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-37c0-9b63fc483c66
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-273a-3b3797455dc9
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-190d-5c123b3f1f76
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-fdd7-49ad531893b3
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-68de-5cc40cdda0df
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-b9b0-75709788d644
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3225-7dd97dffd5bf
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-8954-03df5b16544f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2377-2d1aaba1f0f2
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9156-40f9800aed08
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-a074-a65c1062d5ec
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f55e-2d06dabaa7e8
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6b0d-ea3e53959d1e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9d51-1b3f1f34c6c4
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-02fd-6d6e8230701c
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9390-899d2b1f156f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-b0d7-a8feee5970f2
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-624f-6b4ff5040f94
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-2bde-920596a0b17e
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-c0b7-192ef898924f
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-14ea-721d9cf6bb00
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-9d42-4078d570a365
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6a0c-f40ede80db74
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-6a0b-22ce6952a68c
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-4b63-17210ff5dcf7
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-0298-9a28c5818c9c
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f66f-046895f11ba7
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-a30e-b9704448d57d
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-98cc-13051d993c60
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-d35b-11a16bd81ff8
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-d15d-cb83e342557a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-3bba-88fa9adaec0a
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-12a0-f417304c38e6
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-e5a6-777d145d629d
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f0cc-0bb57fc09620
00020000-5588-1fd4-f474-e2388c994783	00030000-5588-1fd2-f114-c68d4f918600
\.


--
-- TOC entry 2873 (class 0 OID 7979500)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2877 (class 0 OID 7979531)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 7979667)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5588-1fd4-e2d1-5809fdff9199	00090000-5588-1fd4-fcb0-9803a4adb0cb	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2850 (class 0 OID 7979265)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5588-1fd3-24d1-f9ab8c9ff17e	00040000-5588-1fd2-bef6-a157e225b395	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-1fd3-1f5b-e69f2b45c29f	00040000-5588-1fd2-bef6-a157e225b395	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-1fd3-5c08-17379e4771a7	00040000-5588-1fd2-bef6-a157e225b395	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-1fd3-9dce-19d7c486992c	00040000-5588-1fd2-bef6-a157e225b395	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-1fd3-b773-d7653bff6543	00040000-5588-1fd2-bef6-a157e225b395	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5588-1fd4-ee05-7bb71016ee9c	00040000-5588-1fd2-f484-08c1a20dd1ef	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2852 (class 0 OID 7979300)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5588-1fd2-cd88-1c2122263ab0	8341	Adlešiči
00050000-5588-1fd2-b57c-ce521a09fef8	5270	Ajdovščina
00050000-5588-1fd2-5f15-fe09c4864387	6280	Ankaran/Ancarano
00050000-5588-1fd2-9d19-829f8eb511f6	9253	Apače
00050000-5588-1fd2-b756-15afc93f69aa	8253	Artiče
00050000-5588-1fd2-c829-cb05394a9df5	4275	Begunje na Gorenjskem
00050000-5588-1fd2-2ce1-4a9f54f0961b	1382	Begunje pri Cerknici
00050000-5588-1fd2-93e3-776d87018264	9231	Beltinci
00050000-5588-1fd2-5285-52b337daa5a9	2234	Benedikt
00050000-5588-1fd2-98e9-80f945e23268	2345	Bistrica ob Dravi
00050000-5588-1fd2-b833-0c04ec26a0dd	3256	Bistrica ob Sotli
00050000-5588-1fd2-872f-88e3269a7219	8259	Bizeljsko
00050000-5588-1fd2-870c-63e54551a7a8	1223	Blagovica
00050000-5588-1fd2-ea25-da3e8cd39460	8283	Blanca
00050000-5588-1fd2-3bb5-917ea17e3c6d	4260	Bled
00050000-5588-1fd2-9fa8-128aaa387f65	4273	Blejska Dobrava
00050000-5588-1fd2-5c8b-6706c69b9b8d	9265	Bodonci
00050000-5588-1fd2-feec-2dee119fd557	9222	Bogojina
00050000-5588-1fd2-1370-f309ffc1a717	4263	Bohinjska Bela
00050000-5588-1fd2-2a7e-af9dadf9b449	4264	Bohinjska Bistrica
00050000-5588-1fd2-ffb8-7bf5598f72f7	4265	Bohinjsko jezero
00050000-5588-1fd2-7990-196eb6f36e36	1353	Borovnica
00050000-5588-1fd2-f0eb-8601ab88901c	8294	Boštanj
00050000-5588-1fd2-b6fd-f6ce0e435ccc	5230	Bovec
00050000-5588-1fd2-565a-ee6aa59988c8	5295	Branik
00050000-5588-1fd2-a541-dc18723cfd69	3314	Braslovče
00050000-5588-1fd2-e84a-a706946f4a0c	5223	Breginj
00050000-5588-1fd2-cd02-b7d45c8de855	8280	Brestanica
00050000-5588-1fd2-3492-afbbae0fd978	2354	Bresternica
00050000-5588-1fd2-ffea-a9f6d6383a02	4243	Brezje
00050000-5588-1fd2-5555-a867393bfa52	1351	Brezovica pri Ljubljani
00050000-5588-1fd2-4ad4-f4cb2ae67945	8250	Brežice
00050000-5588-1fd2-28d8-e0fc5bcb6537	4210	Brnik - Aerodrom
00050000-5588-1fd2-e59d-cfcdea3c98ff	8321	Brusnice
00050000-5588-1fd2-08d3-70a9cd02dc87	3255	Buče
00050000-5588-1fd2-3607-967d23156579	8276	Bučka 
00050000-5588-1fd2-7872-885f0f8ec592	9261	Cankova
00050000-5588-1fd2-f3ed-f772f195078a	3000	Celje 
00050000-5588-1fd2-fd80-bd0231478779	3001	Celje - poštni predali
00050000-5588-1fd2-0f8a-d6f1f87597d0	4207	Cerklje na Gorenjskem
00050000-5588-1fd2-b677-879c8861acb5	8263	Cerklje ob Krki
00050000-5588-1fd2-3832-e620262f45eb	1380	Cerknica
00050000-5588-1fd2-189b-e226b95d4d6d	5282	Cerkno
00050000-5588-1fd2-f01f-6cf3ef3e28cc	2236	Cerkvenjak
00050000-5588-1fd2-6c4e-eaf7bdebf3b6	2215	Ceršak
00050000-5588-1fd2-1bec-25677b2d259b	2326	Cirkovce
00050000-5588-1fd2-f6e8-02c9074c18bc	2282	Cirkulane
00050000-5588-1fd2-de10-70936bec6470	5273	Col
00050000-5588-1fd2-bc6a-52742a1dbcad	8251	Čatež ob Savi
00050000-5588-1fd2-d98e-af75a06c4bbb	1413	Čemšenik
00050000-5588-1fd2-3878-20e819c924b3	5253	Čepovan
00050000-5588-1fd2-048a-d48ec6ab535b	9232	Črenšovci
00050000-5588-1fd2-5c36-11529fa3ba1e	2393	Črna na Koroškem
00050000-5588-1fd2-8dd3-f0a0c41a7838	6275	Črni Kal
00050000-5588-1fd2-dc7e-3dd398bb5740	5274	Črni Vrh nad Idrijo
00050000-5588-1fd2-358a-56913d3c2c00	5262	Črniče
00050000-5588-1fd2-5d94-316eb55d4734	8340	Črnomelj
00050000-5588-1fd2-a62c-8865dbf6c6f3	6271	Dekani
00050000-5588-1fd2-037d-d90500870959	5210	Deskle
00050000-5588-1fd2-a581-6068dcd821d8	2253	Destrnik
00050000-5588-1fd2-ff1f-6ece9b4f11ff	6215	Divača
00050000-5588-1fd2-0a25-ce193bff293e	1233	Dob
00050000-5588-1fd2-5109-46d23700d82f	3224	Dobje pri Planini
00050000-5588-1fd2-b246-955366641fb2	8257	Dobova
00050000-5588-1fd2-42a7-1f125996fa53	1423	Dobovec
00050000-5588-1fd2-2cd3-58ef1851a668	5263	Dobravlje
00050000-5588-1fd2-8a21-7d1fe7f81c55	3204	Dobrna
00050000-5588-1fd2-5ea8-3a7c0325ce59	8211	Dobrnič
00050000-5588-1fd2-2c3f-2966962d279d	1356	Dobrova
00050000-5588-1fd2-21b1-0c10973715e8	9223	Dobrovnik/Dobronak 
00050000-5588-1fd2-aba5-a6f6bde83eac	5212	Dobrovo v Brdih
00050000-5588-1fd2-6232-2b6163f7069b	1431	Dol pri Hrastniku
00050000-5588-1fd2-ced3-ea153d9e90db	1262	Dol pri Ljubljani
00050000-5588-1fd2-1efd-569ed2ab8a72	1273	Dole pri Litiji
00050000-5588-1fd2-a49e-915c58b4c43b	1331	Dolenja vas
00050000-5588-1fd2-0192-74b1d649b7b7	8350	Dolenjske Toplice
00050000-5588-1fd2-28dc-fa81430a67e2	1230	Domžale
00050000-5588-1fd2-de79-089ab17453c2	2252	Dornava
00050000-5588-1fd2-7b38-612ad852446a	5294	Dornberk
00050000-5588-1fd2-f009-f38b8696a82b	1319	Draga
00050000-5588-1fd2-4339-ec71b8a182d1	8343	Dragatuš
00050000-5588-1fd2-e27b-f531afc6822a	3222	Dramlje
00050000-5588-1fd2-2592-859da62449bc	2370	Dravograd
00050000-5588-1fd2-effa-64bed6a08a60	4203	Duplje
00050000-5588-1fd2-2c77-94053d525dcb	6221	Dutovlje
00050000-5588-1fd2-de1c-fcacc44fbd43	8361	Dvor
00050000-5588-1fd2-406d-74200b88477b	2343	Fala
00050000-5588-1fd2-8a1b-e1123879159d	9208	Fokovci
00050000-5588-1fd2-d1bd-c045ae6e2b7e	2313	Fram
00050000-5588-1fd2-92d3-4be985ec8de6	3213	Frankolovo
00050000-5588-1fd2-48f8-5767dda5e062	1274	Gabrovka
00050000-5588-1fd2-8d61-298192e7c02d	8254	Globoko
00050000-5588-1fd2-7988-32a17c7696b5	5275	Godovič
00050000-5588-1fd2-dfac-772214ce655c	4204	Golnik
00050000-5588-1fd2-354a-df8033d1dbad	3303	Gomilsko
00050000-5588-1fd2-4496-a59ee2fbab6c	4224	Gorenja vas
00050000-5588-1fd2-02ab-c36b40cee7ae	3263	Gorica pri Slivnici
00050000-5588-1fd2-d89a-d3bddad58ffd	2272	Gorišnica
00050000-5588-1fd2-ca5e-dbe9fe08c17e	9250	Gornja Radgona
00050000-5588-1fd2-de88-2078370e917b	3342	Gornji Grad
00050000-5588-1fd2-4ac6-7cc5ff042454	4282	Gozd Martuljek
00050000-5588-1fd2-0dae-69dde6291c8c	6272	Gračišče
00050000-5588-1fd2-6e33-66ae003de986	9264	Grad
00050000-5588-1fd2-3786-c49d8c17ca06	8332	Gradac
00050000-5588-1fd2-be16-7fd3a3236d3f	1384	Grahovo
00050000-5588-1fd2-f7f7-3eef87a730c6	5242	Grahovo ob Bači
00050000-5588-1fd2-0543-aefbebeb43d6	5251	Grgar
00050000-5588-1fd2-091a-ebcf67cc80b3	3302	Griže
00050000-5588-1fd2-f261-bbb21ca314cb	3231	Grobelno
00050000-5588-1fd2-8b31-9976f13b50a2	1290	Grosuplje
00050000-5588-1fd2-744c-2f3b5b81e791	2288	Hajdina
00050000-5588-1fd2-d22e-8bae9b3ec390	8362	Hinje
00050000-5588-1fd2-f12d-ab2beb011d76	2311	Hoče
00050000-5588-1fd2-5228-ebda92abd4a6	9205	Hodoš/Hodos
00050000-5588-1fd2-e817-eb65cbb75a85	1354	Horjul
00050000-5588-1fd2-4b0c-02151f336b24	1372	Hotedršica
00050000-5588-1fd2-d6da-f93bda8e0a75	1430	Hrastnik
00050000-5588-1fd2-78b4-321ff6840625	6225	Hruševje
00050000-5588-1fd2-a858-1c042fb1b356	4276	Hrušica
00050000-5588-1fd2-a4fb-7b21d8606918	5280	Idrija
00050000-5588-1fd2-42b6-6e895fb57c22	1292	Ig
00050000-5588-1fd2-6bbc-b6f5712d844f	6250	Ilirska Bistrica
00050000-5588-1fd2-f3fa-f619691caefc	6251	Ilirska Bistrica-Trnovo
00050000-5588-1fd2-51bd-b683a99421ee	1295	Ivančna Gorica
00050000-5588-1fd2-56bf-8b0a8ad81625	2259	Ivanjkovci
00050000-5588-1fd2-5a6c-63f7702758f0	1411	Izlake
00050000-5588-1fd2-eeda-2e934db10d47	6310	Izola/Isola
00050000-5588-1fd2-359f-f5632e9bc8c9	2222	Jakobski Dol
00050000-5588-1fd2-9170-4b8433f791b5	2221	Jarenina
00050000-5588-1fd2-2098-19fe81cc4126	6254	Jelšane
00050000-5588-1fd2-1400-98c0e08d5537	4270	Jesenice
00050000-5588-1fd2-a06c-250d91963486	8261	Jesenice na Dolenjskem
00050000-5588-1fd2-d71f-b8cb62765bd6	3273	Jurklošter
00050000-5588-1fd2-3655-f3a28130b5f9	2223	Jurovski Dol
00050000-5588-1fd2-8f0b-ed4b6e561910	2256	Juršinci
00050000-5588-1fd2-6219-b9fb794b53fc	5214	Kal nad Kanalom
00050000-5588-1fd2-b486-22e3ea8aa702	3233	Kalobje
00050000-5588-1fd2-9975-8302238343d5	4246	Kamna Gorica
00050000-5588-1fd2-7b64-d53a5f7e6a82	2351	Kamnica
00050000-5588-1fd2-0bbb-5c50818e0363	1241	Kamnik
00050000-5588-1fd2-7d11-ea3924f412d0	5213	Kanal
00050000-5588-1fd2-fc96-29000bda8b8d	8258	Kapele
00050000-5588-1fd2-6f23-2867fc9d103e	2362	Kapla
00050000-5588-1fd2-b016-9994f91f3b61	2325	Kidričevo
00050000-5588-1fd2-b08c-26b9db850593	1412	Kisovec
00050000-5588-1fd2-b216-d2ad102d0ad5	6253	Knežak
00050000-5588-1fd2-1799-0d0436d08890	5222	Kobarid
00050000-5588-1fd2-1af7-e4e7932f1067	9227	Kobilje
00050000-5588-1fd2-c1fc-2ee1520c3855	1330	Kočevje
00050000-5588-1fd2-2811-e5d9ee65de24	1338	Kočevska Reka
00050000-5588-1fd2-25b5-3ec5e70e4b6f	2276	Kog
00050000-5588-1fd2-8b7b-ef9e2c68a83c	5211	Kojsko
00050000-5588-1fd2-42f7-4450b0b9a425	6223	Komen
00050000-5588-1fd2-542a-84db89bef515	1218	Komenda
00050000-5588-1fd2-f2ae-646ef54b046b	6000	Koper/Capodistria 
00050000-5588-1fd2-37ca-e08e21b2bca6	6001	Koper/Capodistria - poštni predali
00050000-5588-1fd2-d6f1-c07f4cdf02fa	8282	Koprivnica
00050000-5588-1fd2-ea70-b896c7c6807d	5296	Kostanjevica na Krasu
00050000-5588-1fd2-cec9-9679253b9e71	8311	Kostanjevica na Krki
00050000-5588-1fd2-f282-28db17bebaeb	1336	Kostel
00050000-5588-1fd2-aa6f-c93c88ee925f	6256	Košana
00050000-5588-1fd2-7d37-9d555117d294	2394	Kotlje
00050000-5588-1fd2-beb4-b706f5bff206	6240	Kozina
00050000-5588-1fd2-8fcb-d2e89da894f6	3260	Kozje
00050000-5588-1fd2-2375-478818a86689	4000	Kranj 
00050000-5588-1fd2-60ef-91b6da9f6e96	4001	Kranj - poštni predali
00050000-5588-1fd2-b310-cbcca9769b8e	4280	Kranjska Gora
00050000-5588-1fd2-ef37-13bdf534ea46	1281	Kresnice
00050000-5588-1fd2-72ae-692deb632c36	4294	Križe
00050000-5588-1fd2-9967-b06ba710b627	9206	Križevci
00050000-5588-1fd2-e1d1-e8f3ba5e489d	9242	Križevci pri Ljutomeru
00050000-5588-1fd2-b6c8-2ec018fa5663	1301	Krka
00050000-5588-1fd2-9e49-950aa20aaecc	8296	Krmelj
00050000-5588-1fd2-9a0a-72564f44804e	4245	Kropa
00050000-5588-1fd2-bf42-75bcecee6731	8262	Krška vas
00050000-5588-1fd2-7ed4-7f189bd074ea	8270	Krško
00050000-5588-1fd2-d4bc-196083233bcd	9263	Kuzma
00050000-5588-1fd2-7848-1320c178c6a3	2318	Laporje
00050000-5588-1fd2-4120-8385ac099291	3270	Laško
00050000-5588-1fd2-0f4c-6fc1693d132f	1219	Laze v Tuhinju
00050000-5588-1fd2-367d-f42b1624786a	2230	Lenart v Slovenskih goricah
00050000-5588-1fd2-1f71-1b64e98cf405	9220	Lendava/Lendva
00050000-5588-1fd2-6882-35c748c4cd37	4248	Lesce
00050000-5588-1fd2-dc6e-e09fb5d19ca4	3261	Lesično
00050000-5588-1fd2-8740-557a61568cf5	8273	Leskovec pri Krškem
00050000-5588-1fd2-cf21-ca1f5c7f3a08	2372	Libeliče
00050000-5588-1fd2-2162-c45e90a9c3c4	2341	Limbuš
00050000-5588-1fd2-266d-2d239184bf2c	1270	Litija
00050000-5588-1fd2-a334-516a0514ab88	3202	Ljubečna
00050000-5588-1fd2-1193-22859ea92d96	1000	Ljubljana 
00050000-5588-1fd2-086c-2307b928f66d	1001	Ljubljana - poštni predali
00050000-5588-1fd2-7980-a9bfce7422c7	1231	Ljubljana - Črnuče
00050000-5588-1fd2-2ea9-7bc41a60b4cd	1261	Ljubljana - Dobrunje
00050000-5588-1fd2-a99c-7511a055bc2d	1260	Ljubljana - Polje
00050000-5588-1fd2-0be5-8768c8aa6005	1210	Ljubljana - Šentvid
00050000-5588-1fd2-bbe3-b1a8227af564	1211	Ljubljana - Šmartno
00050000-5588-1fd2-3065-cbb67552d5fa	3333	Ljubno ob Savinji
00050000-5588-1fd2-f0e0-7e9dd39ba2a7	9240	Ljutomer
00050000-5588-1fd2-a168-5dbb580f2b9d	3215	Loče
00050000-5588-1fd2-9d57-6498fa543958	5231	Log pod Mangartom
00050000-5588-1fd2-7847-140768b3b752	1358	Log pri Brezovici
00050000-5588-1fd2-7951-61b813af38e3	1370	Logatec
00050000-5588-1fd2-2ef7-f3215363ac4f	1371	Logatec
00050000-5588-1fd2-6cf1-685be95bc5e1	1434	Loka pri Zidanem Mostu
00050000-5588-1fd2-6e75-b737f9f5ba71	3223	Loka pri Žusmu
00050000-5588-1fd2-58cd-11f6776a464f	6219	Lokev
00050000-5588-1fd2-3428-599200d8b3e1	1318	Loški Potok
00050000-5588-1fd2-822b-3440ce0eae29	2324	Lovrenc na Dravskem polju
00050000-5588-1fd2-81ba-af0fb1b355b5	2344	Lovrenc na Pohorju
00050000-5588-1fd2-a73e-dcf0c3ec3b51	3334	Luče
00050000-5588-1fd2-0482-688292b69b48	1225	Lukovica
00050000-5588-1fd2-494e-7ce32581e1de	9202	Mačkovci
00050000-5588-1fd2-7e22-c46e4a98987e	2322	Majšperk
00050000-5588-1fd2-5892-e81605c1001f	2321	Makole
00050000-5588-1fd2-3c5d-f540c4198f4d	9243	Mala Nedelja
00050000-5588-1fd2-ad5b-d39c28a7cf1a	2229	Malečnik
00050000-5588-1fd2-b5c3-de70d9217af1	6273	Marezige
00050000-5588-1fd2-1413-a5e0fa8df07f	2000	Maribor 
00050000-5588-1fd2-c486-a229bfb95179	2001	Maribor - poštni predali
00050000-5588-1fd2-8dfd-d581a2166be4	2206	Marjeta na Dravskem polju
00050000-5588-1fd2-2b3e-cece74ded09b	2281	Markovci
00050000-5588-1fd2-0099-abcea94a284b	9221	Martjanci
00050000-5588-1fd2-2d19-4423d515d4e8	6242	Materija
00050000-5588-1fd2-1ae6-5f3c86a556b7	4211	Mavčiče
00050000-5588-1fd2-8d02-df409fc7a29d	1215	Medvode
00050000-5588-1fd2-3226-d7ef8d69094b	1234	Mengeš
00050000-5588-1fd2-a597-93574484ccde	8330	Metlika
00050000-5588-1fd2-b81b-df9ec4b26fdd	2392	Mežica
00050000-5588-1fd2-96b6-18305003e1b7	2204	Miklavž na Dravskem polju
00050000-5588-1fd2-2d4c-f94874fce4ef	2275	Miklavž pri Ormožu
00050000-5588-1fd2-8f47-2b782b06d22c	5291	Miren
00050000-5588-1fd2-22ed-3617cb296ea6	8233	Mirna
00050000-5588-1fd2-98f1-de90d4b94e91	8216	Mirna Peč
00050000-5588-1fd2-78b3-ba940e12a09f	2382	Mislinja
00050000-5588-1fd2-94a6-3bd070c204d2	4281	Mojstrana
00050000-5588-1fd2-dbfc-c1bf41506f6f	8230	Mokronog
00050000-5588-1fd2-a42e-b256d29ea5f1	1251	Moravče
00050000-5588-1fd2-cb78-82ae74cdba63	9226	Moravske Toplice
00050000-5588-1fd2-0398-76e1411dddb1	5216	Most na Soči
00050000-5588-1fd2-f733-3c55a3edd2eb	1221	Motnik
00050000-5588-1fd2-5fad-d63a6bdd9d84	3330	Mozirje
00050000-5588-1fd2-ae38-b9aad48e2def	9000	Murska Sobota 
00050000-5588-1fd2-b5c2-9120c2872423	9001	Murska Sobota - poštni predali
00050000-5588-1fd2-d28e-163558291aa2	2366	Muta
00050000-5588-1fd2-93f8-60e06ead6717	4202	Naklo
00050000-5588-1fd2-e21d-6c3d1f601ac3	3331	Nazarje
00050000-5588-1fd2-d102-a90d0439773d	1357	Notranje Gorice
00050000-5588-1fd2-c5cb-4371453e0997	3203	Nova Cerkev
00050000-5588-1fd2-aa31-0e455374be08	5000	Nova Gorica 
00050000-5588-1fd2-3553-068e71146067	5001	Nova Gorica - poštni predali
00050000-5588-1fd2-302b-b9c4e885e001	1385	Nova vas
00050000-5588-1fd2-17ab-8c34dfb3efc7	8000	Novo mesto
00050000-5588-1fd2-1ae8-360d73bf0922	8001	Novo mesto - poštni predali
00050000-5588-1fd2-3d7e-3d36b589deba	6243	Obrov
00050000-5588-1fd2-8e36-6176582c43d4	9233	Odranci
00050000-5588-1fd2-b3ec-3d2ebd14ba0f	2317	Oplotnica
00050000-5588-1fd2-d24e-a9323cfbb210	2312	Orehova vas
00050000-5588-1fd2-6a76-8f0e16bd334d	2270	Ormož
00050000-5588-1fd2-2934-dec56f4c1606	1316	Ortnek
00050000-5588-1fd2-820d-40883c703686	1337	Osilnica
00050000-5588-1fd2-4bd7-dc417ffd33af	8222	Otočec
00050000-5588-1fd2-e2a7-e0b49b5d1950	2361	Ožbalt
00050000-5588-1fd2-8bd6-083e6f4de020	2231	Pernica
00050000-5588-1fd2-dc40-df158ebdf081	2211	Pesnica pri Mariboru
00050000-5588-1fd2-d308-33b7c1c2e4a2	9203	Petrovci
00050000-5588-1fd2-7075-6cf8213f2dbc	3301	Petrovče
00050000-5588-1fd2-125b-dfe339b37078	6330	Piran/Pirano
00050000-5588-1fd2-e11c-c0fbae8a84fd	8255	Pišece
00050000-5588-1fd2-c219-6ea14a435eec	6257	Pivka
00050000-5588-1fd2-9381-70944f3704f2	6232	Planina
00050000-5588-1fd2-0505-6c3fe8dd5f98	3225	Planina pri Sevnici
00050000-5588-1fd2-acc6-79c753b9f34c	6276	Pobegi
00050000-5588-1fd2-56ff-d391a9f961e2	8312	Podbočje
00050000-5588-1fd2-72f7-1ef883c1dfee	5243	Podbrdo
00050000-5588-1fd2-6d04-d17b51526e8c	3254	Podčetrtek
00050000-5588-1fd2-6d3b-c9f4df79e7ae	2273	Podgorci
00050000-5588-1fd2-15b4-cc7a5f0266cb	6216	Podgorje
00050000-5588-1fd2-3ca4-335c064e3265	2381	Podgorje pri Slovenj Gradcu
00050000-5588-1fd2-b3d1-814fd65887c5	6244	Podgrad
00050000-5588-1fd2-f06f-42aeb1172759	1414	Podkum
00050000-5588-1fd2-44e1-a4cd7a5f5d40	2286	Podlehnik
00050000-5588-1fd2-8048-b0bda91a7d64	5272	Podnanos
00050000-5588-1fd2-16ae-4897762edb1a	4244	Podnart
00050000-5588-1fd2-2ee9-7dc4a7900119	3241	Podplat
00050000-5588-1fd2-17b2-e315980e1b5e	3257	Podsreda
00050000-5588-1fd2-1afc-d2906f1f864e	2363	Podvelka
00050000-5588-1fd2-419e-be2876007ec0	2208	Pohorje
00050000-5588-1fd2-d845-be1a628a6fe7	2257	Polenšak
00050000-5588-1fd2-1007-30b2a80e4313	1355	Polhov Gradec
00050000-5588-1fd2-4e43-7631254d8647	4223	Poljane nad Škofjo Loko
00050000-5588-1fd2-a95f-e031c25894a0	2319	Poljčane
00050000-5588-1fd2-748c-545b90202a14	1272	Polšnik
00050000-5588-1fd2-453f-dd2471d3c31c	3313	Polzela
00050000-5588-1fd2-9a92-4aa2c2a914cf	3232	Ponikva
00050000-5588-1fd2-2f51-2ac4526b37b6	6320	Portorož/Portorose
00050000-5588-1fd2-c8cc-84b85a8bb531	6230	Postojna
00050000-5588-1fd2-96cd-fbbc926676ac	2331	Pragersko
00050000-5588-1fd2-cd91-3507b33b39de	3312	Prebold
00050000-5588-1fd2-3e97-43ac648dfd97	4205	Preddvor
00050000-5588-1fd2-5fb8-e617cbeadcfd	6255	Prem
00050000-5588-1fd2-ee8a-72621db2d524	1352	Preserje
00050000-5588-1fd2-4976-71580b55a856	6258	Prestranek
00050000-5588-1fd2-f649-32f3c51e8539	2391	Prevalje
00050000-5588-1fd2-973b-7142cbe6ce9e	3262	Prevorje
00050000-5588-1fd2-2933-df193a8b12a2	1276	Primskovo 
00050000-5588-1fd2-66a4-76c07a2f8175	3253	Pristava pri Mestinju
00050000-5588-1fd2-5bf5-db884b2027f7	9207	Prosenjakovci/Partosfalva
00050000-5588-1fd2-9cad-a31dc3f46a7f	5297	Prvačina
00050000-5588-1fd2-5f61-52f965ba483a	2250	Ptuj
00050000-5588-1fd2-93e0-a4133b2f10cf	2323	Ptujska Gora
00050000-5588-1fd2-27d1-ba7719acd418	9201	Puconci
00050000-5588-1fd2-ee67-c7db9a990069	2327	Rače
00050000-5588-1fd2-826b-10bfa883d0f5	1433	Radeče
00050000-5588-1fd2-4977-1fea455d6924	9252	Radenci
00050000-5588-1fd2-1f13-165be709c923	2360	Radlje ob Dravi
00050000-5588-1fd2-a99e-56b57471354b	1235	Radomlje
00050000-5588-1fd2-6666-71833912b99f	4240	Radovljica
00050000-5588-1fd2-e7b9-7c9e4d021450	8274	Raka
00050000-5588-1fd2-e682-e20d796b3509	1381	Rakek
00050000-5588-1fd2-30e6-8bd8c30addb0	4283	Rateče - Planica
00050000-5588-1fd2-6d1c-e77a8bbdfc10	2390	Ravne na Koroškem
00050000-5588-1fd2-5c02-78b5ae74adab	9246	Razkrižje
00050000-5588-1fd2-39fc-730125f83bf1	3332	Rečica ob Savinji
00050000-5588-1fd2-c251-111b2a7f72c0	5292	Renče
00050000-5588-1fd2-8d0f-07cbe5811e6a	1310	Ribnica
00050000-5588-1fd2-2a1e-c3fdc109c3ec	2364	Ribnica na Pohorju
00050000-5588-1fd2-1771-d8e4ba5590e6	3272	Rimske Toplice
00050000-5588-1fd2-0f2e-3000edb0253b	1314	Rob
00050000-5588-1fd2-2a6d-3f87a07bad15	5215	Ročinj
00050000-5588-1fd2-d941-c481b72a86f5	3250	Rogaška Slatina
00050000-5588-1fd2-c44f-97faa1c0f59d	9262	Rogašovci
00050000-5588-1fd2-2a97-bb7f0a0737bb	3252	Rogatec
00050000-5588-1fd2-0c58-e5207f428405	1373	Rovte
00050000-5588-1fd2-8045-66eb0b6e0c80	2342	Ruše
00050000-5588-1fd2-7506-e23b0060acba	1282	Sava
00050000-5588-1fd2-c9a4-529b77a4bd0f	6333	Sečovlje/Sicciole
00050000-5588-1fd2-a202-e3eac469f149	4227	Selca
00050000-5588-1fd2-d29f-e406ee557bd8	2352	Selnica ob Dravi
00050000-5588-1fd2-1378-94bcdcb2d5f2	8333	Semič
00050000-5588-1fd2-dced-80ee544eabf2	8281	Senovo
00050000-5588-1fd2-68c7-a4c329033c28	6224	Senožeče
00050000-5588-1fd2-f4b2-81d14b61e1bf	8290	Sevnica
00050000-5588-1fd2-d17f-d4cb8ccf7c10	6210	Sežana
00050000-5588-1fd2-1953-7ce8f463e436	2214	Sladki Vrh
00050000-5588-1fd2-9d66-ffcdd7f438c0	5283	Slap ob Idrijci
00050000-5588-1fd2-dedd-fee628be7a8e	2380	Slovenj Gradec
00050000-5588-1fd2-a8a6-7f741e278872	2310	Slovenska Bistrica
00050000-5588-1fd2-0cac-974727956c75	3210	Slovenske Konjice
00050000-5588-1fd2-576a-849f28cb478f	1216	Smlednik
00050000-5588-1fd2-ddf0-025f3fccbcd9	5232	Soča
00050000-5588-1fd2-3084-bac0e9d01365	1317	Sodražica
00050000-5588-1fd2-ffed-a39fdd51d764	3335	Solčava
00050000-5588-1fd2-55b8-465ec148413d	5250	Solkan
00050000-5588-1fd2-b799-985fd07d789d	4229	Sorica
00050000-5588-1fd2-dae6-63d1563f1424	4225	Sovodenj
00050000-5588-1fd2-273a-d4eac8679964	5281	Spodnja Idrija
00050000-5588-1fd2-0eef-967cfe7b595a	2241	Spodnji Duplek
00050000-5588-1fd2-3c9c-d5ea2c3747ce	9245	Spodnji Ivanjci
00050000-5588-1fd2-4b4c-8f23dc8777f0	2277	Središče ob Dravi
00050000-5588-1fd2-dcfb-51892e02013c	4267	Srednja vas v Bohinju
00050000-5588-1fd2-d934-8b9457612325	8256	Sromlje 
00050000-5588-1fd2-b42c-31a56c0c73ad	5224	Srpenica
00050000-5588-1fd2-3bcc-a814a8667720	1242	Stahovica
00050000-5588-1fd2-8aaa-097c8935e6ba	1332	Stara Cerkev
00050000-5588-1fd2-d41a-8845446d6f88	8342	Stari trg ob Kolpi
00050000-5588-1fd2-e363-6605aeacd190	1386	Stari trg pri Ložu
00050000-5588-1fd2-ef03-143a0c2c4ebc	2205	Starše
00050000-5588-1fd2-d3d1-1b0fa8f80935	2289	Stoperce
00050000-5588-1fd2-1bf7-e90874bfc4d8	8322	Stopiče
00050000-5588-1fd2-b120-77f9024bafbe	3206	Stranice
00050000-5588-1fd2-1d59-4ce62ead8605	8351	Straža
00050000-5588-1fd2-89cf-a71421d352c9	1313	Struge
00050000-5588-1fd2-0131-c5640b3a2f55	8293	Studenec
00050000-5588-1fd2-ea8f-a37f020f531f	8331	Suhor
00050000-5588-1fd2-1d0f-3d5fa5de8f25	2233	Sv. Ana v Slovenskih goricah
00050000-5588-1fd2-f7de-883f2c9996c6	2235	Sv. Trojica v Slovenskih goricah
00050000-5588-1fd2-aa02-40109c7d5e7c	2353	Sveti Duh na Ostrem Vrhu
00050000-5588-1fd2-efb6-2ccc76abcc9b	9244	Sveti Jurij ob Ščavnici
00050000-5588-1fd2-8e83-a5e2f457537f	3264	Sveti Štefan
00050000-5588-1fd2-1de1-ff75b6c49068	2258	Sveti Tomaž
00050000-5588-1fd2-e4a6-c44d1f9179a6	9204	Šalovci
00050000-5588-1fd2-34d0-6b6c014de280	5261	Šempas
00050000-5588-1fd2-574f-e83866574876	5290	Šempeter pri Gorici
00050000-5588-1fd2-0b6d-f1bf85eefb05	3311	Šempeter v Savinjski dolini
00050000-5588-1fd2-582e-34876de768ee	4208	Šenčur
00050000-5588-1fd2-501d-71cd9720d2b2	2212	Šentilj v Slovenskih goricah
00050000-5588-1fd2-224e-39d9673d8796	8297	Šentjanž
00050000-5588-1fd2-6381-9089dcb4c52f	2373	Šentjanž pri Dravogradu
00050000-5588-1fd2-b0ba-1b33006208b5	8310	Šentjernej
00050000-5588-1fd2-b054-ae9b3911aa87	3230	Šentjur
00050000-5588-1fd2-798f-f0050f3f2265	3271	Šentrupert
00050000-5588-1fd2-ac5c-2319447d911f	8232	Šentrupert
00050000-5588-1fd2-ba98-e91002fd4b05	1296	Šentvid pri Stični
00050000-5588-1fd2-806e-cd0b89251b9f	8275	Škocjan
00050000-5588-1fd2-4414-d0bc9c6e5d36	6281	Škofije
00050000-5588-1fd2-baf7-5d454059af11	4220	Škofja Loka
00050000-5588-1fd2-559d-6993794e5562	3211	Škofja vas
00050000-5588-1fd2-cc01-debfb71d9146	1291	Škofljica
00050000-5588-1fd2-1e23-38f8af15ea78	6274	Šmarje
00050000-5588-1fd2-75bf-25c33b0242df	1293	Šmarje - Sap
00050000-5588-1fd2-b1b3-5b55ea898009	3240	Šmarje pri Jelšah
00050000-5588-1fd2-208b-b0b01b138a08	8220	Šmarješke Toplice
00050000-5588-1fd2-384c-4cddcf4c395b	2315	Šmartno na Pohorju
00050000-5588-1fd2-f527-e9b757fecbb5	3341	Šmartno ob Dreti
00050000-5588-1fd2-532f-97c3f68b10e3	3327	Šmartno ob Paki
00050000-5588-1fd2-d18e-023473aa367b	1275	Šmartno pri Litiji
00050000-5588-1fd2-6b5f-7c6552a49811	2383	Šmartno pri Slovenj Gradcu
00050000-5588-1fd2-8418-baa179deb9a1	3201	Šmartno v Rožni dolini
00050000-5588-1fd2-3aba-79b5e0b0dfeb	3325	Šoštanj
00050000-5588-1fd2-c7ba-171c91c45029	6222	Štanjel
00050000-5588-1fd2-cd26-493f702ec966	3220	Štore
00050000-5588-1fd2-c389-72e58ebf1921	3304	Tabor
00050000-5588-1fd2-0ae0-905a2e9b1300	3221	Teharje
00050000-5588-1fd2-6a1f-a524128e3771	9251	Tišina
00050000-5588-1fd2-f00c-f0b582fbdc44	5220	Tolmin
00050000-5588-1fd2-5a34-35216291562a	3326	Topolšica
00050000-5588-1fd2-dbd9-62c662c7d153	2371	Trbonje
00050000-5588-1fd2-c4fb-7f0e1d9d1f09	1420	Trbovlje
00050000-5588-1fd2-cc59-d641c3e4f9a1	8231	Trebelno 
00050000-5588-1fd2-7fb3-505a59c0e9dd	8210	Trebnje
00050000-5588-1fd2-5e48-6b82847409c9	5252	Trnovo pri Gorici
00050000-5588-1fd2-08f9-cad743c49cda	2254	Trnovska vas
00050000-5588-1fd2-fe06-83d3926964f9	1222	Trojane
00050000-5588-1fd2-59af-683c844b473e	1236	Trzin
00050000-5588-1fd2-31e0-d4bc8ee3fbd0	4290	Tržič
00050000-5588-1fd2-cebb-472e52761e9a	8295	Tržišče
00050000-5588-1fd2-4dc6-1a6d816e4a4c	1311	Turjak
00050000-5588-1fd2-c79d-b2411e508f5e	9224	Turnišče
00050000-5588-1fd2-452e-c1f5db4976e3	8323	Uršna sela
00050000-5588-1fd2-1db4-e8d916b0e91b	1252	Vače
00050000-5588-1fd2-1be5-28ac5914e05e	3320	Velenje 
00050000-5588-1fd2-7a44-ebb4cc745176	3322	Velenje - poštni predali
00050000-5588-1fd2-9fa0-7b8f06fd4ae2	8212	Velika Loka
00050000-5588-1fd2-6e45-a0c043762a32	2274	Velika Nedelja
00050000-5588-1fd2-813b-b256a0df8614	9225	Velika Polana
00050000-5588-1fd2-a25b-a324f429b992	1315	Velike Lašče
00050000-5588-1fd2-2e64-e87c43770bf1	8213	Veliki Gaber
00050000-5588-1fd2-2e45-4b9687810a04	9241	Veržej
00050000-5588-1fd2-19f6-78efb7b83f9b	1312	Videm - Dobrepolje
00050000-5588-1fd2-21b2-e364cf8ecd2f	2284	Videm pri Ptuju
00050000-5588-1fd2-b576-4c52f20daaf4	8344	Vinica
00050000-5588-1fd2-3a99-e3d7df40f691	5271	Vipava
00050000-5588-1fd2-0ed7-af94afb6411d	4212	Visoko
00050000-5588-1fd2-5cd3-c4e0848aacd9	1294	Višnja Gora
00050000-5588-1fd2-3b82-bb4cfdaa4968	3205	Vitanje
00050000-5588-1fd2-c471-0442e58f21bb	2255	Vitomarci
00050000-5588-1fd2-7a9a-29bbaac04234	1217	Vodice
00050000-5588-1fd2-3ed8-4f417491a4a1	3212	Vojnik\t
00050000-5588-1fd2-8274-a2717b652fe7	5293	Volčja Draga
00050000-5588-1fd2-c07e-715f99206a73	2232	Voličina
00050000-5588-1fd2-06cf-95feba6eb852	3305	Vransko
00050000-5588-1fd2-4466-cd3df02aa309	6217	Vremski Britof
00050000-5588-1fd2-8553-ae860384c472	1360	Vrhnika
00050000-5588-1fd2-972f-9d591c1d55b2	2365	Vuhred
00050000-5588-1fd2-f93e-f9a3316cedab	2367	Vuzenica
00050000-5588-1fd2-9c93-47297e1aa335	8292	Zabukovje 
00050000-5588-1fd2-58c2-37cd3254b672	1410	Zagorje ob Savi
00050000-5588-1fd2-9206-fe0ce3f6ff03	1303	Zagradec
00050000-5588-1fd2-6cbb-b92eb48eb267	2283	Zavrč
00050000-5588-1fd2-4f3d-1256523cb0d1	8272	Zdole 
00050000-5588-1fd2-76d0-4f6226eaebca	4201	Zgornja Besnica
00050000-5588-1fd2-393e-7a9207164952	2242	Zgornja Korena
00050000-5588-1fd2-858b-132a8b9cd876	2201	Zgornja Kungota
00050000-5588-1fd2-8544-382f6f146431	2316	Zgornja Ložnica
00050000-5588-1fd2-b05e-119e5b455478	2314	Zgornja Polskava
00050000-5588-1fd2-75ab-5d4db2cba7a6	2213	Zgornja Velka
00050000-5588-1fd2-b29f-529a9cf3371a	4247	Zgornje Gorje
00050000-5588-1fd2-f74b-08ec0aa423b0	4206	Zgornje Jezersko
00050000-5588-1fd2-a0f3-fc98f3c0d1b3	2285	Zgornji Leskovec
00050000-5588-1fd2-0b48-4faba4db4d07	1432	Zidani Most
00050000-5588-1fd2-7194-c3ee23fb0e07	3214	Zreče
00050000-5588-1fd2-d023-0faf9d5b77f1	4209	Žabnica
00050000-5588-1fd2-7969-b7d5e5972adf	3310	Žalec
00050000-5588-1fd2-4015-98cd6de08dce	4228	Železniki
00050000-5588-1fd2-033d-fbe52380a202	2287	Žetale
00050000-5588-1fd2-8989-92223fbb9eb7	4226	Žiri
00050000-5588-1fd2-a236-503b51a3c879	4274	Žirovnica
00050000-5588-1fd2-4fff-1e3719d92e84	8360	Žužemberk
\.


--
-- TOC entry 2869 (class 0 OID 7979474)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 7979285)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 7979363)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2871 (class 0 OID 7979486)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2884 (class 0 OID 7979606)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantieme, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2888 (class 0 OID 7979659)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5588-1fd4-02ba-aef413804408	00080000-5588-1fd4-ee05-7bb71016ee9c	0900	AK
00190000-5588-1fd4-8468-59b5bc6406a7	00080000-5588-1fd3-5c08-17379e4771a7	0987	A
00190000-5588-1fd4-88eb-fe3ed60a0772	00080000-5588-1fd3-1f5b-e69f2b45c29f	0989	A
\.


--
-- TOC entry 2895 (class 0 OID 7979795)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2875 (class 0 OID 7979515)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5588-1fd3-6bc3-83fb288be53b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5588-1fd3-db2e-7b3a5e09224a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5588-1fd3-a9b9-8fd6ae6ede2c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5588-1fd3-e18c-24ec3c07fd4b	0004	Mali oder	t	24	Mali oder 
00220000-5588-1fd3-5553-0c3489ff94fb	0005	Komorni oder	t	15	Komorni oder
00220000-5588-1fd3-2612-f4d3e7eedd00	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5588-1fd3-daa2-5a8823bbcb77	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2867 (class 0 OID 7979459)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 7979449)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2887 (class 0 OID 7979648)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2882 (class 0 OID 7979583)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 7979157)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2876 (class 0 OID 7979525)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7979195)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5588-1fd2-b303-43bbf74d5594	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5588-1fd2-f5ab-2ef3e80ef9a3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5588-1fd2-bdb5-f7c514a60bc1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5588-1fd2-9c4d-430de8bca0d3	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5588-1fd2-1b23-4dbed749d93c	planer	Planer dogodkov v koledarju	t
00020000-5588-1fd2-073f-4bfd87c1a631	kadrovska	Kadrovska služba	t
00020000-5588-1fd2-afc2-4a2845ce8ec4	arhivar	Ažuriranje arhivalij	t
00020000-5588-1fd2-94f5-014a5f99b817	igralec	Igralec	t
00020000-5588-1fd2-1315-e01aa1f6c6c1	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5588-1fd4-f474-e2388c994783	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2842 (class 0 OID 7979179)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5588-1fd2-bb19-3995efca6516	00020000-5588-1fd2-bdb5-f7c514a60bc1
00010000-5588-1fd2-e0f1-6138bf118b46	00020000-5588-1fd2-bdb5-f7c514a60bc1
00010000-5588-1fd4-e68e-cce67917b4d3	00020000-5588-1fd4-f474-e2388c994783
\.


--
-- TOC entry 2878 (class 0 OID 7979539)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 7979480)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 7979430)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2899 (class 0 OID 7979832)
-- Dependencies: 236
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5588-1fd3-05bb-59ede61843c2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5588-1fd3-21e2-f4e575020af7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5588-1fd3-ac13-1095e1712560	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5588-1fd3-703d-cdc9e4d2964c	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5588-1fd3-db7a-3c0b915be025	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2898 (class 0 OID 7979824)
-- Dependencies: 235
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5588-1fd3-b4a0-86863ab6d639	00230000-5588-1fd3-703d-cdc9e4d2964c	popa
00240000-5588-1fd3-5205-2969d07eebb0	00230000-5588-1fd3-703d-cdc9e4d2964c	oseba
00240000-5588-1fd3-4c83-8bd33ed236fc	00230000-5588-1fd3-21e2-f4e575020af7	prostor
00240000-5588-1fd3-cde1-51b11d5676a3	00230000-5588-1fd3-703d-cdc9e4d2964c	besedilo
00240000-5588-1fd3-e30d-bd7e6591b40d	00230000-5588-1fd3-703d-cdc9e4d2964c	uprizoritev
00240000-5588-1fd3-3756-43e39c3ad32c	00230000-5588-1fd3-703d-cdc9e4d2964c	funkcija
00240000-5588-1fd3-cd9b-9c9b1b4fda4d	00230000-5588-1fd3-703d-cdc9e4d2964c	tipfunkcije
00240000-5588-1fd3-9733-bd1f4b34c5e4	00230000-5588-1fd3-703d-cdc9e4d2964c	alternacija
00240000-5588-1fd3-41b0-1182942db4dc	00230000-5588-1fd3-05bb-59ede61843c2	pogodba
00240000-5588-1fd3-b41f-94e9a6b4fd9f	00230000-5588-1fd3-703d-cdc9e4d2964c	zaposlitev
\.


--
-- TOC entry 2897 (class 0 OID 7979819)
-- Dependencies: 234
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 7979593)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5588-1fd4-048e-9ef9b152d7e9	000e0000-5588-1fd4-25a2-a9c0dda3189f	00080000-5588-1fd3-24d1-f9ab8c9ff17e	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5588-1fd4-4573-400e7aee7515	000e0000-5588-1fd4-25a2-a9c0dda3189f	00080000-5588-1fd3-24d1-f9ab8c9ff17e	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5588-1fd4-ef32-cdad67077bec	000e0000-5588-1fd4-25a2-a9c0dda3189f	00080000-5588-1fd3-b773-d7653bff6543	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2849 (class 0 OID 7979257)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 7979436)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5588-1fd4-1f8f-9457989da0ec	00180000-5588-1fd4-9e31-2ad38143094b	000c0000-5588-1fd4-a656-8bc80e5684f9	00090000-5588-1fd4-79c0-c6227a9c8c6d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-1fd4-9745-f7d7e0d970f1	00180000-5588-1fd4-9e31-2ad38143094b	000c0000-5588-1fd4-74cd-3a2c6fe70e10	00090000-5588-1fd4-f49b-d103d8bd325c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-1fd4-248c-76927d904e62	00180000-5588-1fd4-9e31-2ad38143094b	000c0000-5588-1fd4-c33b-059517077534	00090000-5588-1fd4-4b6d-1be55049adef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-1fd4-5483-424e222c3150	00180000-5588-1fd4-9e31-2ad38143094b	000c0000-5588-1fd4-f38a-95ddc84b12e9	00090000-5588-1fd4-1f5e-5f33f8a8c2a8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-1fd4-8cd3-f684b80e7933	00180000-5588-1fd4-9e31-2ad38143094b	000c0000-5588-1fd4-03de-e239f6e3f4cb	00090000-5588-1fd4-9d87-c07484b170a4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5588-1fd4-ec86-ba3d6bd54a20	00180000-5588-1fd4-6b51-0872d4150c99	\N	00090000-5588-1fd4-9d87-c07484b170a4	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2886 (class 0 OID 7979637)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5588-1fd3-a7de-e4f56106205b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5588-1fd3-8f56-302bc0f2591a	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5588-1fd3-f7b8-c28d8abbd3f1	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5588-1fd3-4ab8-133032db441a	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5588-1fd3-3371-0e213d77f43d	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5588-1fd3-a163-a5e7b95aca8e	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5588-1fd3-b4eb-713b59266fdc	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5588-1fd3-6fff-399b76adc263	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5588-1fd3-9988-90ef6594b0a3	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5588-1fd3-fb95-8d84e8bedeef	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5588-1fd3-a0ca-d300867d8abd	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5588-1fd3-41f9-7f6e27e6c913	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5588-1fd3-6841-b0d0c317fb83	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5588-1fd3-82c0-b8a7b52599fe	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5588-1fd3-c8af-c09c09542b0d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5588-1fd3-8e4b-da308625ea2f	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2896 (class 0 OID 7979808)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5588-1fd3-db48-561614925a6a	01	Velika predstava	f	1.00	1.00
002b0000-5588-1fd3-822e-e7531de34a56	02	Mala predstava	f	0.50	0.50
002b0000-5588-1fd3-d631-f02da64c9088	03	Mala koprodukcija	t	0.40	1.00
002b0000-5588-1fd3-1460-8f5b04153ded	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5588-1fd3-9e32-a1c442869975	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2854 (class 0 OID 7979320)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 7979166)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5588-1fd2-e0f1-6138bf118b46	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROjfiB1IlyBGE741gKV6dVw1xtQa6nIOa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-1d7a-23c77c9dfc99	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-ea75-b6509dbf9951	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-4541-7eacffb05564	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-8b47-d6d2d1fc0070	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-b967-798baed43399	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-c9f7-b85c8fcdd879	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-420f-39686114675e	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-0c80-9018e1fe93c0	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-36b3-4d87fa0910ea	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5588-1fd4-e68e-cce67917b4d3	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5588-1fd2-bb19-3995efca6516	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2891 (class 0 OID 7979694)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5588-1fd4-0838-e617f6711227	00160000-5588-1fd3-7369-520e1a0c9d52	00150000-5588-1fd3-1f5f-66e56d18cdac	00140000-5588-1fd2-6808-cf6d3f009fc4	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5588-1fd3-5553-0c3489ff94fb
000e0000-5588-1fd4-25a2-a9c0dda3189f	00160000-5588-1fd3-864d-2a6bc6290feb	00150000-5588-1fd3-a346-635179d817b0	00140000-5588-1fd2-4c9e-63685aae7975	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5588-1fd3-2612-f4d3e7eedd00
000e0000-5588-1fd4-89a3-10fed9c7a0d2	\N	00150000-5588-1fd3-a346-635179d817b0	00140000-5588-1fd2-4c9e-63685aae7975	00190000-5588-1fd4-8468-59b5bc6406a7	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5588-1fd3-5553-0c3489ff94fb
000e0000-5588-1fd4-e535-29d74010ff0c	\N	00150000-5588-1fd3-a346-635179d817b0	00140000-5588-1fd2-4c9e-63685aae7975	00190000-5588-1fd4-8468-59b5bc6406a7	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5588-1fd3-5553-0c3489ff94fb
\.


--
-- TOC entry 2859 (class 0 OID 7979382)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5588-1fd4-bfc1-01ec71a78d1b	000e0000-5588-1fd4-25a2-a9c0dda3189f	1	
00200000-5588-1fd4-fcdb-b6624c5a82ee	000e0000-5588-1fd4-25a2-a9c0dda3189f	2	
\.


--
-- TOC entry 2874 (class 0 OID 7979507)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2881 (class 0 OID 7979576)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 7979414)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 7979684)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5588-1fd2-6808-cf6d3f009fc4	01	Drama	drama (SURS 01)
00140000-5588-1fd2-eb94-beb63091a6b5	02	Opera	opera (SURS 02)
00140000-5588-1fd2-de8a-18c00ca0f04b	03	Balet	balet (SURS 03)
00140000-5588-1fd2-5aa4-00b9ee83251e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5588-1fd2-bc43-313d37bf78b8	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5588-1fd2-4c9e-63685aae7975	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5588-1fd2-0a47-fecd52533c9a	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2880 (class 0 OID 7979566)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5588-1fd3-1f48-24dc23f6f99f	01	Opera	opera
00150000-5588-1fd3-4519-371cb08d6616	02	Opereta	opereta
00150000-5588-1fd3-f3a1-2c2a278960af	03	Balet	balet
00150000-5588-1fd3-b005-ee14d9677c91	04	Plesne prireditve	plesne prireditve
00150000-5588-1fd3-0979-165dbb5cddb4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5588-1fd3-1a19-826c6dd945e6	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5588-1fd3-143e-b5433a3a1114	07	Biografska drama	biografska drama
00150000-5588-1fd3-1f5f-66e56d18cdac	08	Komedija	komedija
00150000-5588-1fd3-5377-8ee15ba88d17	09	Črna komedija	črna komedija
00150000-5588-1fd3-c450-7f4858b4768f	10	E-igra	E-igra
00150000-5588-1fd3-a346-635179d817b0	11	Kriminalka	kriminalka
00150000-5588-1fd3-f978-2d0ce2a591e2	12	Musical	musical
\.


--
-- TOC entry 2435 (class 2606 OID 7979220)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 7979741)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 7979731)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 7979636)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 7979404)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 7979429)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 7979346)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 7979790)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 7979562)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 7979380)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 7979423)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 7979360)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 7979472)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 7979499)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 7979318)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 7979229)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2442 (class 2606 OID 7979253)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 7979209)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2426 (class 2606 OID 7979194)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 7979505)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 7979538)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 7979679)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 7979282)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 7979306)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 7979478)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 7979296)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 7979367)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 7979490)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 7979618)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 7979664)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 7979806)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 7979522)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 7979463)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 7979454)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 7979658)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 7979590)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 7979165)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 7979529)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 7979183)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2428 (class 2606 OID 7979203)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 7979547)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 7979485)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 7979435)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 7979841)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 7979829)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 7979823)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 7979603)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 7979262)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 7979445)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 7979647)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 7979818)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 7979331)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 7979178)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 7979710)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 7979389)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 7979513)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 7979581)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 7979418)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 7979692)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 7979574)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 1259 OID 7979411)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2575 (class 1259 OID 7979604)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2576 (class 1259 OID 7979605)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 7979284)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2396 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2398 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2540 (class 1259 OID 7979506)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2534 (class 1259 OID 7979492)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2535 (class 1259 OID 7979491)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 7979390)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2562 (class 1259 OID 7979563)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2563 (class 1259 OID 7979565)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2564 (class 1259 OID 7979564)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2474 (class 1259 OID 7979362)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2475 (class 1259 OID 7979361)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 7979681)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2594 (class 1259 OID 7979682)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2595 (class 1259 OID 7979683)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2410 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2411 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2602 (class 1259 OID 7979715)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2603 (class 1259 OID 7979712)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2604 (class 1259 OID 7979716)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2605 (class 1259 OID 7979714)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2606 (class 1259 OID 7979713)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2464 (class 1259 OID 7979333)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2465 (class 1259 OID 7979332)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2401 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2440 (class 1259 OID 7979256)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2550 (class 1259 OID 7979530)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2504 (class 1259 OID 7979424)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2430 (class 1259 OID 7979210)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2431 (class 1259 OID 7979211)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2555 (class 1259 OID 7979550)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2556 (class 1259 OID 7979549)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2557 (class 1259 OID 7979548)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2478 (class 1259 OID 7979368)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2479 (class 1259 OID 7979370)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2480 (class 1259 OID 7979369)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2635 (class 1259 OID 7979831)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2514 (class 1259 OID 7979458)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2515 (class 1259 OID 7979456)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2516 (class 1259 OID 7979455)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2517 (class 1259 OID 7979457)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2421 (class 1259 OID 7979184)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2422 (class 1259 OID 7979185)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2543 (class 1259 OID 7979514)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2529 (class 1259 OID 7979479)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2571 (class 1259 OID 7979591)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2572 (class 1259 OID 7979592)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2624 (class 1259 OID 7979794)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2625 (class 1259 OID 7979791)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2626 (class 1259 OID 7979792)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2627 (class 1259 OID 7979793)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2453 (class 1259 OID 7979298)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2454 (class 1259 OID 7979297)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2455 (class 1259 OID 7979299)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2579 (class 1259 OID 7979619)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 7979620)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2616 (class 1259 OID 7979745)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 7979747)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2618 (class 1259 OID 7979743)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2619 (class 1259 OID 7979746)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2620 (class 1259 OID 7979744)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2568 (class 1259 OID 7979582)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2520 (class 1259 OID 7979467)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2521 (class 1259 OID 7979466)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2522 (class 1259 OID 7979464)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2523 (class 1259 OID 7979465)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2392 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2612 (class 1259 OID 7979733)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 7979732)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2628 (class 1259 OID 7979807)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2485 (class 1259 OID 7979381)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2436 (class 1259 OID 7979231)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2437 (class 1259 OID 7979230)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2445 (class 1259 OID 7979263)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 7979264)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2509 (class 1259 OID 7979448)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 7979447)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2511 (class 1259 OID 7979446)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2405 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2406 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2492 (class 1259 OID 7979413)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2493 (class 1259 OID 7979409)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2494 (class 1259 OID 7979406)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2495 (class 1259 OID 7979407)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2496 (class 1259 OID 7979405)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2497 (class 1259 OID 7979410)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2498 (class 1259 OID 7979408)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2452 (class 1259 OID 7979283)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 7979347)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 7979349)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2472 (class 1259 OID 7979348)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2473 (class 1259 OID 7979350)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2528 (class 1259 OID 7979473)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2598 (class 1259 OID 7979680)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2607 (class 1259 OID 7979711)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2443 (class 1259 OID 7979254)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2444 (class 1259 OID 7979255)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2565 (class 1259 OID 7979575)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2641 (class 1259 OID 7979842)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2463 (class 1259 OID 7979319)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2638 (class 1259 OID 7979830)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2548 (class 1259 OID 7979524)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2549 (class 1259 OID 7979523)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 7979742)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2395 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2460 (class 1259 OID 7979307)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2599 (class 1259 OID 7979693)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 7979665)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 7979666)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 7979204)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2499 (class 1259 OID 7979412)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2669 (class 2606 OID 7979978)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2666 (class 2606 OID 7979963)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2667 (class 2606 OID 7979968)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2671 (class 2606 OID 7979988)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2665 (class 2606 OID 7979958)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2670 (class 2606 OID 7979983)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2668 (class 2606 OID 7979973)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2700 (class 2606 OID 7980133)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2701 (class 2606 OID 7980138)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2652 (class 2606 OID 7979893)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2688 (class 2606 OID 7980073)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2687 (class 2606 OID 7980068)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2686 (class 2606 OID 7980063)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2664 (class 2606 OID 7979953)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2694 (class 2606 OID 7980103)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2696 (class 2606 OID 7980113)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2695 (class 2606 OID 7980108)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2659 (class 2606 OID 7979928)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 7979923)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2684 (class 2606 OID 7980053)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2705 (class 2606 OID 7980158)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2706 (class 2606 OID 7980163)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2707 (class 2606 OID 7980168)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2711 (class 2606 OID 7980188)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2708 (class 2606 OID 7980173)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2712 (class 2606 OID 7980193)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2710 (class 2606 OID 7980183)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2709 (class 2606 OID 7980178)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2657 (class 2606 OID 7979918)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2656 (class 2606 OID 7979913)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 7979878)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2648 (class 2606 OID 7979873)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2690 (class 2606 OID 7980083)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2672 (class 2606 OID 7979993)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 7979853)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2645 (class 2606 OID 7979858)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2693 (class 2606 OID 7980098)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2692 (class 2606 OID 7980093)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2691 (class 2606 OID 7980088)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2660 (class 2606 OID 7979933)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 7979943)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2661 (class 2606 OID 7979938)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2725 (class 2606 OID 7980259)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2679 (class 2606 OID 7980028)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2677 (class 2606 OID 7980018)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2676 (class 2606 OID 7980013)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2678 (class 2606 OID 7980023)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2642 (class 2606 OID 7979843)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2643 (class 2606 OID 7979848)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2689 (class 2606 OID 7980078)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2685 (class 2606 OID 7980058)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2698 (class 2606 OID 7980123)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2699 (class 2606 OID 7980128)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2723 (class 2606 OID 7980249)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2720 (class 2606 OID 7980233)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 7980238)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2722 (class 2606 OID 7980244)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2654 (class 2606 OID 7979903)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2653 (class 2606 OID 7979898)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2655 (class 2606 OID 7979908)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2702 (class 2606 OID 7980143)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2703 (class 2606 OID 7980148)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2717 (class 2606 OID 7980218)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2719 (class 2606 OID 7980228)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2715 (class 2606 OID 7980208)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2718 (class 2606 OID 7980223)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2716 (class 2606 OID 7980213)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2697 (class 2606 OID 7980118)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2683 (class 2606 OID 7980048)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2682 (class 2606 OID 7980043)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2680 (class 2606 OID 7980033)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2681 (class 2606 OID 7980038)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2714 (class 2606 OID 7980203)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2713 (class 2606 OID 7980198)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2724 (class 2606 OID 7980254)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2663 (class 2606 OID 7979948)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2704 (class 2606 OID 7980153)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 7979868)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2646 (class 2606 OID 7979863)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2650 (class 2606 OID 7979883)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2651 (class 2606 OID 7979888)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2675 (class 2606 OID 7980008)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2674 (class 2606 OID 7980003)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2673 (class 2606 OID 7979998)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-22 16:46:45 CEST

--
-- PostgreSQL database dump complete
--

