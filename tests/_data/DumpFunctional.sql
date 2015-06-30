--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-06-30 16:38:47 CEST

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
-- TOC entry 183 (class 1259 OID 8591287)
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
-- TOC entry 230 (class 1259 OID 8591805)
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
-- TOC entry 229 (class 1259 OID 8591788)
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
-- TOC entry 222 (class 1259 OID 8591692)
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
-- TOC entry 197 (class 1259 OID 8591466)
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
-- TOC entry 200 (class 1259 OID 8591500)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8591894)
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
-- TOC entry 192 (class 1259 OID 8591409)
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
-- TOC entry 231 (class 1259 OID 8591818)
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
-- TOC entry 216 (class 1259 OID 8591626)
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
-- TOC entry 195 (class 1259 OID 8591446)
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
-- TOC entry 199 (class 1259 OID 8591494)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8591426)
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
-- TOC entry 205 (class 1259 OID 8591543)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8591568)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8591383)
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
-- TOC entry 184 (class 1259 OID 8591296)
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
-- TOC entry 185 (class 1259 OID 8591307)
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
-- TOC entry 180 (class 1259 OID 8591261)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8591280)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8591575)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8591606)
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
-- TOC entry 226 (class 1259 OID 8591738)
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
-- TOC entry 187 (class 1259 OID 8591340)
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
-- TOC entry 189 (class 1259 OID 8591375)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8591549)
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
-- TOC entry 188 (class 1259 OID 8591360)
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
-- TOC entry 194 (class 1259 OID 8591438)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8591561)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8591681)
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
-- TOC entry 225 (class 1259 OID 8591730)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8591864)
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
-- TOC entry 212 (class 1259 OID 8591590)
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
-- TOC entry 204 (class 1259 OID 8591534)
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
-- TOC entry 203 (class 1259 OID 8591524)
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
-- TOC entry 224 (class 1259 OID 8591719)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8591658)
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
-- TOC entry 177 (class 1259 OID 8591232)
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
-- TOC entry 176 (class 1259 OID 8591230)
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
-- TOC entry 213 (class 1259 OID 8591600)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8591270)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8591254)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8591614)
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
-- TOC entry 207 (class 1259 OID 8591555)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8591505)
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
-- TOC entry 237 (class 1259 OID 8591914)
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
-- TOC entry 236 (class 1259 OID 8591906)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8591901)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8591668)
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
-- TOC entry 186 (class 1259 OID 8591332)
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
-- TOC entry 202 (class 1259 OID 8591511)
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
-- TOC entry 223 (class 1259 OID 8591708)
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
-- TOC entry 233 (class 1259 OID 8591883)
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
-- TOC entry 191 (class 1259 OID 8591395)
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
-- TOC entry 178 (class 1259 OID 8591241)
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
-- TOC entry 228 (class 1259 OID 8591765)
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
-- TOC entry 196 (class 1259 OID 8591457)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8591582)
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
-- TOC entry 218 (class 1259 OID 8591651)
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
-- TOC entry 198 (class 1259 OID 8591489)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8591755)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8591641)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8591235)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8591287)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8591805)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5592-a9f6-e1af-7039ca0d9d5c	000d0000-5592-a9f6-1f7e-c77d353b3666	\N	00090000-5592-a9f6-ce43-759a6c8f033e	000b0000-5592-a9f6-d065-eb37c95ff315	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-a9f6-1aa7-5aecf26cf3ca	000d0000-5592-a9f6-6ecf-100d60f5b927	\N	00090000-5592-a9f6-5b82-438b5b27f3d2	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-a9f6-44c9-15387612fc42	000d0000-5592-a9f6-3eb0-39a529f36348	\N	00090000-5592-a9f6-59d5-3b9eada60a5e	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-a9f6-9181-9dbf41decbb3	000d0000-5592-a9f6-a4c3-c09374766b9f	\N	00090000-5592-a9f6-f827-80f53169e19e	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-a9f6-14d4-56d582061b8e	000d0000-5592-a9f6-73ee-418526baec7c	\N	00090000-5592-a9f6-ca94-800001f08f73	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5592-a9f6-9159-ea2601dc510a	000d0000-5592-a9f6-029e-fc6268eef54c	\N	00090000-5592-a9f6-5b82-438b5b27f3d2	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8591788)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8591692)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5592-a9f6-ebf7-c2726998ee59	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5592-a9f6-931e-aed4638e3ffb	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5592-a9f6-8ead-cfb34ae9f04e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8591466)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5592-a9f6-60c0-28df46582025	\N	\N	00200000-5592-a9f6-f616-41d31b39ed9d	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5592-a9f6-19a1-3eca6765cf9e	\N	\N	00200000-5592-a9f6-6377-86708b001ec6	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5592-a9f6-992d-4ded8b9d293a	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5592-a9f6-7e91-3a50b425bf75	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5592-a9f6-0cf2-d8ac2d52b8d6	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8591500)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8591894)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8591409)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5592-a9f4-2bce-08a946344951	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5592-a9f4-1a2f-00114cb42504	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5592-a9f4-7c67-3706bdd20084	AL	ALB	008	Albania 	Albanija	\N
00040000-5592-a9f4-905b-149f5ca7214d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5592-a9f4-8655-b42efc807aa7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5592-a9f4-b5ba-fc3b35f12aa8	AD	AND	020	Andorra 	Andora	\N
00040000-5592-a9f4-3c65-c6e39e8f30f7	AO	AGO	024	Angola 	Angola	\N
00040000-5592-a9f4-ffaf-809181d2e31e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5592-a9f4-f946-be03245ca355	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5592-a9f4-41b5-4b2a5dd83bb5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-a9f4-9611-d5ff24ffdabf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5592-a9f4-5ba8-3c1e24f38400	AM	ARM	051	Armenia 	Armenija	\N
00040000-5592-a9f4-fa12-bf3ab0d47d5d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5592-a9f4-a087-1da90592e183	AU	AUS	036	Australia 	Avstralija	\N
00040000-5592-a9f4-d17f-d1bc8ff98a3e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5592-a9f4-03de-632cac5bdcaf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5592-a9f4-bf23-0933b98085ac	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5592-a9f4-ecaa-381a1b4c0a6e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5592-a9f4-1abc-bb2b899fde6d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5592-a9f4-ba6e-97446fa9936b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5592-a9f4-ae02-a6f451787789	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5592-a9f4-4641-8f8ec447df74	BE	BEL	056	Belgium 	Belgija	\N
00040000-5592-a9f4-36fa-641788b88ada	BZ	BLZ	084	Belize 	Belize	\N
00040000-5592-a9f4-3bf7-4c1419531c8b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5592-a9f4-415d-f84494d65737	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5592-a9f4-cfff-45dee4184669	BT	BTN	064	Bhutan 	Butan	\N
00040000-5592-a9f4-97f3-0989549f3356	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5592-a9f4-e9c6-b9824ca2f997	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5592-a9f4-2d81-2c4dfa1e94c8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5592-a9f4-2a1c-4a068f0a9dd1	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5592-a9f4-7ccd-2858ff628edc	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5592-a9f4-0aa8-8cfb2276b3e7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5592-a9f4-6458-956ad42b1eb9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5592-a9f4-0a4b-6ce7638cbf17	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5592-a9f4-9444-6555ce63672d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5592-a9f4-7d0e-4efb94056eab	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5592-a9f4-5616-3543a0b2906c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5592-a9f4-e6c3-38c273627b54	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5592-a9f4-2464-b273ddcdb080	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5592-a9f4-0e49-31d1874d4dca	CA	CAN	124	Canada 	Kanada	\N
00040000-5592-a9f4-f500-51174e2afae0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5592-a9f4-d19d-7757ab7f2917	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5592-a9f4-39c3-0b611486d5dc	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5592-a9f4-af6f-38f95884099e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5592-a9f4-e773-8ede9b16dcaf	CL	CHL	152	Chile 	Čile	\N
00040000-5592-a9f4-4275-dd7650b1f8b4	CN	CHN	156	China 	Kitajska	\N
00040000-5592-a9f4-2a39-d479c000b20f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5592-a9f4-b3dc-6600d947ae35	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5592-a9f4-b358-57a02b03511b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5592-a9f4-b249-c2e8d834dd0e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5592-a9f4-e997-ccc5b328326d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5592-a9f4-668e-58de73316095	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5592-a9f4-ada9-8581973d4335	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5592-a9f4-1542-1565b889bbc1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5592-a9f4-b7cd-4529996e178a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5592-a9f4-2bbb-dfae5a8ab815	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5592-a9f4-1f03-6f6e6385a57e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5592-a9f4-6547-32ee3ecf38b2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5592-a9f4-a9d6-805b45930070	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5592-a9f4-bb3a-34e8ac954532	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5592-a9f4-4213-fb21ce6dcecf	DK	DNK	208	Denmark 	Danska	\N
00040000-5592-a9f4-f2a1-9b96b966310d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5592-a9f4-b75e-9c7596f1dc51	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5592-a9f4-e86b-b0f646c3ca3c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5592-a9f4-31b9-5531d97bb49e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5592-a9f4-a77a-22ddf3a3dcc0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5592-a9f4-4aef-6c572a04ae34	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5592-a9f4-d19b-df0ae0985d20	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5592-a9f4-2629-98a293ed8555	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5592-a9f4-9bd0-acc8ee266487	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5592-a9f4-eeaa-15f25530dd11	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5592-a9f4-b060-0730fe01b3de	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5592-a9f4-f8d0-9eb9272430d0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5592-a9f4-4242-4a1729a2f4d6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5592-a9f4-6bb1-598fbe032e9d	FI	FIN	246	Finland 	Finska	\N
00040000-5592-a9f4-988d-a4d11ba76a3e	FR	FRA	250	France 	Francija	\N
00040000-5592-a9f4-bc7c-72a2bdd3af3c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5592-a9f4-dff6-9e7b5a2890fb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5592-a9f4-9edf-2a0062ee68ea	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5592-a9f4-7493-fcc77c302a5a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5592-a9f4-6ba7-2db9d4bbc145	GA	GAB	266	Gabon 	Gabon	\N
00040000-5592-a9f4-4abe-e38c89f0d9c4	GM	GMB	270	Gambia 	Gambija	\N
00040000-5592-a9f4-7723-db6b1789f0d3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5592-a9f4-d3c9-aee58d7dc5f1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5592-a9f4-9390-35218e40c2ac	GH	GHA	288	Ghana 	Gana	\N
00040000-5592-a9f4-0da6-f9a087423e47	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5592-a9f4-b304-0b364a7f88b1	GR	GRC	300	Greece 	Grčija	\N
00040000-5592-a9f4-2280-b009b9525f5c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5592-a9f4-3a4a-b07ec6a1bae1	GD	GRD	308	Grenada 	Grenada	\N
00040000-5592-a9f4-1d33-7b35bdc5db3c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5592-a9f4-cf16-b723cc4c8bfd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5592-a9f4-aec8-709070fcf79b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5592-a9f4-9d59-6b99b00361a5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5592-a9f4-16eb-2065963a2642	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5592-a9f4-36b0-654abcfc9648	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5592-a9f4-e69d-02b1215b0929	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5592-a9f4-5187-15e566c852de	HT	HTI	332	Haiti 	Haiti	\N
00040000-5592-a9f4-0541-2999c7bd2818	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5592-a9f4-c60e-241525e1cc18	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5592-a9f4-ceb1-025417a8d14b	HN	HND	340	Honduras 	Honduras	\N
00040000-5592-a9f4-c60d-520b4ce1f0ed	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5592-a9f4-3f1f-7e00a304a114	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5592-a9f4-a888-b8bc161e0001	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5592-a9f4-e671-9c135fe649ae	IN	IND	356	India 	Indija	\N
00040000-5592-a9f4-858a-d8de341f33c8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5592-a9f4-3913-faf852653dbe	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5592-a9f4-b400-2b6582d87d95	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5592-a9f4-7465-588f5648dcbf	IE	IRL	372	Ireland 	Irska	\N
00040000-5592-a9f4-ec7a-b14185e8c2ee	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5592-a9f4-be01-4f909e539b25	IL	ISR	376	Israel 	Izrael	\N
00040000-5592-a9f4-d2f9-fadfba87acfd	IT	ITA	380	Italy 	Italija	\N
00040000-5592-a9f4-1b6b-09c6b088540b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5592-a9f4-6c73-d1ab3f90350f	JP	JPN	392	Japan 	Japonska	\N
00040000-5592-a9f4-e637-a07d75d44426	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5592-a9f4-6928-791cb39386c8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5592-a9f4-0742-d5da637214d2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5592-a9f4-5586-a5c94af89c09	KE	KEN	404	Kenya 	Kenija	\N
00040000-5592-a9f4-4bac-1d0764145c07	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5592-a9f4-1a02-acc5688e6f77	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5592-a9f4-ec95-223809c2936d	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5592-a9f4-385c-450245888310	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5592-a9f4-c925-d2fa7cbcbded	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5592-a9f4-02e7-ce3bdc714950	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5592-a9f4-0501-8a11b9baac7e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5592-a9f4-ddb4-6621a6386ad9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5592-a9f4-1660-4c62d15d643b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5592-a9f4-20a4-eacb85a98b59	LR	LBR	430	Liberia 	Liberija	\N
00040000-5592-a9f4-7352-781e549e8a1c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5592-a9f4-b937-2336442d7d66	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5592-a9f4-0d8f-362d90c5fb07	LT	LTU	440	Lithuania 	Litva	\N
00040000-5592-a9f4-ab96-32feaaf21296	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5592-a9f4-309c-3069443b9efe	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5592-a9f4-5832-c89e82444fae	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5592-a9f4-a006-7f0e450cbaf6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5592-a9f4-a048-bbcf887df0f5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5592-a9f4-bf7c-41e9f293a807	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5592-a9f4-a6c5-5b893afdb02e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5592-a9f4-3510-9801e858acee	ML	MLI	466	Mali 	Mali	\N
00040000-5592-a9f4-168c-7cca8c3047a4	MT	MLT	470	Malta 	Malta	\N
00040000-5592-a9f4-07b8-d946e98879d7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5592-a9f4-66a6-037cb53dfba6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5592-a9f4-83bf-4128dcd55557	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5592-a9f4-af3a-a7d25a934417	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5592-a9f4-0e93-e8463748f744	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5592-a9f4-61c7-249174add999	MX	MEX	484	Mexico 	Mehika	\N
00040000-5592-a9f4-8a22-d50e15ff143c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5592-a9f4-2f13-829d22072183	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5592-a9f4-313e-06a89a335d5c	MC	MCO	492	Monaco 	Monako	\N
00040000-5592-a9f4-4c78-f02d9006a2fa	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5592-a9f4-eba3-522ed06979d3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5592-a9f4-135a-f909f5d9b1eb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5592-a9f4-56a1-17a4b581fbb6	MA	MAR	504	Morocco 	Maroko	\N
00040000-5592-a9f4-8bf6-494d8f2cb5c9	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5592-a9f4-358b-a49e0b767efc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5592-a9f4-ab41-67663132e4ea	NA	NAM	516	Namibia 	Namibija	\N
00040000-5592-a9f4-d7b2-3efc8430e618	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5592-a9f4-65f0-350ea05af99f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5592-a9f4-3ec2-ce2e9be0ade6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5592-a9f4-a3ca-2c7b1c45e403	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5592-a9f4-2fa9-950d4b909821	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5592-a9f4-bff3-8e9685e577bb	NE	NER	562	Niger 	Niger 	\N
00040000-5592-a9f4-248e-779eccc154b3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5592-a9f4-6b2d-d00da522b61c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5592-a9f4-0206-2cabf1a12c2f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5592-a9f4-101e-d2a8a61b768e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5592-a9f4-f287-c6c7b1ac68be	NO	NOR	578	Norway 	Norveška	\N
00040000-5592-a9f4-bbfd-e91e723033c7	OM	OMN	512	Oman 	Oman	\N
00040000-5592-a9f4-d6ef-0b938c7c580a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5592-a9f4-f9c8-8563f7bc4993	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5592-a9f4-f0dc-ae226f45f1d9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5592-a9f4-a69c-5b2a8fbe3a99	PA	PAN	591	Panama 	Panama	\N
00040000-5592-a9f4-1a5a-d9fb8d553bb0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5592-a9f4-0701-d779176666ee	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5592-a9f4-5024-d680c77403d3	PE	PER	604	Peru 	Peru	\N
00040000-5592-a9f4-1caa-06706e593e98	PH	PHL	608	Philippines 	Filipini	\N
00040000-5592-a9f4-a480-f9cbe96ec4df	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5592-a9f4-30bc-5376b95da48e	PL	POL	616	Poland 	Poljska	\N
00040000-5592-a9f4-9b3f-fb8c460f5910	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5592-a9f4-f3f3-900ba410f638	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5592-a9f4-ae73-045f309e5d84	QA	QAT	634	Qatar 	Katar	\N
00040000-5592-a9f4-1361-4474b887c065	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5592-a9f4-763d-273e2a55b8d0	RO	ROU	642	Romania 	Romunija	\N
00040000-5592-a9f4-f5fd-1ceb2371a2f4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5592-a9f4-70e1-a942bf7c787b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5592-a9f4-69c2-18ed1e98560d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5592-a9f4-f902-30d5918f8375	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5592-a9f4-40bc-77542dc4bbbe	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5592-a9f4-d153-9744d02da99a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5592-a9f4-ef27-46487bcba1e5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5592-a9f4-d188-24b054e84502	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5592-a9f4-3c49-dc7602c6eee3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5592-a9f4-0737-42f2cbac37cf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5592-a9f4-a7cd-f3b9c16c7743	SM	SMR	674	San Marino 	San Marino	\N
00040000-5592-a9f4-5f08-bc65b791db13	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5592-a9f4-8b8a-c540870527b0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5592-a9f4-0f43-471f4ee85f84	SN	SEN	686	Senegal 	Senegal	\N
00040000-5592-a9f4-754b-f7f695e7bd2e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5592-a9f4-14bf-feb13b612b51	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5592-a9f4-2ea9-42274719889a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5592-a9f4-fa89-6bcbfe475496	SG	SGP	702	Singapore 	Singapur	\N
00040000-5592-a9f4-fcf1-dae27f834d3d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5592-a9f4-4c32-e63eac153189	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5592-a9f4-2607-3d33843320d5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5592-a9f4-2dde-12c9f7af78ac	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5592-a9f4-52c7-fbbf3aaf3581	SO	SOM	706	Somalia 	Somalija	\N
00040000-5592-a9f4-c826-2773f489738a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5592-a9f4-9e39-318da9121539	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5592-a9f4-c00c-2ddddb181c5b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5592-a9f4-7905-ab320a68011f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5592-a9f4-c32f-f2bbafca357c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5592-a9f4-e988-a9cab1aea670	SD	SDN	729	Sudan 	Sudan	\N
00040000-5592-a9f4-4359-9417c14d4543	SR	SUR	740	Suriname 	Surinam	\N
00040000-5592-a9f4-9162-a8b82f8415e8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5592-a9f4-bcea-d20f166ea534	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5592-a9f4-beed-2e93e1800c62	SE	SWE	752	Sweden 	Švedska	\N
00040000-5592-a9f4-717f-52a147a95886	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5592-a9f4-0f88-24d59018d83d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5592-a9f4-ed46-e91a2534bb6f	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5592-a9f4-f7bb-935bdb4a389f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5592-a9f4-21c8-57438901e62b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5592-a9f4-b537-271379fef6f0	TH	THA	764	Thailand 	Tajska	\N
00040000-5592-a9f4-ae43-5d123b38e0b7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5592-a9f4-bc6a-04a97d08a562	TG	TGO	768	Togo 	Togo	\N
00040000-5592-a9f4-6b37-88ed173d9022	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5592-a9f4-d514-bb8b04d65a82	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5592-a9f4-fbc2-0bd31843bae2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5592-a9f4-6d11-7f3d8e2c0324	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5592-a9f4-ea10-3fe6c34bdde8	TR	TUR	792	Turkey 	Turčija	\N
00040000-5592-a9f4-8cb2-376f5487cd2b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5592-a9f4-7b0a-ee935337d661	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-a9f4-2221-bbc643431ef2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5592-a9f4-5de6-115b74f3e348	UG	UGA	800	Uganda 	Uganda	\N
00040000-5592-a9f4-e515-94ff1e804581	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5592-a9f4-3ead-02b80499737a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5592-a9f4-7bf6-22689dab441f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5592-a9f4-a8ac-e5294e0b5eaa	US	USA	840	United States 	Združene države Amerike	\N
00040000-5592-a9f4-49e3-62a462fd5029	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5592-a9f4-c63d-b3cc48004b00	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5592-a9f4-a032-8ce607c17c2b	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5592-a9f4-e3b2-677bf5e7f0c5	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5592-a9f4-de7f-6ff56839365a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5592-a9f4-96a2-0fcbe6698e27	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5592-a9f4-f2ca-ac8a5589f6a2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5592-a9f4-3f0b-423fb32e1fca	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5592-a9f4-9024-614b8dc37477	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5592-a9f4-70b8-d3564504d487	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5592-a9f4-d72b-99e5819a2777	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5592-a9f4-1a4e-4c0241ee9b97	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5592-a9f4-2ea2-034dfde8f81d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8591818)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5592-a9f6-d25a-1ef6efff4226	000e0000-5592-a9f6-d665-3654ba0c2fc1	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5592-a9f5-d9e3-2c4e53a90db9	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5592-a9f6-61a8-664258b168ef	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5592-a9f5-ae42-a65391219ad2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8591626)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5592-a9f6-df25-9b776b344515	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5592-a9f5-b428-31868b8f9176
000d0000-5592-a9f6-1f7e-c77d353b3666	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-a9f5-b428-31868b8f9176
000d0000-5592-a9f6-6ecf-100d60f5b927	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5592-a9f5-167a-71a340dcc3f2
000d0000-5592-a9f6-3eb0-39a529f36348	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5592-a9f5-b28b-f6bc5872fdb1
000d0000-5592-a9f6-a4c3-c09374766b9f	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5592-a9f5-b28b-f6bc5872fdb1
000d0000-5592-a9f6-73ee-418526baec7c	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5592-a9f5-b28b-f6bc5872fdb1
000d0000-5592-a9f6-029e-fc6268eef54c	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5592-a9f5-b428-31868b8f9176
\.


--
-- TOC entry 2866 (class 0 OID 8591446)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8591494)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8591426)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5592-a9f6-4455-86ce7cddb412	00080000-5592-a9f6-37b9-e32f95b65476	00090000-5592-a9f6-ce43-759a6c8f033e	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8591543)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8591568)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8591383)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5592-a9f5-09ba-0542996fc263	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5592-a9f5-cfac-a4662bc494ce	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5592-a9f5-3012-e691bee10e44	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5592-a9f5-fe8f-9ed687859b6d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5592-a9f5-b88a-1ed2bbe4a289	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5592-a9f5-fc73-1fb5be2a68d8	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5592-a9f5-e4e0-a88550bc4849	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5592-a9f5-8612-218f72039860	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-a9f5-10a7-109c6eb5b32f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5592-a9f5-fb5c-1f53d76fd843	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5592-a9f5-4a35-5328cfe2c21a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5592-a9f5-5c43-dda61148e14f	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5592-a9f5-3779-e0bddad7bdab	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5592-a9f6-545c-604fc3461c62	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5592-a9f6-40c0-5439dee89a6b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5592-a9f6-f52a-e12b7e1d9d30	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5592-a9f6-ee51-311820e4ef71	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5592-a9f6-0f47-b2a7d9ef88f4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5592-a9f6-97c7-26e9b4f48ef8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8591296)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5592-a9f6-a94c-cfdc60b7b2f1	00000000-5592-a9f6-40c0-5439dee89a6b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5592-a9f6-0e27-535e431ba143	00000000-5592-a9f6-40c0-5439dee89a6b	00010000-5592-a9f5-9b71-84fa715e21e5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5592-a9f6-c9b3-87736b2fa51f	00000000-5592-a9f6-f52a-e12b7e1d9d30	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8591307)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5592-a9f6-8229-e94fcb992e01	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5592-a9f6-f827-80f53169e19e	00010000-5592-a9f6-ed4e-c38e93d5a03f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5592-a9f6-59d5-3b9eada60a5e	00010000-5592-a9f6-29ad-5bed83d47be7	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5592-a9f6-d91c-30a2ba3ad0f1	00010000-5592-a9f6-53ab-848b5462ffdd	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5592-a9f6-3092-d3cc99db32c0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5592-a9f6-1fb4-515ccd983316	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5592-a9f6-0967-e83ce5cddba1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5592-a9f6-1191-857fa30ec706	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5592-a9f6-ce43-759a6c8f033e	00010000-5592-a9f6-240c-83699815ea0e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5592-a9f6-5b82-438b5b27f3d2	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5592-a9f6-cff3-5fed2bfe5cec	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5592-a9f6-ca94-800001f08f73	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5592-a9f6-413e-df1eafeb7644	00010000-5592-a9f6-51e2-e11be78413ea	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8591261)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5592-a9f4-050a-9fd53d31023f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5592-a9f4-68e0-337a7334f62d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5592-a9f4-f2ea-80ed4afbad24	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5592-a9f4-3cd8-08407e6f3f9c	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5592-a9f4-db99-e35774d37f92	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5592-a9f4-f1d2-17844ea61156	Abonma-read	Abonma - branje	f
00030000-5592-a9f4-85e7-f3f4aea9b676	Abonma-write	Abonma - spreminjanje	f
00030000-5592-a9f4-3f6c-83942ced136b	Alternacija-read	Alternacija - branje	f
00030000-5592-a9f4-ef4a-62268601c301	Alternacija-write	Alternacija - spreminjanje	f
00030000-5592-a9f4-3f6b-f942008afd28	Arhivalija-read	Arhivalija - branje	f
00030000-5592-a9f4-6757-b93bcd3b6389	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5592-a9f4-4fe5-952b45f9c1f6	Besedilo-read	Besedilo - branje	f
00030000-5592-a9f4-ca47-034fbb23e599	Besedilo-write	Besedilo - spreminjanje	f
00030000-5592-a9f4-8fc3-cdacbacd63cc	DogodekIzven-read	DogodekIzven - branje	f
00030000-5592-a9f4-a718-07c85195f663	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5592-a9f4-7f47-bd95b512ad7f	Dogodek-read	Dogodek - branje	f
00030000-5592-a9f4-b8f1-3b7fb1074ec8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5592-a9f4-f5b0-dabc3e45999a	DrugiVir-read	DrugiVir - branje	f
00030000-5592-a9f4-b65c-7310d0798660	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5592-a9f4-d166-a90f08121ed9	Drzava-read	Drzava - branje	f
00030000-5592-a9f4-d5ca-ab3335ef9c26	Drzava-write	Drzava - spreminjanje	f
00030000-5592-a9f4-e974-de10920c1eae	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5592-a9f4-c6e0-fc18404d58f2	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5592-a9f4-2a23-a98b658242a5	Funkcija-read	Funkcija - branje	f
00030000-5592-a9f4-5b87-6f2adf5cb29a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5592-a9f4-8855-ea6169bcc9ff	Gostovanje-read	Gostovanje - branje	f
00030000-5592-a9f4-699f-e6c8fb9871cf	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5592-a9f4-480e-283d7f2cd5ba	Gostujoca-read	Gostujoca - branje	f
00030000-5592-a9f4-6b2d-cec11708b453	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5592-a9f4-d43f-77b6c1c0b2eb	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5592-a9f4-863c-11b30f3c64b8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5592-a9f4-4771-c67051b71569	Kupec-read	Kupec - branje	f
00030000-5592-a9f4-40b8-e552539d555c	Kupec-write	Kupec - spreminjanje	f
00030000-5592-a9f4-a49f-c5ee4f85bfef	NacinPlacina-read	NacinPlacina - branje	f
00030000-5592-a9f4-ef4b-a4758f40eff6	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5592-a9f4-38b1-2ce8b9c6b2c0	Option-read	Option - branje	f
00030000-5592-a9f4-d60b-a88af9b19816	Option-write	Option - spreminjanje	f
00030000-5592-a9f4-e599-3c9e0efb848b	OptionValue-read	OptionValue - branje	f
00030000-5592-a9f4-ed78-812c97ec99ad	OptionValue-write	OptionValue - spreminjanje	f
00030000-5592-a9f4-91d3-5159071a1531	Oseba-read	Oseba - branje	f
00030000-5592-a9f4-3207-e7aa031bf435	Oseba-write	Oseba - spreminjanje	f
00030000-5592-a9f4-93f1-98952a0cad72	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5592-a9f4-207e-9b41b30cac20	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5592-a9f4-6f22-207050a050b3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5592-a9f4-a4d1-b06a9a39b8c3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5592-a9f4-1b35-12918a165eab	Pogodba-read	Pogodba - branje	f
00030000-5592-a9f4-923c-5b9f3370ede2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5592-a9f4-a1f9-c9040a3ccaf7	Popa-read	Popa - branje	f
00030000-5592-a9f4-0fc0-27200a7f27b4	Popa-write	Popa - spreminjanje	f
00030000-5592-a9f4-1161-f73ec2d47daa	Posta-read	Posta - branje	f
00030000-5592-a9f4-885f-5f6e87811182	Posta-write	Posta - spreminjanje	f
00030000-5592-a9f4-df2e-918816531dec	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5592-a9f4-3611-469b04da26bf	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5592-a9f4-3e31-04569c143cd2	PostniNaslov-read	PostniNaslov - branje	f
00030000-5592-a9f4-82e0-76241fbd5d56	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5592-a9f4-aadd-cb314bdb0925	Predstava-read	Predstava - branje	f
00030000-5592-a9f4-63d8-58009208d894	Predstava-write	Predstava - spreminjanje	f
00030000-5592-a9f4-7d23-e389652a0b81	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5592-a9f4-a4c4-a009ade7487d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5592-a9f4-f7c6-b8e3383f7b35	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5592-a9f4-820d-c25b8878770e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5592-a9f4-b281-a0e6a90a7743	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5592-a9f4-5a4a-51a255e2d0e7	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5592-a9f4-34bd-5f333a84fd6e	ProgramDela-read	ProgramDela - branje	f
00030000-5592-a9f4-e9e3-1a71286c9aba	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5592-a9f4-1f97-ba9eeb913017	ProgramFestival-read	ProgramFestival - branje	f
00030000-5592-a9f4-b16a-857a01686254	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5592-a9f4-1f5a-0f9773bf5f4c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5592-a9f4-2a0b-5873f39b0689	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5592-a9f4-4f65-c659608cf924	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5592-a9f4-2891-d751339ea159	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5592-a9f4-c79b-24abd527dbd1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5592-a9f4-0cd9-16f72fc077ce	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5592-a9f4-70a5-cd60714678fc	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5592-a9f4-2cbe-ff21ef5bdffe	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5592-a9f4-99ea-587f806d949e	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5592-a9f4-0dba-c55cd66bc36b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5592-a9f4-5bab-11e12be727f9	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5592-a9f4-563e-a8c876a3aedc	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5592-a9f4-b9aa-415a934de7fd	ProgramRazno-read	ProgramRazno - branje	f
00030000-5592-a9f4-89d2-c55a1279ecd3	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5592-a9f4-ce6c-932bc99f1857	Prostor-read	Prostor - branje	f
00030000-5592-a9f4-7f3e-507f885c3954	Prostor-write	Prostor - spreminjanje	f
00030000-5592-a9f4-573f-659b94a3166f	Racun-read	Racun - branje	f
00030000-5592-a9f4-961a-c5e820c804a0	Racun-write	Racun - spreminjanje	f
00030000-5592-a9f4-7c56-9de2b6e14080	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5592-a9f4-56a8-d82ebf2bbca3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5592-a9f4-0d8e-81206089775d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5592-a9f4-c5ed-c72835dcef4a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5592-a9f4-62f8-ee780201347e	Rekvizit-read	Rekvizit - branje	f
00030000-5592-a9f4-62f4-7cb4a550d693	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5592-a9f4-6701-ba344d8cfa0a	Revizija-read	Revizija - branje	f
00030000-5592-a9f4-53a3-588880f2d2d5	Revizija-write	Revizija - spreminjanje	f
00030000-5592-a9f4-847f-4ba4c430b42e	Rezervacija-read	Rezervacija - branje	f
00030000-5592-a9f4-4060-247040bfe9e5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5592-a9f4-e8d3-75062e82dd54	SedezniRed-read	SedezniRed - branje	f
00030000-5592-a9f4-0a94-851e4c26dc3d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5592-a9f4-494a-dd21a1832d8e	Sedez-read	Sedez - branje	f
00030000-5592-a9f4-3b48-57a168d1fa26	Sedez-write	Sedez - spreminjanje	f
00030000-5592-a9f4-ae13-353e454cf7d7	Sezona-read	Sezona - branje	f
00030000-5592-a9f4-adbd-178975a1ac27	Sezona-write	Sezona - spreminjanje	f
00030000-5592-a9f4-7294-b2d79436d8cf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5592-a9f4-7989-a03167e751db	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5592-a9f4-6128-0a5020b45bff	Stevilcenje-read	Stevilcenje - branje	f
00030000-5592-a9f4-c733-d903ce686f5f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5592-a9f4-d280-311a80935b14	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5592-a9f4-1a33-4599a96038a8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5592-a9f4-fc36-fc3b20592c47	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5592-a9f4-2363-bfba919ee56b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5592-a9f4-a2ff-bb70591ba5c1	Telefonska-read	Telefonska - branje	f
00030000-5592-a9f4-67c1-ed470946ea8b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5592-a9f4-b99a-057bd97e3b8e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5592-a9f4-49f5-636348700a53	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5592-a9f4-79b0-49691b0160c1	TipFunkcije-read	TipFunkcije - branje	f
00030000-5592-a9f4-0279-1725b9f6c09e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5592-a9f4-7271-2a1cac1ae3eb	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5592-a9f4-4e88-34ee7b479f07	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5592-a9f4-a3b5-90e51c637ce4	Trr-read	Trr - branje	f
00030000-5592-a9f4-5e0b-665dbe4078c7	Trr-write	Trr - spreminjanje	f
00030000-5592-a9f4-00c0-47ca91339ebf	Uprizoritev-read	Uprizoritev - branje	f
00030000-5592-a9f4-497b-af10be1a52df	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5592-a9f4-63fa-04e7cab1a391	Vaja-read	Vaja - branje	f
00030000-5592-a9f4-3a04-144190144e51	Vaja-write	Vaja - spreminjanje	f
00030000-5592-a9f4-8df5-175aa6443367	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5592-a9f4-941d-0da4bd745fda	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5592-a9f4-5ee0-f82eb144c886	Zaposlitev-read	Zaposlitev - branje	f
00030000-5592-a9f4-18e4-13dcf9feaf6b	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5592-a9f4-e595-c13738f0d2b7	Zasedenost-read	Zasedenost - branje	f
00030000-5592-a9f4-fd13-a6e2f6f211fd	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5592-a9f4-3461-25749a5e6bd1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5592-a9f4-b5f3-739db0cc514e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5592-a9f4-ce6f-a7ec7888bbda	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5592-a9f4-342c-1d4c8c69363e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8591280)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5592-a9f4-0b7d-58f36d66bad7	00030000-5592-a9f4-68e0-337a7334f62d
00020000-5592-a9f4-eec0-27630d6a52c2	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-85e7-f3f4aea9b676
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3f6c-83942ced136b
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-ef4a-62268601c301
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3cd8-08407e6f3f9c
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-b8f1-3b7fb1074ec8
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-d5ca-ab3335ef9c26
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-2a23-a98b658242a5
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-5b87-6f2adf5cb29a
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-699f-e6c8fb9871cf
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-6b2d-cec11708b453
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-d43f-77b6c1c0b2eb
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-863c-11b30f3c64b8
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-91d3-5159071a1531
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3207-e7aa031bf435
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-0fc0-27200a7f27b4
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-885f-5f6e87811182
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3e31-04569c143cd2
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-82e0-76241fbd5d56
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-63d8-58009208d894
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-b281-a0e6a90a7743
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-5a4a-51a255e2d0e7
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-7f3e-507f885c3954
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-c5ed-c72835dcef4a
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-62f4-7cb4a550d693
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-adbd-178975a1ac27
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-79b0-49691b0160c1
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-00c0-47ca91339ebf
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-497b-af10be1a52df
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-63fa-04e7cab1a391
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3a04-144190144e51
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-e595-c13738f0d2b7
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-fd13-a6e2f6f211fd
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f4-121d-cea74a0a652a	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-d43f-77b6c1c0b2eb
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-863c-11b30f3c64b8
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-91d3-5159071a1531
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-3207-e7aa031bf435
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-3e31-04569c143cd2
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-82e0-76241fbd5d56
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-a2ff-bb70591ba5c1
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-67c1-ed470946ea8b
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-a3b5-90e51c637ce4
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-5e0b-665dbe4078c7
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-5ee0-f82eb144c886
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-18e4-13dcf9feaf6b
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f4-fbb9-5b741652cd73	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-3f6c-83942ced136b
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-6757-b93bcd3b6389
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-4fe5-952b45f9c1f6
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-8fc3-cdacbacd63cc
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-2a23-a98b658242a5
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-d43f-77b6c1c0b2eb
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-91d3-5159071a1531
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-b281-a0e6a90a7743
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-79b0-49691b0160c1
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-63fa-04e7cab1a391
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-e595-c13738f0d2b7
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f4-4a89-f07fcc709236	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-85e7-f3f4aea9b676
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-ef4a-62268601c301
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-79b0-49691b0160c1
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f4-e37e-6da134c2ad01	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-b99a-057bd97e3b8e
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-f2ea-80ed4afbad24
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-79b0-49691b0160c1
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f4-9569-eefcd8f291e0	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-050a-9fd53d31023f
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-68e0-337a7334f62d
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-f2ea-80ed4afbad24
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3cd8-08407e6f3f9c
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-db99-e35774d37f92
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-f1d2-17844ea61156
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-85e7-f3f4aea9b676
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3f6c-83942ced136b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ef4a-62268601c301
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3f6b-f942008afd28
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-6757-b93bcd3b6389
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-4fe5-952b45f9c1f6
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ca47-034fbb23e599
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-8fc3-cdacbacd63cc
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a718-07c85195f663
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7f47-bd95b512ad7f
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b8f1-3b7fb1074ec8
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-d166-a90f08121ed9
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-d5ca-ab3335ef9c26
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-e974-de10920c1eae
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-c6e0-fc18404d58f2
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-2a23-a98b658242a5
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-5b87-6f2adf5cb29a
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-8855-ea6169bcc9ff
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-699f-e6c8fb9871cf
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-480e-283d7f2cd5ba
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-6b2d-cec11708b453
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-d43f-77b6c1c0b2eb
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-863c-11b30f3c64b8
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-4771-c67051b71569
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-40b8-e552539d555c
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a49f-c5ee4f85bfef
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ef4b-a4758f40eff6
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-38b1-2ce8b9c6b2c0
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-d60b-a88af9b19816
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-e599-3c9e0efb848b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ed78-812c97ec99ad
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-91d3-5159071a1531
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3207-e7aa031bf435
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-93f1-98952a0cad72
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-207e-9b41b30cac20
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-6f22-207050a050b3
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a4d1-b06a9a39b8c3
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-1b35-12918a165eab
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-923c-5b9f3370ede2
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a1f9-c9040a3ccaf7
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0fc0-27200a7f27b4
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-1161-f73ec2d47daa
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-885f-5f6e87811182
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-df2e-918816531dec
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3611-469b04da26bf
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3e31-04569c143cd2
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-82e0-76241fbd5d56
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-aadd-cb314bdb0925
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-63d8-58009208d894
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7d23-e389652a0b81
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a4c4-a009ade7487d
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-f7c6-b8e3383f7b35
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-820d-c25b8878770e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b281-a0e6a90a7743
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-5a4a-51a255e2d0e7
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-34bd-5f333a84fd6e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-e9e3-1a71286c9aba
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-1f97-ba9eeb913017
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b16a-857a01686254
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-1f5a-0f9773bf5f4c
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-2a0b-5873f39b0689
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-4f65-c659608cf924
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-2891-d751339ea159
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-c79b-24abd527dbd1
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0cd9-16f72fc077ce
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-70a5-cd60714678fc
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-2cbe-ff21ef5bdffe
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-99ea-587f806d949e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0dba-c55cd66bc36b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-5bab-11e12be727f9
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-563e-a8c876a3aedc
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b9aa-415a934de7fd
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-89d2-c55a1279ecd3
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ce6c-932bc99f1857
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7f3e-507f885c3954
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-573f-659b94a3166f
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-961a-c5e820c804a0
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7c56-9de2b6e14080
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-56a8-d82ebf2bbca3
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0d8e-81206089775d
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-c5ed-c72835dcef4a
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-62f8-ee780201347e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-62f4-7cb4a550d693
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-6701-ba344d8cfa0a
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-53a3-588880f2d2d5
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-847f-4ba4c430b42e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-4060-247040bfe9e5
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-e8d3-75062e82dd54
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0a94-851e4c26dc3d
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-494a-dd21a1832d8e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3b48-57a168d1fa26
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ae13-353e454cf7d7
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-adbd-178975a1ac27
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7294-b2d79436d8cf
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7989-a03167e751db
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-6128-0a5020b45bff
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-c733-d903ce686f5f
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-d280-311a80935b14
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-1a33-4599a96038a8
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-fc36-fc3b20592c47
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-2363-bfba919ee56b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a2ff-bb70591ba5c1
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-67c1-ed470946ea8b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b99a-057bd97e3b8e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-49f5-636348700a53
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-79b0-49691b0160c1
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-0279-1725b9f6c09e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-7271-2a1cac1ae3eb
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-4e88-34ee7b479f07
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-a3b5-90e51c637ce4
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-5e0b-665dbe4078c7
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-00c0-47ca91339ebf
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-497b-af10be1a52df
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-63fa-04e7cab1a391
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3a04-144190144e51
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-8df5-175aa6443367
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-941d-0da4bd745fda
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-5ee0-f82eb144c886
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-18e4-13dcf9feaf6b
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-e595-c13738f0d2b7
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-fd13-a6e2f6f211fd
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-3461-25749a5e6bd1
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-b5f3-739db0cc514e
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-ce6f-a7ec7888bbda
00020000-5592-a9f6-1067-d52cddb3c57f	00030000-5592-a9f4-342c-1d4c8c69363e
\.


--
-- TOC entry 2881 (class 0 OID 8591575)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8591606)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8591738)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5592-a9f6-d065-eb37c95ff315	00090000-5592-a9f6-8229-e94fcb992e01	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8591340)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5592-a9f6-37b9-e32f95b65476	00040000-5592-a9f4-2bce-08a946344951	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-a9f6-7001-04c5ea77bcba	00040000-5592-a9f4-2bce-08a946344951	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-a9f6-7626-630b5036b82f	00040000-5592-a9f4-2bce-08a946344951	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-a9f6-1f55-e55d59fc3c7c	00040000-5592-a9f4-2bce-08a946344951	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-a9f6-6723-8a445bcaeea7	00040000-5592-a9f4-2bce-08a946344951	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5592-a9f6-e3b6-d76e9a53c000	00040000-5592-a9f4-2607-3d33843320d5	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8591375)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5592-a9f5-b98a-3ca1a5d93b9c	8341	Adlešiči
00050000-5592-a9f5-5c2f-13be493f5c39	5270	Ajdovščina
00050000-5592-a9f5-b46b-61488fc553de	6280	Ankaran/Ancarano
00050000-5592-a9f5-8a1c-f2938d29f9c5	9253	Apače
00050000-5592-a9f5-db37-82c3a6bd5ebe	8253	Artiče
00050000-5592-a9f5-16a7-f8f50650a743	4275	Begunje na Gorenjskem
00050000-5592-a9f5-046b-3f1bcf418afa	1382	Begunje pri Cerknici
00050000-5592-a9f5-ced8-b831a06227ed	9231	Beltinci
00050000-5592-a9f5-5ec2-7ac5ef20b01f	2234	Benedikt
00050000-5592-a9f5-ca50-e6e33510ce5d	2345	Bistrica ob Dravi
00050000-5592-a9f5-bd3e-2941c335c0fc	3256	Bistrica ob Sotli
00050000-5592-a9f5-a028-94ba30309c39	8259	Bizeljsko
00050000-5592-a9f5-320d-c84ff20bcfb5	1223	Blagovica
00050000-5592-a9f5-32c4-c48d0ff690cb	8283	Blanca
00050000-5592-a9f5-4ff8-d11c7b71dd6b	4260	Bled
00050000-5592-a9f5-a815-184b31eb96d8	4273	Blejska Dobrava
00050000-5592-a9f5-c6b9-5976b13de0ba	9265	Bodonci
00050000-5592-a9f5-2212-759dbbcd1b03	9222	Bogojina
00050000-5592-a9f5-6c7a-42a187ea70f6	4263	Bohinjska Bela
00050000-5592-a9f5-14fd-37afea4c491a	4264	Bohinjska Bistrica
00050000-5592-a9f5-5ffe-00792aca52d6	4265	Bohinjsko jezero
00050000-5592-a9f5-2f6e-cbd3c52b43ca	1353	Borovnica
00050000-5592-a9f5-0419-96b10eb30cd4	8294	Boštanj
00050000-5592-a9f5-8e4a-9d532fea7774	5230	Bovec
00050000-5592-a9f5-7a8f-64702a395836	5295	Branik
00050000-5592-a9f5-0fe4-130dd8e4609a	3314	Braslovče
00050000-5592-a9f5-213f-2e3eadf0d6db	5223	Breginj
00050000-5592-a9f5-f57c-c31bb47dad57	8280	Brestanica
00050000-5592-a9f5-bb4d-803001c9283c	2354	Bresternica
00050000-5592-a9f5-ad32-a3555e7fd152	4243	Brezje
00050000-5592-a9f5-03c2-11bc87551066	1351	Brezovica pri Ljubljani
00050000-5592-a9f5-d42f-cd582cb3a8e5	8250	Brežice
00050000-5592-a9f5-5d31-0e69e2d6440e	4210	Brnik - Aerodrom
00050000-5592-a9f5-3e13-3b86f4f96612	8321	Brusnice
00050000-5592-a9f5-6b81-5004946afcd2	3255	Buče
00050000-5592-a9f5-8d64-6851d1aa92e6	8276	Bučka 
00050000-5592-a9f5-b327-d75277cfbb4b	9261	Cankova
00050000-5592-a9f5-253d-1d1e502a8fc6	3000	Celje 
00050000-5592-a9f5-b1c4-42583712630d	3001	Celje - poštni predali
00050000-5592-a9f5-37ce-717c3b7a1823	4207	Cerklje na Gorenjskem
00050000-5592-a9f5-fb8b-4157de16d995	8263	Cerklje ob Krki
00050000-5592-a9f5-1fcd-95d2aa08e710	1380	Cerknica
00050000-5592-a9f5-b9a0-6a2d06023f7b	5282	Cerkno
00050000-5592-a9f5-f17d-83741cc88db2	2236	Cerkvenjak
00050000-5592-a9f5-bd04-522c149058f7	2215	Ceršak
00050000-5592-a9f5-3223-b7cbb3307382	2326	Cirkovce
00050000-5592-a9f5-47c2-2757e021b828	2282	Cirkulane
00050000-5592-a9f5-8330-e4f8172aba09	5273	Col
00050000-5592-a9f5-b08b-852201d7787c	8251	Čatež ob Savi
00050000-5592-a9f5-3d13-955e8e08af03	1413	Čemšenik
00050000-5592-a9f5-63d9-1af8e31c6f6e	5253	Čepovan
00050000-5592-a9f5-640c-78dc7e45bc58	9232	Črenšovci
00050000-5592-a9f5-beab-bb79fe5cd34a	2393	Črna na Koroškem
00050000-5592-a9f5-1796-b137cbb091fe	6275	Črni Kal
00050000-5592-a9f5-37cf-d0e2bbe8971e	5274	Črni Vrh nad Idrijo
00050000-5592-a9f5-ac81-2a1848bb1f6c	5262	Črniče
00050000-5592-a9f5-0e8f-1e7dc123fb5d	8340	Črnomelj
00050000-5592-a9f5-d4ab-16edd1a6008f	6271	Dekani
00050000-5592-a9f5-82d6-1c91262f128b	5210	Deskle
00050000-5592-a9f5-121c-7462af966377	2253	Destrnik
00050000-5592-a9f5-4861-e1db9ab082c6	6215	Divača
00050000-5592-a9f5-7265-93323f5241f7	1233	Dob
00050000-5592-a9f5-0515-208453144a49	3224	Dobje pri Planini
00050000-5592-a9f5-6e27-34224de7d4f8	8257	Dobova
00050000-5592-a9f5-c69e-b3ee5e29dfd5	1423	Dobovec
00050000-5592-a9f5-17d1-f76743e5a4a7	5263	Dobravlje
00050000-5592-a9f5-a54b-6ca9ed208934	3204	Dobrna
00050000-5592-a9f5-3674-d0da535f6e68	8211	Dobrnič
00050000-5592-a9f5-3696-12cba812a88d	1356	Dobrova
00050000-5592-a9f5-df22-4e6fcefbf8a8	9223	Dobrovnik/Dobronak 
00050000-5592-a9f5-8006-ffeb77e0fd31	5212	Dobrovo v Brdih
00050000-5592-a9f5-c7f2-0c5074e9eb66	1431	Dol pri Hrastniku
00050000-5592-a9f5-e15c-e29c75b8d001	1262	Dol pri Ljubljani
00050000-5592-a9f5-56d8-0ec23cd0a52c	1273	Dole pri Litiji
00050000-5592-a9f5-cbb5-ab4907084c3a	1331	Dolenja vas
00050000-5592-a9f5-c280-0b3bbc23008e	8350	Dolenjske Toplice
00050000-5592-a9f5-74f4-05db8fb313e8	1230	Domžale
00050000-5592-a9f5-0e5a-f54037b4ac36	2252	Dornava
00050000-5592-a9f5-32af-72c9333857a9	5294	Dornberk
00050000-5592-a9f5-bf4f-5501da75a3ff	1319	Draga
00050000-5592-a9f5-df83-dea711ab8916	8343	Dragatuš
00050000-5592-a9f5-14ff-a326ad1db5b8	3222	Dramlje
00050000-5592-a9f5-b4fb-678f09c3456a	2370	Dravograd
00050000-5592-a9f5-30c3-a33b2085d1fd	4203	Duplje
00050000-5592-a9f5-ede6-5a94a3771df0	6221	Dutovlje
00050000-5592-a9f5-e248-1a2a876d8989	8361	Dvor
00050000-5592-a9f5-cbce-df955c5b0c10	2343	Fala
00050000-5592-a9f5-f7b5-fc07102a6366	9208	Fokovci
00050000-5592-a9f5-9704-82b38ec6db37	2313	Fram
00050000-5592-a9f5-4cd0-e87b571a64e3	3213	Frankolovo
00050000-5592-a9f5-a677-1e767af03518	1274	Gabrovka
00050000-5592-a9f5-4b88-9e9fcd65afee	8254	Globoko
00050000-5592-a9f5-9843-b805acc9cd61	5275	Godovič
00050000-5592-a9f5-a6e6-3c7912809d6f	4204	Golnik
00050000-5592-a9f5-c747-d018b1a6919c	3303	Gomilsko
00050000-5592-a9f5-e356-31443e9a0fe0	4224	Gorenja vas
00050000-5592-a9f5-0641-0687e374cccc	3263	Gorica pri Slivnici
00050000-5592-a9f5-1cf9-8f951fa2733e	2272	Gorišnica
00050000-5592-a9f5-4782-5d0e8ad15a14	9250	Gornja Radgona
00050000-5592-a9f5-1444-cd9dc7cb3e3e	3342	Gornji Grad
00050000-5592-a9f5-b1a8-94a72adb2d39	4282	Gozd Martuljek
00050000-5592-a9f5-6e86-0e13a027f455	6272	Gračišče
00050000-5592-a9f5-a4b0-3b856538d260	9264	Grad
00050000-5592-a9f5-4dde-bbf963e284e5	8332	Gradac
00050000-5592-a9f5-4c34-3f276c724846	1384	Grahovo
00050000-5592-a9f5-bbb6-0b904e2b2f95	5242	Grahovo ob Bači
00050000-5592-a9f5-e977-78ff8d3cd8d7	5251	Grgar
00050000-5592-a9f5-d7ed-f303b5a8375e	3302	Griže
00050000-5592-a9f5-f10a-6955aec8da60	3231	Grobelno
00050000-5592-a9f5-0434-b593b91319a7	1290	Grosuplje
00050000-5592-a9f5-777b-23871ed6915c	2288	Hajdina
00050000-5592-a9f5-1ffd-3c15de8b3c5f	8362	Hinje
00050000-5592-a9f5-b75c-bef2ccca0042	2311	Hoče
00050000-5592-a9f5-e0c6-ac6631e4a665	9205	Hodoš/Hodos
00050000-5592-a9f5-5e86-1d14d6b15c70	1354	Horjul
00050000-5592-a9f5-7f01-b2fe4337c987	1372	Hotedršica
00050000-5592-a9f5-dd73-83ad368d4ccf	1430	Hrastnik
00050000-5592-a9f5-1fa8-c0daa20c8d61	6225	Hruševje
00050000-5592-a9f5-e74e-af5d52bd4b7c	4276	Hrušica
00050000-5592-a9f5-1941-959b5fcfce69	5280	Idrija
00050000-5592-a9f5-1bf1-412152bf460e	1292	Ig
00050000-5592-a9f5-1e35-8b9fe4db1289	6250	Ilirska Bistrica
00050000-5592-a9f5-00be-779066d5e391	6251	Ilirska Bistrica-Trnovo
00050000-5592-a9f5-82a5-7b8d63b122ff	1295	Ivančna Gorica
00050000-5592-a9f5-8719-aa90ed0b4cae	2259	Ivanjkovci
00050000-5592-a9f5-6eea-963dfbe6fc94	1411	Izlake
00050000-5592-a9f5-b9af-2ee5e07f3977	6310	Izola/Isola
00050000-5592-a9f5-9754-7a87a07a84b9	2222	Jakobski Dol
00050000-5592-a9f5-980d-489571d3f3b2	2221	Jarenina
00050000-5592-a9f5-51cd-50569966eb06	6254	Jelšane
00050000-5592-a9f5-b158-7b89befacfab	4270	Jesenice
00050000-5592-a9f5-4539-b4e2c88fcc2a	8261	Jesenice na Dolenjskem
00050000-5592-a9f5-136d-49c007e24c23	3273	Jurklošter
00050000-5592-a9f5-a49b-cbbefbd4e706	2223	Jurovski Dol
00050000-5592-a9f5-b19a-24fead3a72d5	2256	Juršinci
00050000-5592-a9f5-3d1e-07ccd0afe993	5214	Kal nad Kanalom
00050000-5592-a9f5-59f4-cb1634339e96	3233	Kalobje
00050000-5592-a9f5-fa99-0b522e35a3f0	4246	Kamna Gorica
00050000-5592-a9f5-65ee-5cf035269ff4	2351	Kamnica
00050000-5592-a9f5-d84c-1a94a91d91f5	1241	Kamnik
00050000-5592-a9f5-72a4-bacbc1eb738b	5213	Kanal
00050000-5592-a9f5-2c0e-4a759a45134f	8258	Kapele
00050000-5592-a9f5-98a3-ac7b832a4427	2362	Kapla
00050000-5592-a9f5-002f-c11baa463f86	2325	Kidričevo
00050000-5592-a9f5-0617-796b2943f395	1412	Kisovec
00050000-5592-a9f5-adec-7b997f958952	6253	Knežak
00050000-5592-a9f5-d463-a3117a15e84a	5222	Kobarid
00050000-5592-a9f5-636a-0eaf84274aca	9227	Kobilje
00050000-5592-a9f5-b3c9-86b60871f465	1330	Kočevje
00050000-5592-a9f5-171d-4028236762a4	1338	Kočevska Reka
00050000-5592-a9f5-e02c-3d5688578f93	2276	Kog
00050000-5592-a9f5-28f7-dc8c1b7c6e28	5211	Kojsko
00050000-5592-a9f5-eb2e-0ae2a28ca3d4	6223	Komen
00050000-5592-a9f5-3ad9-97df6484caaa	1218	Komenda
00050000-5592-a9f5-ad2c-733dc09f7156	6000	Koper/Capodistria 
00050000-5592-a9f5-238f-261e18b32992	6001	Koper/Capodistria - poštni predali
00050000-5592-a9f5-a4ff-b4ff00e884d4	8282	Koprivnica
00050000-5592-a9f5-b3fd-b2799186b4a4	5296	Kostanjevica na Krasu
00050000-5592-a9f5-b5ce-5113006be219	8311	Kostanjevica na Krki
00050000-5592-a9f5-9346-1b4a4eaeb1bc	1336	Kostel
00050000-5592-a9f5-9975-1e68a1712342	6256	Košana
00050000-5592-a9f5-3495-9c962ceb21cd	2394	Kotlje
00050000-5592-a9f5-b18c-eb70a8cc8589	6240	Kozina
00050000-5592-a9f5-1f2b-ee03002fd035	3260	Kozje
00050000-5592-a9f5-4ccd-3348b7501519	4000	Kranj 
00050000-5592-a9f5-143e-67f6bc654b57	4001	Kranj - poštni predali
00050000-5592-a9f5-35c7-ac3a26383c2b	4280	Kranjska Gora
00050000-5592-a9f5-6c4d-5e93b508c127	1281	Kresnice
00050000-5592-a9f5-3125-e8fd412ebf90	4294	Križe
00050000-5592-a9f5-434c-0186a3c0e0f0	9206	Križevci
00050000-5592-a9f5-8057-04dada0b5bc6	9242	Križevci pri Ljutomeru
00050000-5592-a9f5-d335-ae9e4b1adef1	1301	Krka
00050000-5592-a9f5-33f9-7dded95cdd62	8296	Krmelj
00050000-5592-a9f5-7f39-d2b77098fdfa	4245	Kropa
00050000-5592-a9f5-c2c4-7326e3836e1c	8262	Krška vas
00050000-5592-a9f5-023b-421513afc81a	8270	Krško
00050000-5592-a9f5-0c6c-db844412d8e6	9263	Kuzma
00050000-5592-a9f5-00fe-c4522305f239	2318	Laporje
00050000-5592-a9f5-e0af-0b71a969bf0a	3270	Laško
00050000-5592-a9f5-a6e0-c059bb1ffc50	1219	Laze v Tuhinju
00050000-5592-a9f5-1b7b-9424000c0cf3	2230	Lenart v Slovenskih goricah
00050000-5592-a9f5-34e6-838400132f0c	9220	Lendava/Lendva
00050000-5592-a9f5-a475-7210efd68b27	4248	Lesce
00050000-5592-a9f5-0adb-c32c0b1965ec	3261	Lesično
00050000-5592-a9f5-e99d-613d3a22f91f	8273	Leskovec pri Krškem
00050000-5592-a9f5-94c6-9854667ff6d4	2372	Libeliče
00050000-5592-a9f5-99e6-de3b7d8eddd2	2341	Limbuš
00050000-5592-a9f5-a58b-3d1fcdef7253	1270	Litija
00050000-5592-a9f5-987c-68eb409c2c22	3202	Ljubečna
00050000-5592-a9f5-eb6a-72d0fc7d99ff	1000	Ljubljana 
00050000-5592-a9f5-c4da-0fca8dd4a3ff	1001	Ljubljana - poštni predali
00050000-5592-a9f5-def0-5fb14966603a	1231	Ljubljana - Črnuče
00050000-5592-a9f5-ffc6-20c4f60d46e5	1261	Ljubljana - Dobrunje
00050000-5592-a9f5-c78c-8e8c12bc2756	1260	Ljubljana - Polje
00050000-5592-a9f5-75ef-9c9c5163ffab	1210	Ljubljana - Šentvid
00050000-5592-a9f5-1d52-0b1705d7a305	1211	Ljubljana - Šmartno
00050000-5592-a9f5-01a5-7d4f8acbc9ae	3333	Ljubno ob Savinji
00050000-5592-a9f5-b3df-aa595ef140bd	9240	Ljutomer
00050000-5592-a9f5-4338-b42cbbcf18f2	3215	Loče
00050000-5592-a9f5-ba75-1001792d2428	5231	Log pod Mangartom
00050000-5592-a9f5-6e9f-2ef1aceb3434	1358	Log pri Brezovici
00050000-5592-a9f5-f7b6-d39570d3a634	1370	Logatec
00050000-5592-a9f5-2840-24e6b0ea12b6	1371	Logatec
00050000-5592-a9f5-d942-56514456a2fc	1434	Loka pri Zidanem Mostu
00050000-5592-a9f5-0fd1-1cfe277d17cc	3223	Loka pri Žusmu
00050000-5592-a9f5-6f0f-99225ce5c0fb	6219	Lokev
00050000-5592-a9f5-bc62-42f592ff520f	1318	Loški Potok
00050000-5592-a9f5-4560-4e137b81c6f5	2324	Lovrenc na Dravskem polju
00050000-5592-a9f5-412c-4a753ac3f53a	2344	Lovrenc na Pohorju
00050000-5592-a9f5-56ea-12d80f0aa322	3334	Luče
00050000-5592-a9f5-d292-6e81d27e28dc	1225	Lukovica
00050000-5592-a9f5-e883-3419dda468d8	9202	Mačkovci
00050000-5592-a9f5-3ca1-b87982369015	2322	Majšperk
00050000-5592-a9f5-27b5-3f94727d5233	2321	Makole
00050000-5592-a9f5-086d-5e4027980e3f	9243	Mala Nedelja
00050000-5592-a9f5-d2c6-ea9d5cd4a30f	2229	Malečnik
00050000-5592-a9f5-a04a-e6dc9e3e8200	6273	Marezige
00050000-5592-a9f5-3547-497072bdd05f	2000	Maribor 
00050000-5592-a9f5-377c-4fd06fcbba3c	2001	Maribor - poštni predali
00050000-5592-a9f5-47c7-29fd2c3a2438	2206	Marjeta na Dravskem polju
00050000-5592-a9f5-4e4d-85d17967ba7b	2281	Markovci
00050000-5592-a9f5-9fb6-e95558b2da1f	9221	Martjanci
00050000-5592-a9f5-ad79-2f6ef7aceec2	6242	Materija
00050000-5592-a9f5-65bf-a9ee803f44aa	4211	Mavčiče
00050000-5592-a9f5-ada2-b3c9d7f6d81f	1215	Medvode
00050000-5592-a9f5-7e51-d8a8d03124bf	1234	Mengeš
00050000-5592-a9f5-7e67-604536286ae3	8330	Metlika
00050000-5592-a9f5-e675-bc89a872058d	2392	Mežica
00050000-5592-a9f5-4f9a-61dbeb390cb6	2204	Miklavž na Dravskem polju
00050000-5592-a9f5-1e12-9554999b3686	2275	Miklavž pri Ormožu
00050000-5592-a9f5-183b-14b3057d607a	5291	Miren
00050000-5592-a9f5-a24b-83fe82684f57	8233	Mirna
00050000-5592-a9f5-718e-1beab2fbdcf6	8216	Mirna Peč
00050000-5592-a9f5-bc74-a8f86299dbf4	2382	Mislinja
00050000-5592-a9f5-73fd-a65216c31a52	4281	Mojstrana
00050000-5592-a9f5-f96f-41720de6bae2	8230	Mokronog
00050000-5592-a9f5-425c-8e474e285179	1251	Moravče
00050000-5592-a9f5-6577-044c96ff3dc0	9226	Moravske Toplice
00050000-5592-a9f5-547b-4c6917172b29	5216	Most na Soči
00050000-5592-a9f5-c896-18109a7eaa6b	1221	Motnik
00050000-5592-a9f5-1788-c16df23c4b07	3330	Mozirje
00050000-5592-a9f5-0a5b-5dde1a86fc35	9000	Murska Sobota 
00050000-5592-a9f5-1264-ed39a1ac8c4a	9001	Murska Sobota - poštni predali
00050000-5592-a9f5-7f3a-006ddeb64ab0	2366	Muta
00050000-5592-a9f5-487a-914660290f28	4202	Naklo
00050000-5592-a9f5-3004-28084a20a10d	3331	Nazarje
00050000-5592-a9f5-7ed9-0911fca5a934	1357	Notranje Gorice
00050000-5592-a9f5-0621-ded0259d7091	3203	Nova Cerkev
00050000-5592-a9f5-3f7c-ef30d48ce7f5	5000	Nova Gorica 
00050000-5592-a9f5-681f-fd091fe620bd	5001	Nova Gorica - poštni predali
00050000-5592-a9f5-1781-114840078421	1385	Nova vas
00050000-5592-a9f5-e20f-cc257db54cdb	8000	Novo mesto
00050000-5592-a9f5-c619-6e6e74e85af2	8001	Novo mesto - poštni predali
00050000-5592-a9f5-3fee-e484b9ecea10	6243	Obrov
00050000-5592-a9f5-3a38-1693c9ff8e55	9233	Odranci
00050000-5592-a9f5-a660-a4555af55dcb	2317	Oplotnica
00050000-5592-a9f5-79f5-bd7a26123f9e	2312	Orehova vas
00050000-5592-a9f5-7d71-2a488c735135	2270	Ormož
00050000-5592-a9f5-522a-dce072bbf9b2	1316	Ortnek
00050000-5592-a9f5-d7a3-cd0fedb8d56c	1337	Osilnica
00050000-5592-a9f5-13eb-d0f088b84f6c	8222	Otočec
00050000-5592-a9f5-9d2f-a68f9f6142cd	2361	Ožbalt
00050000-5592-a9f5-d039-eaacd64bfb01	2231	Pernica
00050000-5592-a9f5-69d7-bdee71b84c06	2211	Pesnica pri Mariboru
00050000-5592-a9f5-0994-32d779609e3d	9203	Petrovci
00050000-5592-a9f5-f06e-37e5c6045319	3301	Petrovče
00050000-5592-a9f5-fe14-f2a11cd08046	6330	Piran/Pirano
00050000-5592-a9f5-7ffd-6b466e730372	8255	Pišece
00050000-5592-a9f5-0012-f6ebd36ec11c	6257	Pivka
00050000-5592-a9f5-0fad-0c53ab554fb1	6232	Planina
00050000-5592-a9f5-dee9-ceb8e2fafefc	3225	Planina pri Sevnici
00050000-5592-a9f5-0d01-f64f0fccf779	6276	Pobegi
00050000-5592-a9f5-0d37-191f264a0f3c	8312	Podbočje
00050000-5592-a9f5-0bb8-65abe6656d8c	5243	Podbrdo
00050000-5592-a9f5-1c4e-c1c8df049aa3	3254	Podčetrtek
00050000-5592-a9f5-e12e-c97a9f65ae19	2273	Podgorci
00050000-5592-a9f5-0d60-549087a0f35d	6216	Podgorje
00050000-5592-a9f5-a5a4-de8eb39031e5	2381	Podgorje pri Slovenj Gradcu
00050000-5592-a9f5-032f-35e61e8f7330	6244	Podgrad
00050000-5592-a9f5-2461-d8f4d4823f49	1414	Podkum
00050000-5592-a9f5-818a-88eee0dcbd93	2286	Podlehnik
00050000-5592-a9f5-f339-031b49e3b080	5272	Podnanos
00050000-5592-a9f5-10be-f4694c6cdd49	4244	Podnart
00050000-5592-a9f5-071c-e7f0cfb18042	3241	Podplat
00050000-5592-a9f5-6ca4-306a8b7b3515	3257	Podsreda
00050000-5592-a9f5-bf06-a85ffe44b315	2363	Podvelka
00050000-5592-a9f5-e41c-2f92cc2c7cc2	2208	Pohorje
00050000-5592-a9f5-1a8c-e6b94f3fb408	2257	Polenšak
00050000-5592-a9f5-8212-8b834246f950	1355	Polhov Gradec
00050000-5592-a9f5-9622-e93ab0289774	4223	Poljane nad Škofjo Loko
00050000-5592-a9f5-111f-8aeafdbd6df5	2319	Poljčane
00050000-5592-a9f5-ef68-6808cc167385	1272	Polšnik
00050000-5592-a9f5-ca08-fefe4cc6959d	3313	Polzela
00050000-5592-a9f5-4ad1-fffe7939033e	3232	Ponikva
00050000-5592-a9f5-8e55-b1e10c6b709d	6320	Portorož/Portorose
00050000-5592-a9f5-8af0-0d97f5339dd4	6230	Postojna
00050000-5592-a9f5-d0c6-f6d6516ae32b	2331	Pragersko
00050000-5592-a9f5-eecf-307794b2046c	3312	Prebold
00050000-5592-a9f5-79dc-a958c3e7650c	4205	Preddvor
00050000-5592-a9f5-b98a-09e971f3931e	6255	Prem
00050000-5592-a9f5-2580-f0ab657015dc	1352	Preserje
00050000-5592-a9f5-9b95-c5f166527de9	6258	Prestranek
00050000-5592-a9f5-d132-42d5cf9e9a4b	2391	Prevalje
00050000-5592-a9f5-396e-e310ddd0392e	3262	Prevorje
00050000-5592-a9f5-1f80-9d1aa256d512	1276	Primskovo 
00050000-5592-a9f5-121f-d017e84498cc	3253	Pristava pri Mestinju
00050000-5592-a9f5-773f-0afff284c84d	9207	Prosenjakovci/Partosfalva
00050000-5592-a9f5-a93d-c8bb19828ff6	5297	Prvačina
00050000-5592-a9f5-2b9b-f41b20a3b540	2250	Ptuj
00050000-5592-a9f5-0271-1a9accff5a6a	2323	Ptujska Gora
00050000-5592-a9f5-1a67-8c1c320db395	9201	Puconci
00050000-5592-a9f5-a1ab-2724fbf73598	2327	Rače
00050000-5592-a9f5-76a8-743991cfb5c4	1433	Radeče
00050000-5592-a9f5-0273-6f58823e2a6a	9252	Radenci
00050000-5592-a9f5-488f-3c4e4c673bdb	2360	Radlje ob Dravi
00050000-5592-a9f5-0499-45cc523a5f56	1235	Radomlje
00050000-5592-a9f5-d056-d310d96fd4e4	4240	Radovljica
00050000-5592-a9f5-327c-bef675a39f24	8274	Raka
00050000-5592-a9f5-dc4a-2e3b36b1b627	1381	Rakek
00050000-5592-a9f5-4587-d62b17f659f6	4283	Rateče - Planica
00050000-5592-a9f5-2b19-68aa8b3ebf48	2390	Ravne na Koroškem
00050000-5592-a9f5-91cb-53987ba61793	9246	Razkrižje
00050000-5592-a9f5-8052-25dba37904f1	3332	Rečica ob Savinji
00050000-5592-a9f5-3ad5-8a387720b11d	5292	Renče
00050000-5592-a9f5-d047-57cc3dbbcd07	1310	Ribnica
00050000-5592-a9f5-9152-8b7c096b75e3	2364	Ribnica na Pohorju
00050000-5592-a9f5-e347-ad60ed938260	3272	Rimske Toplice
00050000-5592-a9f5-085e-f41348657f61	1314	Rob
00050000-5592-a9f5-cc96-8f60109639c7	5215	Ročinj
00050000-5592-a9f5-5734-ea15d65051fc	3250	Rogaška Slatina
00050000-5592-a9f5-44c7-de293f5c4c0e	9262	Rogašovci
00050000-5592-a9f5-f99d-1b659b6acb3f	3252	Rogatec
00050000-5592-a9f5-dc33-6e712e448a5b	1373	Rovte
00050000-5592-a9f5-4fbc-ff835d4fc8ee	2342	Ruše
00050000-5592-a9f5-8ac8-e568400e7cb6	1282	Sava
00050000-5592-a9f5-47fa-94fcb5bdf362	6333	Sečovlje/Sicciole
00050000-5592-a9f5-bde8-b493dac7739b	4227	Selca
00050000-5592-a9f5-755f-72f223cee3f9	2352	Selnica ob Dravi
00050000-5592-a9f5-1f91-a4ad9801fa49	8333	Semič
00050000-5592-a9f5-d4ef-306b93a3fe5e	8281	Senovo
00050000-5592-a9f5-a8bb-7f1087025e3d	6224	Senožeče
00050000-5592-a9f5-5f97-4e3d1583c232	8290	Sevnica
00050000-5592-a9f5-1d98-68b4702fdb22	6210	Sežana
00050000-5592-a9f5-cfc9-b19c4bd48da2	2214	Sladki Vrh
00050000-5592-a9f5-14c2-15d48c8917a3	5283	Slap ob Idrijci
00050000-5592-a9f5-407b-3f4678c44a45	2380	Slovenj Gradec
00050000-5592-a9f5-1750-77ddbcfe6d42	2310	Slovenska Bistrica
00050000-5592-a9f5-9332-b5216a155316	3210	Slovenske Konjice
00050000-5592-a9f5-b0d3-3821ffdbb5bd	1216	Smlednik
00050000-5592-a9f5-d7b7-2111c1eee015	5232	Soča
00050000-5592-a9f5-6914-0a5562c50331	1317	Sodražica
00050000-5592-a9f5-a143-5b2ba162a6fe	3335	Solčava
00050000-5592-a9f5-86b1-04d0587c887c	5250	Solkan
00050000-5592-a9f5-1d49-75248d08f132	4229	Sorica
00050000-5592-a9f5-5dcb-1f55294aae1c	4225	Sovodenj
00050000-5592-a9f5-04ff-f97ec4d3532d	5281	Spodnja Idrija
00050000-5592-a9f5-9343-bdacc7fc0965	2241	Spodnji Duplek
00050000-5592-a9f5-bd41-ebe6cdbbaaeb	9245	Spodnji Ivanjci
00050000-5592-a9f5-06f9-d2034d941c73	2277	Središče ob Dravi
00050000-5592-a9f5-1dcc-3f0c7ac843c9	4267	Srednja vas v Bohinju
00050000-5592-a9f5-c033-f7f340b8d6e5	8256	Sromlje 
00050000-5592-a9f5-03d3-dbd371166abd	5224	Srpenica
00050000-5592-a9f5-4bcc-856a04dbc1a9	1242	Stahovica
00050000-5592-a9f5-d364-e688092d323f	1332	Stara Cerkev
00050000-5592-a9f5-10f1-6585ac72a0ce	8342	Stari trg ob Kolpi
00050000-5592-a9f5-70cd-020aa4854fae	1386	Stari trg pri Ložu
00050000-5592-a9f5-984d-11a81af3949f	2205	Starše
00050000-5592-a9f5-417c-16681bfa1777	2289	Stoperce
00050000-5592-a9f5-eb9d-243caefa884d	8322	Stopiče
00050000-5592-a9f5-9589-723ae2e167cd	3206	Stranice
00050000-5592-a9f5-972e-ab19ce9a642e	8351	Straža
00050000-5592-a9f5-de24-8480a6cdb1a0	1313	Struge
00050000-5592-a9f5-a4b1-45a02e6d0e25	8293	Studenec
00050000-5592-a9f5-d218-ba50a6a21e71	8331	Suhor
00050000-5592-a9f5-c424-53747c3010f2	2233	Sv. Ana v Slovenskih goricah
00050000-5592-a9f5-3a49-a0a300d70669	2235	Sv. Trojica v Slovenskih goricah
00050000-5592-a9f5-b3c7-b65a072aa104	2353	Sveti Duh na Ostrem Vrhu
00050000-5592-a9f5-9619-3bd2b333652a	9244	Sveti Jurij ob Ščavnici
00050000-5592-a9f5-de50-581a22b63fb7	3264	Sveti Štefan
00050000-5592-a9f5-4c57-940aa0d3b342	2258	Sveti Tomaž
00050000-5592-a9f5-949a-571580af22dc	9204	Šalovci
00050000-5592-a9f5-c749-2e1ffaea7ee1	5261	Šempas
00050000-5592-a9f5-296d-5440b1d1422d	5290	Šempeter pri Gorici
00050000-5592-a9f5-57d0-8c661993441c	3311	Šempeter v Savinjski dolini
00050000-5592-a9f5-6e55-a0cfcceac8df	4208	Šenčur
00050000-5592-a9f5-ec7d-71e0cc1f0f6c	2212	Šentilj v Slovenskih goricah
00050000-5592-a9f5-f6e8-befa120e4d1f	8297	Šentjanž
00050000-5592-a9f5-003e-b591144eaffc	2373	Šentjanž pri Dravogradu
00050000-5592-a9f5-0984-892fbf3a2238	8310	Šentjernej
00050000-5592-a9f5-c629-0863a2e0824c	3230	Šentjur
00050000-5592-a9f5-05b5-239a46b0e0f4	3271	Šentrupert
00050000-5592-a9f5-fde6-bf8b4cd04f9a	8232	Šentrupert
00050000-5592-a9f5-677a-7756e06bd8c0	1296	Šentvid pri Stični
00050000-5592-a9f5-ece1-c83c041f35c7	8275	Škocjan
00050000-5592-a9f5-c497-178abc38334e	6281	Škofije
00050000-5592-a9f5-4e5a-0f34c3c9c7e2	4220	Škofja Loka
00050000-5592-a9f5-2f1f-2e23f00d7354	3211	Škofja vas
00050000-5592-a9f5-8e71-b9760f041b95	1291	Škofljica
00050000-5592-a9f5-bcf0-9e0f736f253e	6274	Šmarje
00050000-5592-a9f5-9da2-32ef092d4af4	1293	Šmarje - Sap
00050000-5592-a9f5-29c4-8a8a688ac0e6	3240	Šmarje pri Jelšah
00050000-5592-a9f5-0efa-c98910e6bac1	8220	Šmarješke Toplice
00050000-5592-a9f5-5961-733282c93568	2315	Šmartno na Pohorju
00050000-5592-a9f5-9ef4-799505db4320	3341	Šmartno ob Dreti
00050000-5592-a9f5-6c82-91882e96aa7c	3327	Šmartno ob Paki
00050000-5592-a9f5-9dbc-0dba4d2b3c1f	1275	Šmartno pri Litiji
00050000-5592-a9f5-552c-7c807f0b5f40	2383	Šmartno pri Slovenj Gradcu
00050000-5592-a9f5-c80e-9f4d6129b769	3201	Šmartno v Rožni dolini
00050000-5592-a9f5-26e9-79caf932f486	3325	Šoštanj
00050000-5592-a9f5-b7be-5c8e7242e4f8	6222	Štanjel
00050000-5592-a9f5-8b78-399c0218cf85	3220	Štore
00050000-5592-a9f5-8a48-fb2f7f0ce760	3304	Tabor
00050000-5592-a9f5-8b27-89e91641d451	3221	Teharje
00050000-5592-a9f5-a91d-976ba4deb924	9251	Tišina
00050000-5592-a9f5-c168-5eaff7cb83c1	5220	Tolmin
00050000-5592-a9f5-f3e3-85d86598932d	3326	Topolšica
00050000-5592-a9f5-6daf-e3db66cd113f	2371	Trbonje
00050000-5592-a9f5-0959-13ae8ff84ae9	1420	Trbovlje
00050000-5592-a9f5-d8e0-89285e26a06d	8231	Trebelno 
00050000-5592-a9f5-d24b-dd720f563d6f	8210	Trebnje
00050000-5592-a9f5-af25-49052af8a71f	5252	Trnovo pri Gorici
00050000-5592-a9f5-5e74-c60ea313cbf0	2254	Trnovska vas
00050000-5592-a9f5-cb7e-2e3771bfba2d	1222	Trojane
00050000-5592-a9f5-a8ff-39153640c9c6	1236	Trzin
00050000-5592-a9f5-9d75-f2babec9ff0e	4290	Tržič
00050000-5592-a9f5-e05b-928bd89ac497	8295	Tržišče
00050000-5592-a9f5-8389-6e10395a98a3	1311	Turjak
00050000-5592-a9f5-2d2f-7ac5e0bd4928	9224	Turnišče
00050000-5592-a9f5-b834-38315bc861e3	8323	Uršna sela
00050000-5592-a9f5-5ad1-13c2d4e878fc	1252	Vače
00050000-5592-a9f5-d7bd-5b585fe26784	3320	Velenje 
00050000-5592-a9f5-ad3c-11d6dd260180	3322	Velenje - poštni predali
00050000-5592-a9f5-ffab-26a7d40da20e	8212	Velika Loka
00050000-5592-a9f5-0fb4-ca34c2497dd5	2274	Velika Nedelja
00050000-5592-a9f5-3f27-dfba9b17a1af	9225	Velika Polana
00050000-5592-a9f5-63e6-6cb5b53c18de	1315	Velike Lašče
00050000-5592-a9f5-83e9-9dc1e210500a	8213	Veliki Gaber
00050000-5592-a9f5-f434-b7044754115b	9241	Veržej
00050000-5592-a9f5-0a82-3f11db2bb5b7	1312	Videm - Dobrepolje
00050000-5592-a9f5-5efe-114fe3023693	2284	Videm pri Ptuju
00050000-5592-a9f5-ebe7-7b2988d41371	8344	Vinica
00050000-5592-a9f5-c33e-8720daae70ad	5271	Vipava
00050000-5592-a9f5-7641-8190cd0216fc	4212	Visoko
00050000-5592-a9f5-ca4c-d0b3f56599e4	1294	Višnja Gora
00050000-5592-a9f5-28f4-c7dc2613dc2b	3205	Vitanje
00050000-5592-a9f5-bbf0-017ed57fb53e	2255	Vitomarci
00050000-5592-a9f5-42ea-869bc3f853f0	1217	Vodice
00050000-5592-a9f5-a61a-f58c2e028f99	3212	Vojnik\t
00050000-5592-a9f5-b515-e2294e11a3b7	5293	Volčja Draga
00050000-5592-a9f5-a72d-292611cc875c	2232	Voličina
00050000-5592-a9f5-a429-02957fcece8c	3305	Vransko
00050000-5592-a9f5-1437-83b18516863c	6217	Vremski Britof
00050000-5592-a9f5-0158-d7c7fc8ebc54	1360	Vrhnika
00050000-5592-a9f5-6fdb-9ef9236c1393	2365	Vuhred
00050000-5592-a9f5-ff71-2b188c9e8b33	2367	Vuzenica
00050000-5592-a9f5-5868-972ad3862c87	8292	Zabukovje 
00050000-5592-a9f5-7331-2f7344a2d02b	1410	Zagorje ob Savi
00050000-5592-a9f5-0095-91d7781dab91	1303	Zagradec
00050000-5592-a9f5-db52-4aea2f34b8a4	2283	Zavrč
00050000-5592-a9f5-6c21-3ae74f7752fd	8272	Zdole 
00050000-5592-a9f5-993b-5587067d6ff3	4201	Zgornja Besnica
00050000-5592-a9f5-6c2a-6bd105069a7a	2242	Zgornja Korena
00050000-5592-a9f5-49bc-90b4f62830f0	2201	Zgornja Kungota
00050000-5592-a9f5-3724-70e96e811fd4	2316	Zgornja Ložnica
00050000-5592-a9f5-9c67-abfaa8a9661b	2314	Zgornja Polskava
00050000-5592-a9f5-de41-06331bd12dfc	2213	Zgornja Velka
00050000-5592-a9f5-d7e9-1dcbe5cc490a	4247	Zgornje Gorje
00050000-5592-a9f5-5379-27e5c9dd929a	4206	Zgornje Jezersko
00050000-5592-a9f5-a555-c422dff7c2bc	2285	Zgornji Leskovec
00050000-5592-a9f5-6ca6-9820377a421f	1432	Zidani Most
00050000-5592-a9f5-353e-5e7d6de0fcef	3214	Zreče
00050000-5592-a9f5-f445-dd3873d134c9	4209	Žabnica
00050000-5592-a9f5-e3da-4ce6ff99619f	3310	Žalec
00050000-5592-a9f5-6165-15f08990b467	4228	Železniki
00050000-5592-a9f5-ad3a-ef96d41684b2	2287	Žetale
00050000-5592-a9f5-3037-3bdb6196a37e	4226	Žiri
00050000-5592-a9f5-791b-f9d6a04492f3	4274	Žirovnica
00050000-5592-a9f5-f0a3-361620491273	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8591549)
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
-- TOC entry 2859 (class 0 OID 8591360)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8591438)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8591561)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8591681)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8591730)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5592-a9f6-871c-1402e6183f37	00080000-5592-a9f6-e3b6-d76e9a53c000	0900	AK
00190000-5592-a9f6-6427-fb23266ede0c	00080000-5592-a9f6-7626-630b5036b82f	0987	A
00190000-5592-a9f6-a93b-46c6ad98d54e	00080000-5592-a9f6-7001-04c5ea77bcba	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8591864)
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
-- TOC entry 2883 (class 0 OID 8591590)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5592-a9f6-c431-d93e2576d2a1	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5592-a9f6-4586-95a41e3f5dc6	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5592-a9f6-68fa-befc1bbde905	0003	Kazinska	t	84	Kazinska dvorana
00220000-5592-a9f6-a9e9-ab7f295ab210	0004	Mali oder	t	24	Mali oder 
00220000-5592-a9f6-1645-cbf1cd47606b	0005	Komorni oder	t	15	Komorni oder
00220000-5592-a9f6-44b7-eac231f9d01d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5592-a9f6-f767-d285f861afa9	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8591534)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8591524)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8591719)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8591658)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8591232)
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
-- TOC entry 2884 (class 0 OID 8591600)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8591270)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5592-a9f4-0b7d-58f36d66bad7	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5592-a9f4-eec0-27630d6a52c2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5592-a9f4-b7f4-c3629cd554e4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5592-a9f4-a94a-ad8ee3099692	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5592-a9f4-121d-cea74a0a652a	planer	Planer dogodkov v koledarju	t
00020000-5592-a9f4-fbb9-5b741652cd73	kadrovska	Kadrovska služba	t
00020000-5592-a9f4-4a89-f07fcc709236	arhivar	Ažuriranje arhivalij	t
00020000-5592-a9f4-e37e-6da134c2ad01	igralec	Igralec	t
00020000-5592-a9f4-9569-eefcd8f291e0	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5592-a9f6-1067-d52cddb3c57f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8591254)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5592-a9f5-9b71-84fa715e21e5	00020000-5592-a9f4-b7f4-c3629cd554e4
00010000-5592-a9f5-ed3b-f6c26ffcceac	00020000-5592-a9f4-b7f4-c3629cd554e4
00010000-5592-a9f6-07cb-86fdb98365bf	00020000-5592-a9f6-1067-d52cddb3c57f
\.


--
-- TOC entry 2886 (class 0 OID 8591614)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8591555)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8591505)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8591914)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5592-a9f5-c31f-bc4a91335224	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5592-a9f5-f8cd-105666a07c67	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5592-a9f5-1468-7b15a9cd96e6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5592-a9f5-7312-3cb7328d57b4	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5592-a9f5-acb4-3c251103810c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8591906)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5592-a9f5-1fd7-8c1e7848e9a7	00230000-5592-a9f5-7312-3cb7328d57b4	popa
00240000-5592-a9f5-f875-3222aa57d26e	00230000-5592-a9f5-7312-3cb7328d57b4	oseba
00240000-5592-a9f5-2415-e2fca9a67078	00230000-5592-a9f5-f8cd-105666a07c67	prostor
00240000-5592-a9f5-3f3c-3601b92cebba	00230000-5592-a9f5-7312-3cb7328d57b4	besedilo
00240000-5592-a9f5-63af-a1072a5c4b66	00230000-5592-a9f5-7312-3cb7328d57b4	uprizoritev
00240000-5592-a9f5-3aba-17b76ba8989c	00230000-5592-a9f5-7312-3cb7328d57b4	funkcija
00240000-5592-a9f5-a44b-9f49505c853d	00230000-5592-a9f5-7312-3cb7328d57b4	tipfunkcije
00240000-5592-a9f5-5c4c-c333d14b0f7f	00230000-5592-a9f5-7312-3cb7328d57b4	alternacija
00240000-5592-a9f5-7680-015b7f760e36	00230000-5592-a9f5-c31f-bc4a91335224	pogodba
00240000-5592-a9f5-a945-610ff399da15	00230000-5592-a9f5-7312-3cb7328d57b4	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8591901)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8591668)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5592-a9f6-3e73-782ac1c5ca7f	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	00080000-5592-a9f6-37b9-e32f95b65476	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5592-a9f6-11fb-373039107fb7	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	00080000-5592-a9f6-37b9-e32f95b65476	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5592-a9f6-2679-57a2dc376b02	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	00080000-5592-a9f6-6723-8a445bcaeea7	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8591332)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8591511)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5592-a9f6-1c2a-8739bdab258c	00180000-5592-a9f6-60c0-28df46582025	000c0000-5592-a9f6-e1af-7039ca0d9d5c	00090000-5592-a9f6-ce43-759a6c8f033e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-a9f6-86f3-0e5280d9c1be	00180000-5592-a9f6-60c0-28df46582025	000c0000-5592-a9f6-1aa7-5aecf26cf3ca	00090000-5592-a9f6-5b82-438b5b27f3d2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-a9f6-2bef-5b7767955fcb	00180000-5592-a9f6-60c0-28df46582025	000c0000-5592-a9f6-44c9-15387612fc42	00090000-5592-a9f6-59d5-3b9eada60a5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-a9f6-fa09-72dc81b76651	00180000-5592-a9f6-60c0-28df46582025	000c0000-5592-a9f6-9181-9dbf41decbb3	00090000-5592-a9f6-f827-80f53169e19e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-a9f6-09bf-08aebba4f615	00180000-5592-a9f6-60c0-28df46582025	000c0000-5592-a9f6-14d4-56d582061b8e	00090000-5592-a9f6-ca94-800001f08f73	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5592-a9f6-b2d1-6908c4934d36	00180000-5592-a9f6-992d-4ded8b9d293a	\N	00090000-5592-a9f6-ca94-800001f08f73	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8591708)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5592-a9f5-b428-31868b8f9176	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5592-a9f5-ac52-1ed0a2eb7531	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5592-a9f5-05c5-a8ead787918d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5592-a9f5-167a-71a340dcc3f2	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5592-a9f5-df9f-3d57e64ee71a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5592-a9f5-530a-79ebd9d589fc	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5592-a9f5-2ddc-ec4f905627de	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5592-a9f5-dc1a-16965e3323fb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5592-a9f5-ff1f-704cb82ab24b	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5592-a9f5-cfc2-1674557e68c3	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5592-a9f5-ef5c-a082cb053b6b	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5592-a9f5-c1cd-76ab2322178d	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5592-a9f5-9095-70d7cec20c3a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5592-a9f5-b026-947c853dc500	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5592-a9f5-c4b8-a83e1784aa14	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5592-a9f5-b28b-f6bc5872fdb1	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8591883)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5592-a9f5-d9e3-2c4e53a90db9	01	Velika predstava	f	1.00	1.00
002b0000-5592-a9f5-ae42-a65391219ad2	02	Mala predstava	f	0.50	0.50
002b0000-5592-a9f5-78e9-1621342d29c5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5592-a9f5-d937-b17df0133b07	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5592-a9f5-7a80-3ab2858471a5	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8591395)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8591241)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5592-a9f5-ed3b-f6c26ffcceac	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROrc6UjKStelwM90viTYz7zQvnMQrcGaC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-29ad-5bed83d47be7	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-ed4e-c38e93d5a03f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-240c-83699815ea0e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-51e2-e11be78413ea	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-53ab-848b5462ffdd	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-bc62-f76bcd7773d9	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-9956-9698216b9e71	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-a44c-08d6ce037d09	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-e922-c108da756966	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5592-a9f6-07cb-86fdb98365bf	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5592-a9f5-9b71-84fa715e21e5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8591765)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5592-a9f6-d665-3654ba0c2fc1	00160000-5592-a9f6-ebf7-c2726998ee59	00150000-5592-a9f5-f305-f47b09b5d5ad	00140000-5592-a9f4-3ddd-142b0c3e7647	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5592-a9f6-1645-cbf1cd47606b
000e0000-5592-a9f6-7ba5-0c44a2e0e52b	00160000-5592-a9f6-8ead-cfb34ae9f04e	00150000-5592-a9f5-845a-c1b2d061bc7e	00140000-5592-a9f4-ca33-b0bf968a3f02	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5592-a9f6-44b7-eac231f9d01d
000e0000-5592-a9f6-e08e-2435358e875f	\N	00150000-5592-a9f5-845a-c1b2d061bc7e	00140000-5592-a9f4-ca33-b0bf968a3f02	00190000-5592-a9f6-6427-fb23266ede0c	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5592-a9f6-1645-cbf1cd47606b
000e0000-5592-a9f6-c4c6-6e2eeaf734eb	\N	00150000-5592-a9f5-845a-c1b2d061bc7e	00140000-5592-a9f4-ca33-b0bf968a3f02	00190000-5592-a9f6-6427-fb23266ede0c	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5592-a9f6-1645-cbf1cd47606b
000e0000-5592-a9f6-0ba8-98693898c6f6	\N	00150000-5592-a9f5-845a-c1b2d061bc7e	00140000-5592-a9f4-ca33-b0bf968a3f02	00190000-5592-a9f6-6427-fb23266ede0c	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5592-a9f6-c431-d93e2576d2a1
\.


--
-- TOC entry 2867 (class 0 OID 8591457)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5592-a9f6-f616-41d31b39ed9d	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	1	
00200000-5592-a9f6-6377-86708b001ec6	000e0000-5592-a9f6-7ba5-0c44a2e0e52b	2	
\.


--
-- TOC entry 2882 (class 0 OID 8591582)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8591651)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8591489)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8591755)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5592-a9f4-3ddd-142b0c3e7647	01	Drama	drama (SURS 01)
00140000-5592-a9f4-980e-efc23d8cd895	02	Opera	opera (SURS 02)
00140000-5592-a9f4-3f6b-9e1f6dfb53f4	03	Balet	balet (SURS 03)
00140000-5592-a9f4-df11-9e4a8128cbfc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5592-a9f4-e833-38f6f041111c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5592-a9f4-ca33-b0bf968a3f02	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5592-a9f4-9d00-9b959c6e861e	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8591641)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5592-a9f5-e9db-7bb66ed0325d	01	Opera	opera
00150000-5592-a9f5-fdf7-3b9ab35fb77e	02	Opereta	opereta
00150000-5592-a9f5-e2de-96a187f18b9e	03	Balet	balet
00150000-5592-a9f5-b31d-2d357db777e7	04	Plesne prireditve	plesne prireditve
00150000-5592-a9f5-b620-02a47168126f	05	Lutkovno gledališče	lutkovno gledališče
00150000-5592-a9f5-7e5b-fbb926c19c05	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5592-a9f5-80ef-30848f4c3f62	07	Biografska drama	biografska drama
00150000-5592-a9f5-f305-f47b09b5d5ad	08	Komedija	komedija
00150000-5592-a9f5-11c4-3b6859949cba	09	Črna komedija	črna komedija
00150000-5592-a9f5-0879-8687b555767a	10	E-igra	E-igra
00150000-5592-a9f5-845a-c1b2d061bc7e	11	Kriminalka	kriminalka
00150000-5592-a9f5-3df3-3e34a7b05376	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8591295)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8591812)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8591802)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8591707)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8591479)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8591504)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8591899)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8591421)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8591859)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8591637)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8591455)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8591498)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8591435)
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
-- TOC entry 2533 (class 2606 OID 8591547)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8591574)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8591393)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8591304)
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
-- TOC entry 2448 (class 2606 OID 8591328)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8591284)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8591269)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8591580)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8591613)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8591750)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8591357)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8591381)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8591553)
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
-- TOC entry 2463 (class 2606 OID 8591371)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8591442)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8591565)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8591689)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8591735)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8591881)
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
-- TOC entry 2553 (class 2606 OID 8591597)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8591538)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8591529)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8591729)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8591665)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8591240)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8591604)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8591258)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8591278)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8591622)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8591560)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8591510)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8591923)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8591911)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8591905)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8591678)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8591337)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8591520)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8591718)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8591893)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8591406)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8591253)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8591781)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8591464)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8591588)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8591656)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8591493)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8591763)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8591649)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8591486)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8591679)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8591680)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8591359)
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
-- TOC entry 2546 (class 1259 OID 8591581)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8591567)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8591566)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8591465)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8591638)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8591640)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8591639)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8591437)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8591436)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8591752)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8591753)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8591754)
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
-- TOC entry 2608 (class 1259 OID 8591786)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8591783)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8591787)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8591785)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8591784)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8591408)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8591407)
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
-- TOC entry 2446 (class 1259 OID 8591331)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8591605)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8591499)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8591285)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8591286)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8591625)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8591624)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8591623)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8591443)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8591445)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8591444)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8591913)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8591533)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8591531)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8591530)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8591532)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8591259)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8591260)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8591589)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8591554)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8591666)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8591667)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8591863)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8591860)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8591861)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8591862)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8591373)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8591372)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8591374)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8591690)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8591691)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8591816)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8591817)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8591814)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8591815)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8591657)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8591542)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8591541)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8591539)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8591540)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8591804)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8591803)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8591882)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8591456)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8591900)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8591306)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8591305)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8591338)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8591339)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8591523)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8591522)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8591521)
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
-- TOC entry 2498 (class 1259 OID 8591488)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8591484)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8591481)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8591482)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8591480)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8591485)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8591483)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8591358)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8591422)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8591424)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8591423)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8591425)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8591548)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8591751)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8591782)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8591329)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8591330)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8591650)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8591924)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8591394)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8591912)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8591599)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8591598)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8591813)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8591382)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8591764)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8591736)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8591737)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8591279)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8591487)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2675 (class 2606 OID 8592060)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2678 (class 2606 OID 8592045)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2677 (class 2606 OID 8592050)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2673 (class 2606 OID 8592070)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2679 (class 2606 OID 8592040)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2674 (class 2606 OID 8592065)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8592055)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2709 (class 2606 OID 8592215)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2708 (class 2606 OID 8592220)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8591975)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8592155)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2694 (class 2606 OID 8592150)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2695 (class 2606 OID 8592145)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8592035)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8592185)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8592195)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8592190)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 8592010)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2667 (class 2606 OID 8592005)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8592135)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8592240)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8592245)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8592250)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2717 (class 2606 OID 8592270)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2720 (class 2606 OID 8592255)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2716 (class 2606 OID 8592275)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8592265)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2719 (class 2606 OID 8592260)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2664 (class 2606 OID 8592000)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2665 (class 2606 OID 8591995)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 8591960)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2657 (class 2606 OID 8591955)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8592165)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8592075)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 8591935)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2652 (class 2606 OID 8591940)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2699 (class 2606 OID 8592180)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8592175)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2701 (class 2606 OID 8592170)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2670 (class 2606 OID 8592015)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2668 (class 2606 OID 8592025)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8592020)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8592340)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2684 (class 2606 OID 8592110)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2686 (class 2606 OID 8592100)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2687 (class 2606 OID 8592095)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2685 (class 2606 OID 8592105)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2651 (class 2606 OID 8591925)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2650 (class 2606 OID 8591930)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8592160)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8592140)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2707 (class 2606 OID 8592205)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2706 (class 2606 OID 8592210)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2727 (class 2606 OID 8592325)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2730 (class 2606 OID 8592310)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2729 (class 2606 OID 8592315)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2728 (class 2606 OID 8592320)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8591985)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2663 (class 2606 OID 8591980)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2661 (class 2606 OID 8591990)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2711 (class 2606 OID 8592225)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2710 (class 2606 OID 8592230)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2724 (class 2606 OID 8592300)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2723 (class 2606 OID 8592305)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2726 (class 2606 OID 8592290)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2725 (class 2606 OID 8592295)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8592200)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2688 (class 2606 OID 8592130)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2689 (class 2606 OID 8592125)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2691 (class 2606 OID 8592115)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2690 (class 2606 OID 8592120)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2721 (class 2606 OID 8592285)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2722 (class 2606 OID 8592280)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8592330)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8592030)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8592235)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8592335)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2654 (class 2606 OID 8591950)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2655 (class 2606 OID 8591945)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2659 (class 2606 OID 8591965)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 8591970)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2681 (class 2606 OID 8592090)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8592085)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2683 (class 2606 OID 8592080)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-30 16:38:47 CEST

--
-- PostgreSQL database dump complete
--

