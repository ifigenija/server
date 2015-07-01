--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-01 12:51:21 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 238 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 8709864)
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
-- TOC entry 230 (class 1259 OID 8710382)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
    oseba_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean,
    imapogodbo boolean,
    pomembna boolean
);


--
-- TOC entry 229 (class 1259 OID 8710365)
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
-- TOC entry 222 (class 1259 OID 8710269)
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
-- TOC entry 197 (class 1259 OID 8710043)
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
-- TOC entry 200 (class 1259 OID 8710077)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8710471)
-- Name: drugivir; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drugivir (
    id uuid NOT NULL,
    znesek numeric(15,2) DEFAULT 0::numeric NOT NULL,
    opis character varying(255) NOT NULL,
    mednarodni boolean,
    enotaprograma_id uuid
);


--
-- TOC entry 192 (class 1259 OID 8709986)
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
-- TOC entry 231 (class 1259 OID 8710395)
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
-- TOC entry 216 (class 1259 OID 8710203)
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
-- TOC entry 195 (class 1259 OID 8710023)
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
-- TOC entry 199 (class 1259 OID 8710071)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8710003)
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
-- TOC entry 205 (class 1259 OID 8710120)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8710145)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8709960)
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
-- TOC entry 184 (class 1259 OID 8709873)
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
-- TOC entry 185 (class 1259 OID 8709884)
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
-- TOC entry 180 (class 1259 OID 8709838)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8709857)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8710152)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8710183)
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
-- TOC entry 226 (class 1259 OID 8710315)
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
    vrednostvaj numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    opis text
);


--
-- TOC entry 187 (class 1259 OID 8709917)
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
-- TOC entry 189 (class 1259 OID 8709952)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8710126)
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
-- TOC entry 188 (class 1259 OID 8709937)
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
-- TOC entry 194 (class 1259 OID 8710015)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8710138)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8710258)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    delez numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    maticnikop boolean NOT NULL,
    enotaprograma_id uuid
);


--
-- TOC entry 225 (class 1259 OID 8710307)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8710441)
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
    stpremier integer,
    stponprej integer,
    stponprejvelikih integer,
    stponprejmalih integer,
    stponprejmalihkopr integer,
    stponprejsredkopr integer,
    stponprejvelikihkopr integer,
    vrps1 numeric(12,2) DEFAULT NULL::numeric,
    vrps1do numeric(12,2) DEFAULT NULL::numeric,
    vrps1mat numeric(12,2) DEFAULT NULL::numeric,
    vrps1gostovsz numeric(12,2) DEFAULT NULL::numeric,
    stnekomerc integer,
    stizvponprem integer,
    stizvprej integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stgostovanjslo integer,
    stgostovanjzam integer,
    stgostovanjint integer,
    stobisknekom integer,
    stobisknekommat integer,
    stobisknekomgostslo integer,
    stobisknekomgostzam integer,
    stobisknekomgostint integer,
    avgobiskprired numeric(12,2) DEFAULT NULL::numeric,
    avgzaseddvoran numeric(12,2) DEFAULT NULL::numeric,
    avgcenavstopnice numeric(12,2) DEFAULT NULL::numeric,
    stprodvstopnic integer,
    stkoprodukcij integer,
    stkoprodukcijint integer,
    stkoprodukcijnvo integer,
    stzaposlenih integer,
    stzaposigralcev integer,
    avgstnastopovigr numeric(12,2) DEFAULT NULL::numeric,
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sredstvaint numeric(12,2) DEFAULT NULL::numeric,
    sredstvaavt numeric(12,2) DEFAULT NULL::numeric
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
-- TOC entry 212 (class 1259 OID 8710167)
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
-- TOC entry 204 (class 1259 OID 8710111)
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
-- TOC entry 203 (class 1259 OID 8710101)
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
-- TOC entry 224 (class 1259 OID 8710296)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8710235)
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
-- TOC entry 177 (class 1259 OID 8709809)
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
-- TOC entry 176 (class 1259 OID 8709807)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 213 (class 1259 OID 8710177)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8709847)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8709831)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8710191)
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
-- TOC entry 207 (class 1259 OID 8710132)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8710082)
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
-- TOC entry 237 (class 1259 OID 8710491)
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
-- TOC entry 236 (class 1259 OID 8710483)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8710478)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8710245)
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
-- TOC entry 186 (class 1259 OID 8709909)
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
-- TOC entry 202 (class 1259 OID 8710088)
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
-- TOC entry 223 (class 1259 OID 8710285)
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
-- TOC entry 233 (class 1259 OID 8710460)
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
-- TOC entry 191 (class 1259 OID 8709972)
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
-- TOC entry 178 (class 1259 OID 8709818)
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
-- TOC entry 228 (class 1259 OID 8710342)
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
-- TOC entry 196 (class 1259 OID 8710034)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8710159)
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
-- TOC entry 218 (class 1259 OID 8710228)
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
-- TOC entry 198 (class 1259 OID 8710066)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8710332)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8710218)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8709812)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8709864)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8710382)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5593-c628-abe8-9a5dcf35791b	000d0000-5593-c628-3aba-f62542447bd8	\N	00090000-5593-c628-e4c5-c51e23140564	000b0000-5593-c628-021e-00bb902393fc	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-c628-7412-287dc35acb7b	000d0000-5593-c628-7f75-09a765e63345	\N	00090000-5593-c628-48c6-57c47f923523	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-c628-0967-4d8a9c4b4ebf	000d0000-5593-c628-27b4-ebf3cd004f86	\N	00090000-5593-c628-c66c-2ee5500415e8	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-c628-b53f-d9688090b889	000d0000-5593-c628-fa4c-a68cd96ab4e1	\N	00090000-5593-c628-fc1c-3b605a366cce	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-c628-df07-b9dcad0c5dcd	000d0000-5593-c628-face-8fc183310f64	\N	00090000-5593-c628-6734-0025fa347786	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-c628-b817-c54ecbdc5a23	000d0000-5593-c628-66f6-c18bfd6c1f9e	\N	00090000-5593-c628-48c6-57c47f923523	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8710365)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8710269)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5593-c628-68c0-0b7798602a6c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5593-c628-e37b-4608e80c5b27	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5593-c628-d4d4-36ea0602fc7f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8710043)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5593-c628-8c8f-ece5db914bc6	\N	\N	00200000-5593-c628-1e9c-7a4158f42b3c	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5593-c628-1498-9b2d6bde68f1	\N	\N	00200000-5593-c628-51e9-9c3bbe8f01ac	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5593-c628-6dec-250820df738a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5593-c628-b8b0-69c2aaef88e9	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5593-c628-e314-730ae530a9f2	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8710077)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8710471)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8709986)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5593-c626-1fb0-be960245524a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5593-c626-c5d7-ddc5dfe18b37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5593-c626-c1b8-20fdd8570049	AL	ALB	008	Albania 	Albanija	\N
00040000-5593-c626-f90e-3e9c8d4a0a98	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5593-c626-a491-fefeb9faec00	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5593-c626-d697-268fea54dce8	AD	AND	020	Andorra 	Andora	\N
00040000-5593-c626-ebb2-5fcfb43b4a52	AO	AGO	024	Angola 	Angola	\N
00040000-5593-c626-e28d-c992f1e61050	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5593-c626-d170-090fa6d3a7ee	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5593-c626-5150-20120bd8e504	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-c626-2a9c-dd32d591b062	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5593-c626-f2d9-2d790733285f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5593-c626-e7dc-0a8bd7cbd980	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5593-c626-6882-51c7aa7e020e	AU	AUS	036	Australia 	Avstralija	\N
00040000-5593-c626-9331-b88ee9a108ca	AT	AUT	040	Austria 	Avstrija	\N
00040000-5593-c626-ce28-8a27dbcf101b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5593-c626-ec3b-a2491be6c906	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5593-c626-36ae-91fb0fd09c89	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5593-c626-7b58-52249fcfca14	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5593-c626-98f4-120403426574	BB	BRB	052	Barbados 	Barbados	\N
00040000-5593-c626-27b1-179715f0e80d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5593-c626-1594-b2e77c5f4ff4	BE	BEL	056	Belgium 	Belgija	\N
00040000-5593-c626-a8a2-28345f7ce312	BZ	BLZ	084	Belize 	Belize	\N
00040000-5593-c626-03bf-90e817be7113	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5593-c626-b38d-01d92ddc04c4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5593-c626-f665-ca1d96a75e4c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5593-c626-e5c8-fdaf8603ab60	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5593-c626-7ace-09c23f69412f	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5593-c626-d575-99e545e099ce	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5593-c626-48f0-6b1a3123629e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5593-c626-651f-3967e432dcb0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5593-c626-c89e-d3e603758666	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5593-c626-1f95-8dee271537e8	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5593-c626-9941-8844b923bfa4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5593-c626-9f72-5eba173f6812	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5593-c626-2639-d341506a2c76	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5593-c626-dfac-e6ea15f1caca	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5593-c626-c56c-83e37aa3ffa3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5593-c626-e80e-a33f155324d6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5593-c626-a2b1-ae836acc4873	CA	CAN	124	Canada 	Kanada	\N
00040000-5593-c626-3331-09a392f35290	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5593-c626-944c-8dd0dc71201e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5593-c626-355f-17408a0c7499	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5593-c626-d1d1-e6140548583b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5593-c626-5aee-32437ad227d5	CL	CHL	152	Chile 	Čile	\N
00040000-5593-c626-851b-8a02424e95d7	CN	CHN	156	China 	Kitajska	\N
00040000-5593-c626-f0e5-273392fb8d82	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5593-c626-05f1-1441a121dfd9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5593-c626-7b91-7e8bc2a33c3c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5593-c626-96f4-4cfbb5a3b766	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5593-c626-ab62-007a3dad9e7a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5593-c626-9490-74d280586367	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5593-c626-42b1-49f8d69229cd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5593-c626-e26f-80379838f535	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5593-c626-2b97-d740320bc922	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5593-c626-9a51-b9a94010b14d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5593-c626-7be2-721221099325	CU	CUB	192	Cuba 	Kuba	\N
00040000-5593-c626-a0c3-5b047fdd4428	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5593-c626-e891-02762428b0d4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5593-c626-3a24-366aa670e6c2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5593-c626-f636-2b64ca7cb8b7	DK	DNK	208	Denmark 	Danska	\N
00040000-5593-c626-8c56-6e202290bf29	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5593-c626-af0f-20b202e4d5f7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-c626-1427-26b436aa257f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5593-c626-eb2f-840d86d8621d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5593-c626-233f-c9fe86dc567d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5593-c626-87e4-ad56f2b545a6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5593-c626-81df-fbf262610f46	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5593-c626-f50d-89ddb08a6e4b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5593-c626-8538-815c57898b6a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5593-c626-700a-57e86983e795	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5593-c626-b4ee-58d4ca5f2118	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5593-c626-b4e5-153dfe670aa7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5593-c626-5762-8ca4c5e921de	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5593-c626-1d0f-66054a916b60	FI	FIN	246	Finland 	Finska	\N
00040000-5593-c626-3bca-289512d7995b	FR	FRA	250	France 	Francija	\N
00040000-5593-c626-2370-6cdb18bef559	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5593-c626-8698-22853ab9a664	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5593-c626-bf60-4a663a5b735f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5593-c626-77ca-3052f9d6d0a4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5593-c626-7f1e-077c3bf9ced3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5593-c626-3e1b-5c2fcc675184	GM	GMB	270	Gambia 	Gambija	\N
00040000-5593-c626-4fda-e9aa431fe51e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5593-c626-2f86-5ed47aec4d9f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5593-c626-8cce-f121ea56f987	GH	GHA	288	Ghana 	Gana	\N
00040000-5593-c626-f8e7-72252e425334	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5593-c626-eb41-a8297f2b6f78	GR	GRC	300	Greece 	Grčija	\N
00040000-5593-c626-1afa-6d1f14a55ed0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5593-c626-7f7d-f80656ce0775	GD	GRD	308	Grenada 	Grenada	\N
00040000-5593-c626-bb08-2fda62bcc240	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5593-c626-ee27-bf48b5deeb82	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5593-c626-068e-32e813a9254d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5593-c626-f42e-8bbec07b35f6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5593-c626-5570-f492cca0ccc3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5593-c626-f7f4-307f2a5cfc06	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5593-c626-f98e-853bd7d84e08	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5593-c626-2476-a1cce174197c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5593-c626-f081-53d578ef8649	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5593-c626-9ec5-1ca0fe6afab4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5593-c626-ad60-d61773257ceb	HN	HND	340	Honduras 	Honduras	\N
00040000-5593-c626-12da-0b4d5672415c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5593-c626-b223-46a5f48e80a1	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5593-c626-6df1-266d372bd4e5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5593-c626-a9fb-3d14775832af	IN	IND	356	India 	Indija	\N
00040000-5593-c626-fde8-135d62cfee1d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5593-c626-d900-3541510e9b31	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5593-c626-98e4-5400ddae3486	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5593-c626-4bcc-0815cb622bb0	IE	IRL	372	Ireland 	Irska	\N
00040000-5593-c626-6813-03e96f6a802b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5593-c626-c6d1-402e738f2afd	IL	ISR	376	Israel 	Izrael	\N
00040000-5593-c626-7cac-2035d2cdafd4	IT	ITA	380	Italy 	Italija	\N
00040000-5593-c626-331c-f50733dc7623	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5593-c626-c3b3-f27374de134a	JP	JPN	392	Japan 	Japonska	\N
00040000-5593-c626-c435-1ca7334df3c8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5593-c626-ed18-71bb6c2b8f3a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5593-c626-8833-8b27341aaa91	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5593-c626-2de8-58e72f62ec6b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5593-c626-0958-b97adc6c1f37	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5593-c626-61fb-bf7a857bc8a5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5593-c626-66eb-41c5049c74c2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5593-c626-7f99-f214ba7f25d5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5593-c626-1ef8-163478079eb2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5593-c626-2e59-13a01f213eba	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5593-c626-dd32-90d600c594f1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5593-c626-53ee-c10b65d41116	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5593-c626-2d76-eafb0e81d489	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5593-c626-5bd4-e5bad409226b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5593-c626-cef0-0a718a66c041	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5593-c626-2946-1a6215876f82	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5593-c626-f8df-954262a45ad6	LT	LTU	440	Lithuania 	Litva	\N
00040000-5593-c626-0d9b-8d56934ad2ca	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5593-c626-8b3a-911f20014b4f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5593-c626-361c-93fe1b05655e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5593-c626-5826-32a10b83e734	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5593-c626-2634-924f6ac9b450	MW	MWI	454	Malawi 	Malavi	\N
00040000-5593-c626-10f4-24b59e32e70d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5593-c626-f526-bb4bfd7c8eb4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5593-c626-d448-f3a0c3521516	ML	MLI	466	Mali 	Mali	\N
00040000-5593-c626-e25f-d51802f9144e	MT	MLT	470	Malta 	Malta	\N
00040000-5593-c626-8fea-ea4be0f5c31a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5593-c626-35c6-9fc3c781dc02	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5593-c626-3e9c-eb0557219261	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5593-c626-893a-9355cd6be25b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5593-c626-ea69-e920e2312c82	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5593-c626-c896-3e2e6b23aef1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5593-c626-089b-e8fb0f2cb56d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5593-c626-e9ea-6f1d1b443824	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5593-c626-114b-def7553a388e	MC	MCO	492	Monaco 	Monako	\N
00040000-5593-c626-6ffd-81a0312b490c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5593-c626-c49c-5eff354ca51e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5593-c626-5608-399d812b669c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5593-c626-9890-26b9fc439b53	MA	MAR	504	Morocco 	Maroko	\N
00040000-5593-c626-e35c-ea12760cfe9e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5593-c626-15c9-e3fe0a66e80d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5593-c626-1cab-54eea69490f1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5593-c626-5ab8-0407b1afa5b1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5593-c626-b85e-85aee17e0530	NP	NPL	524	Nepal 	Nepal	\N
00040000-5593-c626-50eb-a2b251d0da93	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5593-c626-eea3-999304983074	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5593-c626-06d8-58971c41634a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5593-c626-79d1-143740782f7d	NE	NER	562	Niger 	Niger 	\N
00040000-5593-c626-5936-49ce02b584cf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5593-c626-3494-ab4dfa1993c2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5593-c626-ac38-5edaff96e8db	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5593-c626-7f76-9df2c18ace01	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5593-c626-2009-bbce4b72a52b	NO	NOR	578	Norway 	Norveška	\N
00040000-5593-c626-7a23-c943863d98c6	OM	OMN	512	Oman 	Oman	\N
00040000-5593-c626-1a90-84d5eb2682c9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5593-c626-9161-102e7d3fdc6d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5593-c626-7346-5e09eac77f20	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5593-c626-5735-2b6bf0436a30	PA	PAN	591	Panama 	Panama	\N
00040000-5593-c626-979e-0ad7d1015147	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5593-c626-fee7-454833bcdc1f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5593-c626-1259-37db4b734cc6	PE	PER	604	Peru 	Peru	\N
00040000-5593-c626-df0e-8d286f237e30	PH	PHL	608	Philippines 	Filipini	\N
00040000-5593-c626-01d3-af68a404543c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5593-c626-3ab9-4172a0d6feea	PL	POL	616	Poland 	Poljska	\N
00040000-5593-c626-461f-444bdcaccd5f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5593-c626-ce23-fc78443742d8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5593-c626-ea1e-a38e3888b360	QA	QAT	634	Qatar 	Katar	\N
00040000-5593-c626-9f5e-5f063f47c6de	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5593-c626-ef1a-e1c2716821a1	RO	ROU	642	Romania 	Romunija	\N
00040000-5593-c626-0457-da024af88000	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5593-c626-5b12-945249f7810e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5593-c626-3cfe-c8738fadb917	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5593-c626-70be-6b7fecca7781	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5593-c626-9af2-eedf70d39112	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5593-c626-5054-95fbfcc0bc4d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5593-c626-50c2-c4588fc5b3ee	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5593-c626-6884-ac1762ddf2d9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5593-c626-35ef-88ff1d97f56b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5593-c626-0449-2eef706a356a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5593-c626-a3ce-19ad85c6ec8f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5593-c626-69ec-63513967f8d5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5593-c626-175d-bb472b7f5997	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5593-c626-898c-07323e533509	SN	SEN	686	Senegal 	Senegal	\N
00040000-5593-c626-2a8d-b0d14a991dd3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5593-c626-ed92-70c3225393fd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5593-c626-8017-805383f240dd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5593-c626-da52-fdb11be92928	SG	SGP	702	Singapore 	Singapur	\N
00040000-5593-c626-1973-afc1fea94111	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5593-c626-6c66-d2f0f0d6c16b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5593-c626-873a-6725d17b5c6b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5593-c626-1d94-e958c26c9fe6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5593-c626-e449-5373adf05a6b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5593-c626-2117-70664d9f15d9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5593-c626-475a-d776ef5eda5d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5593-c626-89e1-f28001bbe80a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5593-c626-5f05-49b8c7b3918d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5593-c626-2b29-67c2608971ae	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5593-c626-8b97-8188ae9d8acb	SD	SDN	729	Sudan 	Sudan	\N
00040000-5593-c626-a79e-b11d8aeee19e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5593-c626-73bf-2f126544dc15	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5593-c626-21f8-ba2bc59bed7a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5593-c626-e5bb-282e8704d6a9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5593-c626-b4c3-135e7a56640c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5593-c626-418a-96fa67651225	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5593-c626-65e3-6dd0d1095dd8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5593-c626-4953-ed1e11b49576	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5593-c626-6ed6-928641074e31	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5593-c626-3b69-85b879f7671c	TH	THA	764	Thailand 	Tajska	\N
00040000-5593-c626-d91c-52cf973078ea	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5593-c626-b36d-0807d73eb33e	TG	TGO	768	Togo 	Togo	\N
00040000-5593-c626-8da5-600249c02914	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5593-c626-853f-b709e18ca62c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5593-c626-3eeb-3762426b3dab	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5593-c626-24fe-50d680bd51a0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5593-c626-55fb-f9a979f7ea48	TR	TUR	792	Turkey 	Turčija	\N
00040000-5593-c626-5cec-aa747430f76f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5593-c626-7911-b1ec229ee4b1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-c626-22a9-451ca0d1089a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5593-c626-d8a3-117ac9c38c17	UG	UGA	800	Uganda 	Uganda	\N
00040000-5593-c626-f277-6443f7763576	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5593-c626-d0d3-09baf1f33716	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5593-c626-c8d0-89feecf487c2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5593-c626-63e7-86550403b3b2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5593-c626-02e1-ac1d1a97f2d5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5593-c626-3d6d-d945671d880a	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5593-c626-22b9-96c8f5d1d6e0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5593-c626-7acd-28425893ee25	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5593-c626-f74c-f23d6ce32a18	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5593-c626-97af-18cbc262ea96	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5593-c626-97e6-cadb295171df	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-c626-b509-c08077a4b8e7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5593-c626-e270-77b6fa8c61d9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5593-c626-a6ae-4821c192c8b1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5593-c626-fbbc-a0cab1a27a9f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5593-c626-1cda-a11b428b6e13	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5593-c626-6e25-7413c9620136	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8710395)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5593-c628-74ba-aafe8d1e0d79	000e0000-5593-c628-b131-0c417e2a2776	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5593-c627-f2f1-38ee5ae8449b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5593-c628-7121-866fa8a6ee79	000e0000-5593-c628-dfd7-08c21b01c676	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5593-c627-8e26-e848af4ff6b9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8710203)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5593-c628-1700-bbe4193666b4	000e0000-5593-c628-dfd7-08c21b01c676	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5593-c627-a351-a6bcf3dd3332
000d0000-5593-c628-3aba-f62542447bd8	000e0000-5593-c628-dfd7-08c21b01c676	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-c627-a351-a6bcf3dd3332
000d0000-5593-c628-7f75-09a765e63345	000e0000-5593-c628-dfd7-08c21b01c676	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5593-c627-de9e-41f08f974164
000d0000-5593-c628-27b4-ebf3cd004f86	000e0000-5593-c628-dfd7-08c21b01c676	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5593-c627-40f6-b1d2e705eb2f
000d0000-5593-c628-fa4c-a68cd96ab4e1	000e0000-5593-c628-dfd7-08c21b01c676	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5593-c627-40f6-b1d2e705eb2f
000d0000-5593-c628-face-8fc183310f64	000e0000-5593-c628-dfd7-08c21b01c676	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5593-c627-40f6-b1d2e705eb2f
000d0000-5593-c628-66f6-c18bfd6c1f9e	000e0000-5593-c628-dfd7-08c21b01c676	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-c627-a351-a6bcf3dd3332
\.


--
-- TOC entry 2866 (class 0 OID 8710023)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8710071)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8710003)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5593-c628-2a3f-455787ea4d8b	00080000-5593-c628-abc0-0b7bb6c69003	00090000-5593-c628-e4c5-c51e23140564	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8710120)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8710145)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8709960)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5593-c627-ed16-a421d69851f7	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5593-c627-dd94-8891a73979cf	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5593-c627-b2ce-769d909724e2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5593-c627-d834-d5b9b845397b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5593-c627-a7c2-ba92604df4e6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5593-c627-3c81-8c7e48b4a856	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5593-c627-a283-f1b16fa4bc6a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5593-c627-99ef-00f1508165a6	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-c627-026f-de15385282aa	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-c627-7ce2-eb6f74316471	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5593-c627-cea2-12d3b6cc15c5	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5593-c627-4482-7b84318bea76	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5593-c627-b582-b6e256a7c219	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5593-c628-f0d9-4416688654f7	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5593-c628-2e94-eb63b61b4da2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5593-c628-046b-777ad72a9922	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5593-c628-4c50-e2c9cd8be943	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5593-c628-bf9c-fab99845925a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5593-c628-a331-c9a6339524b4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8709873)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5593-c628-4943-4b80358a0371	00000000-5593-c628-2e94-eb63b61b4da2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5593-c628-1a0b-894923ddd016	00000000-5593-c628-2e94-eb63b61b4da2	00010000-5593-c627-243a-191507316da2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5593-c628-2a9a-e122551feb8d	00000000-5593-c628-046b-777ad72a9922	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8709884)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5593-c628-53c1-d7153006a4bb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5593-c628-fc1c-3b605a366cce	00010000-5593-c628-1189-3340d1424fb4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5593-c628-c66c-2ee5500415e8	00010000-5593-c628-7918-3ae25adf9dc7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5593-c628-c823-7c13a743ead0	00010000-5593-c628-744d-4b9d5b15b4bf	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5593-c628-a327-67d52c3948e6	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5593-c628-0d69-95b2b133a379	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5593-c628-e10b-bd2af837884b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5593-c628-bf18-a3b701a50986	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5593-c628-e4c5-c51e23140564	00010000-5593-c628-f275-4776e2ea9e13	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5593-c628-48c6-57c47f923523	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5593-c628-5e96-e2226d7ecd3a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5593-c628-6734-0025fa347786	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5593-c628-823b-69dbd766468b	00010000-5593-c628-60c8-c329645a6e57	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8709838)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5593-c626-8f73-f47179b19825	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5593-c626-a670-a01012af3131	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5593-c626-3678-64edf383b3c5	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5593-c626-3b78-4f14fd729b03	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5593-c626-fbbc-70f9a6b10f36	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5593-c626-5c81-0b92584ad640	Abonma-read	Abonma - branje	f
00030000-5593-c626-8369-1d3c7d6bdcd9	Abonma-write	Abonma - spreminjanje	f
00030000-5593-c626-7d88-43b4e6141f04	Alternacija-read	Alternacija - branje	f
00030000-5593-c626-985a-17bf039efa1b	Alternacija-write	Alternacija - spreminjanje	f
00030000-5593-c626-615a-95943af3f1a2	Arhivalija-read	Arhivalija - branje	f
00030000-5593-c626-9bce-6aba2ed6ede1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5593-c626-9644-45317230d50d	Besedilo-read	Besedilo - branje	f
00030000-5593-c626-5505-28982f64bc2f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5593-c626-a8e7-7850f2692a7e	DogodekIzven-read	DogodekIzven - branje	f
00030000-5593-c626-3d59-65fd5be65838	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5593-c626-6ba3-fede0e15d880	Dogodek-read	Dogodek - branje	f
00030000-5593-c626-f15b-2fc649bbad64	Dogodek-write	Dogodek - spreminjanje	f
00030000-5593-c626-cbd9-2c2a2ac796b6	DrugiVir-read	DrugiVir - branje	f
00030000-5593-c626-350a-fc25c5cb03f7	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5593-c626-77f5-85cc4a799b6e	Drzava-read	Drzava - branje	f
00030000-5593-c626-1092-4142e0fb6563	Drzava-write	Drzava - spreminjanje	f
00030000-5593-c626-49f7-2db5067857c9	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5593-c626-4846-d0875cecabe8	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5593-c626-5e31-badca328d1fc	Funkcija-read	Funkcija - branje	f
00030000-5593-c626-3487-2afcb411e788	Funkcija-write	Funkcija - spreminjanje	f
00030000-5593-c626-b512-a73069128a8c	Gostovanje-read	Gostovanje - branje	f
00030000-5593-c626-ec15-54484f453969	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5593-c626-a2e4-ec990b958a70	Gostujoca-read	Gostujoca - branje	f
00030000-5593-c626-ec3f-94d3df7394e8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5593-c626-2283-bac8606377b9	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5593-c626-b952-afc146e534b0	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5593-c626-8140-56344a2b0a78	Kupec-read	Kupec - branje	f
00030000-5593-c626-825a-c6e4ba4ddabf	Kupec-write	Kupec - spreminjanje	f
00030000-5593-c626-6544-9f43c310b231	NacinPlacina-read	NacinPlacina - branje	f
00030000-5593-c626-bb96-1fc13e018598	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5593-c626-897b-1e4ae7764ff9	Option-read	Option - branje	f
00030000-5593-c626-6901-9deef2612f60	Option-write	Option - spreminjanje	f
00030000-5593-c626-8405-82ecad7a6883	OptionValue-read	OptionValue - branje	f
00030000-5593-c626-9965-6cc8631c257e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5593-c626-8387-dd4e3ae37f53	Oseba-read	Oseba - branje	f
00030000-5593-c626-da16-7844221d5b98	Oseba-write	Oseba - spreminjanje	f
00030000-5593-c626-e919-14d8e14fae04	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5593-c626-286d-9e4f3370c4dc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5593-c626-179c-2a2d2b41ee4c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5593-c626-836e-7b9d8077d734	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5593-c626-1666-0a4a0ad1bea1	Pogodba-read	Pogodba - branje	f
00030000-5593-c626-c630-5e79ca7a5f71	Pogodba-write	Pogodba - spreminjanje	f
00030000-5593-c626-f927-791f5a433881	Popa-read	Popa - branje	f
00030000-5593-c626-bce8-d96318263132	Popa-write	Popa - spreminjanje	f
00030000-5593-c626-3888-76ec62d944bc	Posta-read	Posta - branje	f
00030000-5593-c626-a154-183cdf119ad1	Posta-write	Posta - spreminjanje	f
00030000-5593-c626-e021-f2a23bfdbbcf	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5593-c626-5a43-27617603f191	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5593-c626-b6f6-a15d16febdf8	PostniNaslov-read	PostniNaslov - branje	f
00030000-5593-c626-5d9b-dcc6bf0cbcfc	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5593-c626-ff47-4da6080f9083	Predstava-read	Predstava - branje	f
00030000-5593-c626-a596-c433e2bc7dd7	Predstava-write	Predstava - spreminjanje	f
00030000-5593-c626-10f7-5657402d23f6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5593-c626-8296-346161f4ce9f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5593-c626-aa93-5556f07bd02d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5593-c626-1ecd-abf68f778e45	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5593-c626-203d-efa56856dc52	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5593-c626-5027-d30e43fc0222	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5593-c626-2ca5-1e80ee77db54	ProgramDela-read	ProgramDela - branje	f
00030000-5593-c626-0f0a-a598f89ee140	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5593-c626-8293-cfe69642936d	ProgramFestival-read	ProgramFestival - branje	f
00030000-5593-c626-ad69-c762d8b79210	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5593-c626-02a7-a8b043c044b2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5593-c626-ba44-58600a4f9ea2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5593-c626-0730-07986325bd56	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5593-c626-93d4-80d683b5ade3	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5593-c626-b863-4475090e8d65	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5593-c626-0497-2a962f7053cb	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5593-c626-f5d2-59608c3ae2d7	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5593-c626-8f15-f3dd975f8834	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5593-c626-ead3-b5f02b141593	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5593-c626-664f-1354cf4a3b0f	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5593-c626-b539-a54ce9aad052	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5593-c626-3799-e46608519129	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5593-c626-a9db-258fb9a4c2fa	ProgramRazno-read	ProgramRazno - branje	f
00030000-5593-c626-b246-770ac39cb17c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5593-c626-09f2-37225d16d2ce	Prostor-read	Prostor - branje	f
00030000-5593-c626-2669-b73a2feb0708	Prostor-write	Prostor - spreminjanje	f
00030000-5593-c626-8730-9e3b9f922a42	Racun-read	Racun - branje	f
00030000-5593-c626-a82c-4c727c7bfb7b	Racun-write	Racun - spreminjanje	f
00030000-5593-c626-d972-36818e5b27cc	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5593-c626-57b7-12cee11bca00	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5593-c626-4165-d67e90087ddb	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5593-c626-c0b1-1fdf2c16a49b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5593-c626-aaf3-a099ef7fafd4	Rekvizit-read	Rekvizit - branje	f
00030000-5593-c626-8b80-0778c39997b0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5593-c626-5ee5-0724d577a560	Revizija-read	Revizija - branje	f
00030000-5593-c626-41d3-d6e50200819e	Revizija-write	Revizija - spreminjanje	f
00030000-5593-c626-4af3-2e13f00685e8	Rezervacija-read	Rezervacija - branje	f
00030000-5593-c626-24d2-b0d9ffbd407a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5593-c626-bcf3-180b08e338af	SedezniRed-read	SedezniRed - branje	f
00030000-5593-c626-660d-fd26967df664	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5593-c626-f4bf-f427038c9644	Sedez-read	Sedez - branje	f
00030000-5593-c626-bdab-ff5e978614bd	Sedez-write	Sedez - spreminjanje	f
00030000-5593-c626-5549-ce52b4e6e989	Sezona-read	Sezona - branje	f
00030000-5593-c626-a058-34a50d434236	Sezona-write	Sezona - spreminjanje	f
00030000-5593-c626-5646-838e6cb9f5a6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5593-c626-67e9-d27d6f9b11a5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5593-c626-99ed-8ebd57b00275	Stevilcenje-read	Stevilcenje - branje	f
00030000-5593-c626-2b3c-d70baa628370	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5593-c626-f9e8-64da1a76afdb	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5593-c626-8420-bbf8c5c2798f	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5593-c626-45d8-428d6767014e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5593-c626-3583-9572bcb2d931	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5593-c626-4773-dbc22d703fcf	Telefonska-read	Telefonska - branje	f
00030000-5593-c626-bfdc-b87845bb3a00	Telefonska-write	Telefonska - spreminjanje	f
00030000-5593-c626-81ac-87b8962e4d8e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5593-c626-9557-fdaaecb25ee5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5593-c626-866f-4530cd1697cd	TipFunkcije-read	TipFunkcije - branje	f
00030000-5593-c626-10e9-74638bc5f038	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5593-c626-a284-a1027268018a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5593-c626-672b-c193905f96a1	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5593-c626-09ed-06d251ca45c5	Trr-read	Trr - branje	f
00030000-5593-c626-0410-e5bf164019cc	Trr-write	Trr - spreminjanje	f
00030000-5593-c626-56a2-dd9740b4e68b	Uprizoritev-read	Uprizoritev - branje	f
00030000-5593-c626-2580-1181dd546d63	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5593-c626-59b1-287c9c684583	Vaja-read	Vaja - branje	f
00030000-5593-c626-3b1c-0393d9dcea19	Vaja-write	Vaja - spreminjanje	f
00030000-5593-c626-5d96-547701f03aa2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5593-c626-86dc-6c36833904c2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5593-c626-74fc-762e2a9db964	Zaposlitev-read	Zaposlitev - branje	f
00030000-5593-c626-e424-3991b7c0f685	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5593-c626-1df4-a8ea02b0b3b3	Zasedenost-read	Zasedenost - branje	f
00030000-5593-c626-8e89-36e6aa08af49	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5593-c626-7b64-3cac7d49708d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5593-c626-82db-2f224e28f7f8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5593-c626-30a1-c7c80eba2c88	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5593-c626-80ef-3fa797876875	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8709857)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5593-c626-bc6b-af79b36993e6	00030000-5593-c626-a670-a01012af3131
00020000-5593-c626-f770-af64935a1700	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-8369-1d3c7d6bdcd9
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-7d88-43b4e6141f04
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-985a-17bf039efa1b
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-3b78-4f14fd729b03
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-f15b-2fc649bbad64
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-1092-4142e0fb6563
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-5e31-badca328d1fc
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-3487-2afcb411e788
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-ec15-54484f453969
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-ec3f-94d3df7394e8
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-2283-bac8606377b9
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-b952-afc146e534b0
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-8387-dd4e3ae37f53
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-da16-7844221d5b98
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-f927-791f5a433881
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-bce8-d96318263132
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-a154-183cdf119ad1
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-b6f6-a15d16febdf8
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-5d9b-dcc6bf0cbcfc
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-a596-c433e2bc7dd7
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-203d-efa56856dc52
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-5027-d30e43fc0222
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-2669-b73a2feb0708
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-c0b1-1fdf2c16a49b
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-8b80-0778c39997b0
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-a058-34a50d434236
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-866f-4530cd1697cd
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-56a2-dd9740b4e68b
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-2580-1181dd546d63
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-59b1-287c9c684583
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-3b1c-0393d9dcea19
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-1df4-a8ea02b0b3b3
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-8e89-36e6aa08af49
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c626-385c-226024fba6b4	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-2283-bac8606377b9
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-b952-afc146e534b0
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-8387-dd4e3ae37f53
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-da16-7844221d5b98
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-f927-791f5a433881
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-b6f6-a15d16febdf8
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-5d9b-dcc6bf0cbcfc
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-4773-dbc22d703fcf
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-bfdc-b87845bb3a00
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-09ed-06d251ca45c5
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-0410-e5bf164019cc
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-74fc-762e2a9db964
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-e424-3991b7c0f685
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c626-227b-34018445f246	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-7d88-43b4e6141f04
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-9bce-6aba2ed6ede1
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-9644-45317230d50d
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-a8e7-7850f2692a7e
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-5e31-badca328d1fc
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-2283-bac8606377b9
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-8387-dd4e3ae37f53
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-f927-791f5a433881
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-203d-efa56856dc52
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-866f-4530cd1697cd
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-59b1-287c9c684583
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-1df4-a8ea02b0b3b3
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c626-ab74-c0e49c86beb4	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-8369-1d3c7d6bdcd9
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-985a-17bf039efa1b
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-f927-791f5a433881
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-866f-4530cd1697cd
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c627-b143-4c745656d8ca	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-f927-791f5a433881
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-81ac-87b8962e4d8e
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-3678-64edf383b3c5
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-866f-4530cd1697cd
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c627-abc4-560cf884f150	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8f73-f47179b19825
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a670-a01012af3131
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3678-64edf383b3c5
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3b78-4f14fd729b03
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-fbbc-70f9a6b10f36
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5c81-0b92584ad640
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8369-1d3c7d6bdcd9
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-7d88-43b4e6141f04
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-985a-17bf039efa1b
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-615a-95943af3f1a2
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-9bce-6aba2ed6ede1
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-9644-45317230d50d
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5505-28982f64bc2f
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a8e7-7850f2692a7e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3d59-65fd5be65838
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-6ba3-fede0e15d880
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-f15b-2fc649bbad64
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-77f5-85cc4a799b6e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-1092-4142e0fb6563
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-49f7-2db5067857c9
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-4846-d0875cecabe8
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5e31-badca328d1fc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3487-2afcb411e788
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b512-a73069128a8c
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ec15-54484f453969
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a2e4-ec990b958a70
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ec3f-94d3df7394e8
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-2283-bac8606377b9
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b952-afc146e534b0
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8140-56344a2b0a78
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-825a-c6e4ba4ddabf
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-6544-9f43c310b231
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-bb96-1fc13e018598
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-897b-1e4ae7764ff9
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-6901-9deef2612f60
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8405-82ecad7a6883
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-9965-6cc8631c257e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8387-dd4e3ae37f53
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-da16-7844221d5b98
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-e919-14d8e14fae04
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-286d-9e4f3370c4dc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-179c-2a2d2b41ee4c
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-836e-7b9d8077d734
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-1666-0a4a0ad1bea1
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-c630-5e79ca7a5f71
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-f927-791f5a433881
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-bce8-d96318263132
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3888-76ec62d944bc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a154-183cdf119ad1
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-e021-f2a23bfdbbcf
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5a43-27617603f191
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b6f6-a15d16febdf8
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5d9b-dcc6bf0cbcfc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ff47-4da6080f9083
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a596-c433e2bc7dd7
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-10f7-5657402d23f6
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8296-346161f4ce9f
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-aa93-5556f07bd02d
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-1ecd-abf68f778e45
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-203d-efa56856dc52
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5027-d30e43fc0222
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-2ca5-1e80ee77db54
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-0f0a-a598f89ee140
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8293-cfe69642936d
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ad69-c762d8b79210
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-02a7-a8b043c044b2
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ba44-58600a4f9ea2
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-0730-07986325bd56
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-93d4-80d683b5ade3
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b863-4475090e8d65
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-0497-2a962f7053cb
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-f5d2-59608c3ae2d7
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8f15-f3dd975f8834
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-ead3-b5f02b141593
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-664f-1354cf4a3b0f
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b539-a54ce9aad052
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3799-e46608519129
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a9db-258fb9a4c2fa
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-b246-770ac39cb17c
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-09f2-37225d16d2ce
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-2669-b73a2feb0708
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8730-9e3b9f922a42
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a82c-4c727c7bfb7b
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-d972-36818e5b27cc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-57b7-12cee11bca00
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-4165-d67e90087ddb
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-c0b1-1fdf2c16a49b
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-aaf3-a099ef7fafd4
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8b80-0778c39997b0
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5ee5-0724d577a560
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-41d3-d6e50200819e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-4af3-2e13f00685e8
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-24d2-b0d9ffbd407a
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-bcf3-180b08e338af
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-660d-fd26967df664
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-f4bf-f427038c9644
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-bdab-ff5e978614bd
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5549-ce52b4e6e989
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a058-34a50d434236
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5646-838e6cb9f5a6
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-67e9-d27d6f9b11a5
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-99ed-8ebd57b00275
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-2b3c-d70baa628370
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-f9e8-64da1a76afdb
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8420-bbf8c5c2798f
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-45d8-428d6767014e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3583-9572bcb2d931
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-4773-dbc22d703fcf
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-bfdc-b87845bb3a00
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-81ac-87b8962e4d8e
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-9557-fdaaecb25ee5
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-866f-4530cd1697cd
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-10e9-74638bc5f038
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-a284-a1027268018a
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-672b-c193905f96a1
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-09ed-06d251ca45c5
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-0410-e5bf164019cc
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-56a2-dd9740b4e68b
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-2580-1181dd546d63
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-59b1-287c9c684583
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-3b1c-0393d9dcea19
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-5d96-547701f03aa2
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-86dc-6c36833904c2
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-74fc-762e2a9db964
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-e424-3991b7c0f685
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-1df4-a8ea02b0b3b3
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-8e89-36e6aa08af49
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-7b64-3cac7d49708d
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-82db-2f224e28f7f8
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-30a1-c7c80eba2c88
00020000-5593-c628-a3ea-d7e81082702f	00030000-5593-c626-80ef-3fa797876875
\.


--
-- TOC entry 2881 (class 0 OID 8710152)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8710183)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8710315)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5593-c628-021e-00bb902393fc	00090000-5593-c628-53c1-d7153006a4bb	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8709917)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5593-c628-abc0-0b7bb6c69003	00040000-5593-c626-1fb0-be960245524a	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-c628-671c-f373de8105e6	00040000-5593-c626-1fb0-be960245524a	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-c628-219d-98b378c62e59	00040000-5593-c626-1fb0-be960245524a	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-c628-6c1f-f098da724fa7	00040000-5593-c626-1fb0-be960245524a	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-c628-5d70-06eae4bd0ca8	00040000-5593-c626-1fb0-be960245524a	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-c628-5e2b-a8f7b27c3fe2	00040000-5593-c626-873a-6725d17b5c6b	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8709952)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5593-c627-1ec1-b4d5c7d41d26	8341	Adlešiči
00050000-5593-c627-2c97-ef4f78ab988a	5270	Ajdovščina
00050000-5593-c627-7212-0e4e4803260f	6280	Ankaran/Ancarano
00050000-5593-c627-6866-61d4d74fc6a9	9253	Apače
00050000-5593-c627-def7-297b5e0a5c8b	8253	Artiče
00050000-5593-c627-8410-55f416e4e910	4275	Begunje na Gorenjskem
00050000-5593-c627-b38a-bd2f45e9eeee	1382	Begunje pri Cerknici
00050000-5593-c627-c4d0-1cbf70333944	9231	Beltinci
00050000-5593-c627-ef29-6a7d6c3b64e4	2234	Benedikt
00050000-5593-c627-87d1-2cf1ff6c7185	2345	Bistrica ob Dravi
00050000-5593-c627-9255-b4a00481b6f5	3256	Bistrica ob Sotli
00050000-5593-c627-fb44-1e2972192358	8259	Bizeljsko
00050000-5593-c627-331e-684180228216	1223	Blagovica
00050000-5593-c627-0a9b-12256b04b1b0	8283	Blanca
00050000-5593-c627-be24-a99a8fd92ea4	4260	Bled
00050000-5593-c627-51bd-f679088d966b	4273	Blejska Dobrava
00050000-5593-c627-7d59-39e43c6957dc	9265	Bodonci
00050000-5593-c627-3963-6d0419c4d4b9	9222	Bogojina
00050000-5593-c627-a3b2-06fb4ea250d4	4263	Bohinjska Bela
00050000-5593-c627-6ed8-53c48c459d4b	4264	Bohinjska Bistrica
00050000-5593-c627-0dcc-71f9a5c37f89	4265	Bohinjsko jezero
00050000-5593-c627-011c-4215590e3560	1353	Borovnica
00050000-5593-c627-3cfd-6389f91268c8	8294	Boštanj
00050000-5593-c627-548e-bf81665ff85c	5230	Bovec
00050000-5593-c627-ad94-1387df74d083	5295	Branik
00050000-5593-c627-4c70-452316511aa8	3314	Braslovče
00050000-5593-c627-a697-db7b4b16fdce	5223	Breginj
00050000-5593-c627-2d6a-5eb6dc850f6c	8280	Brestanica
00050000-5593-c627-af25-b636865460a8	2354	Bresternica
00050000-5593-c627-e9c2-736851619efa	4243	Brezje
00050000-5593-c627-3c30-6b8e348165ee	1351	Brezovica pri Ljubljani
00050000-5593-c627-0bea-23df487346d8	8250	Brežice
00050000-5593-c627-8999-257cbf473374	4210	Brnik - Aerodrom
00050000-5593-c627-5110-ccbe14c444a3	8321	Brusnice
00050000-5593-c627-bade-394b26144a70	3255	Buče
00050000-5593-c627-9424-b3a33cdcee1f	8276	Bučka 
00050000-5593-c627-752c-15ff70db9023	9261	Cankova
00050000-5593-c627-6b2f-c6247cb4ee68	3000	Celje 
00050000-5593-c627-a089-7e0c38e74f6c	3001	Celje - poštni predali
00050000-5593-c627-c4c5-f84913dcf5d0	4207	Cerklje na Gorenjskem
00050000-5593-c627-2af5-164a406d5b6f	8263	Cerklje ob Krki
00050000-5593-c627-8a6c-7af1e52b761d	1380	Cerknica
00050000-5593-c627-918c-585f7dda824d	5282	Cerkno
00050000-5593-c627-64bc-103759fb393d	2236	Cerkvenjak
00050000-5593-c627-8759-326dc748520e	2215	Ceršak
00050000-5593-c627-d9de-03393f605187	2326	Cirkovce
00050000-5593-c627-fd1e-364d059dfec0	2282	Cirkulane
00050000-5593-c627-07f0-af9d5083b5b1	5273	Col
00050000-5593-c627-e040-551cc75e9712	8251	Čatež ob Savi
00050000-5593-c627-e9ac-852249db0dc8	1413	Čemšenik
00050000-5593-c627-ff5d-598822c20163	5253	Čepovan
00050000-5593-c627-72ae-666428d8c0d2	9232	Črenšovci
00050000-5593-c627-cf68-4cd755fa9731	2393	Črna na Koroškem
00050000-5593-c627-7abc-57c6019e491f	6275	Črni Kal
00050000-5593-c627-5097-33bf303b0150	5274	Črni Vrh nad Idrijo
00050000-5593-c627-34a8-e81b0c566b67	5262	Črniče
00050000-5593-c627-3c4c-4de8ae3c1536	8340	Črnomelj
00050000-5593-c627-04c7-636d9ff08d41	6271	Dekani
00050000-5593-c627-23c6-dba0b28ebc29	5210	Deskle
00050000-5593-c627-9b28-34225c041400	2253	Destrnik
00050000-5593-c627-a9fa-cf1ea6f0c020	6215	Divača
00050000-5593-c627-be16-a9ab8b8e9c3f	1233	Dob
00050000-5593-c627-7596-b1fc7832cec6	3224	Dobje pri Planini
00050000-5593-c627-b086-bf0a2440c5c7	8257	Dobova
00050000-5593-c627-03c2-c736e242e032	1423	Dobovec
00050000-5593-c627-5f70-f9ad1c95671a	5263	Dobravlje
00050000-5593-c627-8141-43c320ac2ed3	3204	Dobrna
00050000-5593-c627-3d07-6093c55396e5	8211	Dobrnič
00050000-5593-c627-161e-39e41f1ec295	1356	Dobrova
00050000-5593-c627-da85-2d3bc9029946	9223	Dobrovnik/Dobronak 
00050000-5593-c627-cc18-c5c7feed4378	5212	Dobrovo v Brdih
00050000-5593-c627-29ce-14e8e4b77cd3	1431	Dol pri Hrastniku
00050000-5593-c627-c201-6a92e4a033f6	1262	Dol pri Ljubljani
00050000-5593-c627-8223-85e7223eee44	1273	Dole pri Litiji
00050000-5593-c627-7be7-71add5cbc559	1331	Dolenja vas
00050000-5593-c627-29a9-57ae2685ec8d	8350	Dolenjske Toplice
00050000-5593-c627-a1e5-3ee3b62b589b	1230	Domžale
00050000-5593-c627-18bf-b9ade3d2d1a6	2252	Dornava
00050000-5593-c627-d5ea-148e4e772fde	5294	Dornberk
00050000-5593-c627-4b9e-3f9fe3ad7194	1319	Draga
00050000-5593-c627-06e4-d0a9afa5eea1	8343	Dragatuš
00050000-5593-c627-c625-df9d7a95a642	3222	Dramlje
00050000-5593-c627-d73a-9b958934ae50	2370	Dravograd
00050000-5593-c627-3e1b-24ae0f797a9b	4203	Duplje
00050000-5593-c627-dd87-e47592e0cc6d	6221	Dutovlje
00050000-5593-c627-86c8-b50d919332f8	8361	Dvor
00050000-5593-c627-0460-5831b0cafcbe	2343	Fala
00050000-5593-c627-6c5e-80843ff92408	9208	Fokovci
00050000-5593-c627-b02f-f434d485a079	2313	Fram
00050000-5593-c627-17eb-f991376b346a	3213	Frankolovo
00050000-5593-c627-08de-c4dc54850ef3	1274	Gabrovka
00050000-5593-c627-0525-a4319bd38559	8254	Globoko
00050000-5593-c627-218f-048e9b618180	5275	Godovič
00050000-5593-c627-f73e-bcfb1b9f0c9e	4204	Golnik
00050000-5593-c627-6eca-3e35f8d0a3d2	3303	Gomilsko
00050000-5593-c627-aaaa-345ec90dc3ab	4224	Gorenja vas
00050000-5593-c627-e7d5-8bee1a157c8c	3263	Gorica pri Slivnici
00050000-5593-c627-89b2-08bc4e9c344e	2272	Gorišnica
00050000-5593-c627-15db-43c3e48aaa0b	9250	Gornja Radgona
00050000-5593-c627-4cd7-066aae55ca16	3342	Gornji Grad
00050000-5593-c627-40d2-fb7a8edd958d	4282	Gozd Martuljek
00050000-5593-c627-8ab7-f9952dcc7f0b	6272	Gračišče
00050000-5593-c627-9bc1-a65743b3d0e9	9264	Grad
00050000-5593-c627-d22e-45e652a73b69	8332	Gradac
00050000-5593-c627-598a-1d7735262841	1384	Grahovo
00050000-5593-c627-8fd4-9ea28820bc23	5242	Grahovo ob Bači
00050000-5593-c627-8598-b5ac065e8de4	5251	Grgar
00050000-5593-c627-0442-f4f50ba36b9c	3302	Griže
00050000-5593-c627-91a6-0d77b54a0dac	3231	Grobelno
00050000-5593-c627-00c8-212dd205392f	1290	Grosuplje
00050000-5593-c627-d46b-915da0a54c34	2288	Hajdina
00050000-5593-c627-f34a-b3eec68abb6e	8362	Hinje
00050000-5593-c627-dac9-a999995711ff	2311	Hoče
00050000-5593-c627-6ed0-434be038925c	9205	Hodoš/Hodos
00050000-5593-c627-713a-319ebd8f6f72	1354	Horjul
00050000-5593-c627-493f-b7cdd353ffc9	1372	Hotedršica
00050000-5593-c627-e9d8-344142a109d8	1430	Hrastnik
00050000-5593-c627-5220-1fec01defda0	6225	Hruševje
00050000-5593-c627-efb7-1416faf32263	4276	Hrušica
00050000-5593-c627-d1a8-99602f0100c5	5280	Idrija
00050000-5593-c627-52a1-62700bd34f53	1292	Ig
00050000-5593-c627-dcdb-d525e865b3c7	6250	Ilirska Bistrica
00050000-5593-c627-7960-bad813c31c80	6251	Ilirska Bistrica-Trnovo
00050000-5593-c627-3f03-c703d53165ff	1295	Ivančna Gorica
00050000-5593-c627-a280-284339f7d3b7	2259	Ivanjkovci
00050000-5593-c627-31dd-b15b989bba23	1411	Izlake
00050000-5593-c627-efa6-2e94b1e35485	6310	Izola/Isola
00050000-5593-c627-d0f8-db5ab8f127ab	2222	Jakobski Dol
00050000-5593-c627-46a7-1bd56faba891	2221	Jarenina
00050000-5593-c627-027f-f94468d5ec1d	6254	Jelšane
00050000-5593-c627-20e1-6a50cd30abb5	4270	Jesenice
00050000-5593-c627-0e8e-b56267889981	8261	Jesenice na Dolenjskem
00050000-5593-c627-c156-bf8aa7ce8da3	3273	Jurklošter
00050000-5593-c627-3b31-eef17ba73bbe	2223	Jurovski Dol
00050000-5593-c627-4823-889b01cf7bb2	2256	Juršinci
00050000-5593-c627-40c8-46d5aaefd262	5214	Kal nad Kanalom
00050000-5593-c627-4c29-be26a5074297	3233	Kalobje
00050000-5593-c627-63dd-e32bc65c571c	4246	Kamna Gorica
00050000-5593-c627-e574-a84cd16a166f	2351	Kamnica
00050000-5593-c627-d3a8-f8d365b1bb3d	1241	Kamnik
00050000-5593-c627-b171-09efd5af2546	5213	Kanal
00050000-5593-c627-88ad-246cd4d145a1	8258	Kapele
00050000-5593-c627-7d42-31d1226f0709	2362	Kapla
00050000-5593-c627-d35b-670718a71b6b	2325	Kidričevo
00050000-5593-c627-8090-74e79fd3268b	1412	Kisovec
00050000-5593-c627-d2c9-bdb0575ba979	6253	Knežak
00050000-5593-c627-206e-550cbc653e12	5222	Kobarid
00050000-5593-c627-9789-fbe5ae5cffca	9227	Kobilje
00050000-5593-c627-2d78-ff8a83b7b7a6	1330	Kočevje
00050000-5593-c627-4e4d-8ba7bf08091e	1338	Kočevska Reka
00050000-5593-c627-426d-211486c453a1	2276	Kog
00050000-5593-c627-d367-6719e6bb3c3e	5211	Kojsko
00050000-5593-c627-30ae-5999356fe8d9	6223	Komen
00050000-5593-c627-6926-ee7cdac94e68	1218	Komenda
00050000-5593-c627-ceb1-78066a606d49	6000	Koper/Capodistria 
00050000-5593-c627-4acb-6f8d2c664b69	6001	Koper/Capodistria - poštni predali
00050000-5593-c627-41e2-a03098b3866d	8282	Koprivnica
00050000-5593-c627-fc8c-2ca0f8fddc70	5296	Kostanjevica na Krasu
00050000-5593-c627-3159-f3e45e2fdcf6	8311	Kostanjevica na Krki
00050000-5593-c627-dd55-be5e4d5ffbb0	1336	Kostel
00050000-5593-c627-aa63-37fe8c6a5f7f	6256	Košana
00050000-5593-c627-a848-4679eaa27d4b	2394	Kotlje
00050000-5593-c627-4500-037b3d86ccb0	6240	Kozina
00050000-5593-c627-e60c-f3a259e02c86	3260	Kozje
00050000-5593-c627-0315-eb89a0a93137	4000	Kranj 
00050000-5593-c627-77b1-d1ef0a2de46d	4001	Kranj - poštni predali
00050000-5593-c627-2939-7f018308d94c	4280	Kranjska Gora
00050000-5593-c627-c18b-6e4a0f7c9817	1281	Kresnice
00050000-5593-c627-4368-1587261c7a2e	4294	Križe
00050000-5593-c627-08df-923aec5fc6ab	9206	Križevci
00050000-5593-c627-e066-a943c79fef68	9242	Križevci pri Ljutomeru
00050000-5593-c627-e857-31ccce1b7b95	1301	Krka
00050000-5593-c627-0e6d-e1b7e328d3de	8296	Krmelj
00050000-5593-c627-adcb-f892c6d58a3b	4245	Kropa
00050000-5593-c627-f9a7-c8f1cf364633	8262	Krška vas
00050000-5593-c627-d6a3-8e4d7903476c	8270	Krško
00050000-5593-c627-2dd7-743eba912515	9263	Kuzma
00050000-5593-c627-e187-c1794d5ca1a3	2318	Laporje
00050000-5593-c627-aa6c-5f241f4a64c9	3270	Laško
00050000-5593-c627-555e-8e1d16346616	1219	Laze v Tuhinju
00050000-5593-c627-f3da-e4ecb5ed8f80	2230	Lenart v Slovenskih goricah
00050000-5593-c627-fb27-16fcb58b024e	9220	Lendava/Lendva
00050000-5593-c627-cbbf-c07ff8b53837	4248	Lesce
00050000-5593-c627-b35a-d2dc25d88ea2	3261	Lesično
00050000-5593-c627-69ff-44efc810a824	8273	Leskovec pri Krškem
00050000-5593-c627-9f45-8ccefa1c91a6	2372	Libeliče
00050000-5593-c627-b81f-b8af74626060	2341	Limbuš
00050000-5593-c627-f0ea-5d0ec9d53364	1270	Litija
00050000-5593-c627-0f5c-e767960c348e	3202	Ljubečna
00050000-5593-c627-acc8-7c6680e7b67a	1000	Ljubljana 
00050000-5593-c627-b7b5-75402b85d841	1001	Ljubljana - poštni predali
00050000-5593-c627-f6a6-0da08a173b54	1231	Ljubljana - Črnuče
00050000-5593-c627-4b65-0534f81fc253	1261	Ljubljana - Dobrunje
00050000-5593-c627-992a-3d5fd265fada	1260	Ljubljana - Polje
00050000-5593-c627-91c3-393a60aa61f1	1210	Ljubljana - Šentvid
00050000-5593-c627-56d6-852820253743	1211	Ljubljana - Šmartno
00050000-5593-c627-a3fb-c492a5de0007	3333	Ljubno ob Savinji
00050000-5593-c627-9c6b-22c648a4a582	9240	Ljutomer
00050000-5593-c627-459f-ecd514e198a0	3215	Loče
00050000-5593-c627-e13c-7b4e6325d509	5231	Log pod Mangartom
00050000-5593-c627-6b35-00fdc1e8c345	1358	Log pri Brezovici
00050000-5593-c627-06e1-0c9d4a840932	1370	Logatec
00050000-5593-c627-3a3a-7b187a65b914	1371	Logatec
00050000-5593-c627-7363-aa829b206c54	1434	Loka pri Zidanem Mostu
00050000-5593-c627-c759-ced81f0ebd0d	3223	Loka pri Žusmu
00050000-5593-c627-e38d-8e2ba5f89595	6219	Lokev
00050000-5593-c627-2f1b-3c4976b0c863	1318	Loški Potok
00050000-5593-c627-5575-93fabe3cae06	2324	Lovrenc na Dravskem polju
00050000-5593-c627-e383-e9bd7c214196	2344	Lovrenc na Pohorju
00050000-5593-c627-e0ae-c866754861be	3334	Luče
00050000-5593-c627-a3e2-6b26fc43f22c	1225	Lukovica
00050000-5593-c627-2519-8f81d29113c1	9202	Mačkovci
00050000-5593-c627-a0c5-510237a14173	2322	Majšperk
00050000-5593-c627-6869-c7a39765d2ca	2321	Makole
00050000-5593-c627-b9ab-3f3c487254fd	9243	Mala Nedelja
00050000-5593-c627-48c7-08ca4fde462e	2229	Malečnik
00050000-5593-c627-3959-edb2cffc1140	6273	Marezige
00050000-5593-c627-991d-8821ef5c0af0	2000	Maribor 
00050000-5593-c627-fe0c-74381eb9e815	2001	Maribor - poštni predali
00050000-5593-c627-2f51-05c1245acdbb	2206	Marjeta na Dravskem polju
00050000-5593-c627-bc28-61971e627863	2281	Markovci
00050000-5593-c627-029a-adf9514f85ff	9221	Martjanci
00050000-5593-c627-fa74-24f57374ba5d	6242	Materija
00050000-5593-c627-ad99-0dacb3c5daef	4211	Mavčiče
00050000-5593-c627-1923-c8c2914aca7b	1215	Medvode
00050000-5593-c627-1427-9f38d3a1a142	1234	Mengeš
00050000-5593-c627-daf0-fdc8806eb273	8330	Metlika
00050000-5593-c627-6dbd-9be7eb5dd944	2392	Mežica
00050000-5593-c627-46fd-79adbd9ea75c	2204	Miklavž na Dravskem polju
00050000-5593-c627-0a87-d57e4ca3c572	2275	Miklavž pri Ormožu
00050000-5593-c627-f806-6a9782d57f0c	5291	Miren
00050000-5593-c627-9ca3-4424d21dac3f	8233	Mirna
00050000-5593-c627-6a87-6cfd5aa70ff5	8216	Mirna Peč
00050000-5593-c627-a03e-756cedef5f78	2382	Mislinja
00050000-5593-c627-7536-252870900e2d	4281	Mojstrana
00050000-5593-c627-3a66-bbcac3b2ace1	8230	Mokronog
00050000-5593-c627-1b16-bd4e006c13df	1251	Moravče
00050000-5593-c627-0db4-a41769747aa4	9226	Moravske Toplice
00050000-5593-c627-e10c-7abe6f1058cd	5216	Most na Soči
00050000-5593-c627-4c2a-668df71459cb	1221	Motnik
00050000-5593-c627-89f0-17f0d734a95c	3330	Mozirje
00050000-5593-c627-a5d1-c1eb46e9c140	9000	Murska Sobota 
00050000-5593-c627-3236-4e4605d2019d	9001	Murska Sobota - poštni predali
00050000-5593-c627-a63d-0157ba400f45	2366	Muta
00050000-5593-c627-6c83-390258425adb	4202	Naklo
00050000-5593-c627-cd7b-7b2b965086d0	3331	Nazarje
00050000-5593-c627-608c-856cac391cf9	1357	Notranje Gorice
00050000-5593-c627-4c63-548afdc6be24	3203	Nova Cerkev
00050000-5593-c627-8bc1-e067bec2c325	5000	Nova Gorica 
00050000-5593-c627-ac1a-bcd5cf53de25	5001	Nova Gorica - poštni predali
00050000-5593-c627-8dda-0f1eed1a55d4	1385	Nova vas
00050000-5593-c627-82bd-08fec64c1a5a	8000	Novo mesto
00050000-5593-c627-c48a-ae963f2f96b1	8001	Novo mesto - poštni predali
00050000-5593-c627-449f-b56f598844f6	6243	Obrov
00050000-5593-c627-acab-67f0bc5833f8	9233	Odranci
00050000-5593-c627-659e-f93618cb41f5	2317	Oplotnica
00050000-5593-c627-1e2a-f6f974a9be38	2312	Orehova vas
00050000-5593-c627-fb38-5f080439e0ed	2270	Ormož
00050000-5593-c627-b1c4-b72ba6f1a780	1316	Ortnek
00050000-5593-c627-2583-e04a51dd0ee9	1337	Osilnica
00050000-5593-c627-0b66-6f84aadba40d	8222	Otočec
00050000-5593-c627-be9a-2cb17a7f14bd	2361	Ožbalt
00050000-5593-c627-5583-5977ff700676	2231	Pernica
00050000-5593-c627-07e9-2bdf0fb41773	2211	Pesnica pri Mariboru
00050000-5593-c627-16f7-b7d5161a8bd5	9203	Petrovci
00050000-5593-c627-d7b7-19213b167cb2	3301	Petrovče
00050000-5593-c627-9723-f6afb01a2be8	6330	Piran/Pirano
00050000-5593-c627-6608-33d62f9173da	8255	Pišece
00050000-5593-c627-f4f5-f7b6353cc8be	6257	Pivka
00050000-5593-c627-b35b-d7eff797f32d	6232	Planina
00050000-5593-c627-d2bb-ec3bf34d6d8c	3225	Planina pri Sevnici
00050000-5593-c627-1102-4fd77e6550c6	6276	Pobegi
00050000-5593-c627-261b-a5c298743131	8312	Podbočje
00050000-5593-c627-1f7a-a746327fbf8e	5243	Podbrdo
00050000-5593-c627-32f0-2a6240edcf08	3254	Podčetrtek
00050000-5593-c627-f57b-d76d1706c488	2273	Podgorci
00050000-5593-c627-8d05-e0c02b099c35	6216	Podgorje
00050000-5593-c627-bb49-ded81921c9cf	2381	Podgorje pri Slovenj Gradcu
00050000-5593-c627-cbb6-876211520ce9	6244	Podgrad
00050000-5593-c627-6c23-8fff37323972	1414	Podkum
00050000-5593-c627-1033-0db1f07d7243	2286	Podlehnik
00050000-5593-c627-ab60-be29f3a6096e	5272	Podnanos
00050000-5593-c627-a907-ab9d8f95364d	4244	Podnart
00050000-5593-c627-7636-f82769cf36a3	3241	Podplat
00050000-5593-c627-e1eb-785489f34be6	3257	Podsreda
00050000-5593-c627-adb8-e590114caa47	2363	Podvelka
00050000-5593-c627-8e9e-4ed0eec5b921	2208	Pohorje
00050000-5593-c627-6574-9a481bb43090	2257	Polenšak
00050000-5593-c627-cd8c-1096607d2788	1355	Polhov Gradec
00050000-5593-c627-eac7-cd123c2c6110	4223	Poljane nad Škofjo Loko
00050000-5593-c627-9501-3bb637bdc77d	2319	Poljčane
00050000-5593-c627-f64a-ae2d9afc9a13	1272	Polšnik
00050000-5593-c627-5f9e-51b00029b803	3313	Polzela
00050000-5593-c627-7800-d74f3b57dc9f	3232	Ponikva
00050000-5593-c627-ba95-689f54054696	6320	Portorož/Portorose
00050000-5593-c627-a95e-3b1eae4d2b87	6230	Postojna
00050000-5593-c627-933a-196a352cbc0b	2331	Pragersko
00050000-5593-c627-8f81-34e9aa8c99a3	3312	Prebold
00050000-5593-c627-adf3-2ce6f87f15e7	4205	Preddvor
00050000-5593-c627-e34e-f521dcbfb734	6255	Prem
00050000-5593-c627-b598-19e920d5ae5e	1352	Preserje
00050000-5593-c627-6a3d-e27031481ad7	6258	Prestranek
00050000-5593-c627-ddce-e036d20fab1e	2391	Prevalje
00050000-5593-c627-0fcb-4a9065401f11	3262	Prevorje
00050000-5593-c627-93f5-27404c67f585	1276	Primskovo 
00050000-5593-c627-565f-21783e8cae8b	3253	Pristava pri Mestinju
00050000-5593-c627-0a53-e5006c675065	9207	Prosenjakovci/Partosfalva
00050000-5593-c627-bea2-2f3715548a66	5297	Prvačina
00050000-5593-c627-9aa9-d5473053db13	2250	Ptuj
00050000-5593-c627-1ae5-01e19071af90	2323	Ptujska Gora
00050000-5593-c627-86a6-cda5bf375371	9201	Puconci
00050000-5593-c627-b252-afddeb8ae1de	2327	Rače
00050000-5593-c627-22ed-e4362b77368c	1433	Radeče
00050000-5593-c627-2be5-4c165cca3fee	9252	Radenci
00050000-5593-c627-a568-3eca5710b470	2360	Radlje ob Dravi
00050000-5593-c627-3da8-3e9204af0b82	1235	Radomlje
00050000-5593-c627-3a29-af5c493a90b4	4240	Radovljica
00050000-5593-c627-9f64-f271e548e63b	8274	Raka
00050000-5593-c627-273e-16cf8289b6b6	1381	Rakek
00050000-5593-c627-9241-96c416fb4761	4283	Rateče - Planica
00050000-5593-c627-0a17-22258a460f53	2390	Ravne na Koroškem
00050000-5593-c627-4ba8-4ab12cd72d8b	9246	Razkrižje
00050000-5593-c627-7c86-5df82f8b9bc4	3332	Rečica ob Savinji
00050000-5593-c627-2515-2261b94c4483	5292	Renče
00050000-5593-c627-b712-a835f373e41e	1310	Ribnica
00050000-5593-c627-dbb1-f110ada9f312	2364	Ribnica na Pohorju
00050000-5593-c627-a525-5604339e9be7	3272	Rimske Toplice
00050000-5593-c627-c22e-c0828bd001f1	1314	Rob
00050000-5593-c627-31fc-3071158a652a	5215	Ročinj
00050000-5593-c627-8d59-49db43f4a34a	3250	Rogaška Slatina
00050000-5593-c627-d9bf-a068d8a6a92a	9262	Rogašovci
00050000-5593-c627-834c-068a0fefaab0	3252	Rogatec
00050000-5593-c627-8c2b-0dc6e9baa401	1373	Rovte
00050000-5593-c627-47b1-4d2ea60cde93	2342	Ruše
00050000-5593-c627-1efd-1a1658c6079d	1282	Sava
00050000-5593-c627-625d-89d88c4930d9	6333	Sečovlje/Sicciole
00050000-5593-c627-47f2-e46b828d47f6	4227	Selca
00050000-5593-c627-1a12-367728d43a2b	2352	Selnica ob Dravi
00050000-5593-c627-aeb5-c7358aa36f3e	8333	Semič
00050000-5593-c627-21e0-846ebd04293a	8281	Senovo
00050000-5593-c627-96c9-018aad853001	6224	Senožeče
00050000-5593-c627-f874-36b2fdb63836	8290	Sevnica
00050000-5593-c627-3418-ead249af0ab4	6210	Sežana
00050000-5593-c627-f3b5-0f4b8fe4ed6a	2214	Sladki Vrh
00050000-5593-c627-b46b-0e1d32721abf	5283	Slap ob Idrijci
00050000-5593-c627-1fa5-f489dffa7c83	2380	Slovenj Gradec
00050000-5593-c627-b063-03046b238c47	2310	Slovenska Bistrica
00050000-5593-c627-5e9e-501de8ff7561	3210	Slovenske Konjice
00050000-5593-c627-9958-6372ddb5f1d5	1216	Smlednik
00050000-5593-c627-842b-e0ccfdcc65c9	5232	Soča
00050000-5593-c627-29c9-ec8fb744893f	1317	Sodražica
00050000-5593-c627-d40f-dfdeaf6f2223	3335	Solčava
00050000-5593-c627-5665-9f43cc8909a7	5250	Solkan
00050000-5593-c627-7bb1-256f31e8329d	4229	Sorica
00050000-5593-c627-38d5-88fc4d7cea9f	4225	Sovodenj
00050000-5593-c627-2340-bf8a44daf164	5281	Spodnja Idrija
00050000-5593-c627-8920-7ae57aabfb81	2241	Spodnji Duplek
00050000-5593-c627-9e96-92dd6620652f	9245	Spodnji Ivanjci
00050000-5593-c627-d6fd-c2d442045287	2277	Središče ob Dravi
00050000-5593-c627-f53d-8dbad15698b1	4267	Srednja vas v Bohinju
00050000-5593-c627-8b7f-5e93f6668e9b	8256	Sromlje 
00050000-5593-c627-5922-e1dd5b19f607	5224	Srpenica
00050000-5593-c627-a8b2-9263261f7311	1242	Stahovica
00050000-5593-c627-fb62-5f4785c65eb4	1332	Stara Cerkev
00050000-5593-c627-5a53-837ee709e0c8	8342	Stari trg ob Kolpi
00050000-5593-c627-39d9-154dd0215e4c	1386	Stari trg pri Ložu
00050000-5593-c627-f3ed-029559d84fa0	2205	Starše
00050000-5593-c627-4477-889ec6a403bb	2289	Stoperce
00050000-5593-c627-69ee-90932e43c6bd	8322	Stopiče
00050000-5593-c627-dd2e-8a0b116634f0	3206	Stranice
00050000-5593-c627-13d0-909203478660	8351	Straža
00050000-5593-c627-60d3-53e7d8ef6e1f	1313	Struge
00050000-5593-c627-e8bf-6a94d8e6b17a	8293	Studenec
00050000-5593-c627-84f7-04b1581fdd95	8331	Suhor
00050000-5593-c627-00fe-2f39b9c9c25e	2233	Sv. Ana v Slovenskih goricah
00050000-5593-c627-1e89-296eec986c91	2235	Sv. Trojica v Slovenskih goricah
00050000-5593-c627-b82f-4d74752330df	2353	Sveti Duh na Ostrem Vrhu
00050000-5593-c627-5a3f-0524af209bca	9244	Sveti Jurij ob Ščavnici
00050000-5593-c627-158e-e49fb14ea307	3264	Sveti Štefan
00050000-5593-c627-2143-d1c22a3d403d	2258	Sveti Tomaž
00050000-5593-c627-abc0-e293caffd9bb	9204	Šalovci
00050000-5593-c627-92cf-f679492baa49	5261	Šempas
00050000-5593-c627-c4cc-140ecd796244	5290	Šempeter pri Gorici
00050000-5593-c627-ea33-95d1bc403cc8	3311	Šempeter v Savinjski dolini
00050000-5593-c627-61fa-adbca74878b5	4208	Šenčur
00050000-5593-c627-924c-ce2e92805da2	2212	Šentilj v Slovenskih goricah
00050000-5593-c627-bcb2-a2f7e8e4550e	8297	Šentjanž
00050000-5593-c627-55e8-b42c4109db5e	2373	Šentjanž pri Dravogradu
00050000-5593-c627-3f40-f8eee8c4b82c	8310	Šentjernej
00050000-5593-c627-3099-944db0b0cd1f	3230	Šentjur
00050000-5593-c627-c33b-ce8898ef9439	3271	Šentrupert
00050000-5593-c627-6efb-83ed77e1e890	8232	Šentrupert
00050000-5593-c627-60a8-f76c5ecbbf3c	1296	Šentvid pri Stični
00050000-5593-c627-4b1b-f55fa09f595b	8275	Škocjan
00050000-5593-c627-6f60-32792745c9d9	6281	Škofije
00050000-5593-c627-cd55-b401a61acd08	4220	Škofja Loka
00050000-5593-c627-9b9e-a143184bfffe	3211	Škofja vas
00050000-5593-c627-a550-f676c1ab2efc	1291	Škofljica
00050000-5593-c627-cc6e-b2e5f1b3bba4	6274	Šmarje
00050000-5593-c627-c27c-2cdce2d15e8d	1293	Šmarje - Sap
00050000-5593-c627-621e-91a17aecdb17	3240	Šmarje pri Jelšah
00050000-5593-c627-92b2-d3af9a0cc21d	8220	Šmarješke Toplice
00050000-5593-c627-1b84-864848843cc2	2315	Šmartno na Pohorju
00050000-5593-c627-e51e-d090fa4397cf	3341	Šmartno ob Dreti
00050000-5593-c627-bf6c-ec87a2b67990	3327	Šmartno ob Paki
00050000-5593-c627-25a3-b83e9250e1e6	1275	Šmartno pri Litiji
00050000-5593-c627-d6f3-2af46ef432b5	2383	Šmartno pri Slovenj Gradcu
00050000-5593-c627-9d32-640864fe2561	3201	Šmartno v Rožni dolini
00050000-5593-c627-50eb-770b9103d762	3325	Šoštanj
00050000-5593-c627-8498-86c8d4399841	6222	Štanjel
00050000-5593-c627-349c-ef3315d31cba	3220	Štore
00050000-5593-c627-1ad3-215bb78bdebd	3304	Tabor
00050000-5593-c627-65e8-3b9b86831e29	3221	Teharje
00050000-5593-c627-8848-ee73e47954a5	9251	Tišina
00050000-5593-c627-e553-618bbf1dd96a	5220	Tolmin
00050000-5593-c627-622d-db414eae2ce4	3326	Topolšica
00050000-5593-c627-ae68-f276c712db91	2371	Trbonje
00050000-5593-c627-a8b1-0ea693be9532	1420	Trbovlje
00050000-5593-c627-bf84-d91ee03ecefc	8231	Trebelno 
00050000-5593-c627-019c-528927a925af	8210	Trebnje
00050000-5593-c627-04e5-bb32a0b9fc6f	5252	Trnovo pri Gorici
00050000-5593-c627-c1fc-2129ebaa816e	2254	Trnovska vas
00050000-5593-c627-7382-e526118feb0a	1222	Trojane
00050000-5593-c627-9b26-611d43cf7bd8	1236	Trzin
00050000-5593-c627-be3a-294a8bbd5efe	4290	Tržič
00050000-5593-c627-5106-77f8741e7bd7	8295	Tržišče
00050000-5593-c627-2412-b80423755de2	1311	Turjak
00050000-5593-c627-5f45-0f30547d4914	9224	Turnišče
00050000-5593-c627-8e07-0d83d59920cf	8323	Uršna sela
00050000-5593-c627-a36a-df35fd3abc30	1252	Vače
00050000-5593-c627-4c03-29d64f803ae2	3320	Velenje 
00050000-5593-c627-f531-7ccff7f555fb	3322	Velenje - poštni predali
00050000-5593-c627-20c6-5b4e9b1ef604	8212	Velika Loka
00050000-5593-c627-faf5-c98ec9a9b6fe	2274	Velika Nedelja
00050000-5593-c627-7751-c520ddb0826b	9225	Velika Polana
00050000-5593-c627-8361-183700621012	1315	Velike Lašče
00050000-5593-c627-7462-8d0eac7c9fac	8213	Veliki Gaber
00050000-5593-c627-9826-01d0b60b9677	9241	Veržej
00050000-5593-c627-4a1f-a8cfc5c04bec	1312	Videm - Dobrepolje
00050000-5593-c627-b9dd-6edb2383276a	2284	Videm pri Ptuju
00050000-5593-c627-d7a9-3cb593ccdbaf	8344	Vinica
00050000-5593-c627-6a6c-81c531c1c4ce	5271	Vipava
00050000-5593-c627-eabc-580824a9dccf	4212	Visoko
00050000-5593-c627-1c7c-57a97db8269b	1294	Višnja Gora
00050000-5593-c627-9689-62fcfe6531bc	3205	Vitanje
00050000-5593-c627-12c3-d5b091b835bf	2255	Vitomarci
00050000-5593-c627-9e37-e539de4fca0e	1217	Vodice
00050000-5593-c627-6843-3efa618756bb	3212	Vojnik\t
00050000-5593-c627-b52e-0198fa5d5d8c	5293	Volčja Draga
00050000-5593-c627-20be-7809564b83f4	2232	Voličina
00050000-5593-c627-d93a-5ba77dffe443	3305	Vransko
00050000-5593-c627-c0b8-99ff453ac79a	6217	Vremski Britof
00050000-5593-c627-6773-b79d0280a438	1360	Vrhnika
00050000-5593-c627-53d4-78df3d0f27ff	2365	Vuhred
00050000-5593-c627-47c4-678d1d5ccb5c	2367	Vuzenica
00050000-5593-c627-6ddd-2f5efae93e0c	8292	Zabukovje 
00050000-5593-c627-7699-809f4944336b	1410	Zagorje ob Savi
00050000-5593-c627-139e-8c7134f47309	1303	Zagradec
00050000-5593-c627-38fe-2ceb51761f22	2283	Zavrč
00050000-5593-c627-411d-2cbb1aa0d29f	8272	Zdole 
00050000-5593-c627-2a6a-99d2f1abc276	4201	Zgornja Besnica
00050000-5593-c627-6aab-a4c16a99189c	2242	Zgornja Korena
00050000-5593-c627-5af3-790f393e8f22	2201	Zgornja Kungota
00050000-5593-c627-beb4-35db2eb256bf	2316	Zgornja Ložnica
00050000-5593-c627-3b61-f86dd036f71d	2314	Zgornja Polskava
00050000-5593-c627-21f9-3684f2258307	2213	Zgornja Velka
00050000-5593-c627-93e4-eb1222208f0d	4247	Zgornje Gorje
00050000-5593-c627-7f21-4bc6748172b6	4206	Zgornje Jezersko
00050000-5593-c627-f81c-b484b67cd939	2285	Zgornji Leskovec
00050000-5593-c627-3007-6262814bd28f	1432	Zidani Most
00050000-5593-c627-e45a-6def3241808b	3214	Zreče
00050000-5593-c627-aab6-6a83fcbf4c75	4209	Žabnica
00050000-5593-c627-eefb-e40d9227df9c	3310	Žalec
00050000-5593-c627-bfd3-8da5de5914a8	4228	Železniki
00050000-5593-c627-3d29-d28f28f2b200	2287	Žetale
00050000-5593-c627-ae77-6ee2b6c339a7	4226	Žiri
00050000-5593-c627-8564-0a33930b75dc	4274	Žirovnica
00050000-5593-c627-da3e-a291de0873c7	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8710126)
-- Dependencies: 206
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 8709937)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8710015)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8710138)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8710258)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8710307)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5593-c628-811a-0043143570c9	00080000-5593-c628-5e2b-a8f7b27c3fe2	0900	AK
00190000-5593-c628-c892-769fe610281f	00080000-5593-c628-219d-98b378c62e59	0987	A
00190000-5593-c628-4fc8-3690f9ba4653	00080000-5593-c628-671c-f373de8105e6	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8710441)
-- Dependencies: 232
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram, stpremier, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stnekomerc, stizvponprem, stizvprej, stizvgostuj, stizvostalihnek, stgostovanjslo, stgostovanjzam, stgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sredstvaint, sredstvaavt) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 7936450)
-- Dependencies: 175
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id, naziv, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, stobisk, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev, stzaposlenih, sthonorarnih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, opredelitevdrugiviri, vlozekkoproducenta, drugijavni, sort) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 7899147)
-- Dependencies: 173
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, uprizoritev_id, program_dela_id, gostitelj_id, krajgostovanja, ustanova, datumgostovanja, stponovitev, stgledalcev, zaproseno, celotnavrednost, transportnistroski, stroskiavtorzun, odkup, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 7924205)
-- Dependencies: 174
-- Data for Name: programrazno; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programrazno (id, program_dela_id, gostitelj_id, nazivsklopa, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, stobiskovalcev, stzaposlenih, sthonoranih, zaproseno, celotnavrednost, lastnasredstva, drugiviri, viridminlok, sort) FROM stdin;
\.


--
-- TOC entry 2883 (class 0 OID 8710167)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5593-c628-4723-6a8f65ffca9d	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5593-c628-93a6-26ab573b9e6a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5593-c628-beb7-a582a1185c0f	0003	Kazinska	t	84	Kazinska dvorana
00220000-5593-c628-90be-bef3cbbe12d0	0004	Mali oder	t	24	Mali oder 
00220000-5593-c628-b571-a1626745ede2	0005	Komorni oder	t	15	Komorni oder
00220000-5593-c628-0aa1-3e6497ee3919	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5593-c628-bd69-583d54985e87	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8710111)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8710101)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8710296)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8710235)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8709809)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2884 (class 0 OID 8710177)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8709847)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5593-c626-bc6b-af79b36993e6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5593-c626-f770-af64935a1700	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5593-c626-b89d-d4a8df266bd1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5593-c626-ba06-14e79068ffc2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5593-c626-385c-226024fba6b4	planer	Planer dogodkov v koledarju	t
00020000-5593-c626-227b-34018445f246	kadrovska	Kadrovska služba	t
00020000-5593-c626-ab74-c0e49c86beb4	arhivar	Ažuriranje arhivalij	t
00020000-5593-c627-b143-4c745656d8ca	igralec	Igralec	t
00020000-5593-c627-abc4-560cf884f150	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5593-c628-a3ea-d7e81082702f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8709831)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5593-c627-243a-191507316da2	00020000-5593-c626-b89d-d4a8df266bd1
00010000-5593-c627-a4a2-fc0fd565d6e0	00020000-5593-c626-b89d-d4a8df266bd1
00010000-5593-c628-d10c-cb00be197421	00020000-5593-c628-a3ea-d7e81082702f
\.


--
-- TOC entry 2886 (class 0 OID 8710191)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8710132)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8710082)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8710491)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5593-c627-47ee-a36ea97411f2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5593-c627-d62a-51f18662c455	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5593-c627-d0d2-3242433034e1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5593-c627-13bf-547bd58bde58	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5593-c627-46df-a68d44aa5487	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8710483)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5593-c627-e289-35a6f3b52e10	00230000-5593-c627-13bf-547bd58bde58	popa
00240000-5593-c627-c1be-ae3b6cd1bb03	00230000-5593-c627-13bf-547bd58bde58	oseba
00240000-5593-c627-1698-a4cb56f7b6cb	00230000-5593-c627-d62a-51f18662c455	prostor
00240000-5593-c627-5c47-02d7d1d31fa7	00230000-5593-c627-13bf-547bd58bde58	besedilo
00240000-5593-c627-5d0e-342e75eab69a	00230000-5593-c627-13bf-547bd58bde58	uprizoritev
00240000-5593-c627-2b54-0500cf541843	00230000-5593-c627-13bf-547bd58bde58	funkcija
00240000-5593-c627-7911-16341706f746	00230000-5593-c627-13bf-547bd58bde58	tipfunkcije
00240000-5593-c627-a4ac-8abfb0894066	00230000-5593-c627-13bf-547bd58bde58	alternacija
00240000-5593-c627-fa29-06668e4e45c9	00230000-5593-c627-47ee-a36ea97411f2	pogodba
00240000-5593-c627-3b45-eb9c205be3a7	00230000-5593-c627-13bf-547bd58bde58	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8710478)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8710245)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5593-c628-6606-4114d51a298c	000e0000-5593-c628-dfd7-08c21b01c676	00080000-5593-c628-abc0-0b7bb6c69003	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5593-c628-aba6-1c80920a50b6	000e0000-5593-c628-dfd7-08c21b01c676	00080000-5593-c628-abc0-0b7bb6c69003	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5593-c628-96b7-d58627440fde	000e0000-5593-c628-dfd7-08c21b01c676	00080000-5593-c628-5d70-06eae4bd0ca8	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8709909)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8710088)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5593-c628-4f84-b6110c019f9f	00180000-5593-c628-8c8f-ece5db914bc6	000c0000-5593-c628-abe8-9a5dcf35791b	00090000-5593-c628-e4c5-c51e23140564	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-c628-8c8b-2162de21555b	00180000-5593-c628-8c8f-ece5db914bc6	000c0000-5593-c628-7412-287dc35acb7b	00090000-5593-c628-48c6-57c47f923523	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-c628-99b5-6d319fba5d22	00180000-5593-c628-8c8f-ece5db914bc6	000c0000-5593-c628-0967-4d8a9c4b4ebf	00090000-5593-c628-c66c-2ee5500415e8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-c628-fb81-220c58f556b7	00180000-5593-c628-8c8f-ece5db914bc6	000c0000-5593-c628-b53f-d9688090b889	00090000-5593-c628-fc1c-3b605a366cce	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-c628-cc1c-56c19a51af57	00180000-5593-c628-8c8f-ece5db914bc6	000c0000-5593-c628-df07-b9dcad0c5dcd	00090000-5593-c628-6734-0025fa347786	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-c628-d0b3-384870cbce96	00180000-5593-c628-6dec-250820df738a	\N	00090000-5593-c628-6734-0025fa347786	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8710285)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5593-c627-a351-a6bcf3dd3332	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5593-c627-7546-fa1e15648f52	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5593-c627-b437-ff25c11ec350	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5593-c627-de9e-41f08f974164	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5593-c627-a62b-8ae28082778f	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5593-c627-e82a-6d6d0130c03c	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5593-c627-be51-fda85fd62158	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5593-c627-3812-54d87ebb7908	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5593-c627-7ddb-b3b4fc3f6531	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5593-c627-c0e1-44d003659798	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5593-c627-ec0e-8a58b4a21a45	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5593-c627-3655-ac3ac4458965	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5593-c627-57f0-9c1757a2000d	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5593-c627-beae-cb7a5e3f8d95	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5593-c627-a6df-3aacab21518d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5593-c627-40f6-b1d2e705eb2f	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8710460)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5593-c627-f2f1-38ee5ae8449b	01	Velika predstava	f	1.00	1.00
002b0000-5593-c627-8e26-e848af4ff6b9	02	Mala predstava	f	0.50	0.50
002b0000-5593-c627-1f1a-b737feac7b15	03	Mala koprodukcija	t	0.40	1.00
002b0000-5593-c627-1c39-c15bc545bbe6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5593-c627-e70d-3c82374ceca6	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8709972)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8709818)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5593-c627-a4a2-fc0fd565d6e0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROuirgTKBvZ56FJ7ElnkBvycL8yDbjOlW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5593-c628-7918-3ae25adf9dc7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5593-c628-1189-3340d1424fb4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5593-c628-f275-4776e2ea9e13	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5593-c628-60c8-c329645a6e57	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5593-c628-744d-4b9d5b15b4bf	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5593-c628-a8a9-3f80fcac4cc1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5593-c628-daca-082531aaa74b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5593-c628-a891-d3a45c3158b6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5593-c628-abda-59aeab34b225	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5593-c628-d10c-cb00be197421	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5593-c627-243a-191507316da2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8710342)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5593-c628-b131-0c417e2a2776	00160000-5593-c628-68c0-0b7798602a6c	00150000-5593-c627-8f3b-ee2288c32c48	00140000-5593-c626-31b8-bb54f261efe0	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5593-c628-b571-a1626745ede2
000e0000-5593-c628-dfd7-08c21b01c676	00160000-5593-c628-d4d4-36ea0602fc7f	00150000-5593-c627-ec7a-51af1f60de06	00140000-5593-c626-bdcc-98f3a36e2a45	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5593-c628-0aa1-3e6497ee3919
000e0000-5593-c628-839b-b48f403c995e	\N	00150000-5593-c627-ec7a-51af1f60de06	00140000-5593-c626-bdcc-98f3a36e2a45	00190000-5593-c628-c892-769fe610281f	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5593-c628-b571-a1626745ede2
000e0000-5593-c628-a9e2-d2cb62975bff	\N	00150000-5593-c627-ec7a-51af1f60de06	00140000-5593-c626-bdcc-98f3a36e2a45	00190000-5593-c628-c892-769fe610281f	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5593-c628-b571-a1626745ede2
000e0000-5593-c628-c7f4-57fddb3d1250	\N	00150000-5593-c627-ec7a-51af1f60de06	00140000-5593-c626-bdcc-98f3a36e2a45	00190000-5593-c628-c892-769fe610281f	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5593-c628-4723-6a8f65ffca9d
\.


--
-- TOC entry 2867 (class 0 OID 8710034)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5593-c628-1e9c-7a4158f42b3c	000e0000-5593-c628-dfd7-08c21b01c676	1	
00200000-5593-c628-51e9-9c3bbe8f01ac	000e0000-5593-c628-dfd7-08c21b01c676	2	
\.


--
-- TOC entry 2882 (class 0 OID 8710159)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8710228)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8710066)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8710332)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5593-c626-31b8-bb54f261efe0	01	Drama	drama (SURS 01)
00140000-5593-c626-a398-e05973a58660	02	Opera	opera (SURS 02)
00140000-5593-c626-38c6-518807a51e00	03	Balet	balet (SURS 03)
00140000-5593-c626-4af5-eec94ff3b336	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5593-c626-53d7-b0d53b63926c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5593-c626-bdcc-98f3a36e2a45	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5593-c626-de07-83d03ab37483	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8710218)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5593-c627-17c4-cf8ba4afe359	01	Opera	opera
00150000-5593-c627-919e-e70967561703	02	Opereta	opereta
00150000-5593-c627-4aad-83cc99775c87	03	Balet	balet
00150000-5593-c627-1814-11af9b3bb422	04	Plesne prireditve	plesne prireditve
00150000-5593-c627-2850-4003a2c9dfd9	05	Lutkovno gledališče	lutkovno gledališče
00150000-5593-c627-1ef8-6037a5a1c0bf	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5593-c627-3170-a3176849b78c	07	Biografska drama	biografska drama
00150000-5593-c627-8f3b-ee2288c32c48	08	Komedija	komedija
00150000-5593-c627-9717-08eea3ee6d92	09	Črna komedija	črna komedija
00150000-5593-c627-16fa-f35e6468e78d	10	E-igra	E-igra
00150000-5593-c627-ec7a-51af1f60de06	11	Kriminalka	kriminalka
00150000-5593-c627-41c7-2f931b63b6d7	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8709872)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8710389)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8710379)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8710284)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8710056)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8710081)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8710476)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8709998)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8710436)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8710214)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8710032)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8710075)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8710012)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 8710124)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8710151)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8709970)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8709881)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2448 (class 2606 OID 8709905)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8709861)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8709846)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8710157)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8710190)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8710327)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8709934)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8709958)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8710130)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 8709948)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8710019)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8710142)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8710266)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8710312)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8710458)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 7936468)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 7899162)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 7924222)
-- Name: programrazno_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programrazno
    ADD CONSTRAINT programrazno_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 8710174)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8710115)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8710106)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8710306)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8710242)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8709817)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8710181)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8709835)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8709855)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8710199)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8710137)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8710087)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8710500)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8710488)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8710482)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8710255)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8709914)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8710097)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8710295)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8710470)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8709983)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8709830)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8710358)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8710041)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8710165)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8710233)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8710070)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8710340)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8710226)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8710063)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8710256)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8710257)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8709936)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2402 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2403 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2404 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2546 (class 1259 OID 8710158)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8710144)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8710143)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8710042)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8710215)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8710217)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8710216)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8710014)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8710013)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8710329)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8710330)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8710331)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2416 (class 1259 OID 7924224)
-- Name: idx_308cd2524ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd2524ae1cd1c ON programrazno USING btree (gostitelj_id);


--
-- TOC entry 2417 (class 1259 OID 7924223)
-- Name: idx_308cd252771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_308cd252771ec7bd ON programrazno USING btree (program_dela_id);


--
-- TOC entry 2608 (class 1259 OID 8710363)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8710360)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8710364)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8710362)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8710361)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8709985)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8709984)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2407 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2408 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 8709908)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8710182)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8710076)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8709862)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8709863)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8710202)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8710201)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8710200)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8710020)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8710022)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8710021)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8710490)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8710110)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8710108)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8710107)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8710109)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8709836)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8709837)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8710166)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8710131)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8710243)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8710244)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8710440)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8710437)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8710438)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8710439)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8709950)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8709949)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8709951)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8710267)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8710268)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8710393)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8710394)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8710391)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8710392)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8710234)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8710119)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8710118)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8710116)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8710117)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8710381)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8710380)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8710459)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8710033)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8710477)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8709883)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8709882)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8709915)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8709916)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8710100)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8710099)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8710098)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2411 (class 1259 OID 7899165)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2412 (class 1259 OID 7899163)
-- Name: idx_ffeaf2ff62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff62b4ffca ON programgostovanje USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 7899164)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2498 (class 1259 OID 8710065)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8710061)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8710058)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8710059)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8710057)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8710062)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8710060)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8709935)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8709999)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8710001)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8710000)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8710002)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8710125)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8710328)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8710359)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8709906)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8709907)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8710227)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8710501)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8709971)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8710489)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8710176)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8710175)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8710390)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8709959)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8710341)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8710313)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8710314)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8709856)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8710064)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8710637)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8710622)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8710627)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8710647)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8710617)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8710642)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8710632)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8710792)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8710797)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8710552)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8710732)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8710727)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8710722)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8710612)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8710762)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8710772)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8710767)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8710587)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8710582)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8710712)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8710817)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8710822)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8710827)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8710847)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8710832)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8710852)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8710842)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8710837)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8710577)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8710572)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8710537)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8710532)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8710742)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8710652)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8710512)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8710517)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8710757)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8710752)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8710747)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8710592)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8710602)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8710597)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8710917)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8710687)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8710677)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8710672)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8710682)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8710502)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8710507)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8710737)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8710717)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8710782)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8710787)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8710902)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8710887)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8710892)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8710897)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8710562)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8710557)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8710567)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8710802)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8710807)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8710877)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8710882)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8710867)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8710872)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8710777)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8710707)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8710702)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8710692)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8710697)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8710862)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8710857)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8710907)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8710607)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8710812)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8710912)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8710527)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8710522)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8710542)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8710547)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8710667)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8710662)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8710657)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-01 12:51:21 CEST

--
-- PostgreSQL database dump complete
--

