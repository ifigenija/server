--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-30 14:16:13 CEST

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
-- TOC entry 183 (class 1259 OID 8571720)
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
-- TOC entry 230 (class 1259 OID 8572238)
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
-- TOC entry 229 (class 1259 OID 8572221)
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
-- TOC entry 222 (class 1259 OID 8572125)
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
-- TOC entry 197 (class 1259 OID 8571899)
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
-- TOC entry 200 (class 1259 OID 8571933)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8572327)
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
-- TOC entry 192 (class 1259 OID 8571842)
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
-- TOC entry 231 (class 1259 OID 8572251)
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
-- TOC entry 216 (class 1259 OID 8572059)
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
-- TOC entry 195 (class 1259 OID 8571879)
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
-- TOC entry 199 (class 1259 OID 8571927)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8571859)
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
-- TOC entry 205 (class 1259 OID 8571976)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8572001)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8571816)
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
-- TOC entry 184 (class 1259 OID 8571729)
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
-- TOC entry 185 (class 1259 OID 8571740)
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
-- TOC entry 180 (class 1259 OID 8571694)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8571713)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8572008)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8572039)
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
-- TOC entry 226 (class 1259 OID 8572171)
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
-- TOC entry 187 (class 1259 OID 8571773)
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
-- TOC entry 189 (class 1259 OID 8571808)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8571982)
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
-- TOC entry 188 (class 1259 OID 8571793)
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
-- TOC entry 194 (class 1259 OID 8571871)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8571994)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8572114)
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
-- TOC entry 225 (class 1259 OID 8572163)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8572297)
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
-- TOC entry 212 (class 1259 OID 8572023)
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
-- TOC entry 204 (class 1259 OID 8571967)
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
-- TOC entry 203 (class 1259 OID 8571957)
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
-- TOC entry 224 (class 1259 OID 8572152)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8572091)
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
-- TOC entry 177 (class 1259 OID 8571665)
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
-- TOC entry 176 (class 1259 OID 8571663)
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
-- TOC entry 213 (class 1259 OID 8572033)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8571703)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8571687)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8572047)
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
-- TOC entry 207 (class 1259 OID 8571988)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8571938)
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
-- TOC entry 237 (class 1259 OID 8572347)
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
-- TOC entry 236 (class 1259 OID 8572339)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8572334)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8572101)
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
-- TOC entry 186 (class 1259 OID 8571765)
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
-- TOC entry 202 (class 1259 OID 8571944)
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
-- TOC entry 223 (class 1259 OID 8572141)
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
-- TOC entry 233 (class 1259 OID 8572316)
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
-- TOC entry 191 (class 1259 OID 8571828)
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
-- TOC entry 178 (class 1259 OID 8571674)
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
-- TOC entry 228 (class 1259 OID 8572198)
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
-- TOC entry 196 (class 1259 OID 8571890)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8572015)
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
-- TOC entry 218 (class 1259 OID 8572084)
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
-- TOC entry 198 (class 1259 OID 8571922)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8572188)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8572074)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8571668)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8571720)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8572238)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5592-888c-e21d-6d3a2f9a227b	000d0000-5592-888c-e26d-aba235fbb32e	\N	00090000-5592-888c-31fe-74f99e3395f0	000b0000-5592-888c-ae81-ac5867c2c522	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-888c-678b-2a7279db125c	000d0000-5592-888c-ed58-4216b16067b7	\N	00090000-5592-888c-6cf3-1f9b9f6eeaef	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-888c-97b3-b0b612fa2b56	000d0000-5592-888c-6e01-6cdf2a850618	\N	00090000-5592-888c-fe2c-21da305af854	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-888c-7cb1-479bac466924	000d0000-5592-888c-01af-2125b33def89	\N	00090000-5592-888c-1695-9c78c14d1a6e	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-888c-c807-378965610cf5	000d0000-5592-888c-8c51-a5d356fd9c2c	\N	00090000-5592-888c-8443-ece0909fa91a	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-888c-d5f5-74555c23771b	000d0000-5592-888c-935b-2ed366b87d57	\N	00090000-5592-888c-6cf3-1f9b9f6eeaef	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8572221)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8572125)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5592-888c-502a-8dbc5ec287e6	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5592-888c-1d0f-cc6c0c3b0e28	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5592-888c-e3dd-e3b0f67f4b30	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8571899)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5592-888c-2211-b9c07db1b564	\N	\N	00200000-5592-888c-b404-0f8390280677	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5592-888c-f6d4-b188a9996d47	\N	\N	00200000-5592-888c-ea29-24a39309205d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5592-888c-0be5-cd72e7979f1d	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5592-888c-af39-b49512af9abc	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5592-888c-08d4-0bfb73b75ae0	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8571933)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8572327)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8571842)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5592-888a-edf6-b874f85b75d5	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5592-888a-f3bc-315862b5d2f9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5592-888a-c7dd-702a2ec54388	AL	ALB	008	Albania 	Albanija	\N
00040000-5592-888a-cd1c-966a52c01e6b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5592-888a-be3b-2ac0ee4bec73	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5592-888a-bbd1-83affb6f0648	AD	AND	020	Andorra 	Andora	\N
00040000-5592-888a-c9b2-ced888155039	AO	AGO	024	Angola 	Angola	\N
00040000-5592-888a-a7f3-a29c7d7ddeb0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5592-888a-89cc-1c04b6bf0624	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5592-888a-f080-063141859ad4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-888a-43f3-b7a7b3d20d4d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5592-888a-228b-4defcd55c70e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5592-888a-3e75-2d6224024e31	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5592-888a-7c5c-7d469d77e5ea	AU	AUS	036	Australia 	Avstralija	\N
00040000-5592-888a-7809-361a982205ed	AT	AUT	040	Austria 	Avstrija	\N
00040000-5592-888a-cbc4-1b5015d90a3b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5592-888a-d098-ca7c326cfd35	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5592-888a-edfc-cda0efc66179	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5592-888a-e561-ade532a033a6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5592-888a-6d5b-2af83d522c75	BB	BRB	052	Barbados 	Barbados	\N
00040000-5592-888a-2d5c-90382fd86ff3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5592-888a-9fc3-fc5ca30e576e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5592-888a-45d6-22cda2d76b52	BZ	BLZ	084	Belize 	Belize	\N
00040000-5592-888a-9acc-ad78abae3852	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5592-888a-870f-5b785aa282f4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5592-888a-52ea-f23d25d2da2c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5592-888a-5afc-8ee03c4f87d8	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5592-888a-8405-74af3bddbe8a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5592-888a-b66f-578a9669944e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5592-888a-779b-aac528eacc28	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5592-888a-849c-cc38021f9fc4	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5592-888a-3a2a-f4bac7c2224d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5592-888a-24f0-e3b718651841	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5592-888a-3663-1ca28bda268e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5592-888a-8ea2-5b48b6cdde3a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5592-888a-419e-d5721ad7177f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5592-888a-a00c-9ca97e4f4fee	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5592-888a-0858-f8f5e3345b61	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5592-888a-9755-98e8e5159f7d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5592-888a-1465-29b93a6156bb	CA	CAN	124	Canada 	Kanada	\N
00040000-5592-888a-00e6-102f7237ab03	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5592-888a-2900-ba04d3a1de07	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5592-888a-73e1-b7692ee01163	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5592-888a-f9fd-8b474205d457	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5592-888a-0141-8efe280c0563	CL	CHL	152	Chile 	Čile	\N
00040000-5592-888a-c92b-a1dc1f374cbd	CN	CHN	156	China 	Kitajska	\N
00040000-5592-888a-ea8f-cd0749385520	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5592-888a-0230-2e58534027eb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5592-888a-4482-567dfb92ee9a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5592-888a-ac0a-c81c15eef5a7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5592-888a-0217-a8938720a1bd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5592-888a-f617-fa469d1b09f4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5592-888a-a9fa-45a38b568d42	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5592-888a-6461-bd0658e6ea5d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5592-888a-b008-37920d098651	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5592-888a-9fc7-d4ddd5e2ebcc	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5592-888a-8520-9fe3fa7a8493	CU	CUB	192	Cuba 	Kuba	\N
00040000-5592-888a-7b04-6f6c27d8beed	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5592-888a-64fc-740b93cd8a5e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5592-888a-9779-e89146693d15	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5592-888a-d891-fd04cd0b2438	DK	DNK	208	Denmark 	Danska	\N
00040000-5592-888a-89d2-6e5af21c58d4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5592-888a-49fa-fe2c6d06001c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-888a-1739-81c29fe7faa4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5592-888a-dfeb-c30c498df77b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5592-888a-a62c-998198bdb7e1	EG	EGY	818	Egypt 	Egipt	\N
00040000-5592-888a-8e8c-95f896bf29b3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5592-888a-0ac1-97865261c8b0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5592-888a-7fe2-ee83e5f9c7fe	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5592-888a-f607-d29f17717c5d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5592-888a-a37e-684da95f67e7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5592-888a-9e8c-44f716b3f518	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5592-888a-012d-48e7f9b2a02d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5592-888a-db28-d957b5175c8c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5592-888a-e8d9-ca3f81bc6947	FI	FIN	246	Finland 	Finska	\N
00040000-5592-888a-873a-26b1fdf12b51	FR	FRA	250	France 	Francija	\N
00040000-5592-888a-d61a-5e3024a95ab0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5592-888a-072a-7186cee0bac1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5592-888a-fa00-d6780eecffbf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5592-888a-2329-6e62e00b2059	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5592-888a-e88e-4eee7656a4d6	GA	GAB	266	Gabon 	Gabon	\N
00040000-5592-888a-49df-ccd3f12dbc19	GM	GMB	270	Gambia 	Gambija	\N
00040000-5592-888a-2603-b244271ffb87	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5592-888a-a9ee-d5d804532454	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5592-888a-49eb-bfb913ff061d	GH	GHA	288	Ghana 	Gana	\N
00040000-5592-888a-8fe5-ea60b64c6814	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5592-888a-cb65-770d8923f4c1	GR	GRC	300	Greece 	Grčija	\N
00040000-5592-888a-6249-492e0a536108	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5592-888a-dead-e2d004a7e99f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5592-888a-7913-cebe06b3298b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5592-888a-0aa7-9021fdb0896a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5592-888a-021a-364fa982465e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5592-888a-7392-46a571e9cd0e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5592-888a-2fdb-ec55457b3dd2	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5592-888a-419d-5517fb4dc187	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5592-888a-1a9c-46c12534607f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5592-888a-e9dc-331718aba379	HT	HTI	332	Haiti 	Haiti	\N
00040000-5592-888a-389d-d073e7570772	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5592-888a-b58a-a4ffb86cc385	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5592-888a-7dc3-7b0b29802793	HN	HND	340	Honduras 	Honduras	\N
00040000-5592-888a-dc4c-1869af97b4ce	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5592-888a-e2a6-a9db4de27677	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5592-888a-9a37-e035f74318f8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5592-888a-46d0-eaba87f2bb77	IN	IND	356	India 	Indija	\N
00040000-5592-888a-13f2-445d70cc16e4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5592-888a-0350-af9c2d87c6ea	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5592-888a-c84f-e2469ea48895	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5592-888a-f644-f3c9f232db8c	IE	IRL	372	Ireland 	Irska	\N
00040000-5592-888a-015d-a28b8d4e145a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5592-888a-bb0b-88c8e35a49c8	IL	ISR	376	Israel 	Izrael	\N
00040000-5592-888a-7d00-aa1573995e95	IT	ITA	380	Italy 	Italija	\N
00040000-5592-888a-7ea5-6462c28b38af	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5592-888a-a4d1-64e2f490311c	JP	JPN	392	Japan 	Japonska	\N
00040000-5592-888a-b693-3a0b953cf2e6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5592-888a-c453-3fb5ffc2112c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5592-888a-ff86-a03f56a2bcea	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5592-888a-6d1b-6d6b8370680e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5592-888a-999f-a00b1a6f24e3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5592-888a-8d07-382bc75e1ef0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5592-888a-8ff3-144164d28478	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5592-888a-b9a8-962585a8e3cc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5592-888a-e978-f304dd7ad467	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5592-888a-1318-d3b6bcba3fc2	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5592-888a-6f40-352df6b36fe3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5592-888a-b36d-e39c6dbbb04f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5592-888a-11a8-ccf0ce8547aa	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5592-888a-4d63-95bd5b1e81c7	LR	LBR	430	Liberia 	Liberija	\N
00040000-5592-888a-cc64-d4fae252fd30	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5592-888a-3858-8526385b4e23	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5592-888a-0785-62ad789809b7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5592-888a-2d5f-cc02ba60320b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5592-888a-cf4a-0ea673587b93	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5592-888a-a540-bcd9a96fd7bb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5592-888a-0bca-6fac15627feb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5592-888a-04be-0d81716087c3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5592-888a-0940-435fe92d2514	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5592-888a-30b8-0190fc8e03f7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5592-888a-faf2-e60f72f35322	ML	MLI	466	Mali 	Mali	\N
00040000-5592-888a-efb7-a2fd1fb45c66	MT	MLT	470	Malta 	Malta	\N
00040000-5592-888a-d36b-0126ff879df3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5592-888a-1460-4d077fe98149	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5592-888a-51f3-ef686850af8f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5592-888a-158e-05fb5bf3adbc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5592-888a-031c-a67e52e1c4a6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5592-888a-7693-a481aba5362d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5592-888a-9a06-9086b3bc73f9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5592-888a-443a-115a20da95df	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5592-888a-0725-2c115104bf2d	MC	MCO	492	Monaco 	Monako	\N
00040000-5592-888a-1848-eef08ac25838	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5592-888a-ea6e-8ba928fa8fe9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5592-888a-4bb8-e2b2590fb28c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5592-888a-55c9-cae29441b13f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5592-888a-766b-4d259624f77b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5592-888a-b111-3e58a21fb612	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5592-888a-c46f-977b1ecd63e0	NA	NAM	516	Namibia 	Namibija	\N
00040000-5592-888a-19b5-7d67ae8267a3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5592-888a-a3cd-297a9f1f12ae	NP	NPL	524	Nepal 	Nepal	\N
00040000-5592-888a-b999-870f8432c99e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5592-888a-f2ce-531855a611b4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5592-888a-62df-2687fe9ac198	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5592-888a-7822-d01d3e32a80a	NE	NER	562	Niger 	Niger 	\N
00040000-5592-888a-d153-86e03e4dde7b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5592-888a-570a-21b2cc805895	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5592-888a-8faa-fe11548ba35b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5592-888a-023c-9bf73d6367bd	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5592-888a-bde2-bd9d94d3a759	NO	NOR	578	Norway 	Norveška	\N
00040000-5592-888a-29db-792ebd33e4d5	OM	OMN	512	Oman 	Oman	\N
00040000-5592-888a-d1d9-8739bf8a44ca	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5592-888a-c0c4-2516ded2cdc3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5592-888a-6146-dc52071654b7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5592-888a-476b-9d2fb3cc6e5e	PA	PAN	591	Panama 	Panama	\N
00040000-5592-888a-2f74-f4fba41d049f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5592-888a-a0cd-bfb6c03a90d1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5592-888a-1ceb-15cad7590206	PE	PER	604	Peru 	Peru	\N
00040000-5592-888a-9b02-be78539b05ee	PH	PHL	608	Philippines 	Filipini	\N
00040000-5592-888a-1bb3-79511932d50c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5592-888a-2d43-3715785eb5e9	PL	POL	616	Poland 	Poljska	\N
00040000-5592-888a-f124-0c6744ad6494	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5592-888a-26c6-32c676354b47	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5592-888a-9293-e567eb8ce346	QA	QAT	634	Qatar 	Katar	\N
00040000-5592-888a-d007-7e26c2057331	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5592-888a-03c9-c372b5194060	RO	ROU	642	Romania 	Romunija	\N
00040000-5592-888a-8ffa-8628cecc193e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5592-888a-7402-8370b9df8a4d	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5592-888a-9af4-548072bccc54	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5592-888a-4ce2-de9ab3c064cd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5592-888a-ad92-e98bcf30088e	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5592-888a-2b30-a87187f8ede0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5592-888a-8fa1-0278b5b0fcb9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5592-888a-0def-771c870ddd0b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5592-888a-14b5-ae71349135a4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5592-888a-edd7-4ad74b949679	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5592-888a-6d27-a6e1d9092d13	SM	SMR	674	San Marino 	San Marino	\N
00040000-5592-888a-e972-df3f649def2b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5592-888a-1d4b-e2681fd79991	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5592-888a-37c5-9686683dd9d3	SN	SEN	686	Senegal 	Senegal	\N
00040000-5592-888a-6b39-d5dd9549e175	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5592-888a-a1e8-a1f223cc0398	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5592-888a-1e45-23e9e667ccd2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5592-888a-7805-604763786e31	SG	SGP	702	Singapore 	Singapur	\N
00040000-5592-888a-4ead-5ca666114020	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5592-888a-87c5-6139d4c283c7	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5592-888a-3055-2692b75cfb38	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5592-888a-9a96-0e7c65a0864e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5592-888a-1451-b497adc1332d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5592-888a-118e-a00512d1cf51	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5592-888a-dc0b-55759dcbeeef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5592-888a-3fb1-f88f81ae9072	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5592-888a-1c5c-2e1bcdf08083	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5592-888a-605e-824d5b4c39ad	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5592-888a-9e16-4e4e6d5b4e39	SD	SDN	729	Sudan 	Sudan	\N
00040000-5592-888a-d33b-a381bd029b1c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5592-888a-890b-2c02119c0036	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5592-888a-74fd-02af8f8226cb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5592-888a-a354-6c87f989749b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5592-888a-afac-70438bcd3278	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5592-888a-79cc-2208943fbeec	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5592-888a-2fe8-16e9c3863d43	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5592-888a-beb7-7f3a9517044c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5592-888a-16d6-8a88fd5dcf6c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5592-888a-fd0b-960047b6f9bd	TH	THA	764	Thailand 	Tajska	\N
00040000-5592-888a-1689-28c0e826dd6a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5592-888a-3855-344219148502	TG	TGO	768	Togo 	Togo	\N
00040000-5592-888a-8ac6-247f21c8d05c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5592-888a-9aeb-99ab982f2f92	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5592-888a-f872-759941afb34b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5592-888a-fc37-7598a9b17cc5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5592-888a-f7db-c3454cf5cb7d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5592-888a-7ffe-bea78e6b9991	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5592-888a-ce6a-d55fc829e73d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-888a-4146-74e23898f5fd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5592-888a-2dbb-18881b79bbc8	UG	UGA	800	Uganda 	Uganda	\N
00040000-5592-888a-bdb3-7873032e3941	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5592-888a-26b1-9f42b5b84b99	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5592-888a-94b0-d90f420de78b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5592-888a-c8fc-3ecb6c030d08	US	USA	840	United States 	Združene države Amerike	\N
00040000-5592-888a-9e41-a3dfee35e36e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5592-888a-5d67-dac6ee2e0140	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5592-888a-7b26-0c8152bb7e37	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5592-888a-e760-12562a97e7b9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5592-888a-1291-d92979a6cb53	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5592-888a-7b7b-d955b27b5c6f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5592-888a-2a3a-e522ca1900a3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-888a-7213-36ad1f90b652	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5592-888a-3f06-284f63657cf2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5592-888a-cc27-c8195cb65e89	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5592-888a-fe25-6b694527f783	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5592-888a-0c17-95b0fcf153fa	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5592-888a-733a-0b56b1024b16	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8572251)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5592-888c-5bfd-df4f67d85d36	000e0000-5592-888c-aa45-8f6a8878af36	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5592-888b-c0bc-aac9f7537cb0	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5592-888c-9d9a-2e259d5973a6	000e0000-5592-888c-689c-5af9ca849f73	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5592-888b-9ba7-e8ab554c112d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8572059)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5592-888c-e11d-263ece1cbee2	000e0000-5592-888c-689c-5af9ca849f73	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5592-888b-11d9-75f8cdefd1dc
000d0000-5592-888c-e26d-aba235fbb32e	000e0000-5592-888c-689c-5af9ca849f73	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-888b-11d9-75f8cdefd1dc
000d0000-5592-888c-ed58-4216b16067b7	000e0000-5592-888c-689c-5af9ca849f73	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5592-888b-3d92-d341f03d4fed
000d0000-5592-888c-6e01-6cdf2a850618	000e0000-5592-888c-689c-5af9ca849f73	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5592-888b-bad7-d1015ad89952
000d0000-5592-888c-01af-2125b33def89	000e0000-5592-888c-689c-5af9ca849f73	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5592-888b-bad7-d1015ad89952
000d0000-5592-888c-8c51-a5d356fd9c2c	000e0000-5592-888c-689c-5af9ca849f73	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5592-888b-bad7-d1015ad89952
000d0000-5592-888c-935b-2ed366b87d57	000e0000-5592-888c-689c-5af9ca849f73	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-888b-11d9-75f8cdefd1dc
\.


--
-- TOC entry 2866 (class 0 OID 8571879)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8571927)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8571859)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5592-888c-5760-568fd7957eb0	00080000-5592-888c-d860-682b11ef8a82	00090000-5592-888c-31fe-74f99e3395f0	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8571976)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8572001)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8571816)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5592-888b-9a7d-3a07b6707a4e	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5592-888b-e620-4e60c4a14804	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5592-888b-5ccc-d0b7fb1e982f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5592-888b-1193-efd22b8f3589	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5592-888b-b661-dd3df7703370	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5592-888b-6dd6-226a85278164	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5592-888b-476c-e7713f313e64	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5592-888b-5da5-6fdbaeb9ca98	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-888b-e73a-9473c40972f9	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-888b-fb1e-873305c849ef	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5592-888b-79f1-01b66129a173	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5592-888b-ef47-25fcbdbee449	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5592-888b-5bfd-716d8049257e	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5592-888c-ba11-ffb920ab475c	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5592-888c-7b86-5bc15a1c62fd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5592-888c-72ff-339a5b74d654	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5592-888c-865c-e871fd11db5b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5592-888c-2e2c-278f2b962144	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5592-888c-5211-123a7586ecfa	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8571729)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5592-888c-eba4-1169f71a5eaa	00000000-5592-888c-7b86-5bc15a1c62fd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5592-888c-0497-677388fd49c6	00000000-5592-888c-7b86-5bc15a1c62fd	00010000-5592-888b-b2d8-a1ebca202296	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5592-888c-7f04-8c71fba5ae48	00000000-5592-888c-72ff-339a5b74d654	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8571740)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5592-888c-00c7-aeacf90f311f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5592-888c-1695-9c78c14d1a6e	00010000-5592-888c-5fac-6eb923f02213	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5592-888c-fe2c-21da305af854	00010000-5592-888c-97c2-de033bfb0ac2	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5592-888c-de32-71822bd8d8c4	00010000-5592-888c-3abe-3a5190a42398	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5592-888c-8e92-9f0343eb0bcc	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5592-888c-4725-ce7f40b27648	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5592-888c-28de-232a06e84e32	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5592-888c-cafd-8a60d62339af	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5592-888c-31fe-74f99e3395f0	00010000-5592-888c-8e91-3e09c2b7f1e4	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5592-888c-6cf3-1f9b9f6eeaef	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5592-888c-5f4b-9eca909ffa2d	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5592-888c-8443-ece0909fa91a	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5592-888c-0044-150cb68f4e8e	00010000-5592-888c-46d0-e5add164fbb3	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8571694)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5592-888a-777d-57df81efb316	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5592-888a-718a-253c1bf96503	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5592-888a-2b6e-6772d06a1485	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5592-888a-98f8-2ed4943d2dba	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5592-888a-56b0-047c2414af08	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5592-888a-2ce0-2c8144169618	Abonma-read	Abonma - branje	f
00030000-5592-888a-2fe9-4a303ed694a2	Abonma-write	Abonma - spreminjanje	f
00030000-5592-888a-2969-d8194ff8f7f6	Alternacija-read	Alternacija - branje	f
00030000-5592-888a-a03c-9dc8fb803df3	Alternacija-write	Alternacija - spreminjanje	f
00030000-5592-888a-bbdc-829f341d3e51	Arhivalija-read	Arhivalija - branje	f
00030000-5592-888a-9940-f935662f7cda	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5592-888a-4d3e-b0180974d42e	Besedilo-read	Besedilo - branje	f
00030000-5592-888a-57b0-195c724dad8b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5592-888a-94aa-5b505d44ff59	DogodekIzven-read	DogodekIzven - branje	f
00030000-5592-888a-4aa9-843136d1c9ba	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5592-888a-35b3-5b25c2bc3e2c	Dogodek-read	Dogodek - branje	f
00030000-5592-888a-7b18-02a2508cae98	Dogodek-write	Dogodek - spreminjanje	f
00030000-5592-888a-a776-380aff0d770c	DrugiVir-read	DrugiVir - branje	f
00030000-5592-888a-a7a1-d098e145c1d4	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5592-888a-76c5-7f107a8d6d81	Drzava-read	Drzava - branje	f
00030000-5592-888a-dd33-b6e7378ab74b	Drzava-write	Drzava - spreminjanje	f
00030000-5592-888a-fa12-20426cd97b3e	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5592-888a-9e03-972ff47b98a5	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5592-888a-179c-dc8bb37caf36	Funkcija-read	Funkcija - branje	f
00030000-5592-888a-2bc6-25a6e025d271	Funkcija-write	Funkcija - spreminjanje	f
00030000-5592-888a-fa2c-c614580ade1c	Gostovanje-read	Gostovanje - branje	f
00030000-5592-888a-5c86-2fd3edd69f2c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5592-888a-accc-d51946c71a74	Gostujoca-read	Gostujoca - branje	f
00030000-5592-888a-10d2-16e3c877837f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5592-888a-8d89-7a8e0a1e6a57	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5592-888a-c44e-a1150658852b	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5592-888a-595f-d3b6ef3895a1	Kupec-read	Kupec - branje	f
00030000-5592-888a-b0a2-90e3c59b7a6a	Kupec-write	Kupec - spreminjanje	f
00030000-5592-888a-9e99-d6c2f02deb8c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5592-888a-809f-61bd3e788772	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5592-888a-cdb7-6435856dbe28	Option-read	Option - branje	f
00030000-5592-888a-0d7a-e964c38f3991	Option-write	Option - spreminjanje	f
00030000-5592-888a-d9e7-eb29355299c8	OptionValue-read	OptionValue - branje	f
00030000-5592-888a-3cde-adf9f8169c4c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5592-888a-e20e-9c91fac15a86	Oseba-read	Oseba - branje	f
00030000-5592-888a-3c25-fd6230792619	Oseba-write	Oseba - spreminjanje	f
00030000-5592-888a-1c08-7d9167135a76	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5592-888a-7eb9-c814cba5683c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5592-888a-7872-27bd6d2981d9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5592-888a-3999-87a6129264bc	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5592-888a-d3a3-62da4d44016c	Pogodba-read	Pogodba - branje	f
00030000-5592-888a-21d9-4c1cc830edab	Pogodba-write	Pogodba - spreminjanje	f
00030000-5592-888a-150b-6ce80f6433b7	Popa-read	Popa - branje	f
00030000-5592-888a-7265-bd2ccb3b1705	Popa-write	Popa - spreminjanje	f
00030000-5592-888a-70ea-3b1b87cbbea3	Posta-read	Posta - branje	f
00030000-5592-888a-fe2e-65944ea46f99	Posta-write	Posta - spreminjanje	f
00030000-5592-888a-061f-8d711be52aa5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5592-888a-a798-b7c6608804bc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5592-888a-c2b5-4e53a43589fd	PostniNaslov-read	PostniNaslov - branje	f
00030000-5592-888a-02cb-86381dc68e5b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5592-888a-c5b9-8cb96b395d0e	Predstava-read	Predstava - branje	f
00030000-5592-888a-8136-b8e8ef328f00	Predstava-write	Predstava - spreminjanje	f
00030000-5592-888a-29b4-9caadc956787	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5592-888a-7408-daced9cf46d0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5592-888a-f158-5ca0483c57b3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5592-888a-02fb-4fc1c2e4cc45	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5592-888a-2778-1af0b67a2eda	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5592-888a-2bc0-027b5d1f33be	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5592-888a-bf20-9a0f2402e11d	ProgramDela-read	ProgramDela - branje	f
00030000-5592-888a-a689-50626a8e67cb	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5592-888a-7365-1af29cba22fc	ProgramFestival-read	ProgramFestival - branje	f
00030000-5592-888a-bbbd-cc3dfe7a7fdc	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5592-888a-0bbc-c3925c62d85d	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5592-888a-eb82-293f93944fa2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5592-888a-c251-97e652b2a7dc	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5592-888a-fa5e-470556d83909	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5592-888a-5509-2b013e240399	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5592-888a-cc1c-d8025663dcc1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5592-888a-ce4a-e7cec148985f	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5592-888a-7490-501943dd60a0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5592-888a-3bcf-d60097a633b3	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5592-888a-6fee-5571ff16a93a	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5592-888a-4ae6-8c4ade2952a8	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5592-888a-81bf-2a3a11f0d631	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5592-888a-152d-f26b46ee1b35	ProgramRazno-read	ProgramRazno - branje	f
00030000-5592-888a-554c-450fc6c36b2f	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5592-888a-33a8-f6c4187f93d6	Prostor-read	Prostor - branje	f
00030000-5592-888a-c698-0ef32fc13b96	Prostor-write	Prostor - spreminjanje	f
00030000-5592-888a-f406-2d216f4bb427	Racun-read	Racun - branje	f
00030000-5592-888a-f75e-1d055570353b	Racun-write	Racun - spreminjanje	f
00030000-5592-888a-5cb0-161352c785a9	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5592-888a-dadd-2e3010ea27cf	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5592-888a-a85d-410aa92a1936	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5592-888a-dbee-9d09f13c29c5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5592-888a-130d-b1af3d5d5587	Rekvizit-read	Rekvizit - branje	f
00030000-5592-888a-f0de-7e27ebe8adc1	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5592-888a-3163-b3bc5bf970ba	Revizija-read	Revizija - branje	f
00030000-5592-888a-cb6e-f4a941c838a2	Revizija-write	Revizija - spreminjanje	f
00030000-5592-888a-4792-fe9600ec04e3	Rezervacija-read	Rezervacija - branje	f
00030000-5592-888a-09a9-546b7a6deca3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5592-888a-d3c3-65bc74f6175d	SedezniRed-read	SedezniRed - branje	f
00030000-5592-888a-f7a2-024b7f5d7a96	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5592-888a-9fe6-b9481a4f6417	Sedez-read	Sedez - branje	f
00030000-5592-888a-5d82-af56c74c9c6f	Sedez-write	Sedez - spreminjanje	f
00030000-5592-888a-af42-4ad88bb12b38	Sezona-read	Sezona - branje	f
00030000-5592-888a-4bdf-f636182621d5	Sezona-write	Sezona - spreminjanje	f
00030000-5592-888a-ce49-f141dcceb9f7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5592-888a-5665-64c941d8bc0e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5592-888a-ef1e-b45adc84b440	Stevilcenje-read	Stevilcenje - branje	f
00030000-5592-888a-0c70-cee8b9f07ada	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5592-888a-90aa-276d3b0caff2	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5592-888a-07d9-8e46bede402a	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5592-888a-7176-94cd64d91f08	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5592-888a-0bb0-f8844df4467c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5592-888a-760a-97e19f4e21f9	Telefonska-read	Telefonska - branje	f
00030000-5592-888a-844d-a91ee43b4119	Telefonska-write	Telefonska - spreminjanje	f
00030000-5592-888a-d418-f5f6d655015a	TerminStoritve-read	TerminStoritve - branje	f
00030000-5592-888a-53cd-d89e194b2da7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5592-888a-88d8-513429508701	TipFunkcije-read	TipFunkcije - branje	f
00030000-5592-888a-bab7-2f06c217f883	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5592-888a-a0cb-3eb2a4cbeb3d	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5592-888a-3c50-963e35d8bc6a	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5592-888a-101c-0cddb079a5f7	Trr-read	Trr - branje	f
00030000-5592-888a-6d0f-c00b41de2539	Trr-write	Trr - spreminjanje	f
00030000-5592-888a-4a5a-6110c8123a80	Uprizoritev-read	Uprizoritev - branje	f
00030000-5592-888a-cbeb-e45349f3b0fe	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5592-888a-7bd5-0f028b0848d1	Vaja-read	Vaja - branje	f
00030000-5592-888a-10f4-ce4d54a6b9b3	Vaja-write	Vaja - spreminjanje	f
00030000-5592-888a-7ec6-351340bfb67a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5592-888a-2deb-eff7b04a6bd3	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5592-888a-adc4-46a9be4eec93	Zaposlitev-read	Zaposlitev - branje	f
00030000-5592-888a-e504-0f3211cf2e3f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5592-888a-52fa-3c6318dbadee	Zasedenost-read	Zasedenost - branje	f
00030000-5592-888a-3f81-f0be83b52dc2	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5592-888a-18c7-5306ad785b7f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5592-888a-8d18-39d269fd25a3	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5592-888a-5783-600aef882235	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5592-888a-18d7-00ca84dab574	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8571713)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5592-888a-f64e-63445a3244e7	00030000-5592-888a-718a-253c1bf96503
00020000-5592-888a-d0e5-45dbbb1bc523	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2fe9-4a303ed694a2
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2969-d8194ff8f7f6
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-a03c-9dc8fb803df3
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-98f8-2ed4943d2dba
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-7b18-02a2508cae98
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-dd33-b6e7378ab74b
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-179c-dc8bb37caf36
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2bc6-25a6e025d271
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-5c86-2fd3edd69f2c
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-10d2-16e3c877837f
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-8d89-7a8e0a1e6a57
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-c44e-a1150658852b
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-e20e-9c91fac15a86
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-3c25-fd6230792619
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-7265-bd2ccb3b1705
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-fe2e-65944ea46f99
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-c2b5-4e53a43589fd
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-02cb-86381dc68e5b
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-8136-b8e8ef328f00
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2778-1af0b67a2eda
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-2bc0-027b5d1f33be
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-c698-0ef32fc13b96
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-dbee-9d09f13c29c5
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-f0de-7e27ebe8adc1
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-4bdf-f636182621d5
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-88d8-513429508701
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-4a5a-6110c8123a80
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-cbeb-e45349f3b0fe
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-7bd5-0f028b0848d1
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-10f4-ce4d54a6b9b3
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-52fa-3c6318dbadee
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-3f81-f0be83b52dc2
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888a-7863-a0d18472f470	00030000-5592-888a-5783-600aef882235
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-8d89-7a8e0a1e6a57
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-c44e-a1150658852b
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-e20e-9c91fac15a86
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-3c25-fd6230792619
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-c2b5-4e53a43589fd
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-02cb-86381dc68e5b
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-760a-97e19f4e21f9
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-844d-a91ee43b4119
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-101c-0cddb079a5f7
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-6d0f-c00b41de2539
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-adc4-46a9be4eec93
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-e504-0f3211cf2e3f
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888a-9392-054d08ea9ba2	00030000-5592-888a-5783-600aef882235
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-2969-d8194ff8f7f6
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-9940-f935662f7cda
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-4d3e-b0180974d42e
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-94aa-5b505d44ff59
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-179c-dc8bb37caf36
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-8d89-7a8e0a1e6a57
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-e20e-9c91fac15a86
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-2778-1af0b67a2eda
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-88d8-513429508701
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-7bd5-0f028b0848d1
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-52fa-3c6318dbadee
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888a-8e7a-9c145623f2eb	00030000-5592-888a-5783-600aef882235
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-2fe9-4a303ed694a2
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-a03c-9dc8fb803df3
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-88d8-513429508701
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888a-50c5-67031a50e565	00030000-5592-888a-5783-600aef882235
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-d418-f5f6d655015a
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-2b6e-6772d06a1485
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-88d8-513429508701
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888a-fbc6-b7b41a1e36c4	00030000-5592-888a-5783-600aef882235
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-777d-57df81efb316
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-718a-253c1bf96503
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2b6e-6772d06a1485
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-98f8-2ed4943d2dba
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-56b0-047c2414af08
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2ce0-2c8144169618
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2fe9-4a303ed694a2
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2969-d8194ff8f7f6
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-a03c-9dc8fb803df3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-bbdc-829f341d3e51
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-9940-f935662f7cda
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4d3e-b0180974d42e
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-57b0-195c724dad8b
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-94aa-5b505d44ff59
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4aa9-843136d1c9ba
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-35b3-5b25c2bc3e2c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7b18-02a2508cae98
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-76c5-7f107a8d6d81
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-dd33-b6e7378ab74b
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-fa12-20426cd97b3e
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-9e03-972ff47b98a5
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-179c-dc8bb37caf36
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2bc6-25a6e025d271
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-fa2c-c614580ade1c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5c86-2fd3edd69f2c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-accc-d51946c71a74
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-10d2-16e3c877837f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-8d89-7a8e0a1e6a57
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-c44e-a1150658852b
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-595f-d3b6ef3895a1
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-b0a2-90e3c59b7a6a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-9e99-d6c2f02deb8c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-809f-61bd3e788772
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-cdb7-6435856dbe28
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-0d7a-e964c38f3991
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-d9e7-eb29355299c8
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3cde-adf9f8169c4c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-e20e-9c91fac15a86
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3c25-fd6230792619
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-1c08-7d9167135a76
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7eb9-c814cba5683c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7872-27bd6d2981d9
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3999-87a6129264bc
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-d3a3-62da4d44016c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-21d9-4c1cc830edab
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-150b-6ce80f6433b7
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7265-bd2ccb3b1705
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-70ea-3b1b87cbbea3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-fe2e-65944ea46f99
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-061f-8d711be52aa5
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-a798-b7c6608804bc
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-c2b5-4e53a43589fd
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-02cb-86381dc68e5b
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-c5b9-8cb96b395d0e
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-8136-b8e8ef328f00
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-29b4-9caadc956787
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7408-daced9cf46d0
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-f158-5ca0483c57b3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-02fb-4fc1c2e4cc45
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2778-1af0b67a2eda
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2bc0-027b5d1f33be
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-bf20-9a0f2402e11d
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-a689-50626a8e67cb
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7365-1af29cba22fc
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-bbbd-cc3dfe7a7fdc
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-0bbc-c3925c62d85d
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-eb82-293f93944fa2
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-c251-97e652b2a7dc
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-fa5e-470556d83909
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5509-2b013e240399
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-cc1c-d8025663dcc1
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-ce4a-e7cec148985f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7490-501943dd60a0
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3bcf-d60097a633b3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-6fee-5571ff16a93a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4ae6-8c4ade2952a8
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-81bf-2a3a11f0d631
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-152d-f26b46ee1b35
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-554c-450fc6c36b2f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-33a8-f6c4187f93d6
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-c698-0ef32fc13b96
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-f406-2d216f4bb427
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-f75e-1d055570353b
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5cb0-161352c785a9
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-dadd-2e3010ea27cf
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-a85d-410aa92a1936
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-dbee-9d09f13c29c5
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-130d-b1af3d5d5587
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-f0de-7e27ebe8adc1
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3163-b3bc5bf970ba
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-cb6e-f4a941c838a2
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4792-fe9600ec04e3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-09a9-546b7a6deca3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-d3c3-65bc74f6175d
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-f7a2-024b7f5d7a96
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-9fe6-b9481a4f6417
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5d82-af56c74c9c6f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-af42-4ad88bb12b38
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4bdf-f636182621d5
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-ce49-f141dcceb9f7
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5665-64c941d8bc0e
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-ef1e-b45adc84b440
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-0c70-cee8b9f07ada
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-90aa-276d3b0caff2
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-07d9-8e46bede402a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7176-94cd64d91f08
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-0bb0-f8844df4467c
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-760a-97e19f4e21f9
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-844d-a91ee43b4119
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-d418-f5f6d655015a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-53cd-d89e194b2da7
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-88d8-513429508701
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-bab7-2f06c217f883
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-a0cb-3eb2a4cbeb3d
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3c50-963e35d8bc6a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-101c-0cddb079a5f7
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-6d0f-c00b41de2539
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-4a5a-6110c8123a80
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-cbeb-e45349f3b0fe
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7bd5-0f028b0848d1
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-10f4-ce4d54a6b9b3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-7ec6-351340bfb67a
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-2deb-eff7b04a6bd3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-adc4-46a9be4eec93
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-e504-0f3211cf2e3f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-52fa-3c6318dbadee
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-3f81-f0be83b52dc2
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-18c7-5306ad785b7f
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-8d18-39d269fd25a3
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-5783-600aef882235
00020000-5592-888c-00d7-44f95a186603	00030000-5592-888a-18d7-00ca84dab574
\.


--
-- TOC entry 2881 (class 0 OID 8572008)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8572039)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8572171)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5592-888c-ae81-ac5867c2c522	00090000-5592-888c-00c7-aeacf90f311f	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8571773)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5592-888c-d860-682b11ef8a82	00040000-5592-888a-edf6-b874f85b75d5	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-888c-0fde-0b73f0be2287	00040000-5592-888a-edf6-b874f85b75d5	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-888c-93a6-9150d26c633d	00040000-5592-888a-edf6-b874f85b75d5	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-888c-937c-0a4b985f3626	00040000-5592-888a-edf6-b874f85b75d5	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-888c-bac4-cfaa79b66189	00040000-5592-888a-edf6-b874f85b75d5	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-888c-4753-cf07149d443e	00040000-5592-888a-3055-2692b75cfb38	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8571808)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5592-888b-9429-c0e2c67bae49	8341	Adlešiči
00050000-5592-888b-9a69-038418873fc6	5270	Ajdovščina
00050000-5592-888b-de5c-5f3b77e7cbcc	6280	Ankaran/Ancarano
00050000-5592-888b-cee1-ff89f27227a0	9253	Apače
00050000-5592-888b-0641-3f79178c3a04	8253	Artiče
00050000-5592-888b-9b8c-3614490bf5dd	4275	Begunje na Gorenjskem
00050000-5592-888b-16e5-83ce86770b31	1382	Begunje pri Cerknici
00050000-5592-888b-e30d-708870b227b9	9231	Beltinci
00050000-5592-888b-d5d8-86ee967815e2	2234	Benedikt
00050000-5592-888b-2f41-365579c33a2e	2345	Bistrica ob Dravi
00050000-5592-888b-0168-a76fda9541e4	3256	Bistrica ob Sotli
00050000-5592-888b-9790-0851e36dd438	8259	Bizeljsko
00050000-5592-888b-c756-598fa0fb9ef5	1223	Blagovica
00050000-5592-888b-0bf7-749b2a2f061b	8283	Blanca
00050000-5592-888b-65b4-154df75d3025	4260	Bled
00050000-5592-888b-56a8-8ca881638361	4273	Blejska Dobrava
00050000-5592-888b-c6a0-5a36f34fabbe	9265	Bodonci
00050000-5592-888b-5f01-36ab2db50051	9222	Bogojina
00050000-5592-888b-dcab-9a2e84763143	4263	Bohinjska Bela
00050000-5592-888b-6233-75d267e60c5b	4264	Bohinjska Bistrica
00050000-5592-888b-81ae-9123de473d8c	4265	Bohinjsko jezero
00050000-5592-888b-ebea-867c32c6e2b5	1353	Borovnica
00050000-5592-888b-1681-8cf940445c8b	8294	Boštanj
00050000-5592-888b-b8fd-bc3fc08867dd	5230	Bovec
00050000-5592-888b-0369-aab66a996721	5295	Branik
00050000-5592-888b-72d0-00457f3ca6b0	3314	Braslovče
00050000-5592-888b-fd67-b410a87d05c3	5223	Breginj
00050000-5592-888b-01a9-24c5d5f4e78b	8280	Brestanica
00050000-5592-888b-b782-d3e28b615cf9	2354	Bresternica
00050000-5592-888b-04f6-bb74d6fd90e6	4243	Brezje
00050000-5592-888b-895e-2db7d7d9a2b7	1351	Brezovica pri Ljubljani
00050000-5592-888b-37b5-be1904f79e3f	8250	Brežice
00050000-5592-888b-a45d-43c7983387d1	4210	Brnik - Aerodrom
00050000-5592-888b-01b0-e5ec27d129f4	8321	Brusnice
00050000-5592-888b-d993-d879c64e6260	3255	Buče
00050000-5592-888b-f28e-b400bf344bdf	8276	Bučka 
00050000-5592-888b-afaa-d01d7d8e5419	9261	Cankova
00050000-5592-888b-196e-c793532667b6	3000	Celje 
00050000-5592-888b-db30-f3e31d444c38	3001	Celje - poštni predali
00050000-5592-888b-8005-80cb00c52e67	4207	Cerklje na Gorenjskem
00050000-5592-888b-fad5-355afdf5acc9	8263	Cerklje ob Krki
00050000-5592-888b-61a2-b849cc8dacd5	1380	Cerknica
00050000-5592-888b-3f6a-9b33d730aa24	5282	Cerkno
00050000-5592-888b-8f73-a14037e3320c	2236	Cerkvenjak
00050000-5592-888b-174c-c970ca428aee	2215	Ceršak
00050000-5592-888b-3a91-7156d32dcc89	2326	Cirkovce
00050000-5592-888b-4634-0ea505919b4d	2282	Cirkulane
00050000-5592-888b-0987-3325c78f6649	5273	Col
00050000-5592-888b-a1c6-68232c1d482c	8251	Čatež ob Savi
00050000-5592-888b-4ce5-8bd8a311ea16	1413	Čemšenik
00050000-5592-888b-9154-c2fb25558669	5253	Čepovan
00050000-5592-888b-af16-76752e7c930e	9232	Črenšovci
00050000-5592-888b-3b4b-9c146c1015ff	2393	Črna na Koroškem
00050000-5592-888b-26a1-eed0ff5f9e48	6275	Črni Kal
00050000-5592-888b-db5e-faa0877bd154	5274	Črni Vrh nad Idrijo
00050000-5592-888b-6687-d876f2550ab9	5262	Črniče
00050000-5592-888b-b34e-1aa1529f08e4	8340	Črnomelj
00050000-5592-888b-6ae7-96abe387c9c0	6271	Dekani
00050000-5592-888b-cf7f-982364ae474a	5210	Deskle
00050000-5592-888b-88ce-616db48f7024	2253	Destrnik
00050000-5592-888b-9c16-e7b96f25a1ec	6215	Divača
00050000-5592-888b-4cd5-9eb5b129cd0f	1233	Dob
00050000-5592-888b-f072-79cea507ce0a	3224	Dobje pri Planini
00050000-5592-888b-8748-ddfba520f2ce	8257	Dobova
00050000-5592-888b-e9a2-4d84701d6b3c	1423	Dobovec
00050000-5592-888b-01de-8b66f79b4c96	5263	Dobravlje
00050000-5592-888b-d12f-744a2cdba833	3204	Dobrna
00050000-5592-888b-def4-2b8292780a5d	8211	Dobrnič
00050000-5592-888b-b137-7712ba12263f	1356	Dobrova
00050000-5592-888b-653e-862aa5e8b1f4	9223	Dobrovnik/Dobronak 
00050000-5592-888b-b6be-68417fecb105	5212	Dobrovo v Brdih
00050000-5592-888b-188b-71822571ab40	1431	Dol pri Hrastniku
00050000-5592-888b-419a-70b95959b65a	1262	Dol pri Ljubljani
00050000-5592-888b-648f-6018e0dbcaec	1273	Dole pri Litiji
00050000-5592-888b-221f-e61b487e162a	1331	Dolenja vas
00050000-5592-888b-cb2b-d15a0661f19d	8350	Dolenjske Toplice
00050000-5592-888b-5dc0-6004020c238c	1230	Domžale
00050000-5592-888b-fd81-a9c534d20afb	2252	Dornava
00050000-5592-888b-a037-460feaaa75fc	5294	Dornberk
00050000-5592-888b-a489-5ed87a452201	1319	Draga
00050000-5592-888b-490e-811957113aab	8343	Dragatuš
00050000-5592-888b-5045-42485082769a	3222	Dramlje
00050000-5592-888b-c6aa-fbaff9a049ff	2370	Dravograd
00050000-5592-888b-336c-50b6af38ae12	4203	Duplje
00050000-5592-888b-7aca-f1b82b0ed50c	6221	Dutovlje
00050000-5592-888b-3141-ea5fac28323a	8361	Dvor
00050000-5592-888b-b7e1-6bc498140524	2343	Fala
00050000-5592-888b-0fec-5a713426a384	9208	Fokovci
00050000-5592-888b-98a3-4e2a1ce3c7ac	2313	Fram
00050000-5592-888b-0383-5dc25342a144	3213	Frankolovo
00050000-5592-888b-a8a7-ab9ffa17cda2	1274	Gabrovka
00050000-5592-888b-8c44-3334e9d49f51	8254	Globoko
00050000-5592-888b-dd45-8e9c559662a1	5275	Godovič
00050000-5592-888b-9782-e0acd0fa25f1	4204	Golnik
00050000-5592-888b-b70d-1a7c733699cf	3303	Gomilsko
00050000-5592-888b-5825-5d8419bb7414	4224	Gorenja vas
00050000-5592-888b-c1f8-8ca3e45f93c3	3263	Gorica pri Slivnici
00050000-5592-888b-9f5c-69d02bbc5b90	2272	Gorišnica
00050000-5592-888b-1a19-44df62af4383	9250	Gornja Radgona
00050000-5592-888b-b541-e99d1672c4c2	3342	Gornji Grad
00050000-5592-888b-6e25-6102de05c84b	4282	Gozd Martuljek
00050000-5592-888b-3c1f-69a06a241ea7	6272	Gračišče
00050000-5592-888b-ac7a-8db71f5f92e2	9264	Grad
00050000-5592-888b-fd65-bc0ad5fe1ba6	8332	Gradac
00050000-5592-888b-2325-fa71a27dd98d	1384	Grahovo
00050000-5592-888b-5f5f-732bd2cbfb77	5242	Grahovo ob Bači
00050000-5592-888b-20f5-81cf5df8f063	5251	Grgar
00050000-5592-888b-8442-c05938b64be6	3302	Griže
00050000-5592-888b-969b-17fea82ed1f2	3231	Grobelno
00050000-5592-888b-4790-27d7702a3eb9	1290	Grosuplje
00050000-5592-888b-52b3-891b0edf9a9e	2288	Hajdina
00050000-5592-888b-60cd-4fea59294c00	8362	Hinje
00050000-5592-888b-04c5-da413d4f333e	2311	Hoče
00050000-5592-888b-354f-d7dfa66d3339	9205	Hodoš/Hodos
00050000-5592-888b-7ecf-bea2b006ca9c	1354	Horjul
00050000-5592-888b-cf6d-2c7589b6e24c	1372	Hotedršica
00050000-5592-888b-c964-b474207bbc30	1430	Hrastnik
00050000-5592-888b-3956-3f57c3ed2c26	6225	Hruševje
00050000-5592-888b-db96-79a7e7a1ee80	4276	Hrušica
00050000-5592-888b-a23c-c87ac177e710	5280	Idrija
00050000-5592-888b-ea35-9f60f8c1cd0f	1292	Ig
00050000-5592-888b-b4be-de9581886193	6250	Ilirska Bistrica
00050000-5592-888b-561b-d1359c1bc238	6251	Ilirska Bistrica-Trnovo
00050000-5592-888b-ac60-38b092b113d9	1295	Ivančna Gorica
00050000-5592-888b-96a9-5446f01d33c3	2259	Ivanjkovci
00050000-5592-888b-ed25-2aa04148fb4b	1411	Izlake
00050000-5592-888b-65d8-d3b0b0863ab6	6310	Izola/Isola
00050000-5592-888b-dc9d-096596275b80	2222	Jakobski Dol
00050000-5592-888b-d45a-a58b7d51adbb	2221	Jarenina
00050000-5592-888b-7634-6af6e9f51970	6254	Jelšane
00050000-5592-888b-3b9b-3a4a4328711b	4270	Jesenice
00050000-5592-888b-4fd9-55c793a0b78d	8261	Jesenice na Dolenjskem
00050000-5592-888b-b224-2459bc12c6d4	3273	Jurklošter
00050000-5592-888b-6ade-8d7f8ce44943	2223	Jurovski Dol
00050000-5592-888b-7f89-c37a8cee78eb	2256	Juršinci
00050000-5592-888b-0005-a0c53f1e42d0	5214	Kal nad Kanalom
00050000-5592-888b-7359-9b17743d3cb5	3233	Kalobje
00050000-5592-888b-2366-8526563a3869	4246	Kamna Gorica
00050000-5592-888b-e8b5-4ca8a89cd6ae	2351	Kamnica
00050000-5592-888b-915b-1e2e1c00d3b7	1241	Kamnik
00050000-5592-888b-6c53-5ec8cb1030b5	5213	Kanal
00050000-5592-888b-8dd7-9f95dc513ba7	8258	Kapele
00050000-5592-888b-82cd-cf09751b6abc	2362	Kapla
00050000-5592-888b-dd18-f58c779b3e5e	2325	Kidričevo
00050000-5592-888b-a3d5-1c93508376e7	1412	Kisovec
00050000-5592-888b-44cf-5436423d0124	6253	Knežak
00050000-5592-888b-aeeb-6495b06c7c71	5222	Kobarid
00050000-5592-888b-cb79-497af13f445a	9227	Kobilje
00050000-5592-888b-736d-9d16c909003f	1330	Kočevje
00050000-5592-888b-5d3b-74fb650bc4a3	1338	Kočevska Reka
00050000-5592-888b-e0c6-61846caf6d8b	2276	Kog
00050000-5592-888b-add3-d4164ee943d9	5211	Kojsko
00050000-5592-888b-dda2-26fbe974bff9	6223	Komen
00050000-5592-888b-83be-f4379dc9efc4	1218	Komenda
00050000-5592-888b-6596-2c40a534c174	6000	Koper/Capodistria 
00050000-5592-888b-2275-827f94ceca05	6001	Koper/Capodistria - poštni predali
00050000-5592-888b-0771-ae50ae81f01f	8282	Koprivnica
00050000-5592-888b-1ad9-a124348713bb	5296	Kostanjevica na Krasu
00050000-5592-888b-eca3-ccd9afb07fa7	8311	Kostanjevica na Krki
00050000-5592-888b-2b47-fa5919b431ee	1336	Kostel
00050000-5592-888b-e07a-d6fcae7ee769	6256	Košana
00050000-5592-888b-c8a3-158e2f899779	2394	Kotlje
00050000-5592-888b-3a7d-94aa54881509	6240	Kozina
00050000-5592-888b-7505-3b66cadff2d1	3260	Kozje
00050000-5592-888b-11ef-b25ab5e53c9a	4000	Kranj 
00050000-5592-888b-da07-15163bcbc823	4001	Kranj - poštni predali
00050000-5592-888b-bf5d-36dd806b5e33	4280	Kranjska Gora
00050000-5592-888b-3750-036b9eb37a42	1281	Kresnice
00050000-5592-888b-639e-e8937cf0491c	4294	Križe
00050000-5592-888b-bb99-66ccc3b6b2f5	9206	Križevci
00050000-5592-888b-6195-497e120e5cb4	9242	Križevci pri Ljutomeru
00050000-5592-888b-a8fc-a2c27a40e830	1301	Krka
00050000-5592-888b-115d-16ffe9ba856c	8296	Krmelj
00050000-5592-888b-7841-ac72480c9c59	4245	Kropa
00050000-5592-888b-d482-fd6583e37fec	8262	Krška vas
00050000-5592-888b-55f6-eef29647142f	8270	Krško
00050000-5592-888b-f3b7-0d9b76a7f32e	9263	Kuzma
00050000-5592-888b-8c25-d1287d211aae	2318	Laporje
00050000-5592-888b-b685-cb0f2ed19708	3270	Laško
00050000-5592-888b-e52d-ba348f8ca85b	1219	Laze v Tuhinju
00050000-5592-888b-daf1-2815de372836	2230	Lenart v Slovenskih goricah
00050000-5592-888b-9d5b-c145d00416b8	9220	Lendava/Lendva
00050000-5592-888b-3e5c-c03337dca18b	4248	Lesce
00050000-5592-888b-c2c6-04b26aeaf04d	3261	Lesično
00050000-5592-888b-0da7-a5fafbab55fa	8273	Leskovec pri Krškem
00050000-5592-888b-3e60-e5bd4351415a	2372	Libeliče
00050000-5592-888b-4738-2928351f415f	2341	Limbuš
00050000-5592-888b-ba69-a97f8e0f8073	1270	Litija
00050000-5592-888b-9ca1-969c4d46d304	3202	Ljubečna
00050000-5592-888b-edcf-c96e1c4b0d89	1000	Ljubljana 
00050000-5592-888b-50c3-a058b4ba27e0	1001	Ljubljana - poštni predali
00050000-5592-888b-8772-217de73e5ba2	1231	Ljubljana - Črnuče
00050000-5592-888b-b7ca-9fcf080abd6c	1261	Ljubljana - Dobrunje
00050000-5592-888b-7831-f3a7af995fc2	1260	Ljubljana - Polje
00050000-5592-888b-a5c3-63bfdfe9f7f1	1210	Ljubljana - Šentvid
00050000-5592-888b-63b9-b9176c1bf953	1211	Ljubljana - Šmartno
00050000-5592-888b-c6c4-71c2b4934900	3333	Ljubno ob Savinji
00050000-5592-888b-be31-d5d71fb12d3a	9240	Ljutomer
00050000-5592-888b-f500-a3658c8311ce	3215	Loče
00050000-5592-888b-a55a-1d16a56fd222	5231	Log pod Mangartom
00050000-5592-888b-bd5b-d951e104ccb5	1358	Log pri Brezovici
00050000-5592-888b-9d72-113523167a70	1370	Logatec
00050000-5592-888b-fd46-58e1209656e7	1371	Logatec
00050000-5592-888b-7405-830b71a2d490	1434	Loka pri Zidanem Mostu
00050000-5592-888b-720f-69fc7e565994	3223	Loka pri Žusmu
00050000-5592-888b-e58f-48ce175e440a	6219	Lokev
00050000-5592-888b-0fe6-307fcee5109e	1318	Loški Potok
00050000-5592-888b-6664-00755c184d5a	2324	Lovrenc na Dravskem polju
00050000-5592-888b-6144-7cc58d46853c	2344	Lovrenc na Pohorju
00050000-5592-888b-c662-3296d1f2a4be	3334	Luče
00050000-5592-888b-0b5e-199755e626bf	1225	Lukovica
00050000-5592-888b-2673-addc0d6ed63e	9202	Mačkovci
00050000-5592-888b-3786-561a56b97bf7	2322	Majšperk
00050000-5592-888b-511f-bed9d18e8edd	2321	Makole
00050000-5592-888b-dca7-13bf9a12959b	9243	Mala Nedelja
00050000-5592-888b-9439-29ce35d0be7f	2229	Malečnik
00050000-5592-888b-d79e-4b8182e3dc07	6273	Marezige
00050000-5592-888b-dbee-691cf4bcc0c3	2000	Maribor 
00050000-5592-888b-e080-764d0699d00c	2001	Maribor - poštni predali
00050000-5592-888b-f459-d5f554ed35e2	2206	Marjeta na Dravskem polju
00050000-5592-888b-3cfa-70535821f4d0	2281	Markovci
00050000-5592-888b-7f0e-a149c80a0198	9221	Martjanci
00050000-5592-888b-53d1-a9a5c9bcb448	6242	Materija
00050000-5592-888b-19b0-646cfd6ea3ca	4211	Mavčiče
00050000-5592-888b-dd17-aac5a3939452	1215	Medvode
00050000-5592-888b-51da-84097efb756b	1234	Mengeš
00050000-5592-888b-c7ca-c51eafbf28e2	8330	Metlika
00050000-5592-888b-3833-e31df8490ef4	2392	Mežica
00050000-5592-888b-3d53-9528fa513f1a	2204	Miklavž na Dravskem polju
00050000-5592-888b-f10a-539b37e1f05a	2275	Miklavž pri Ormožu
00050000-5592-888b-aa8d-c922a9cdf746	5291	Miren
00050000-5592-888b-7980-ffdad898b987	8233	Mirna
00050000-5592-888b-1db4-42538dc67dc3	8216	Mirna Peč
00050000-5592-888b-9daf-c11e32afae92	2382	Mislinja
00050000-5592-888b-64b6-b8a3dba59aff	4281	Mojstrana
00050000-5592-888b-31ad-7769e0efee50	8230	Mokronog
00050000-5592-888b-bf75-6d681cccb541	1251	Moravče
00050000-5592-888b-7996-2549ef021075	9226	Moravske Toplice
00050000-5592-888b-0e9f-f2733b7f8ecb	5216	Most na Soči
00050000-5592-888b-ceda-01c6fca8c558	1221	Motnik
00050000-5592-888b-a30d-0bb4d40f8895	3330	Mozirje
00050000-5592-888b-28b4-fbba62c295a6	9000	Murska Sobota 
00050000-5592-888b-6ae0-6ff1ef66b063	9001	Murska Sobota - poštni predali
00050000-5592-888b-0e00-b9e1383c57ad	2366	Muta
00050000-5592-888b-7210-cd6eb6b5ebcd	4202	Naklo
00050000-5592-888b-3824-6c0fd1fe51eb	3331	Nazarje
00050000-5592-888b-0661-33047f700292	1357	Notranje Gorice
00050000-5592-888b-cf07-5c732dae0502	3203	Nova Cerkev
00050000-5592-888b-97fd-1b2d61862180	5000	Nova Gorica 
00050000-5592-888b-a016-53a9405e3672	5001	Nova Gorica - poštni predali
00050000-5592-888b-e723-0049996d2bbf	1385	Nova vas
00050000-5592-888b-c269-bebe552d83a8	8000	Novo mesto
00050000-5592-888b-7624-b9a789a79edf	8001	Novo mesto - poštni predali
00050000-5592-888b-6136-b6d49bae3d68	6243	Obrov
00050000-5592-888b-d7c8-87e410cf1a86	9233	Odranci
00050000-5592-888b-85a0-5ed55a93a004	2317	Oplotnica
00050000-5592-888b-cb47-86907fd3a8cf	2312	Orehova vas
00050000-5592-888b-9a6b-98e8e8918b05	2270	Ormož
00050000-5592-888b-b70a-e86c0c58dc00	1316	Ortnek
00050000-5592-888b-90af-8e60df806664	1337	Osilnica
00050000-5592-888b-1c83-b69d21cb4140	8222	Otočec
00050000-5592-888b-ca95-aa2b7927ea78	2361	Ožbalt
00050000-5592-888b-ca98-7f43deb552a0	2231	Pernica
00050000-5592-888b-adfd-db77accdd56f	2211	Pesnica pri Mariboru
00050000-5592-888b-eec8-a269218ed24b	9203	Petrovci
00050000-5592-888b-ddb8-53fb7b845d55	3301	Petrovče
00050000-5592-888b-ff55-556830d5a070	6330	Piran/Pirano
00050000-5592-888b-16f0-fdd6f7d2e473	8255	Pišece
00050000-5592-888b-f6c2-213ce0ee1a95	6257	Pivka
00050000-5592-888b-9cd4-785fe5e3a25e	6232	Planina
00050000-5592-888b-174f-8c7f6f8b4e35	3225	Planina pri Sevnici
00050000-5592-888b-0e29-b4a3d310f4a7	6276	Pobegi
00050000-5592-888b-c059-03a2e2228a9f	8312	Podbočje
00050000-5592-888b-9e74-47f39b247a5f	5243	Podbrdo
00050000-5592-888b-1541-c8eb41d22800	3254	Podčetrtek
00050000-5592-888b-5a00-5187bca6a854	2273	Podgorci
00050000-5592-888b-6d75-6664e8dbc15c	6216	Podgorje
00050000-5592-888b-2974-e7ae51166a72	2381	Podgorje pri Slovenj Gradcu
00050000-5592-888b-e1e8-f3d5250e7e7e	6244	Podgrad
00050000-5592-888b-560a-ee7eff64029b	1414	Podkum
00050000-5592-888b-4968-45b90dbfb161	2286	Podlehnik
00050000-5592-888b-c9f5-db17975f2792	5272	Podnanos
00050000-5592-888b-6dd7-c1fc10db4a6b	4244	Podnart
00050000-5592-888b-198d-0db0e5544f30	3241	Podplat
00050000-5592-888b-a84b-1dbf58dfb3f9	3257	Podsreda
00050000-5592-888b-5e53-b43cebc5dd13	2363	Podvelka
00050000-5592-888b-17bb-584239cf497b	2208	Pohorje
00050000-5592-888b-12ff-d1918396fc32	2257	Polenšak
00050000-5592-888b-3166-951cbaceb680	1355	Polhov Gradec
00050000-5592-888b-337d-15c203b6efe5	4223	Poljane nad Škofjo Loko
00050000-5592-888b-6bad-bdc5d83bafba	2319	Poljčane
00050000-5592-888b-0d90-50263ce271e7	1272	Polšnik
00050000-5592-888b-af74-37bb1b38f52a	3313	Polzela
00050000-5592-888b-5fe8-1a5fd54442eb	3232	Ponikva
00050000-5592-888b-7932-e09432e47d25	6320	Portorož/Portorose
00050000-5592-888b-093f-f02cc4f884a7	6230	Postojna
00050000-5592-888b-0e68-ac8d08252289	2331	Pragersko
00050000-5592-888b-f2b5-fba0f24be8f1	3312	Prebold
00050000-5592-888b-e000-2c61180fe2ae	4205	Preddvor
00050000-5592-888b-50ea-7781c223192c	6255	Prem
00050000-5592-888b-ad4c-ce00bd495601	1352	Preserje
00050000-5592-888b-d22b-d9016b220f30	6258	Prestranek
00050000-5592-888b-8f71-8bcad7ee561b	2391	Prevalje
00050000-5592-888b-8041-0abcec050783	3262	Prevorje
00050000-5592-888b-0bea-91207f0545ea	1276	Primskovo 
00050000-5592-888b-3fb5-8cb3046ab5a3	3253	Pristava pri Mestinju
00050000-5592-888b-57a7-3178055ef1e6	9207	Prosenjakovci/Partosfalva
00050000-5592-888b-2b38-71e86fa3894c	5297	Prvačina
00050000-5592-888b-7739-2800a7a25023	2250	Ptuj
00050000-5592-888b-e556-8fa10f25fca6	2323	Ptujska Gora
00050000-5592-888b-b3e4-ac394c159c31	9201	Puconci
00050000-5592-888b-5833-9eafe48974cc	2327	Rače
00050000-5592-888b-fcaa-ed808ee51f97	1433	Radeče
00050000-5592-888b-991a-286cd0c61fd0	9252	Radenci
00050000-5592-888b-951c-c28c591009ff	2360	Radlje ob Dravi
00050000-5592-888b-f28c-6882eca8d200	1235	Radomlje
00050000-5592-888b-40fb-bc4a0e79f0b3	4240	Radovljica
00050000-5592-888b-5a98-b7cde81f418c	8274	Raka
00050000-5592-888b-b93e-1a15557b756f	1381	Rakek
00050000-5592-888b-026b-7f67cd422945	4283	Rateče - Planica
00050000-5592-888b-f1fd-2d0ed7f76d1d	2390	Ravne na Koroškem
00050000-5592-888b-bec1-2e244c539abc	9246	Razkrižje
00050000-5592-888b-e23b-61da710184d7	3332	Rečica ob Savinji
00050000-5592-888b-8bbd-f7d01f79cbdf	5292	Renče
00050000-5592-888b-f2df-c516607139c4	1310	Ribnica
00050000-5592-888b-7e10-02be1ccfac4c	2364	Ribnica na Pohorju
00050000-5592-888b-5890-4ea219e26ff2	3272	Rimske Toplice
00050000-5592-888b-c4e5-050b7acca736	1314	Rob
00050000-5592-888b-2f88-cf779de4ac98	5215	Ročinj
00050000-5592-888b-98d3-87e0b8c06573	3250	Rogaška Slatina
00050000-5592-888b-89db-ef12bd5a80b5	9262	Rogašovci
00050000-5592-888b-adb6-d382810e8fd7	3252	Rogatec
00050000-5592-888b-d096-273b8b514caa	1373	Rovte
00050000-5592-888b-903d-167ffb5c2aea	2342	Ruše
00050000-5592-888b-35d2-4c6f5a5bad42	1282	Sava
00050000-5592-888b-e0f0-b66e48ea29f7	6333	Sečovlje/Sicciole
00050000-5592-888b-6731-e80e6252c185	4227	Selca
00050000-5592-888b-1322-259b0d24be5d	2352	Selnica ob Dravi
00050000-5592-888b-7875-3256745b2e85	8333	Semič
00050000-5592-888b-a603-a8007a885b49	8281	Senovo
00050000-5592-888b-bc3d-403cf91fd990	6224	Senožeče
00050000-5592-888b-f377-fe72fbb39552	8290	Sevnica
00050000-5592-888b-716e-6ce645f84dfb	6210	Sežana
00050000-5592-888b-a78b-4b4878b50c4a	2214	Sladki Vrh
00050000-5592-888b-4ae2-8e7cfb48c41e	5283	Slap ob Idrijci
00050000-5592-888b-94f8-b83140a32458	2380	Slovenj Gradec
00050000-5592-888b-cccd-391eda749000	2310	Slovenska Bistrica
00050000-5592-888b-9512-ea356783647f	3210	Slovenske Konjice
00050000-5592-888b-6301-506607abe52d	1216	Smlednik
00050000-5592-888b-b203-04908228fef3	5232	Soča
00050000-5592-888b-ae67-eb5e202d0a3c	1317	Sodražica
00050000-5592-888b-535e-1a34229ee4a0	3335	Solčava
00050000-5592-888b-ee2c-b56abae33800	5250	Solkan
00050000-5592-888b-7f41-536660338ab2	4229	Sorica
00050000-5592-888b-7c59-bda48f1bab0d	4225	Sovodenj
00050000-5592-888b-9072-127616bd4a51	5281	Spodnja Idrija
00050000-5592-888b-9f66-af58f6ae29d6	2241	Spodnji Duplek
00050000-5592-888b-5468-254b1a43fc4f	9245	Spodnji Ivanjci
00050000-5592-888b-7a66-488de5d75876	2277	Središče ob Dravi
00050000-5592-888b-04fa-2dac645c8ce6	4267	Srednja vas v Bohinju
00050000-5592-888b-011c-5090b45ebffd	8256	Sromlje 
00050000-5592-888b-8409-51f56fe68dee	5224	Srpenica
00050000-5592-888b-8b6c-22a6a561a6b7	1242	Stahovica
00050000-5592-888b-28f8-69c82aac0bf5	1332	Stara Cerkev
00050000-5592-888b-53ee-0ab5c8683fc4	8342	Stari trg ob Kolpi
00050000-5592-888b-c7f3-91411d75a5ce	1386	Stari trg pri Ložu
00050000-5592-888b-b25c-f28fa648f0b4	2205	Starše
00050000-5592-888b-f1a6-d4f98a6dc50d	2289	Stoperce
00050000-5592-888b-daf0-29ab28a2f12f	8322	Stopiče
00050000-5592-888b-f86d-46a5ca080a4a	3206	Stranice
00050000-5592-888b-ade8-147041f71b3f	8351	Straža
00050000-5592-888b-4d00-92e7b2889dfd	1313	Struge
00050000-5592-888b-80d7-44827a7659ed	8293	Studenec
00050000-5592-888b-1069-edf8ac3178f0	8331	Suhor
00050000-5592-888b-43be-6979c0228ea8	2233	Sv. Ana v Slovenskih goricah
00050000-5592-888b-71a5-f8634f86eb09	2235	Sv. Trojica v Slovenskih goricah
00050000-5592-888b-d096-1fe37ffcc4ab	2353	Sveti Duh na Ostrem Vrhu
00050000-5592-888b-2fbf-cad260555116	9244	Sveti Jurij ob Ščavnici
00050000-5592-888b-da88-7b2ed3e33069	3264	Sveti Štefan
00050000-5592-888b-1179-2993fdac8f01	2258	Sveti Tomaž
00050000-5592-888b-6bf2-7405b9386525	9204	Šalovci
00050000-5592-888b-ad57-e5ef647f789a	5261	Šempas
00050000-5592-888b-2c24-5862481b6de2	5290	Šempeter pri Gorici
00050000-5592-888b-b6f9-b163f2aa9d06	3311	Šempeter v Savinjski dolini
00050000-5592-888b-8671-fc6d5567ae69	4208	Šenčur
00050000-5592-888b-1adc-9c52c3a59c6b	2212	Šentilj v Slovenskih goricah
00050000-5592-888b-808d-fb39fe1cbb49	8297	Šentjanž
00050000-5592-888b-fce0-e88df4ed15e0	2373	Šentjanž pri Dravogradu
00050000-5592-888b-8354-bb33baf2f059	8310	Šentjernej
00050000-5592-888b-79f8-870b3aafadd1	3230	Šentjur
00050000-5592-888b-d7d7-75c575da258d	3271	Šentrupert
00050000-5592-888b-878b-2daa6b53bc65	8232	Šentrupert
00050000-5592-888b-19f4-1097febc1d94	1296	Šentvid pri Stični
00050000-5592-888b-7cc9-2781986fcc5d	8275	Škocjan
00050000-5592-888b-5c8f-c7e269448149	6281	Škofije
00050000-5592-888b-5d34-504aed4ec544	4220	Škofja Loka
00050000-5592-888b-16ab-143b71e549a9	3211	Škofja vas
00050000-5592-888b-9181-9618783b0cab	1291	Škofljica
00050000-5592-888b-b4e2-811f5046509e	6274	Šmarje
00050000-5592-888b-add8-7391541afdac	1293	Šmarje - Sap
00050000-5592-888b-c88c-f20923196ee4	3240	Šmarje pri Jelšah
00050000-5592-888b-8f0a-9e63225b2912	8220	Šmarješke Toplice
00050000-5592-888b-efbd-cf36d6b2a07e	2315	Šmartno na Pohorju
00050000-5592-888b-ab9a-059614f0d5d9	3341	Šmartno ob Dreti
00050000-5592-888b-2102-f4328065d35f	3327	Šmartno ob Paki
00050000-5592-888b-23b1-5e8d2fcc9d28	1275	Šmartno pri Litiji
00050000-5592-888b-ab6c-43a1b4fa2428	2383	Šmartno pri Slovenj Gradcu
00050000-5592-888b-4ffa-0e69d60353d4	3201	Šmartno v Rožni dolini
00050000-5592-888b-496b-9ac2e726dbe3	3325	Šoštanj
00050000-5592-888b-4ed5-1bfb91194f6c	6222	Štanjel
00050000-5592-888b-3c51-418796ec8bb6	3220	Štore
00050000-5592-888b-2640-542dcc81c043	3304	Tabor
00050000-5592-888b-b0f9-e547bbcac9cf	3221	Teharje
00050000-5592-888b-99a6-df0e420edea0	9251	Tišina
00050000-5592-888b-b139-b0888059dc1d	5220	Tolmin
00050000-5592-888b-5650-8c14675f6b59	3326	Topolšica
00050000-5592-888b-5598-1d0beffe5b02	2371	Trbonje
00050000-5592-888b-0075-45b4acbca769	1420	Trbovlje
00050000-5592-888b-d0b9-e4384930812c	8231	Trebelno 
00050000-5592-888b-06dc-6f1a7f514ceb	8210	Trebnje
00050000-5592-888b-8229-c404850191d1	5252	Trnovo pri Gorici
00050000-5592-888b-8fd9-dff71acd67bb	2254	Trnovska vas
00050000-5592-888b-35aa-fb5467cacca9	1222	Trojane
00050000-5592-888b-7acf-d259a2e42b3f	1236	Trzin
00050000-5592-888b-2c40-69ccbeab855b	4290	Tržič
00050000-5592-888b-7f8e-d03d7a777d15	8295	Tržišče
00050000-5592-888b-2cb7-dd3427c3f6c1	1311	Turjak
00050000-5592-888b-ccd5-9a2a62d85675	9224	Turnišče
00050000-5592-888b-6010-5f2e5c8a3835	8323	Uršna sela
00050000-5592-888b-73da-27d7d846b34e	1252	Vače
00050000-5592-888b-d6f3-29fad9808f98	3320	Velenje 
00050000-5592-888b-2b58-90dcaee48d7a	3322	Velenje - poštni predali
00050000-5592-888b-af3c-0563a5707986	8212	Velika Loka
00050000-5592-888b-efc6-48928a629f0a	2274	Velika Nedelja
00050000-5592-888b-fc21-ad12de30d9f1	9225	Velika Polana
00050000-5592-888b-e0e3-96e0467fe15c	1315	Velike Lašče
00050000-5592-888b-7be8-1df81152cfd1	8213	Veliki Gaber
00050000-5592-888b-2f39-e3de122978e5	9241	Veržej
00050000-5592-888b-a523-07c770613c0e	1312	Videm - Dobrepolje
00050000-5592-888b-f803-f3101ad0abfb	2284	Videm pri Ptuju
00050000-5592-888b-b181-45fdef4d63df	8344	Vinica
00050000-5592-888b-0168-9ea25eb922f0	5271	Vipava
00050000-5592-888b-20f2-b49fcd9be344	4212	Visoko
00050000-5592-888b-1317-6f9f4355203f	1294	Višnja Gora
00050000-5592-888b-3352-cf65bd012ed1	3205	Vitanje
00050000-5592-888b-4db7-e8f10cd5ea2a	2255	Vitomarci
00050000-5592-888b-9bf2-8d7b5719f60a	1217	Vodice
00050000-5592-888b-79ce-9195ae16f556	3212	Vojnik\t
00050000-5592-888b-3751-6a7ecbf84d90	5293	Volčja Draga
00050000-5592-888b-8888-b53806ea4847	2232	Voličina
00050000-5592-888b-8cf7-e5e00064663a	3305	Vransko
00050000-5592-888b-54fa-1e750820bfcc	6217	Vremski Britof
00050000-5592-888b-7573-bd5426c519af	1360	Vrhnika
00050000-5592-888b-6ee4-462cac70d67c	2365	Vuhred
00050000-5592-888b-cd09-22d6c41f5e4a	2367	Vuzenica
00050000-5592-888b-fc0d-f97a92b5cca8	8292	Zabukovje 
00050000-5592-888b-58eb-2deaebdc9b2f	1410	Zagorje ob Savi
00050000-5592-888b-f085-bdced14f7475	1303	Zagradec
00050000-5592-888b-c742-8c5631308cb2	2283	Zavrč
00050000-5592-888b-88c8-2b800603e89a	8272	Zdole 
00050000-5592-888b-1088-b44c4a05603b	4201	Zgornja Besnica
00050000-5592-888b-74b7-55708ec0e5b3	2242	Zgornja Korena
00050000-5592-888b-e8a9-82f01c85935c	2201	Zgornja Kungota
00050000-5592-888b-ebfd-008f30f60c04	2316	Zgornja Ložnica
00050000-5592-888b-e1b5-345969c93fed	2314	Zgornja Polskava
00050000-5592-888b-c3dc-6d69236d72f1	2213	Zgornja Velka
00050000-5592-888b-8249-d79c55a6ed14	4247	Zgornje Gorje
00050000-5592-888b-3691-e3ceea96b549	4206	Zgornje Jezersko
00050000-5592-888b-1aec-86ecb572bcb2	2285	Zgornji Leskovec
00050000-5592-888b-187b-d7ef128a3efa	1432	Zidani Most
00050000-5592-888b-4eae-33f3177eec45	3214	Zreče
00050000-5592-888b-9c00-f506a60374d2	4209	Žabnica
00050000-5592-888b-4760-955c5aef88a6	3310	Žalec
00050000-5592-888b-291f-cd6688feebeb	4228	Železniki
00050000-5592-888b-26f4-e7e9caa3c309	2287	Žetale
00050000-5592-888b-2861-495a38ae451d	4226	Žiri
00050000-5592-888b-447e-be93f72eca8b	4274	Žirovnica
00050000-5592-888b-1360-1b753217aa8d	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8571982)
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
-- TOC entry 2859 (class 0 OID 8571793)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8571871)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8571994)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8572114)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8572163)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5592-888c-297b-cadc7f5c2897	00080000-5592-888c-4753-cf07149d443e	0900	AK
00190000-5592-888c-5759-0a257d97b423	00080000-5592-888c-93a6-9150d26c633d	0987	A
00190000-5592-888c-2c56-d42cc11911b4	00080000-5592-888c-0fde-0b73f0be2287	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8572297)
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
-- TOC entry 2883 (class 0 OID 8572023)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5592-888c-a06c-c9c4a5e774b2	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5592-888c-affd-789ddf8f6958	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5592-888c-9ac9-3da257ee63a1	0003	Kazinska	t	84	Kazinska dvorana
00220000-5592-888c-9891-75c9a7bfb5ff	0004	Mali oder	t	24	Mali oder 
00220000-5592-888c-436c-147120a5f38f	0005	Komorni oder	t	15	Komorni oder
00220000-5592-888c-b425-88ad618767c9	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5592-888c-dd2d-d47ec18391ba	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8571967)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8571957)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8572152)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8572091)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8571665)
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
-- TOC entry 2884 (class 0 OID 8572033)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8571703)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5592-888a-f64e-63445a3244e7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5592-888a-d0e5-45dbbb1bc523	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5592-888a-d69d-331d3e416ed3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5592-888a-6ed0-482135057e09	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5592-888a-7863-a0d18472f470	planer	Planer dogodkov v koledarju	t
00020000-5592-888a-9392-054d08ea9ba2	kadrovska	Kadrovska služba	t
00020000-5592-888a-8e7a-9c145623f2eb	arhivar	Ažuriranje arhivalij	t
00020000-5592-888a-50c5-67031a50e565	igralec	Igralec	t
00020000-5592-888a-fbc6-b7b41a1e36c4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5592-888c-00d7-44f95a186603	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8571687)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5592-888b-b2d8-a1ebca202296	00020000-5592-888a-d69d-331d3e416ed3
00010000-5592-888b-6d0c-f238219f99ff	00020000-5592-888a-d69d-331d3e416ed3
00010000-5592-888c-d3d7-ff7071ca450d	00020000-5592-888c-00d7-44f95a186603
\.


--
-- TOC entry 2886 (class 0 OID 8572047)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8571988)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8571938)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8572347)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5592-888b-7e4c-99615e1c3ffc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5592-888b-ff37-f5927ed78679	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5592-888b-fa69-01595b6e9d71	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5592-888b-3416-fb8668a46926	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5592-888b-915d-6b1896ab221c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8572339)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5592-888b-e00e-ec98f1772631	00230000-5592-888b-3416-fb8668a46926	popa
00240000-5592-888b-f167-8182b9fa59a4	00230000-5592-888b-3416-fb8668a46926	oseba
00240000-5592-888b-3707-6eb60e20c940	00230000-5592-888b-ff37-f5927ed78679	prostor
00240000-5592-888b-7104-1264fabf711b	00230000-5592-888b-3416-fb8668a46926	besedilo
00240000-5592-888b-838a-5f710a189f71	00230000-5592-888b-3416-fb8668a46926	uprizoritev
00240000-5592-888b-fa4d-f22217ebfd64	00230000-5592-888b-3416-fb8668a46926	funkcija
00240000-5592-888b-01e2-1e80a48f2f2b	00230000-5592-888b-3416-fb8668a46926	tipfunkcije
00240000-5592-888b-2e2a-b08df77d0f08	00230000-5592-888b-3416-fb8668a46926	alternacija
00240000-5592-888b-eaa4-6f9b59c4acd4	00230000-5592-888b-7e4c-99615e1c3ffc	pogodba
00240000-5592-888b-6afe-a80d745e4f9e	00230000-5592-888b-3416-fb8668a46926	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8572334)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8572101)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5592-888c-091b-352893c01cca	000e0000-5592-888c-689c-5af9ca849f73	00080000-5592-888c-d860-682b11ef8a82	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5592-888c-5f6b-03fd60e3c71a	000e0000-5592-888c-689c-5af9ca849f73	00080000-5592-888c-d860-682b11ef8a82	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5592-888c-20b7-646913075115	000e0000-5592-888c-689c-5af9ca849f73	00080000-5592-888c-bac4-cfaa79b66189	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8571765)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8571944)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5592-888c-a530-fbf063d0a39d	00180000-5592-888c-2211-b9c07db1b564	000c0000-5592-888c-e21d-6d3a2f9a227b	00090000-5592-888c-31fe-74f99e3395f0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-888c-4c93-57d4fd18ba7b	00180000-5592-888c-2211-b9c07db1b564	000c0000-5592-888c-678b-2a7279db125c	00090000-5592-888c-6cf3-1f9b9f6eeaef	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-888c-e3ff-6e97c639041d	00180000-5592-888c-2211-b9c07db1b564	000c0000-5592-888c-97b3-b0b612fa2b56	00090000-5592-888c-fe2c-21da305af854	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-888c-4c45-e4a1b814c82a	00180000-5592-888c-2211-b9c07db1b564	000c0000-5592-888c-7cb1-479bac466924	00090000-5592-888c-1695-9c78c14d1a6e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-888c-74b2-4bc4b658c3dd	00180000-5592-888c-2211-b9c07db1b564	000c0000-5592-888c-c807-378965610cf5	00090000-5592-888c-8443-ece0909fa91a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-888c-b73d-c91302143ae2	00180000-5592-888c-0be5-cd72e7979f1d	\N	00090000-5592-888c-8443-ece0909fa91a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8572141)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5592-888b-11d9-75f8cdefd1dc	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5592-888b-16eb-337208571fd2	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5592-888b-9ff9-a5b5dcbcca65	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5592-888b-3d92-d341f03d4fed	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5592-888b-4279-67402f55998f	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5592-888b-c3e1-ad5be447c6e9	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5592-888b-7bee-2ee4f15e57c4	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5592-888b-d908-a31574d3afda	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5592-888b-ec74-6f41628673db	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5592-888b-86c6-1c4bf4f007bc	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5592-888b-5e73-a20ecaa66eba	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5592-888b-0acc-f7163a20308d	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5592-888b-37a0-eceb649f1d29	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5592-888b-a013-b6f41c4f9ca3	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5592-888b-a846-c71d781fef65	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5592-888b-bad7-d1015ad89952	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8572316)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5592-888b-c0bc-aac9f7537cb0	01	Velika predstava	f	1.00	1.00
002b0000-5592-888b-9ba7-e8ab554c112d	02	Mala predstava	f	0.50	0.50
002b0000-5592-888b-6d11-47fc14f2fff0	03	Mala koprodukcija	t	0.40	1.00
002b0000-5592-888b-6d4c-dccd9b11bda0	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5592-888b-f70e-a2f6e8ccc1aa	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8571828)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8571674)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5592-888b-6d0c-f238219f99ff	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROa0xY2OTtSTmYNAgF2g8w3cdnr4szVHu	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5592-888c-97c2-de033bfb0ac2	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5592-888c-5fac-6eb923f02213	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5592-888c-8e91-3e09c2b7f1e4	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5592-888c-46d0-e5add164fbb3	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5592-888c-3abe-3a5190a42398	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5592-888c-01ff-e9cf2c03730e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5592-888c-b6ba-8fbbaac3092a	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5592-888c-9f05-5edde0cf7195	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5592-888c-0c5f-543201e4edce	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5592-888c-d3d7-ff7071ca450d	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5592-888b-b2d8-a1ebca202296	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8572198)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5592-888c-aa45-8f6a8878af36	00160000-5592-888c-502a-8dbc5ec287e6	00150000-5592-888b-6e3b-80e67aa0037a	00140000-5592-888a-87b9-6c0aa3d14540	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5592-888c-436c-147120a5f38f
000e0000-5592-888c-689c-5af9ca849f73	00160000-5592-888c-e3dd-e3b0f67f4b30	00150000-5592-888b-d0ca-9e4b924749e2	00140000-5592-888a-15e5-4612e3b12db8	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5592-888c-b425-88ad618767c9
000e0000-5592-888c-9ca5-cca961c42cd6	\N	00150000-5592-888b-d0ca-9e4b924749e2	00140000-5592-888a-15e5-4612e3b12db8	00190000-5592-888c-5759-0a257d97b423	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5592-888c-436c-147120a5f38f
000e0000-5592-888c-a018-62145c680b98	\N	00150000-5592-888b-d0ca-9e4b924749e2	00140000-5592-888a-15e5-4612e3b12db8	00190000-5592-888c-5759-0a257d97b423	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5592-888c-436c-147120a5f38f
000e0000-5592-888c-d447-acec05c48df0	\N	00150000-5592-888b-d0ca-9e4b924749e2	00140000-5592-888a-15e5-4612e3b12db8	00190000-5592-888c-5759-0a257d97b423	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5592-888c-a06c-c9c4a5e774b2
\.


--
-- TOC entry 2867 (class 0 OID 8571890)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5592-888c-b404-0f8390280677	000e0000-5592-888c-689c-5af9ca849f73	1	
00200000-5592-888c-ea29-24a39309205d	000e0000-5592-888c-689c-5af9ca849f73	2	
\.


--
-- TOC entry 2882 (class 0 OID 8572015)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8572084)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8571922)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8572188)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5592-888a-87b9-6c0aa3d14540	01	Drama	drama (SURS 01)
00140000-5592-888a-b347-f1c325d7b61f	02	Opera	opera (SURS 02)
00140000-5592-888a-d6d6-80623f0d0664	03	Balet	balet (SURS 03)
00140000-5592-888a-5d90-7cf171b7a871	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5592-888a-cca9-3af429dcbfa5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5592-888a-15e5-4612e3b12db8	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5592-888a-bc72-b4cce41d41b0	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8572074)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5592-888b-3ed9-64ba674bb795	01	Opera	opera
00150000-5592-888b-f422-eff62f6ce2f9	02	Opereta	opereta
00150000-5592-888b-36e1-f9c93c8bea46	03	Balet	balet
00150000-5592-888b-a41f-08c4f810a64d	04	Plesne prireditve	plesne prireditve
00150000-5592-888b-48fa-18e378b8b6b6	05	Lutkovno gledališče	lutkovno gledališče
00150000-5592-888b-d657-e555ea7c4d25	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5592-888b-441a-e165478dec3f	07	Biografska drama	biografska drama
00150000-5592-888b-6e3b-80e67aa0037a	08	Komedija	komedija
00150000-5592-888b-dcd7-6ef5e9686053	09	Črna komedija	črna komedija
00150000-5592-888b-1656-5ecb0eac2e71	10	E-igra	E-igra
00150000-5592-888b-d0ca-9e4b924749e2	11	Kriminalka	kriminalka
00150000-5592-888b-435e-9d1473591f92	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8571728)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8572245)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8572235)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8572140)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8571912)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8571937)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8572332)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8571854)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8572292)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8572070)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8571888)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8571931)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8571868)
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
-- TOC entry 2533 (class 2606 OID 8571980)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8572007)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8571826)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8571737)
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
-- TOC entry 2448 (class 2606 OID 8571761)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8571717)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8571702)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8572013)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8572046)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8572183)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8571790)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8571814)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8571986)
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
-- TOC entry 2463 (class 2606 OID 8571804)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8571875)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8571998)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8572122)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8572168)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8572314)
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
-- TOC entry 2553 (class 2606 OID 8572030)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8571971)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8571962)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8572162)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8572098)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8571673)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8572037)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8571691)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8571711)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8572055)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8571993)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8571943)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8572356)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8572344)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8572338)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8572111)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8571770)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8571953)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8572151)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8572326)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8571839)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8571686)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8572214)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8571897)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8572021)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8572089)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8571926)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8572196)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8572082)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8571919)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8572112)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8572113)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8571792)
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
-- TOC entry 2546 (class 1259 OID 8572014)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8572000)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8571999)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8571898)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8572071)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8572073)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8572072)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8571870)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8571869)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8572185)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8572186)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8572187)
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
-- TOC entry 2608 (class 1259 OID 8572219)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8572216)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8572220)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8572218)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8572217)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8571841)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8571840)
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
-- TOC entry 2446 (class 1259 OID 8571764)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8572038)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8571932)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8571718)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8571719)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8572058)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8572057)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8572056)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8571876)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8571878)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8571877)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8572346)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8571966)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8571964)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8571963)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8571965)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8571692)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8571693)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8572022)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8571987)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8572099)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8572100)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8572296)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8572293)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8572294)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8572295)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8571806)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8571805)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8571807)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8572123)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8572124)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8572249)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8572250)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8572247)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8572248)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8572090)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8571975)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8571974)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8571972)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8571973)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8572237)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8572236)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8572315)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8571889)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8572333)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8571739)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8571738)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8571771)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8571772)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8571956)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8571955)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8571954)
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
-- TOC entry 2498 (class 1259 OID 8571921)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8571917)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8571914)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8571915)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8571913)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8571918)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8571916)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8571791)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8571855)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8571857)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8571856)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8571858)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8571981)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8572184)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8572215)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8571762)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8571763)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8572083)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8572357)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8571827)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8572345)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8572032)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8572031)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8572246)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8571815)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8572197)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8572169)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8572170)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8571712)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8571920)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8572493)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8572478)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8572483)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8572503)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8572473)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8572498)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8572488)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8572648)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8572653)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8572408)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8572588)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8572583)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8572578)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8572468)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8572618)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8572628)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8572623)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8572443)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8572438)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8572568)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8572673)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8572678)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8572683)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8572703)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8572688)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8572708)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8572698)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8572693)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8572433)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8572428)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8572393)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8572388)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8572598)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8572508)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8572368)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8572373)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8572613)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8572608)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8572603)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8572448)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8572458)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8572453)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8572773)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8572543)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8572533)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8572528)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8572538)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8572358)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8572363)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8572593)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8572573)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8572638)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8572643)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8572758)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8572743)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8572748)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8572753)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8572418)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8572413)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8572423)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8572658)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8572663)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8572733)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8572738)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8572723)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8572728)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8572633)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8572563)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8572558)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8572548)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8572553)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8572718)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8572713)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8572763)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8572463)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8572668)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8572768)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8572383)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8572378)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8572398)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8572403)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8572523)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8572518)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8572513)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-30 14:16:13 CEST

--
-- PostgreSQL database dump complete
--

