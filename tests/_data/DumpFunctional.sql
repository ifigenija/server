--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.3.8
-- Started on 2015-07-01 13:28:56 CEST

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
-- TOC entry 183 (class 1259 OID 8728977)
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
-- TOC entry 230 (class 1259 OID 8729495)
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
-- TOC entry 229 (class 1259 OID 8729478)
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
-- TOC entry 222 (class 1259 OID 8729382)
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
-- TOC entry 197 (class 1259 OID 8729156)
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
-- TOC entry 200 (class 1259 OID 8729190)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 8729584)
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
-- TOC entry 192 (class 1259 OID 8729099)
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
-- TOC entry 231 (class 1259 OID 8729508)
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
-- TOC entry 216 (class 1259 OID 8729316)
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
-- TOC entry 195 (class 1259 OID 8729136)
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
-- TOC entry 199 (class 1259 OID 8729184)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 193 (class 1259 OID 8729116)
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
-- TOC entry 205 (class 1259 OID 8729233)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 209 (class 1259 OID 8729258)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 190 (class 1259 OID 8729073)
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
-- TOC entry 184 (class 1259 OID 8728986)
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
-- TOC entry 185 (class 1259 OID 8728997)
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
-- TOC entry 180 (class 1259 OID 8728951)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 8728970)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 8729265)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 8729296)
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
-- TOC entry 226 (class 1259 OID 8729428)
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
-- TOC entry 187 (class 1259 OID 8729030)
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
-- TOC entry 189 (class 1259 OID 8729065)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 8729239)
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
-- TOC entry 188 (class 1259 OID 8729050)
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
-- TOC entry 194 (class 1259 OID 8729128)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 208 (class 1259 OID 8729251)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 8729371)
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
-- TOC entry 225 (class 1259 OID 8729420)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 8729554)
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
-- TOC entry 212 (class 1259 OID 8729280)
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
-- TOC entry 204 (class 1259 OID 8729224)
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
-- TOC entry 203 (class 1259 OID 8729214)
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
-- TOC entry 224 (class 1259 OID 8729409)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 219 (class 1259 OID 8729348)
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
-- TOC entry 177 (class 1259 OID 8728922)
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
-- TOC entry 176 (class 1259 OID 8728920)
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
-- TOC entry 213 (class 1259 OID 8729290)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 8728960)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 8728944)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 8729304)
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
-- TOC entry 207 (class 1259 OID 8729245)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 8729195)
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
-- TOC entry 237 (class 1259 OID 8729604)
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
-- TOC entry 236 (class 1259 OID 8729596)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 235 (class 1259 OID 8729591)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 8729358)
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
-- TOC entry 186 (class 1259 OID 8729022)
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
-- TOC entry 202 (class 1259 OID 8729201)
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
-- TOC entry 223 (class 1259 OID 8729398)
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
-- TOC entry 233 (class 1259 OID 8729573)
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
-- TOC entry 191 (class 1259 OID 8729085)
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
-- TOC entry 178 (class 1259 OID 8728931)
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
-- TOC entry 228 (class 1259 OID 8729455)
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
-- TOC entry 196 (class 1259 OID 8729147)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 8729272)
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
-- TOC entry 218 (class 1259 OID 8729341)
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
-- TOC entry 198 (class 1259 OID 8729179)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 8729445)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 217 (class 1259 OID 8729331)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2208 (class 2604 OID 8728925)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2854 (class 0 OID 8728977)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2901 (class 0 OID 8729495)
-- Dependencies: 230
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5593-cef7-d286-53e728af741c	000d0000-5593-cef7-718b-939b9d18d2f4	\N	00090000-5593-cef7-4da3-70f793a74dec	000b0000-5593-cef7-0471-7751a91d7ee6	0001	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-cef7-a582-4b1a879d5a49	000d0000-5593-cef7-5d65-7a713372acd7	\N	00090000-5593-cef7-231b-44535f46450b	\N	0002	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-cef7-581c-ec97a867e8db	000d0000-5593-cef7-4ead-7fdd31a0b132	\N	00090000-5593-cef7-eb12-5119afb573e2	\N	0003	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-cef7-fae6-f4ecd757dba0	000d0000-5593-cef7-1097-1d22bcc038dc	\N	00090000-5593-cef7-fa04-3c1964836a18	\N	0004	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-cef7-5c34-c6cb71f93597	000d0000-5593-cef7-7364-55127bca6e81	\N	00090000-5593-cef7-d532-194bb5eec3df	\N	0005	f	\N	\N	\N	\N	\N	\N	\N	\N
000c0000-5593-cef7-7681-d5bfe7ea5879	000d0000-5593-cef7-8563-6c5bb42b5a62	\N	00090000-5593-cef7-231b-44535f46450b	\N	0006	f	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2900 (class 0 OID 8729478)
-- Dependencies: 229
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2893 (class 0 OID 8729382)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5593-cef7-c660-89f858d37fe1	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Milan Jesih	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N
00160000-5593-cef7-c8fc-a6995c200f16	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Vladimir Levstik	Svetovna uspešnica	\N	\N	\N
00160000-5593-cef7-c589-e6d7e26c3024	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8			\N	\N	\N
\.


--
-- TOC entry 2868 (class 0 OID 8729156)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5593-cef7-51f1-9275d55e74be	\N	\N	00200000-5593-cef7-50ca-0fdf05fa3f77	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5593-cef7-3209-3678516384fb	\N	\N	00200000-5593-cef7-66ac-f79a7b8d6d86	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5593-cef7-6bc4-65bdfcb8365f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5593-cef7-4d6b-c0ded482b75e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5593-cef7-cdd5-6296ffeb7426	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2871 (class 0 OID 8729190)
-- Dependencies: 200
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2905 (class 0 OID 8729584)
-- Dependencies: 234
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 8729099)
-- Dependencies: 192
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5593-cef5-c66c-d073fc436c72	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5593-cef5-63a0-53175add3cb4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5593-cef5-dccc-526bc2f9d996	AL	ALB	008	Albania 	Albanija	\N
00040000-5593-cef5-3439-b5f1d93328c6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5593-cef5-0c56-3917aae4067e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5593-cef5-1359-10aa1a2468ed	AD	AND	020	Andorra 	Andora	\N
00040000-5593-cef5-5a4f-b60ab36b1d94	AO	AGO	024	Angola 	Angola	\N
00040000-5593-cef5-b7c8-d34fed865c78	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5593-cef5-2581-e9f6091141e7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5593-cef5-e40f-371462bde069	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-cef5-f0cc-fe803647f122	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5593-cef5-ee92-3e3c63bff3da	AM	ARM	051	Armenia 	Armenija	\N
00040000-5593-cef5-86f5-0a7ed38bd953	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5593-cef5-ba5d-ee7a3223a97b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5593-cef5-839a-71480fa7f576	AT	AUT	040	Austria 	Avstrija	\N
00040000-5593-cef5-5326-0221bd34d63f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5593-cef5-6e86-a1add5a10fe4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5593-cef5-dc1b-5b96c67519e6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5593-cef5-5649-194fb04dc992	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5593-cef5-6ca8-fb342226d04e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5593-cef5-5f18-33a963defedb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5593-cef5-62eb-1c49bebd7b6d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5593-cef5-54c3-f01caa5e5a23	BZ	BLZ	084	Belize 	Belize	\N
00040000-5593-cef5-6ae0-4c51ad4f5792	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5593-cef5-2bf7-b17d1f20f4f8	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5593-cef5-fbf5-aab7df2f75a1	BT	BTN	064	Bhutan 	Butan	\N
00040000-5593-cef5-dfca-9a18eb4a8671	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5593-cef5-a0d5-eb8470e5f8f0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5593-cef5-a163-cf43916b6e3f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5593-cef5-79c1-ef97b89d101a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5593-cef5-a454-970f9c3cf7d5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5593-cef5-0b6d-859968ae603d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5593-cef5-00e1-070cd51fe148	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5593-cef5-6f85-161257e3b4a7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5593-cef5-206c-9088e65b2eb1	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5593-cef5-2393-d16d522e0986	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5593-cef5-899e-72cf89010209	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5593-cef5-8e01-382d06c6dd97	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5593-cef5-e08b-00829f19752d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5593-cef5-52b9-b1811aea1ad8	CA	CAN	124	Canada 	Kanada	\N
00040000-5593-cef5-2f22-5a88eca82798	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5593-cef5-0209-0895c6a48064	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5593-cef5-7cea-2849deb9ac59	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5593-cef5-2de9-61da7c058066	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5593-cef5-a2b3-8d1343a7a841	CL	CHL	152	Chile 	Čile	\N
00040000-5593-cef5-74d5-cddb5489fa94	CN	CHN	156	China 	Kitajska	\N
00040000-5593-cef5-4007-8eec76c6d4c4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5593-cef5-c475-06ba9c46097d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5593-cef5-9f9f-6285b4ec543a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5593-cef5-93d4-46a5e138f639	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5593-cef5-ffea-de37c9fb9553	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5593-cef5-c9a9-727fa7fa4dad	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5593-cef5-4604-a0d123751dc3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5593-cef5-7fd5-0afc6a22972c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5593-cef5-9b1a-ea1927e5f755	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5593-cef5-303d-f5e2db04f474	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5593-cef5-cea2-917ee5d82366	CU	CUB	192	Cuba 	Kuba	\N
00040000-5593-cef5-ca22-273bc48cd6fb	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5593-cef5-8368-4d8d84754c21	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5593-cef5-3c7c-15cbf1b15981	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5593-cef5-bbc1-7f898e3c59f6	DK	DNK	208	Denmark 	Danska	\N
00040000-5593-cef5-2ddd-a94719b299e8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5593-cef5-b556-1f95c07bbf50	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5593-cef5-38b1-e87bcd0a1e59	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5593-cef5-dd5b-5d2f8df5421e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5593-cef5-1d4e-1ffb50d449a3	EG	EGY	818	Egypt 	Egipt	\N
00040000-5593-cef5-14f6-6e2564150e74	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5593-cef5-d785-5cdebe594f12	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5593-cef5-6d93-dd0585966db6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5593-cef5-b7c1-801e14b0c0eb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5593-cef5-2ddf-5229290d9ec9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5593-cef5-1a30-b7efdd5b4ab1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5593-cef5-6d25-8c404c65c4d8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5593-cef5-02d4-9d96f648ddf8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5593-cef5-40ef-de0cd7a05f8a	FI	FIN	246	Finland 	Finska	\N
00040000-5593-cef5-53a2-9de76d77f94f	FR	FRA	250	France 	Francija	\N
00040000-5593-cef5-4fd0-cdfe9eca5d80	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5593-cef5-89ab-69d02b897ebe	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5593-cef5-be87-06b12abafb31	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5593-cef5-dbe3-ee8e612057cc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5593-cef5-cb4f-ef3bd9aa01f1	GA	GAB	266	Gabon 	Gabon	\N
00040000-5593-cef5-910e-cb55669a8adf	GM	GMB	270	Gambia 	Gambija	\N
00040000-5593-cef5-100b-38291f01f547	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5593-cef5-6f8d-f55c5109b3bf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5593-cef5-c7dc-6e9c4d8c5afe	GH	GHA	288	Ghana 	Gana	\N
00040000-5593-cef5-bacf-c7be58f87c8d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5593-cef5-29de-254775530381	GR	GRC	300	Greece 	Grčija	\N
00040000-5593-cef5-7606-c8f1ee761f72	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5593-cef5-e707-564ea164f99e	GD	GRD	308	Grenada 	Grenada	\N
00040000-5593-cef5-222d-2fe26a978195	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5593-cef5-d39e-e02614ff7f7d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5593-cef5-a984-1d24dcf4614a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5593-cef5-440e-28cb981574f8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5593-cef5-cfa6-30a6d680235f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5593-cef5-8d8e-61dba356143e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5593-cef5-5ea0-0a95aa774f48	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5593-cef5-fd23-3f9f7d6bc05e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5593-cef5-927d-3a5e78951e1d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5593-cef5-7c47-0898010237d3	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5593-cef5-16e8-711e1e6dfcc0	HN	HND	340	Honduras 	Honduras	\N
00040000-5593-cef5-5368-b340d3ba70e0	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5593-cef5-d608-da41790a1f43	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5593-cef5-482d-3cd1a95ae52f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5593-cef5-0a65-cd08832bce21	IN	IND	356	India 	Indija	\N
00040000-5593-cef5-d57b-1a5fa611bdd1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5593-cef5-e6b7-11fe56d99b75	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5593-cef5-5a5a-59b8eeb0fb14	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5593-cef5-cc19-3a74309cdba7	IE	IRL	372	Ireland 	Irska	\N
00040000-5593-cef5-abbb-d06aea07d62e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5593-cef5-d508-4ec306c3afa4	IL	ISR	376	Israel 	Izrael	\N
00040000-5593-cef5-0c7f-ae0ac482e3b1	IT	ITA	380	Italy 	Italija	\N
00040000-5593-cef5-1219-768c45c2ded5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5593-cef5-5481-406a17ed773d	JP	JPN	392	Japan 	Japonska	\N
00040000-5593-cef5-8d64-0b44598b0c36	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5593-cef5-f8c8-4347f531424f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5593-cef5-dcf8-2a7eeb14539d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5593-cef5-d746-774576b674f8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5593-cef5-dc38-542231e3c5f1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5593-cef5-8da5-19484fccd513	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5593-cef5-8f09-13b4caf84ef1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5593-cef5-2818-1942a49507d1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5593-cef5-69ab-b3162a4953e0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5593-cef5-7df5-959f29804484	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5593-cef5-47f2-82bd94fd2014	LV	LVA	428	Latvia 	Latvija	\N
00040000-5593-cef5-9ae6-ab0d7d548f36	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5593-cef5-f291-97637d7aed0a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5593-cef5-66ed-7bf1f7c134bf	LR	LBR	430	Liberia 	Liberija	\N
00040000-5593-cef5-a1ae-402f2572176c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5593-cef5-dd00-5365a6fe7461	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5593-cef5-080c-38b22f012213	LT	LTU	440	Lithuania 	Litva	\N
00040000-5593-cef5-3ba1-d6f04764104c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5593-cef5-b7aa-f804ad24d453	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5593-cef5-e666-50d39c9465f5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5593-cef5-ff9c-09a7892e28c0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5593-cef5-19c0-b383c7afc075	MW	MWI	454	Malawi 	Malavi	\N
00040000-5593-cef5-56f1-44658a575b7a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5593-cef5-5a6a-d0005ae5f3c8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5593-cef5-3cd7-72f5d100e116	ML	MLI	466	Mali 	Mali	\N
00040000-5593-cef5-c939-ed5dc036c854	MT	MLT	470	Malta 	Malta	\N
00040000-5593-cef5-c034-c6784b231eb4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5593-cef5-bd9c-8a07158d0f37	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5593-cef5-9e39-2d88debd45f5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5593-cef5-f85f-5d4592fc2c71	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5593-cef5-0d13-a363db7ed97d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5593-cef5-c675-4343d2bddc8a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5593-cef5-9ed5-8e313e378118	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5593-cef5-c7e5-892ec68a08de	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5593-cef5-e390-c412fddc8f3a	MC	MCO	492	Monaco 	Monako	\N
00040000-5593-cef5-6460-b21bc1dfbfd4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5593-cef5-37ce-f12394c66c5b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5593-cef5-cd28-82dc20c52cac	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5593-cef5-521a-e0bb7a9d0e50	MA	MAR	504	Morocco 	Maroko	\N
00040000-5593-cef5-b38f-8a6df5d26068	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5593-cef5-8ca4-7173d2f03bda	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5593-cef5-8c75-f090f720b497	NA	NAM	516	Namibia 	Namibija	\N
00040000-5593-cef5-0069-df8342551cf5	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5593-cef5-e1f7-0427e0819922	NP	NPL	524	Nepal 	Nepal	\N
00040000-5593-cef5-c4cb-8520b4d4539d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5593-cef5-9488-bf5ddfbdc0d7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5593-cef5-0b92-7839113592a1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5593-cef5-fed0-31bd120f8316	NE	NER	562	Niger 	Niger 	\N
00040000-5593-cef5-033c-551169092a44	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5593-cef5-045a-0984ed985aab	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5593-cef5-0ec1-74aa7ec48999	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5593-cef5-72eb-538c6692b09a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5593-cef5-8c67-e573126f9871	NO	NOR	578	Norway 	Norveška	\N
00040000-5593-cef5-af11-a54a198528b6	OM	OMN	512	Oman 	Oman	\N
00040000-5593-cef5-8a27-c1d7d9d3865e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5593-cef5-3713-17a87dbf1788	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5593-cef5-39ae-9cf467038eb6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5593-cef5-4d7b-d6d0ad1ea603	PA	PAN	591	Panama 	Panama	\N
00040000-5593-cef5-25ff-8f79ff880c04	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5593-cef5-4ed5-bbbfe25936a7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5593-cef5-7f27-f42d29d00694	PE	PER	604	Peru 	Peru	\N
00040000-5593-cef5-b9aa-3f5a492ed0f7	PH	PHL	608	Philippines 	Filipini	\N
00040000-5593-cef5-8ca1-fee10eeee440	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5593-cef5-5da0-f6a1fc15f7d3	PL	POL	616	Poland 	Poljska	\N
00040000-5593-cef5-f722-127c991547f6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5593-cef5-9043-66838a853653	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5593-cef5-e63e-05580999896d	QA	QAT	634	Qatar 	Katar	\N
00040000-5593-cef5-6f65-1ae9a874c9e2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5593-cef5-ebf5-91f5be90806a	RO	ROU	642	Romania 	Romunija	\N
00040000-5593-cef5-4921-70ace79df7c7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5593-cef5-c186-42cf9c565943	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5593-cef5-c32e-86771fb1394d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5593-cef5-7150-65951a87febf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5593-cef5-9024-76e91429fd88	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5593-cef5-1951-a7d94380f80b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5593-cef5-9d84-06d49ca83661	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5593-cef5-252e-e7a1b14c0ee4	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5593-cef5-489f-897bd720c2d3	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5593-cef5-85ef-fc531bcb192e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5593-cef5-2a7c-cf85af871be8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5593-cef5-8efa-d3e8d749e267	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5593-cef5-fcce-3287dfceeffa	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5593-cef5-c36c-0bfd5058fc68	SN	SEN	686	Senegal 	Senegal	\N
00040000-5593-cef5-0b24-6bfc55f87ce8	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5593-cef5-d5e4-4383c4c3accc	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5593-cef5-016f-9762ed28e744	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5593-cef5-4045-82f28364cf66	SG	SGP	702	Singapore 	Singapur	\N
00040000-5593-cef5-d9e4-0edd8a8a764a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5593-cef5-a899-70fabc86dca1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5593-cef5-d99e-35fefbaab03a	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5593-cef5-6eb5-cf842ba7b07c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5593-cef5-a63c-999fc9274c25	SO	SOM	706	Somalia 	Somalija	\N
00040000-5593-cef5-2a25-8f8104398991	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5593-cef5-8e49-0ad40ece2da3	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5593-cef5-4813-def96ba41548	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5593-cef5-e88a-0aeb10549be2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5593-cef5-660e-219069b186a9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5593-cef5-464d-319b123e9e82	SD	SDN	729	Sudan 	Sudan	\N
00040000-5593-cef5-2147-15ba057ed668	SR	SUR	740	Suriname 	Surinam	\N
00040000-5593-cef5-8e16-08dea7c5ac6d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5593-cef5-d112-22a495ddd599	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5593-cef5-9104-0bc2fa1f3558	SE	SWE	752	Sweden 	Švedska	\N
00040000-5593-cef5-6c6a-8361c5bb3d09	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5593-cef5-9d09-224c8f40332c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5593-cef5-e8d5-0d3f414241b1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5593-cef5-a806-05c843028cde	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5593-cef5-9bd8-becc6a5a795d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5593-cef5-a661-07e27f77bdff	TH	THA	764	Thailand 	Tajska	\N
00040000-5593-cef5-941f-8c198b650361	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5593-cef5-2fef-7e843c9dd9bc	TG	TGO	768	Togo 	Togo	\N
00040000-5593-cef5-fd56-01f2b10c8e9d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5593-cef5-7743-6144d6741e4c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5593-cef5-e89a-c257bcd4274b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5593-cef5-917b-925c8d9c44e6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5593-cef5-16ed-06cfdca9a8c6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5593-cef5-d132-3ca34098e78a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5593-cef5-aa37-4443bf6a0d1a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-cef5-b344-fe15975acb36	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5593-cef5-5b19-2baecd8e18e4	UG	UGA	800	Uganda 	Uganda	\N
00040000-5593-cef5-ba8a-6375f415d70a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5593-cef5-efa1-60694a61951d	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5593-cef5-7b93-9227fc942804	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5593-cef5-9e57-807f97641960	US	USA	840	United States 	Združene države Amerike	\N
00040000-5593-cef5-8600-904a157f7dc9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5593-cef5-e7fd-74bbbd9c8f03	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5593-cef5-7c5a-4c702ebf0288	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5593-cef5-0a76-5258d52a3bb9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5593-cef5-46ca-cc37276e6c20	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5593-cef5-89a0-3afdb3b7ffb9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5593-cef5-2e18-9b0e77f24d54	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5593-cef5-3b5f-0c5ee5f39859	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5593-cef5-5a02-365ca6dd7f7b	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5593-cef5-6326-98e81f763214	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5593-cef5-6289-bc66ad5484c8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5593-cef5-01d7-3fa7530ea861	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5593-cef5-d818-001d130d0127	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2902 (class 0 OID 8729508)
-- Dependencies: 231
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, vlozekgostitelja, vlozekkoproducenta, drugijavni, stzaposlenih, stdrugih, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, naziv, sort, tipprogramskeenote_id, tip, krajgostovanja, ustanova, datumgostovanja, transportnistroski, odkup, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, stpe, zvrst, stpredstav, stpredavanj, stpredstavitev, stdelavnic, stdrugidogodki, opredelitevdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, soorganizatorji, sttujihselektorjev) FROM stdin;
002f0000-5593-cef7-b177-a2453ce26404	000e0000-5593-cef7-9367-bb180d436637	\N	\N	10000.80	70000.00	2222.30	4000.40	200.20	0.00	100.10	100.20	2	2	2	2	2	0	0	0	0	0	0	0	0	Raznovrstni dogodek		\N	002b0000-5593-cef6-b170-d34ff1d63360	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5593-cef7-b6fc-f1a25e38f844	000e0000-5593-cef7-d26a-aa1158de7e68	\N	\N	5000.00	3000.00	1000.20	600.70	200.20	0.00	100.10	100.20	3	3	3	3	3	0	0	0	0	0	0	0	0	Širjenje kulture med mladimi		\N	002b0000-5593-cef6-c1d4-e597820e6a8b	premiera	\N	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2887 (class 0 OID 8729316)
-- Dependencies: 216
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5593-cef7-6f44-ac7817a67af9	000e0000-5593-cef7-d26a-aa1158de7e68	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5593-cef6-b173-cec4db223aab
000d0000-5593-cef7-718b-939b9d18d2f4	000e0000-5593-cef7-d26a-aa1158de7e68	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-cef6-b173-cec4db223aab
000d0000-5593-cef7-5d65-7a713372acd7	000e0000-5593-cef7-d26a-aa1158de7e68	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5593-cef6-dbf3-7ed47ca89ae6
000d0000-5593-cef7-4ead-7fdd31a0b132	000e0000-5593-cef7-d26a-aa1158de7e68	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5593-cef6-0ae2-0bb7db93bfd4
000d0000-5593-cef7-1097-1d22bcc038dc	000e0000-5593-cef7-d26a-aa1158de7e68	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5593-cef6-0ae2-0bb7db93bfd4
000d0000-5593-cef7-7364-55127bca6e81	000e0000-5593-cef7-d26a-aa1158de7e68	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5593-cef6-0ae2-0bb7db93bfd4
000d0000-5593-cef7-8563-6c5bb42b5a62	000e0000-5593-cef7-d26a-aa1158de7e68	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5593-cef6-b173-cec4db223aab
\.


--
-- TOC entry 2866 (class 0 OID 8729136)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2870 (class 0 OID 8729184)
-- Dependencies: 199
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 8729116)
-- Dependencies: 193
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5593-cef7-8013-8df39157d17d	00080000-5593-cef7-5bb2-907a272b56ba	00090000-5593-cef7-4da3-70f793a74dec	AK		
\.


--
-- TOC entry 2841 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2876 (class 0 OID 8729233)
-- Dependencies: 205
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2880 (class 0 OID 8729258)
-- Dependencies: 209
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 8729073)
-- Dependencies: 190
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5593-cef6-efc8-bbab109008e7	popa.tipkli	array	a:5:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}s:7:"maticno";a:1:{s:5:"label";s:17:"Matično podjetje";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5593-cef6-8103-afabd745b94c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5593-cef6-13d7-302f8fd8cea0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5593-cef6-fcc7-e92a8c60e92d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5593-cef6-5ce9-0e63a64ae506	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5593-cef6-2db5-238ac03bfd8b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5593-cef6-b12a-69b2dbed3d53	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5593-cef6-e21e-2f31eb2722b3	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-cef6-e02f-23b4045fe56e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5593-cef6-4afb-73a356864b8b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5593-cef6-607c-199e0a118c86	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5593-cef6-650a-66840572a65b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5593-cef6-acd9-e2ebee7af1a7	strosekuprizoritve.tipstroska	array	a:2:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}s:8:"tantiema";a:1:{s:5:"label";s:17:"Strošek tantieme";}}	f	t	f	\N	Tip stroška
00000000-5593-cef7-c0f5-8b6db47ec1e6	application.tenant.maticnopodjetje	string	s:4:"0900";	f	t	f	\N	Šifra matičnega podjetja v Popa in ProdukcijskaHisa
00000000-5593-cef7-5000-3c9f44bd1c7e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5593-cef7-7a35-ef58235f1aec	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5593-cef7-adc1-1310cac2e5d6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5593-cef7-0a57-5fc2485cb91c	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5593-cef7-14c1-3b237508ec6b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
\.


--
-- TOC entry 2855 (class 0 OID 8728986)
-- Dependencies: 184
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5593-cef7-b20b-7f36a8decb23	00000000-5593-cef7-5000-3c9f44bd1c7e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5593-cef7-ec61-2ace90704e0e	00000000-5593-cef7-5000-3c9f44bd1c7e	00010000-5593-cef6-9288-1f1c6724e194	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5593-cef7-6862-d51df9a85217	00000000-5593-cef7-7a35-ef58235f1aec	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2856 (class 0 OID 8728997)
-- Dependencies: 185
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5593-cef7-367e-042d62fd29be	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5593-cef7-fa04-3c1964836a18	00010000-5593-cef7-7641-fdb16c7124eb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5593-cef7-eb12-5119afb573e2	00010000-5593-cef7-54fe-5fdb083079a8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5593-cef7-9ceb-dc2aeaf47a47	00010000-5593-cef7-c3f3-401c5cdba802	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5593-cef7-18f2-0931ba94b4ff	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5593-cef7-c51d-528c539e879a	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5593-cef7-867c-4708bdcf17d5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5593-cef7-77bb-a02ef9f12691	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5593-cef7-4da3-70f793a74dec	00010000-5593-cef7-35d4-6748f0f0a927	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5593-cef7-231b-44535f46450b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5593-cef7-b26e-fd2130f318ae	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5593-cef7-d532-194bb5eec3df	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5593-cef7-be0b-997e1b71b226	00010000-5593-cef7-d7fa-390f5c50a91a	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2843 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 8728951)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5593-cef5-834d-3b8b63a9715c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5593-cef5-658c-12a80eadcab7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5593-cef5-ca02-5354850a69cd	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5593-cef5-e0c2-dc3fa3b30175	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5593-cef5-9c95-5f55e9559e6e	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5593-cef5-9f74-ad9f049604f0	Abonma-read	Abonma - branje	f
00030000-5593-cef5-6efe-7383795582db	Abonma-write	Abonma - spreminjanje	f
00030000-5593-cef5-47d7-5eefebd3e160	Alternacija-read	Alternacija - branje	f
00030000-5593-cef5-fcb5-970314e30213	Alternacija-write	Alternacija - spreminjanje	f
00030000-5593-cef5-76f5-941e5f1da8a1	Arhivalija-read	Arhivalija - branje	f
00030000-5593-cef5-f733-1ca7a9a91ebb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5593-cef5-dd2e-22b3e9f8830b	Besedilo-read	Besedilo - branje	f
00030000-5593-cef5-684e-6d3d23585406	Besedilo-write	Besedilo - spreminjanje	f
00030000-5593-cef5-57a9-d96368dde296	DogodekIzven-read	DogodekIzven - branje	f
00030000-5593-cef5-83e3-dc9a2141840e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5593-cef5-c1da-de09e01ac290	Dogodek-read	Dogodek - branje	f
00030000-5593-cef5-77bb-60a8b06eff1f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5593-cef5-262a-a66d5ab95f98	DrugiVir-read	DrugiVir - branje	f
00030000-5593-cef5-2f63-e4ae14cc91e2	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5593-cef5-ecdc-65123422b8e7	Drzava-read	Drzava - branje	f
00030000-5593-cef5-c827-5752db92f9b7	Drzava-write	Drzava - spreminjanje	f
00030000-5593-cef5-4198-d5f4dce72e5d	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5593-cef5-3583-086a72c9565a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5593-cef5-4f12-fa183db4290d	Funkcija-read	Funkcija - branje	f
00030000-5593-cef5-8f63-4e7e7b229c7b	Funkcija-write	Funkcija - spreminjanje	f
00030000-5593-cef5-76f9-6cc354806492	Gostovanje-read	Gostovanje - branje	f
00030000-5593-cef5-5aaa-975b91028680	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5593-cef5-c2e7-4fccfdaf4b62	Gostujoca-read	Gostujoca - branje	f
00030000-5593-cef5-4b81-7078a7cc7ebb	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5593-cef5-2f5b-f15393771440	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5593-cef5-38fa-08d90d6fedde	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5593-cef5-71c0-1d77a4616995	Kupec-read	Kupec - branje	f
00030000-5593-cef5-6ddd-df7fcaeb1ed7	Kupec-write	Kupec - spreminjanje	f
00030000-5593-cef5-07bd-2734ff08aa7e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5593-cef5-62a0-eb9e06027037	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5593-cef5-633f-38fc5ec0e700	Option-read	Option - branje	f
00030000-5593-cef5-a36e-2e2aa234fc2e	Option-write	Option - spreminjanje	f
00030000-5593-cef5-f245-fa48710520e7	OptionValue-read	OptionValue - branje	f
00030000-5593-cef5-5716-342524a32a93	OptionValue-write	OptionValue - spreminjanje	f
00030000-5593-cef5-4625-402f697fd671	Oseba-read	Oseba - branje	f
00030000-5593-cef5-b9fe-39937f2a8a4c	Oseba-write	Oseba - spreminjanje	f
00030000-5593-cef5-e062-b043850727bc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5593-cef5-39e0-112a5b806603	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5593-cef5-f6cc-7a1fa805ce54	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5593-cef5-30de-eac24d356332	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5593-cef5-b1a1-7ea7242baaf8	Pogodba-read	Pogodba - branje	f
00030000-5593-cef5-d745-d3af0866ac9e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5593-cef5-d860-bbe4c256b315	Popa-read	Popa - branje	f
00030000-5593-cef5-516a-398c2ec49159	Popa-write	Popa - spreminjanje	f
00030000-5593-cef5-70c0-e560f361ec64	Posta-read	Posta - branje	f
00030000-5593-cef5-680a-04eb894b6dc9	Posta-write	Posta - spreminjanje	f
00030000-5593-cef5-d2ca-12e70d93e78f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5593-cef5-0ec3-12fc65bb6eb9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5593-cef5-31dc-0849a2654b41	PostniNaslov-read	PostniNaslov - branje	f
00030000-5593-cef5-70c0-ee0a08750772	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5593-cef5-fa2c-3b14c087ad9f	Predstava-read	Predstava - branje	f
00030000-5593-cef5-6e97-c7b894441a3c	Predstava-write	Predstava - spreminjanje	f
00030000-5593-cef5-51dc-7e79a4348350	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5593-cef5-6666-bf9732e0b742	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5593-cef5-a48e-eec02ecd0db6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5593-cef5-6664-26a8e1882596	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5593-cef5-2052-7fe603e03385	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5593-cef5-f68d-54591f5ded98	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5593-cef5-f68d-2c27a5b46aa3	ProgramDela-read	ProgramDela - branje	f
00030000-5593-cef5-eefd-0f3e8f68f12e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5593-cef5-deea-383ea4bf332a	ProgramFestival-read	ProgramFestival - branje	f
00030000-5593-cef5-14f9-2d94a4831ef8	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5593-cef5-240d-5f0a6bb6a0bd	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5593-cef5-053c-d66afa0f0312	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5593-cef5-65e9-06d6d857c7b5	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5593-cef5-3060-b74d83a8d470	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5593-cef5-f844-d67dceaf023f	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5593-cef5-3eb8-42bb7285e9b9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5593-cef5-95c6-6c3b3eefa7e9	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5593-cef5-5790-98eb7e16a07c	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5593-cef5-6094-50d6d17983a8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5593-cef5-ae90-daebc2429cad	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5593-cef5-62e7-37ec671fae57	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5593-cef5-6b79-caeb4219c623	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5593-cef5-e122-9279398a9854	ProgramRazno-read	ProgramRazno - branje	f
00030000-5593-cef5-6fa4-b7190b4a770e	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5593-cef5-dbd9-8e304bc9761f	Prostor-read	Prostor - branje	f
00030000-5593-cef5-aba5-abcfd86c2e8e	Prostor-write	Prostor - spreminjanje	f
00030000-5593-cef5-0fc2-fbcd26f63775	Racun-read	Racun - branje	f
00030000-5593-cef5-2f21-79c5efb0415a	Racun-write	Racun - spreminjanje	f
00030000-5593-cef5-bcab-4d3abefa29f2	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5593-cef5-7e5c-b5ce87ecd366	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5593-cef5-c0aa-eb81cbca7447	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5593-cef5-76a2-73f85a7446ed	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5593-cef5-924d-296482d830c3	Rekvizit-read	Rekvizit - branje	f
00030000-5593-cef5-2f89-f35c79d72f4c	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5593-cef5-8a12-5ac52aee9923	Revizija-read	Revizija - branje	f
00030000-5593-cef5-6a31-faeafb3189c3	Revizija-write	Revizija - spreminjanje	f
00030000-5593-cef5-5d6a-bb234dd50d7e	Rezervacija-read	Rezervacija - branje	f
00030000-5593-cef5-8d38-ee4468955585	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5593-cef5-b391-1fa669a3e0d9	SedezniRed-read	SedezniRed - branje	f
00030000-5593-cef5-9d02-1ef01e1167f6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5593-cef5-3993-7555dd707934	Sedez-read	Sedez - branje	f
00030000-5593-cef5-08ec-3f208b7cf8a6	Sedez-write	Sedez - spreminjanje	f
00030000-5593-cef5-c4ef-f27e5c17c2a3	Sezona-read	Sezona - branje	f
00030000-5593-cef5-1645-bf671a0242a4	Sezona-write	Sezona - spreminjanje	f
00030000-5593-cef5-f17e-17030f65fff0	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5593-cef5-09be-83314c0e8dbf	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5593-cef5-aa40-07baef34f9e7	Stevilcenje-read	Stevilcenje - branje	f
00030000-5593-cef5-97a7-c833e293cb83	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5593-cef5-8245-9a58f2091e01	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5593-cef5-1525-097d5aca23b7	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5593-cef5-d510-c372271f5403	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5593-cef5-609e-a3f3d11bd86e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5593-cef5-94e3-17c2642ae9aa	Telefonska-read	Telefonska - branje	f
00030000-5593-cef5-0443-a2146bdaf583	Telefonska-write	Telefonska - spreminjanje	f
00030000-5593-cef5-896e-66040d42ed0c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5593-cef5-b134-46c29e069c4e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5593-cef5-9084-f87468d64e35	TipFunkcije-read	TipFunkcije - branje	f
00030000-5593-cef5-c4f6-66935bdba157	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5593-cef5-0c3e-1cdd1cf0a925	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5593-cef5-d906-c949520f0ec2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5593-cef5-50a1-ea50cb6a1b20	Trr-read	Trr - branje	f
00030000-5593-cef5-fe7b-5d101d10b812	Trr-write	Trr - spreminjanje	f
00030000-5593-cef5-05a6-5bd121eee55d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5593-cef5-8209-a611d0116b03	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5593-cef5-db55-c64eea84e89d	Vaja-read	Vaja - branje	f
00030000-5593-cef5-6d0c-f37006cd06cd	Vaja-write	Vaja - spreminjanje	f
00030000-5593-cef5-397e-c4399afcdcd1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5593-cef5-57d5-7e57a5a4541f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5593-cef5-9c1b-6defa54f6ba9	Zaposlitev-read	Zaposlitev - branje	f
00030000-5593-cef5-78a1-c6c7d0c63171	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5593-cef5-28bf-629afab5c604	Zasedenost-read	Zasedenost - branje	f
00030000-5593-cef5-abba-5d9bd96d7a9a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5593-cef5-e7e5-32b67ba2072c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5593-cef5-7316-bcfbdfc57405	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5593-cef5-4ab9-c8c977401380	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5593-cef5-734c-d9700b46d553	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2853 (class 0 OID 8728970)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5593-cef5-9e2a-b86821fe84c2	00030000-5593-cef5-658c-12a80eadcab7
00020000-5593-cef5-1f36-ffb2a899ca2c	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-6efe-7383795582db
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-47d7-5eefebd3e160
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-fcb5-970314e30213
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-e0c2-dc3fa3b30175
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-77bb-60a8b06eff1f
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-c827-5752db92f9b7
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-4f12-fa183db4290d
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-8f63-4e7e7b229c7b
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-5aaa-975b91028680
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-4b81-7078a7cc7ebb
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-2f5b-f15393771440
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-38fa-08d90d6fedde
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-4625-402f697fd671
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-b9fe-39937f2a8a4c
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-516a-398c2ec49159
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-680a-04eb894b6dc9
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-31dc-0849a2654b41
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-70c0-ee0a08750772
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-6e97-c7b894441a3c
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-2052-7fe603e03385
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-f68d-54591f5ded98
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-aba5-abcfd86c2e8e
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-76a2-73f85a7446ed
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-2f89-f35c79d72f4c
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-1645-bf671a0242a4
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-9084-f87468d64e35
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-05a6-5bd121eee55d
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-8209-a611d0116b03
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-db55-c64eea84e89d
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-6d0c-f37006cd06cd
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-28bf-629afab5c604
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-abba-5d9bd96d7a9a
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef5-7128-70d95a0151c8	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-2f5b-f15393771440
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-38fa-08d90d6fedde
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-4625-402f697fd671
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-b9fe-39937f2a8a4c
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-31dc-0849a2654b41
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-70c0-ee0a08750772
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-94e3-17c2642ae9aa
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-0443-a2146bdaf583
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-50a1-ea50cb6a1b20
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-fe7b-5d101d10b812
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-9c1b-6defa54f6ba9
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-78a1-c6c7d0c63171
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef5-90cc-23f60aefc845	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-47d7-5eefebd3e160
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-f733-1ca7a9a91ebb
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-dd2e-22b3e9f8830b
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-57a9-d96368dde296
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-4f12-fa183db4290d
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-2f5b-f15393771440
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-4625-402f697fd671
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-2052-7fe603e03385
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-9084-f87468d64e35
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-db55-c64eea84e89d
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-28bf-629afab5c604
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef5-e851-9a810d3398c1	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-6efe-7383795582db
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-fcb5-970314e30213
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-9084-f87468d64e35
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef5-cfad-76f4956810ae	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-896e-66040d42ed0c
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-ca02-5354850a69cd
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-9084-f87468d64e35
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef5-ab56-331f1babdd12	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-834d-3b8b63a9715c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-658c-12a80eadcab7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-ca02-5354850a69cd
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-e0c2-dc3fa3b30175
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-9c95-5f55e9559e6e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-9f74-ad9f049604f0
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6efe-7383795582db
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-47d7-5eefebd3e160
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-fcb5-970314e30213
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-76f5-941e5f1da8a1
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f733-1ca7a9a91ebb
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-dd2e-22b3e9f8830b
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-684e-6d3d23585406
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-57a9-d96368dde296
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-83e3-dc9a2141840e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c1da-de09e01ac290
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-77bb-60a8b06eff1f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-ecdc-65123422b8e7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c827-5752db92f9b7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-4198-d5f4dce72e5d
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-3583-086a72c9565a
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-4f12-fa183db4290d
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-8f63-4e7e7b229c7b
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-76f9-6cc354806492
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-5aaa-975b91028680
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c2e7-4fccfdaf4b62
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-4b81-7078a7cc7ebb
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-2f5b-f15393771440
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-38fa-08d90d6fedde
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-71c0-1d77a4616995
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6ddd-df7fcaeb1ed7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-07bd-2734ff08aa7e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-62a0-eb9e06027037
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-633f-38fc5ec0e700
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-a36e-2e2aa234fc2e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f245-fa48710520e7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-5716-342524a32a93
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-4625-402f697fd671
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-b9fe-39937f2a8a4c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-e062-b043850727bc
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-39e0-112a5b806603
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f6cc-7a1fa805ce54
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-30de-eac24d356332
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-b1a1-7ea7242baaf8
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-d745-d3af0866ac9e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-d860-bbe4c256b315
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-516a-398c2ec49159
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-70c0-e560f361ec64
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-680a-04eb894b6dc9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-d2ca-12e70d93e78f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-0ec3-12fc65bb6eb9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-31dc-0849a2654b41
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-70c0-ee0a08750772
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-fa2c-3b14c087ad9f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6e97-c7b894441a3c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-51dc-7e79a4348350
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6666-bf9732e0b742
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-a48e-eec02ecd0db6
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6664-26a8e1882596
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-2052-7fe603e03385
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f68d-54591f5ded98
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f68d-2c27a5b46aa3
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-eefd-0f3e8f68f12e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-deea-383ea4bf332a
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-14f9-2d94a4831ef8
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-240d-5f0a6bb6a0bd
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-053c-d66afa0f0312
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-65e9-06d6d857c7b5
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-3060-b74d83a8d470
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f844-d67dceaf023f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-3eb8-42bb7285e9b9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-95c6-6c3b3eefa7e9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-5790-98eb7e16a07c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6094-50d6d17983a8
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-ae90-daebc2429cad
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-62e7-37ec671fae57
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6b79-caeb4219c623
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-e122-9279398a9854
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6fa4-b7190b4a770e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-dbd9-8e304bc9761f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-aba5-abcfd86c2e8e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-0fc2-fbcd26f63775
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-2f21-79c5efb0415a
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-bcab-4d3abefa29f2
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-7e5c-b5ce87ecd366
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c0aa-eb81cbca7447
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-76a2-73f85a7446ed
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-924d-296482d830c3
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-2f89-f35c79d72f4c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-8a12-5ac52aee9923
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6a31-faeafb3189c3
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-5d6a-bb234dd50d7e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-8d38-ee4468955585
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-b391-1fa669a3e0d9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-9d02-1ef01e1167f6
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-3993-7555dd707934
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-08ec-3f208b7cf8a6
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c4ef-f27e5c17c2a3
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-1645-bf671a0242a4
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-f17e-17030f65fff0
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-09be-83314c0e8dbf
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-aa40-07baef34f9e7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-97a7-c833e293cb83
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-8245-9a58f2091e01
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-1525-097d5aca23b7
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-d510-c372271f5403
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-609e-a3f3d11bd86e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-94e3-17c2642ae9aa
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-0443-a2146bdaf583
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-896e-66040d42ed0c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-b134-46c29e069c4e
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-9084-f87468d64e35
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-c4f6-66935bdba157
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-0c3e-1cdd1cf0a925
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-d906-c949520f0ec2
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-50a1-ea50cb6a1b20
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-fe7b-5d101d10b812
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-05a6-5bd121eee55d
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-8209-a611d0116b03
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-db55-c64eea84e89d
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-6d0c-f37006cd06cd
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-397e-c4399afcdcd1
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-57d5-7e57a5a4541f
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-9c1b-6defa54f6ba9
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-78a1-c6c7d0c63171
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-28bf-629afab5c604
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-abba-5d9bd96d7a9a
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-e7e5-32b67ba2072c
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-7316-bcfbdfc57405
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-4ab9-c8c977401380
00020000-5593-cef7-d0f3-a361e7a2ff64	00030000-5593-cef5-734c-d9700b46d553
\.


--
-- TOC entry 2881 (class 0 OID 8729265)
-- Dependencies: 210
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2885 (class 0 OID 8729296)
-- Dependencies: 214
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2897 (class 0 OID 8729428)
-- Dependencies: 226
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaj, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
000b0000-5593-cef7-0471-7751a91d7ee6	00090000-5593-cef7-367e-042d62fd29be	\N	\N	0001	400.00	\N	\N	10.00	30.00	10.00	400.00	t	t	Pogodba o sodelovanju
\.


--
-- TOC entry 2858 (class 0 OID 8729030)
-- Dependencies: 187
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5593-cef7-5bb2-907a272b56ba	00040000-5593-cef5-c66c-d073fc436c72	0988	dobavitelj	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-cef7-41ee-503341dcf338	00040000-5593-cef5-c66c-d073fc436c72	0989	koproducent	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-cef7-7fed-70d1c17e5d33	00040000-5593-cef5-c66c-d073fc436c72	0987	koproducent	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-cef7-8d7f-ae350678c7b2	00040000-5593-cef5-c66c-d073fc436c72	0986	koproducent	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-cef7-cce8-448595b46fa5	00040000-5593-cef5-c66c-d073fc436c72	0985	dobavitelj	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5593-cef7-0aa1-fa60ef3415ab	00040000-5593-cef5-d99e-35fefbaab03a	0900	maticno	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2860 (class 0 OID 8729065)
-- Dependencies: 189
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5593-cef6-50e9-8604c3e27163	8341	Adlešiči
00050000-5593-cef6-c965-843cdaffe2cc	5270	Ajdovščina
00050000-5593-cef6-5754-240a2e8f4660	6280	Ankaran/Ancarano
00050000-5593-cef6-97f6-36110451b54d	9253	Apače
00050000-5593-cef6-eb43-18b79546b878	8253	Artiče
00050000-5593-cef6-7d4e-091fd97056a8	4275	Begunje na Gorenjskem
00050000-5593-cef6-3051-00fd50bc0750	1382	Begunje pri Cerknici
00050000-5593-cef6-e8db-e9fcb4483d5a	9231	Beltinci
00050000-5593-cef6-6cd3-638d35f4f69f	2234	Benedikt
00050000-5593-cef6-ddf8-37becdd15baa	2345	Bistrica ob Dravi
00050000-5593-cef6-2f5c-882e7e12092c	3256	Bistrica ob Sotli
00050000-5593-cef6-c75d-246680573f0d	8259	Bizeljsko
00050000-5593-cef6-e3b2-4cd4163f394b	1223	Blagovica
00050000-5593-cef6-f75a-4a9be67c9387	8283	Blanca
00050000-5593-cef6-d65d-6688e464abab	4260	Bled
00050000-5593-cef6-1c59-421b7f7ed2c1	4273	Blejska Dobrava
00050000-5593-cef6-0886-9e1a3a92578a	9265	Bodonci
00050000-5593-cef6-3b72-fcd9c0f32a00	9222	Bogojina
00050000-5593-cef6-b32f-ae3cdde27055	4263	Bohinjska Bela
00050000-5593-cef6-19ef-2dfe4d754890	4264	Bohinjska Bistrica
00050000-5593-cef6-570f-e65d3df21c89	4265	Bohinjsko jezero
00050000-5593-cef6-478b-67fe4479c5c5	1353	Borovnica
00050000-5593-cef6-f60e-9108c415c12f	8294	Boštanj
00050000-5593-cef6-cfdc-9ab1f9599ac7	5230	Bovec
00050000-5593-cef6-864b-9d4b252dc6a2	5295	Branik
00050000-5593-cef6-2549-a9c08493d463	3314	Braslovče
00050000-5593-cef6-b4d5-9b64ed6ad340	5223	Breginj
00050000-5593-cef6-d09e-49a8bcab77dc	8280	Brestanica
00050000-5593-cef6-8390-95afb761b2ce	2354	Bresternica
00050000-5593-cef6-c459-beb867feeb7f	4243	Brezje
00050000-5593-cef6-5665-3ca83e34e24d	1351	Brezovica pri Ljubljani
00050000-5593-cef6-49a2-b3ae289a41db	8250	Brežice
00050000-5593-cef6-fab1-71ad081cc119	4210	Brnik - Aerodrom
00050000-5593-cef6-60de-162bfbdf35fa	8321	Brusnice
00050000-5593-cef6-0d19-f9c9431ce82e	3255	Buče
00050000-5593-cef6-fd4f-7a338790b5eb	8276	Bučka 
00050000-5593-cef6-96c0-5838ead423da	9261	Cankova
00050000-5593-cef6-a313-db00b13cbe9f	3000	Celje 
00050000-5593-cef6-36de-4857e3be5b5d	3001	Celje - poštni predali
00050000-5593-cef6-4398-3239d11d1c8c	4207	Cerklje na Gorenjskem
00050000-5593-cef6-0e60-f694975a409b	8263	Cerklje ob Krki
00050000-5593-cef6-d626-77279c987fec	1380	Cerknica
00050000-5593-cef6-4c71-58e872059237	5282	Cerkno
00050000-5593-cef6-dc37-e263774f5730	2236	Cerkvenjak
00050000-5593-cef6-85d0-45cbbcc18c0f	2215	Ceršak
00050000-5593-cef6-968a-9a195e595309	2326	Cirkovce
00050000-5593-cef6-d75c-1ed4156b25da	2282	Cirkulane
00050000-5593-cef6-9665-5b79972dfbf2	5273	Col
00050000-5593-cef6-6654-fc63583c159f	8251	Čatež ob Savi
00050000-5593-cef6-04ef-90935f61ad80	1413	Čemšenik
00050000-5593-cef6-7bc3-ee332f3590f9	5253	Čepovan
00050000-5593-cef6-48fb-422ccc951130	9232	Črenšovci
00050000-5593-cef6-4cbf-f4da348c405d	2393	Črna na Koroškem
00050000-5593-cef6-d2e1-97c5fca38bd2	6275	Črni Kal
00050000-5593-cef6-6e7c-ac8e8174b0b2	5274	Črni Vrh nad Idrijo
00050000-5593-cef6-b231-2c56270accbd	5262	Črniče
00050000-5593-cef6-d339-8f3db63379e3	8340	Črnomelj
00050000-5593-cef6-a3ee-64fbd2f543fe	6271	Dekani
00050000-5593-cef6-5942-861e53a2d1c3	5210	Deskle
00050000-5593-cef6-a935-abc55f0d073d	2253	Destrnik
00050000-5593-cef6-4f71-a1f501b25b90	6215	Divača
00050000-5593-cef6-d36a-8a827c12d59f	1233	Dob
00050000-5593-cef6-8d44-6df3f4ab1609	3224	Dobje pri Planini
00050000-5593-cef6-4c91-48e9b3fd195b	8257	Dobova
00050000-5593-cef6-7a00-058221bf2f32	1423	Dobovec
00050000-5593-cef6-219e-c0f74d80d032	5263	Dobravlje
00050000-5593-cef6-436e-9a0aeb7f32b2	3204	Dobrna
00050000-5593-cef6-ae2e-2ca4b2deefff	8211	Dobrnič
00050000-5593-cef6-1c35-b674c73ba2bc	1356	Dobrova
00050000-5593-cef6-1708-1aa129e25895	9223	Dobrovnik/Dobronak 
00050000-5593-cef6-6677-83dc4c8801ac	5212	Dobrovo v Brdih
00050000-5593-cef6-9c1f-6c0fb5de6da6	1431	Dol pri Hrastniku
00050000-5593-cef6-7bf5-c18065fde84a	1262	Dol pri Ljubljani
00050000-5593-cef6-3ef1-df676016802d	1273	Dole pri Litiji
00050000-5593-cef6-d10f-eb87a233583c	1331	Dolenja vas
00050000-5593-cef6-143c-56c0156dfd3a	8350	Dolenjske Toplice
00050000-5593-cef6-4c00-e06cd9254d83	1230	Domžale
00050000-5593-cef6-c341-3d29fad08baa	2252	Dornava
00050000-5593-cef6-f1a4-813963442469	5294	Dornberk
00050000-5593-cef6-d570-e408bde1ebb9	1319	Draga
00050000-5593-cef6-f1a9-c6ee7d4e72f0	8343	Dragatuš
00050000-5593-cef6-906e-ee1380ebe489	3222	Dramlje
00050000-5593-cef6-8da2-a976336d3220	2370	Dravograd
00050000-5593-cef6-4abc-1c0410453f79	4203	Duplje
00050000-5593-cef6-bf90-457e91df4818	6221	Dutovlje
00050000-5593-cef6-0ac4-c875411d13fc	8361	Dvor
00050000-5593-cef6-bc9e-5c5a922ae740	2343	Fala
00050000-5593-cef6-3224-f1e6bad0434f	9208	Fokovci
00050000-5593-cef6-7ec7-a9a01cbc4382	2313	Fram
00050000-5593-cef6-0351-094e66df0869	3213	Frankolovo
00050000-5593-cef6-37f2-91772865419e	1274	Gabrovka
00050000-5593-cef6-f4ae-94c9e45e79ce	8254	Globoko
00050000-5593-cef6-efb4-093804d5f52c	5275	Godovič
00050000-5593-cef6-97c2-c5fec680c27c	4204	Golnik
00050000-5593-cef6-8753-f0748da145c6	3303	Gomilsko
00050000-5593-cef6-f043-35fd516263f5	4224	Gorenja vas
00050000-5593-cef6-558b-31f9c479c481	3263	Gorica pri Slivnici
00050000-5593-cef6-43cf-f144df4679ad	2272	Gorišnica
00050000-5593-cef6-91c8-af504dd9caf8	9250	Gornja Radgona
00050000-5593-cef6-65ee-8000c394d84e	3342	Gornji Grad
00050000-5593-cef6-cf15-dfff6471d49b	4282	Gozd Martuljek
00050000-5593-cef6-439b-edf9ebd0f387	6272	Gračišče
00050000-5593-cef6-e08c-45c7c96754ae	9264	Grad
00050000-5593-cef6-393a-c70d59e0688f	8332	Gradac
00050000-5593-cef6-cf36-c4ec82110537	1384	Grahovo
00050000-5593-cef6-25ab-e951ccb1314e	5242	Grahovo ob Bači
00050000-5593-cef6-7751-d6a13eee7ec5	5251	Grgar
00050000-5593-cef6-b4e4-574634926e02	3302	Griže
00050000-5593-cef6-ca9f-e9792e03bc66	3231	Grobelno
00050000-5593-cef6-124a-c8041e2adb50	1290	Grosuplje
00050000-5593-cef6-08b8-4097b855c85d	2288	Hajdina
00050000-5593-cef6-9165-d435834e9f3e	8362	Hinje
00050000-5593-cef6-9b60-f5aebc12d5a4	2311	Hoče
00050000-5593-cef6-bf6a-4bb249ac89f2	9205	Hodoš/Hodos
00050000-5593-cef6-2084-95ab691fb36b	1354	Horjul
00050000-5593-cef6-4b20-8e11a6fe2f20	1372	Hotedršica
00050000-5593-cef6-b515-cc7579322b28	1430	Hrastnik
00050000-5593-cef6-fa04-6a9a89093a55	6225	Hruševje
00050000-5593-cef6-1115-bfc68d2b0a0f	4276	Hrušica
00050000-5593-cef6-e466-06eb1d044658	5280	Idrija
00050000-5593-cef6-822e-41099316358d	1292	Ig
00050000-5593-cef6-136c-ccc2cfb6d496	6250	Ilirska Bistrica
00050000-5593-cef6-8888-d2c76276061d	6251	Ilirska Bistrica-Trnovo
00050000-5593-cef6-93ea-fd0e5f839807	1295	Ivančna Gorica
00050000-5593-cef6-5c7e-fae2fca43bab	2259	Ivanjkovci
00050000-5593-cef6-cbf3-ea1f28d7872e	1411	Izlake
00050000-5593-cef6-bdde-bef1ebc04fd1	6310	Izola/Isola
00050000-5593-cef6-1d8b-c3e4808e1239	2222	Jakobski Dol
00050000-5593-cef6-ee21-08a3d1b0e1bc	2221	Jarenina
00050000-5593-cef6-473d-bffaa2a4b866	6254	Jelšane
00050000-5593-cef6-7ed1-3c12fd430ef3	4270	Jesenice
00050000-5593-cef6-c306-e5614ebae7e3	8261	Jesenice na Dolenjskem
00050000-5593-cef6-5bac-07b4b49e354d	3273	Jurklošter
00050000-5593-cef6-d89d-eda9fe154974	2223	Jurovski Dol
00050000-5593-cef6-9742-a5200ee18752	2256	Juršinci
00050000-5593-cef6-5163-b060c6fdd2d6	5214	Kal nad Kanalom
00050000-5593-cef6-c0b7-8abcfc5d40d3	3233	Kalobje
00050000-5593-cef6-1060-38cee1d17486	4246	Kamna Gorica
00050000-5593-cef6-35fb-b1a8e8efbe77	2351	Kamnica
00050000-5593-cef6-6099-6df52dde9b87	1241	Kamnik
00050000-5593-cef6-ef3e-3b8c4944de87	5213	Kanal
00050000-5593-cef6-e252-c806f4968703	8258	Kapele
00050000-5593-cef6-35c6-8b00b02750d7	2362	Kapla
00050000-5593-cef6-a976-9762e338296d	2325	Kidričevo
00050000-5593-cef6-d1d1-6ffc7151a460	1412	Kisovec
00050000-5593-cef6-c38c-e0e87e5e926f	6253	Knežak
00050000-5593-cef6-8795-ed1ffd431caf	5222	Kobarid
00050000-5593-cef6-1ce3-3d7bd6d2d94c	9227	Kobilje
00050000-5593-cef6-de15-b9c1e6ccd66e	1330	Kočevje
00050000-5593-cef6-a506-ba9b628fc820	1338	Kočevska Reka
00050000-5593-cef6-e941-81a9ff73f259	2276	Kog
00050000-5593-cef6-11bd-4ba8f6c32f88	5211	Kojsko
00050000-5593-cef6-e856-73ce9b6dc5a3	6223	Komen
00050000-5593-cef6-b77e-4ddcdd43fd22	1218	Komenda
00050000-5593-cef6-7419-fd47c8fe5736	6000	Koper/Capodistria 
00050000-5593-cef6-c0df-da7f2e878a64	6001	Koper/Capodistria - poštni predali
00050000-5593-cef6-6705-2b0a0dd81d99	8282	Koprivnica
00050000-5593-cef6-d7c2-57a7936de488	5296	Kostanjevica na Krasu
00050000-5593-cef6-cfb0-22d163a0124b	8311	Kostanjevica na Krki
00050000-5593-cef6-cfc1-342f08260635	1336	Kostel
00050000-5593-cef6-b36e-1baf071548a4	6256	Košana
00050000-5593-cef6-3e4f-e839c4f903f4	2394	Kotlje
00050000-5593-cef6-7193-27029f4c7902	6240	Kozina
00050000-5593-cef6-a436-29c709748cbf	3260	Kozje
00050000-5593-cef6-42c8-6c52780dcdb5	4000	Kranj 
00050000-5593-cef6-8a42-edca8c98a64b	4001	Kranj - poštni predali
00050000-5593-cef6-aee8-f379f7db1f67	4280	Kranjska Gora
00050000-5593-cef6-a24a-368ce64cb0f8	1281	Kresnice
00050000-5593-cef6-7240-e87f41933fdd	4294	Križe
00050000-5593-cef6-2a05-ccd6aa257608	9206	Križevci
00050000-5593-cef6-dbfc-192cbae4ce79	9242	Križevci pri Ljutomeru
00050000-5593-cef6-eb33-b76b140edf71	1301	Krka
00050000-5593-cef6-0540-f9b58e058fdf	8296	Krmelj
00050000-5593-cef6-e351-7d88e3bf95e2	4245	Kropa
00050000-5593-cef6-6389-19212d175ee4	8262	Krška vas
00050000-5593-cef6-f047-8f50da467b99	8270	Krško
00050000-5593-cef6-06ae-067542deca28	9263	Kuzma
00050000-5593-cef6-9ed9-9e587985e5be	2318	Laporje
00050000-5593-cef6-a781-9840d291539c	3270	Laško
00050000-5593-cef6-dc3a-1e2e7d44240d	1219	Laze v Tuhinju
00050000-5593-cef6-cb90-9b1ff7fa0f42	2230	Lenart v Slovenskih goricah
00050000-5593-cef6-8753-60605e3bc617	9220	Lendava/Lendva
00050000-5593-cef6-254b-629a068d4228	4248	Lesce
00050000-5593-cef6-5067-e15485032fdd	3261	Lesično
00050000-5593-cef6-da64-e265196b4ce0	8273	Leskovec pri Krškem
00050000-5593-cef6-f7b9-13c65feca541	2372	Libeliče
00050000-5593-cef6-e93c-6afec7bff1fe	2341	Limbuš
00050000-5593-cef6-982c-ef9b302da83b	1270	Litija
00050000-5593-cef6-ccb6-c2f63c7eea00	3202	Ljubečna
00050000-5593-cef6-1d95-50579a722b28	1000	Ljubljana 
00050000-5593-cef6-8aab-86e7f755f127	1001	Ljubljana - poštni predali
00050000-5593-cef6-3d0b-12e3c824c3e9	1231	Ljubljana - Črnuče
00050000-5593-cef6-5d61-484ab698853c	1261	Ljubljana - Dobrunje
00050000-5593-cef6-f6a0-480762c7a1e1	1260	Ljubljana - Polje
00050000-5593-cef6-728a-59819e2ad415	1210	Ljubljana - Šentvid
00050000-5593-cef6-02b7-4a1c99544c6a	1211	Ljubljana - Šmartno
00050000-5593-cef6-3bb9-8357b9275dad	3333	Ljubno ob Savinji
00050000-5593-cef6-e9b3-48ec0236eb3a	9240	Ljutomer
00050000-5593-cef6-c641-61e1d6aaac65	3215	Loče
00050000-5593-cef6-0e0e-b66766711396	5231	Log pod Mangartom
00050000-5593-cef6-f0df-9fc11ef71af5	1358	Log pri Brezovici
00050000-5593-cef6-0d58-c2930962f934	1370	Logatec
00050000-5593-cef6-9186-eda8ffe84f58	1371	Logatec
00050000-5593-cef6-7d33-373ea3890b7b	1434	Loka pri Zidanem Mostu
00050000-5593-cef6-1873-8e9d09a8952d	3223	Loka pri Žusmu
00050000-5593-cef6-e1b4-bf1290a21bf1	6219	Lokev
00050000-5593-cef6-f4bb-bcc11bb01072	1318	Loški Potok
00050000-5593-cef6-8a04-a1629fd4df2f	2324	Lovrenc na Dravskem polju
00050000-5593-cef6-40e9-978e75d4b975	2344	Lovrenc na Pohorju
00050000-5593-cef6-d107-1e8a2d07dd93	3334	Luče
00050000-5593-cef6-5b28-e0d78a650a5f	1225	Lukovica
00050000-5593-cef6-8572-c6f6cd3adf67	9202	Mačkovci
00050000-5593-cef6-77ba-d52e74f117fc	2322	Majšperk
00050000-5593-cef6-8dd5-483ff3fdf1f9	2321	Makole
00050000-5593-cef6-8223-bccca767588f	9243	Mala Nedelja
00050000-5593-cef6-5a80-6538d0db18aa	2229	Malečnik
00050000-5593-cef6-5caf-090b877fccd5	6273	Marezige
00050000-5593-cef6-e69b-704c91ffff0f	2000	Maribor 
00050000-5593-cef6-8997-dbf9af291e99	2001	Maribor - poštni predali
00050000-5593-cef6-e12c-6bcc7774a8a9	2206	Marjeta na Dravskem polju
00050000-5593-cef6-ca56-544a0624247c	2281	Markovci
00050000-5593-cef6-0dfc-6f42cea9ab37	9221	Martjanci
00050000-5593-cef6-a200-f894278a8e8f	6242	Materija
00050000-5593-cef6-60a1-33a092fd75d2	4211	Mavčiče
00050000-5593-cef6-f629-740c78643b56	1215	Medvode
00050000-5593-cef6-b3a3-1ed2102e781f	1234	Mengeš
00050000-5593-cef6-2813-fd58bb9f33e2	8330	Metlika
00050000-5593-cef6-a54d-55dd208af888	2392	Mežica
00050000-5593-cef6-8821-e415294f3b7e	2204	Miklavž na Dravskem polju
00050000-5593-cef6-ce3c-470ddcfd09d7	2275	Miklavž pri Ormožu
00050000-5593-cef6-57c8-401bf74c3f13	5291	Miren
00050000-5593-cef6-0fa5-d4e2c44c8688	8233	Mirna
00050000-5593-cef6-cf99-b06ef039f6e5	8216	Mirna Peč
00050000-5593-cef6-505f-5f2c409d8025	2382	Mislinja
00050000-5593-cef6-8cf7-8f7991f8442f	4281	Mojstrana
00050000-5593-cef6-458f-5d50d6172767	8230	Mokronog
00050000-5593-cef6-cae7-f8fd6943f109	1251	Moravče
00050000-5593-cef6-b73b-08f0fd12a93e	9226	Moravske Toplice
00050000-5593-cef6-04e1-15e649c6d0fe	5216	Most na Soči
00050000-5593-cef6-1cac-4706a034583a	1221	Motnik
00050000-5593-cef6-ba1e-3f4f812e915a	3330	Mozirje
00050000-5593-cef6-77c0-8e2ad6f2c9d2	9000	Murska Sobota 
00050000-5593-cef6-c9cc-51423549c5b9	9001	Murska Sobota - poštni predali
00050000-5593-cef6-f008-7b87242cf015	2366	Muta
00050000-5593-cef6-40fc-d7b7d139373e	4202	Naklo
00050000-5593-cef6-145c-78875ccaf175	3331	Nazarje
00050000-5593-cef6-0d1e-e261a7de4bf8	1357	Notranje Gorice
00050000-5593-cef6-2904-73249bfea211	3203	Nova Cerkev
00050000-5593-cef6-b11e-dcaa8a19c5d2	5000	Nova Gorica 
00050000-5593-cef6-9af2-8517d38edb9c	5001	Nova Gorica - poštni predali
00050000-5593-cef6-46b0-e2c40785c656	1385	Nova vas
00050000-5593-cef6-dea7-6498d4cf584e	8000	Novo mesto
00050000-5593-cef6-68a1-1dc87171fec2	8001	Novo mesto - poštni predali
00050000-5593-cef6-97ab-46c32b776d57	6243	Obrov
00050000-5593-cef6-3e66-f94e4b2a0e50	9233	Odranci
00050000-5593-cef6-f573-75c1cc658f46	2317	Oplotnica
00050000-5593-cef6-8b78-916e7ed47f9f	2312	Orehova vas
00050000-5593-cef6-3d82-045da8be38f0	2270	Ormož
00050000-5593-cef6-1935-b39e4ad54348	1316	Ortnek
00050000-5593-cef6-bb6b-c4a68f071741	1337	Osilnica
00050000-5593-cef6-8084-7173f774e48e	8222	Otočec
00050000-5593-cef6-76b4-0e18e305790d	2361	Ožbalt
00050000-5593-cef6-bc23-9662a989ad09	2231	Pernica
00050000-5593-cef6-9fb4-fd6e82b6f00b	2211	Pesnica pri Mariboru
00050000-5593-cef6-e867-6ff59a6c030d	9203	Petrovci
00050000-5593-cef6-abab-bb30c95deb26	3301	Petrovče
00050000-5593-cef6-ff88-5c2537c6fcb6	6330	Piran/Pirano
00050000-5593-cef6-1294-3a8bebcf6858	8255	Pišece
00050000-5593-cef6-7de8-c55b4e8f00bd	6257	Pivka
00050000-5593-cef6-5d8d-35e89cbb0ec0	6232	Planina
00050000-5593-cef6-e762-4f874b578b74	3225	Planina pri Sevnici
00050000-5593-cef6-3a31-58dac6c6dc74	6276	Pobegi
00050000-5593-cef6-f6c5-b36221243d96	8312	Podbočje
00050000-5593-cef6-01d6-68f819f6280a	5243	Podbrdo
00050000-5593-cef6-716c-516d01be0ece	3254	Podčetrtek
00050000-5593-cef6-0ec7-54664b07bc70	2273	Podgorci
00050000-5593-cef6-76ed-bbff6f972e3c	6216	Podgorje
00050000-5593-cef6-f892-858959ae791b	2381	Podgorje pri Slovenj Gradcu
00050000-5593-cef6-b473-0b36e171eed3	6244	Podgrad
00050000-5593-cef6-3336-ca327c22f32d	1414	Podkum
00050000-5593-cef6-16a5-e8581bcf8ed6	2286	Podlehnik
00050000-5593-cef6-47e8-64cc36d53887	5272	Podnanos
00050000-5593-cef6-2762-eb19864cfd7a	4244	Podnart
00050000-5593-cef6-ea6c-2f05c59fde9a	3241	Podplat
00050000-5593-cef6-1954-4b97a39f9ca0	3257	Podsreda
00050000-5593-cef6-2c39-afec6321793a	2363	Podvelka
00050000-5593-cef6-10e8-28115d380980	2208	Pohorje
00050000-5593-cef6-5de9-032750ed793f	2257	Polenšak
00050000-5593-cef6-fe2c-025fa4ed427e	1355	Polhov Gradec
00050000-5593-cef6-826b-a18eb1bf8bfb	4223	Poljane nad Škofjo Loko
00050000-5593-cef6-2f70-a2a547dceb09	2319	Poljčane
00050000-5593-cef6-ad7a-2d8ba1719406	1272	Polšnik
00050000-5593-cef6-1fec-89cced3f8dd0	3313	Polzela
00050000-5593-cef6-36d0-d6caf3b19307	3232	Ponikva
00050000-5593-cef6-feed-d655f8cb9a2f	6320	Portorož/Portorose
00050000-5593-cef6-3e7f-da2887d86ddc	6230	Postojna
00050000-5593-cef6-7126-9cb352a0d4b5	2331	Pragersko
00050000-5593-cef6-10b1-66bee1fcd248	3312	Prebold
00050000-5593-cef6-2425-e902f5837532	4205	Preddvor
00050000-5593-cef6-d15d-d1cb2f140941	6255	Prem
00050000-5593-cef6-21ff-c186f135af8c	1352	Preserje
00050000-5593-cef6-23e0-668c480b87c2	6258	Prestranek
00050000-5593-cef6-b569-4ff70244f2fd	2391	Prevalje
00050000-5593-cef6-2371-7fd5f5436c02	3262	Prevorje
00050000-5593-cef6-2b87-cf464ef05717	1276	Primskovo 
00050000-5593-cef6-3c69-8c46064f7a56	3253	Pristava pri Mestinju
00050000-5593-cef6-3681-da55bf84e683	9207	Prosenjakovci/Partosfalva
00050000-5593-cef6-acb6-04704167432f	5297	Prvačina
00050000-5593-cef6-3094-01d279975028	2250	Ptuj
00050000-5593-cef6-00ad-41d6daa8838d	2323	Ptujska Gora
00050000-5593-cef6-761f-d16956b940ae	9201	Puconci
00050000-5593-cef6-070e-36b6d74f0f9e	2327	Rače
00050000-5593-cef6-4746-b7a6cd4c87aa	1433	Radeče
00050000-5593-cef6-da6b-691657d6afb8	9252	Radenci
00050000-5593-cef6-0c28-6891254756a9	2360	Radlje ob Dravi
00050000-5593-cef6-6476-2bc588279555	1235	Radomlje
00050000-5593-cef6-ff60-5e66bf4fe436	4240	Radovljica
00050000-5593-cef6-73ce-0cfbbfad1100	8274	Raka
00050000-5593-cef6-545d-ac56aad8f537	1381	Rakek
00050000-5593-cef6-6863-c35593e7c4a9	4283	Rateče - Planica
00050000-5593-cef6-84de-7b92da4479e5	2390	Ravne na Koroškem
00050000-5593-cef6-14e6-ddc3f0d7e9bc	9246	Razkrižje
00050000-5593-cef6-9c93-36c5f4800461	3332	Rečica ob Savinji
00050000-5593-cef6-b5f6-8f833e1aaa2c	5292	Renče
00050000-5593-cef6-60b8-62f31a787b88	1310	Ribnica
00050000-5593-cef6-de20-2d4f99a0363e	2364	Ribnica na Pohorju
00050000-5593-cef6-e9da-799a9a176587	3272	Rimske Toplice
00050000-5593-cef6-9403-7aa886c16a86	1314	Rob
00050000-5593-cef6-719b-7531d66ee626	5215	Ročinj
00050000-5593-cef6-90f0-01e9666fb95d	3250	Rogaška Slatina
00050000-5593-cef6-66b6-c6d26b8678e8	9262	Rogašovci
00050000-5593-cef6-107e-cf4374863231	3252	Rogatec
00050000-5593-cef6-e684-6789b4c72786	1373	Rovte
00050000-5593-cef6-3077-35de36dfd3ef	2342	Ruše
00050000-5593-cef6-02ab-5a69f6aafa04	1282	Sava
00050000-5593-cef6-f957-5b5f7ddf3dd2	6333	Sečovlje/Sicciole
00050000-5593-cef6-eaec-c277555153be	4227	Selca
00050000-5593-cef6-c678-1eeaaa2c6548	2352	Selnica ob Dravi
00050000-5593-cef6-11c7-35e55f13dabf	8333	Semič
00050000-5593-cef6-9732-3c4903c11d9e	8281	Senovo
00050000-5593-cef6-f499-02d1a3245b5e	6224	Senožeče
00050000-5593-cef6-d1d4-1f70901cd7ac	8290	Sevnica
00050000-5593-cef6-e0cc-f29dcd3b1943	6210	Sežana
00050000-5593-cef6-e5df-0300ac899006	2214	Sladki Vrh
00050000-5593-cef6-6f58-7d94d387ea1d	5283	Slap ob Idrijci
00050000-5593-cef6-5940-fb0e9608af28	2380	Slovenj Gradec
00050000-5593-cef6-7577-ef2985e017e4	2310	Slovenska Bistrica
00050000-5593-cef6-c1f4-b3f32d579ab8	3210	Slovenske Konjice
00050000-5593-cef6-6c3e-f47165393e1c	1216	Smlednik
00050000-5593-cef6-c761-fa4fd83971ea	5232	Soča
00050000-5593-cef6-9a32-8ff91d4f4eae	1317	Sodražica
00050000-5593-cef6-7c33-436bb1889178	3335	Solčava
00050000-5593-cef6-5175-7967afe2a39f	5250	Solkan
00050000-5593-cef6-8c82-0cae0f91ab06	4229	Sorica
00050000-5593-cef6-607e-85359a9baf33	4225	Sovodenj
00050000-5593-cef6-a2ab-f30f9c0f14c6	5281	Spodnja Idrija
00050000-5593-cef6-fca5-d537bf3ed51e	2241	Spodnji Duplek
00050000-5593-cef6-0682-6feb26b57fa1	9245	Spodnji Ivanjci
00050000-5593-cef6-4c45-102062bd5a40	2277	Središče ob Dravi
00050000-5593-cef6-fdee-28132aaff750	4267	Srednja vas v Bohinju
00050000-5593-cef6-41b9-2628a713d87d	8256	Sromlje 
00050000-5593-cef6-c1a8-9871c28c6b39	5224	Srpenica
00050000-5593-cef6-907e-2254dd35b9e0	1242	Stahovica
00050000-5593-cef6-2065-6eb64e0cce87	1332	Stara Cerkev
00050000-5593-cef6-2e4e-c4501ecb5b2a	8342	Stari trg ob Kolpi
00050000-5593-cef6-3ea0-651eedf552e0	1386	Stari trg pri Ložu
00050000-5593-cef6-e69c-bd98f03c3aa0	2205	Starše
00050000-5593-cef6-21bd-446f31bc08c0	2289	Stoperce
00050000-5593-cef6-a0e2-93dc60675a01	8322	Stopiče
00050000-5593-cef6-271c-9fa20b7df06f	3206	Stranice
00050000-5593-cef6-a26f-902694a41a75	8351	Straža
00050000-5593-cef6-eaf7-c40a442879fe	1313	Struge
00050000-5593-cef6-d3eb-258e167cfdbc	8293	Studenec
00050000-5593-cef6-a6cf-c3e949d59931	8331	Suhor
00050000-5593-cef6-27c4-9f57aba910a6	2233	Sv. Ana v Slovenskih goricah
00050000-5593-cef6-aaeb-9778a54083ee	2235	Sv. Trojica v Slovenskih goricah
00050000-5593-cef6-a54b-ae16d5ff68e8	2353	Sveti Duh na Ostrem Vrhu
00050000-5593-cef6-1a21-e12ab674d0e7	9244	Sveti Jurij ob Ščavnici
00050000-5593-cef6-ba11-bb668ed64c80	3264	Sveti Štefan
00050000-5593-cef6-3436-ddd60a2cce77	2258	Sveti Tomaž
00050000-5593-cef6-e993-d69e39487d0c	9204	Šalovci
00050000-5593-cef6-37ef-140a026839c1	5261	Šempas
00050000-5593-cef6-f7dd-16179a89d114	5290	Šempeter pri Gorici
00050000-5593-cef6-9a26-1ffeb1d7dbe1	3311	Šempeter v Savinjski dolini
00050000-5593-cef6-c9c0-0b6c5e803b73	4208	Šenčur
00050000-5593-cef6-a07e-ebd4b4a55d2d	2212	Šentilj v Slovenskih goricah
00050000-5593-cef6-12ba-4f9eef456a73	8297	Šentjanž
00050000-5593-cef6-1c71-38730d324c08	2373	Šentjanž pri Dravogradu
00050000-5593-cef6-73dd-83b5e8e84410	8310	Šentjernej
00050000-5593-cef6-af1a-b64687bbf141	3230	Šentjur
00050000-5593-cef6-7ec0-7531dadb227c	3271	Šentrupert
00050000-5593-cef6-5a3f-dea00a7e7df2	8232	Šentrupert
00050000-5593-cef6-cd54-91d71ccfea00	1296	Šentvid pri Stični
00050000-5593-cef6-1110-87359e3ee2f2	8275	Škocjan
00050000-5593-cef6-edfa-909efb19c0e3	6281	Škofije
00050000-5593-cef6-fea5-51c3375ccbfb	4220	Škofja Loka
00050000-5593-cef6-a02a-30ad9552cac9	3211	Škofja vas
00050000-5593-cef6-d211-c7ebcb0ebb3a	1291	Škofljica
00050000-5593-cef6-b59f-19d2bd49f22f	6274	Šmarje
00050000-5593-cef6-a738-0efc3fa6e594	1293	Šmarje - Sap
00050000-5593-cef6-b12c-177bf73f1cf4	3240	Šmarje pri Jelšah
00050000-5593-cef6-1801-0023cff9de69	8220	Šmarješke Toplice
00050000-5593-cef6-24b2-963c6caa5b75	2315	Šmartno na Pohorju
00050000-5593-cef6-9fd0-ce47de256081	3341	Šmartno ob Dreti
00050000-5593-cef6-f94f-2bfa024f1949	3327	Šmartno ob Paki
00050000-5593-cef6-cb8b-b527e13638b4	1275	Šmartno pri Litiji
00050000-5593-cef6-8c3b-832f93e4f592	2383	Šmartno pri Slovenj Gradcu
00050000-5593-cef6-79e5-8b65b6dc5067	3201	Šmartno v Rožni dolini
00050000-5593-cef6-1157-79e705c8c348	3325	Šoštanj
00050000-5593-cef6-cf8a-021a49561d46	6222	Štanjel
00050000-5593-cef6-28f7-771348bbce2f	3220	Štore
00050000-5593-cef6-43d3-9141d5ee1297	3304	Tabor
00050000-5593-cef6-93fe-19a7bea7ebc5	3221	Teharje
00050000-5593-cef6-394c-79d6944b31ee	9251	Tišina
00050000-5593-cef6-0252-61fad9a83892	5220	Tolmin
00050000-5593-cef6-7b65-4ba8322b154c	3326	Topolšica
00050000-5593-cef6-c0ea-586b90c95fec	2371	Trbonje
00050000-5593-cef6-b8f3-5fffd4800eaa	1420	Trbovlje
00050000-5593-cef6-aa4a-16857fd0ce4d	8231	Trebelno 
00050000-5593-cef6-94db-12f080c05ac5	8210	Trebnje
00050000-5593-cef6-24ca-59c16028bda3	5252	Trnovo pri Gorici
00050000-5593-cef6-acfd-cf7b1dc68bc2	2254	Trnovska vas
00050000-5593-cef6-8d8a-e6cd536570bd	1222	Trojane
00050000-5593-cef6-b4db-01e9a07e7e8f	1236	Trzin
00050000-5593-cef6-c569-397d86b1463a	4290	Tržič
00050000-5593-cef6-8a5c-d83edc26d60f	8295	Tržišče
00050000-5593-cef6-9e3b-fde32fc917ed	1311	Turjak
00050000-5593-cef6-5006-d0b008d7104d	9224	Turnišče
00050000-5593-cef6-c356-765ab2a2d384	8323	Uršna sela
00050000-5593-cef6-bca3-2bb29d462b13	1252	Vače
00050000-5593-cef6-5737-19eeb632c1e8	3320	Velenje 
00050000-5593-cef6-0191-38b87a4f91ce	3322	Velenje - poštni predali
00050000-5593-cef6-c2c7-ac7ffb00bc6f	8212	Velika Loka
00050000-5593-cef6-7b7a-3f92421f8dfa	2274	Velika Nedelja
00050000-5593-cef6-5120-6654f14ef528	9225	Velika Polana
00050000-5593-cef6-6d8f-9061fbb9d53c	1315	Velike Lašče
00050000-5593-cef6-b866-d0d5aaeddf3d	8213	Veliki Gaber
00050000-5593-cef6-7099-7e2373c2addf	9241	Veržej
00050000-5593-cef6-a947-f610023c9880	1312	Videm - Dobrepolje
00050000-5593-cef6-b69f-547127b74bde	2284	Videm pri Ptuju
00050000-5593-cef6-4dbd-5395d083d7c3	8344	Vinica
00050000-5593-cef6-da2f-2fd0bd936b77	5271	Vipava
00050000-5593-cef6-4809-9872ca04da25	4212	Visoko
00050000-5593-cef6-4406-5118bd459a88	1294	Višnja Gora
00050000-5593-cef6-dff0-59f55a8592c1	3205	Vitanje
00050000-5593-cef6-1a4e-a0d478de496d	2255	Vitomarci
00050000-5593-cef6-e7e6-1e90a792d7af	1217	Vodice
00050000-5593-cef6-7c04-5cda144e28c4	3212	Vojnik\t
00050000-5593-cef6-4ee2-043f2a930538	5293	Volčja Draga
00050000-5593-cef6-4f40-d6553705e4ef	2232	Voličina
00050000-5593-cef6-b584-a9df164cb36b	3305	Vransko
00050000-5593-cef6-974c-3a163d093ea7	6217	Vremski Britof
00050000-5593-cef6-cc9f-2f999f7279cd	1360	Vrhnika
00050000-5593-cef6-76f3-ad584fd0017f	2365	Vuhred
00050000-5593-cef6-b130-738cf6a66164	2367	Vuzenica
00050000-5593-cef6-33c5-85b2ecdf685e	8292	Zabukovje 
00050000-5593-cef6-bf42-a0c8a6bf8be0	1410	Zagorje ob Savi
00050000-5593-cef6-e14d-3a5adf932a41	1303	Zagradec
00050000-5593-cef6-751e-b0e114b6ebf1	2283	Zavrč
00050000-5593-cef6-2f5d-b0b62be2c72a	8272	Zdole 
00050000-5593-cef6-1de2-8fb398d09c91	4201	Zgornja Besnica
00050000-5593-cef6-41b1-314e79c1b699	2242	Zgornja Korena
00050000-5593-cef6-66a1-bba224cc571a	2201	Zgornja Kungota
00050000-5593-cef6-2e46-c9ccf29b713f	2316	Zgornja Ložnica
00050000-5593-cef6-f3f2-25bfce014ef1	2314	Zgornja Polskava
00050000-5593-cef6-8323-42aaeef7b587	2213	Zgornja Velka
00050000-5593-cef6-a1d6-cdca6f8c3194	4247	Zgornje Gorje
00050000-5593-cef6-413b-96ddd6c84f97	4206	Zgornje Jezersko
00050000-5593-cef6-4401-13e6e765b93c	2285	Zgornji Leskovec
00050000-5593-cef6-a575-dca4757904ed	1432	Zidani Most
00050000-5593-cef6-66b2-4176eef14f52	3214	Zreče
00050000-5593-cef6-fa8a-8f427cbe5cd8	4209	Žabnica
00050000-5593-cef6-fd06-81f02dfafc48	3310	Žalec
00050000-5593-cef6-477c-87f468f49635	4228	Železniki
00050000-5593-cef6-f116-a550033eb25f	2287	Žetale
00050000-5593-cef6-73e6-fa95a23f5540	4226	Žiri
00050000-5593-cef6-2d07-17fada7d2097	4274	Žirovnica
00050000-5593-cef6-bf6c-d408cdb3e9f9	8360	Žužemberk
\.


--
-- TOC entry 2877 (class 0 OID 8729239)
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
-- TOC entry 2859 (class 0 OID 8729050)
-- Dependencies: 188
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 8729128)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 8729251)
-- Dependencies: 208
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2892 (class 0 OID 8729371)
-- Dependencies: 221
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, zaprosenprocent, zaproseno, maticnikop, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2896 (class 0 OID 8729420)
-- Dependencies: 225
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5593-cef7-a483-c702865b1778	00080000-5593-cef7-0aa1-fa60ef3415ab	0900	AK
00190000-5593-cef7-3229-f51395c80971	00080000-5593-cef7-7fed-70d1c17e5d33	0987	A
00190000-5593-cef7-7b3f-9765a484fc09	00080000-5593-cef7-41ee-503341dcf338	0989	A
\.


--
-- TOC entry 2903 (class 0 OID 8729554)
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
-- TOC entry 2883 (class 0 OID 8729280)
-- Dependencies: 212
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5593-cef7-416c-4ee8195cba4a	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5593-cef7-05a6-dbd916c39f3a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5593-cef7-a063-1d11598ce094	0003	Kazinska	t	84	Kazinska dvorana
00220000-5593-cef7-c3be-f9e7c595f748	0004	Mali oder	t	24	Mali oder 
00220000-5593-cef7-3442-41d35ed2252d	0005	Komorni oder	t	15	Komorni oder
00220000-5593-cef7-5e95-c64d304232cf	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5593-cef7-4b03-96d8a2bd8fbe	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2875 (class 0 OID 8729224)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2874 (class 0 OID 8729214)
-- Dependencies: 203
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2895 (class 0 OID 8729409)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2890 (class 0 OID 8729348)
-- Dependencies: 219
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 8728922)
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
-- TOC entry 2884 (class 0 OID 8729290)
-- Dependencies: 213
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 8728960)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5593-cef5-9e2a-b86821fe84c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5593-cef5-1f36-ffb2a899ca2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5593-cef5-6d29-ebdd704cef0f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5593-cef5-f0d7-bfc52b5954e4	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5593-cef5-7128-70d95a0151c8	planer	Planer dogodkov v koledarju	t
00020000-5593-cef5-90cc-23f60aefc845	kadrovska	Kadrovska služba	t
00020000-5593-cef5-e851-9a810d3398c1	arhivar	Ažuriranje arhivalij	t
00020000-5593-cef5-cfad-76f4956810ae	igralec	Igralec	t
00020000-5593-cef5-ab56-331f1babdd12	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5593-cef7-d0f3-a361e7a2ff64	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2850 (class 0 OID 8728944)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5593-cef6-9288-1f1c6724e194	00020000-5593-cef5-6d29-ebdd704cef0f
00010000-5593-cef6-4fba-cb57f0c09650	00020000-5593-cef5-6d29-ebdd704cef0f
00010000-5593-cef7-194f-5c60a22703c5	00020000-5593-cef7-d0f3-a361e7a2ff64
\.


--
-- TOC entry 2886 (class 0 OID 8729304)
-- Dependencies: 215
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2878 (class 0 OID 8729245)
-- Dependencies: 207
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2872 (class 0 OID 8729195)
-- Dependencies: 201
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2908 (class 0 OID 8729604)
-- Dependencies: 237
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5593-cef6-fa9d-3d4beddd5fde	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5593-cef6-3639-2e483a94b45b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5593-cef6-b7d1-0ad019110d3b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5593-cef6-7b3b-c7ad2b5fee82	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5593-cef6-e6b3-c948aa1a5a53	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2907 (class 0 OID 8729596)
-- Dependencies: 236
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5593-cef6-7481-38f5106ed0be	00230000-5593-cef6-7b3b-c7ad2b5fee82	popa
00240000-5593-cef6-606e-102b9072ea6f	00230000-5593-cef6-7b3b-c7ad2b5fee82	oseba
00240000-5593-cef6-2630-704aa0f58e75	00230000-5593-cef6-3639-2e483a94b45b	prostor
00240000-5593-cef6-b002-a5a24b4232ee	00230000-5593-cef6-7b3b-c7ad2b5fee82	besedilo
00240000-5593-cef6-a02d-1863d24388db	00230000-5593-cef6-7b3b-c7ad2b5fee82	uprizoritev
00240000-5593-cef6-6904-a8ddaea5bbed	00230000-5593-cef6-7b3b-c7ad2b5fee82	funkcija
00240000-5593-cef6-937f-fbea4b65ba9a	00230000-5593-cef6-7b3b-c7ad2b5fee82	tipfunkcije
00240000-5593-cef6-c80f-d77643dc11c9	00230000-5593-cef6-7b3b-c7ad2b5fee82	alternacija
00240000-5593-cef6-c8b9-dbc9d9d51fa2	00230000-5593-cef6-fa9d-3d4beddd5fde	pogodba
00240000-5593-cef6-4774-cae53193ab4f	00230000-5593-cef6-7b3b-c7ad2b5fee82	zaposlitev
\.


--
-- TOC entry 2906 (class 0 OID 8729591)
-- Dependencies: 235
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2891 (class 0 OID 8729358)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort) FROM stdin;
00270000-5593-cef7-e3aa-18e612f72f48	000e0000-5593-cef7-d26a-aa1158de7e68	00080000-5593-cef7-5bb2-907a272b56ba	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1
00270000-5593-cef7-6b51-67198685ee32	000e0000-5593-cef7-d26a-aa1158de7e68	00080000-5593-cef7-5bb2-907a272b56ba	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2
00270000-5593-cef7-e2e1-45c922da99f5	000e0000-5593-cef7-d26a-aa1158de7e68	00080000-5593-cef7-cce8-448595b46fa5	Tantiema	200.00	10.00	Tantiema za besedilo	tantiema	3
\.


--
-- TOC entry 2857 (class 0 OID 8729022)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2873 (class 0 OID 8729201)
-- Dependencies: 202
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5593-cef7-439f-c1f2396dda47	00180000-5593-cef7-51f1-9275d55e74be	000c0000-5593-cef7-d286-53e728af741c	00090000-5593-cef7-4da3-70f793a74dec	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-cef7-9956-84f78e725028	00180000-5593-cef7-51f1-9275d55e74be	000c0000-5593-cef7-a582-4b1a879d5a49	00090000-5593-cef7-231b-44535f46450b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-cef7-c2f8-529488e9258c	00180000-5593-cef7-51f1-9275d55e74be	000c0000-5593-cef7-581c-ec97a867e8db	00090000-5593-cef7-eb12-5119afb573e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-cef7-f478-f03f723ea677	00180000-5593-cef7-51f1-9275d55e74be	000c0000-5593-cef7-fae6-f4ecd757dba0	00090000-5593-cef7-fa04-3c1964836a18	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-cef7-6943-12a4c882a7dc	00180000-5593-cef7-51f1-9275d55e74be	000c0000-5593-cef7-5c34-c6cb71f93597	00090000-5593-cef7-d532-194bb5eec3df	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5593-cef7-3725-f2136f670172	00180000-5593-cef7-6bc4-65bdfcb8365f	\N	00090000-5593-cef7-d532-194bb5eec3df	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2894 (class 0 OID 8729398)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5593-cef6-b173-cec4db223aab	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5593-cef6-6987-d666cc6e3066	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5593-cef6-4fb7-caee6bfd75ae	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5593-cef6-dbf3-7ed47ca89ae6	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5593-cef6-4629-889e9c4df836	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5593-cef6-c2f8-93288da17943	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5593-cef6-5c69-33d5e90b6dee	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5593-cef6-cc4a-13f48ac4f7bb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5593-cef6-22f1-539bffecc7ba	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5593-cef6-f85e-01bf4f46c9a7	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5593-cef6-7e05-c9917e965687	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5593-cef6-4651-171992cc2a4c	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5593-cef6-2bae-b122011c3c88	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5593-cef6-7506-8cb2eafec122	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5593-cef6-98a9-9d5f5b0af7c8	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5593-cef6-0ae2-0bb7db93bfd4	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2904 (class 0 OID 8729573)
-- Dependencies: 233
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5593-cef6-b170-d34ff1d63360	01	Velika predstava	f	1.00	1.00
002b0000-5593-cef6-c1d4-e597820e6a8b	02	Mala predstava	f	0.50	0.50
002b0000-5593-cef6-0a74-d9749b41d380	03	Mala koprodukcija	t	0.40	1.00
002b0000-5593-cef6-a279-95bdf4c2f1c2	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5593-cef6-7e6c-a104314bb6e3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2862 (class 0 OID 8729085)
-- Dependencies: 191
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 8728931)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5593-cef6-4fba-cb57f0c09650	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO.ffEqQp7x3xe.uOMBbv3zknnBJoyTwW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5593-cef7-54fe-5fdb083079a8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5593-cef7-7641-fdb16c7124eb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5593-cef7-35d4-6748f0f0a927	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5593-cef7-d7fa-390f5c50a91a	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5593-cef7-c3f3-401c5cdba802	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5593-cef7-36d1-7aa58311cd73	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5593-cef7-4a1c-ba8107d2e74b	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxRO65fWZeAHsQaSLdIfLBHOsYne6v3cc/S	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5593-cef7-0e93-5540822d3e55	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROY.gurbM/rQabonoTE5e4d2iLn5n02Ze	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5593-cef7-45d1-9a343297a855	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRO7JhCAbp8MYhXT26FeokdY8Gxw/JfjEO	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5593-cef7-194f-5c60a22703c5	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO6W7zbQavi3xwMGnS2Gws/6iDdb.q/zm	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5593-cef6-9288-1f1c6724e194	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2899 (class 0 OID 8729455)
-- Dependencies: 228
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5593-cef7-9367-bb180d436637	00160000-5593-cef7-c660-89f858d37fe1	00150000-5593-cef6-35e7-9e7ad9e63ff9	00140000-5593-cef5-5053-47fbe957840a	\N	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5593-cef7-3442-41d35ed2252d
000e0000-5593-cef7-d26a-aa1158de7e68	00160000-5593-cef7-c589-e6d7e26c3024	00150000-5593-cef6-7dc7-40bb3bc1a642	00140000-5593-cef5-3e7b-7e280fc4d6bf	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5593-cef7-5e95-c64d304232cf
000e0000-5593-cef7-1eb0-b6a62c5b71fd	\N	00150000-5593-cef6-7dc7-40bb3bc1a642	00140000-5593-cef5-3e7b-7e280fc4d6bf	00190000-5593-cef7-3229-f51395c80971	0003	postprodukcija	Kisli maček			\N	2017-02-01	\N	\N	2016-04-20	2	Caryl Churchill	t	2				\N	f		00220000-5593-cef7-3442-41d35ed2252d
000e0000-5593-cef7-85f1-4dae8742ff35	\N	00150000-5593-cef6-7dc7-40bb3bc1a642	00140000-5593-cef5-3e7b-7e280fc4d6bf	00190000-5593-cef7-3229-f51395c80971	0004	postprodukcija	Vladimir			\N	2017-03-01	\N	\N	2016-04-20	2	Matjaž Zupančič	t	2				\N	f		00220000-5593-cef7-3442-41d35ed2252d
000e0000-5593-cef7-ea07-6020a358297e	\N	00150000-5593-cef6-7dc7-40bb3bc1a642	00140000-5593-cef5-3e7b-7e280fc4d6bf	00190000-5593-cef7-3229-f51395c80971	0005	postprodukcija	Španska princesa			\N	2017-04-01	\N	\N	2016-05-20	1	Nina Kokelj	f	1				\N	f		00220000-5593-cef7-416c-4ee8195cba4a
\.


--
-- TOC entry 2867 (class 0 OID 8729147)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5593-cef7-50ca-0fdf05fa3f77	000e0000-5593-cef7-d26a-aa1158de7e68	1	
00200000-5593-cef7-66ac-f79a7b8d6d86	000e0000-5593-cef7-d26a-aa1158de7e68	2	
\.


--
-- TOC entry 2882 (class 0 OID 8729272)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2889 (class 0 OID 8729341)
-- Dependencies: 218
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2869 (class 0 OID 8729179)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2898 (class 0 OID 8729445)
-- Dependencies: 227
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5593-cef5-5053-47fbe957840a	01	Drama	drama (SURS 01)
00140000-5593-cef5-4a21-6f730ed33d13	02	Opera	opera (SURS 02)
00140000-5593-cef5-a3c1-e63f4acecdf0	03	Balet	balet (SURS 03)
00140000-5593-cef5-e73e-888ae37934dc	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5593-cef5-bf2c-56afe90a7acd	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5593-cef5-3e7b-7e280fc4d6bf	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5593-cef5-ddc6-cfda9548d7f8	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2888 (class 0 OID 8729331)
-- Dependencies: 217
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5593-cef6-cb36-a9ffef335e0e	01	Opera	opera
00150000-5593-cef6-e9c8-3b88ba485f05	02	Opereta	opereta
00150000-5593-cef6-d907-4bd1d9a7fa97	03	Balet	balet
00150000-5593-cef6-4e43-6a1a6bf75ce4	04	Plesne prireditve	plesne prireditve
00150000-5593-cef6-9040-75b83fc23949	05	Lutkovno gledališče	lutkovno gledališče
00150000-5593-cef6-e845-618581696879	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5593-cef6-cde2-f2e0d097557c	07	Biografska drama	biografska drama
00150000-5593-cef6-35e7-9e7ad9e63ff9	08	Komedija	komedija
00150000-5593-cef6-634a-3e9e9111c039	09	Črna komedija	črna komedija
00150000-5593-cef6-be3c-aca3fd29d4f4	10	E-igra	E-igra
00150000-5593-cef6-7dc7-40bb3bc1a642	11	Kriminalka	kriminalka
00150000-5593-cef6-0192-ec3fc863d1c9	12	Musical	musical
\.


--
-- TOC entry 2441 (class 2606 OID 8728985)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 8729502)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 8729492)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 8729397)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 8729169)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 8729194)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 8729589)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 8729111)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 8729549)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 8729327)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 8729145)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 8729188)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 8729125)
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
-- TOC entry 2533 (class 2606 OID 8729237)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 8729264)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 8729083)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 8728994)
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
-- TOC entry 2448 (class 2606 OID 8729018)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 8728974)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2432 (class 2606 OID 8728959)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 8729270)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 8729303)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 8729440)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 8729047)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 8729071)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 8729243)
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
-- TOC entry 2463 (class 2606 OID 8729061)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 8729132)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 8729255)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 8729379)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 8729425)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 8729571)
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
-- TOC entry 2553 (class 2606 OID 8729287)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 8729228)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 8729219)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 8729419)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 8729355)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 8728930)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 8729294)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 8728948)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2434 (class 2606 OID 8728968)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 8729312)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 8729250)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 8729200)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 8729613)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 8729601)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 8729595)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 8729368)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 8729027)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 8729210)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 8729408)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 8729583)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 8729096)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 8728943)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 8729471)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 8729154)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 8729278)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 8729346)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 8729183)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 8729453)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 8729339)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 1259 OID 8729176)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2581 (class 1259 OID 8729369)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2582 (class 1259 OID 8729370)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2455 (class 1259 OID 8729049)
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
-- TOC entry 2546 (class 1259 OID 8729271)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2540 (class 1259 OID 8729257)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2541 (class 1259 OID 8729256)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 8729155)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2568 (class 1259 OID 8729328)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2569 (class 1259 OID 8729330)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2570 (class 1259 OID 8729329)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2480 (class 1259 OID 8729127)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2481 (class 1259 OID 8729126)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 8729442)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2600 (class 1259 OID 8729443)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2601 (class 1259 OID 8729444)
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
-- TOC entry 2608 (class 1259 OID 8729476)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2609 (class 1259 OID 8729473)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2610 (class 1259 OID 8729477)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2611 (class 1259 OID 8729475)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2612 (class 1259 OID 8729474)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2470 (class 1259 OID 8729098)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 8729097)
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
-- TOC entry 2446 (class 1259 OID 8729021)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2556 (class 1259 OID 8729295)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2510 (class 1259 OID 8729189)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 8728975)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2437 (class 1259 OID 8728976)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2561 (class 1259 OID 8729315)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2562 (class 1259 OID 8729314)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2563 (class 1259 OID 8729313)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2484 (class 1259 OID 8729133)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2485 (class 1259 OID 8729135)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2486 (class 1259 OID 8729134)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 8729603)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2520 (class 1259 OID 8729223)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2521 (class 1259 OID 8729221)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2522 (class 1259 OID 8729220)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2523 (class 1259 OID 8729222)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2427 (class 1259 OID 8728949)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2428 (class 1259 OID 8728950)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2549 (class 1259 OID 8729279)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2535 (class 1259 OID 8729244)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2577 (class 1259 OID 8729356)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2578 (class 1259 OID 8729357)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2629 (class 1259 OID 8729553)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2630 (class 1259 OID 8729550)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2631 (class 1259 OID 8729551)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2632 (class 1259 OID 8729552)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2459 (class 1259 OID 8729063)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2460 (class 1259 OID 8729062)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2461 (class 1259 OID 8729064)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2420 (class 1259 OID 7936469)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2585 (class 1259 OID 8729380)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2586 (class 1259 OID 8729381)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2622 (class 1259 OID 8729506)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2623 (class 1259 OID 8729507)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2624 (class 1259 OID 8729504)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2625 (class 1259 OID 8729505)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2574 (class 1259 OID 8729347)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2526 (class 1259 OID 8729232)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2527 (class 1259 OID 8729231)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2528 (class 1259 OID 8729229)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2529 (class 1259 OID 8729230)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2398 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2618 (class 1259 OID 8729494)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2619 (class 1259 OID 8729493)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2633 (class 1259 OID 8729572)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2491 (class 1259 OID 8729146)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2640 (class 1259 OID 8729590)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2442 (class 1259 OID 8728996)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2443 (class 1259 OID 8728995)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2451 (class 1259 OID 8729028)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2452 (class 1259 OID 8729029)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2515 (class 1259 OID 8729213)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 8729212)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2517 (class 1259 OID 8729211)
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
-- TOC entry 2498 (class 1259 OID 8729178)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2499 (class 1259 OID 8729174)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2500 (class 1259 OID 8729171)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2501 (class 1259 OID 8729172)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2502 (class 1259 OID 8729170)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2503 (class 1259 OID 8729175)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2504 (class 1259 OID 8729173)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2458 (class 1259 OID 8729048)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 8729112)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2477 (class 1259 OID 8729114)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2478 (class 1259 OID 8729113)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2479 (class 1259 OID 8729115)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2534 (class 1259 OID 8729238)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 8729441)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 8729472)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2449 (class 1259 OID 8729019)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2450 (class 1259 OID 8729020)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2571 (class 1259 OID 8729340)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2649 (class 1259 OID 8729614)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 8729084)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 8729602)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2554 (class 1259 OID 8729289)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2555 (class 1259 OID 8729288)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 8729503)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2401 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2466 (class 1259 OID 8729072)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 8729454)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 8729426)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 8729427)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 8728969)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2505 (class 1259 OID 8729177)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2677 (class 2606 OID 8729750)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2674 (class 2606 OID 8729735)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2675 (class 2606 OID 8729740)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2679 (class 2606 OID 8729760)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2673 (class 2606 OID 8729730)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2678 (class 2606 OID 8729755)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2676 (class 2606 OID 8729745)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2708 (class 2606 OID 8729905)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2709 (class 2606 OID 8729910)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2660 (class 2606 OID 8729665)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2696 (class 2606 OID 8729845)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2695 (class 2606 OID 8729840)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2694 (class 2606 OID 8729835)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2672 (class 2606 OID 8729725)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2702 (class 2606 OID 8729875)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2704 (class 2606 OID 8729885)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2703 (class 2606 OID 8729880)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2667 (class 2606 OID 8729700)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2666 (class 2606 OID 8729695)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2692 (class 2606 OID 8729825)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2713 (class 2606 OID 8729930)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2714 (class 2606 OID 8729935)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2715 (class 2606 OID 8729940)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2719 (class 2606 OID 8729960)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2716 (class 2606 OID 8729945)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2720 (class 2606 OID 8729965)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2718 (class 2606 OID 8729955)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2717 (class 2606 OID 8729950)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2665 (class 2606 OID 8729690)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2664 (class 2606 OID 8729685)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2657 (class 2606 OID 8729650)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2656 (class 2606 OID 8729645)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2698 (class 2606 OID 8729855)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2680 (class 2606 OID 8729765)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2652 (class 2606 OID 8729625)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2653 (class 2606 OID 8729630)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2701 (class 2606 OID 8729870)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2700 (class 2606 OID 8729865)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2699 (class 2606 OID 8729860)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2668 (class 2606 OID 8729705)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2670 (class 2606 OID 8729715)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2669 (class 2606 OID 8729710)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2733 (class 2606 OID 8730030)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2687 (class 2606 OID 8729800)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2685 (class 2606 OID 8729790)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2684 (class 2606 OID 8729785)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2686 (class 2606 OID 8729795)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2650 (class 2606 OID 8729615)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2651 (class 2606 OID 8729620)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2697 (class 2606 OID 8729850)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2693 (class 2606 OID 8729830)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2706 (class 2606 OID 8729895)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2707 (class 2606 OID 8729900)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2730 (class 2606 OID 8730015)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2727 (class 2606 OID 8730000)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2728 (class 2606 OID 8730005)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2729 (class 2606 OID 8730010)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 8729675)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2661 (class 2606 OID 8729670)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2663 (class 2606 OID 8729680)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2710 (class 2606 OID 8729915)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2711 (class 2606 OID 8729920)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2725 (class 2606 OID 8729990)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2726 (class 2606 OID 8729995)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2723 (class 2606 OID 8729980)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2724 (class 2606 OID 8729985)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2705 (class 2606 OID 8729890)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2691 (class 2606 OID 8729820)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2690 (class 2606 OID 8729815)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2688 (class 2606 OID 8729805)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2689 (class 2606 OID 8729810)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2722 (class 2606 OID 8729975)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2721 (class 2606 OID 8729970)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2731 (class 2606 OID 8730020)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2671 (class 2606 OID 8729720)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2712 (class 2606 OID 8729925)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2732 (class 2606 OID 8730025)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2655 (class 2606 OID 8729640)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2654 (class 2606 OID 8729635)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2658 (class 2606 OID 8729655)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2659 (class 2606 OID 8729660)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2683 (class 2606 OID 8729780)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2682 (class 2606 OID 8729775)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2681 (class 2606 OID 8729770)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-07-01 13:28:56 CEST

--
-- PostgreSQL database dump complete
--

